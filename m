Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F96CD98C5
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 08:56:57 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.125295.1781512409963220274
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 01:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=edAK04eX;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: adityags2004@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so1871516a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 01:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781512409; x=1782117209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8cxA3vPu6e8y45vuLuFsPpSJzaQn/pbp4pVff9KARIk=;
        b=edAK04eXB6kMtoxhRaEkymjUyi7J/b6BpYgff1J41qbfU+9aEzSbt9mrQJYa6WRuIZ
         ItJh/lEB5Xk6aj87er+HjODUOIzrsQtsB24k9oWT3hPTA4QbbobwVQq7O0BDbUNjIIrC
         iFwfVL0RVr8HRk4qAHdMgfDsWrD9MCYmNs8hstfQ9PXe2a9MRuAxbEuC8MrigW2mSYNl
         dq+1Zu8nX1L8mOM1VXJcCu02KGVqeFfh7YXBuxNf7pnumqQjS9yacc8sFdr/XiwFD+lL
         e4cNENQFuP859I3a7+j1LH4sgiWEyXrVhNP8Jf9bDLk2iqF+e5hhh3Ye+PFxRF7Fw9u5
         Li3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512409; x=1782117209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cxA3vPu6e8y45vuLuFsPpSJzaQn/pbp4pVff9KARIk=;
        b=etBjZsrIEQWT12a5Auam7DDQ0lk4u7MlXi5NgnS5COK8PdSl5ahAtueSkzqF/3akyx
         J08f3Zsx9YU1mqt26OLOe4ViZ+RyYTiSDT2e5qzEM0O8dGx77+GMc3Y0j2BJwMZ60CoP
         kUQmLjwONcXrLBd3cGKDIo1iwnSfjl1sQDYqMocv9NyyNW3F6MvbiTwcX+AXtiNrATR1
         +HZ/iU3k2q8SKFbIhcCNa0G2Lp66UUI/ev0C6QPi6yX9W2AW+FfgxUePXiut3y715yrz
         UuB/vPwOou2lKMk5wAeH/MFehr0r0QNRr3F0cd6CCteLKigArG6qptMlUAe8JHeOugLj
         8ZrA==
X-Gm-Message-State: AOJu0Yx89SbgvOKR41D+kDQHemrS1fQ/REsOQSk9Dd19msyFr1mfWASN
	IOuOWtAbfow2kNelET95v46NTuDORdVizMIk6YzEoju9vb3DEwl0RLQMhlc77w==
X-Gm-Gg: Acq92OFbIUr0ECzpQSl1rtlwG6iBKNwkXMitCj8ImuJv1FQoxv8/VuI+KpjTXxmSVpO
	eq8Imwf2towgXxNyUchJvE683hkTuH0BOqZkDCehhJiXBTmjbHGTYibWaWnqDNm6kxxiWbHRTMY
	l2XJJ+vn26ujJ0l2mXbCCtb5J3Kk9qIxw9/LrWMCfNf0t/Yn1RsRKZXj1URWqfvPJxMhpPKmV0n
	8B7gWsd6/nzB/WQ4gv8oJBaB6/gYjtSOt+dFLr9Sam2iQO0MLaB8WPlc165/s/IAPPBnVoxTapq
	8dqCUUsWKofqQWsKgnar4lQsEibU6RI5a85Tqp3Y/o12x6H2rls3+KIkZKXDTqDCfszNXDbGeq4
	Xb1dGutPy4V78ENT2UIbuO3C1Es1sVLQAI/2BiyLT34OjGCrWleFYWY90z1zhbZ6OWjle+Az+Jh
	aNPE0sUvkRlMC4z6d8kEO0nfox1Q0ga5l6Lw12+BSvPqJI25k0JmwgMwJlarkbMf/wyjQz6XQAG
	Z+rax3J
X-Received: by 2002:a17:90b:1c09:b0:366:2e1f:393 with SMTP id 98e67ed59e1d1-37a03ebe902mr13086665a91.21.1781512409226;
        Mon, 15 Jun 2026 01:33:29 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([152.57.128.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd5f4sm11266001a91.11.2026.06.15.01.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:33:28 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Nisha.M.Parrakat@bmw.de,
	Suresh.HA@bmwtechworks.in,
	AshishKumar.Mishra@bmwtechworks.in,
	Nikhil.R@bmwtechworks.in,
	Aditya GS <adityags2004@gmail.com>,
	Aditya GS <aditya.gs@bmwtechworks.in>
Subject: [PATCH] openssl: upgrade 3.0.19 -> 3.0.21
Date: Mon, 15 Jun 2026 14:03:17 +0530
Message-Id: <20260615083317.2657-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 08:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238825

Upgrade OpenSSL from 3.0.19 to 3.0.21.

This upgrade brings in upstream fixes for multiple CVEs:

  - CVE-2026-45447 (High): heap use-after-free in PKCS7_verify()
  - CVE-2026-7383: heap buffer overflow in ASN.1 multibyte string
  - CVE-2026-9076: out-of-bounds read in CMS password-based decryption
  - CVE-2026-34180: heap buffer over-read in ASN.1 content parsing
  - CVE-2026-42764: NULL pointer dereference in QUIC server packet handling
  - CVE-2026-45445: AES-OCB IV ignored on EVP_Cipher() path
  - CVE-2026-34182: CMS AuthEnvelopedData may accept forged messages
  - CVE-2026-42766: NULL pointer dereference in password-based CMS decryption
  - CVE-2026-42770: FFC-DH peer validation uses attacker-supplied q
  - CVE-2026-45446: incorrect tag processing for empty messages in AES-GCM-SIV and AES-SIV modes
  - CVE-2026-31790: incorrect failure handling in RSA KEM RSASVE encapsulation
  - CVE-2026-28387: potential use-after-free in DANE client code
  - CVE-2026-28388: NULL pointer dereference when processing a delta CRL
  - CVE-2026-28389: NULL dereference in CMS KeyAgreeRecipientInfo
  - CVE-2026-28390: NULL dereference in CMS KeyTransportRecipientInfo
  - CVE-2026-31789: heap buffer overflow in hexadecimal conversion

As a result of this upgrade, the following CVEs are already fixed in the
upstream version and no longer require local patches:

  - CVE-2024-41996: vulnerability that could lead to denial of service
  - CVE-2023-50781: fixes related to certificate validation and memory handling

Upstream changelog:
https://github.com/openssl/openssl/blob/openssl-3.0.21/NEWS.md

Signed-off-by: Aditya GS <adityags2004@gmail.com>
Signed-off-by: Aditya GS <aditya.gs@bmwtechworks.in>
---
 .../openssl/{openssl_3.0.19.bb => openssl_3.0.21.bb}     | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.19.bb => openssl_3.0.21.bb} (95%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.19.bb b/meta/recipes-connectivity/openssl/openssl_3.0.21.bb
similarity index 95%
rename from meta/recipes-connectivity/openssl/openssl_3.0.19.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.21.bb
index 293b450cd0..2531305cda 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.19.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.21.bb
@@ -12,20 +12,13 @@ SRC_URI = "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://CVE-2024-41996.patch \
-           file://CVE-2023-50781-1.patch \
-           file://CVE-2023-50781-2.patch \
-           file://CVE-2023-50781-3.patch \
-           file://CVE-2023-50781-4.patch \
-           file://CVE-2023-50781-5.patch \
-           file://CVE-2023-50781-6.patch \
           "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "fa5a4143b8aae18be53ef2f3caf29a2e0747430b8bc74d32d88335b94ab63072"
+SRC_URI[sha256sum] = "617e29af8e421f46649484a4937e48c685e47f46488167c982f88bc4ec1d522f"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


