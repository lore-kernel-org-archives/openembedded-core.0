Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34251C7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:17 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.27634.1677860296563352748
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=wRbxncai;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id v11so3170412plz.8
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4VqMDuy6K7SYU1JLyGXFmbIpGYqL16AVXwzwJR1Mycg=;
        b=wRbxncai2oBVpX9txwluk8ofTFSUZqdRC1/36qal7UwL6QMRGV4+iZRKtrntOTad1V
         jImUHEiTcGDR792LnPvErEQy2T4at+PriDr73g2WFUBf7aekDtrW/gYx5V4BBCopRS+X
         SDQC2vM+7cM0PcnaOjdHxrco9WLRWOIH56ExLwbaBnQqjwvowlpH8oOEKoV09k7qecqG
         N9mAYCGbh23rYISmmiyv0KtV/UDsnzX1iNxonA14/aFonPiOV6wVerNpHgPmwR1sOs4p
         mSwrYOLANpnZcljej35zINfxA3rJMtgOtgwyGcSg1JdIPeYECJBodqE58e8BF4Ey1i0e
         5j1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4VqMDuy6K7SYU1JLyGXFmbIpGYqL16AVXwzwJR1Mycg=;
        b=K2sgqPdK6EeaNB7GWXIFDgV1oqhVQ/bZ9RCsTvIYpVTP5aryGqQbDLv5AyGnszNm3e
         jh8+8umxojBzitAidpKBDp8aMFLeGYf+CL5LUU4Qfx+CLoMopEP5L8LYRahGoJMydkeE
         pmUTowrBMg7i5+ptXi43U2Cr+B9s887utAS+JXAx61wTIBdyg/omu9hkKwJ01dPO9Bu/
         tNTMyQnwUbESXVnYnMUDKvQODqd8gxXd67Nes88uXtl1bTelsLwRCxY3gfnW8xaqYYJN
         k1s5NXufZVCExhwujwvEwA+Bm6g+f9RbBVaCyM03bEfx4TIxcbpHPNGjGVFkCZ4ovps+
         I9yQ==
X-Gm-Message-State: AO0yUKVx82PL7DxLGdS9Er9GwUibmZLOIrRUH02cGzgI8hdis6yy1iyS
	/eEeEBgty+BZJJLzz0yyfuM6YrMsBHS581VskgA=
X-Google-Smtp-Source: AK7set8VQ9zIXkM3jVGJxPRpLbu1VLtD0PvMF+8yDuGPRo3SQS2lNdtKsfD4hZg22FJ/0tGkCWO3GA==
X-Received: by 2002:a17:902:cecb:b0:19a:6acc:1de2 with SMTP id d11-20020a170902cecb00b0019a6acc1de2mr2517549plg.35.1677860295653;
        Fri, 03 Mar 2023 08:18:15 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/29] kernel-yocto: fix kernel-meta data detection
Date: Fri,  3 Mar 2023 06:17:23 -1000
Message-Id: <886714c382139dd2090296c6a08e687dd389f7dc.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178014

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Fixes: 7ef7af5c03ba ("kernel-yocto: restore kernel-meta data detection for SRC_URI elements")
Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c77754f23e3fb49a62602a6c6a04d5525d1cf457)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 82e792351f..4f8e391428 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -206,7 +206,7 @@ do_kernel_metadata() {
 	# SRC_URI. If they were supplied, we convert them into include directives
 	# for the update part of the process
 	for f in ${feat_dirs}; do
-		if [ -d "${WORKDIR}/$f/meta" ]; then
+		if [ -d "${WORKDIR}/$f/kernel-meta" ]; then
 			includes="$includes -I${WORKDIR}/$f/kernel-meta"
 		elif [ -d "${WORKDIR}/../oe-local-files/$f" ]; then
 			includes="$includes -I${WORKDIR}/../oe-local-files/$f"
-- 
2.34.1


