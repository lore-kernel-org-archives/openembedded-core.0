Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6DEC83F19
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 15:39:26 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.10491.1693064358292612773
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 08:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=FvvBlL5b;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a9b342c398so953956b6e.3
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1693064357; x=1693669157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6rE9kHhbwoZfeYjUo2WIrkAmnonFHHHZTB6PxyFyaw=;
        b=FvvBlL5btZ920s+Jli67TRlNh7AQoHIgHSL+72j9sU1u331As72Hz3AQyN57HTgpnF
         QDUm1LiEBvFGKcQZYE9ux5yXfIM/0qQO0CnPmHTwiW7QdXyx8v7yd7nSZhNEm+NjGrSH
         hSko6/L+v8E6l9hFahvhGTkphhR5Zb395hFpf8zFE0TKs88UQeXhGRBmDvjMn9+jST0V
         5vij3/31Cl647FitDY6F6s7lIr/9LhWHqcyt8n0Dl+vKDSeDEdtsmWywbVk5fduVoa0+
         3h8GD1dHkPQMgI71f1AsFkHm9Dt2xGAX2MWO1RJSG1ZE/f1v+IKW4olUDyfiL8CXyuPA
         5bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693064357; x=1693669157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l6rE9kHhbwoZfeYjUo2WIrkAmnonFHHHZTB6PxyFyaw=;
        b=XLH684qcIcgbOfoRO4nsVqODq1JC+pcYdnYR1zeLK8rkcjnOE+5dHwCq11//dS6PQY
         OVgZlwphEC7PaW/cUnuAeF4jfwI3FXkTFIPyJENGBLXLQFsHe9pbzdIDb3ewcWDNFRfZ
         bVrpVFLkTM5WsEt+LhHhrbA/2gFhUR9EtpLvsIBv2lU8gnHaidOevPKkM/own7UiWmHw
         lF7ZH7aKavYznczSiPvf4GXx7WjVUrYy5uSTfN9rwpw588pmebB9RD6puDTEFtnXmreC
         RPeIn8KoTrpsc47VRaJlziNHtjZz5VrmzJRoyhiHRf5kwKx3C7yJR9jWUiT5HR+JCT2n
         FENA==
X-Gm-Message-State: AOJu0YyvhCvy5RBHWyjKN7Tq3FX0pXZ+Zo4QyFNX65XpglAFSyj0QBt0
	6H6Sukjb8ZAARhRARjAGb0C3CZXZeA5MvYTzQtY=
X-Google-Smtp-Source: AGHT+IE/vOsVfaveDP7ml7+A80OZG1gWRhR1pmcFRHNtoLPSSyAHSmy4xI/JFByrjk12pz7b2w/ARA==
X-Received: by 2002:a05:6808:188f:b0:3a7:541c:805c with SMTP id bi15-20020a056808188f00b003a7541c805cmr7401472oib.24.1693064357300;
        Sat, 26 Aug 2023 08:39:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g25-20020aa78759000000b006732786b5f1sm3422430pfo.213.2023.08.26.08.39.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:39:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/20] openssl: Upgrade 3.1.1 -> 3.1.2
Date: Sat, 26 Aug 2023 05:38:42 -1000
Message-Id: <e8b876d6514f6257eaaddb7b44489367666504ba.1693064194.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693064194.git.steve@sakoman.com>
References: <cover.1693064194.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 15:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186755

From: Peter Marko <peter.marko@siemens.com>

https://github.com/openssl/openssl/blob/openssl-3.1/NEWS.md#major-changes-between-openssl-311-and-openssl-312-1-aug-2023
Major changes between OpenSSL 3.1.1 and OpenSSL 3.1.2 [1 Aug 2023]
* Fix excessive time spent checking DH q parameter value (CVE-2023-3817)
* Fix DH_check() excessive time with over sized modulus (CVE-2023-3446)
* Do not ignore empty associated data entries with AES-SIV (CVE-2023-2975)
* When building with the enable-fips option and using the resulting FIPS provider, TLS 1.2 will, by default, mandate the use of an extended master secret and the Hash and HMAC DRBGs will not operate with truncated digests.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e65802383b02df6f502af859a927309d881bbb27)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/{openssl_3.1.1.bb => openssl_3.1.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.1.1.bb => openssl_3.1.2.bb} (99%)

diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb b/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
similarity index 99%
rename from meta/recipes-connectivity/openssl/openssl_3.1.1.bb
rename to meta/recipes-connectivity/openssl/openssl_3.1.2.bb
index 432ab4032b..d55695dba4 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.2.bb
@@ -18,7 +18,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "b3aa61334233b852b63ddb048df181177c2c659eb9d4376008118f9c08d07674"
+SRC_URI[sha256sum] = "a0ce69b8b97ea6a35b96875235aa453b966ba3cba8af2de23657d8b6767d6539"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.34.1


