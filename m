Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B58C87FCE
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:57 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.26742.1753469087307776420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f4RfCKUy;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2350fc2591dso30410045ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469086; x=1754073886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0SExyELtirSLHPZawYAEgVSr0buqvalPQSqNJfMTY24=;
        b=f4RfCKUy3noTLVDc9+sO7NtM/SpIH4HRxfwqwAQjZvPjOH3Dc8SaLnMPXwf0+bb1Dm
         Fxa9nVi0cDXMfElSp+gJUKmVVZg+c657thisJfLWlvuiON7uYNROJSlQSSHdfIhh6t8x
         LVOse2+B1nq2GCUW6UKaeZT7Abp+anY6SrJdGlx4KiHp92f37cKkLUc2lF6mzElgCLaO
         r6BMGabevNxvvKInE5Oxv/FaJJDaLtOtKv9DtPT305Fg6zIrcN6rnic/ppHzxgd/TmRI
         zPBmUU/SuX5isOdHfjU2QO14xV5F/WCRWjEzlQmp3ZhDuWiy9u5tAl+weCxBZqh1TvX1
         3Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469086; x=1754073886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SExyELtirSLHPZawYAEgVSr0buqvalPQSqNJfMTY24=;
        b=EM7CyEijXxMuDpv/HCVip/zISQDlmG31++q7DaEjIY9XgagcmLAETM8mAJV2FUUAhR
         fHMeB8y11/ri9+DJaSzwRqAD2hKqDKgCSBeSuhvSS4BdR+v9A0+BA0rnRMbePbzTfO2j
         k24YCNoenySvSpzziY07oHABbKcmv4a4E4VGmhASe+xu6qDAh/m5WqLDzciSTbw82lHb
         hCqHzwjWsxXmcWAdRcL0YfNOYSHwRUsjcP3Es9NU3A55bGY/ZHpMbIvyz3ze15VAtgTA
         8W+Rh7yDByywnLuQo+pVJmpIqdM376R+/n8q6oT35H9/JeFArJPfP5xFmNc6u8VcuQ64
         8LIw==
X-Gm-Message-State: AOJu0Yz1invgJOq79+jBNig6TnauzZOTGD0E1Qb0dkNlHoF8ELM90H2T
	rWCcl3ZqaG5t6f4/TP+LbaaFt5GDWQ05plQjCt5HteVwWv4KoWzsbVCJtisP5uw2MTm7d02Ul+M
	GK9E7
X-Gm-Gg: ASbGncsLP4hY0t7UL6PrcLskmaSLRPZpG4wHWbqF8zHthFVSNCeVp1UqrcArIBAfllv
	t1cv3t+sP0SPzXXHnyUxjJEguXBJw6q6HvqrrxsR+RBdNmchkt4R9J0ygcU80YT/FF8ZxHquFMa
	5uJMi7etk9sGvEB3wbB99Hhuk/WYYm/B+dNWzFaSLSctlIquNRd2U6gQN6O8UHmd53Ls+tyn+fY
	Ji/nQjS+hdGlZhwO77Vyq/YSE7fF6NDhkOcipsdMbu/kbg3bYEwXaP5G0kB/ZEtv9k8gDsljpQ2
	QjgGFiVlqgHD5s4q6vESqbPM78OfePVnYU/ffrd7qMJjLsb0clcjGFX+CMjh+7mFmRMl0K4zfjh
	JjRockd1LkyFnOOfi9oErp7Dl
X-Google-Smtp-Source: AGHT+IETFmYD4kSjmkWSOHq9St4ywmZJd9ODW9pm8pYiWKUbv6hGzoRGrTn2eAMGuoTDE1RuFUAN5Q==
X-Received: by 2002:a17:903:1cb:b0:231:9817:6ec1 with SMTP id d9443c01a7336-23fb2b9994dmr47711835ad.17.1753469086373;
        Fri, 25 Jul 2025 11:44:46 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 06/16] openssl: CVE-2024-41996
Date: Fri, 25 Jul 2025 11:44:20 -0700
Message-ID: <cb49b9e49b4561ccea4c231cac591af557b9749c.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220922

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


