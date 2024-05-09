Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEAEC25B77
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 12:05:20 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.8620.1715256319342039755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 05:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3Kk5ax1p;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f44390e328so768148b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715256318; x=1715861118; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ipOanOxDyXpTvcCx1z0WMZ9dFNiqSvc57tMGbhae+Y0=;
        b=3Kk5ax1pR5H2frVkGLJvrVrSaw9ek4RJtH4YLbQCwIkh7ZN0oXZxsSo3GmelxhdPO4
         iamLA7Wmtdu0an4B5p+bUnF9a2kwE1kzc+LrEVgt3JPXAMIIyT8nuTyrEBxCKL+GVur0
         Vt/zpYmyenQptZaSArBhU7ZPiub7QqaSIKX+Wc2ZZ53vjLy4cFBZdxvaAG6cpoP5XakF
         oy4C0zGdeoPEb4OomEFEcMevLfL4ZD4q63KmDfVB12lEwPA2YeX7o6bjRvdJeab3dDNQ
         fqSqy4dfUqR0/u+ENZuHt5tnEW1BmqFY3DDrV6Fc3Ye74naF7fEJSLTcC9tzoDKoDosV
         oCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715256319; x=1715861119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipOanOxDyXpTvcCx1z0WMZ9dFNiqSvc57tMGbhae+Y0=;
        b=GsTVOpVFi9hFoz4Du3L1pdGfqV4tsmLyDk5Txi5zRhh1PyNvnBDooyZJkd3B6tcXNK
         6QryAnyropkIBXwArcO6VG024kCnqAFxFEorOV+VjHsrzKkn4NTCpghwhXZXc533L9Pn
         hVLo6t4/ToKkZRDX1lczPyEjkCwvv+b9CqjDcFkXJEuyCkW6pVlT9cIyKQ2GlORd336u
         /462DZ5L0G+SbNhXNfWUlRtvWT6duBeNTKa2YbfKOzzCHXjVfZmjwB7HqBZroh/aqyFQ
         ghvj/5pQEE+rNKS/bNtK/+C20Pn9YJQP5RE0IAP1Ksg/Ah1rnUro0IR3qeiQcHiqGGwz
         F8UQ==
X-Gm-Message-State: AOJu0Yz1ZhDx8Uqbvy5wFZFmYgqrq6VMenFreaEX2WPJi1z3JMTL3FVQ
	Cv9esMXTVOlPPu03TkZjPYtDoGTmNFdmhlO6heB6FSRFtnkAHQ1XhMFvDpDdJrOu/xXma4tqhGu
	z
X-Google-Smtp-Source: AGHT+IEga7GisI008CqiiM0qZdDwrwDxSBqsZeEpEBd8qIbkuj1XzYgjsEDt8DtNpsuPUypatQNxwg==
X-Received: by 2002:a05:6a00:7390:b0:6f3:876a:c029 with SMTP id d2e1a72fcca58-6f49c211a8bmr6445588b3a.10.1715256318583;
        Thu, 09 May 2024 05:05:18 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2c41sm1185613b3a.172.2024.05.09.05.05.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 05:05:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/23] python3: Upgrade 3.10.13 -> 3.10.14
Date: Thu,  9 May 2024 05:04:45 -0700
Message-Id: <e0b77aa347c03f520802c8235ae0389bb855c146.1715256149.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715256149.git.steve@sakoman.com>
References: <cover.1715256149.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 12:05:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199154

From: Peter Marko <peter.marko@siemens.com>

Addresses CVEs:
* CVE-2023-52425 (bundled expat)
* CVE-2023-6597 (https://github.com/python/cpython/pull/112840)

News: https://github.com/python/cpython/blob/3.10/Misc/NEWS.d/3.10.14.rst

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3_3.10.13.bb => python3_3.10.14.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.10.13.bb => python3_3.10.14.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.10.13.bb b/meta/recipes-devtools/python/python3_3.10.14.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.13.bb
rename to meta/recipes-devtools/python/python3_3.10.14.bb
index 76e37e42a1..31c458c09a 100644
--- a/meta/recipes-devtools/python/python3_3.10.13.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -44,7 +44,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "5c88848668640d3e152b35b4536ef1c23b2ca4bd2c957ef1ecbb053f571dd3f6"
+SRC_URI[sha256sum] = "9c50481faa8c2832329ba0fc8868d0a606a680fc4f60ec48d26ce8e076751fda"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.34.1


