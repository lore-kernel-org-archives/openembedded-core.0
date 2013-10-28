Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A608D6D2C5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2013 17:12:13 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Oct 2013 10:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,587,1378882800"; d="scan'208";a="418613122"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.120.252])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2013 10:12:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Oct 2013 17:11:56 +0000
Message-Id: <eff2690f7976664e6257c1c19c89feea9152eb9e.1382980153.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1382980153.git.paul.eggleton@linux.intel.com>
References: <cover.1382980153.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/6] scripts/oe-pkgdata-util: check path arguments to ensure they exist
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 Oct 2013 17:12:13 -0000

Show an error if the specified paths don't exist.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-pkgdata-util | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
index e34fcbe..01fccd2 100755
--- a/scripts/oe-pkgdata-util
+++ b/scripts/oe-pkgdata-util
@@ -37,6 +37,14 @@ def glob(args, usage):
     pkglist_file = args[1]
     globs = args[2].split()
 
+    if not os.path.exists(pkgdata_dir):
+        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
+        sys.exit(1)
+
+    if not os.path.exists(pkglist_file):
+        print('ERROR: Unable to find package list file %s' % pkglist_file)
+        sys.exit(1)
+
     skipregex = re.compile("-locale-|^locale-base-|-dev$|-doc$|-dbg$|-staticdev$|^kernel-module-")
 
     mappedpkgs = set()
@@ -148,6 +156,10 @@ def read_value(args, usage):
     var = args[1]
     packages = args[2].split()
 
+    if not os.path.exists(pkgdata_dir):
+        print('ERROR: Unable to find pkgdata directory %s' % pkgdata_dir)
+        sys.exit(1)
+
     def readvar(pkgdata_file, var):
         val = ""
         with open(pkgdata_file, 'r') as f:
-- 
1.8.1.2


