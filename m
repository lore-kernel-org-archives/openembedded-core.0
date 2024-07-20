Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48401C3DA70
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 12:43:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.5281.1721479380550665312
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 05:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=adAwsrEB;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b1207bc22so1380908b3a.3
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721479380; x=1722084180; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLYd7z0p/HriHWy5VlmjoYu8eOV6WBKTRlB4Gumk6nc=;
        b=adAwsrEB0dDAXFiYM20UMrQfwfL4F2+cnwWVTSrRzDPqr7rM7lFrRV9mzLNIZtvuXw
         2ya/UFal4Zsq1x9tHMtmwMODXSNzfFAJ4zhcpB2JfdJ4ypYlAGZFPs5GXNo2mSqPhY8q
         jD7Oj+w4db2n6LRqsc366pYgB8QiyimeHy7sTjiBhfPt93ynsolzx5HIwyG2qlAixfRH
         RoCplwwcEw0x61o2eSi+ouLFYcGHldrMR9w9m9cJc7SRtAK8mZK2Bc3TMTHpiHpzdCE5
         3eKNnl3ZN1AxmZXKMAbnmS/z/SB7ZdlIMVkCLZN38gvoWHet2Ss77Ep7ykJnxz+XPKYN
         bLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721479380; x=1722084180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLYd7z0p/HriHWy5VlmjoYu8eOV6WBKTRlB4Gumk6nc=;
        b=Ffd8vNWaUr0P1E82lW8fA0zxQTRcx7gnUC2ZW9nlL3y/xO8sSMk2PVuz+MWu/MbwIJ
         2G8xMZlEzE5kdTxSH4U07yDscEwd3w92643casSez5HoB3dvvlCVnwhUMwjWK6NBQIDn
         V7uFpdwIuhcbk/PmFaQD4EUGMOPo0tzEJlangyRq6wGUTC202/5BA4UUtwXyU9X2us/I
         F2jWUJ3hD41BgbyUph+fyn8yuSsSZtvrvjRzYzNtSbnN1OqvydGH2o0CtczV3VPBEKMK
         +RxW4kaQpPi+4p+4A0nbTdRZVU8DFvA3AGYB0g3DK3Yx3fP2mci3rvTZsnzSOJvrHQ7Z
         RxTw==
X-Gm-Message-State: AOJu0Yw82GMQ/7+GnApYtYjyCsfPBUKMquZnZDcfics2hHJKPhs6t8hX
	SoNA19m+iMmMKAaYiCEcuyCfRfPyRlvoPFlqAoZNRYu005zs3wFkFXyMFIAnImG6alGzaw3Bo/z
	MXjo=
X-Google-Smtp-Source: AGHT+IHR9FG6hN0hMDE/NYt0OVykzlYlTlbSWfJ4b6c2pDP08tdb5t6prAZnvRiFp1HIi5kOhoeQOA==
X-Received: by 2002:a05:6a00:1826:b0:702:24b3:d036 with SMTP id d2e1a72fcca58-70d086247ccmr3841790b3a.22.1721479379733;
        Sat, 20 Jul 2024 05:42:59 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d0fe2e2b4sm796604b3a.10.2024.07.20.05.42.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 05:42:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/6] uboot-sign: Fix index error in concat_dtb_helper() with multiple configs
Date: Sat, 20 Jul 2024 05:42:47 -0700
Message-Id: <f6de96c9fa8d0b6c81c32016f342ad93c8940d9e.1721479252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721479252.git.steve@sakoman.com>
References: <cover.1721479252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 12:43:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202283

From: Florian Amstutz <florian.amstutz@scs.ch>

Commit 60774248a5570899a66f9f88e597cc4f723d6278 solves issues when i or j
have been set in other shell functions.

Since j is not unset after the inner loop, the image will only be copied
for the first configuration.

Unsetting i and j after the loops also prevents index issues in other functions.

Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/uboot-sign.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 6bb4ddc600..f3bbd8980e 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -137,8 +137,7 @@ concat_dtb_helper() {
 
 			if [ -n "${UBOOT_CONFIG}" ]
 			then
-				i=0
-				j=0
+				unset i j
 				for config in ${UBOOT_MACHINE}; do
 					i=$(expr $i + 1);
 					for type in ${UBOOT_CONFIG}; do
@@ -146,9 +145,12 @@ concat_dtb_helper() {
 						if [ $j -eq $i ]
 						then
 							cp ${UBOOT_IMAGE} ${B}/${CONFIG_B_PATH}/u-boot-$type.${UBOOT_SUFFIX}
+							break
 						fi
 					done
+					unset j
 				done
+				unset i
 			fi
 		else
 			bbwarn "Failure while adding public key to u-boot binary. Verified boot won't be available."
-- 
2.34.1


