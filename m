Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C850EC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 13:33:31 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web12.8337.1652448805987185028
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:33:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fKV0NXEk;
 spf=pass (domain: gmail.com, ip: 209.85.218.50,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id ks9so16333675ejb.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 13 May 2022 06:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M1yR2emK0BTmGA+XpKUbZvwTsqow9yK6foSdpzIy8Lo=;
        b=fKV0NXEkKn3D65hZ2Yk5oucpSJYrbesoFz/qOlxwHemowloy0jQo50zZXZ0xBZ7tea
         v9rnkz1HJgDvP+yC91VjmJoM8OAVq4WHH/e3jq3hbVah4Y/tVsN7M6OsLVbyShRQ/zLE
         7Xb3q0mYTxe0A44/+Nx8eJz7bI9JoMT+EshLkNSVLaFBNYiXb8AbYSOJLXZWtfTLS5hv
         CoOkvEGPtUllrMaXGID4+ZDt91zs+m48Lo1Sz+xtzYkltuL256vHEETcFR8CZ8QMo79o
         h/jU/tSybChphpiMEDd8Piy/Gmi1t7MITFGuBkTnDz1AZaiK1/1+C9kaMLrEse5w/l2W
         f10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M1yR2emK0BTmGA+XpKUbZvwTsqow9yK6foSdpzIy8Lo=;
        b=blBUMZm1ehEFTbL9aeAzW4hf71qbVXtnv76kBsBqiGrLNFKwLJpr1gN8zpuiMxt/lX
         tx+IR/9d6Ugs67XOTBOuAEGItVVE5XZ8td92QuKnRsdlQCAiSN64pxS7UScb1WygFFe2
         HQjQ8vagGRu0mbs4Dk5hycVmfrOCvfCXL6txnLWqC0cN1ju6ltKUXZsENvpCe8KVS+IO
         0/PoZrL5+sUnGaieDA3ofPZJgFm3j1LFY1VzuSyh+2uIYNIsehBkWMme9KYssvsxn0VQ
         00mHDxsfwpGeeysXybt/4UYyKaUnYTx3JArwVtyofUNRHvETjzR47SRlu3gWsRezF33u
         sUPg==
X-Gm-Message-State: AOAM531V4YacZ6nB3aqftIxqcG1DOnVt5SK1P2KZwqTVm+4fRIf4FsCn
	spXswQUDxmYxfLlJ3axLzxMnX0lf8uQ=
X-Google-Smtp-Source: 
 ABdhPJwvJq49XAvhRobK1g3wkKm3aOKy4Buh7SMum0KHip2flV8Qc/J6cw8eD77biX5T69BkZk6bYA==
X-Received: by 2002:a17:907:7f0a:b0:6f4:4450:d1bd with SMTP id
 qf10-20020a1709077f0a00b006f44450d1bdmr4292997ejc.700.1652448804003;
        Fri, 13 May 2022 06:33:24 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-5-19-80.retail.telecomitalia.it. [87.5.19.80])
        by smtp.gmail.com with ESMTPSA id
 h5-20020a1709070b0500b006f3ef214e06sm783803ejl.108.2022.05.13.06.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:33:23 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [PATCH] openssl: minor security upgrade 3.0.2 -> 3.0.3
Date: Fri, 13 May 2022 15:32:58 +0200
Message-Id: <20220513133258.903971-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 May 2022 13:33:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165562

This minor version include fixes for several CVEs

CVE: CVE-2022-1292
CVE: CVE-2022-1343
CVE: CVE-2022-1434
CVE: CVE-2022-1473

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 .../openssl/{openssl_3.0.2.bb => openssl_3.0.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.0.2.bb => openssl_3.0.3.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.0.2.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.3.bb
index a809666aa7..fd88ae807d 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.2.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "98e91ccead4d4756ae3c9cde5e09191a8e586d9f4d50838e7ec09d6411dfdb63"
+SRC_URI[sha256sum] = "ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7795df31f8b558c0b"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.32.0


