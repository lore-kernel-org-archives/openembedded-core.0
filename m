Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984AFC77B7E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 17:08:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.32982.1685293685067114009
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 10:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rnQdixMn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64d247a023aso1890288b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 10:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685293684; x=1687885684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptsdCOYZPIQ7FFkr1w3cn9Qfxc8Hx5+yht53G4LYLAY=;
        b=rnQdixMnOqjO8mx5r7SoM1+ya9cC002DizLyjedRgZ5snrhUmA2IIqBkUIUNEkTTgv
         u89Ht4PMW2bheNDhMoJ51Py7awEj2maW88UhWUkNH1LhwQLy3aBVIb+Mv9gVayfimCe8
         qtR4B/8N1c8c5hDBHxXJNRIYs5/huajaXGqo8DQ3d8c+crcasLdZBbvmz/VHX4v5V4Kz
         58t1fMChuE/qiOG1MdvsePfq7S/R60XKr+t58d9LRfRWkk4tkZLCS4l6sOsPXM3592oH
         V/9rNuHhMY7VdYYCNVI0EPYrR0str3w/YnVQP57YmjHwCHIFd6gweRiEnR5H+DqK/Z4F
         D7Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685293684; x=1687885684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptsdCOYZPIQ7FFkr1w3cn9Qfxc8Hx5+yht53G4LYLAY=;
        b=XamewxmQ+GYNpSpb5WcMFaPYELAqjDY5swmCndeEutzvHYXPcOIQGVahfSVdxtSh0G
         H4n9LEiSHRfwCSshq19dDAXozkcfRQ9N0qundf7LtCHOc3FmovLOTK7212W8ZEa3qvAB
         HwQaUBgy0cBkkKW8Qhak/p3ZK2TPttm3DotsiUMoLlqHSSZB2PdxRNZhCVLlntKCnW8J
         RqhdI4k5FicJBbofV20R+YLPm3oAmbEL96HLYEhw6tJ5IYluEX5+CCc3ReiDvdufeZs7
         x3o3ZB30GAv7QYZSDX8X8Ww9xj+Ew/aKkz/auvXUdeCHdfluK9I+bMD1Xan4+C1e5H05
         D7Ig==
X-Gm-Message-State: AC+VfDyaRWoqToYiOb6g981nf3sYTPmuo8/fZk1KioTIIRPVc2ChA02D
	Db3sl5cdgsDFCf8oCIov+hyWXyn9lbxHxSnFZRs=
X-Google-Smtp-Source: ACHHUZ4ef+291eu7kvHSuzfi/szEPhcJbqAIt23jrDMTVzHxBHZRFgyDcB9xlZ8M4GjWGNBJqMqflA==
X-Received: by 2002:aa7:8896:0:b0:643:59cd:6caa with SMTP id z22-20020aa78896000000b0064359cd6caamr12459308pfe.7.1685293684134;
        Sun, 28 May 2023 10:08:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n23-20020a62e517000000b00625d84a0194sm5363425pff.107.2023.05.28.10.08.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 10:08:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/12] libxfixes: Upgrade to v6.0.1
Date: Sun, 28 May 2023 07:07:44 -1000
Message-Id: <95ede06cacde7af23d21df8059636ddb4c753869.1685291299.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685291299.git.steve@sakoman.com>
References: <cover.1685291299.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 17:08:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181836

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Changes:
Use tar.xz: upstream has not released bz2.
Update license checksum: minor change in text.
Update sha256sum for new version.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a435cb3e6cf3450867f6a591c1e3ceb4918a97d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xorg-lib/{libxfixes_6.0.0.bb => libxfixes_6.0.1.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxfixes_6.0.0.bb => libxfixes_6.0.1.bb} (71%)

diff --git a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb
similarity index 71%
rename from meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
rename to meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb
index 018138f11d..28df7bb805 100644
--- a/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb
@@ -6,16 +6,16 @@ provide the minimal server-side support necessary to eliminate problems \
 caused by these workarounds."
 
 require xorg-lib-common.inc
-SRC_URI[sha256sum] = "a7c1a24da53e0b46cac5aea79094b4b2257321c621b258729bc3139149245b4c"
+SRC_URI[sha256sum] = "b695f93cd2499421ab02d22744458e650ccc88c1d4c8130d60200213abc02d58"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3c1ce42c334a6f5cccb0277556a053e0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a5a9755c8921cc7dc08a5cfe4267d0ff"
 
 DEPENDS += "virtual/libx11 xorgproto"
 
 PE = "1"
 
 XORG_PN = "libXfixes"
-XORG_EXT = "tar.bz2"
+XORG_EXT = "tar.xz"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


