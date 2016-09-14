Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1B73D77218
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 05:10:18 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 13 Sep 2016 22:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,332,1470726000"; 
   d="scan'208";a="8542961"
Received: from yagrawax-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.166.231])
	by orsmga004.jf.intel.com with ESMTP; 13 Sep 2016 22:10:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 17:09:51 +1200
Message-Id: <e260f0007ce3970903b9e4c1ceee34eb16b6f705.1473829704.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1473829704.git.paul.eggleton@linux.intel.com>
References: <cover.1473829704.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1473829704.git.paul.eggleton@linux.intel.com>
References: <cover.1473829704.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/populate_sdk_ext: ensure we clean the right temporary TMPDIR path
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
X-List-Received-Date: Wed, 14 Sep 2016 05:10:18 -0000

After we run the build system within the eSDK internally as part of the
sstate filtering that happens during do_populate_sdk_ext, we need to
ensure that the TMPDIR created during that process gets deleted. However
we were using the TMPDIR path for the build producing the eSDK which may
not be the same (since that value would typically be filtered out) thus
if the user had set TMPDIR to something other than the default, the
temporary TMPDIR would not be deleted which not only led to extraneous
junk entering the SDK but also failures during install because the
TMPDIR path was different. In order to fix this, force TMPDIR to a known
value during the sstate filtering run so we know what to delete
afterwards.

Fixes [YOCTO #10210].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index d8d123a..b64bf0b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -88,8 +88,7 @@ SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME', True) or d.getVar(
 def clean_esdk_builddir(d, sdkbasepath):
     """Clean up traces of the fake build for create_filtered_tasklist()"""
     import shutil
-    cleanpaths = 'cache conf/sanity_info conf/templateconf.cfg'.split()
-    cleanpaths.append(os.path.basename(d.getVar('TMPDIR', True)))
+    cleanpaths = 'cache conf/sanity_info conf/templateconf.cfg tmp'.split()
     for pth in cleanpaths:
         fullpth = os.path.join(sdkbasepath, pth)
         if os.path.isdir(fullpth):
@@ -109,10 +108,12 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
     # Create a temporary build directory that we can pass to the env setup script
     shutil.copyfile(sdkbasepath + '/conf/local.conf', sdkbasepath + '/conf/local.conf.bak')
     try:
-        # Force the use of sstate from the build system
         with open(sdkbasepath + '/conf/local.conf', 'a') as f:
+            # Force the use of sstate from the build system
             f.write('\nSSTATE_DIR_forcevariable = "%s"\n' % d.getVar('SSTATE_DIR', True))
             f.write('SSTATE_MIRRORS_forcevariable = ""\n')
+            # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
+            f.write('TMPDIR_forcevariable = "${TOPDIR}/tmp"\n')
             # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
             # be different and we won't be able to find our native sstate)
             if not bb.data.inherits_class('uninative', d):
-- 
2.5.5


