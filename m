Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDDBF88069
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:31 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7578.1776322108367750023
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PB3SKq0l;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43cf7683a28so5119435f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322106; x=1776926906; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVxFLZXyxleC1/tWo9DUC3Wm/ch6/RCWSpYsaOU0/Q4=;
        b=PB3SKq0ly96Oj/TT7UIFMShjhWfpjbEUooaKVdMuOoHTPwg8iy/QqqsGIBPrzbBLw5
         nAFKabhl1zfuW/iGEijF1PK1rLcu5V/kl/YtmZANWwYaMbWW5QJ49MWBQH9GsZy9agWB
         FKHoD37XxUJNhw32fjwJnqtAF0BryI6naTOxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322106; x=1776926906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LVxFLZXyxleC1/tWo9DUC3Wm/ch6/RCWSpYsaOU0/Q4=;
        b=SlG3o2+Owiz8OUcPBTSt0G2jjs+cU+iV9fd4rSdIM9e2F5AiDdlO+b648zdNTKIffb
         1gdoSdnmexHh6WMmT1hsz6np9lDff/SOGATNc5HtLK7+myTvrBbRVnLniF6eEdlvgghV
         enzf17ACvwgSvJ47UgKHruqYG/M5mxT1dnSN0KrB0SqeN3t369GlyOiHXxuj7dgvPNY7
         tAOBaCpd0GtW41cHNpwTY4M0iytGQiZcH3Zs/QYYQPDhevMXGrkgWBfJvSEEk+OQOmwy
         F+1M8oI/0KGOB4WRrIRqWnv14fWvIDe0Howa7BaPkPpaXtV1KVOgzOjvL4gH4udpBXiR
         jYUA==
X-Gm-Message-State: AOJu0YzVj+FhduU/UfjJe9hZ/Do65VoOTqUrb8loyUqTaW9LKGD7qJ7g
	GPXz1QMl7b16hiWSEksZRl+73X5uIZYQlj7F8s/xVPF4Ks5GwRJJsyDOb2S7VLdnvfPAmtI48EV
	YY9FzrnPOPJfs
X-Gm-Gg: AeBDieuG/UrDI/UG5zVM5tKWv26cq9ExPLWXq32/3b71Fko00/y0MUEdxHB4csDHrdB
	8ZC9xbnMwss7iWsEIy5+tnf6OLHBmC0V7AifiuW8jEfLoDSh4PnmH14SMHvT+KgJX6yJ/K6SZhu
	fC9xeI9DVF8YyX70Jz3fg6usGmXuQeNUphg/sAGkPb9TTzWov76dg/nkH6TufwJyPm8ncEIPdHM
	AW9hhI4Xfh+tN/saFoL+G6DXZyw76oGqvOFaBo/RFSqaVlrkKvwaXjWmKGNPWrvmzH+1Fojn77P
	eOHl6Cygu42jxfxDHAdlCq86rzoeSNIUryQ7M3y5OcJWD611qRLFHvZa2vQ1X3XeyEpTP/3QN2V
	DUnw/GF0StEHDvMpFdy1WVtMh9YIO5bQS6cURp4VZuxBlPLqR+kzVZegW90ri5lNUpmQoDwXu6v
	a6/BerV+3Z4HdTK/PCU6512EgO0iHyTlwNUGqRApkA2GwCr3rdzV+26jQUkVN7e6iy27K4VmAEz
	w9VMjax6stYJLKrtL0/ZZE7vTEyQEiv2tkqOwhVpDmEpv0i
X-Received: by 2002:a05:6000:1847:b0:43b:4f0c:aefd with SMTP id ffacd0b85a97d-43d642b9e05mr35249205f8f.23.1776322106383;
        Wed, 15 Apr 2026 23:48:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 13/47] binutils: Fix build with GLIBC 2.43 on the host
Date: Thu, 16 Apr 2026 08:47:14 +0200
Message-ID: <47c73e8d5c4b60e7a9124010352804507b76d75d.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235355

From: Zoltán Böszörményi <zboszor@gmail.com>

Added a patch to fix a build error in the CALL_UTIL() macro
when built against GLIBC 2.43 on Fedora 44. This fixes
binutils-native.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../binutils/binutils-2.45.inc                |  1 +
 ...tect-against-standard-library-macros.patch | 34 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index f635d76069a..81d46bfb734 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -52,4 +52,5 @@ SRC_URI = "\
      file://CVE-2025-69644_CVE-2025-69647.patch \
      file://CVE-2025-69649.patch \
      file://CVE-2025-69652.patch \
+     file://0001-gprofng-protect-against-standard-library-macros.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch b/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch
new file mode 100644
index 00000000000..b626c51b6cd
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0001-gprofng-protect-against-standard-library-macros.patch
@@ -0,0 +1,34 @@
+From 5f66aee7f4bec7a2d8378034116f5e5c3dc50f41 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@suse.de>
+Date: Sat, 22 Nov 2025 11:29:43 +0100
+Subject: [PATCH] gprofng: protect against standard library macros
+
+The CALL_UTIL macro can expand to an unparsable expression of the argument
+is a macro, like with the new const-preserving standard library macros in
+C23.
+
+	* gprofng/src/collector_module.h (CALL_UTIL): Add parens to not
+	expand its argument if it is a function-like macro.
+
+Signed-off-by: Andreas Schwab <schwab@suse.de>
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=5f66aee7f4bec7a2d8378034116f5e5c3dc50f41]
+---
+ gprofng/src/collector_module.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gprofng/src/collector_module.h b/gprofng/src/collector_module.h
+index b64d69c45ab..859a6dd1f7d 100644
+--- a/gprofng/src/collector_module.h
++++ b/gprofng/src/collector_module.h
+@@ -119,7 +119,7 @@ typedef struct CollectorUtilFuncs
+ extern CollectorUtilFuncs __collector_util_funcs;
+ extern int __collector_dlsym_guard;
+ 
+-#define CALL_UTIL(x) __collector_util_funcs.x
++#define CALL_UTIL(x) (__collector_util_funcs.x)
+ 
+ /* The following constants define the meaning of the "void *arg"
+  * argument of getFrameInfo().
+-- 
+2.53.0
+

