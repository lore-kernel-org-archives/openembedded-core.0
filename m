Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE29CAC5B5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 21:18:11 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.26137.1758748682350307760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 14:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E49KDiW6;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5565f0488bso196608a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 14:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758748682; x=1759353482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFLweNG8XigoGg6rmJDM0SCUL9de10Eae6jf0kYOkwM=;
        b=E49KDiW6VikvtvUgjav050eg967y5CcIw1j+XxibFqC/0ifppXXNjDkhI30mbdYsCM
         zPcP89d1xnjDe6wHwlkV1XU/DVSYiMDEqUtSNqN7n5R+YqeS9JOMuZEN5qjgoIXcoGcq
         AEi4ETOApeaNTEAvm2G1us1LZu9tgldlD/KjEr5nCjJdVZlIGhSCFYoWXJUQR+bQkr2c
         lUOmnl6+QoDB3m8kBkFIwMTSeOlMu4WHYJl6hrpfgmrXRr28aAPicDtgLWg/omH+fWf1
         88luR9a7scxDfPZSXQKpSBQDMDcgd17lRO1JaGUqXviYtrtUV49YuPb9AAGfIZpIgIpx
         GBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758748682; x=1759353482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fFLweNG8XigoGg6rmJDM0SCUL9de10Eae6jf0kYOkwM=;
        b=lu8+qqjkgr883i+GMHcjr2FAQzOJdHdE26myqoSrn0DZkHnwMpCPZiv3v44QMvjyP8
         OEuTiVJIgCf2BKVXrqngAwyHm4G/vBsORcQrRWejvOvqvLQoNSzx0H28hLfT3aPsXnMU
         XQcR+e6MXLyLGZDgC+cb1tP/818p1YNTwR3BNBIWcI1Xca6yWWw7aZiwrtcFUx5u7uPF
         PG0KsT63u3xOWvKIuQkUjfYU+8TnxdFtMTV6NkaxOs/BWG2+q/+uMfckqTos26YQ82gf
         698vLzpjHf0QsWpHDDh1y81tanQCvA7k5PAAqVHO792rto8F92fXIzLmq9+hqbHLR25j
         lnsA==
X-Gm-Message-State: AOJu0YyjQKUOXD0+FRrzr2sdXEMXPW68EFmwlAQNH/zRL5Xlm4LpZFnx
	lBJlX5A7eeOkXQfTBo82/hremsiLV4WDhGw/wXyfiPZknbm+Nys7TP/dwsmynCi8RQkSTC3X3wx
	Ec4UWxWE=
X-Gm-Gg: ASbGncurt4PfFQQ2eDdTT4WlyUKoAtRzvi6sUFhKlrdQ+q/QczZ19HJnGgYotv+iuio
	Ry3Nr5Hfg8K81x4ydY1G9+ZNcewBtIf+TabuUlF0rpgwq4fAwSrdyuMRJNT3kmpgr3/Hl7dMukR
	mWYpI1FXw1nXP9CRSZ3/IFUPSBP3AwYnVZJfkb3Yg2lvt2xPkuZbYe5DbP8PAGuOb9AWMjUAExu
	Uf3UuuknA1lg4aaP3D0HWlowpX047IKO4cMP8AsOSUTcbrMLkpKP41lGlU8TytmSTWcChAG+8cM
	QpnKjPjJT1mI09/kfr5kS7EQ4CZuxkTT3lCyoiuUGpJ/Ex09j4ODrmGiqDvhzixzBosKpHQcwPu
	16DLeqD8yppejYhyuxkfw7Iff
X-Google-Smtp-Source: AGHT+IErpme+6jgrjvoIirEChF7CGZfQX/UbR4zo60ahxn850FarzC8NQriKm2KF/iW2NEBJRdwPyQ==
X-Received: by 2002:a17:903:3847:b0:269:a75f:e9d5 with SMTP id d9443c01a7336-27ed4a96168mr14285955ad.42.1758748681391;
        Wed, 24 Sep 2025 14:18:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6702cf9sm2194555ad.38.2025.09.24.14.18.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:18:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 3/3] expat: upgrade to 2.7.2
Date: Wed, 24 Sep 2025 14:17:50 -0700
Message-ID: <924d83d081ab69a111961be447c5fe7c55bc23df.1758748538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758748538.git.steve@sakoman.com>
References: <cover.1758748538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 21:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223992

From: Ross Burton <ross.burton@arm.com>

Primarily to fix CVE-2025-59375 (Disallow use of disproportional amounts
of dynamic memory from within an Expat parser) but the full list of
changes are available:

https://github.com/libexpat/libexpat/blob/R_2_7_2/expat/Changes

(From OE-Core rev: fbe5f76ba6af0983cd90a05d4077e453e2ebb475)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/expat/{expat_2.7.1.bb => expat_2.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.7.1.bb => expat_2.7.2.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.7.1.bb b/meta/recipes-core/expat/expat_2.7.2.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.7.1.bb
rename to meta/recipes-core/expat/expat_2.7.2.bb
index 2da1532922..952235d7a0 100644
--- a/meta/recipes-core/expat/expat_2.7.1.bb
+++ b/meta/recipes-core/expat/expat_2.7.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "45c98ae1e9b5127325d25186cf8c511fa814078e9efeae7987a574b482b79b3d"
+SRC_URI[sha256sum] = "976f6c2d358953c22398d64cd93790ba5abc62e02a1bbc204a3a264adea149b8"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.43.0


