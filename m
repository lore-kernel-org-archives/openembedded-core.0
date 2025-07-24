Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81906C87FCA
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 21:36:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.5129.1753392963276538518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 14:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HAy1eKMO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7600271f3e9so1347125b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 14:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753392962; x=1753997762; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzAxt/O2Fay1mqf/qQx9AHOhDhpUFstU1dd9oPxAxLQ=;
        b=HAy1eKMOUk4B0s0QEmMzxIBOILvSV53SQwDfEJphIZhM3wbWXB29LRKJuOffWnYBi4
         vnJiDs6BnKJ1lrNo54P7uOUIExxcCbxziicX9QIlhKrxOF2cMrNL61lysIiYxRfnlCFB
         AtXoxWKecvS/wIc1BqB00TJ68EM9ChwO+O62DXTq5kWnoIpzq5czemtZX0sNfEE6GoAH
         paR4yqTt0MEBVLKyxDNKBN9NcOSHSV1AXp0+Ys5vGOwxeQEbOcd6kfgY7hxlzWtitATI
         VylSt9oCoXos5QuWWmOOHS6dAnHqh/hVmXt+RZYNx7E8+PtHrDyxU3oAsESjmRS5zgrQ
         Y8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753392962; x=1753997762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzAxt/O2Fay1mqf/qQx9AHOhDhpUFstU1dd9oPxAxLQ=;
        b=RvcoiJ7bBgr8/gNbpVF3WJ1EM4dZ5sp6a0DL+i7ZDGFhDVS2IjcGGamqkq2hSCnM6M
         feJaB8WN0jn8LvALsjBO1Z/gEWyME1kq45Q5bqxx35gqGWktpB3YDXX+9LV+I9KbTqKx
         NGLsgh/lu5t33HhrLmi3pSlRhbROnWJNgyhHSTffW2TLZLRlrEvkxkOB5HjQZNTaScPk
         cftXfagvriltdMHqdUELwR0YtKnnuY7cDJHFz0kC21i1g+W7hEajop3cbtHVYa5Z456/
         1KIjsYuu579vqqK5l1PXP+vWZG2zFQmwc07GttsSSQqq0TieGbHRUZrBy65qxbhx3mh3
         sndg==
X-Gm-Message-State: AOJu0YziAGRmGlZ5i0njV3J8DsqozwBpuM9bg1G28+AcHCY8yFqbq7Qi
	W6DOx6a6euyacO5BFD2TEdndqB0S2eFXTgV0KXF96wjbYdWc2DLeJ/1FLioAhBrxTz9W3hfQuxn
	WEVql
X-Gm-Gg: ASbGncuCgQ8cQs+V1fIezaL5EJl2y6928vvDgej4Ip0J/gz6A3rpWikpTfZfc1OcGrX
	kz1ipNNvZoQcHcxa57gA/3g+U7yMSuC1Kl6LDqAyv3sWeVTuntcdM1vHE0lPAbajytDVEgXQlHY
	ULJlJPduWapbo1sOGyhcwlC0DEkrSq4vRw5oTfj5srCQHkcpXpJNQgRa1JReNLvR71M1MzXNkx+
	j4fSzLtAb8ZMV8pKKpW2cz1bikKdR6S4OQSYIxWb99hBKQw0Xwiu3s5ZwHAEBVyC1Bb5qOZmJ6V
	3oSp62b15ec1V0uxj1XoyS/5R6tsLJpA9yrE6bIaXoQGaFz+BINgK7U/r25yxbhOM4s9hX3W9g3
	sRWDv/+LWjJn1
X-Google-Smtp-Source: AGHT+IHaHQKMYTvL9Drfj/FkFBIm5gJU3Iet9JekMFDbuOIhGlsuQKdJkK0YhmfGclp8DqYyZzA7UQ==
X-Received: by 2002:a05:6a00:1a08:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-761ee65d556mr4122116b3a.2.1753392962475;
        Thu, 24 Jul 2025 14:36:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:e2fc:f94:bcdc:cb9e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae158129sm2253735b3a.32.2025.07.24.14.36.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 14:36:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/16] mtools: upgrade 4.0.44 -> 4.0.45
Date: Thu, 24 Jul 2025 14:35:28 -0700
Message-ID: <dde0ff5ce31db9803ac802428deca14ae1b7d8a8.1753392770.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753392770.git.steve@sakoman.com>
References: <cover.1753392770.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 21:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220885

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed iconv descriptor leak
- Fixed size of error message buffer

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: cc1975888ffdc58655e80d3d14450cf68ee0f719)

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/mtools/{mtools_4.0.44.bb => mtools_4.0.45.bb} (93%)

diff --git a/meta/recipes-devtools/mtools/mtools_4.0.44.bb b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
similarity index 93%
rename from meta/recipes-devtools/mtools/mtools_4.0.44.bb
rename to meta/recipes-devtools/mtools/mtools_4.0.45.bb
index d8dd671be2..34040d7a0d 100644
--- a/meta/recipes-devtools/mtools/mtools_4.0.44.bb
+++ b/meta/recipes-devtools/mtools/mtools_4.0.45.bb
@@ -24,7 +24,7 @@ RRECOMMENDS:${PN}:libc-glibc = "\
 	glibc-gconv-ibm866 \
 	glibc-gconv-ibm869 \
 	"
-SRC_URI[sha256sum] = "37dc4df022533c3d4b2ec1c78973c27c7e8b585374c2d46ab64c6a3db31eddb8"
+SRC_URI[sha256sum] = "0b008a96bd0efe0e542fa4383d469af66bc4a93394990b103730a8160a67d618"
 
 SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
            file://mtools-makeinfo.patch \
-- 
2.43.0


