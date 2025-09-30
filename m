Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74468CCD182
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:50:31 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.232.1759261826161621060
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Oj75s7L5;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7810289cd4bso6044968b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759261825; x=1759866625; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Re5M6v/AZnhdSj6vXKqCYigh2hO93pIgboE7v5sVUVs=;
        b=Oj75s7L5M9pfgqzDj8QkkwJKWtTIDJmMw2SPpolQ3ynfMWO+iCBQvsXh9gobPGaXQ/
         dZK4Stkz3CeMVvQq4M98+SWbKZgyg+bbbNFn7ibiUhIntcpWNucwc1cr0yswRsieqCPF
         eLLi+JzXuuxbvkWBMjn51bOnWjeH+j6jUcjTLAMSaQl8lou5+Zv1sf/041qgK9gzd0XC
         y9pcfNN2qHW6VXZRt/vTfokLo6nPuPoKXviLaioeE1ikmiCdRbtCNX7F4DxiGvf6StzT
         gLiv5Htk5w2QDox+RXRxQovjWmPSaXleShtUvTB8NfcJe6EsnpzSEI2ZqWVz8SqZTdze
         TTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759261825; x=1759866625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Re5M6v/AZnhdSj6vXKqCYigh2hO93pIgboE7v5sVUVs=;
        b=IPRnRHKZ+w9/QW/csCT9HQTWF0e0wiUkCzCEKMASp+E3EUTvaVap70sI0EspbzHTSB
         s0Ly4T7XcBuw53aD4ZsrpQtPNcvGwv2jDw79EjsV2MKCal0M0YxZOl8OFfEkgAR9koTA
         KlsWUmHhninLd1lqO1Un6L/ESAtmnSSKESK7/0jXuHc/RDj2XVXSn3l/oPar4auppf/X
         3Ch6EnwiinSCm8zxAqLZ6LJsMcsT9ACVwE7wFf8gKCfOMTApHglTx0r8SL0sViWYwy6h
         axii3hmuzx04X+NHcijgLZp27FDUjLD/G9vHJwprbfPYDiyxqT2PtCUFNWInyfMsEOS7
         gk9g==
X-Gm-Message-State: AOJu0YwbdR+hhVH5Z0Fswo42MQ7JjqNe2N1Bkk2DCgdX5844NvgdDa4L
	bPLofij7sUq1ZC9f8fjfC8SdcBT4KQ4ZosEtWFKk7TRql3UqUz2bIc2OH+M2u7hZHkQT4uTN07K
	JCXBj
X-Gm-Gg: ASbGnct2MfL/mMfHkwEh93hfu04MACnX2//VnOVX+ZcMwJt4V7x/oRmdf1nbco3IKbo
	JdLEAt+2JXyujYUThSTuhyOrlVK7Rpmkz/MVAB0OG/3xwFtRVFfYl5LSJKu+3tg5W2rExQ7TZns
	uVO+2NfiizJJVQGzio9awuFUhwxCYwL7z74mrgyieNB2P6gI8cg1DxOh9/XIb2M1NCYWAnItcZ3
	cI/D88GY0AuY6odboF2kRY5X9RqIHBZ+VcteJKsTU0Yc7fM0B9/bx+F0MOkq4uwwpUQxBGQ12xH
	Gn89rZz1vOBKAhstrXcQdpD3caKlxzwG3FDjPA1fSPPS4Ugv9Q46gwo/LOogLIegvklFMJhQ93/
	MycAidXSEPo0T4EnnWKA7DKrR2fHNV8qkC8D0jwKTWgQyzz/4
X-Google-Smtp-Source: AGHT+IH1cSHx8vDKKkeZ9XcXFKKTMqS4XeeUzbTR62NGsaOzpZuCFW3E9A0ggFkZ68b56ieNnP/7jw==
X-Received: by 2002:a05:6a00:190c:b0:78a:eff2:6c0 with SMTP id d2e1a72fcca58-78af425d764mr629528b3a.25.1759261825297;
        Tue, 30 Sep 2025 12:50:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm14411202b3a.8.2025.09.30.12.50.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:50:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] python3-jinja2: upgrade 3.1.4 -> 3.1.6
Date: Tue, 30 Sep 2025 12:50:08 -0700
Message-ID: <7108dccff524888d77f0e5e02d9cc4523a700a91.1759260542.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759260542.git.steve@sakoman.com>
References: <cover.1759260542.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 19:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224199

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for - CVE-2024-56326, CVE-2025-27516, CVE-2024-56201

Changelog:
https://github.com/pallets/jinja/blob/3.1.6/CHANGES.rst
https://github.com/pallets/jinja/blob/3.1.5/CHANGES.rst

(From OE-Core rev: a935ef8f205c9510ebc5539c133960bc72504902)

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.6.bb}     | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.4.bb => python3-jinja2_3.1.6.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
index 3fe82d5e4e..d4f61cad26 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369"
+SRC_URI[sha256sum] = "0137fb05990d35f1275a587e9aee6d56da821fc83491a0fb838183be43f66d6d"
 
 PYPI_PACKAGE = "jinja2"
 
@@ -22,6 +22,9 @@ SRC_URI += " \
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+
+    # test_async items require trio module
+    rm -f ${D}${PTEST_PATH}/tests/test_async.py ${D}${PTEST_PATH}/tests/test_async_filters.py
 }
 
 RDEPENDS:${PN}-ptest += " \
-- 
2.43.0


