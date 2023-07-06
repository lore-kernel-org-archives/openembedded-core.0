Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DA4EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.26466.1688656027173632721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=CCjEZIQL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b8033987baso14121795ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656026; x=1691248026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqbcmbCBYAp+zhG9717TcnTFy9vDhEQDYEueVcWP4dA=;
        b=CCjEZIQL2CTA6iBTn80Bz+JbYqsCwPd7rDptJWyFFENmYK86Cu/kmgHC2J7KxOcEal
         arFuXoAAAlOvmlKo9Kv/v8xacCWiq4hvB82+ifP7leV0QtUPjjBkA4OfVEcW96HGmGlo
         w12GC4ASz53pQKKzgMQQkn7H8OBV5zTnJG0760F9UuuB0yqMJKJf9rxw0kNoySnjKz+F
         lYYcq4bsCF/BMCN2H52NWYrwgL1lGBK5LYODI53MDkPLNwTjEwX4xXZd8CX+F7lLPHia
         m9lOc5yPWNdBWDoPb6OXTWwwfxZIM0/zj2YfCDHnEJEXfiSTCVWare3nvd2OwM8PW92j
         2PpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656026; x=1691248026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqbcmbCBYAp+zhG9717TcnTFy9vDhEQDYEueVcWP4dA=;
        b=jeae2IKO4BDG9ueRGqHjf2J1p9E/gTA6XCZX6qyxFWVBDI8oJ9pmtmxPAUKVFnpuFh
         pxu36lxSKAZkvmjHgGfdU8t2z4x48q3ZPVaUG0VAIFjE9iCciH7OxRW/MONnw9RsdVQy
         0FzTTT+BVjnNznVV8dwfIxDOwtkSz+p2VYPudHyuBuMbPzSckIiJgTIBXX2MnmfaOtoF
         XP1ccAjQKViYbrLpJLp2pl0yzCikUXVGKMXTs+G3WS75K72JUpLmboit1sDDoQyewKLg
         Oxjn83QNnxgpPUA7wkhz2JMNgIJ1kth15jVlPHluu7rarhtl4Iyzyhmvf4KQp3Qe7xBu
         XvVg==
X-Gm-Message-State: ABy/qLYDcEyOaDFtGn71RzBUBRIF559W7e6MQPDSmNMpPrX0Tmz/Nf0b
	fQ+q1x5DBkPvX0ujklCphweifBkj7UZw2Ovgyfs=
X-Google-Smtp-Source: APBJJlETag11AOzN9+trUU4WwoV2PDD3n/4sRu9LpEEKtiRXSaNjw6yLLag8gJGbE+Pv6KCLeY3crA==
X-Received: by 2002:a17:902:e843:b0:1b7:de50:7d9c with SMTP id t3-20020a170902e84300b001b7de507d9cmr8522204plg.15.1688656026182;
        Thu, 06 Jul 2023 08:07:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 13/28] v86d: Improve kernel dependency
Date: Thu,  6 Jul 2023 05:06:16 -1000
Message-Id: <b842b8b51e0819eebf1fb3a2359b8c06863e553a.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183966

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Working with enabling SPDX, an issue was observerd where v86d wasn't rebuilding
when the kernel was changed from linux-yocto to linux-yocto-rt.

This is due to the code in sstatesig.py which was seeing the RRECOMMENDS on a
kernel module and ignoring the DEPENDS. The v86d is technically a kernel module
since it uses kernel header files.

There are two ways to address this, we could inherit the module-base class and
the dependency code does the correct thing. It appears the code doesn't look into
STAGING_KERNEL_DIR though and doesn't use the kernel sources. We can therefore drop
the DEPENDS and the code will the do the correct thing.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 37ccd11cb0b89416b8e23160445186269b6c0c8a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/v86d/v86d_0.1.10.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-bsp/v86d/v86d_0.1.10.bb b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
index 5f342b1120..b4fe362f8e 100644
--- a/meta/recipes-bsp/v86d/v86d_0.1.10.bb
+++ b/meta/recipes-bsp/v86d/v86d_0.1.10.bb
@@ -6,7 +6,6 @@ DESCRIPTION = "v86d provides a backend for kernel drivers that need to execute x
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;md5=94ac1971e4f2309dc322d598e7b1f7dd"
 
-DEPENDS = "virtual/kernel"
 RRECOMMENDS:${PN} = "kernel-module-uvesafb"
 PR = "r2"
 
-- 
2.34.1


