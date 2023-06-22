Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1BFEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:32:18 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.14564.1687447928984338877
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 08:32:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Cy1IVx8e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-666e6ecb52dso3674892b3a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687447928; x=1690039928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJice8P5kvprZyo7ewSAgpw0rlxG5a0L5Fbl0WpJL+0=;
        b=Cy1IVx8e5Ornf0GE5/xLPxs+m0KFUr5qC8A7yU4lsZVIS4Eni85nks/+oU7P7KS9DM
         ExUVOjlPHWZS6TpwJn3i4hQeTHXhwkerA+3hpu6ZC6m5HRWaz416fbWCpmC6vGcUd9Gz
         OVt/srpD10uRbhSs9FZuuWj1G6QVq70+9Ec0+WvLSxGBn1/pOZeQvKt7gBtwORGtXnr5
         Lc0P+GaV0GCX7MUOMExc9xiiGeW72GQRPQ5gvYzuhNfHQcE1+Pl3mKI+Nhc1eIqpI6zQ
         k87nlPPhyMP88dg3asO+I9WloAws/7Dcsak3y7XKrsF2Oiwq+zbNomA8sKSgXUhFaxDO
         v+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687447928; x=1690039928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJice8P5kvprZyo7ewSAgpw0rlxG5a0L5Fbl0WpJL+0=;
        b=a7Pqbnjgo1pe4DAjic6zgleN9NtJr/qkCaFADjmyELsCcRmSaxxjnV+OQLLGETbs/D
         xEk0cAsZ+FQxoYkceKMARBnV8Wzcs1D3Wq2tEAizSnAQrmnRAHoLsqrcDfijoNXtN7Le
         Tzkd0j8W0jlvdAp5w54Ko3r+8uYRAJV5D4J8FSHLQnn1OpjIMb5GGS7LxrTiHz2eXY55
         uIYOH46UDT1vaXEXeXFW752TXIz4l+vtzDo7a5AeaXD4kp/VEtEqo6N28rTcFl8urZIK
         IDVmnv22mmt7vgZOW5MUZCqVyZfu/bagPXD0nyOe5wR+e+i5t5H3Cgxv3ygoyD1ra3tt
         r1ZQ==
X-Gm-Message-State: AC+VfDwdq8AQ0jVz+TP9yrJk+EeF63rGoBh/J/KKppweFOomMTrrwcTq
	pCIp8ywwKGDlsk2P+rtNjvNR3VayiUoKIBzJEvo=
X-Google-Smtp-Source: ACHHUZ4el5XOH6rQz/za42RoyFKbRfQ2QQybiN4or9k7sQwgQJa5x91T2Vuz4bHXVyLp/SUABnD1zQ==
X-Received: by 2002:a05:6a00:198f:b0:657:67be:d1c5 with SMTP id d15-20020a056a00198f00b0065767bed1c5mr15273482pfl.27.1687447927963;
        Thu, 22 Jun 2023 08:32:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id bm17-20020a056a00321100b0064ccfb73cb8sm4713240pfb.46.2023.06.22.08.32.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 08:32:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] uninative: Upgrade to 4.0 to include latest gcc 13.1.1
Date: Thu, 22 Jun 2023 05:31:38 -1000
Message-Id: <0179c939e4abab008d3c3aa9c1c1eb63b78a6e09.1687446532.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687446532.git.steve@sakoman.com>
References: <cover.1687446532.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 15:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183256

From: Michael Halstead <mhalstead@linuxfoundation.org>

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f87becb69e02bdf055dffb633ed4f6d36b36f7a7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index f3c05b7e20..ad4816a1f3 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.37"
-UNINATIVE_VERSION = "3.10"
+UNINATIVE_VERSION = "4.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "b11f7dff0ff5e3c971f22e89a105efb0f8d2006fd71d1ea3e5da771e416b0e01"
-UNINATIVE_CHECKSUM[i686] ?= "ad7daa7fca7693ca07eea5279f830333530171d357759b380954a25254edd8dd"
-UNINATIVE_CHECKSUM[x86_64] ?= "ce8ff7e3247da312fbf84008f415bc1b4d113ac9fe4ec91581e4a20cd8b475d3"
+UNINATIVE_CHECKSUM[aarch64] ?= "7baa8418a302df52e00916193b0a04f318356d9d2670c9a2bce3e966efefd738"
+UNINATIVE_CHECKSUM[i686] ?= "83114d36883d43a521e280742b9849bf85d039b2f83d8e21d480659babe75ee8"
+UNINATIVE_CHECKSUM[x86_64] ?= "fd75b2a1a67a10f6b7d65afb7d0f3e71a63b0038e428f34dfe420bb37716558a"
-- 
2.34.1


