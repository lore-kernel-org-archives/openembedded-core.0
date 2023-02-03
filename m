Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40809C05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 17:51:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.17959.1675446673047560596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 09:51:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b40FOryQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id mi9so5738337pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 09:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/ifrFbly4K7dD/XnNzfsYnKURL8g/KynApkvFhrI1Q=;
        b=b40FOryQ6djpDwCSKZrT6+YoNxkIBJe0JzDr4Y3r0hbqf38BCMyIVBgQhnD11/cQr0
         X64YI8KuHEvRNI/EMTVtb8BJOW2jx1KnpmM8eGFw0Bn53bIIpP5FKBO8GD4kPOs/950Y
         k1ZSNziOKzfChi4t60Jg8ITdhc8ZjnYRUeRztvkjgFHlnidQiiun94L9QH/4ufH6aFHF
         rMwaiKSdzO42KYpX4xRInYV4gWvEcJ4yy4mF+byKGza0Z4XG+fkr9IO+nFErfZFvt/Lo
         Yeee6qsRWwAwmcMOP4906ZMBRrTgBfwkwHjdafwKF3THW8w+uEFleQNpZkYPAZKWFrcW
         JLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/ifrFbly4K7dD/XnNzfsYnKURL8g/KynApkvFhrI1Q=;
        b=0c3T78Prrabd1eQpEm2MD4mDLjG626lGCYcypRWRXoJIdGugIoBVjVoJIL61GF0K6k
         rq/aXNoLP/LFqlL7nGRo7tCC0DqsVLQXuHK/n8RT2wCwq71cgwpDmZWk2ZJ8Ms3/xksZ
         VGAI5kgq4p6bPd+Hu1gjozEqYu6PrAQH9hR7Qgyvckrz6pL/3ljsEN6V9TfjPZFnGbah
         hyO8LT9MS0zQV4tUz2ui/+4WKSv2dwfR/3nlr2/koLt/LJW7futp17hrSQqZvt4etlkI
         MQcDrDsUTcoai2QCR3+gPLRL2oqyT5hkkrMCwMCEulfkcvrP5gUbw3QfiER3hrmStipr
         /OLw==
X-Gm-Message-State: AO0yUKWmUV5/Qc2B41oInBnnp0mgZQDRF8WcSYJpAZ56ZWOwdbhmLqEf
	qOdc7JFeR8Hj+hnJLonvFrlOpXs2xBo=
X-Google-Smtp-Source: AK7set8/zaSHcnZTtVjXRTLUFFpLKl/WhWClOg30EnWv6HHX7xFqhKGM2eqVfBY6kUWw+PImZggUsg==
X-Received: by 2002:a17:90b:3b8b:b0:226:3f8:5b78 with SMTP id pc11-20020a17090b3b8b00b0022603f85b78mr11288414pjb.13.1675446672122;
        Fri, 03 Feb 2023 09:51:12 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:46a4:f9f7:31dc:7e2c])
        by smtp.gmail.com with ESMTPSA id o11-20020a637e4b000000b0046ff3634a78sm1712880pgn.71.2023.02.03.09.51.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 09:51:11 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/14] python3-pyopenssl: upgrade 22.1.0 -> 23.0.0
Date: Fri,  3 Feb 2023 09:50:32 -0800
Message-Id: <8a9a2f993d27542667f94078f8d4b75326ea9ff3.1675446372.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1675446372.git.tim.orling@konsulko.com>
References: <cover.1675446372.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 17:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176745

https://www.pyopenssl.org/en/23.0.0/changelog.html

23.0.0 (2023-01-01)

Changes:
    Add OpenSSL.SSL.X509StoreFlags.PARTIAL_CHAIN constant to allow for users
    to perform certificate verification on partial certificate chains. #1166

    cryptography maximum version has been increased to 39.0.x.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...{python3-pyopenssl_22.1.0.bb => python3-pyopenssl_23.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyopenssl_22.1.0.bb => python3-pyopenssl_23.0.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb b/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb
rename to meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb
index 4d83b8c7d74..822d21a58a7 100644
--- a/meta/recipes-devtools/python/python3-pyopenssl_22.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyopenssl_23.0.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS += "openssl ${PYTHON_PN}-cryptography"
 
-SRC_URI[sha256sum] = "7a83b7b272dd595222d672f5ce29aa030f1fb837630ef229f62e72e395ce8968"
+SRC_URI[sha256sum] = "c1cc5f86bcacefc84dada7d31175cae1b1518d5f60d3d0bb595a67822a868a6f"
 
 PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-- 
2.30.2


