Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D0FE6E7EE
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 10:19:44 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13495.1770113977942620414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 02:19:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=liP2Esfn;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-435903c4040so3622225f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 02:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770113976; x=1770718776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHCdsru3/MN+Tcw2tlTxxKHtVmAQ7+P24Td+PVWVqWs=;
        b=liP2EsfnCedVYFRuJfGWwrs9bhGACPZngPZCjG9r4nJUGJnRohMI5VgK6sna+irkr1
         3bgpeQUZlxh5DL/wigCgY38wZYD/VHppRrUCqOfTaQJSLYgdfiU3XG6xkZKDKKR7anGs
         tPVfa1X1BulgSDrCtpDcqaeEQMNxy6YtTBRkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770113976; x=1770718776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SHCdsru3/MN+Tcw2tlTxxKHtVmAQ7+P24Td+PVWVqWs=;
        b=wXL8RCXL0Zu1xBqk56JdPvvU2fRXTkeLNeRtVj6xnuvXlA71VaOsaVVaqEbVYOmHTK
         yqfhzFUNd+JpIk5cPE6cYjTAct6K4qweA0adzQJpQj2Vm8/2C2Bv8ZqlQDMppUzTtIba
         I5xAMSzLzBH99qn50CYpEBea9rdtR5VYCwFZ2g/9yIFrtdXQSIdGWj94FTcO5gpDeQwY
         7nWtFdg+dE51O8qh2jhO15hHZMXB8qiWqrenWhDU88pPF3fCJqWCVdX0BcXSQ4XmOU4X
         3MF9l8GMHkAiE02H3bn9yca9SNpBsaa6g1OwLxT8w1ZyDQfcJZwwyIrZGYq5fGsUSH0Q
         HvJA==
X-Gm-Message-State: AOJu0YwT3IejSl/L7U2maAQf8fHOGSQb8/D5BSzKQoe1FcW8n8l7+Ozj
	3Z+a4U24OUcP+t1jQq7C8Mx4k4fOMPxcWntglt/3yICospC0D/Nbbf80maAPCMH95qs+FAMg7/i
	qrycD2uc=
X-Gm-Gg: AZuq6aIDTcqxS0qb0nEqwSmy9nT3hGO3rLnFGY5swGJ/9rOhaceB6YpW7nNcMCJSpFj
	vGJ7AOClIy2873yMrGkh5YO1rq9V9fdSyb2bUCmvLWt2ehREwXsKUtTr8ZS+jfBEXZz0UDbW/8e
	6+twDVBN76EOsoogYkvTmIzk86RuVjkU+89nL1BBrh1HOMjOnGJurpUM2AJ58yEK5wcwHbVndns
	JI8SqAgmyCpL3pqhbd//qy1Fjor2m/lvGF33caVwM1aOkqhJNKWaaYx/NxLTcgwoV281YeBenA6
	xlcDlepcOIM2CIzNZGWFZEkIFBFChN018TDidT7HaGEA8SSaBGDdTqAacvSrXhyQ1sseOaPY3Re
	+kUb99hMZwNU5DmNRja1HDaTWO/WWDtx26BH3y2V9EACY63IDfWYx4m2+8m13dX4LURFIsRNLLR
	xRTwfMQPkQ0n9b/ehUx/tdBgEE3jaHP1MFQR3z/UBnxG/xq1yReAw0Y5lzdyv42BW5WbP3Bw0pG
	RvUbLE2l6UlEZc=
X-Received: by 2002:a05:6000:61e:b0:430:f985:a7b2 with SMTP id ffacd0b85a97d-435f3ab59bemr21277596f8f.51.1770113975891;
        Tue, 03 Feb 2026 02:19:35 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131ce70sm52293041f8f.27.2026.02.03.02.19.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 02:19:35 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 21/22] expat: upgrade 2.7.3 -> 2.7.4
Date: Tue,  3 Feb 2026 11:16:50 +0100
Message-ID: <161a9eac37a60d5ce36b1c0e5727f8fbe2249e06.1770109549.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770109549.git.yoann.congal@smile.fr>
References: <cover.1770109549.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 10:19:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230449

From: Peter Marko <peter.marko@siemens.com>

Changelog [1]:
        Security fixes:
           #1131  CVE-2026-24515 -- Function XML_ExternalEntityParserCreate
                    failed to copy the encoding handler data passed to
                    XML_SetUnknownEncodingHandler from the parent to the new
                    subparser. This can cause a NULL dereference (CWE-476) from
                    external entities that declare use of an unknown encoding.
                    The expected impact is denial of service. It takes use of
                    both functions XML_ExternalEntityParserCreate and
                    XML_SetUnknownEncodingHandler for an application to be
                    vulnerable.
           #1075  CVE-2026-25210 -- Add missing check for integer overflow
                    related to buffer size determination in function doContent

        Bug fixes:
           #1073  lib: Fix missing undoing of group size expansion in doProlog
                    failure cases
           #1107  xmlwf: Fix a memory leak
           #1104  WASI: Fix format specifiers for 32bit WASI SDK

        Other changes:
           #1105  lib: Fix strict aliasing
           #1106  lib: Leverage feature "flexible array member" of C99
           #1051  lib: Swap (size_t)(-1) for C99 equivalent SIZE_MAX
           #1109  lib|xmlwf: Return NULL instead of 0 for pointers
           #1068  lib|Windows: Clean up use of macro _MSC_EXTENSIONS with MSVC
           #1112  lib: Remove unused import
           #1110  xmlwf: Warn about XXE in --help output (and man page)
     #1102 #1103  WASI: Stop using getpid

... and additional docs/autotools/cmake/infrastructure changes

[1] https://github.com/libexpat/libexpat/blob/R_2_7_4/expat/Changes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/expat/{expat_2.7.3.bb => expat_2.7.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.3.bb => expat_2.7.4.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.7.3.bb b/meta/recipes-core/expat/expat_2.7.4.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.3.bb
rename to meta/recipes-core/expat/expat_2.7.4.bb
index 069254e13c3..95a1ed52c41 100644
--- a/meta/recipes-core/expat/expat_2.7.3.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "59c31441fec9a66205307749eccfee551055f2d792f329f18d97099e919a3b2f"
+SRC_URI[sha256sum] = "e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

