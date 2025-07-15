Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A1CC83F27
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 20:36:40 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.5341.1752611793449593772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 13:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=OwC11eax;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-23694cec0feso54658405ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 13:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752611793; x=1753216593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTFRGb4nwUyl5kmK8ZR5Nx+DlOmw9bAX66JfLNl7FBE=;
        b=OwC11eaxfjt3Pn8N52IvEcNfAio16Y4t8AUhjDtlplNBoJupJ9ppg9tbeqy0PNdNaO
         wUhFBxaqfcK0zHoBzHrSooJBY0Kqw61wKF3M9rYzNsjLqGV0cq42uHkvFzOe2lGtDyZJ
         lk1ELJOXhKhw7bGXuKKbYVM+JZKj95mffWuFBWodflwV2F5LyYE1v77p0bYUF+2FX9Iu
         PANmLYa+GwqkKxIauqpYas9VZrQzSgZvXKsovsTqprfKISAK3Ot5YMllLOAjqWHUF2b2
         vL1z6iUeTbAaq+Lkdk5mSnyf14HAldW04C2IgoNSwlImk3Qxpkb7btfyHEJ8Y2V98W+C
         bEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611793; x=1753216593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FTFRGb4nwUyl5kmK8ZR5Nx+DlOmw9bAX66JfLNl7FBE=;
        b=lCRe+aiJSDuU2Eq1A8qFySG863h0hiq3vopVI3FCUqrDh08jj7A5sCKF5eBwkecu7V
         83glvUGVzVSCua3Ij5LBAB4nNKqEVKFYnwMfCeceHKmf1SmhyyQc6kzU8phaCYC3NVXD
         UHoVcJAjUa5yUCs/5KzK5k99r9NlFTBaAPyMm+0kj2qqYPjaObtwF4INGXVdQSmH4Y+T
         X1BxmQwzNufCNb5ghUgZvGV7rEataRZKQ12x9Vlkr2T+oWXhPxIuhAdEd6AqRDSXzMZ9
         0/L3Kuoi0AJRIQQIX2+cnO1j1Fq7laN+PkTk6RamEf0TsrbnYtl2QNZGBZ3qE7k7fHgm
         fklA==
X-Gm-Message-State: AOJu0YwSOx4w+6In8xGnQuGyApEbJ+embqlDPfByWq2ix0TPlLATt7kB
	NeYZpuLj/yTZE5WOzEwzI14s2ZvFbR0HKZa1Yw5nFGdZkkuj4ADs3EK3z49Sq8XO1OfM+mObaOO
	BheIo
X-Gm-Gg: ASbGncuYdyVeORkEpZ5BfUWa+gLjgaYITklGm8qDED8lIfxo4ZuD6AeFSVUJhHAjxP8
	ZeVIG6y2f05gOkFnPX1tO3zwW/9n38Ba9zQShf7iSh8I/33jDWmqQPlSY/oE7NtgEgGyDzhzE8p
	8IQX2e6EMNg2z0X453ob+dPi/RjC/86xjQ7FjHGFsTZpyza8KsXTbwCXbGVoVhgsZB+cZG06rAZ
	mfdW7O3tL7VJFPfYc/0iDFv8oMxTtd9psf1orgM5icuLEa1Y5iqq0j3E607fIqXENm1BIB9UmHQ
	izlEI4m8VsFCUVgRQDDOkxnee+WYdfjA/0cmFT5kBIPe19xZrJpYgvVdam5u5lL9bNjAPaV1dtL
	Beb+cJtg1k8Rlcg==
X-Google-Smtp-Source: AGHT+IFFlU+prRp6zK4JJKoRAQ1NCDhAxVtBhyA03ydt/OUPMF98ngIICSblah8rVqGSzB8Nkl85VQ==
X-Received: by 2002:a17:902:ef0b:b0:236:6f5f:caaf with SMTP id d9443c01a7336-23e24edc85emr5854595ad.15.1752611792530;
        Tue, 15 Jul 2025 13:36:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5c42:3781:50b6:b9d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de43637f2sm115585595ad.241.2025.07.15.13.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:36:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/16] openssl: fix CVE-2024-41996
Date: Tue, 15 Jul 2025 13:36:07 -0700
Message-ID: <635fc639a13a6b28cac5c67cff23b7f4477bc41c.1752611671.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752611671.git.steve@sakoman.com>
References: <cover.1752611671.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 20:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220415

From: Archana Polampalli <archana.polampalli@windriver.com>

Validating the order of the public keys in the Diffie-Hellman Key Agreement Protocol,
when an approved safe prime is used, allows remote attackers (from the client side) to
trigger unnecessarily expensive server-side DHE modular-exponentiation calculations.
The client may cause asymmetric resource consumption. The basic attack scenario is that
the client must claim that it can only communicate with DHE, and the server must be
configured to allow DHE and validate the order of the public key.

Reference:
https://github.com/openssl/openssl/pull/25088

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2024-41996.patch      | 48 +++++++++++++++++++
 .../openssl/openssl_3.0.17.bb                 |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
new file mode 100644
index 0000000000..49ec9c0130
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-41996.patch
@@ -0,0 +1,48 @@
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
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e70e34d857d4003199bcb5d3b52ca8102ccc1b98]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ providers/implementations/keymgmt/dh_kmgmt.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/providers/implementations/keymgmt/dh_kmgmt.c b/providers/implementations/keymgmt/dh_kmgmt.c
+index 795a3f2..3e7a811 100644
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
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb b/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
index 5bc8801b98..ee0ab2e498 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.17.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
+           file://CVE-2024-41996.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


