Return-Path: <raj.khem@gmail.com>
Received: from mail-yb0-f181.google.com (mail-yb0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 44BB677921
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 18:21:14 +0000 (UTC)
Received: by mail-yb0-f181.google.com with SMTP id 81so34626492ybp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 11:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HcLjS2C2eR/BcOZcZQbNhZvxHCEKDCBqusjZ5VF5W50=;
	b=birTbd7LR7JaLs3ecPfDkl5eHb1F/JpMfLsjn7AoudXaVHnzdOlbqaPNiBd+bJjqRr
	/KEkOnCORs6IxedsGB9eAaj+7XU/kDEHwIu9S5Yivo3tFo3s7jQZlVE/5SQt5in5JRTb
	TXolTuQq/SjS21MIwk7x1BzY3ayFEXpdi6bPfYhDtU3s6j9Zykei3BwtHq6gSbVFAqDw
	UAfc0tSsht5Sh+DfSF+IdKKQcTBZKIm8fCMVGe15EiGihXRfR0UufcQ06Cl3aB15g1sX
	VeQuze0GsLivaESWHlwsEadLBDAHsh1IfYAydSFsAzqmsiX9A8i5wAeLWs6gfXXQxDM3
	txzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HcLjS2C2eR/BcOZcZQbNhZvxHCEKDCBqusjZ5VF5W50=;
	b=G0eygMnldq4dz1T/bNfRnvHsAfcefk6KyQ4lPSKfJof+nRjcC/uuIYaAW01GRl5ce9
	06HVaSINlKGBZyMJxRFVhkB7y7zzWfDIF7ctY/Skr2PU3yYgl09KO5vMxLLH1X7BNl6Q
	rW1JhKIh092L0GarvulkzVkjjS9sp+0e5OHrX44T6+U/bFA9zHXhFhx6nFWwdnU3bcVk
	1/6rzeD+6J2e3rRI5qkUiLETw78xHuUASNZlFjb99W8Ug4HYRfKiDYrelObqsAoRKPwf
	AcdTwGwtEAh8RMz4l26iVCD8knCipfMkhWrUUGf3Dam1cXcr9YRsyG6rIXzu+5B6+QEP
	htMA==
X-Gm-Message-State: AN3rC/7FJTq+paHNg4Ycvd6pEKRC437G3AsEACB+vMN1Ihdq5d8jTPFc
	J0UoPb2l19jm9g==
X-Received: by 10.84.196.129 with SMTP id l1mr11774212pld.21.1492712476314;
	Thu, 20 Apr 2017 11:21:16 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e131sm11795417pfg.10.2017.04.20.11.21.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Apr 2017 11:21:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 11:20:27 -0700
Message-Id: <20170420182028.31964-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170420182028.31964-1-raj.khem@gmail.com>
References: <20170420182028.31964-1-raj.khem@gmail.com>
Subject: [PATCH 4/5] gstreamer1.0-libav: Fix build with gcc7
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
X-List-Received-Date: Thu, 20 Apr 2017 18:21:15 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-configure-check-for-armv7ve-variant.patch | 35 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0-libav_1.10.4.bb         | 12 ++++----
 2 files changed, 41 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch
new file mode 100644
index 00000000000..b80d0739461
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/0001-configure-check-for-armv7ve-variant.patch
@@ -0,0 +1,35 @@
+From aac5902d3c9cb35c771e760d0e487622aa2e116a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Apr 2017 10:38:18 -0700
+Subject: [PATCH] configure: check for armv7ve variant
+
+OE passes -mcpu and -march via cmdline and if
+package tries to detect one of it own then it
+should be compatible otherwise, newer gcc7+ will
+error out
+
+Check for relevant preprocessor macro to determine
+armv7ve architecture
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gst-libs/ext/libav/configure | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gst-libs/ext/libav/configure b/gst-libs/ext/libav/configure
+index 4a5e477..727818e 100755
+--- a/gst-libs/ext/libav/configure
++++ b/gst-libs/ext/libav/configure
+@@ -4295,6 +4295,7 @@ elif enabled arm; then
+         elif check_arm_arch 6Z;       then echo armv6z
+         elif check_arm_arch 6ZK;      then echo armv6zk
+         elif check_arm_arch 6T2;      then echo armv6t2
++        elif check_arm_arch EXT_IDIV; then echo armv7ve
+         elif check_arm_arch 7;        then echo armv7
+         elif check_arm_arch 7A  7_A;  then echo armv7-a
+         elif check_arm_arch 7S;       then echo armv7-a
+-- 
+2.12.2
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
index 59d81db03ab..e4bb477c7a0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.10.4.bb
@@ -8,12 +8,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = " \
-    http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
-    file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
-    file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
-    file://mips64_cpu_detection.patch \
-"
+SRC_URI = "http://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
+           file://0001-Disable-yasm-for-libav-when-disable-yasm.patch \
+           file://workaround-to-build-gst-libav-for-i586-with-gcc.patch \
+           file://mips64_cpu_detection.patch \
+           file://0001-configure-check-for-armv7ve-variant.patch \
+           "
 SRC_URI[md5sum] = "e2bdd9fde6ca3ff7efffb93df121f4fd"
 SRC_URI[sha256sum] = "6ca0feca75e3d48315e07f20ec37cf6260ed1e9dde58df355febd5016246268b"
 
-- 
2.12.2


