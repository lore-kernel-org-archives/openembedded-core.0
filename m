Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53032C6FA82
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 02:23:39 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.1960.1663727016061141755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:23:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i06xdbY+;
 spf=pass (domain: gmail.com, ip: 209.85.210.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id b23so4489402pfp.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 19:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=jCFILOADSXgqhSfMEaDSS70IA/gT9TTzcroX0Tdzvo8=;
        b=i06xdbY+8JFDswCu+2EGBMDwqnq7Vkc75iNKCEIvbJRwCnavrHu63kQfgDNiHEVoo4
         jn3dHE7a+w/bQ6wcC7MuLuO0mRhxBjfxZGHReozKc+GhmitUDlLPO+2rM8G2+fN+YBqs
         8fa+bcVmoPpBKZ/HvCWtArr0bii9+Y5iosXKVCnnHUj/MHuerv2QCs0584fu7XDtpZgf
         kEATJ6fitdB6t+7C3JV4lBVUsOEOz8/Lk6L4bivUEP2O98XVrhQyCbGatGidbnYQ8BlX
         3BkHdck1lA2EBHV3Q/7erxaG4WE/n7ChL17i22s6vc+qCLLLSFualX/r4+uGwoDaW4XJ
         VAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=jCFILOADSXgqhSfMEaDSS70IA/gT9TTzcroX0Tdzvo8=;
        b=HOGh0zlos69Q4Jn52dUpbMqDV8TXOxT4pB5aJBvnoXN2pnD8XK1egIdMBfO6odh377
         nsz6WJe8L34tUoBXeif9DJbeCvabzc5CFkUjRXnQluhV3hmV83IZcbC3dqvX+3AUFx9q
         IpLFpecx/H5kXUYygz80Pg2JRAzr8wQKppWALH9RRGBvSBlzRXZeGcaoTARRvgK+khYA
         toctA3kbHhHtaldWb+38sdmM6FKm/KujQ8Kh5XrjLCqdrSm342KKfDoFRU1wrgEAGVP/
         QINzR4qwlniQzsbgLizZPlUgDQcxCsHgnqjNH38C3pnhm0+BJcaTJC/ijPCSY+MIyLKx
         XKFA==
X-Gm-Message-State: ACrzQf1TVIroWfy28ye/XvP5j2JxBaRvgbh2p8mpvIBEaP+5zjkvytnt
	lpebsYM0OCJ1Jxt/TtnKhpVXk45qW3boBQ==
X-Google-Smtp-Source: 
 AMsMyM5FPhcw2cp18x4MRoPBGvyLSkZduYPV4Lf3gDjjk5HM+S7GVuxc0EtrMiAlWmQCUUKX/cW/Fw==
X-Received: by 2002:a65:5683:0:b0:41c:b103:6037 with SMTP id
 v3-20020a655683000000b0041cb1036037mr22538008pgs.367.1663727015143;
        Tue, 20 Sep 2022 19:23:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 a5-20020aa795a5000000b0054095e1b2e5sm620145pfk.215.2022.09.20.19.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 19:23:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] gcompat: Add __getauxval wrapper needed on aarch64
Date: Tue, 20 Sep 2022 19:23:32 -0700
Message-Id: <20220921022332.3890912-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 02:23:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170917

Update SRCREV to bring in few bug fixes
Install a .so symlink which could be used during linking

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Symlink should point to base_libdir not libdir

 .../musl/gcompat/0001-auxv-new-module.patch   | 59 +++++++++++++++++++
 meta/recipes-core/musl/gcompat_git.bb         |  6 +-
 2 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/musl/gcompat/0001-auxv-new-module.patch

diff --git a/meta/recipes-core/musl/gcompat/0001-auxv-new-module.patch b/meta/recipes-core/musl/gcompat/0001-auxv-new-module.patch
new file mode 100644
index 0000000000..ee292f3841
--- /dev/null
+++ b/meta/recipes-core/musl/gcompat/0001-auxv-new-module.patch
@@ -0,0 +1,59 @@
+From aecd42801904462501a890d173648e4e826eda19 Mon Sep 17 00:00:00 2001
+From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
+Date: Sat, 23 Oct 2021 23:29:40 -0500
+Subject: [PATCH] auxv: new module
+
+Adds `__getauxval` wrapper, needed for Parallels Tools GUI installer.
+
+Upstream-Status: Submitted [https://git.adelielinux.org/adelie/gcompat/-/commit/e860a38a88c7ea148ee15976136a1f83ea13f8e0]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CHANGELOG.rst     | 5 +++++
+ Makefile          | 1 +
+ libgcompat/auxv.c | 6 ++++++
+ 3 files changed, 12 insertions(+)
+ create mode 100644 libgcompat/auxv.c
+
+diff --git a/CHANGELOG.rst b/CHANGELOG.rst
+index ce6859b..c3a9cee 100644
+--- a/CHANGELOG.rst
++++ b/CHANGELOG.rst
+@@ -11,6 +11,11 @@
+ 1.1 (202?-??-??)
+ ================
+ 
++auxv
++----
++
++* Add __getauxval wrapper for getauxval.
++
+ locale
+ ------
+ 
+diff --git a/Makefile b/Makefile
+index cbb7634..1893cc1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,6 +2,7 @@ LIBGCOMPAT_INCLUDE = \
+ 	libgcompat/alias.h \
+ 	libgcompat/internal.h
+ LIBGCOMPAT_SRC = \
++	libgcompat/auxv.c		\
+ 	libgcompat/ctype.c		\
+ 	libgcompat/cxx_thread.c		\
+ 	libgcompat/dlfcn.c		\
+diff --git a/libgcompat/auxv.c b/libgcompat/auxv.c
+new file mode 100644
+index 0000000..01de376
+--- /dev/null
++++ b/libgcompat/auxv.c
+@@ -0,0 +1,6 @@
++#include <sys/auxv.h> /* getauxval */
++
++unsigned long __getauxval(unsigned long value)
++{
++	return getauxval(value);
++}
+-- 
+2.37.3
+
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index b051e43b6c..773263809b 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -8,12 +8,13 @@ LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb33ef4af05a9c7602843afb7adfe792"
 
 SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current \
-          "
+           file://0001-auxv-new-module.patch \
+           "
 SRC_URI:append:powerpc = "\
            file://0001-make-Static-PIE-does-not-work-on-musl-ppc.patch \
            "
 PV = "1.0.0+1.1+git${SRCPV}"
-SRCREV = "4d6a5156a6eb7f56b30d93853a872e36dadde81b"
+SRCREV = "c6921a1aa454bb87671f9bd1ecfe47d80d1620aa"
 
 S = "${WORKDIR}/git"
 
@@ -42,6 +43,7 @@ do_install () {
 		install -d ${D}${nonarch_base_libdir}${SITEINFO_BITS}
 		ln -rs ${D}${GLIBC_LDSO} ${D}${nonarch_base_libdir}${SITEINFO_BITS}/`basename ${GLIBC_LDSO}`
 	fi
+	ln -sf ${base_libdir}/libgcompat.so.0 ${D}${libdir}/libgcompat.so
 }
 
 FILES:${PN} += "${nonarch_base_libdir}${SITEINFO_BITS}"
-- 
2.37.3


