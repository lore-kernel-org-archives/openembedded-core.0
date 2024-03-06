Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E1FC54E6E
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 15:42:21 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.15027.1709739735139976751
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 07:42:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJ7etM3l;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso185783566b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 07:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709739733; x=1710344533; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNCA831zAASFiHskaCKSFg/w5TnXoD38oX7uwOefUt0=;
        b=OJ7etM3lFPItc0QpXBSjDfIFDJDdxCNDMvbWI8eXPX+rEJWIjbbZotUePHnmguiLgX
         m7cszyetg7eihVsvES8sdtthllmbYU/loe7JRVRjYqsDZ/kzcXRnZAWw9fpLEKPwe6Yh
         CBckE/ml9yhpY4wTvDaLzD20KLq4W4J8sYq4BiGAQ8GqCKB1WcEOFpj0ew2v9y1tXCGT
         4l4oZHEA31RBmwzPYfr7LtR4NeNg4/GukqzwuYQvwxjsRJldg+ZGIefRNY5I47B3UmL0
         xu+lq7wSn3w/pLUi7r5CYR7zC/k/aQ3DHY+8SvZr6HSK2uk7DbEGUDXdomdt5J5ZKXyV
         mr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709739733; x=1710344533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNCA831zAASFiHskaCKSFg/w5TnXoD38oX7uwOefUt0=;
        b=sfmq/0awgqMAN/Pz3qPRV9+wkq+qSMme4sMLMA1egw5siB7MKgb6rk5aETLkxJ847J
         Yo1UT6FaWGfrUqBQKENuYLaCkmgyTKCSgPnqPNE39lR+8P5ob6MMZwVzuxhjzI7O8unb
         fAn1s72uQB9lWPwZ0rycB0YCA2o7QEmfRbXOGe8QrKJh7qvTHRGbpkpoZ5neIhZa9Kmz
         n/MxRFEQzyiHL4hgD1SGs4D8gf4R5sGh5iRDiB5UJ+pqfW3C3PelOvNgbDJYM6Qleeh+
         5QNNohvn1lA5oAH4v9NWU2dofNE3X54+7c5IUpb+QQ7MVqSe1/6DOWb8vSV0QTJ5GWRl
         88iA==
X-Gm-Message-State: AOJu0Yznb+PJp2NBFHmZHB6emyprltPTSFP2EWWAQv5hO3lErtWKyc62
	WWhZoF9G7EkoeB6ORh6qJ8lihUR3pBgNeRmPI2S3kcG7yCIPyBu/ogmVv8YS
X-Google-Smtp-Source: AGHT+IFjJ3OB+gFX0JpH7uAtsWLm+bfnCX9VLxwAmlXjMfSPKsm80TStxA2GXiQZilX3RBjTyTdLCg==
X-Received: by 2002:a17:906:2b49:b0:a45:b616:29fc with SMTP id b9-20020a1709062b4900b00a45b61629fcmr2608243ejg.0.1709739733489;
        Wed, 06 Mar 2024 07:42:13 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm7209343ejj.84.2024.03.06.07.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 07:42:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 24/47] lsof: upgrade 4.98.0 -> 4.99.3
Date: Wed,  6 Mar 2024 16:41:28 +0100
Message-Id: <20240306154151.3741709-24-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240306154151.3741709-1-alex@linutronix.de>
References: <20240306154151.3741709-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196707

Convert from handcrafted makefiles to autotools (added in 4.97.0).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../lsof/files/remove-host-information.patch  | 44 +++++++++++++++--
 meta/recipes-extended/lsof/lsof_4.98.0.bb     | 48 -------------------
 meta/recipes-extended/lsof/lsof_4.99.3.bb     | 23 +++++++++
 3 files changed, 63 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-extended/lsof/lsof_4.98.0.bb
 create mode 100644 meta/recipes-extended/lsof/lsof_4.99.3.bb

diff --git a/meta/recipes-extended/lsof/files/remove-host-information.patch b/meta/recipes-extended/lsof/files/remove-host-information.patch
index fb90366ffa3..1f2b4afa695 100644
--- a/meta/recipes-extended/lsof/files/remove-host-information.patch
+++ b/meta/recipes-extended/lsof/files/remove-host-information.patch
@@ -1,14 +1,50 @@
+From 4f05492ac07a7bbaf06dd8265b9cba329e1b53e9 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Wed, 30 Aug 2017 15:05:16 +0800
+Subject: [PATCH] lsof: remove host information from version.h
+
 lsof doesn't embed the username or hostname in the build if SOURCE_DATE_EPOCH is
 defined, but this still embeds build paths.  Delete all of the host details to
 ensure that no host information is leaked into the binary.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ autotools/version.h.in      | 16 ++++-----
+ lib/dialects/linux/Makefile | 69 ++++++-------------------------------
+ 2 files changed, 19 insertions(+), 66 deletions(-)
 
-diff --git a/dialects/linux/Makefile b/dialects/linux/Makefile
-index 176a4c2..ef5a633 100644
---- a/dialects/linux/Makefile
-+++ b/dialects/linux/Makefile
+diff --git a/autotools/version.h.in b/autotools/version.h.in
+index aac0b80..2e635a5 100644
+--- a/autotools/version.h.in
++++ b/autotools/version.h.in
+@@ -37,13 +37,13 @@
+ 
+ #include "config.h"
+ #define LSOF_VERSION PACKAGE_VERSION
+-#define LSOF_HOST "@host@"
+-#define LSOF_LOGNAME "@logname@"
+-#define LSOF_USER "@user@"
+-#define LSOF_CC "@cc@"
+-#define LSOF_CCV "@ccv@"
+-#define LSOF_CCFLAGS "@ccflags@"
+-#define LSOF_LDFLAGS "@ldflags@"
+-#define LSOF_SYSINFO "@sysinfo@"
++#define LSOF_HOST ""
++#define LSOF_LOGNAME ""
++#define LSOF_USER ""
++#define LSOF_CC ""
++#define LSOF_CCV ""
++#define LSOF_CCFLAGS ""
++#define LSOF_LDFLAGS ""
++#define LSOF_SYSINFO ""
+ 
+ #endif
+diff --git a/lib/dialects/linux/Makefile b/lib/dialects/linux/Makefile
+index f8adaa6..7a79ca7 100644
+--- a/lib/dialects/linux/Makefile
++++ b/lib/dialects/linux/Makefile
 @@ -83,64 +83,17 @@ ${LIB}: FRC
  version.h:	FRC
  	@echo Constructing version.h
diff --git a/meta/recipes-extended/lsof/lsof_4.98.0.bb b/meta/recipes-extended/lsof/lsof_4.98.0.bb
deleted file mode 100644
index 835ce3b8dfc..00000000000
--- a/meta/recipes-extended/lsof/lsof_4.98.0.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "LiSt Open Files tool"
-DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
-Its name stands for LiSt Open Files, and it does just that."
-HOMEPAGE = "http://people.freebsd.org/~abe/"
-SECTION = "devel"
-LICENSE = "Spencer-94"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
-
-SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
-           file://remove-host-information.patch"
-SRCREV = "546eb1c9910e7c137fdff551683c35a736021e05"
-
-S = "${WORKDIR}/git"
-
-
-inherit update-alternatives
-
-ALTERNATIVE:${PN} = "lsof"
-ALTERNATIVE_LINK_NAME[lsof] = "${sbindir}/lsof"
-# Make our priority higher than busybox
-ALTERNATIVE_PRIORITY = "100"
-
-
-export LSOF_INCLUDE = "${STAGING_INCDIR}"
-
-do_configure () {
-	export LSOF_AR="${AR} cr"
-	export LSOF_RANLIB="${RANLIB}"
-	if [ "x${GLIBCVERSION}" != "x" ]; then
-		LINUX_CLIB=`echo ${GLIBCVERSION} |sed -e 's,\.,,g'`
-		LINUX_CLIB="-DGLIBCV=${LINUX_CLIB}"
-		export LINUX_CLIB
-	fi
-	yes | ./Configure linux
-}
-
-export I = "${STAGING_INCDIR}"
-export L = "${STAGING_INCDIR}"
-
-do_compile () {
-	oe_runmake 'CC=${CC}' 'CFGL=${LDFLAGS} -L./lib -llsof' 'DEBUG=' 'INCL=${CFLAGS} -I..'
-}
-
-do_install () {
-	install -d ${D}${sbindir} ${D}${mandir}/man8
-	install -m 0755 lsof ${D}${sbindir}/lsof
-	install -m 0644 Lsof.8 ${D}${mandir}/man8/lsof.8
-}
diff --git a/meta/recipes-extended/lsof/lsof_4.99.3.bb b/meta/recipes-extended/lsof/lsof_4.99.3.bb
new file mode 100644
index 00000000000..93e91fb4279
--- /dev/null
+++ b/meta/recipes-extended/lsof/lsof_4.99.3.bb
@@ -0,0 +1,23 @@
+SUMMARY = "LiSt Open Files tool"
+DESCRIPTION = "Lsof is a Unix-specific diagnostic tool. \
+Its name stands for LiSt Open Files, and it does just that."
+HOMEPAGE = "http://people.freebsd.org/~abe/"
+SECTION = "devel"
+LICENSE = "Spencer-94"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a48ac97a8550eff12395a2c0d6151510"
+
+SRC_URI = "git://github.com/lsof-org/lsof;branch=master;protocol=https \
+           file://remove-host-information.patch"
+SRCREV = "2e4c7a1a9bc7258dc5b6a3ab28ebca44174279a8"
+
+S = "${WORKDIR}/git"
+
+inherit update-alternatives autotools pkgconfig manpages
+PACKAGECONFIG[manpages] = ""
+
+DEPENDS += "groff-native"
+
+ALTERNATIVE:${PN} = "lsof"
+ALTERNATIVE_LINK_NAME[lsof] = "${bindir}/lsof"
+# Make our priority higher than busybox
+ALTERNATIVE_PRIORITY = "100"
-- 
2.39.2


