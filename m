Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C8FC001DC
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 07:43:18 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.2485.1690443794785291718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 00:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=C53U/3q4;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: zboszor@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-348d333e441so2269835ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 00:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690443793; x=1691048593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9tBl1v7nCHtNgvNfpEpI5T3anUx080vvcPgKSlO63nw=;
        b=C53U/3q4pHxeP5yOwTifSsPbJnSFYpPby63wRsjqN/+dT9VCJaVEdSVgnDv92FR9a0
         qwhALDXODiLBlQcoPfgML6AC6PsaxaD7keq3Th2OZwq0gqYQddasQerBVk9T+8KWb6la
         buxhSPg2JK9PpE6LNCRRFh+uij4w8PgiEx8iiYwSmoQILZFVKnxbqkFDl+1Q6eOpX1QZ
         p/zDaaVvAdmajch4t6F/rKCQ/YsycfKlia+kQGAjFHNqHretG31DrCRiGQfHptA96EsD
         shnQcrDLZsTNq/Coq5LrZ2QmHbwHVZNEyHS9OBhKWBjrtlG+y3bw5dGhW3CF5KL/eYDz
         VLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690443793; x=1691048593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9tBl1v7nCHtNgvNfpEpI5T3anUx080vvcPgKSlO63nw=;
        b=D2COxtVWexCT6ImAFxABXGNFXffVPErnNwPG9kTehzyu5/2zVhC+WG2GQtFpjDwhfE
         kxCDpp2phEl0u8X7WPKvxOjUeDzWcoHKhVScKwdAtGvnxCxsnTdk2VkPeISiJpdxl5lB
         iNlWNi1/RqheURxoPBy7QOD64ymC6F00BEuiVEGEHpTdGpmzVX7xg7EArmGTJu2GvTLi
         6SA86yJccGXUXiB8cEslivRp2/8ZFrl5DrA1ZbQ6nK/ou32a1af4EGruxSBe6vguhVa5
         piAePc23qJ8ZPRy/WY3Oy4xwuOWFwMv1eCrlfA20u4+94nY+r/D/xEsDPY8RNb5aK9oF
         8tfg==
X-Gm-Message-State: ABy/qLbH59urncqxN2QmNzUSOe0NlqEbDhuGFZSwAubsBoYgSpFkS49N
	JQ6iKhqs2xUujt6WZp8gbFypGr1dEn/XcA==
X-Google-Smtp-Source: APBJJlHQQ0mQ/ytrsDWp8jTC0MStXlsDN+brHa2EWIr5SIf3yQPeXN6Juz6bNuuRLVYIcfUpA+euUg==
X-Received: by 2002:a05:6e02:170d:b0:348:8566:be66 with SMTP id u13-20020a056e02170d00b003488566be66mr5184678ill.18.1690443793520;
        Thu, 27 Jul 2023 00:43:13 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id z3-20020a92bf03000000b00348e9aa50c8sm329797ilh.60.2023.07.27.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 00:43:13 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3] rpm: Allow setting platform macro settings externally
Date: Thu, 27 Jul 2023 09:43:07 +0200
Message-ID: <20230727074307.50192-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 07:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184916

Feed platform settings to installplatform externally. Based on the patch
submitted under https://github.com/rpm-software-management/rpm/pull/2585

Patch against INSTALL was backported for rpm 4.18.1

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...g-platform-macro-settings-externally.patch | 107 ++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  20 ++++
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally.patch b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally.patch
new file mode 100644
index 0000000000..86d357a4e8
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Allow-setting-platform-macro-settings-externally.patch
@@ -0,0 +1,107 @@
+From 12ae0bf5d1540695af0a3499fc88698c48bc20d3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Tue, 25 Jul 2023 10:56:44 +0200
+Subject: [PATCH] Allow setting platform macro settings externally
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+By default, rpm installs a series of default platforms based on
+the CPU architecture names in subdirectories called
+
+    /usr/lib/platform/<arch>-linux
+
+This is enough for regular Linux distributions. However, some
+distributions may use more specific platform names that refer to
+particular computer systems, like SBCs or specific CPU tuning when
+compiling.
+
+If the platform subdirectory does not exist in /usr/lib/platform
+then rpmbuild does not work.
+
+Allow creating such custom platform subdirectory with feeding
+the necessary data using external variables: RPM_CUSTOM_ARCH,
+RPM_CUSTOM_ISANAME, RPM_CUSTOM_ISABITS, RPM_CUSTOM_CANONARCH
+and RPM_CUSTOM_CANONCOLOR
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/2585]
+---
+ INSTALL         | 32 ++++++++++++++++++++++++++++++++
+ installplatform |  9 ++++++++-
+ 2 files changed, 40 insertions(+), 1 deletion(-)
+
+diff --git a/INSTALL b/INSTALL
+index 13d0d8a83..35ad10793 100644
+--- a/INSTALL
++++ b/INSTALL
+@@ -148,6 +148,38 @@ and then install with:
+ 
+     make install
+ 
++By default, rpm installs a series of default platforms based on the CPU
++architecture names in subdirectories called
++
++    /usr/lib/platform/<arch>-linux
++
++This is enough for regular Linux distributions. However, some distributions
++may use more specific platform names that refer to particular computer
++systems, like SBCs or specific CPU tuning when compiling. Examples of such
++platform names are: "genericx86_64", "intel_skylake_64", "raspberrypi_armv7",
++"raspberrypi_armv8", etc.
++
++If the platform name is put into /etc/rpm/platform, then rpmbuild uses it
++and the only macros file rpmbuild looks for is
++
++    /usr/lib/platform/`cat /etc/rpm/platform`-linux/macros
++
++If this file does not exist, many rpm macros will not have their expected
++values set and e.g. %configure will fail when trying to run rpmbuild.
++
++To allow creating the macros file for such a custom platform, the shell
++variables listed below must be set. If RPM_CUSTOM_ARCH is not set, the rest
++is ignored.
++
++    export RPM_CUSTOM_ARCH=genericx86_64
++    export RPM_CUSTOM_ISANAME=x86
++    export RPM_CUSTOM_ISABITS=64
++    export RPM_CUSTOM_CANONARCH=x86_64
++    export RPM_CUSTOM_CANONCOLOR=0 # to use /usr/lib for %_libdir
++    export RPM_CUSTOM_CANONCOLOR=3 # to use /usr/lib64 for %_libdir
++
++    make install # this also installs /usr/lib/platform/genericx86_64-linux/macros
++
+ Rpm comes with an automated self-test suite. The test-suite relies heavily
+ on fakechroot (https://github.com/dex4er/fakechroot/) and cannot be executed
+ without it. Provided that fakechroot was found during configure,
+diff --git a/installplatform b/installplatform
+index a5ad7c5b8..59f57697b 100755
+--- a/installplatform
++++ b/installplatform
+@@ -11,7 +11,7 @@ VENDOR="${4}"
+ OS="${5}"
+ RPMRC_GNU="${6}"
+ 
+-for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
++for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2` ${RPM_CUSTOM_ARCH:+custom}; do
+   RPMRC_OPTFLAGS="`sed -n 's/^optflags: '$ARCH' //p' $RPMRC`"
+   RPMRC_OPTFLAGS="`echo $RPMRC_OPTFLAGS | sed -e 's, ,\ ,g'`"
+   case $RPMRC_OPTFLAGS in
+@@ -30,6 +30,13 @@ for ARCH in noarch `grep ^arch_canon $RPMRC | cut -d: -f2`; do
+   CANONCOLOR=
+   FILTER=cat
+   case "${ARCH}" in
++    custom)
++	ARCH=$RPM_CUSTOM_ARCH
++	ISANAME=$RPM_CUSTOM_ISANAME
++	ISABITS=$RPM_CUSTOM_ISABITS
++	CANONARCH=$RPM_CUSTOM_CANONARCH
++	CANONCOLOR=$RPM_CUSTOM_CANONCOLOR
++    ;;
+     sparc64*) 
+ 	ISANAME=sparc
+ 	ISABITS=64
+-- 
+2.41.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 95a9e92f96..97dd843e56 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -40,6 +40,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
            file://fix-declaration.patch \
            file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
+           file://0001-Allow-setting-platform-macro-settings-externally.patch \
            "
 
 PE = "1"
@@ -128,10 +129,29 @@ do_install:append:class-nativesdk() {
 	EOF
 }
 
+def rpm_isaname(d):
+    import re
+    arch = d.getVar('TARGET_ARCH')
+    if re.match("^i.86$", arch) or re.match("^x86.*64$", arch):
+        return "x86"
+    # Add more platform tweaks for ISANAME as needed
+    return arch
+
+# Add the custom BSP platform "macros" file
+do_install:prepend:class-target() {
+    export RPM_CUSTOM_ARCH = "${MACHINE_ARCH}"
+    export RPM_CUSTOM_ISANAME = "${@rpm_isaname(d)}"
+    export RPM_CUSTOM_ISABITS = "${SITEINFO_BITS}"
+    export RPM_CUSTOM_CANONARCH = "${TARGET_ARCH}"
+    # CANONCOLOR determines whether /usr/lib or /usr/lib64 is used for a 64-bit platform
+    export RPM_CUSTOM_CANONCOLOR = "${@bb.utils.contains('DISTRO_FEATURES', 'multilib', '3', '0', d)}"
+}
+
 # Rpm's make install creates var/tmp which clashes with base-files packaging
 do_install:append:class-target() {
     rm -rf ${D}/var
 }
+
 do_install:append:class-nativesdk() {
     rm -rf ${D}${SDKPATHNATIVE}/var
     # Ensure find-debuginfo is located correctly inside SDK
-- 
2.41.0


