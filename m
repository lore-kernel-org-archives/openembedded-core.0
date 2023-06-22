Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD4DEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:08 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.14562.1687447927376876778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Kuur8Ekf;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-54faf8db79fso3031805a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447926; x=1690039926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2DXY0rkq/i8yPccomW4TBuIc6WRwOAXTQ7Pnp02RM0=;
        b=Kuur8Ekf8gDQBlbM0u1VjN5xh4PNCMBoIoGSbonNvvGosrvMuK9vsq3A3c0zb8yQRv
         r81kURdkSz/JwtTM53+oLHP3eJn6NNPAVFnewF4TImRFF0N4F1hbiLgsAvVkBaK9TQX7
         2DgGGnWhp1EOeZB3UaRUUpqgJaJKR8Ou36NrdMzGP8qtMBkL9YNMi0iJmXUG2jMuyPjT
         zwK11BVgUJD9yYl6mMq+yT+bbNeM7SFmjDEioa/vlip8sNqBBUkdPx1twgIjADeaI4Pt
         SmszU4Ed2ffLJ0F7W24vJxT7joVmVPZyS/b+C+jKNjPDKvMXzn6LkfegIT/xnOSfNGJV
         yzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447926; x=1690039926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2DXY0rkq/i8yPccomW4TBuIc6WRwOAXTQ7Pnp02RM0=;
        b=MX/Dn1sRmbdax8ysWx5B6m3hHk7PlQCZffeQzuaeA0taFRy1JDf+g5D9+VNThQrQN9
         Lu+2NdQUn7TSCXF/6BFzLeVwsYqwhj/mTbP/H6WBUOHZcr9o69bXLaakCCbgihcjmpwU
         UtQJ6z0eI7DVsWwsfAIqxVDdgn9BvCRUuWyrHPYZELPwhaIQyz+fjvJAo6j48b1rcpkz
         gul7tCrstcdYnJcpNwEXV5iSIpgaJpmqR8mDBWhsnYlK42oC3q6u25GGBp6P2CpM09v6
         2tEapdz1bGobC3+1Mm3aeksl0uNoqS8hgg6jihNyfxpR6gV+4s4hWvXi4FYi7VBDKCTp
         YdIw==
X-Gm-Message-State: AC+VfDw3x5zlTk6lgB1vUYNE3kH7byLXWpELbWjsCTz45NeIs4vNI0tP
	wcCF3t1SELopeQyghxmqUB8eIUC9bCWTQNgyOoA=
X-Google-Smtp-Source: ACHHUZ6a4BlKq6qGRc6Slr0TbUgbhJKgR67TXpNK5dYcTWJPpWnq0dk/k5vTPLMLgce5+gT2oPDToA==
X-Received: by 2002:a05:6a21:108d:b0:114:f824:67c with SMTP id nl13-20020a056a21108d00b00114f824067cmr14187714pzb.33.1687447926441;
        Thu, 22 Jun 2023 08:32:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] uninative: Upgrade to 3.10 to support gcc 13
Date: Thu, 22 Jun 2023 05:31:37 -1000
Message-Id: <15287d18c18152efcfc56a2ae16efdc42c53d92a.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183255

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f811bffb861b23238e8291394bd6e8407f013619)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 8a5cab5360..f3c05b7e20 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "3.9"
+UNINATIVE_VERSION = "3.10"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
-UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
-UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
+UNINATIVE_CHECKSUM[aarch64] ?= "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
+UNINATIVE_CHECKSUM[i686] ?= "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
+UNINATIVE_CHECKSUM[x86_64] ?= "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
-- 
2.34.1


