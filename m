Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 26CEA78848
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:00:53 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:00:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; d="scan'208";a="192927006"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 11 Jan 2018 07:00:54 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 22:55:22 +0800
Message-Id: <a1522a87be260adb80085a624a30f87757b5eff1.1515681706.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCHv2 4/5] scripts/wic: explicitly set BUILDDIR within eSDK
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
X-List-Received-Date: Thu, 11 Jan 2018 15:00:53 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

When we run wic within eSDK:
$ wic create mkefidisk -e core-image-minimal

ERROR: BUILDDIR not found, exiting. (Did you forget to source oe-init-build-env?)

In order to figure out variable values, one must have sourced
the OE build environment setup script. However, when we are in
within the eSDK environment which isn't initialised like the
normal OE build environment, we can't use wic utility with eSDK.

Reference:
https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#wic-requirements

While wic ought to be fixed to be able to run without bitbake
& native tools [YOCTO #11281], but this is a workaround to set
BUILDDIR in the environment so that bitbake environment is setup
for wic to build its required native tools.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/wic | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/wic b/scripts/wic
index d9bea228ad5..7392bc4e7f4 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -51,6 +51,8 @@ sdkroot = scripts_path
 if os.environ.get('SDKTARGETSYSROOT'):
     while sdkroot != '' and sdkroot != os.sep:
         if os.path.exists(os.path.join(sdkroot, '.devtoolbase')):
+            # Set BUILDDIR for wic to work within eSDK
+            os.environ['BUILDDIR'] = sdkroot
             # .devtoolbase only exists within eSDK
             # If found, initialize bitbake path for eSDK environment and append to PATH
             sdkroot = os.path.join(os.path.dirname(scripts_path), 'bitbake', 'bin')
-- 
2.15.0


