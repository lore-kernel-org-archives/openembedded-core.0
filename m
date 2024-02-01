Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6ADEC48292
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 19:37:52 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.4928.1706816270366682710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 11:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KvwGizEd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ddcfda697cso1044594b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 11:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706816269; x=1707421069; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KPsYFMC2RMX4mOQCkuVY2LJZQ9jKLXgUsYwnTMwXQs=;
        b=KvwGizEd3xuUu449oE4TKAwsrmGcGRNtXKm+35lf9l0a9jvVxmFPKPSKrW3M1atUJc
         Z+Sq7jRlITfrzwsIZS6f0vV4rUh6GA8fuUHw5K+HDT3JfKZoJ2LRixcCMISbU4E+Xlpz
         /2MFrLFKpceRBAhx8aVQfhIi3PzPvg/c2Lj6otZO7oYdI8RYozThYTExS348IGWKq6+p
         udrpGGnnFaEZV3WWfh49TW5rf4P0DZeZrPr23Hd0baROLI+M0NYyk7jW1KdG+DcrFx/z
         hHQku9x1IpCgHrGZt1mY8LReUgUQWQG8Y5bWeStovtvMgFBdUbdd21bg1GJCNMrO73Pi
         9VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706816269; x=1707421069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KPsYFMC2RMX4mOQCkuVY2LJZQ9jKLXgUsYwnTMwXQs=;
        b=u5K8p5htlOSJD+f4ECuqMaHt2agc7sC79u4y4o+LWnvSdm/z0hh9uhQ1zJzdHARroL
         GBY9rkjMHWlF7GVuir7CHGzKIf0WbFDLYWkzVl0Ukulinkjnspzdufh6g1BHNXR/Yqdx
         FQ+/vgCJ7nDDDEy142igbmX87gw1vGNgEOcN81d7nEIKyimLrKuBWJOhzTS1q4GVhRw1
         Y9iNhjVyz4S6jWtpcBdL1o/yalh09sPrUUI7uFD1uDCDO1Xy8F2sm8lF09bjPjTdx9Lt
         Kmh2D71mKmtX28l0SCfRY3QOd3X+XyiMSmXS25MLybZEbu0/szwmvBlg+GBW5BQjUlzS
         1cIA==
X-Gm-Message-State: AOJu0YwQ59e/5Ywb91ZwP4uxGLMDtz9/n43TW9ZoSAw9+2ybi4bVUxnm
	OJwJnQ2WYEwR91BOEAV00bVBLLrFVvleVbivANiGVwMVpNueEcp5h+jLaO/rxAFhTIFlO4h29Ma
	BtO0=
X-Google-Smtp-Source: AGHT+IGs0i8XZYduArjf5yaRjgXMeXldFvMZUv13FtDAMy0WshMf8J3x6AExFn7GFk+jGUvTkt58jw==
X-Received: by 2002:a05:6a00:26df:b0:6de:325d:8ed9 with SMTP id p31-20020a056a0026df00b006de325d8ed9mr5985153pfw.29.1706816269374;
        Thu, 01 Feb 2024 11:37:49 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id e10-20020a056a001a8a00b006dbdbe7f71csm109717pfv.98.2024.02.01.11.37.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 11:37:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/4] python3-jinja2: upgrade 3.1.1 -> 3.1.2
Date: Thu,  1 Feb 2024 09:37:40 -1000
Message-Id: <90960bdef877c5dc03cc2cb03c77139d6d1e2f8f.1706815725.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706815725.git.steve@sakoman.com>
References: <cover.1706815725.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 19:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194736

From: Alexander Kanavin <alex.kanavin@gmail.com>

(cherry picked from OE-Core rev: 1e58fa1fff649a4ab07290d2b0e5a8d69d51ef16)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jinja2_3.1.1.bb => python3-jinja2_3.1.2.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
rename to meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
index c38686a5c2..80e0b85670 100644
--- a/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb
+++ b/meta/recipes-devtools/python/python3-jinja2_3.1.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/Jinja2/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "640bed4bb501cbd17194b3cace1dc2126f5b619cf068a726b98192a0fde74ae9"
+SRC_URI[sha256sum] = "31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852"
 
 PYPI_PACKAGE = "Jinja2"
 
-- 
2.34.1


