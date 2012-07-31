Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw9lt-0008GE-CW
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 12:33:49 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Jul 2012 03:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="128772291"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.64])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jul 2012 03:22:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:22:05 +0100
Message-Id: <1343730125-10561-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] combo-layer: ensure init works with split local config
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
X-List-Received-Date: Tue, 31 Jul 2012 10:33:49 -0000

If the local configuration is already split out, ensure the init action
works properly and does not error in the case that last_revision is not
set. Additionally, if the local configuration is within the repository,
prevent it from being committed and add it to .gitignore.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |   27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 516fffb..448fe71 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -41,6 +41,9 @@ logger = logger_create()
 
 def get_current_branch(repodir=None):
     try:
+        if not os.path.exists(os.path.join(repodir if repodir else '', ".git")):
+            # Repo not created yet (i.e. during init) so just assume master
+            return "master"
         branchname = runcmd("git symbolic-ref HEAD 2>/dev/null", repodir).strip()
         if branchname.startswith("refs/heads/"):
             branchname = branchname[11:]
@@ -104,11 +107,13 @@ class Configuration(object):
                     if repo in self.repos:
                         readsection(self.localparser, section, repo)
 
-    def update(self, repo, option, value):
+    def update(self, repo, option, value, initmode=False):
         if self.localparser:
             parser = self.localparser
             section = "%s|%s" % (repo, self.combobranch)
             conffile = self.localconffile
+            if initmode and not parser.has_section(section):
+                parser.add_section(section)
         else:
             parser = self.parser
             section = repo
@@ -117,8 +122,10 @@ class Configuration(object):
         with open(conffile, "w") as f:
             parser.write(f)
 
-    def sanity_check(self):
+    def sanity_check(self, initmode=False):
         required_options=["src_uri", "local_repo_dir", "dest_dir", "last_revision"]
+        if initmode:
+            required_options.remove("last_revision")
         msg = ""
         missing_options = []
         for name in self.repos:
@@ -185,8 +192,19 @@ def action_init(conf, args):
             file_filter = repo.get('file_filter', "")
             runcmd("git archive %s | tar -x -C %s %s" % (branch, extract_dir, file_filter), ldir)
             lastrev = runcmd("git rev-parse HEAD", ldir).strip()
-            conf.update(name, "last_revision", lastrev)
+            conf.update(name, "last_revision", lastrev, initmode=True)
         runcmd("git add .")
+        if conf.localconffile:
+            localadded = True
+            try:
+                runcmd("git rm --cached %s" % conf.localconffile, printerr=False)
+            except subprocess.CalledProcessError:
+                localadded = False
+            if localadded:
+                localrelpath = os.path.relpath(conf.localconffile)
+                runcmd("grep -q %s .gitignore || echo %s >> .gitignore" % (localrelpath, localrelpath))
+                runcmd("git add .gitignore")
+                logger.info("Added local configuration file %s to .gitignore", localrelpath)
         logger.info("Initial combo layer repository data has been created; please make any changes if desired and then use 'git commit' to make the initial commit.")
     else:
         logger.info("Repository already initialised, nothing to do.")
@@ -552,7 +570,8 @@ Action:
         if options.debug:
             logger.setLevel(logging.DEBUG)
         confdata = Configuration(options)
-        confdata.sanity_check()
+        initmode = (args[1] == 'init')
+        confdata.sanity_check(initmode)
         actions.get(args[1], action_error)(confdata, args[1:])
 
 if __name__ == "__main__":
-- 
1.7.9.5



