Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F25F1C47DB7
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 18:58:14 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web10.54354.1705863485043546122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Jan 2024 10:58:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S8soZbr4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.53, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e0ed26cc5eso262464a34.3
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 10:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705863483; x=1706468283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfbSj20X9oRuXg/JLvHwnMcrWyHRqQu2QsnHmy+B7dM=;
        b=S8soZbr4l2yLrrfWYbCRHF4s6bqrHcj7pVGFSc+nQp9j4HRE/lvtOE1nMgqp1LggYo
         ld6zIuZo9IMaTTVD+WRDLJJiQyKIvuwUBjROXVqL0q5uXw4mqlRXMaHHe4zPIZfAX/Tv
         dchFrUQ9JyEKjl4lQgerhLXqJ5UkfPJwJCNJD2LYzPRyQMP9wy1qtgo0n9YVNpA34zIh
         v3AUOD8OILzOw/s+XRR2/m+0f6AlNpwALkqbJcIPHdMHSTPoqk+d68iKB/dKq+Bzrw6Q
         DEYtNFMIYJOGlHA+fKwZPI3800J23lgwz3OVbZgIBi/CJrUuCEp0CMTPNUk2tuR5W0y4
         CcMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705863483; x=1706468283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfbSj20X9oRuXg/JLvHwnMcrWyHRqQu2QsnHmy+B7dM=;
        b=KpVIX7w9iyCuOyNTiOOX9fOsm5S0QA9tcFRSBhX5kTvGgEnUNMBglpdjj00NRsFlM7
         PQXI2zEhq3y57hh7DSD+Gt/sim/urSOGxLU1OE/LEZO8LugHkGpC60tIoVdpPVW7bJ2f
         jUUSZ9xz1T8lhkHj5es0jmtkX7qrlIpVuLvICRwDEhkVDEGBjmc+lk1e07RSsDafs2RZ
         s59PeeoF5gwg5nUshOXrxHc+/TqY7RfSVORdC7ShgXz7WRzkGjCM0OPl4t5poR99DHEL
         Ac46sT9d4p8wC0UT5E2zQfvGUW4+37whgVh5n9KbYz1itVNg6nbK7/8ypc3NqYEefg2/
         dJ+A==
X-Gm-Message-State: AOJu0YznjuwwcspNpJCILj8FrAunLh31sh1pTGTomqwDoZo7L2i1R6+t
	hxW/JwGlExlVb1+r39pLtSgKdEfwiGZBqWw2iiJDfxDeYKx87KYZVWrJidpPYPxDM3+3mbSte+h
	2MKGniA==
X-Google-Smtp-Source: AGHT+IHU8MHCSJjRc+fItZ+UZxDxT5YSfde3fmBTxjepfRPpGGOlVdXCj+1NEVVKe6UmDfOum84QJA==
X-Received: by 2002:a05:6808:3187:b0:3bd:a86b:99f4 with SMTP id cd7-20020a056808318700b003bda86b99f4mr4645191oib.39.1705863483591;
        Sun, 21 Jan 2024 10:58:03 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id t187-20020a6281c4000000b006d99125b114sm8675277pfd.65.2024.01.21.10.58.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jan 2024 10:58:03 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/6] openssl: fix CVE-2023-6237 Excessive time spent checking invalid RSA public keys
Date: Sun, 21 Jan 2024 08:57:51 -1000
Message-Id: <6bb64af6ce167eadd34570b061b3e6ed13c39c74.1705863274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705863274.git.steve@sakoman.com>
References: <cover.1705863274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Jan 2024 18:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194096

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/openssl/openssl/commit/e09fc1d746a4fd15bb5c3d7bbbab950aadd005db

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/openssl/CVE-2023-6237.patch       | 127 ++++++++++++++++++
 .../openssl/openssl_3.0.12.bb                 |   1 +
 2 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
new file mode 100644
index 0000000000..621dc6b0ab
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2023-6237.patch
@@ -0,0 +1,127 @@
+rom e09fc1d746a4fd15bb5c3d7bbbab950aadd005db Mon Sep 17 00:00:00 2001
+From: Tomas Mraz <tomas@openssl.org>
+Date: Fri, 22 Dec 2023 16:25:56 +0100
+Subject: [PATCH] Limit the execution time of RSA public key check
+
+Fixes CVE-2023-6237
+
+If a large and incorrect RSA public key is checked with
+EVP_PKEY_public_check() the computation could take very long time
+due to no limit being applied to the RSA public key size and
+unnecessarily high number of Miller-Rabin algorithm rounds
+used for non-primality check of the modulus.
+
+Now the keys larger than 16384 bits (OPENSSL_RSA_MAX_MODULUS_BITS)
+will fail the check with RSA_R_MODULUS_TOO_LARGE error reason.
+Also the number of Miller-Rabin rounds was set to 5.
+
+Reviewed-by: Neil Horman <nhorman@openssl.org>
+Reviewed-by: Matt Caswell <matt@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/23243)
+
+Upstream-Status: Backport [https://github.com/openssl/openssl/commit/e09fc1d746a4fd15bb5c3d7bbbab950aadd005db]
+CVE: CVE-2023-6237
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ crypto/rsa/rsa_sp800_56b_check.c              |  8 +++-
+ test/recipes/91-test_pkey_check.t             |  2 +-
+ .../91-test_pkey_check_data/rsapub_17k.pem    | 48 +++++++++++++++++++
+ 3 files changed, 56 insertions(+), 2 deletions(-)
+ create mode 100644 test/recipes/91-test_pkey_check_data/rsapub_17k.pem
+
+diff --git a/crypto/rsa/rsa_sp800_56b_check.c b/crypto/rsa/rsa_sp800_56b_check.c
+index fc8f19b..bcbdd24 100644
+--- a/crypto/rsa/rsa_sp800_56b_check.c
++++ b/crypto/rsa/rsa_sp800_56b_check.c
+@@ -289,6 +289,11 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
+         return 0;
+ 
+     nbits = BN_num_bits(rsa->n);
++    if (nbits > OPENSSL_RSA_MAX_MODULUS_BITS) {
++        ERR_raise(ERR_LIB_RSA, RSA_R_MODULUS_TOO_LARGE);
++        return 0;
++    }
++
+ #ifdef FIPS_MODULE
+     /*
+      * (Step a): modulus must be 2048 or 3072 (caveat from SP800-56Br1)
+@@ -324,7 +329,8 @@ int ossl_rsa_sp800_56b_check_public(const RSA *rsa)
+         goto err;
+     }
+ 
+-    ret = ossl_bn_miller_rabin_is_prime(rsa->n, 0, ctx, NULL, 1, &status);
++    /* Highest number of MR rounds from FIPS 186-5 Section B.3 Table B.1 */
++    ret = ossl_bn_miller_rabin_is_prime(rsa->n, 5, ctx, NULL, 1, &status);
+ #ifdef FIPS_MODULE
+     if (ret != 1 || status != BN_PRIMETEST_COMPOSITE_NOT_POWER_OF_PRIME) {
+ #else
+diff --git a/test/recipes/91-test_pkey_check.t b/test/recipes/91-test_pkey_check.t
+index dc7cc64..f8088df 100644
+--- a/test/recipes/91-test_pkey_check.t
++++ b/test/recipes/91-test_pkey_check.t
+@@ -70,7 +70,7 @@ push(@positive_tests, (
+     "dhpkey.pem"
+     )) unless disabled("dh");
+ 
+-my @negative_pubtests = ();
++my @negative_pubtests = ("rsapub_17k.pem");  # Too big RSA public key
+ 
+ push(@negative_pubtests, (
+     "dsapub_noparam.der"
+diff --git a/test/recipes/91-test_pkey_check_data/rsapub_17k.pem b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
+new file mode 100644
+index 0000000..9a2eaed
+--- /dev/null
++++ b/test/recipes/91-test_pkey_check_data/rsapub_17k.pem
+@@ -0,0 +1,48 @@
++-----BEGIN PUBLIC KEY-----
++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
++AQAB
++-----END PUBLIC KEY-----
+-- 
+2.25.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
index 4602151d91..ce0f9fa8e3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.12.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://CVE-2023-5678.patch \
            file://CVE-2023-6129.patch \
+           file://CVE-2023-6237.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.34.1


