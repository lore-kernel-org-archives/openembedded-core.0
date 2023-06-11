Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DBEC77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:03:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.39229.1686499393061148026
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:03:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=0d/de28H;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-25bc4c0101dso492842a91.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686499392; x=1689091392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJice8P5kvprZyo7ewSAgpw0rlxG5a0L5Fbl0WpJL+0=;
        b=0d/de28HxZbHm3SmApPJfyaw2epkr/Eb6rm/xy9oUfnCJ1XGwPiHBnKsf3QmbhWRYr
         NyQszsEIaWe1M0ImvLcV04PWHO5b5EVaukZfrnRlTkm+BNkypVJh5riRmgeT0ssTNz5m
         8qJGw5a1aMqM3V8j4kdCK3i01XQqCUh8QYb+YQ3kLUNZ76dSEep7Vy6PFsYmXqFtPduF
         Gnk4ZRCJxeikR6b3BXCEf/eT9yhjiXcCPmi23AzUKyNEysMEDCmF5KCp5T9Xm7+Qpp0G
         dcvgZXHib+S1wGcGJvRnY+ajFNw7HVcqUvcnNyVv1oldiytgQ7rn6OfsYqRTVCi08N6f
         pSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686499392; x=1689091392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJice8P5kvprZyo7ewSAgpw0rlxG5a0L5Fbl0WpJL+0=;
        b=OMOIPHYm1Ifn9gjbeVmrVH8LF7rV8KVnZR89JTYRoJOSFzwpC5Go3ERvS1mwvq961n
         WhnMnxbu/6cOWPJYsy2rivsIIv7FarCkBr05ESJPrvpkaPJoKHGrgIaVSCfoKy9OWZUi
         O+T+0p2aytn0FoLKoNHEbrajIPhCzZFW+PDQl1gdlS704OOO7M0yk+9qwPyScXoSZx2U
         sphwJ1/rP0UtswFpVqeAyf2IIeFbZryI3V4mfvKzXASZ2HjLdu/oA/RTC0dw4idOqkN/
         mlguiZoNup3oHrsnM6PjRKDTeYytNcpRkfhAkVbw1K/qR3RySgTE9CoDqVZTgiAm/F0H
         9b9w==
X-Gm-Message-State: AC+VfDwyX7sbSWTX/WlfiSgm7+ICbQ68/eevPYtfejfvPtwxEzl1/qWK
	L5oobVQGaTT8s15Oy/MVpCmAPDMLaVfWEfxdWHQ=
X-Google-Smtp-Source: ACHHUZ7QtA5kDlz8tVO+CvjHnkMojSZbaU7+ytr2VMUbeRpxuFfpy1b/c088eygOMDfETXyl78zHVQ==
X-Received: by 2002:a17:90a:1c97:b0:259:5c6:39bc with SMTP id t23-20020a17090a1c9700b0025905c639bcmr5829015pjt.33.1686499392130;
        Sun, 11 Jun 2023 09:03:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id ix4-20020a170902f80400b001b3d20ef257sm113378plb.97.2023.06.11.09.03.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 09:03:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/11] uninative: Upgrade to 4.0 to include latest gcc 13.1.1
Date: Sun, 11 Jun 2023 06:02:44 -1000
Message-Id: <6e0d694ea1eb5d478dc7508d181c3a820098ee5f.1686499221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686499221.git.steve@sakoman.com>
References: <cover.1686499221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:03:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182633

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


