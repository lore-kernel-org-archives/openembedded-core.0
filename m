Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A41C54E58
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 16:41:13 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.68038.1710175271074242463
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 09:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=icJwOQa1;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-690b100da62so32232726d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 09:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710175270; x=1710780070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L78RIKCrjqolguEUVNIjaSUipoKvUuMEAr8kROCmQpY=;
        b=icJwOQa1mcRouATZphmMtjU3ywWGjc8gxYlJkdQPL2TaBMh7SqIGGmWRc0HF6VOKHm
         QAFgK53TBJHoZjJY50cOX34wyYqv9CuS5SX1MDA06+LaesZ6oC/RHrCmfViv4tIV14l7
         xnfaAQBMXe0yOygh1eRWKD19n8/qdRvDgdENSHW4ukU4P25Dzhl8CVrP5vM/qe6/rFWd
         Eb5h63Q+9Ot9Q6vtGmBxmM4nW1gkXK7Nm2vDo47NUkX4ZZaBcmOMx6Q3ABW8XY+etTb0
         YfZKj/2BVqp22oZEVU8R8ma9DHOE1rqaQExRRRYUhUviiIqRwwebLWTnFRdOb1OK7p27
         gGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710175270; x=1710780070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L78RIKCrjqolguEUVNIjaSUipoKvUuMEAr8kROCmQpY=;
        b=L+pp/jTYZkLez1tN/qD52s1R0M5nSBQ2Uf1wKy0C7t/oGOgJseTEUJloh+rd1uBOwO
         yi0itxNUPMhKf3Qvl36+nyArjz+oF1cvMXThyrVWPZl+oKRFiF/niG2NuRu/x6Pc1zVg
         NwqisLcJx/j4Dh6j8Wr/4c1fjsjSt13bJSc7IvNjb0hdDMNTs71/NJzj2sibxm33MPxx
         jY0Hn0rrEU21ZkYX3HBI2tt1ztu4s5vR+0txcx4rW/Uld0tKgwUjfEfUXTkCuXka/9yc
         c9tiusGm2+iIBzoJ6xyHkgGOoYlERsJGt5FDTWAzdcOjzQ7c9s6SI0t4F4WgS16pYa4n
         bn4A==
X-Gm-Message-State: AOJu0YyHyK2/UGeY31nHNy4Q1invVgbYn1wh9r+F+zwFTRamLBKWmXOo
	X4pPJoeLcYAl+iMI6xakKea0Srd+hNjnI4MFxbDOFRVd1vYPIpn3
X-Google-Smtp-Source: AGHT+IE8R1898cS9ol6LCy3n4BDBaoBrGPuAx/9IzuxppTNCD+yPFBMDVdkPwdpSaXaQ7Vg9lbaTVw==
X-Received: by 2002:a05:6214:aa4:b0:690:c3ef:11c1 with SMTP id ew4-20020a0562140aa400b00690c3ef11c1mr6935738qvb.3.1710175270141;
        Mon, 11 Mar 2024 09:41:10 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id y2-20020ad45302000000b00690c99e7ad5sm1793928qvr.110.2024.03.11.09.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 09:41:09 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7][kirkstone] yocto-bsp: update to v5.15.150
Date: Mon, 11 Mar 2024 12:40:58 -0400
Message-Id: <6c8d39a83ef4ae0b1081253c4778fea36b00aaa6.1710175022.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710175022.git.bruce.ashfield@gmail.com>
References: <cover.1710175022.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 16:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196952

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the reference BSPs to match the version of the qemu*
BSPs in oe-core.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto_5.15.bbappend              | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
index 3ad175dc84..c6d145fdb9 100644
--- a/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
+++ b/meta-yocto-bsp/recipes-kernel/linux/linux-yocto_5.15.bbappend
@@ -7,17 +7,17 @@ KMACHINE:genericx86 ?= "common-pc"
 KMACHINE:genericx86-64 ?= "common-pc-64"
 KMACHINE:beaglebone-yocto ?= "beaglebone"
 
-SRCREV_machine:genericx86 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
-SRCREV_machine:genericx86-64 ?= "0b628306d1f9ea28c0e86369ce9bb87a47893c9c"
-SRCREV_machine:edgerouter ?= "90f1ee6589264545f548d731c2480b08a007230f"
-SRCREV_machine:beaglebone-yocto ?= "9aabbaa89fcb21af7028e814c1f5b61171314d5a"
+SRCREV_machine:genericx86 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
+SRCREV_machine:genericx86-64 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
+SRCREV_machine:edgerouter ?= "23b867c1a618572a36b6283f55746a5162e08cc7"
+SRCREV_machine:beaglebone-yocto ?= "4fca0c437367cf4d4fe158d74e0ae880a3f99d3c"
 
 COMPATIBLE_MACHINE:genericx86 = "genericx86"
 COMPATIBLE_MACHINE:genericx86-64 = "genericx86-64"
 COMPATIBLE_MACHINE:edgerouter = "edgerouter"
 COMPATIBLE_MACHINE:beaglebone-yocto = "beaglebone-yocto"
 
-LINUX_VERSION:genericx86 = "5.15.72"
-LINUX_VERSION:genericx86-64 = "5.15.72"
-LINUX_VERSION:edgerouter = "5.15.54"
-LINUX_VERSION:beaglebone-yocto = "5.15.54"
+LINUX_VERSION:genericx86 = "5.15.150"
+LINUX_VERSION:genericx86-64 = "5.15.150"
+LINUX_VERSION:edgerouter = "5.15.150"
+LINUX_VERSION:beaglebone-yocto = "5.15.150"
-- 
2.39.2


