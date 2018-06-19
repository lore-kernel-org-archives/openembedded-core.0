Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 38498754C5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 11:45:16 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id v131-v6so21461161wma.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 04:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xGxY3rgoCY6acGQWpzcMrF6WNtMX7UgoSlv/HitlOBs=;
	b=Ig5U++f6jictGU1SvyvT+GW7zQ2wscrf1kRpmB+U2RHV6hIWsufXO2HBXCCbzvr3ij
	hHTsLv6HOLtDUVHaXfCNKu+JF7y7ad9XjL0L6ddfRDUyCTxFBPMFT3UsAtDaVNTBGT/S
	e4MAyl4r08eyquG7W7SX9LEPvqnFmM+EfBcwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xGxY3rgoCY6acGQWpzcMrF6WNtMX7UgoSlv/HitlOBs=;
	b=s+4r2juiPMWB9MehIEmJx1xoh5Zcxx97EVyiYOzoFAUjo8l2d45nrM3BtJX7/qU3qR
	iuwYzUpByxcciSDzGyn2A8vDYVszOHDgL7wE8b6jHjX4rij6BU+H7+8Lc1LE1lUwWCHQ
	Wtqm39//r2RWdZswN2IZNpQbFkyGu8dATQNTJOHy1gYBrm7mL8jGQR0jOg4z8pJIJLha
	4nqpoQGfk6+fcUwEsbh2puji6AhaE5OCVAa0ePPUwlWs0BTYxjQlgA5vN3Wv7jmR1nAz
	72zOmZVMzl/5tvHkX3feYfwCjbMbLbzOJ7H9vpHh5L9ZwlWTtniopcD49+BBsTNsjKl0
	iETA==
X-Gm-Message-State: APt69E3T1vqyothhSQ0wrkiGcCswhWKj4mObzqOaliCr1haPn8c/gSpJ
	76E3qqYCZUCGSvcv+dGOt1Na5juzfrE=
X-Google-Smtp-Source: ADUXVKLBnSaCisZp4jeYLRYdzzQk8GEAUIEOChqyhIOP9EIcXTKgyJa8UXJLXvKYoLbNXRPu2jSWrg==
X-Received: by 2002:a1c:7192:: with SMTP id
	d18-v6mr11351932wmi.115.1529408716590; 
	Tue, 19 Jun 2018 04:45:16 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n18-v6sm22065902wrj.58.2018.06.19.04.45.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jun 2018 04:45:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2018 12:45:12 +0100
Message-Id: <20180619114512.11699-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
References: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/3] image/testimage: Rework auto image test execution
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
X-List-Received-Date: Tue, 19 Jun 2018 11:45:16 -0000

The TEST_IMAGE interface has never particularly worked and image testing currently
gets configured manually.

This reworks the interface to better serve the needs of its users, replacing it
with TESTIMAGE_AUTO.

This does away with the need for the separate class due to better bitbake APIs for
changing tasks.

TESTIMAGE_AUTO will automatically boot under qemu any image that is built. It
also adds in dependencies so that any SDK for which testing is requested will
automatically be built first.

The code in bitbake.conf was error prone (e.g. testsdk wasn't considered), this
improves it to standardise on IMAGE_CLASSES as the standard configuration mechanism.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass          |  1 -
 meta/classes/testimage-auto.bbclass | 23 -----------------------
 meta/classes/testimage.bbclass      | 10 +++++++++-
 meta/classes/testsdk.bbclass        |  5 +++++
 meta/conf/bitbake.conf              |  2 +-
 meta/conf/documentation.conf        |  2 +-
 meta/conf/local.conf.sample         | 10 ++++++----
 7 files changed, 22 insertions(+), 31 deletions(-)
 delete mode 100644 meta/classes/testimage-auto.bbclass

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index c4fc457985b..24c1a983f3e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -6,7 +6,6 @@ IMGCLASSES += "${@['populate_sdk_base', 'populate_sdk_ext']['linux' in d.getVar(
 IMGCLASSES += "${@bb.utils.contains_any('IMAGE_FSTYPES', 'live iso hddimg', 'image-live', '', d)}"
 IMGCLASSES += "${@bb.utils.contains('IMAGE_FSTYPES', 'container', 'image-container', '', d)}"
 IMGCLASSES += "image_types_wic"
-IMGCLASSES += "${@oe.utils.conditional('TEST_IMAGE', '1', 'testimage-auto', '', d)}"
 IMGCLASSES += "rootfs-postcommands"
 inherit ${IMGCLASSES}
 
diff --git a/meta/classes/testimage-auto.bbclass b/meta/classes/testimage-auto.bbclass
deleted file mode 100644
index e0a22b773c8..00000000000
--- a/meta/classes/testimage-auto.bbclass
+++ /dev/null
@@ -1,23 +0,0 @@
-# Copyright (C) 2013 Intel Corporation
-#
-# Released under the MIT license (see COPYING.MIT)
-
-
-# Run tests automatically on an image after the image is constructed
-# (as opposed to testimage.bbclass alone where tests must be called
-# manually using bitbake -c testimage <image>).
-#
-# NOTE: to use this class, simply set TEST_IMAGE = "1" - no need to
-# inherit it since that will be done in image.bbclass when this variable
-# has been set.
-#
-# See testimage.bbclass for the test implementation.
-
-inherit testimage
-
-python do_testimage_auto() {
-    testimage_main(d)
-}
-addtask testimage_auto before do_build after do_image_complete
-do_testimage_auto[depends] += "${TESTIMAGEDEPENDS}"
-do_testimage_auto[lockfiles] += "${TESTIMAGELOCK}"
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index c17a7c604b4..1be22f63047 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -10,6 +10,11 @@
 # - first add IMAGE_CLASSES += "testimage" in local.conf
 # - build a qemu core-image-sato
 # - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.
+#
+# The tests can be run automatically each time an image is built if you set
+# TESTIMAGE_AUTO = "1"
+
+TESTIMAGE_AUTO ??= "0"
 
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
@@ -382,4 +387,7 @@ def package_extraction(d, test_suites):
 
 testimage_main[vardepsexclude] += "BB_ORIGENV DATETIME"
 
-inherit testsdk
+python () {
+    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO")):
+        bb.build.addtask("testimage", "do_build", "do_image_complete", d)
+}
diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 2e43343643e..f12725cbab8 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -194,3 +194,8 @@ python do_testsdkext() {
 addtask testsdkext
 do_testsdkext[nostamp] = "1"
 
+python () {
+    if oe.types.boolean(d.getVar("TESTIMAGE_AUTO")):
+        bb.build.addtask("testsdk", None, "do_populate_sdk", d)
+        bb.build.addtask("testsdkext", None, "do_populate_sdk_ext", d)
+}
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3b2ef9fb47c..c4dba61cc6b 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -487,7 +487,7 @@ HOSTTOOLS += " \
 "
 
 # Tools needed to run testimage runtime image testing
-HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.data.inherits_class('testimage', d) or d.getVar('TEST_IMAGE') == '1') else ''}"
+HOSTTOOLS += "${@'ip ping ps scp ssh stty' if (bb.utils.contains_any('IMAGE_CLASSES', 'testimage testsdk', True, False, d)) else ''}"
 
 # Link to these if present
 HOSTTOOLS_NONFATAL += "aws ccache gcc-ar gpg ld.bfd ld.gold nc sftp socat ssh sudo"
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 3189dd39b72..fc6d008807b 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -415,7 +415,7 @@ TARGET_PREFIX[doc] = "The prefix for the cross-compile toolchain (e.g. arm-linux
 TARGET_SYS[doc] = "The target system is comprised of TARGET_ARCH,TARGET_VENDOR and TARGET_OS."
 TCLIBC[doc] = "Specifies C library (libc) variant to use during the build process. You can select 'baremetal', 'glibc' or 'musl'."
 TCMODE[doc] = "Enables an external toolchain (where provided by an additional layer) if set to a value other than 'default'."
-TEST_IMAGE[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images."
+TESTIMAGE_AUTO[doc] = "Enables test booting of virtual machine images under the QEMU emulator after any root filesystems are created and runs tests against those images each time an image is built."
 TEST_QEMUBOOT_TIMEOUT[doc] = "The time in seconds allowed for an image to boot before automated runtime tests begin to run against an image."
 TEST_SUITES[doc] = "An ordered list of tests (modules) to run against an image when performing automated runtime testing."
 TEST_POWERCONTROL_CMD[doc] = "For automated hardware testing, specifies the command to use to control the power of the target machine under test"
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 17cdd7046e5..1ac4156b903 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -135,10 +135,12 @@ USER_CLASSES ?= "buildstats image-mklibs image-prelink"
 # Runtime testing of images
 #
 # The build system can test booting virtual machine images under qemu (an emulator)
-# after any root filesystems are created and run tests against those images. To
-# enable this uncomment this line. See classes/testimage(-auto).bbclass for
-# further details.
-#TEST_IMAGE = "1"
+# after any root filesystems are created and run tests against those images. It can also
+# run tests against any SDK that are built. To enable this uncomment these lines.
+# See classes/test{image,sdk}.bbclass for further details.
+#IMAGE_CLASSES += "testimage testsdk"
+#TESTIMAGE_AUTO_qemuall = "1"
+
 #
 # Interactive shell configuration
 #
-- 
2.17.1


