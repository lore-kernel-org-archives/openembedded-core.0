Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3kLc-0001cS-0U
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 10:34:23 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 01:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,628,1355126400"; d="scan'208";a="288228722"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2013 01:18:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Feb 2013 09:18:21 +0000
Message-Id: <5bdbf7b384db4045f7d035d4dfc791b50fd143b9.1360315075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360315075.git.paul.eggleton@linux.intel.com>
References: <cover.1360315075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360315075.git.paul.eggleton@linux.intel.com>
References: <cover.1360315075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] buildhistory_analysis: handle more R* variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 09:34:23 -0000

Report changes to RPROVIDES, RREPLACES, and RCONFLICTS. As RSUGGESTS
isn't widely used and isn't of huge concern if it changes, it is not
reported by default.

Implements [YOCTO #3391].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/buildhistory_analysis.py |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/buildhistory_analysis.py b/meta/lib/oe/buildhistory_analysis.py
index 7b5ee45..2306bcb 100644
--- a/meta/lib/oe/buildhistory_analysis.py
+++ b/meta/lib/oe/buildhistory_analysis.py
@@ -17,12 +17,12 @@ import bb.utils
 
 
 # How to display fields
-list_fields = ['DEPENDS', 'RDEPENDS', 'RRECOMMENDS', 'FILES', 'FILELIST', 'USER_CLASSES', 'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
+list_fields = ['DEPENDS', 'RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS', 'FILES', 'FILELIST', 'USER_CLASSES', 'IMAGE_CLASSES', 'IMAGE_FEATURES', 'IMAGE_LINGUAS', 'IMAGE_INSTALL', 'BAD_RECOMMENDATIONS']
 list_order_fields = ['PACKAGES']
 defaultval_fields = ['PKG', 'PKGE', 'PKGV', 'PKGR']
 numeric_fields = ['PKGSIZE', 'IMAGESIZE']
 # Fields to monitor
-monitor_fields = ['RDEPENDS', 'RRECOMMENDS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'PKG', 'PKGE', 'PKGV', 'PKGR']
+monitor_fields = ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RREPLACES', 'RCONFLICTS', 'PACKAGES', 'FILELIST', 'PKGSIZE', 'IMAGESIZE', 'PKG', 'PKGE', 'PKGV', 'PKGR']
 # Percentage change to alert for numeric fields
 monitor_numeric_threshold = 10
 # Image files to monitor (note that image-info.txt is handled separately)
@@ -66,7 +66,7 @@ class ChangeRecord:
             return pkglist
 
         if self.fieldname in list_fields or self.fieldname in list_order_fields:
-            if self.fieldname in ['RDEPENDS', 'RRECOMMENDS']:
+            if self.fieldname in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                 (depvera, depverb) = compare_pkg_lists(self.oldvalue, self.newvalue)
                 aitems = pkglist_combine(depvera)
                 bitems = pkglist_combine(depverb)
@@ -328,7 +328,7 @@ def compare_dict_blobs(path, ablob, bblob, report_all):
             elif (not report_all) and key in list_fields:
                 if key == "FILELIST" and path.endswith("-dbg") and bstr.strip() != '':
                     continue
-                if key in ['RDEPENDS', 'RRECOMMENDS']:
+                if key in ['RPROVIDES', 'RDEPENDS', 'RRECOMMENDS', 'RSUGGESTS', 'RREPLACES', 'RCONFLICTS']:
                     (depvera, depverb) = compare_pkg_lists(astr, bstr)
                     if depvera == depverb:
                         continue
-- 
1.7.10.4



