Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDE3FC46CA0
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 23:05:28 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.57564.1701299124112465915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 15:05:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HD5dQ86l;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cdcd790f42so342642b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 15:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701299123; x=1701903923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpHFjmkyS2K1V5hhx7ewKap+ELp4nwJ1Iao9gHRAsP0=;
        b=HD5dQ86lwBE6UpTlj0yPSnjDVfMJQ813nRgt4B02Lj9VItQA6TB8lHork+KVm+Blck
         u9cOBzLB3o+k8SLJ4Qvo0B3QBWI6ECTFYClRP+8P9NsugNqVyEkjuOK2blOSyeh+gTBf
         eOl9vsPS4x13R8KrW5QGKuZPZtVhZMov4h3XUSRCnK5W1nsdZNvnnTgP+KfMU7/IMAj9
         4EX9H+bCFUzmF9K2ZDhPJrJ6NFiJYV/bl02uQtOH6NJ6LvWg3OLUIwfMOsKyM5pUC/Ol
         b3w7rfbLiW9QvGMsE41u7Pp9anxz5Fw/si3eh36+xUeCwai9v3pfASk0Qrp22dBmMIaV
         mCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701299123; x=1701903923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fpHFjmkyS2K1V5hhx7ewKap+ELp4nwJ1Iao9gHRAsP0=;
        b=a80mX+ivwiHoFqbbzVOSZCziMYY5pjay3Ldd+yxI/aTokm/b57/iPplw04w4WnWYWj
         tRTKrwaAYObWJrav+A660mGGDKJxw7S9wPKb29C44hZM4WuflKcX56yRwuhmuWTgPcmA
         tcA5my2P34xfkKAvT9+oMLYuJ4Dt//k6OgUDoQqoL8DNGJYk2R2DHHvDdwbTP5l+x6HS
         xSSGrKyQWTnum++tX1iunmm7OjuZHoGd+2+CmGLsdwy6D5Fdvnm2pGAyDGybmk+cMel9
         LWxAp287h+lpZoHuuIjN4Eoo94bO45KaCWRo4JHm+wXbpeH6Aa8wuGEA1IDBcDVxXX/4
         KRJA==
X-Gm-Message-State: AOJu0Yx/alThYizyuwgRwFJzKCumNK06vo6UosqFCazl2JpufJgsMCXc
	yvUpVccMbjy1OvpMSsADTiuTzk0TFLT4ZQFzEIBnIA==
X-Google-Smtp-Source: AGHT+IFtrQhTBY5BP8/t7I8asPEt5kUgJTJAuNLEO+v6q5Vj0Ipfoey1L01+Ku9qHhnupjcaZ2gHJg==
X-Received: by 2002:a05:6a20:baa4:b0:18b:82cb:4092 with SMTP id fb36-20020a056a20baa400b0018b82cb4092mr16935384pzb.11.1701299122902;
        Wed, 29 Nov 2023 15:05:22 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id u4-20020a17090341c400b001cfc9c926b7sm6918999ple.75.2023.11.29.15.05.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 15:05:22 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/8] kernel-fitImage: Strip path component from dtb
Date: Wed, 29 Nov 2023 13:05:00 -1000
Message-Id: <9a42349a176ca4d7a1bfab3425a0821dbcbd9368.1701299008.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701299008.git.steve@sakoman.com>
References: <cover.1701299008.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 23:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191471

From: Ninad Palsule <ninad@linux.ibm.com>

Machines that have added subdirectires to the KERNEL_DEVICETREE
recently, such as arm32 boards that were moved under subdirectories in
Linux 6.5, will have that subdirectory in the node name of the FIT. This
breaks existing systems that select a configuration in u-boot by it's
name.

Strip off the directory component from the device tree to preserve
compatibility.

(From OE-Core rev: 941ba1a132bafa9c9be855fb91fec96d8b06299f)

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de> # backport to kirkstone
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-fitimage.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 27e17db951..194d825b0e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -542,6 +542,11 @@ fitimage_assemble() {
 				DTB_PATH="arch/${ARCH}/boot/$DTB"
 			fi
 
+			# Strip off the path component from the filename
+			if "${@'false' if oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}"; then
+				DTB=`basename $DTB`
+			fi
+
 			DTB=$(echo "$DTB" | tr '/' '_')
 
 			# Skip DTB if we've picked it up previously
-- 
2.34.1


