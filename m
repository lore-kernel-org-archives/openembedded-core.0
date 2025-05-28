Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2553DC5AD49
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 15:34:11 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.942.1748446441148379063
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 08:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IPhOPCg9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so3422488b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 08:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748446440; x=1749051240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5Oq3i6jU2EWWVWPYCVJjEwzq4x3v8wBu9A7R0tloUo=;
        b=IPhOPCg9NFZ0+MMoGjiHDru4Y9E1JjqiZ3qU0SHpe6FWVSctqVEyCUmaCEo43z5EHU
         vMUR3/7WBOXVm4E8+wW0wPCP/M1KmMMZoeNEZFLUlWQh+yrUNOkavrl7YuhRQkCxS3cw
         jdkbuvF3ae+G8uGayz0Ek1wYOPhCQA5ClES5s4Cs6lDsYGXYdDoJvAVIB1nAtiFwVBWE
         Bzl9o3ggDhjjsFW1ZvY5paNZRHdL42mGHZ9YHdMatmPQ4fl+3uxSQEmx0PhwjJGZohCB
         AsXBdRqB7xMlMH6XsasgQzl48ODLL+geZUrqJ1UkJhiUxTd/MPQYYjGHg/usoE6YJvev
         qkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748446440; x=1749051240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p5Oq3i6jU2EWWVWPYCVJjEwzq4x3v8wBu9A7R0tloUo=;
        b=Hro0iFEVaXctiQ0LQKFK2FrnUIqWnEOPASLwyXdRjREAdUvaWf+os8Ej2j7osi+i67
         ZZDs3/E1qY2lUhNIQqQvQPOlZMQqA75Yg0ybnV4w7KTlwxMj+LCyTdZCCNwCdlkJw0N3
         BcvacqM1XKOm1HP8Za8Y0x6y0BRAZKIJpPblIaFkkq543GtCy/nHgHiRQP4ywJ+DlinP
         V77Wbza611/4Hi4OzdzwohBCTWI4A7BBpQBBwvUvp7mQ1LPiaXfgDpPDxQshb0V9rEq+
         KMdDMOXIeF9+6Ca8rWN/LKikR1ugI4U0pCvo4H8Z8WFYxYq6E9cpOQVmtnMQBWWKS3cc
         yV0w==
X-Gm-Message-State: AOJu0YwFIrgRWs6LlBpLyCVWYq8eZkjaaFGAfm2Lzix7onwKg7AnCNdR
	voOj8pae69zrxgkUqub8RU25yxnl4eISSyFiZTqkPuQ1Ow5y2ajomckRUt15dRgIqbR2OeLML5g
	ouvAV
X-Gm-Gg: ASbGnct9Cs6/hjj5I6P+1n86HjdQhlhhXdN3wXmo/kneXSNvkTT6KjOSQTvBSj9h5fi
	y9UFIkeYqEaV5oQVv2gWeRCuJvxqacHe5GQj+FEIUD2UOBtirR+LkAjRQ2NBMO3mHKOqp0fZKZF
	eY5x/hhkRwFqqaTrFiL0iVy97ZCzVt6nfdheWUw4zpFj9tTnIeFcpmS/OzSDDI2DqlBEpnXzo07
	w39QyEVhYWFRtjv1HpAcxrhMvn8TDF7pj5Xh021+DlG+a1DIvoKcwpl1Ce72u0UT6fAZTD2i5uF
	x+8NSpCnfb2XQxfj2iJ4bEomk1oaYGRXcIKkt7g8OS8=
X-Google-Smtp-Source: AGHT+IEmx5LSwB2S8kLFI1yzJAc3lRMvtuBknFI9iVqkLJJvhG++QqI9REeMB4IOgio0ksLDANFeXg==
X-Received: by 2002:a05:6a00:a06:b0:742:a77b:8bc with SMTP id d2e1a72fcca58-745fdf7710fmr24952892b3a.2.1748446440342;
        Wed, 28 May 2025 08:34:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:2f2f:1884:f4cc:456c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c1basm1400268b3a.132.2025.05.28.08.33.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 08:34:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 12/14] libmatchbox: upgrade 1.13 -> 1.14
Date: Wed, 28 May 2025 08:33:21 -0700
Message-ID: <34a33332d530278d42f9d402da051ad7272cf555.1748446235.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748446235.git.steve@sakoman.com>
References: <cover.1748446235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 15:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217376

From: Gyorgy Sarvari <skandigraun@gmail.com>

Includes a fix for the library version to match the tagged version in git.

(From OE-Core rev: 3ba4b22ef7e50e017d25ba974666f2fdf190a8fd)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libmatchbox/{libmatchbox_1.13.bb => libmatchbox_1.14.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.13.bb => libmatchbox_1.14.bb} (95%)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
similarity index 95%
rename from meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
rename to meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
index f212eb5e96..87ec4c812f 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.14.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87712c91ca9a2c2d475a0604c00f8f54 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-SRCREV = "35cd78efa3120efc46497f55c04382be960d1864"
+SRCREV = "04b214a0d5cf8285e196d90bf2332626b12c74ef"
 SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
 
 S = "${WORKDIR}/git"
-- 
2.43.0


