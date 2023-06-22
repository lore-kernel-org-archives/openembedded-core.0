Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F931C001B3
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.14630.1687447925927179186
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=1wH5jYsx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-666e3b15370so4342079b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447925; x=1690039925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NaHbcBvCvIT+6WrEVj2NdOoey6vSFxziytH9H9uJhk=;
        b=1wH5jYsxNqi1vFk6VqJdF+8ZhMJoLAhtIynPv5bv5nuzeu6ivoarRaQQhgDcqNm0oq
         YO//Vf8f4I6iY9t+A/gz8ejqj1s4l/oNrB3LzxehFzQppGQGN+d4xqW172XPZ7ubC2FN
         pPtqUl9dUaBY9NMUgX3REzq5EKrN2wnLkvsveDiOaV/gxm/TP2PjRIcJpihFUUOYltr2
         uZq/1kUU9YeNxmV3MamNCCO33oBwVxiUs7GZLvShzLFe52+x4PpwlG8Isnb8UsIs/6KC
         xuXTuHTv6QvlgnxYOQFOO+z7pW1VtDkxMOm3EbUwaxdnjMTI1MOgzE0Whuek5w7Uf+4l
         i0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447925; x=1690039925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NaHbcBvCvIT+6WrEVj2NdOoey6vSFxziytH9H9uJhk=;
        b=XOXriTlEDk50QW7b0any5K0L2kWDHPqPuQRt5l2zxDltEXtFAnLheq8fbh/UxuiIpH
         JsJfQ/ANJRLQmX6Y1satOTsMk2UTzG6NRmSKeVbPCjfJIgGBIGSEWO3L+CiEKI5M7bkb
         LxAypScHL8FvGKrjaBBnk4/YEbgKj2p9kT94CzOyhoJfdKFcYIcbRdCcqjc7dYvF8F1t
         Ex6v383m8sRW8i1JaPC+Axaji0xi4Uw8EcIPcmQDoaMtfDTs6cvrUjgrIryFR49oZW60
         07yQnPk3BQ0Pzg3tsarVgux+dgxo11ErT/oCNbAC4dOQxFMBcpLM7fGYGTk0edGmHs1t
         VW5w==
X-Gm-Message-State: AC+VfDx4KnpLjRiI8lRyO3a3jz5UM+Rvk2B+DmkyRV0/z07QVkXbrX5r
	Vq4+HDcogvpcMyGqfqsZ25Q1XvtFutINscuU+Vc=
X-Google-Smtp-Source: ACHHUZ4NJAS9ngeVNXn6OiVeghqQ34vunJSydwEz3xAAX/JPjfegT1B5xfJHJ70FaZsNqNx1ec5U9g==
X-Received: by 2002:a05:6a00:2d8c:b0:668:95c1:b4f7 with SMTP id fb12-20020a056a002d8c00b0066895c1b4f7mr9394940pfb.27.1687447924902;
        Thu, 22 Jun 2023 08:32:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] uninative: Upgrade to 3.9 to include glibc 2.37
Date: Thu, 22 Jun 2023 05:31:36 -1000
Message-Id: <c95020a30ee8266d4bfa7b14a7526c10590027fd.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183254

From: Michael Halstead <mhalstead@linuxfoundation.org>

Update uninative to work with the new glibc 2.37.

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 360971a6ba562fa0b29bd062b96ede2d3a47fa2e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 51c0cdee43..8a5cab5360 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -6,10 +6,10 @@
 # to the distro running on the build machine.
 #
 
-UNINATIVE_MAXGLIBCVERSION = "2.36"
-UNINATIVE_VERSION = "3.8.1"
+UNINATIVE_MAXGLIBCVERSION = "2.37"
+UNINATIVE_VERSION = "3.9"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "3f15d420049b21854bd7a8843da0f42f17064559492c8b752d7a6f998ff5ea65"
-UNINATIVE_CHECKSUM[i686] ?= "a6dcf316d738ade2e5e463bd3b33a270b4bfc25bba41770ad5cbdc3b0e24044c"
-UNINATIVE_CHECKSUM[x86_64] ?= "5fab9a5c97fc73a21134e5a81f74498cbaecda75d56aab971c934e0b803bcc00"
+UNINATIVE_CHECKSUM[aarch64] ?= "de35708c95c34573af140da910132c3291ba4fd26ebf7b74b755ada432cdf07b"
+UNINATIVE_CHECKSUM[i686] ?= "adac07b08adb88eb26fc7fd87fee0cec9d5be167bf7c5ffd3a549a2a6699c29c"
+UNINATIVE_CHECKSUM[x86_64] ?= "3dd82c3fbdb59e87bf091c3eef555a05fae528eeda3083828f76cd4deaceca8b"
-- 
2.34.1


