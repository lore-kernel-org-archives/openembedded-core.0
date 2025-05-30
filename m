Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C45FC5B543
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:19 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.1265.1748626757060884732
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UTzB9EIm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742b614581dso2237593b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626756; x=1749231556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xa/nkUt8/5AVaq3u3CHFftCmmBud9KxiXYSyKNtfB6M=;
        b=UTzB9EIm5Ia2IvKRJKFkhIRtaoZ2dKEvXZSFMc0wd4KbA/agrMDEcM1CnvY3r39zkp
         HbqIh/VpjK4s66lJlEn26LKUNsA3mz+jPHoVRY5nlWajmknK/cm4f86jjHJkktUE/E1a
         6U/G0WNUTe+SfJYie/nbubT3/EPzCLZ+9Mj2hOreh2CstN+UiH+0nVoxNUQwjzMNhwXC
         Si10glf8lyP21/CISlZeZiPHzgcZOCdT/jwIJYeu7vmiQRBVMrg6v4WlAhut6mmfbijj
         8tzEoMMKGAv+iRKHfHthnR65VU5qRp5RE3LKRXC19n5tWgrxp6SGIo35naSu7FAbQ2mR
         dEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626756; x=1749231556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xa/nkUt8/5AVaq3u3CHFftCmmBud9KxiXYSyKNtfB6M=;
        b=oFcUSZ5DrCdCL4d0fEJ/meZt6Wp9d2p1L7y/rV9hHM0YQfAVyPfqhyzNSWj0pTFkbE
         z1jyiedgh5mpCLoH8AatvOyoN3ghykJsuVk5dot+eRxohE+K+m+eswCu2+sa12IunAba
         vVpvjcQsXWdgSB6lhMZe8S9yzBiafAMti+e/UlF066uNSg+19dwB6jKTAtbrFMl5c/x9
         51lHpbIXH5zAA+EMoa4b71aPnVtxVVgy4y1y+R+943eCH0EwE9yB5tyjrKH63MLWUpRN
         0VNuP0sNgorj0A/zH9ynGxBt9oogfXsNdbXTR+tVxsDjUPut1+aFzvbZrckYT1QPksrb
         Pibg==
X-Gm-Message-State: AOJu0Yw42pEUuOu70KHN9Kbn7PEkN4wz7MGW9t6Tf2w3gZ1zreZAf3PP
	SFUEl8C8W/aQY0fUI63+tpRGtAG5e6qFj8ioJhVFDVEAWzSF0S/NqgIg3VO8NH6LphrZANulABX
	vc2sW
X-Gm-Gg: ASbGncsQpIH8wuApDbJdCnR4MIu4DPHEC2fQo1GhpQI8wxy8tF7+NlAeTt4rx0sz5NX
	p19hf41+rpZrUwvv6EekfOgZ9UthFlkHS/WiXP1bVBVEE1VL+NmuX86mxsTivXWwO9yt7Q059gT
	c2I8T9m9TscXqtHjY84jAFQrVjdyVwuB2hJFQqpkrx8uz42+oWZzpVDxjPDHHrHqQ1pAHkRdKPm
	aNsMITyMmqJ+cvPwd0WUVzRAEYzfqeRd4luxQG6TtIcQA7oARjj8om8dcfB4eE5evUNrlVx4qEL
	gTbr7l6ioZccFjR1ihFTTQuZGdAh+IMmr0ydxB+ujqADmErriSCJaA==
X-Google-Smtp-Source: AGHT+IGdR11Tk/Ir6TI7PS2fNRgMwZ47QDW9UBoFSg05kIUL51llR1bCQbx544tJRCjqJr+fCJFXiQ==
X-Received: by 2002:a05:6a21:32a1:b0:1f5:8d30:a4db with SMTP id adf61e73a8af0-21adff49e0cmr4703053637.9.1748626756261;
        Fri, 30 May 2025 10:39:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 06/12] linux-yoto/6.12: bsp/arm: fix CONFIG_CRYPTO_LIB_CHACHA
Date: Fri, 30 May 2025 10:38:53 -0700
Message-ID: <6f46ffa7438e292ec373a33febac0678da54af4b.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217529

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/2 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: genericarm64: add CONFIG_CRYPTO_LIB_CHACHA=m
    Date: Wed, 7 May 2025 14:43:40 +0300

    Fixes CONFIG_CRYPTO_CHACHA20_NEON build as module:

    WARNING: [kernel config]: specified values did not make it into the kernel's final configuration:

        [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (m) and .config val (n) do not match
        [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/2 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: qemuarma15.cfg: enable CONFIG_CRYPTO_LIB_CHACHA
    Date: Wed, 7 May 2025 14:43:41 +0300

    It's a dependency of CONFIG_CRYPTO_CHACHA20_NEON.
    Fixes:

        [NOTE]: 'CONFIG_CRYPTO_CHACHA20_NEON' last val (y) and .config val (n) do not match
        [INFO]: CONFIG_CRYPTO_CHACHA20_NEON : n

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d58ac8f0e4788d675db594ad26b704f1277c909b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 2daf71600a..6560175461 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "28fcf1f308c59515410f6a0d0bc3278d5296a3c1"
-SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
+SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index b1a45ab168..cf6014efad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
+SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index b44bb94590..fefed8c9c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
 SRCREV_machine:qemux86-64 ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
 SRCREV_machine:qemumips64 ?= "8e88d1714f7f56efc4650cf84b86845d44c01eb1"
 SRCREV_machine ?= "5b22e7aef539a991b75fa45101cbc02051327cb6"
-SRCREV_meta ?= "23e01a412ce53c2b1a9ac83d143702c7d03ec0f0"
+SRCREV_meta ?= "a50ff542f8d79235030741f9e850d34768907d2d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


