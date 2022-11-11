Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5530DC433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 12:16:43 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web08.4708.1668168994448768895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 04:16:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lMc6Nufu;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id ud5so12190984ejc.4
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 04:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V4ouzw0QbK+SlzmTLBwXZ/Cb5Ds9OG5JJY6Qs7bC3Qk=;
        b=lMc6NufuISRIQ5aKyNbk8CVH9hoXzLVR5U1Yca1opK+NzHJYB6cpn48H3iz3IYbXDq
         r6hisgt03J1EV6lo3Swu8VhmPCGwOFYXkYOBYhScbq9usfUASxZ0Bpvf11irEZOFznUT
         oLg+LTXnR0ZiPRC+dorksz5im4HRtJMSTt5I2JUlKEZtlXzgTSVHc0JLKNqTZFTy90+A
         MFcIZkd04lcR6zY+FrSZQ/YLRQwpJ65Dd8dYicfaUm/JKXqsZOMsck6baWPQAdn3ooJk
         fm//SxAKgP/7BKJNhZI3n/SvvrTc+jxP+GwfS8fc4XyXmdIEp/I5cCHzLXZo/b02C5P/
         YgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V4ouzw0QbK+SlzmTLBwXZ/Cb5Ds9OG5JJY6Qs7bC3Qk=;
        b=fKyFv/cygwcsAMbzIi8gc8itOw1TCE3IJjTYhiXf/3P3j/oY6Slekpna/1PazZWVlP
         g1b/Y5FHz+IvHSk43cIH9InN+FR6LRayrVcIdYHBo79RU1m9oRt2AJMkkcYiry9hrP6K
         fe5J1RuDE5/K637aKRcD6q0uWTFgEGZT5H2nKQGU7LlskIu1vfvyhLRYqo3gqU2zjCJQ
         UJ5dsJE2+oXNWZ0eF1JpWEyNAgG/Pt1dtUSiN9kGxlDpCz/FMgJ2x46VKxaMXu/hr9JK
         /l/Fhln+Lkit/BkM/Zmm43ldYC3iQiodBXNOKhIHOuJVwuR9Vwk6ye4dwj75FaJvTAQl
         orAA==
X-Gm-Message-State: ANoB5pmHbqan9wVl1gPUp1xNN9NzZcjFGObo3RhzhjITdAgWjcS/psGe
	BrVY5ZZbi3cr+Qqmf9UY+Iw1TS0iTbM=
X-Google-Smtp-Source: AA0mqf7TrrO5qO8UEMruy0lLvVvs89a+e0fpyHzMf49VitLsD3xaa2XfiCMmZH1qvdbAdiXtcPgq3w==
X-Received: by 2002:a17:906:7f92:b0:78d:4e5b:ffaa with SMTP id f18-20020a1709067f9200b0078d4e5bffaamr1543570ejr.455.1668168992489;
        Fri, 11 Nov 2022 04:16:32 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id e25-20020a170906315900b007adbd01c566sm815921eje.146.2022.11.11.04.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 04:16:32 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][dunfell][PATCH] openssl: upgrade 1.1.1q to 1.1.1s
Date: Fri, 11 Nov 2022 12:15:59 +0000
Message-Id: <20221111121558.26518-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 12:16:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173126

From: Alex Kiernan <alexk@zuma.ai>

Major changes between OpenSSL 1.1.1r and OpenSSL 1.1.1s [1 Nov 2022]
* Fixed a regression introduced in OpenSSL 1.1.1r not refreshing the
  certificate data to be signed before signing the certificate.

Major changes between OpenSSL 1.1.1q and OpenSSL 1.1.1r [11 Oct 2022]
* Added a missing header for memcmp that caused compilation failure on
  some platforms
---
 .../openssl/{openssl_1.1.1q.bb => openssl_1.1.1s.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1q.bb => openssl_1.1.1s.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1q.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
index 139b7fe9353a..6c8f28599610 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1q.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1s.bb
@@ -24,7 +24,7 @@ SRC_URI_append_class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "d7939ce614029cdff0b6c20f0e2e5703158a489a72b2507b8bd51bf8c8fd10ca"
+SRC_URI[sha256sum] = "c5ac01e760ee6ff0dab61d6b2bbd30146724d063eb322180c6f18a6f74e4b6aa"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.35.1


