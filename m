Return-Path: <pdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD07C36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 10:21:48 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.44810.1745835699633779061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 03:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=U9t1KBHi;
 spf=pass (domain: mvista.com, ip: 209.85.210.175, mailfrom: pdoshi@mvista.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-736c277331eso5222006b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1745835699; x=1746440499; darn=lists.openembedded.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+3Lq/a+gK5ZxIVBOd4Br9k8s5CTEPmIsWC31/oOptA=;
        b=U9t1KBHikz2AMZPIsHUBdpei7zFgKED5MbiG8y1kmOVVb1Zm2qZNaqkIkkyOBivP0d
         kgaOYG+zZb/LO6tBZBAAFa+0Y4zA7rXo4Seo5x94kZI57KnipYGPS68tVcEWDq0Ht3D/
         AMQpYcQ/IdNNODygCFtfTycaQnJzyOlWJXYx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745835699; x=1746440499;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+3Lq/a+gK5ZxIVBOd4Br9k8s5CTEPmIsWC31/oOptA=;
        b=l8l0AEz8wtW6yn+tKTEJY+SuRI3OfYs4+0iC8GvAO2G3j9lTLjsy/j2jSdAY5F+PzE
         sjyhPWQBYzTmg7ExP4LtOiT18sT+k8ZKR+vo346wNPgV58SjrhD/qO/1uvlWwL61CSqF
         sU7dZpt/2vCasYC2UEdQkiO0vshPF9VzF4puLcROMuTXuC38r9zDiihR67wofknIyaYe
         lqHtWMAX6CWo+SWFBD6dGFnrjtUXi7ZuXdnEysJGrTtq25Xc17MLbXGzmK7m6dlC9bKc
         tEtVHibzvMoZrfzrYKJSjiBBkQzgs8tOCQMwbMg7u9Oo44JDnBkop/UsbcfY38oQfz7U
         ckDA==
X-Gm-Message-State: AOJu0YyqjxMsZ7+v0UdolhWNkX0O5YpZmRroxThWZ33F7+UX2r8lyd13
	14sDnKMfmlek8rswpJ7saiv9rTq0D8rdnXawrybPMmrBsc0DFB6SYYs5czujhovRoWhGzcFzGc3
	+p5c=
X-Gm-Gg: ASbGncvkoJiAaUY79Ols1B/xMIqkBtLq1wnKJly6Z2cv1yu48AiJNRaWUclamEImLx1
	4XI2Np0kG+Gmv3GzUetiHzoAvEKRhCmTt90DMz2wjd/LEIXHhcz1/HNhi5H2sBBPbjSYRoU0Rp/
	hwvFL30n204yQicFUv7w1HlIlkWkz8C5O3zYPvINgFHkiACQMqEIly7YEjFNXikXT0USlVgS4AL
	BwB0deG7GOkPNwMCHBcC/UeNzWG39HgtUjMW0HuHI2lfLTVIgt8kDzrf7woy4QmRmGy0PDdOA+z
	bti/f8qiBVFoAqlWKmFcW91qixFk5qlmk2Iv2yBm6g2IEmHfOw==
X-Google-Smtp-Source: AGHT+IGcqpBInL0vtoCwL2U34FuAe+a051kG53XZoqwovLNhHYtiEcxnZVmvrurHtc6kIE5eAs2AZg==
X-Received: by 2002:a05:6a00:3be1:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73e268ef408mr20362650b3a.12.1745835698499;
        Mon, 28 Apr 2025 03:21:38 -0700 (PDT)
Received: from localhost.localdomain ([182.74.28.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15fa80fa6asm6858427a12.61.2025.04.28.03.21.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Apr 2025 03:21:37 -0700 (PDT)
From: pdoshi@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Priyal Doshi <pdoshi@mvista.com>
Subject: [OE-core][kirkstone][PATCH] tzdata/tzcode-native: upgrade 2025a -> 2025b
Date: Mon, 28 Apr 2025 15:51:19 +0530
Message-Id: <1745835679-14153-1-git-send-email-pdoshi@mvista.com>
X-Mailer: git-send-email 2.7.4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 10:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215591

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 3fe6c31..bb81d77 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025a"
+PV = "2025b"
 
 SRC_URI =" https://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            https://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "https://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
-SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
+SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
+SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
-- 
2.7.4


