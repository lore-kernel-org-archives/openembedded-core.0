Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A0DCCD1AB
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 05:08:22 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.1797.1761109693911170523
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 22:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QnxTkPmH;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso5725221b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 22:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761109693; x=1761714493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VApsIA+qpjEEBCDwAEWDL81w+lF8gkBCZsRIWzKNI+I=;
        b=QnxTkPmHRRB0vz6EY/Nhsd6/iJdk79JDc6OoTKYAy48BvJbHAvn9DgqucPvFQYDDmr
         CvlYIT/d6h1iihy8dCljJVDxeoMGMBQ9tYExQsZbm25LDgoAAzBmRlQsQTfXm6B2LVMa
         NgCOnEpJvnI52kIQDgJjIIkDntTnCDSYL9Rfkd6hBlYqA8mngbPRLFyowDDeNMzwHVfU
         I7p9MRDrviC80s9UlnPB6tngNbAM0MJXyiz4m6T7+Sn5ELVeuNwrIkw/VNF6fuEGXeL8
         tNCoGxREDbwtNFKfErd0m0xgqH9Rmf9neYooKP/f7lb3Jl5ffNcvLOBixcJzfGPgLfHT
         Rk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761109693; x=1761714493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VApsIA+qpjEEBCDwAEWDL81w+lF8gkBCZsRIWzKNI+I=;
        b=JzID/HNNwzumJyNW5mH35YHNwZo5khE0qVBG8EFipxg641Rg4wSn+GByqRLO5XDDmY
         QCmfTu0Rn5PlmsukzQJl7JGVCEjBEypoSaAuldkbcyssHY+8SnovjZlZS0k6w06S4if/
         K7w6bvOKP2tcBJq3am1ae4LAj6spMTpusCg1DyvWUYY0R/olQYKpP90pYZCQGH4URhcl
         NvALhCTNKbT6SQx4OudL8ccQmysWHNLLC+hsGais46B+3l3StN8nAxaMnN5FqepyniZb
         +dszPZt4HQRQtR0Neh85ZeIs1odnZqaappcAtXKOoarX4JyzUjR2RmCwlr9XcKlz+vU5
         CCOg==
X-Gm-Message-State: AOJu0Yy08/zDgnfCJRBVWnUaMkog76MJbgzhCaRAg29E0n4xxgSwMpoN
	4QcETh/BUcKhXmMyzuA+RuTUVFb1O1kna4pek2PAKEb0SdxRb8l3OnrAFHwOly51
X-Gm-Gg: ASbGncvIoZqKYmDLNuhCwrZohaTitdZ+vIsiDc+wdtKg0Cc9QrOmJQybicL8unrR9M5
	fHo5YdwhPWNvIX96WJE6lQKpMCU9CwzU/K2QJMHCiafmrfmrJCnDtNWuF0Wcja2BsiXCkh5X4i7
	pNDv5Jci2kmYqoHjZCjrKDNqmhMVj0XiKH0Om6WZa07+CGT/Nr0/pNUjPkFA6qlJEHADwbQAbVL
	MOUjI0jLTDET1qxUHC92GZ3phnY6Zf44D1mX44Qzeesfay6rXoPv2UyK7yaR5yvVsvWAHALTr/x
	cWH7z5TBCPiEvvHpbVOcTV5sennPaj02dSkgQVsUnvXNv1Ayc7zmyRe0EB/ydVt/6A6yqrY1nOE
	yBg11FozM4ASC5Io+pWHEW5wjmWlmo8wm/JXEb5GsUt8lX5NseTZN7ohu1cPPhOidmuink0XlC0
	d2nTb0xhATbb/r+jeTU7WLriE5E5TzET0EfOZufqPr3ujsEKLJY+Js9w5z/LIGRdilSo1uQDLx
X-Google-Smtp-Source: AGHT+IFIjYhiVmSg7YfwBXxjsnHkFE7wbm45NrQQGFhevF1ctaPUpBfo28OA/E+0mXYXBmNxbTjGww==
X-Received: by 2002:a05:6a00:1884:b0:781:156b:425b with SMTP id d2e1a72fcca58-7a220ae0ff9mr23226870b3a.27.1761109692929;
        Tue, 21 Oct 2025 22:08:12 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::b6ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff157f4sm13328563b3a.6.2025.10.21.22.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 22:08:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/5] libcap: Pass OE defined BUILD_CC and BUILD_LDFLAGS
Date: Tue, 21 Oct 2025 22:08:06 -0700
Message-ID: <20251022050810.1572184-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Oct 2025 05:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225171

This ensures that, native pieces in target builds
are build with correct flags to be able to run on build host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Add-build-ldflags-to-_makenames-rule.patch | 29 +++++++++++++++++++
 meta/recipes-support/libcap/libcap_2.76.bb    |  6 +++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch

diff --git a/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch b/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
new file mode 100644
index 00000000000..10ddf649359
--- /dev/null
+++ b/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
@@ -0,0 +1,29 @@
+From e52d3232882c263f5bd4b1980195ac633d706a53 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 21 Oct 2025 18:27:51 -0700
+Subject: [PATCH] libcap: Add build ldflags to _makenames rule
+
+its calling compiler and linker in single step
+ensure that build ldflags are respected as it
+might have important information like which runtime
+to use.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libcap/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcap/Makefile b/libcap/Makefile
+index e90a950..f0eb87e 100644
+--- a/libcap/Makefile
++++ b/libcap/Makefile
+@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
+ 		$< >$@
+
+ _makenames: _makenames.c cap_names.list.h
+-	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
++	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
+
+ cap_names.h: _makenames
+ 	./_makenames > cap_names.h
diff --git a/meta/recipes-support/libcap/libcap_2.76.bb b/meta/recipes-support/libcap/libcap_2.76.bb
index c842246fc09..27093ff3e72 100644
--- a/meta/recipes-support/libcap/libcap_2.76.bb
+++ b/meta/recipes-support/libcap/libcap_2.76.bb
@@ -12,7 +12,9 @@ LIC_FILES_CHKSUM = "file://License;md5=2965a646645b72ecee859b43c592dcaa \
 
 DEPENDS = "hostperl-runtime-native gperf-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
+           file://0001-libcap-Add-build-ldflags-to-_makenames-rule.patch \
+		   "
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
@@ -37,6 +39,8 @@ EXTRA_OEMAKE = " \
 do_compile() {
 	oe_runmake \
 		AR="${AR}" \
+		BUILD_CC="${BUILD_CC}" \
+		BUILD_LDFLAGS="${BUILD_LDFLAGS}" \
 		CC="${CC}" \
 		RANLIB="${RANLIB}" \
 		OBJCOPY="${OBJCOPY}"

