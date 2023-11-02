Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A729EC41535
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 19:03:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.40647.1698951789545699531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 12:03:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R7YyKsIZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6b497c8575aso1382844b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698951789; x=1699556589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=em24aUAaOVPt4M10xNMsSnRJEwjg7XM3UGnI9+AsVVo=;
        b=R7YyKsIZV4uXpVnN8hNug4oLyDCYYCshNmQEV+ouK6pQ6erlQzjG/2WEWGKoV6dte5
         XbmEYTSEbNrReUee/jdG+XRbHVv7Lh847cumbg6G4eljTZEEt+5RxFxeiC9lbOgnPD5C
         eDzxIn/tcG9wlV5nygW19jJYyw6tCJm0/8Puo9V/8D4GjFE8PnQ9VY5x3ivlgN7xtzQe
         lqi0XZ4wxLAKxFyVVUgFn4gCoYp473DVI5EOL6ysiZAVAZgALa+Uao+pByWAanlzSv11
         jxOYzRkHeUhN4noZlnQuM7E0UYyUQXtUKzyG8zTg3TOIlvxSohC7ucmIh+ebkGZ+VZ72
         5zWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698951789; x=1699556589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=em24aUAaOVPt4M10xNMsSnRJEwjg7XM3UGnI9+AsVVo=;
        b=Z/6GL5gBKYCcge7BeyBP2tlDV77RhVPWCFIS46Quz/5N4cfyVAVrNcG06evqrUWoR8
         HK32KpUVmtQUaXqzU4Mme+BZhzx7c0DbsKjCMaK8pyDD8dYOvWEoD4o6dmahEScu0LKi
         Rz3hbkmnFg6ouhJ9Uh5LnT9YSorgaVc3B02sBEMePA200q6ZsRaYsuGxnsaG6kfWUZKw
         BdATQyR/p0vHgzKWA0v7Zm503ekpcoF7wT0pEWORkUP2SsH+ud9xYrLISCpzaP/yGgPV
         0O3Dj1cex0Y1j+hIRy5h7SOsSZoKPzU3Mtp3YHiBbt1Lepr54y8TVSrGvfDnpDThzmWZ
         z0tQ==
X-Gm-Message-State: AOJu0YyjtKq9iTdh6HZQ9rBYig+wRRWQOweEXyu9b3Sk1S+koOklJaqy
	cj/2HiaIIUFDD52uVXjuEQGNOZmWg1zXzQ==
X-Google-Smtp-Source: AGHT+IELL3M9d6URhBEUlUBEwJnGzaXrFoUGC9/F5Vt4u84PxO+ndzxbiDSuY6cdEGTwQQXOQoIi/w==
X-Received: by 2002:a05:6a00:158f:b0:690:fe13:1d28 with SMTP id u15-20020a056a00158f00b00690fe131d28mr23774455pfk.33.1698951788653;
        Thu, 02 Nov 2023 12:03:08 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::46eb])
        by smtp.gmail.com with ESMTPSA id m5-20020a62f205000000b006c0678eab2csm100636pfh.90.2023.11.02.12.03.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 12:03:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] cdrtools: Fix build on riscv64
Date: Thu,  2 Nov 2023 12:02:57 -0700
Message-ID: <a139f91089a05d964c4fb8b8014f3dc787d10cc5.1698951553.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1698951553.git.raj.khem@gmail.com>
References: <cover.1698951553.git.raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 19:03:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190097

Copy riscv64 gcc config from schilytools

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../cdrtools/cdrtools-native_3.01.bb          |  9 +++
 .../cdrtools/cdrtools/riscv64-linux-gcc.rul   | 65 +++++++++++++++++++
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/cdrtools/cdrtools/riscv64-linux-gcc.rul

diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
index 757132eae64..bf8be1ad0c0 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
@@ -8,9 +8,12 @@ SECTION = "console/utils"
 LICENSE = "GPL-2.0-only & CDDL-1.0 & LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=32f68170be424c2cd64804337726b312"
 
+DEPENDS += "gnu-config-native"
+
 SRC_URI = " \
 	${SOURCEFORGE_MIRROR}/project/cdrtools/cdrtools-${PV}.tar.bz2 \
 	file://0001-Don-t-set-uid-gid-during-install.patch \
+        file://riscv64-linux-gcc.rul \
 	"
 
 SRC_URI[md5sum] = "7d45c5b7e1f78d85d1583b361aee6e8b"
@@ -23,6 +26,12 @@ export ac_cv_prog_CC = "${CC}"
 
 inherit native
 
+do_configure() {
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/autoconf
+        install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/autoconf
+        install -m 0644 ${WORKDIR}/riscv64-linux-gcc.rul ${S}/RULES/
+}
+
 do_install() {
 	make install GMAKE_NOWARN=true INS_BASE=${prefix} DESTDIR=${D}
 }
diff --git a/meta/recipes-devtools/cdrtools/cdrtools/riscv64-linux-gcc.rul b/meta/recipes-devtools/cdrtools/cdrtools/riscv64-linux-gcc.rul
new file mode 100644
index 00000000000..3e930225dce
--- /dev/null
+++ b/meta/recipes-devtools/cdrtools/cdrtools/riscv64-linux-gcc.rul
@@ -0,0 +1,65 @@
+#ident "@(#)i586-linux-gcc.rul	1.18 18/11/07 "
+###########################################################################
+# Written 1996-2018 by J. Schilling
+###########################################################################
+#
+# Platform dependent MACROS for Linux
+#
+###########################################################################
+# Copyright (c) J. Schilling
+###########################################################################
+# The contents of this file are subject to the terms of the
+# Common Development and Distribution License, Version 1.0 only
+# (the "License").  You may not use this file except in compliance
+# with the License.
+#
+# See the file CDDL.Schily.txt in this distribution for details.
+# A copy of the CDDL is also available via the Internet at
+# http://www.opensource.org/licenses/cddl1.txt
+#
+# When distributing Covered Code, include this CDDL HEADER in each
+# file and include the License file CDDL.Schily.txt from this distribution.
+###########################################################################
+include $(SRCROOT)/$(RULESDIR)/rules.prg
+###########################################################################
+include $(SRCROOT)/$(RULESDIR)/cc-$(C_ARCH).rul
+
+#
+# LINUX_SRC_INCLUDE is defined in DEFAULTS/Defaults.linux
+#
+INCDIRSX +=	$(LINUX_SRC_INCLUDE)
+OSDEFS +=
+
+KDEFINES=	-DKERNEL -D_KERNEL
+
+LIB_PREFIX=	lib
+LIB_SUFFIX=	.a
+SHL_SUFFIX=	.so.$(DYNMAJOR).$(DYNMINOR)
+
+LIB_SOCKET=	
+LIB_MATH=	-lm
+LIB_KVM=	
+
+#
+# Sunpro C/C++ run on Solaris and Linux and both have linkers
+# that support mapfiles
+#
+MAPVERS=	$(_MAPVERS) # This enables to use mapfiles
+#
+# The GNU linker is buggy and does not like the official order in linker map
+# files for symbol versioning. The following command reverses the order of
+# the version names in the linker map file.
+#
+MAPFILE_POST=	| sed 's/^SCHILY/+SCHILY/' | tr '\012' '@' | tr '+' '\012' | sort -V |  tr '@' '\012'
+
+#LDOPTS=		$(LIBS_PATH) $(LDPATH) $(RUNPATH:-R%=-Wl,-R%)
+#
+# Uncomment the next line in case you are on an old Linux version that
+# does not support the -R linker flag.
+#
+#LDOPTS=		$(LIBS_PATH) $(LDPATH)
+LDOPTMAP=	$(PMAPVERS:%=-Wl,--version-script=%)
+LDOPTDYN=	-shared -Wl,-soname,$(TARGET) $(LDOPTMAP)
+
+LORDER=		echo
+TSORT=		cat
-- 
2.42.0


