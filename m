Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39209C3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 12:02:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.41070.1722427338570013952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jul 2024 05:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=aFFueCBF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fd66cddd07so39814695ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 05:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722427338; x=1723032138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2EBt4YytGAz51W/PSo+eDIJkl9S6pEC76+M7l1jyK48=;
        b=aFFueCBFby/FIP1PKz2po3sMF9TK9cmRiwDDeyXc/+pgXfUYFQfyno4RqA5vGAM+f0
         HFd2lWiJ2vurORAydmOwIhXFZMd02/tByXmYSNSa5giM1d18eMw2tCO/5ynSIk6/6bpX
         u/peqf/Ewt9BRZGbOUlWjZI5wPvSs+GMRl9H4kkZ8g2auzo/2eGwYT1b5hV+ihgRNk2u
         /u3DJvjrwc7lMCRZuPOE1wZIDB/dCkMSDjDnTEPDlJ+53+mxATeL8PHLTza1XqURIU50
         EZDVX5sJdud2uMw24jL4+5wLHTE5RQSZ2wpJwJ2SE3SAejWT6Co/rTA1TeTzrjl+SdKw
         fJfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427338; x=1723032138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EBt4YytGAz51W/PSo+eDIJkl9S6pEC76+M7l1jyK48=;
        b=voGsCojn3BW1MR94m+bBuJSXD3wVRtVyCsnFCTG4BlxSskZeNwq7EEhN5FTrrjvlkL
         8O8+TkfLO74Z4Tzkl14Ctjx5b3lcxUKVqpIGDtb3iGgHNaimOCB4vzKu7Q9qh+KxwGG1
         Z0bb2V7GABGMLQEvRuL3vbzYb2W6svEcQW7MGDTIroXLBOM8rxB2qR2wGNmx7yjgi75W
         vXFrYtcHzeUIwtlC9Gnlv3DSasUhcySx8pttXS2pvqDUaeU7/EvIIdgr0bXEJ7p8bokv
         AxwCkG4qowLVommJ2kroQZD/7d0IWuAPOjOait8T7DTPfS3m7oBEPEkN1BVNSBd/U1dr
         Tw6g==
X-Gm-Message-State: AOJu0YwIcbIdZxo+4+ybWeicTnAGL6Gci4rOtNLAkpeJIGmnlUTme7U7
	Y4gXY7b3P0oJ+rZZFBjlSdUmFKF2b3L6fqfp+PFz/GobkTNFMiWvu0kgJaftZwkxr0wvbC7akEW
	sOeA=
X-Google-Smtp-Source: AGHT+IFxb5MoNRZE8p+vcBJcw+mYbM7TWvCVJPFekMokQ+bgFgVSTU8RSDvrbqt+7XRx1CA7/16Fkw==
X-Received: by 2002:a17:902:e552:b0:1fd:93d2:fb9b with SMTP id d9443c01a7336-1ff0493165cmr152499935ad.58.1722427337740;
        Wed, 31 Jul 2024 05:02:17 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7d4129asm119048315ad.118.2024.07.31.05.02.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:02:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] wireless-regdb: upgrade 2024.01.23 -> 2024.05.08
Date: Wed, 31 Jul 2024 05:02:04 -0700
Message-Id: <0f9dae1adabb4fc22e8c4849eb2d52aecf21c19f.1722427225.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722427225.git.steve@sakoman.com>
References: <cover.1722427225.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 12:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202707

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0823e8ea83ac907b37bc9eb0ec7dc32862997eff)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2024.01.23.bb => wireless-regdb_2024.05.08.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
index 8fde236ab4..95e33d9fb1 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.01.23.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2024.05.08.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "c8a61c9acf76fa7eb4239e89f640dee3e87098d9f69b4d3518c9c60fc6d20c55"
+SRC_URI[sha256sum] = "9aee1d86ebebb363b714bec941b2820f31e3b7f1a485ddc9fcbd9985c7d3e7c4"
 
 inherit bin_package allarch
 
-- 
2.34.1


