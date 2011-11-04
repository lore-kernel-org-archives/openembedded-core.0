Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO5T-0000tc-4J
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:01:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:55:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71129584"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2011 10:55:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:55:35 +0000
Message-Id: <5f0d61491981b454613fde87e92e6b92a426a0c5.1320429268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/7] scripts/combo-layer: make init set up initial component data
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
X-List-Received-Date: Fri, 04 Nov 2011 18:01:56 -0000

The "init" subcommand will now copy the current state of each component
repository into the combo layer repository, set last_revision for each
component, and then use "git add" to set up the initial commit (but will
not actually make the initial commit - that is left up to the user).
Also take the opportunity to bump the version number.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer              |   22 ++++++++++++++++++++--
 scripts/combo-layer.conf.example |    5 +++--
 2 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index d6d238d..db38a95 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -26,7 +26,7 @@ import logging
 import subprocess
 import ConfigParser
 
-__version__ = "0.1.0"
+__version__ = "0.2.0"
 
 def logger_create():
     logger = logging.getLogger("")
@@ -146,7 +146,7 @@ def runcmd(cmd,destdir=None):
 def action_init(conf, args):
     """
         Clone component repositories
-        Check git initialised and working tree is clean
+        Check git is initialised; if not, copy initial data from component repos
     """
     for name in conf.repos:
         ldir = conf.repos[name]['local_repo_dir']
@@ -155,6 +155,24 @@ def action_init(conf, args):
             subprocess.check_call("git clone %s %s" % (conf.repos[name]['src_uri'], ldir), shell=True)
     if not os.path.exists(".git"):
         runcmd("git init")
+        for name in conf.repos:
+            ldir = conf.repos[name]['local_repo_dir']
+            logger.info("copying data from %s..." % name)
+            dest_dir = conf.repos[name]['dest_dir']
+            if dest_dir and dest_dir != ".":
+                extract_dir = os.path.join(os.getcwd(), dest_dir)
+                os.makedirs(extract_dir)
+            else:
+                extract_dir = os.getcwd()
+            file_filter = conf.repos[name].get('file_filter',"")
+            runcmd("git archive master | tar -x -C %s %s" % (extract_dir, file_filter), ldir)
+            lastrev = runcmd("git rev-parse HEAD", ldir).strip()
+            conf.update(name, "last_revision", lastrev)
+        runcmd("git add .")
+        logger.info("Initial combo layer repository data has been created; please make any changes if desired and then use 'git commit' to make the initial commit.")
+    else:
+        logger.info("Repository already initialised, nothing to do.")
+
 
 def check_repo_clean(repodir):
     """
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 09b9415..8cee04f 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -11,8 +11,9 @@ local_repo_dir = /home/kyu3/src/test/bitbake
 # use "." if it is root dir
 dest_dir = bitbake
 
-# the updated revision last time.
-# If empty, the tool will start from the first commit
+# the last update revision.
+# "init" will set this automatically, however if it is empty when "update"
+# is run, the tool will start from the first commit.
 last_revision =
 
 # optional options
-- 
1.7.5.4



