Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04258D2F7CA
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 09:22:30 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1866.1764926545722762301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 01:22:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJisplWf;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5943d20f352so2093600e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 01:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764926543; x=1765531343; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MRD/4NSg45KQwA0kpBM+TyWtZcGTnOBU6f42xULAHFs=;
        b=HJisplWfl2gOwDhsE5zL7o8MlMS/+NuLahYV35IAQVWBRNlaoDoB8Oa2bPARg+S9DJ
         7iInxES5seqvaoPNQY23AaAJnYQjpfOSL4At87n06yBoxr7qWsA7XqbptDILwPp2jO5l
         mqu5v7AJhqJeK5mNNuhQ4y0opGFsVzzfgIT62of/q8DRFPJxOi+Z3t8O1oWaOrnoKesp
         71nXydR9FOYZ11NAmTpmAbo5bWjUVdC4WEgHXphjpTH6L7IjwS7FoThlXIKx1yDdie/Z
         e7ikZGmyuBEHSChuShFwMYQy2xitHar2OkC4QIaa9XOO7dcgC2cCNtcrcz2a8yCu65Lj
         5faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764926543; x=1765531343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MRD/4NSg45KQwA0kpBM+TyWtZcGTnOBU6f42xULAHFs=;
        b=jL8wRzxbFMFryDu6UyjXI80Zh4/sD1GZb9xxPHBWuq1yCZ5Y9rxOqQSR6VE+9WhPWa
         WPhpd3clyNHajjhMt70CYJt5bc9caiCMqfMeBBI4DxTTHULCsLIN+TJgupLVy4tpR9E6
         N8/2akRIWUFHfe20VKkeO7QtpVC9ne1i6hwKBF7ThVcTCOE2ftPfLa6PKALqxEY4w4ty
         bSAdlfwgCXbgDt12jnSLmI8SJbCsTHZApuWXEH61/eXoE0aUIF4zR6xEeEIhRxOeig/O
         zEjCSajc+1I56wzYbAxHerJ27YxpCmlM1o/YGZXSHmMYSiebZrnjNobFIPOp6BxZC0lL
         5WRg==
X-Gm-Message-State: AOJu0YzQZJTLE88mFWPr/aqsJm0KGe1pU7ZtHVum2NJUxFkIvwvufzEa
	9NR+iPGk/csfrIP9oESYhUCv/KDoRKRJGapJnZeFsduQQjyPcIrSKyjFaYQBU97R
X-Gm-Gg: ASbGncviQNaQx6I0kZMb8TTU5/UZnGeCBzzQ1KKXSD690vj8JFdMoTPNRUg5pArWtsc
	13uu/87qvpkOjZt1lZOUPP2p2zswn2ymYqnGyQcTuqIpTK8bf4w/DhvyuEXJ6iFdS1glENs2/Cn
	kLdOGY8UZ/QvRSDGlLQ1YsF1FR88P5kiDHPt+1rP9ncgOxhI28MlQMFO4N31PW7diXm4ULek3U6
	34JszLZEwBMPrjOkiTSxwgWHQhCXlQlB9rfAy+wzgxFUDkqE1sjhQfHCXVVipijszavBiT9Yndy
	zu+8F/tCOFgkXhCfdV7TOtLowcs7Ij5fU4u1fDaqvJBEKCHpAaBlzYPX1Zn3zVmuuzmTfC/PI/j
	LSRvI8s8DBKtWYs/erw1jYwdzbs205cPmRDFXGyJGFxDOGs4k2LRcpt/FEeN8Mr2RaxXUlkylO2
	+hAITrtukEOwmD1t7Pr+dlUJrxtioGUsZHsD3uNuHfpwtr23M2IkBuFWRy5UNGj3k=
X-Google-Smtp-Source: AGHT+IFRaoM2t46k0Cjuz5hRWex0Rmf/4WLt8Hq3/0At0gym5znXBH0ua8WBHmbdDLu6uHlUFnUsrQ==
X-Received: by 2002:a05:6512:39cd:b0:597:d74e:d6f8 with SMTP id 2adb3069b0e04-597d74ed976mr1776139e87.37.1764926543078;
        Fri, 05 Dec 2025 01:22:23 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io (ip-109-75-238-172.customer.as29154.net. [109.75.238.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b2481fsm1309641e87.41.2025.12.05.01.22.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 01:22:22 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: add PACKAGECONFIG for Schannel SSL/TLS support
Date: Fri,  5 Dec 2025 09:21:51 +0000
Message-ID: <20251205092151.165521-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 09:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227345

Add new PACKAGECONFIG to enable the Windows native Schannel SSL/TLS
library support to be available for mingw32 builds.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-support/curl/curl_8.17.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 32585070eb..4d27b68d93 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -65,6 +65,7 @@ PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
 PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
 PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
+PACKAGECONFIG[schannel] = "--with-schannel,--without-schannel,"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
 PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
 PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
@@ -79,7 +80,7 @@ EXTRA_OECONF = " \
     --disable-libcurl-option \
     --without-libpsl \
     --enable-optimize \
-    ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl', d) == '') else ''} \
+    ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbedtls openssl schannel', d) == '') else ''} \
     WATT_ROOT=${STAGING_DIR_TARGET}${prefix} \
 "
 EXTRA_OECONF:append:class-target = " \
-- 
2.43.0


