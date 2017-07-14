Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD9EC78207
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:46:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jul 2017 05:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="878891690"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jul 2017 05:46:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 9BA185803B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:46:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:33:03 +0300
Message-Id: <a44d31b81ec998481e11c175196bbb117fe25764.1500035131.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1500035131.git.ed.bartosh@linux.intel.com>
References: <cover.1500035131.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 4/8] wic: isoimage-isohybrid: check result of glob()
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
X-List-Received-Date: Fri, 14 Jul 2017 12:46:01 -0000

isoimage-isohybrid plugin uses result of glob call to
get path to initrd image. When glob returns empty list
the plugin crashes with IndexError.

Checking if result of glob call is not empty should fix
the breakage.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/source/isoimage-isohybrid.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
index ffa5429..ece4b0c 100644
--- a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
+++ b/scripts/lib/wic/plugins/source/isoimage-isohybrid.py
@@ -164,9 +164,12 @@ class IsoImagePlugin(SourcePlugin):
 
             machine = os.path.basename(initrd_dir)
 
-            initrd = glob.glob('%s/%s*%s.%s' % (initrd_dir, image_name, machine, image_type))[0]
+            pattern = '%s/%s*%s.%s' % (initrd_dir, image_name, machine, image_type)
+            files = glob.glob(pattern)
+            if files:
+                initrd = files[0]
 
-        if not os.path.exists(initrd):
+        if not initrd or not os.path.exists(initrd):
             # Create initrd from rootfs directory
             initrd = "%s/initrd.cpio.gz" % cr_workdir
             initrd_dir = "%s/INITRD" % cr_workdir
-- 
2.1.4


