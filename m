Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307D3D5AE5A
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:29 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2870.1765620025096690331
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UFMcQR7w;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0a33d0585so871265ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620024; x=1766224824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUNrD0ZG3UyIoNsFqnhh0wEwvkK9WoM23Ytxx7lfjj0=;
        b=UFMcQR7wkkfj7E6vM8yRa1TnREM40rlgSWRnZTF3Wuow53qawsQuwDkqg87dbuZm9I
         KIEu4JmhWQccEoB5AbHDbff8gJTZEBeJhAnMECgUQRcUtNZ21abKg/3kEkFlhqgxcma7
         AqEDvzqBEp1+oRozcwsmM9g6+DNsKnCSaRw9HNrntEZq5xOK2Fmaxo+YJfqsfG+zkSer
         muQb8n8768CCHhDzJaOUI1gzS+55hluZeeVITbRB/cUrK7xCozuSe9DbvLKDAZpgBgBJ
         FnPYQCgk4O46iKLgLoJFlSKP7tfQk8tm+EUGxpetbKNOj+O++1B6M5uxGhZ9ewG8OjcW
         mp1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620024; x=1766224824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUNrD0ZG3UyIoNsFqnhh0wEwvkK9WoM23Ytxx7lfjj0=;
        b=Uz//uQWq/pv2Av2cHc3xCJCFXQvXGV7CZiB79ONDdMan0L+Uv/XtBd9NFotnhZKLDp
         9Ra5kmncD6eQhF9WfAbsL384Vf8igd9/o0bxg/eYN5+nNS2/ojp+dWHBBQ6gC/WkXc1n
         Q/+AnCvG2BNGNMpvOnAXZOGrzpEXR4P+kljzzg1RHbmuY4FwGa4GeBEDgd6ChnYf+QV/
         57smIKTscJJIRK2j9fgGGHfRGJBEIe/cksi+9k378MuExjoLWVukdjW17SQ5H4QuwyQf
         vs8noH54WdtKFNtGykYcSXMu9IePU1p1dGIAbi8rLPpx9G+KOO5HId39pFktxHTet4F1
         jBmw==
X-Gm-Message-State: AOJu0Yy6FxLNTsCeQa3kAWbXIcsndVYvi0EF9D/H1mOCYGyj4kASLG18
	Dc2atvd6Vt8nxTtzxn0RdOT2BGA90lunsAQflU89tcUJcaj7JRnViwU6gUN7glDi
X-Gm-Gg: AY/fxX60TgNjzI+bMdHg1b2dZZdnW4Y0YxQA09zopkwbGZXFsLiFz11KM+6VPziWhnU
	W+ULtOGKydnJO0kTZ0447zT9kdgkwG6kqAqM6R9nW9A71mOQKTGfwsSl0XJaImMnZtQ3nD/+Ped
	THFeakqU/XB0OQdMKKwmKHCjd9fSWUvU3LrepA/F6qlStw1Rd4kWb2mkSq+zP6Zje7Nlk8R8yy2
	cUkSHS669dyZAJKEaqU2SUhy/tzSS4eEPs4Mo+ROsf2zeqdSMirVUudgeN2los/iGnanDcS0y7M
	Ti6JuF/g5/PLRTvIs8PGmpHci0kX5p27Wg9P2LYW7ftl5HUC0sIVHQaHQkqg51e9Czl8JiA/FpG
	uplJSqbcaFrhzVQ3v9Xw7piIhHDu03249rhvPcTZ+teORXY8c75CIRiga80CpUoJxNrIMgUMqhO
	4ssmQTISiElBs9l9pI5h4C7dT0
X-Google-Smtp-Source: AGHT+IEHoHUMGGJPVjRipwKpioc9CsceJcPIJifX2nEZ4tBPkO6o9dZb5x4s1mHCfc+cMHTUx2Q8ZA==
X-Received: by 2002:a17:903:18c:b0:2a0:97d2:a264 with SMTP id d9443c01a7336-2a097d2a4eemr15557805ad.37.1765620024131;
        Sat, 13 Dec 2025 02:00:24 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 17/67] libcap: upgrade 2.76 -> 2.77
Date: Sat, 13 Dec 2025 15:28:41 +0530
Message-ID: <20251213095931.2571498-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227635

From: Wang Mingyu <wangmy@fujitsu.com>

0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
removed since it's included in 2.77

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 192d93102bfce5b014feeb6ee5e03cddf8b434b7)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...Add-build-ldflags-to-_makenames-rule.patch | 29 -------------------
 .../libcap/{libcap_2.76.bb => libcap_2.77.bb} |  6 ++--
 2 files changed, 2 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
 rename meta/recipes-support/libcap/{libcap_2.76.bb => libcap_2.77.bb} (91%)

diff --git a/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch b/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
deleted file mode 100644
index 10ddf64935..0000000000
--- a/meta/recipes-support/libcap/files/0001-libcap-Add-build-ldflags-to-_makenames-rule.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e52d3232882c263f5bd4b1980195ac633d706a53 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 21 Oct 2025 18:27:51 -0700
-Subject: [PATCH] libcap: Add build ldflags to _makenames rule
-
-its calling compiler and linker in single step
-ensure that build ldflags are respected as it
-might have important information like which runtime
-to use.
-
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/libs/libcap/libcap.git/commit/?id=c3ddf45d9afaab85d3b7db0dc7bfd1aafb8fde50]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcap/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/libcap/Makefile b/libcap/Makefile
-index e90a950..f0eb87e 100644
---- a/libcap/Makefile
-+++ b/libcap/Makefile
-@@ -80,7 +80,7 @@ $(PSXTITLE).pc: $(PSXTITLE).pc.in
- 		$< >$@
-
- _makenames: _makenames.c cap_names.list.h
--	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@
-+	$(BUILD_CC) $(BUILD_CFLAGS) $(BUILD_CPPFLAGS) $< -o $@ $(BUILD_LDFLAGS)
-
- cap_names.h: _makenames
- 	./_makenames > cap_names.h
diff --git a/meta/recipes-support/libcap/libcap_2.76.bb b/meta/recipes-support/libcap/libcap_2.77.bb
similarity index 91%
rename from meta/recipes-support/libcap/libcap_2.76.bb
rename to meta/recipes-support/libcap/libcap_2.77.bb
index 27093ff3e7..9968cd5f50 100644
--- a/meta/recipes-support/libcap/libcap_2.76.bb
+++ b/meta/recipes-support/libcap/libcap_2.77.bb
@@ -12,13 +12,11 @@ LIC_FILES_CHKSUM = "file://License;md5=2965a646645b72ecee859b43c592dcaa \
 
 DEPENDS = "hostperl-runtime-native gperf-native"
 
-SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz \
-           file://0001-libcap-Add-build-ldflags-to-_makenames-rule.patch \
-		   "
+SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${PV}.tar.xz"
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "629da4ab29900d0f7fcc36227073743119925fd711c99a1689bbf5c9b40c8e6f"
+SRC_URI[sha256sum] = "897bc18b44afc26c70e78cead3dbb31e154acc24bee085a5a09079a88dbf6f52"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 

