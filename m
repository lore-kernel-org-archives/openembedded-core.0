Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C44DEE49B0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:37 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.13057.1692801393880088726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=yocoI/nq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c06f6f98c0so25227985ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801393; x=1693406193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VG1F/FlgDf62p1xwkzVr+FQmlvjmaS34keEWI2Kb2Rk=;
        b=yocoI/nqL4jN/pmW0BHBIJdR2fxO9ACqPXL1sdKPxk/y0Q18f4YsXLXVFUA93CTpgy
         kqkOHi8GneliU7uTVbwgjKptjI1KocBH24eBd8Vz3/IhCWJN1VhJ3PS6QWooZX+yrGWb
         whIyAMRMftfZ7T46oeJMKFSX5etTCu8rh5CqEOWwP7Aw2+E4li3g98pYp+b+vfkmOF0u
         +rl40KhiqossofIypHW4Xjx3zv5eufQgo+2YBJgKXVZfsVsKtGU6TpoDLCLJr5l1mJS2
         iHnNNmUkyb8ERIpZip4xYCugpMmFhfJwHZScnSfJD+v9UprpuWaO2JeeVml93c7aqgGQ
         HXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801393; x=1693406193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VG1F/FlgDf62p1xwkzVr+FQmlvjmaS34keEWI2Kb2Rk=;
        b=AtRrOuktjggaLhT2juH+kqnKs1H7n8gJGTnNl3TV2rVMnGudh8/TQS5pgEZTJaefAb
         1OkW5M73bC2fi4KInjO+r3NW9xxe3KUqf3a3t2eHBD0e3yURuuTiJAJ8VeXebCvexTpx
         gKzPgwFXh0api+ayk6R+0wQ17jHGhlEpNTNoZ++h2Bx43bIKugxdG169o2hCerVStoNI
         QSvPJH6R2wb/42fTc2qLL1C4g4pgayCnYIU1JvTGDy33U47VFtHIsBPPtb0tEMPCU8AC
         AB+S6KS0bEU9eXzN6/VXjganwa9DpZbXnJQrX7pBFy0ZpJIcIloawAdOJZr0peO7hv+m
         Yomw==
X-Gm-Message-State: AOJu0Yw0YcJF4RNIeNm72Pnkqy6mp/A1UuMyS5PlVCMq6T4GCI0lnWVS
	9E/0cmp1IfZmD5wh/cp5cmwNqsAtUzR3piO6wlM=
X-Google-Smtp-Source: AGHT+IEq3X2GFcl0tLVIPPaVNBoOasFT3zMcjmye5wVEE5uQAKFIBE75bbnIv/uNksgy9VPa2Zel8g==
X-Received: by 2002:a17:902:bd45:b0:1b8:4f93:b210 with SMTP id b5-20020a170902bd4500b001b84f93b210mr11686568plx.45.1692801393040;
        Wed, 23 Aug 2023 07:36:33 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/36] libnss-nis: upgrade 3.1 -> 3.2
Date: Wed, 23 Aug 2023 04:35:37 -1000
Message-Id: <641cef34fa4f626b6250f5495392c68a29b46dc9.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186588

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* Do not call malloc_usable_size

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5cd967503c0574f45b814572da9503182556b431)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libnss-nis/libnss-nis.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/libnss-nis/libnss-nis.bb b/meta/recipes-extended/libnss-nis/libnss-nis.bb
index d0afb3ca0a..f0e687c330 100644
--- a/meta/recipes-extended/libnss-nis/libnss-nis.bb
+++ b/meta/recipes-extended/libnss-nis/libnss-nis.bb
@@ -13,9 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS += "libtirpc libnsl2"
 
-PV = "3.1+git${SRCPV}"
+PV = "3.2"
 
-SRCREV = "062f31999b35393abf7595cb89dfc9590d5a42ad"
+SRCREV = "cd0d391af9535b56e612ed227c1b89be269f3d59"
 
 SRC_URI = "git://github.com/thkukuk/libnss_nis;branch=master;protocol=https \
           "
-- 
2.34.1


