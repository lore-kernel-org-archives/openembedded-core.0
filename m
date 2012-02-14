Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RxInz-0005Be-3Z
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 14:52:27 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Feb 2012 05:44:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="117410019"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.250])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2012 05:44:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2012 13:44:04 +0000
Message-Id: <0a8ed34e0ba7f038beda73dc4cb5d72ee7a74976.1329226937.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1329226937.git.paul.eggleton@linux.intel.com>
References: <cover.1329226937.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1329226937.git.paul.eggleton@linux.intel.com>
References: <cover.1329226937.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] scripts/combo-layer: avoid error when config file is outside repo
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
X-List-Received-Date: Tue, 14 Feb 2012 13:52:27 -0000

Avoid displaying the error from the "git status" command we use to check
the status of the config file if the config file is outside of the
repository (a situation that is already handled).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 2fac1c9..8fb27f6 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -79,7 +79,7 @@ class Configuration(object):
             logger.error("ERROR: patchutils package is missing, please install it (e.g. # apt-get install patchutils)")
             sys.exit(1)
 
-def runcmd(cmd,destdir=None):
+def runcmd(cmd,destdir=None,printerr=True):
     """
         execute command, raise CalledProcessError if fail
         return output if succeed
@@ -90,7 +90,8 @@ def runcmd(cmd,destdir=None):
         subprocess.check_call(cmd, stdout=out, stderr=out, cwd=destdir, shell=True)
     except subprocess.CalledProcessError,e:
         out.seek(0)
-        logger.error("%s" % out.read())
+        if printerr:
+            logger.error("%s" % out.read())
         raise e
 
     out.seek(0)
@@ -248,7 +249,7 @@ def action_update(conf, args):
     # Step 7: commit the updated config file if it's being tracked
     relpath = os.path.relpath(conf.conffile)
     try:
-        output = runcmd("git status --porcelain %s" % relpath)
+        output = runcmd("git status --porcelain %s" % relpath, printerr=False)
     except:
         # Outside the repository
         output = None
-- 
1.7.5.4



