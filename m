Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12721D637BE
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 20:42:54 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.21885.1731530569147125025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 12:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EFZjNtDb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c6f492d2dso82540635ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 12:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731530568; x=1732135368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=baQMKVCOBW0rlK9VlrQSBdkaeNtPYIylu3KiiR6yxb8=;
        b=EFZjNtDbf+V1GVb6+gXKCD47Sfu6KNubB6b0Kuz8o9l0hz07Mo9lXDxgQjWZCLjjig
         +Dj4ay5sIcb3SWqdat4rewEkafej55PRijCqVCt9HfNOWRt3Zikkru5vkvBIA0D7ndtC
         rdZofEeHf6KQE2hV74nl9HAm7jhkeeaQ5nn8oio5f68N1CEsokDt4Mg6PDGzdS06ym1k
         tj6omOv3fyzQY2aCHBTHoY4hnmyYmWkxbJD6YSfsTUAPuvfTfz94Fn3KaJtl3UeoiuqT
         qaligv3XxndAua0bXXl1t5K498dMM3Vggics5EE+JuyUSPV/OJEX7Tmh/pXUf5/0jGbJ
         jOvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530568; x=1732135368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baQMKVCOBW0rlK9VlrQSBdkaeNtPYIylu3KiiR6yxb8=;
        b=gXhPXZBooHRcvpe+LK6o15oVGiLi166JZ3ui/UnxVf8QwxLHJpipIYhmwg9jl/4ku/
         C3nuoA/O1GF+VwEswBHrxjLUu4IMR+KOIVQI8cPltQvBEYHqRujt4aYvHRKKnlzQDecT
         qgnlEoguTRjCYDIcenmw0BUpJM1cVzAB6YmDu+b3U5Wx/rwcZefv/NuBYjIp7jidRSI0
         rKJWVRPq1oYYllJCaQ7GH0w2s1LaqMNHxqa99ua/ojkK5ttvC4SVjQiPS2NoPLw9m+GE
         LyvuPq/999/nLDSC4eCly/ROt3qS9A7Xi7G6qncqlAcwMWnxxjVQZgzcwXgwj7UdTECf
         SVAQ==
X-Gm-Message-State: AOJu0YxQTUaKH29ZKnaQfK+7ymSp2jaapY6wjXUzFFcAR+yDPjdJDIOy
	DaDvGrCnJXleg+vmvEyPJw1GEo/YL1s83K0cQjWpPIZZpg88mxRj5vp/BjjxhG+hTGMJp9CAOKv
	w
X-Google-Smtp-Source: AGHT+IGPJhcgj7Tl+QUCjG1k4box3wM2o93UiBf8iqNbsTtYuV5bxZphLwYaLg6Dly65PU7fZ5G/Hw==
X-Received: by 2002:a17:902:ce0c:b0:20b:4875:2c51 with SMTP id d9443c01a7336-2118352a6damr295290195ad.27.1731530568409;
        Wed, 13 Nov 2024 12:42:48 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e84ee2sm114545595ad.274.2024.11.13.12.42.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 12:42:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 7/9] binutils: Add missing perl modules to RDEPENDS for nativesdk variant
Date: Wed, 13 Nov 2024 12:42:22 -0800
Message-Id: <a1317e52260eed9961291d461e48a4915ffc36bc.1731530398.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731530398.git.steve@sakoman.com>
References: <cover.1731530398.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 20:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207131

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-html --help' to abort with below errors..
  - Can't locate bignum.pm in @INC (you may need to install the feature module).
  - Can't locate Math/BigInt.pm in @INC (you may need to install the Math::BigInt module)

By adding the following perl modules to RDEPENDS fixes the above errors:
  nativesdk-perl-module-bignum
  nativesdk-perl-module-bigint
  nativesdk-perl-module-math-bigint

(patch taken to master branch with following commit id: 05f1099acbbb10b6ce33ea117d313749f7dc4a47)

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/binutils/binutils_2.42.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.42.bb b/meta/recipes-devtools/binutils/binutils_2.42.bb
index 2cce40f1ef..8594db9bfb 100644
--- a/meta/recipes-devtools/binutils/binutils_2.42.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.42.bb
@@ -72,5 +72,9 @@ SRC_URI:append:class-nativesdk =  " file://0003-binutils-nativesdk-Search-for-al
 
 USE_ALTERNATIVES_FOR:class-nativesdk = ""
 FILES:${PN}:append:class-nativesdk = " ${bindir}"
+RDEPENDS:gprofng:class-nativesdk = " nativesdk-perl-module-bignum \
+                                     nativesdk-perl-module-bigint \
+                                     nativesdk-perl-module-math-bigint \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


