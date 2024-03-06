Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E8CC54E66
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.15018.1709739730960736812
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DqT957ia;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-565b434f90aso10208185a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739729; x=1710344529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0WcCZOecYoxe9WE//H6w8tUJ1eINwgeeLdTAhfDWkY=;
        b=DqT957iacvV1Ubraol7DFLuGG+7RD3s1HfqH13wXuYvgYzzIRxspmQAGD99i8dtcLb
         VTNOttQFrmuJYqEJwN4tg9UxjSmcy20WYhiLEyjOXMT3VQI1iI/SU2TgqMfQBPuv/E+k
         TUSKdUAqeWzhgaq/dlL/ns/jAOhwPrgeEtoS3j3tsytY3tEp77B3HqWaQJ5OJscT6RYH
         +JpNV1nT3ICnYN8OQ6WoYP1OxgkrfuHmh7f8N5emoEo6gp1+KsCpZCvBRNyct2w65dY+
         bB5BSXFYt+Vzl+3nZU82TdszBRriN3Yq2aUkDF5WsvH7hSeEz3UBqYmChrKOG9ivj92Z
         rD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739729; x=1710344529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0WcCZOecYoxe9WE//H6w8tUJ1eINwgeeLdTAhfDWkY=;
        b=OsLL8sUcZP/Qf5OLHwu0vxoLkftKwhTSflR46QNGxvk//9nZErAKFLSlP4pIx/X79d
         fZi3pKZq3Xv4RYuF4dpvlDoRdAlkYWhRFk9aGNDjiQ+7ZD5dewNJm0yrorObHoz0RKO6
         UIghuM7DPv/wX+E5Js5+R+lugoDI87U0eVTobJdXQUYubbflmNC9LiLBdimae1I3XutU
         Bbwd3Eo3IFCEaMJMH6zsTwoSFx2o5guodHFg+RyBWelLAS8dkxT+yTT53yn/YeXkCsL0
         RRtKDGzMKrVVGpX8kn47UT+UAzE9Fq/XxnOXxoQWjkYqdniOBlpsb+oPqgPf/V63kNfM
         ZKDg==
X-Gm-Message-State: AOJu0YzM3as1CaQSD7HtmO3gmSsce5p5VAdwMQ4Ob6IuWfYdXf3FZB+D
	t1SRTKpXApddtLPHFgph+AKRrcsOLru0Vb1LRdRPu77572Q2/AXOpVObJwkU
X-Google-Smtp-Source: AGHT+IE/jAlx7PGakOeu/+7S/L9yEykXSJuXeoi36GnXaKSJ8ZVdqjVA18//B0BOoH10fVYxza21zg==
X-Received: by 2002:a17:906:b00b:b0:a44:c583:dfc8 with SMTP id v11-20020a170906b00b00b00a44c583dfc8mr9217590ejy.48.1709739729357;
        Wed, 06 Mar 2024 07:42:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/47] libpciaccess: upgrade 0.17 -> 0.18
Date: Wed,  6 Mar 2024 16:41:21 +0100
Message-Id: <20240306154151.3741709-17-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196700

License-Update: copyright years

Convert to meson, drop xorg-lib-common include
(it's too autotools-specific).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...pwrite-pread-instead-of-64bit-versio.patch | 39 -------------------
 .../xorg-lib/libpciaccess_0.17.bb             | 17 --------
 .../xorg-lib/libpciaccess_0.18.bb             | 26 +++++++++++++
 3 files changed, 26 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch b/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
deleted file mode 100644
index 512a473e201..00000000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess/0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From d20ff4f2e4feaafa6a6191b9cae3815b85617943 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 11 Nov 2022 11:15:58 -0800
-Subject: [PATCH] linux_sysfs: Use pwrite/pread instead of 64bit versions
-
-pread64/pwrite64 are aliased to pread/pwrite when largefile support is
-enabled e.g. using _FILE_OFFSET_BITS=64 macro
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/xorg/lib/libpciaccess/-/merge_requests/26]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/linux_sysfs.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/linux_sysfs.c b/src/linux_sysfs.c
-index d62f48c..20c800e 100644
---- a/src/linux_sysfs.c
-+++ b/src/linux_sysfs.c
-@@ -462,7 +462,7 @@ pci_device_linux_sysfs_read( struct pci_device * dev, void * data,
- 
- 
-     while ( temp_size > 0 ) {
--	const ssize_t bytes = pread64( fd, data_bytes, temp_size, offset );
-+	const ssize_t bytes = pread( fd, data_bytes, temp_size, offset );
- 
- 	/* If zero bytes were read, then we assume it's the end of the
- 	 * config file.
-@@ -522,7 +522,7 @@ pci_device_linux_sysfs_write( struct pci_device * dev, const void * data,
- 
- 
-     while ( temp_size > 0 ) {
--	const ssize_t bytes = pwrite64( fd, data_bytes, temp_size, offset );
-+	const ssize_t bytes = pwrite( fd, data_bytes, temp_size, offset );
- 
- 	/* If zero bytes were written, then we assume it's the end of the
- 	 * config file.
--- 
-2.38.1
-
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
deleted file mode 100644
index 54bdb089763..00000000000
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Generic PCI access library for X"
-
-DESCRIPTION = "libpciaccess provides functionality for X to access the \
-PCI bus and devices in a platform-independent way."
-
-require xorg-lib-common.inc
-
-SRC_URI += "file://0001-linux_sysfs-Use-pwrite-pread-instead-of-64bit-versio.patch"
-
-SRC_URI[sha256sum] = "74283ba3c974913029e7a547496a29145b07ec51732bbb5b5c58d5025ad95b73"
-
-LICENSE = "MIT & MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
-
-REQUIRED_DISTRO_FEATURES = ""
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
new file mode 100644
index 00000000000..74b308c9121
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Generic PCI access library for X"
+
+DESCRIPTION = "libpciaccess provides functionality for X to access the \
+PCI bus and devices in a platform-independent way."
+
+HOMEPAGE = "http://www.x.org"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xorg"
+
+SECTION = "x11/libs"
+LICENSE = "MIT"
+DEPENDS = "util-macros"
+
+SRC_URI = "${XORG_MIRROR}/individual/lib/${BP}.tar.xz"
+
+inherit features_check pkgconfig meson
+
+REQUIRED_DISTRO_FEATURES ?= "x11"
+
+SRC_URI[sha256sum] = "5461b0257d495254346f52a9c329b44b346262663675d3fecdb204a7e7c262a9"
+
+LICENSE = "MIT & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=54c978968e565218eea36cf03ef24352"
+
+REQUIRED_DISTRO_FEATURES = ""
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


