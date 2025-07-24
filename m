Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 626CDC87FCA
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:00 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.5119.1753392950668713142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:35:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nn9G5KCf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7600271f3e9so1347044b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392950; x=1753997750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SExyELtirSLHPZawYAEgVSr0buqvalPQSqNJfMTY24=;
        b=nn9G5KCfMIJVs4wZ7uiswyqpIkMmlHUC3qQDsGHuxqI22eVYSYxaA/kMIAO2e3Apco
         ODfdfAvAYlKH9tmNLx6I7gCRwd3gIwjVk+97Wl0FqVNswiHcsuJTf4DfOhvqf5vnKib3
         BY11Y9ZlEI0Oirxjui/qn2AXIIa59FxumpwuEetYD8HDLp4ppDrEK6EFXDqI/bDt8001
         ExySqnC7mLJzeC2Q1R8XO4SBNmehfrWs/CRAGSxC9j9oCGjLigSmeNFWDHefCmaxxryG
         p28ujNbkUood51YhYFv367TJ0Aj7b3FYKViurlUP1VbEPrQ4uwIPOmDTwxC8UzX87evf
         o9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392950; x=1753997750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SExyELtirSLHPZawYAEgVSr0buqvalPQSqNJfMTY24=;
        b=uHc1RjJX3Zk/Nh2sEmsp5oWlmGN0XrxfAna86TYGy2sHqJ+cw/Jc5aLgtYEZAzCfJZ
         4qN2W0ZPdOT3mlO93AOFikkm3goNIttuIEltw2p4BFN/aT6KDvTmrXYyotO31/7etFub
         y7FARgGGkfiHQ3mx/WL/cRRj14UAosdZY5z0VL5yZmp2aAIfN8GDszbVhL3ZMIlJgzha
         u4iEuoyMaw+n0GQHC8vh+jMQtZHq4jeL7zSObNsYDRuR1r6GoiaxOI1CfjHECRA4Rusc
         6Rc4lkqcyUaY18JhD5EfSHCnonHik6KN7Q3L+AvKyJasvkRoJbljcsiv6Mxvg2/WvJtd
         BzvQ==
X-Gm-Message-State: AOJu0YzOzNLn66hXQRP5IbnFmxPHygUSXe/lBISb8AynqBvzl/xXCy1J
	6a12GEw2BxGToCaW7iopA1EaVGBG1rvwCg0+ierTDWkhwVhdKJW1d0DuMBMS+21rXc0pkyoJJem
	QlWWp
X-Gm-Gg: ASbGncvD19W/TQtARoNwwUqWqzvZqRnjM8pWJGLnhPIBhzYiY0iQIZ79tStP3omW8/d
	yQ+/uLLuc8V4WzPvI1b/xaf+4Lvoa1/43y379GgTYyw+SI/ye5h0AJbdEY1lVgWQGGJ2oSW7QyQ
	PLFyuNezvBogSQsUzFjU8YL0mvAjzbENdfmSf3MYuXI6+//iHPqMglaE6n8qkr58ZC/HdjsS7f/
	jZcd9xUCOwsRaqpcMA2OZsN1cZzMqbiru9tQEjq1v+CsslfcNgYtKhN9eWbhLzsc5RMsUeXRoKG
	LtJ3ULg1VVD+Bfkl2+kKYClijkSPdU6JO3jNQpaaFmrt+yBMyQXf1utBHHaSXwKbJ1f3d+Iv7vs
	pGXWfXfdBKvi29+TexO5TGJY=
X-Google-Smtp-Source: AGHT+IFggd4yIpSo+wnb30sGkhtEIcP8Mht4IXENET4xpbaYfvfp+YhK4+3puNFlSFm3TP3b+DLTfQ==
X-Received: by 2002:a05:6a00:2489:b0:746:1d29:5892 with SMTP id d2e1a72fcca58-761eee32e43mr4897573b3a.4.1753392949709;
        Thu, 24 Jul 2025 14:35:49 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.35.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:35:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/16] openssl: CVE-2024-41996
Date: Thu, 24 Jul 2025 14:35:22 -0700
Message-ID: <fbe03fd40d02ddd662e34f2ec75427cea4ea0902.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220879

From: Archana Polampalli <archana.polampalli@windriver.com>

From: Peter Marko <peter.marko@siemens.com>

As discussed in [1], this commit fixes CVE-2024-41996.
Although openssl project does not consider this a vulnerability, it got
CVE number assigned so it deserves attention.

[1] https://github.com/openssl/openssl/pull/25088

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2024-41996.patch      | 44 +++++++++++++++++++
 .../openssl/openssl_3.2.4.bb                  |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
new file mode 100644
index 0000000000..dc18e0bef1
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
@@ -0,0 +1,44 @@
+From e70e34d857d4003199bcb5d3b52ca8102ccc1b98 Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Mon, 5 Aug 2024 17:54:14 +0200
+Subject: [PATCH] dh_kmgmt.c: Avoid expensive public key validation for known
+ safe-prime groups
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The partial validation is fully sufficient to check the key validity.
+
+Thanks to Szilárd Pfeiffer for reporting the issue.
+
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+Reviewed-by: Paul Dale <ppzgs1@gmail.com>
+(Merged from https://github.com/openssl/openssl/pull/25088)
+
+CVE: CVE-2024-41996
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e70e34d857d4003199bcb5d3b52ca8102ccc1b98]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ providers/implementations/keymgmt/dh_kmgmt.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/providers/implementations/keymgmt/dh_kmgmt.c b/providers/implementations/keymgmt/dh_kmgmt.c
+index 82c3093b12..ebdce76710 100644
+--- a/providers/implementations/keymgmt/dh_kmgmt.c
++++ b/providers/implementations/keymgmt/dh_kmgmt.c
+@@ -387,9 +387,11 @@ static int dh_validate_public(const DH *dh, int checktype)
+     if (pub_key == NULL)
+         return 0;
+ 
+-    /* The partial test is only valid for named group's with q = (p - 1) / 2 */
+-    if (checktype == OSSL_KEYMGMT_VALIDATE_QUICK_CHECK
+-        && ossl_dh_is_named_safe_prime_group(dh))
++    /*
++     * The partial test is only valid for named group's with q = (p - 1) / 2
++     * but for that case it is also fully sufficient to check the key validity.
++     */
++    if (ossl_dh_is_named_safe_prime_group(dh))
+         return ossl_dh_check_pub_key_partial(dh, pub_key, &res);
+ 
+     return DH_check_pub_key_ex(dh, pub_key);
diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
index c4ad80e734..d6bf32d989 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.2.4.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
+           file://CVE-2024-41996.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


