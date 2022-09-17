Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C5AC6FA82
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 21:13:46 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.2823.1663449223361619332
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 14:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nJ2fqWP2;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id u132so24490974pfc.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 14:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=W8sHtOPIfJeUDC3y5GU67lQFCJ3tLNEjLXfrSnjKw6A=;
        b=nJ2fqWP2dW5K9/h4gzBZrnH2ahRi1flj3NzAPGtmRR76S9mbxf8Q9wb4pGx7aw11Eg
         qplmC94KZMfWTtwJ71df2OLjsnQRMz7X2qISkkW917t6N9NsTULET1Su2WZlrOqmQN0h
         ZOR7YCfpCcpsSSdFdQhCthUhm0zfYy2C9EjCx4dRNNRcwARHhIA7xeihMMfP/jtAwHME
         HFluYWoTemSmvJmidLo3ugY+r6B76fHulm7LBhJY2EjO/nY7RLfbklPAvQrT1S8eCtKU
         Fj4INQi/sz08ozPJpUlGzVMjiFza5NIDXiSMDJw1bpdQ6KcUy802Mlu/+DsnsiIl35sM
         EFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=W8sHtOPIfJeUDC3y5GU67lQFCJ3tLNEjLXfrSnjKw6A=;
        b=jhfJCk0R8mafx25k8zJYFtFwNHZwOFaeHQ/gilvL3eoD+J5w4r0T6u1x6jN2/QLiy1
         TSeWAjeYg5695cH6BSTqmc5EWqSN/t0t5bX/5rsXl/Xv22iaKW+4vgrPQPcDe+wfNAoj
         9uETGmRogxMl5Yan2jVexAI2O08yB/AsHeVFT7YomNgLiVDdQP5OiVp9muX8O05WK4h+
         xTEZ3BmwAOIIHiUVcOpj2T6/htwnvIpT5yzXBfNW5HThKMiYvUxDUqWBI9cYU2v3G+OK
         UyH7t8ra31kK4GAeT5AVL3fGOsBrtepwSmtxRWhmGtPAukwtio8dzVcPZfNwY4qjvOD8
         6XYw==
X-Gm-Message-State: ACrzQf2wV+Bc88yYZg7Z5svJkNYqJXfKgMBKJAVlYODhtF271+5LJAH9
	EC2qV0Zxa31RBMQ+b+zoKLCKgSuWi07Ghw==
X-Google-Smtp-Source: 
 AMsMyM6iryB4EozDqPyMo6T3aa3XAl5F5jLO27oP1Doa2HEZgc1xpXfJ2kQ+I6L36Y1snP/t/BuCBA==
X-Received: by 2002:a63:8043:0:b0:434:fe8f:6cd0 with SMTP id
 j64-20020a638043000000b00434fe8f6cd0mr9989178pgd.115.1663449222360;
        Sat, 17 Sep 2022 14:13:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 w63-20020a623042000000b00528a097aeffsm16638649pfw.118.2022.09.17.14.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 14:13:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gcompat: Add __getauxval wrapper needed on aarch64
Date: Sat, 17 Sep 2022 14:13:39 -0700
Message-Id: <20220917211339.2536726-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 21:13:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170841

Update SRCREV to bring in few bug fixes
Install a .so symlink which could be used during linking

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
index b051e43b6c..ffdb11a190 100644
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
+        ln -sf libgcompat.so.0 ${D}${libdir}/libgcompat.so
 }
 
 FILES:${PN} += "${nonarch_base_libdir}${SITEINFO_BITS}"
-- 
2.37.3


