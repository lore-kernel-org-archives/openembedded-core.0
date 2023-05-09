Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFF6C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:15 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.3065.1683671586011021361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=AJDC+1kc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-64388cf3263so4640804b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671585; x=1686263585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s65F+LboJa4sXKRO6sEJaVT/uD3DbHb0RT5SttWk96w=;
        b=AJDC+1kcOkjDn+LA+Mp0V7hp+z6w18zRuYpbNSC9tdjCJ8J6o6+by53A31ebKOQFg0
         +uWadaBKz/Gqd4OOlMz5MGpoXidwVFkpmrs+friChqZGmP3dbUVezJ5Xjyzo8ZZ8xp3x
         /OQ4E9cxKsj7qLk1vuc8O3WquZp5IZmhqblG2hMfxxKQQobVKAM1x1QXyzleoD4+BsJI
         iIhunkI4oNaPo80/egclCZcarup8oa0NR+0r0iSoGcHvrhxLhoSrb/ogt4l8qbPbfZrW
         IbJDRBAbKjnTY9NBzy2Vd/vKvLpP7e5UbFzibeHZYkzLbThScoKxMbIDb8igVvvdLr9c
         0Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671585; x=1686263585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s65F+LboJa4sXKRO6sEJaVT/uD3DbHb0RT5SttWk96w=;
        b=YfdMsUojMu8p9jxBuou/+kJ3AiJIieQMD6AMOhuVOEHM4nvLaY6jvnJPAck1RN/dRX
         Wg73YWUehUrTkh6XfeehOMdZ1UPwg5idydKG7gyuJQQ9G10SpmfOtrTLkG3pf57o9f4r
         cTcUt+aSc9Opua81fwBggclrfr4NeHaiNdh8c3C6tZCYjTqXJAKCPlR+YtzuvPkhFJIK
         Ya3Rt9unEDJOVC/hA3P8QGQpTjc1Ax81/vVLGvyYvQlN92ZhTBK/Pn/IzoOjsdjv93Qk
         qEyGsW2Y373ixT5Y5HFe6FSnVdyMzF4sgTimdTC0AcpyZ9Rbvq7UN5vabkqwR0BBUl//
         RgmA==
X-Gm-Message-State: AC+VfDyP9XLKfolpfBM2XdMASqoC82VvlD9FAK9QZRr+uOEmykW0aQOR
	CdA8mkNNcDfqdgy7PnywMWFMWuS9+acCVVGldPQ=
X-Google-Smtp-Source: ACHHUZ6wNZBUwIBSxWeaieLnZw9MXbNBMxpcv+0angOWuJ9aSya3aUxAEy5tPi+nTJKPMmX8ohh2Tg==
X-Received: by 2002:a05:6a00:2d12:b0:624:2e60:f21e with SMTP id fa18-20020a056a002d1200b006242e60f21emr22396524pfb.29.1683671584854;
        Tue, 09 May 2023 15:33:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.33.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:33:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] libarchive: Enable acls, xattr for native as well as target
Date: Tue,  9 May 2023 12:32:36 -1000
Message-Id: <9a74dc61bbe19a3f1d71905a13199f4364f53dcf.1683671424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181095

From: Piotr Łobacz <p.lobacz@welotec.com>

Libarchive is being used by OPKG package manager as default
API for extracting tar files. This fix allows us to extract
ipks packages with preserved ACLs and xattrs.

Partially addresses [YOCTO #15091]

[RP: Merge into main PACKAGECONFIG and tweak commit message]
Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 913aad1ac013368aef8f6af332588ef24bba46bd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/libarchive/libarchive_3.6.2.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index acc84de9da..ffcc103112 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -7,11 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d499814247adaee08d88080841cb5665"
 
 DEPENDS = "e2fsprogs-native"
 
-PACKAGECONFIG ?= "zlib bz2 xz lzo zstd"
-
-PACKAGECONFIG:append:class-target = "\
-	${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)} \
-"
+PACKAGECONFIG ?= "zlib bz2 xz lzo zstd ${@bb.utils.filter('DISTRO_FEATURES', 'acl xattr', d)}"
 
 DEPENDS_BZIP2 = "bzip2-replacement-native"
 DEPENDS_BZIP2:class-target = "bzip2"
-- 
2.34.1


