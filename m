Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B8D1A71A4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 03:17:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 01 Nov 2016 20:17:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,582,1473145200"; d="scan'208";a="186580259"
Received: from kgonza2-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.158.24])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2016 20:17:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 16:16:38 +1300
Message-Id: <0d89ecf418a2541d71ecce5d49d1085a3d44a8e1.1478056518.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1478056518.git.paul.eggleton@linux.intel.com>
References: <cover.1478056518.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1478056518.git.paul.eggleton@linux.intel.com>
References: <cover.1478056518.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] classes/populate_sdk_ext: require uninative
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
X-List-Received-Date: Wed, 02 Nov 2016 03:17:07 -0000

It seems that possibly due to OE-Core commit
ac59063bee0e32d0737340974f657341717a6abe, binaries produced without
uninative aren't compatible with the uninative glibc. I did try earlier
to ensure that the eSDK could work without uninative since the default
configuration in OE-Core does not enable it, but it seems like I didn't
go far enough. Given the practical considerations, just give up and
require uninative to be enabled in order to build the eSDK. I'm not
particularly happy about this, but I don't seem much of an alternative.

Fixes [YOCTO #10566].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0f0525d..61e00af 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -114,10 +114,6 @@ def create_filtered_tasklist(d, sdkbasepath, tasklistfile, conf_initpath):
             f.write('SSTATE_MIRRORS_forcevariable = ""\n')
             # Ensure TMPDIR is the default so that clean_esdk_builddir() can delete it
             f.write('TMPDIR_forcevariable = "${TOPDIR}/tmp"\n')
-            # Drop uninative if the build isn't using it (or else NATIVELSBSTRING will
-            # be different and we won't be able to find our native sstate)
-            if not bb.data.inherits_class('uninative', d):
-                f.write('INHERIT_remove = "uninative"\n')
 
         # Unfortunately the default SDKPATH (or even a custom value) may contain characters that bitbake
         # will not allow in its COREBASE path, so we need to rename the directory temporarily
@@ -608,6 +604,9 @@ fakeroot python do_populate_sdk_ext() {
     if d.getVar('SDK_ARCH', True) != d.getVar('BUILD_ARCH', True):
         bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH', True), d.getVar('BUILD_ARCH', True)))
 
+    if not bb.data.inherits_class('uninative', d):
+        bb.fatal('The extensible SDK requires uninative to be enabled. Enabling this is straightforward - just add the following to your configuration:\n\nrequire meta/conf/distro/include/yocto-uninative.inc\nINHERIT += "uninative"\n')
+
     d.setVar('SDK_INSTALL_TARGETS', get_sdk_install_targets(d))
     buildtools_fn = get_current_buildtools(d)
     d.setVar('SDK_REQUIRED_UTILITIES', get_sdk_required_utilities(buildtools_fn, d))
-- 
2.5.5


