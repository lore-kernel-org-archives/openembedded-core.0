Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 9CE9A7887D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 05:46:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 21:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,343,1511856000"; 
   d="scan'208";a="8890786"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2018 21:46:52 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 13:41:14 +0800
Message-Id: <7ad82568f80d843462ef15a4e9e929a7126f8a06.1515648396.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
References: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 4/5] scripts/wic: explicitly set BUILDDIR within eSDK
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
X-List-Received-Date: Thu, 11 Jan 2018 05:46:51 -0000

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
index d9bea22..b02d907 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -55,6 +55,8 @@ if os.environ.get('SDKTARGETSYSROOT'):
             # If found, initialize bitbake path for eSDK environment and append to PATH
             sdkroot = os.path.join(os.path.dirname(scripts_path), 'bitbake', 'bin')
             os.environ['PATH'] += ":" + sdkroot
+            # Set BUILDDIR for wic to work within eSDK
+            os.environ['BUILDDIR'] = sdkroot
             break
         sdkroot = os.path.dirname(sdkroot)
 
-- 
2.7.4


