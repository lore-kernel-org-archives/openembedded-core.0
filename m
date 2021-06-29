Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
 by mx.groups.io with SMTP id smtpd.web12.13007.1624993266351442186
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jun 2021 12:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 76.164.61.194, mailfrom: mark.hatle@kernel.crashing.org)
Received: from lons-builder.int.hatle.net ([192.168.0.2])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 15TJ14jB014716
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jun 2021 14:01:05 -0500
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] populate_sdk_ext: Error if trying to generate an eSDK from a mulitconfig
Date: Tue, 29 Jun 2021 14:01:04 -0500
Message-Id: <20210629190104.100253-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1

Running a build such as:

  bitbake mc:my_config:core-image-minimal -c populate_sdk-ext

will result in an error like:

ERROR: Task base-files.do_fetch attempted to execute unexpectedly
Task .../poky/build-mc/tmp-my_config-glibc/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata, unihash ec5ba0e6b31561daba005fb49c5239c8e46913465b51166b5905f3e5ffcf2741, taskhash ec5ba0e6b31561daba005fb49c5239c8e46913465b51166b5905f3e5ffcf2741
Task .../poky/build-mc/tmp-my_config-glibc/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm, unihash 1c7d7509c2ff6dcf11009fbec444726826214795d60474ec8d3262d89c40a955, taskhash 1c7d7509c2ff6dcf11009fbec444726826214795d60474ec8d3262d89c40a955
Task .../poky/build-mc/tmp-my_config-glibc/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot, unihash 9cc3672f4fa62491f545b15cf617a64cd77d15a2cfd432b57d4b936bc415f40d, taskhash 9cc3672f4fa62491f545b15cf617a64cd77d15a2cfd432b57d4b936bc415f40d
Task .../poky/build-mc/tmp-my_config-glibc/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_qa, unihash 8ada5f62092c971df8dda1d71c728e42994e1dcf2bbdab419de43867d77b64cc, taskhash 8ada5f62092c971df8dda1d71c728e42994e1dcf2bbdab419de43867d77b64cc
Task .../poky/build-mc/tmp-my_config-glibc/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_qa, unihash 16656a339389e407a5fdca5d64983af845288f3b3cc5582398e5247efb393257, taskhash 16656a339389e407a5fdca5d64983af845288f3b3cc5582398e5247efb393257
Task .../poky/build-mc/tmp-my_config-glibc/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/images/core-image-minimal.bb:do_image_complete, unihash ef88c74a9f4ae4d252c421eb4e399773aa50cea7c51ffbeed9011e5198a16abb, taskhash ef88c74a9f4ae4d252c421eb4e399773aa50cea7c51ffbeed9011e5198a16abb
This is usually due to missing setscene tasks. Those missing in this build were: {'.../poky/build-mc/tmp-my_config-glibc/work/qemuarm64-poky-linux/core-image-minimal/1.0-r0/sdk-ext/image/tmp-renamed-sdk/layers/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_qa',

Instead of letting the system error, we simply tell the user this is not supported.

As long as the eSDK is constructed based on the primary library, it works fine.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/classes/populate_sdk_ext.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 517b4e45ff0..4aabafa079b 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -750,6 +750,11 @@ fakeroot python do_populate_sdk_ext() {
     if d.getVar('SDK_ARCH') != d.getVar('BUILD_ARCH'):
         bb.fatal('The extensible SDK can currently only be built for the same architecture as the machine being built on - SDK_ARCH is set to %s (likely via setting SDKMACHINE) which is different from the architecture of the build machine (%s). Unable to continue.' % (d.getVar('SDK_ARCH'), d.getVar('BUILD_ARCH')))
 
+    # FIXME hopefully we can remove this restriction at some point, but the eSDK
+    # can only be built for the primary (default) multiconfig
+    if d.getVar('BB_CURRENT_MC') != 'default':
+        bb.fatal('The extensible SDK can currently only be built for the default multiconfig.  Currently trying to build for %s.' % d.getVar('BB_CURRENT_MC'))
+
     d.setVar('SDK_INSTALL_TARGETS', get_sdk_install_targets(d))
     if d.getVar('SDK_INCLUDE_BUILDTOOLS') == '1':
         buildtools_fn = get_current_buildtools(d)
-- 
2.17.1

