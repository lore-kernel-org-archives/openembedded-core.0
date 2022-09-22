Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78F7C32771
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 00:08:32 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.1722.1663805309848477596
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 17:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LE9xob4k;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id go6so8128181pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 17:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=avSrKMeR0qefQHnSWz+KrIKCZ6h5H6ZiNVLa3q/1DYs=;
        b=LE9xob4kl1EtRyauhaMmKkBWAQZIyvIcEoIPUPUvzYzP4xc5jyZU0sgVKQscY9CYxk
         ByEzCabDuQK0qjbAlts5Bby78EPSrcgzaeH/ijG29DcQh1VCTlJGDXimLWg9byJ070Nf
         V4rbk1+Ntn7mtW5F7EZIb7Iyo/2/Xa2QX2onMcRpfJHStnyMTx40JJ8+hcIagarRmLzz
         slhp7zhHF1U/6Ss8qpplytEVtncVJr+C/x0mQCqGgOiGwWJe5+RXmwgXGF61LcKe2FIu
         55qjp2eZNhIEdJMcMD9juq/nWDem1nKtY7U66Ad+cOFHjXBQl28BcC37pQJOTnmvWw/d
         dStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=avSrKMeR0qefQHnSWz+KrIKCZ6h5H6ZiNVLa3q/1DYs=;
        b=kSsm1QL0EKifN3tsqwqgfgsfkUh2REgONRCzkV7t8FINupVqDrtWlO569OYVoVXDlc
         Mlw8JcCXmIh6VwA4MCdb+t38aVxrEppVJcZL+A4OJTEDL3a1ilvPVeuf5bvRkaHco9qB
         4JFR5b4CUI3Kct7Y5dA+w70FmtrlaWClykSuupK7OQ/xiwDZnq84/XXrFGHwc4hyDsCH
         98dpnGP7KeaLxxWcmc8+RR5MXJSQJxK2elC6Znyql9BLL3UUMFjoa7QveAfRSNeoNvZH
         cCqS74YsdR91mj1lxPsBdD7cHkh5cnHvRQgO87CE4TtRgckgfSfw87XfqhiP2B8mCdes
         wUYQ==
X-Gm-Message-State: ACrzQf07CrLNm2SZULJzj9TcmpWxPKiAarGIDvub3KVYIHT58BvJJwos
	oaVQZnStvAB48b6hDpRzws/SwluKI5F8Ag==
X-Google-Smtp-Source: 
 AMsMyM7TX+9r6aRrK9NawOPA3FtyPIVzb+sNq1hjvzmmDxFmRq9JPOHPdUw6yt/udRcnvAXDcGCLzg==
X-Received: by 2002:a17:902:d0d2:b0:178:1047:1cce with SMTP id
 n18-20020a170902d0d200b0017810471ccemr669199pln.150.1663805308826;
        Wed, 21 Sep 2022 17:08:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::7ab3])
        by smtp.gmail.com with ESMTPSA id
 b15-20020a63d30f000000b004393cb720afsm2517475pgg.38.2022.09.21.17.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 17:08:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3] gcompat: Add __getauxval wrapper needed on aarch64
Date: Wed, 21 Sep 2022 17:08:25 -0700
Message-Id: <20220922000825.3106255-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 00:08:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170962

Update SRCREV to bring in few bug fixes
Install a .so symlink which could be used during linking

install libdir to create if not existing

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Symlink should point to base_libdir not libdir
v3: Create libdir as it might not be created always

 .../musl/gcompat/0001-auxv-new-module.patch   | 59 +++++++++++++++++++
 meta/recipes-core/musl/gcompat_git.bb         |  7 ++-
 2 files changed, 64 insertions(+), 2 deletions(-)
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
index b051e43b6c..11f3c58769 100644
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
 
@@ -42,6 +43,8 @@ do_install () {
 		install -d ${D}${nonarch_base_libdir}${SITEINFO_BITS}
 		ln -rs ${D}${GLIBC_LDSO} ${D}${nonarch_base_libdir}${SITEINFO_BITS}/`basename ${GLIBC_LDSO}`
 	fi
+	install -d ${D}${libdir}
+	ln -sf ${base_libdir}/libgcompat.so.0 ${D}${libdir}/libgcompat.so
 }
 
 FILES:${PN} += "${nonarch_base_libdir}${SITEINFO_BITS}"
-- 
2.37.3


