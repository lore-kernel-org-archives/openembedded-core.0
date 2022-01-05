Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285C1C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 13:05:41 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.6670.1641387927508456516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 05:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hnOznrA0;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id z3so29276939plg.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 05:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=n941pILhSv1WcUvlrQsZXNFghmx4FAWacF4NRhhCf1w=;
        b=hnOznrA0aEz6OQsGtCa+1OMetgGJpnYHWMTKAzTJudcSex56kcJBJK2bBCCo+W9n6v
         tzGLBLXZ5bRaWyF4t3F2zXXdZsVZoOdMbV1VrFFBF9QhvjCxiCrsPXjx0yVOr4hJmhtl
         8I5AGvFoYSxhNhtwsSnyidif2FI3OKLXHWY8plhXoTay+poMLQOgCMLfSFpCm9fRaUzF
         egm6Pb6a2q5XKBMUOLgY7oGv1DlB12k1zpp2NmfepqvCnUQg1bMb0SCI49iqVb3yCb3Y
         vxhE1WgodQodPubB3swAsmT+HLviRuklqRRQQOZmF/1OUx2BTdS7zc4EPQPHQj6FprEY
         oEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=n941pILhSv1WcUvlrQsZXNFghmx4FAWacF4NRhhCf1w=;
        b=dhpUZAGMwTK6atwCaLYEVwM5YDP5lFUnDdX23YeARXgT7aVjZlKMddSaZOpJiDFJw+
         R8SK/5c9JyNVIPgZHrLNlPX6zH5m+W7/cixI8w+/Sk4yXYWlgtAgdxVbJPx51p7Wq/h8
         GXciQU1TEPC5GhaGMc8GNaFPlGfgR/HA6vxEpZN1oUGTvFAyQUQ+xPwK6rRnM8cNG3cu
         GBuD/G0hehRdORYdotlGdM8yYHaxCKhTzsM/Pcp0uQnPFrMkEahtnKSG/k0D75dQPZdN
         idGQOqz7Ddza5SH3eKNyikURnUTFz9pju40qTK/cXCWUSIVEt/SzaDpkcuRtv/YxbvjJ
         PYWQ==
X-Gm-Message-State: AOAM530YtX35V4YFVsHkuKUr+J+rBo6ZfdtYgOI+yuBqoZNeMfo4hPSm
	pLIXwDxqEnA2UmEGFrYWShsMZ+rYncZt/saLQQs+GQ==
X-Google-Smtp-Source: 
 ABdhPJwOnUye25hdUAknd9mkeYShUZ8uU1SAG3sp7npNd7W9jDlzoMofq8h37O9VTgJJg9C+/vUNpw==
X-Received: by 2002:a17:902:650c:b0:149:82bb:1145 with SMTP id
 b12-20020a170902650c00b0014982bb1145mr40885940plk.3.1641387926782;
        Wed, 05 Jan 2022 05:05:26 -0800 (PST)
Received: from localhost.localdomain ([110.226.88.86])
        by smtp.gmail.com with ESMTPSA id
 b9sm14885882pgb.17.2022.01.05.05.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 05:05:26 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: akuster808@gmail.com,
	Virendra Thakur <virendrak@kpit.com>,
	Virendra Thakur <virendra.thakur@kpit.com>
Subject: [meta-networking][dunfell][PATCH] strongswan: Fix for CVE-2021-41990
 and CVE-2021-41991
Date: Wed,  5 Jan 2022 18:35:01 +0530
Message-Id: <20220105130501.5251-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 13:05:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160184

From: Virendra Thakur <virendrak@kpit.com>

Add patch to fix CVE-2021-41990 and CVE-2021-41991

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 .../strongswan/files/CVE-2021-41990.patch     | 60 +++++++++++++++++++
 .../strongswan/files/CVE-2021-41991.patch     | 39 ++++++++++++
 .../strongswan/strongswan_5.8.4.bb            |  2 +
 3 files changed, 101 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch
 create mode 100644 meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch

diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch b/meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch
new file mode 100644
index 000000000..279a08b67
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2021-41990.patch
@@ -0,0 +1,60 @@
+From 423a5d56274a1d343e0d2107dfc4fbf0df2dcca5 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 28 Sep 2021 17:52:08 +0200
+Subject: [PATCH] Reject RSASSA-PSS params with negative salt length
+
+The `salt_len` member in the struct is of type `ssize_t` because we use
+negative values for special automatic salt lengths when generating
+signatures.
+
+Not checking this could lead to an integer overflow.  The value is assigned
+to the `len` field of a chunk (`size_t`), which is further used in
+calculations to check the padding structure and (if that is passed by a
+matching crafted signature value) eventually a memcpy() that will result
+in a segmentation fault.
+
+Fixes: a22316520b91 ("signature-params: Add functions to parse/build ASN.1 RSASSA-PSS params")
+Fixes: 7d6b81648b2d ("gmp: Add support for RSASSA-PSS signature verification")
+Fixes: CVE-2021-41990
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2021-41990]
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+---
+ src/libstrongswan/credentials/keys/signature_params.c | 6 +++++-
+ src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c    | 2 +-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/libstrongswan/credentials/keys/signature_params.c b/src/libstrongswan/credentials/keys/signature_params.c
+index d89bd2c96bb5..837de8443d43 100644
+--- a/src/libstrongswan/credentials/keys/signature_params.c
++++ b/src/libstrongswan/credentials/keys/signature_params.c
+@@ -322,7 +322,11 @@ bool rsa_pss_params_parse(chunk_t asn1, int level0, rsa_pss_params_t *params)
+ 			case RSASSA_PSS_PARAMS_SALT_LEN:
+ 				if (object.len)
+ 				{
+-					params->salt_len = (size_t)asn1_parse_integer_uint64(object);
++					params->salt_len = (ssize_t)asn1_parse_integer_uint64(object);
++					if (params->salt_len < 0)
++					{
++						goto end;
++					}
+ 				}
+ 				break;
+ 			case RSASSA_PSS_PARAMS_TRAILER:
+diff --git a/src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c b/src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c
+index f9bd1d314dec..3a775090883e 100644
+--- a/src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c
++++ b/src/libstrongswan/plugins/gmp/gmp_rsa_public_key.c
+@@ -168,7 +168,7 @@ static bool verify_emsa_pss_signature(private_gmp_rsa_public_key_t *this,
+ 	int i;
+ 	bool success = FALSE;
+ 
+-	if (!params)
++	if (!params || params->salt_len < 0)
+ 	{
+ 		return FALSE;
+ 	}
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch b/meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch
new file mode 100644
index 000000000..0e5bce2bd
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2021-41991.patch
@@ -0,0 +1,39 @@
+From b667237b3a84f601ef5a707ce8eb861c3a5002d3 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Tue, 28 Sep 2021 19:38:22 +0200
+Subject: [PATCH] cert-cache: Prevent crash due to integer overflow/sign change
+
+random() allocates values in the range [0, RAND_MAX], with RAND_MAX usually
+equaling INT_MAX = 2^31-1.  Previously, values between 0 and 31 were added
+directly to that offset before applying`% CACHE_SIZE` to get an index into
+the cache array.  If the random value was very high, this resulted in an
+integer overflow and a negative index value and, therefore, an out-of-bounds
+access of the array and in turn dereferencing invalid pointers when trying
+to acquire the read lock.  This most likely results in a segmentation fault.
+
+Fixes: 764e8b2211ce ("reimplemented certificate cache")
+Fixes: CVE-2021-41991
+
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2021-41991]
+Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
+
+---
+ src/libstrongswan/credentials/sets/cert_cache.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libstrongswan/credentials/sets/cert_cache.c b/src/libstrongswan/credentials/sets/cert_cache.c
+index f1579c60a9bc..ceebb3843725 100644
+--- a/src/libstrongswan/credentials/sets/cert_cache.c
++++ b/src/libstrongswan/credentials/sets/cert_cache.c
+@@ -151,7 +151,7 @@ static void cache(private_cert_cache_t *this,
+ 	for (try = 0; try < REPLACE_TRIES; try++)
+ 	{
+ 		/* replace a random relation */
+-		offset = random();
++		offset = random() % CACHE_SIZE;
+ 		for (i = 0; i < CACHE_SIZE; i++)
+ 		{
+ 			rel = &this->relations[(i + offset) % CACHE_SIZE];
+-- 
+2.25.1
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
index 8a8809243..b45b8074c 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
@@ -11,6 +11,8 @@ SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://fix-funtion-parameter.patch \
            file://0001-memory.h-Include-stdint.h-for-uintptr_t.patch \
            file://0001-Remove-obsolete-setting-regarding-the-Standard-Outpu.patch \
+           file://CVE-2021-41990.patch \
+           file://CVE-2021-41991.patch \
            "
 
 SRC_URI[md5sum] = "0634e7f40591bd3f6770e583c3f27d29"
-- 
2.17.1


