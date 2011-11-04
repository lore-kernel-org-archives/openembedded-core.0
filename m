Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO5U-0000ta-Ig
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:01:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:55:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71129586"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2011 10:55:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:55:36 +0000
Message-Id: <246e94708cc57eab9f5440306d2a1f08f0de7e03.1320429268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/7] scripts/combo-layer: tidy up config example
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
X-List-Received-Date: Fri, 04 Nov 2011 18:01:57 -0000

Move all example configuration to the example config file, tidy up a few
long lines and fix some grammar.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer              |   47 +-------------------------------------
 scripts/combo-layer.conf.example |   23 ++++++++++++++----
 2 files changed, 19 insertions(+), 51 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index db38a95..e39e4e0 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -42,52 +42,7 @@ class Configuration(object):
     """
     Manages the configuration
 
-    A valid conf looks like:
-
-# component name
-[bitbake]
-
-# mandatory options
-
-# git upstream uri
-src_uri = git://git.openembedded.org/bitbake
-
-# the directory to clone the component repo
-local_repo_dir = ~/src/bitbake
-
-# the relative dir to commit the repo patch
-# use "." if it is root dir
-dest_dir = bitbake
-
-# the updated revision last time.
-# leave it empty if no commit updated yet, and then the tool
-# will start from the first commit
-last_revision =
-
-# optional options
-
-# file_filter: only include the interested file
-# file_filter = [path] [path] ...
-# example:
-#   file_filter = src/  : only include the subdir src
-#   file_filter = src/*.c : only include the src *.c file
-#   file_filter = src/main.c src/Makefile.am : only include these two files
-
-[oe-core]
-src_uri = git://git.openembedded.org/openembedded-core
-local_repo_dir = ~/src/oecore
-dest_dir = .
-last_revision =
-
-# it's also possible to embed python code in the config values. Similar
-# to bitbake it considers every value starting with @ to be a python script. 
-# So local_repo could be easily configured using an environment variable as:
-#
-# [bitbake]
-# local_repo = @os.getenv("LOCAL_REPO_DIR") + "/bitbake"
-#
-
-# more components ...
+    For an example config file, see combo-layer.conf.example
 
     """
     def __init__(self, options):
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 8cee04f..3865829 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -1,3 +1,5 @@
+# combo-layer example configuration file
+
 # component name
 [bitbake]
 # mandatory options
@@ -7,8 +9,8 @@ src_uri = git://git.openembedded.org/bitbake
 # the directory to clone the component repo
 local_repo_dir = /home/kyu3/src/test/bitbake
 
-# the relative dir to commit the repo patch
-# use "." if it is root dir
+# the relative dir within the combo repo to put the component files
+# use "." if the files should be in the root dir
 dest_dir = bitbake
 
 # the last update revision.
@@ -25,9 +27,10 @@ last_revision =
 #   file_filter = src/*.c : only include the src *.c file
 #   file_filter = src/main.c src/Makefile.am : only include these two files
 
-# hook: if provided, the tool will call the hook to process the generated patch from upstream,
-#       and then apply the modified patch to combo repo
-# the hook's parameter is: ./hook patchpath revision reponame
+# hook: if provided, the tool will call the hook to process the generated
+#     patch from upstream, and then apply the modified patch to the combo
+#     repo.
+# the hook script is called as follows: ./hook patchpath revision reponame
 # example:
 #     hook = combo-layer-hook-default.sh
 
@@ -36,3 +39,13 @@ src_uri = git://git.openembedded.org/openembedded-core
 local_repo_dir = /home/kyu3/src/test/oecore
 dest_dir = .
 last_revision =
+
+# It is also possible to embed python code in the config values. Similar
+# to bitbake it considers every value starting with @ to be a python
+# script.
+# e.g. local_repo_dir could easily be configured using an environment
+# variable:
+#
+# [bitbake]
+# local_repo_dir = @os.getenv("LOCAL_REPO_DIR") + "/bitbake"
+#
-- 
1.7.5.4



