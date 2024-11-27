Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092E5D6D226
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:22 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.78781.1732733414809613072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ffRo+vEg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7251abe0e69so111641b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733414; x=1733338214; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fozTslo/T0djC5yNMUvXWVW671uUVLvFF+VeY5u2+Pc=;
        b=ffRo+vEg6DFDGbc66M2F7ibNuQQXHnH/wnOi0msLrSMFAnBh/E4qh9mkJsWqfSv+IH
         VsGLMRQeXLh85iGufmLl/Z2ANcNVATbEkRCcd+gi9QhxP9l04CnEfboV6n3XFGwnTKzj
         4esLI4EHuysI/s6j+YGb7mPpQ3j59FkZwCsOEmPJ3oDz32Jrt5LxC2nOa9BkuYfAZ5tq
         z+05nozeMcEqU/wLgOFQarZssSyA9HKh6i+MdFDOCsrmf0G2xwPnk+KmsJAv6RHtxC4R
         Xnmq/llN+pFKThruLhWsc3NXnv73EAdvlCGqmhRuRg5aMzcard3XrpTCVFHaR6hKsR46
         WNJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733414; x=1733338214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fozTslo/T0djC5yNMUvXWVW671uUVLvFF+VeY5u2+Pc=;
        b=LCFYnkUIqeI4yvPUBl9qUedoVfO7RvoXwO/euCaXf57x1MaLF8RUM6M81Ll9FkqVeW
         Cwml7P3BsCGX4dmbMdcvAlwev9ysuC4eNphjHsrhhxyMeNZDT8lY01veRxHb5MwrsF0n
         zwuCiGeuVl1eHejE18VMbnNX/P8/KHSoN+rNvAhaXnsM02h5ssEt2WJq8UFtgNAyMiKp
         GkCsQ7Rq+fOjADm7t4M68LV19IWDuoRX3MibOQ535XooUUmez6LtOByMYAZNaZ5eIbrK
         ZXoVgq2dz8gexAN+eVQr3l6TUwB6CxBat5N1e7Exxd2MjBlEsCGAQPSIJ1zNSB2MrE8D
         eQbg==
X-Gm-Message-State: AOJu0YwwkKhKteaoTvYR1Koc2941fGUJt1/WZkaipYw8j41HvL+5Rli7
	vS1bdIJw06OrpI/1M1jxibteQOl4OWHRwWEZKEwTmWcLFT3QNA2D2tlKFeOpN8lJjtIUHyEXypl
	c
X-Gm-Gg: ASbGncsi8PK4ySWgAFTSzI3DrIwoE4WHMjwSCeWe/mcelNsFb6SAwo0wXwcB4YhhqGc
	Ai1iw893kaI1UF+irYlPkKy/3NG/aurTq3E2EyzyZEUQqvCyOk9365LSo/S/ZZY5edcSEdd/7dZ
	nzeVfHLAA+vItl3p3QEKaZ61Ixukn0Dxohtame/t+Wcq1Wg1SQl3EbS8QqZhVYlCIFNH0UVh56z
	kwewYsCi1Kef/Gm01ZDRdpBDPk2nBtrOHpiJGk=
X-Google-Smtp-Source: AGHT+IHChOtlGZfeOWi5n2zXm9GgahKKum4AsHIj+/NF1YowxWlZ5gbJPGr4JUy7u+QnFfEHi3jcFA==
X-Received: by 2002:a05:6a00:230b:b0:724:5d26:d904 with SMTP id d2e1a72fcca58-7253014341cmr5041116b3a.18.1732733414082;
        Wed, 27 Nov 2024 10:50:14 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/14] builder: set CVE_PRODUCT
Date: Wed, 27 Nov 2024 10:49:55 -0800
Message-Id: <941a645b3b18418e020ada9ebdd19f425f03dfc8.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207944

From: Peter Marko <peter.marko@siemens.com>

Builder is a common word and there are many other builder components
which makes us to ignore CVEs for all of them.
There is already 1 ignored and currently 3 new ones.

Instead, set product to yocto to filter them.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/builder/builder_0.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/builder/builder_0.1.bb b/meta/recipes-graphics/builder/builder_0.1.bb
index 39be3bd63f..719db90530 100644
--- a/meta/recipes-graphics/builder/builder_0.1.bb
+++ b/meta/recipes-graphics/builder/builder_0.1.bb
@@ -29,5 +29,5 @@ do_install () {
 	chown  builder.builder ${D}${sysconfdir}/mini_x/session.d/builder_session.sh
 }
 
-# -4178 is an unrelated 'builder'
-CVE_CHECK_IGNORE = "CVE-2008-4178"
+# do not report CVEs for other builder apps
+CVE_PRODUCT = "yoctoproject:builder"
-- 
2.34.1


