Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139B1C87FDC
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:56 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.172.1686329693777859074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=eEV6F+jH;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-53fa455cd94so748909a12.2
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329693; x=1688921693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TJice8P5kvprZyo7ewSAgpw0rlxG5a0L5Fbl0WpJL+0=;
        b=eEV6F+jHUH2Iqe3vN18t2bbM/6VpCUWFlbyPZH1H8AQtZbWJhzhKDrqwpC9DQWt8WD
         EP57NIxdCqz6jtzfhg56PHyI/Mofybf15p36NS630OFXCpvDQlZOiHgL4iid4ZxF4sEI
         UQIimxWTv7vzeOeEZRiK2b9PDc25SuuF64ausuRoMhQjziODCt8eCYZxnT9sV9mvYZIe
         cysO3X0z/XWuBel0oBULZQROnBCibZ3cRvMulyYH1J+XkGeQPbPLd3zOPH4a2jZb934y
         SCoSbV55CBGGgFQ3RRopUrNXLBFRShFD4rfnFIJINQDHcdBc3EBqx6MzQ29HzMvazTmI
         yF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329693; x=1688921693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJice8P5kvprZyo7ewSAgpw0rlxG5a0L5Fbl0WpJL+0=;
        b=R1GVV039Q8O5cbMc5zZs1HA/TylRCS3U+rx/1/0wmWVlx73fjzNTiiq1qYQHcibs/Y
         geyUB2wfa6uQYkS3ip1teuBN4O8gGm8zf7ucU92OsgreO9BumYUC6pltqbIMKONvtIy1
         sZfkEXwuSp5jM7okrdLepK4Bgs56HNBnGZwDUi2x+6uveIovNej60utdZhjS5zQKX6sl
         F9FvV/57KdXBEZwuF/i7Tt+FUZhU/mEzm9/BFYC/Hs2QZfVTxNS9qzqPMUjf5skgEbdI
         Y47zPGVRBEoloenYl9bcuQybNFJ9s1hdXo6NrzBrHpUtv1MHkTq+pCupe6W5WitOqjiS
         2rhw==
X-Gm-Message-State: AC+VfDyidiDCOibecgUZrOYJbIF+Dy1PP/v4QiBQgtUaajpxHITczTXB
	9HfTpXqvNPOC+EwFZ2uIa0YeHiaG0wH05ws/bTU=
X-Google-Smtp-Source: ACHHUZ7t4pIPRAPz6p1J6/S/tv+ntLlXe83iNVM6SPoYCSgXOmSA51RaZL5IPu/E/pDU/ZUIpvPHyQ==
X-Received: by 2002:a05:6a21:150d:b0:10c:1076:ff69 with SMTP id nq13-20020a056a21150d00b0010c1076ff69mr1368685pzb.48.1686329692866;
        Fri, 09 Jun 2023 09:54:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 30/30] uninative: Upgrade to 4.0 to include latest gcc 13.1.1
Date: Fri,  9 Jun 2023 06:53:57 -1000
Message-Id: <a24b257189e83ce4cd073acb3e31591d31dfa5b1.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686329289.git.steve@sakoman.com>
References: <cover.1686329289.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182596

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


