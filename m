Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EE373771D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:45:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 10 Aug 2016 21:45:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="863475649"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga003.jf.intel.com with ESMTP; 10 Aug 2016 21:45:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:45:01 +1200
Message-Id: <2d8113d1c3f515bf0959bc15adfaf6f316efd20b.1470890478.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1470890478.git.paul.eggleton@linux.intel.com>
References: <cover.1470890478.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 04/10] classes/populate_sdk_ext: sstate filtering fixes
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
X-List-Received-Date: Thu, 11 Aug 2016 04:45:29 -0000

A couple of fixes for the recent sstate filtering implemented in OE-Core
revision 4b7b48fcb9b39fccf8222650c2608325df2a4507:

* We shouldn't be deleting the downloads directory here, since it
  contains the uninative tarball that we will need
* TMPDIR might not be named "tmp" - in OE-Core the default is tmp-glibc
  so use the actual name of TMPDIR here instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index c16e228..a075a09 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -85,10 +85,11 @@ SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
 
 SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar('DISTRO', True)} Extensible SDK"
 
-def clean_esdk_builddir(sdkbasepath):
+def clean_esdk_builddir(d, sdkbasepath):
     """Clean up traces of the fake build for create_filtered_tasklist()"""
     import shutil
-    cleanpaths = 'tmp cache conf/sanity_info conf/templateconf.cfg downloads'.split()
+    cleanpaths = 'cache conf/sanity_info conf/templateconf.cfg'.split()
+    cleanpaths.append(os.path.basename(d.getVar('TMPDIR', True)))
     for pth in cleanpaths:
         fullpth = os.path.join(sdkbasepath, pth)
         if os.path.isdir(fullpth):
@@ -140,7 +141,7 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
             os.rename(temp_sdkbasepath, sdkbasepath)
         # Clean out residue of running bitbake, which check_sstate_task_list()
         # will effectively do
-        clean_esdk_builddir(sdkbasepath)
+        clean_esdk_builddir(d, sdkbasepath)
     finally:
         os.replace(sdkbasepath + '/conf/local.conf.bak', sdkbasepath + '/conf/local.conf')
 
-- 
2.5.5


