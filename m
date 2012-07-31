Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw0A7-0004FQ-5m
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 02:18:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 17:06:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175049410"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 17:06:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 01:06:26 +0100
Message-Id: <8063ea366deedabeca08a48c544c4fae39bee061.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] combo-layer: allow splitting out local config
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jul 2012 00:18:11 -0000

Allow splitting the local parts of the configuration (mostly
local_repo_dir and last_revision, although there is no limitation) to
a side-by-side -local.conf file, with component sections optionally
tagged with the combo layer branch name. This effectively allows you to:

 * avoid polluting the history by committing the updated last revision
   to the combo repository for every update
 * avoid putting local repo paths into the combo repository
 * manage multiple branches of the combo repository whilst avoiding the
   possibility of mixing the configuration for one branch with another.

An example split configuration (note, values may be artificial):

------------------- combo-layer.conf -------------------
[bitbake]
src_uri = git://git.openembedded.org/bitbake
dest_dir = bitbake
hook = scripts/combo-layer-hook-default.sh

[oe-core]
src_uri = git://git.openembedded.org/openembedded-core
dest_dir = .
hook = scripts/combo-layer-hook-default.sh
--------------------------------------------------------

---------------- combo-layer-local.conf ----------------
[bitbake]
local_repo_dir = ../repos/bitbake

[oe-core]
local_repo_dir = ../repos/oe-core

[bitbake|master]
branch = master
last_revision = db689a99beffea1a285cdfc74a58fe73f1666987

[oe-core|master]
branch = master
last_revision = 121a1499a81706366acc0081272a6bff634d4d62

[bitbake|denzil]
branch = 1.12
last_revision = 24b631acdaa143a4de39c6e1328849660c66f219

[oe-core|denzil]
branch = denzil
last_revision = 741146fa90f28f7ce8d82ee7f7e254872d519724
--------------------------------------------------------

It is assumed that the local config file will be added to .gitignore.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   73 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 65 insertions(+), 8 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 95653b0..516fffb 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -39,6 +39,15 @@ def logger_create():
 
 logger = logger_create()
 
+def get_current_branch(repodir=None):
+    try:
+        branchname = runcmd("git symbolic-ref HEAD 2>/dev/null", repodir).strip()
+        if branchname.startswith("refs/heads/"):
+            branchname = branchname[11:]
+        return branchname
+    except subprocess.CalledProcessError:
+        return ""
+
 class Configuration(object):
     """
     Manages the configuration
@@ -49,30 +58,78 @@ class Configuration(object):
     def __init__(self, options):
         for key, val in options.__dict__.items():
             setattr(self, key, val)
-        self.parser = ConfigParser.ConfigParser()
-        self.parser.readfp(open(self.conffile))
-        self.repos = {}
-        for repo in self.parser.sections():
-            self.repos[repo] = {}
-            for (name, value) in self.parser.items(repo):
+
+        def readsection(parser, section, repo):
+            for (name, value) in parser.items(section):
                 if value.startswith("@"):
                     self.repos[repo][name] = eval(value.strip("@"))
                 else:
                     self.repos[repo][name] = value
 
+        logger.debug("Loading config file %s" % self.conffile)
+        self.parser = ConfigParser.ConfigParser()
+        with open(self.conffile) as f:
+            self.parser.readfp(f)
+
+        self.repos = {}
+        for repo in self.parser.sections():
+            self.repos[repo] = {}
+            readsection(self.parser, repo, repo)
+
+        # Load local configuration, if available
+        self.localconffile = None
+        self.localparser = None
+        self.combobranch = None
+        if self.conffile.endswith('.conf'):
+            lcfile = self.conffile.replace('.conf', '-local.conf')
+            if os.path.exists(lcfile):
+                # Read combo layer branch
+                self.combobranch = get_current_branch()
+                logger.debug("Combo layer branch is %s" % self.combobranch)
+
+                self.localconffile = lcfile
+                logger.debug("Loading local config file %s" % self.localconffile)
+                self.localparser = ConfigParser.ConfigParser()
+                with open(self.localconffile) as f:
+                    self.localparser.readfp(f)
+
+                for section in self.localparser.sections():
+                    if '|' in section:
+                        sectionvals = section.split('|')
+                        repo = sectionvals[0]
+                        if sectionvals[1] != self.combobranch:
+                            continue
+                    else:
+                        repo = section
+                    if repo in self.repos:
+                        readsection(self.localparser, section, repo)
+
     def update(self, repo, option, value):
-        self.parser.set(repo, option, value)
-        self.parser.write(open(self.conffile, "w"))
+        if self.localparser:
+            parser = self.localparser
+            section = "%s|%s" % (repo, self.combobranch)
+            conffile = self.localconffile
+        else:
+            parser = self.parser
+            section = repo
+            conffile = self.conffile
+        parser.set(section, option, value)
+        with open(conffile, "w") as f:
+            parser.write(f)
 
     def sanity_check(self):
         required_options=["src_uri", "local_repo_dir", "dest_dir", "last_revision"]
         msg = ""
+        missing_options = []
         for name in self.repos:
             for option in required_options:
                 if option not in self.repos[name]:
                     msg = "%s\nOption %s is not defined for component %s" %(msg, option, name)
+                    missing_options.append(option)
         if msg != "":
             logger.error("configuration file %s has the following error: %s" % (self.conffile,msg))
+            if self.localconffile and 'last_revision' in missing_options:
+                logger.error("local configuration file %s may be missing configuration for combo branch %s" % (self.localconffile, self.combobranch))
             sys.exit(1)
 
         # filterdiff is required by action_splitpatch, so check its availability
-- 
1.7.9.5



