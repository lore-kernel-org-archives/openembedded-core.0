Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85492C4708E
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 20:05:58 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.4140.1672776358234038104
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 12:05:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d69jP3E+;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id jl4so27515590plb.8
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 12:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84SzW5OFb0xT17Vh0dLu2Ygy2H1xZdOL/MSQ0eq3Edw=;
        b=d69jP3E+kiHexQXufTGlifHduPPVBWCmQhtRLxK/Z9JdCSVPkFz1zA0DrqOXG463av
         V71dRY3WzBtuXMJpAlBdAPsaQ2uDbDGBRWJcNBszOCvSzSMxW7JT85JID6lj8oqcRcOq
         3gQhWOBbCDSr4xP3mvPM8Gm3wdfYpgZE2oSQu/xjMdiAqaiIUEjRbikl64zCSjVpEi4d
         JvZDzuaqtAm76Uxu4yflNc5WUdX2ueSOzRgkftF7m6+RPFy6iM/ZmN8wtlqLQxpyOW2W
         kvDmTL09qaaa7hx2pc8vOkh3+FbQR0OEry2PRMffS6nUKpx6mLU84GxlCHxh8D2U0lS8
         xeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84SzW5OFb0xT17Vh0dLu2Ygy2H1xZdOL/MSQ0eq3Edw=;
        b=Ba6ozXZKXpOERGnPELa+Q6626CiepPCy13emRrIbalFZLf/asX8ZSvE51CNVxJhyn8
         Zqhv1E+JxuqOG+sYaOrZDnF/uD83I9fdF6BlvoQISkHPJ5n4cFdHVE/uFoLZEuLm35H4
         uE8/PjO8oSZnyRzTyRRX2wrxqeyNWu1Iy33EcxU05oBjfQJIQlhmo7N60x8cNEhXGuCi
         XbO87237XX9ruUZz4/tuKRCa8B9w3IyE6GAoiwPRgZoYfngZdHcY9ejkkoSc6e8AxWAx
         CTA4bEFei5R8flZHmfhcmHIJrDaknX62CgT+Gl6Jk4VRXAuvOwRJoy8OuoED8tZhI8AG
         0BTQ==
X-Gm-Message-State: AFqh2kqsLDokfVEtLykidN7P6v1GsKpoOFcENwy6CMOYxTUqTK/LOz2m
	5E6Z8EitmSUQRLVU9uwWQv6Eq4eNpS0=
X-Google-Smtp-Source: AMrXdXujhWkcvdqbM3vO1zJ5e/q4evhdwgssoEtYDi3QMRFJVDn3ks7OKGmnnW7DygT94sGBybf0cQ==
X-Received: by 2002:a17:902:ab0e:b0:192:acd2:73cd with SMTP id ik14-20020a170902ab0e00b00192acd273cdmr14658985plb.49.1672776357364;
        Tue, 03 Jan 2023 12:05:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902b69200b001929212b478sm13779227pls.118.2023.01.03.12.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 12:05:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/5] stress-ng: Do not enforce gold linker
Date: Tue,  3 Jan 2023 12:05:50 -0800
Message-Id: <20230103200553.52973-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103200553.52973-1-raj.khem@gmail.com>
References: <20230103200553.52973-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 20:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175366

This can then be controlled by yocto environment through LDFLAGS if
needed since we support multiple linkers and distro policy may want a
different linker, moreover gold fails on ppc32 to link since its missing

Fixes errors like below on ppc/gold + clang

/usr/lib/clang/15.0.6/lib/linux/libclang_rt.builtins-powerpc.a(mulsc3.c.o): unsupported -mbss-plt code

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-via-makefile-to-enable-gold-linker.patch | 65 +++++++++++++++++++
 .../stress-ng/stress-ng_0.15.01.bb            |  3 +-
 2 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch
new file mode 100644
index 0000000000..821e4d910f
--- /dev/null
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch
@@ -0,0 +1,65 @@
+From 32386c13420f676bd938a8b1ceaeab8a5da46d17 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 3 Jan 2023 11:00:09 -0800
+Subject: [PATCH] Pass LD_GOLD=1 via makefile to enable gold linker
+
+Current logic prefers gold if a toolchain has gold linker installed and
+does not offer any option to chose default linker which might not be
+gold linker. Its better to pass this control to user instead of auto
+detecting and deciding.
+
+Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/251]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile        | 7 +++++++
+ Makefile.config | 9 +--------
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index f2fd4b6c..bff6b8ac 100644
+--- a/Makefile
++++ b/Makefile
+@@ -69,6 +69,13 @@ endif
+ #CFLAGS += -Weverything
+ #endif
+ 
++#
++# Use gold linker
++#
++ifeq ($(LD_GOLD),1)
++LDFLAGS += -fuse-ld=gold
++endif
++
+ GREP = grep
+ #
+ # SunOS requires special grep for -e support
+diff --git a/Makefile.config b/Makefile.config
+index 394ed20d..48c94fa1 100644
+--- a/Makefile.config
++++ b/Makefile.config
+@@ -241,7 +241,7 @@ define check_ld
+ 	$(call check_ld_tmp,$1,$2,$3)
+ endef
+ 
+-all: linkers libraries headers cpufeatures types functions
++all: libraries headers cpufeatures types functions
+ 	@for I in $$(ls $(CONFIGS)); do \
+ 		if [ -s $(CONFIGS)/$$I ]; then \
+ 			echo "#define $$I"; \
+@@ -262,13 +262,6 @@ configdir:
+ clean:
+ 	@rm -rf $(CONFIGS) config config.h
+ 
+-linkers: \
+-	configdir \
+-	LD_GOLD
+-
+-LD_GOLD:
+-	$(call check_ld,test-ld,HAVE_LD_GOLD,gold)
+-
+ libraries: \
+ 	configdir \
+ 	LIB_AIO LIB_APPARMOR LIB_BSD LIB_CRYPT LIB_DL \
+-- 
+2.39.0
+
diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
index 38fd6698b3..0d95cad69f 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.15.01.bb
@@ -5,7 +5,8 @@ HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
+           file://0001-Pass-LD_GOLD-1-via-makefile-to-enable-gold-linker.patch"
 SRCREV = "8c7c3d95555c50148470553b55477db895a4f1ad"
 S = "${WORKDIR}/git"
 
-- 
2.39.0


