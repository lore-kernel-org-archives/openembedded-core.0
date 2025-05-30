Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A050C5B556
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 17:39:19 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.1260.1748626753739782952
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 10:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=M2280ux4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2c384b2945so1966146a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 10:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748626753; x=1749231553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqB2E6UebLUgJzz5iFNjZt5eUurGE4nvULQmgC7HXIE=;
        b=M2280ux4YCCw3sZnIRxfF9hPDDPPczubstnfWmk4S8FH4qp4WEmMRLo2OLXJksDb1i
         k4GE9ZgsghAAoCypbS3if5ZFVF62njcgS/wXm/PK/+RW4I4/BOzl//PmT0MCYPs9J69G
         O436gkLsUNA/XQIPeDjkS8+KcoHqSV2JXhaZyvZtQ4x+GbzPvUV95bya1mIVVgzwqs6T
         yjVIa/Jf0IEnmqYNz93SKVdsa0LGNmHsa+2iY2bx4JJqXmZvILu88Sx8g83UcRFCVLjp
         UV7MmgPRe3SboYX0fu5fWefHQ9AmcLw2LE+uqVpahLMp2pddVbYENxiWKAhKX9pqpNhv
         7UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748626753; x=1749231553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqB2E6UebLUgJzz5iFNjZt5eUurGE4nvULQmgC7HXIE=;
        b=tmOenXjmYDDiFC7hrwP0zB0o7STL/zGXrKHc08wU3NukgvwPwlWntLXWEVYdqwGxo9
         8ehbScedfHSHp7yoR0RE1CnPF/uM1s/8F9OCR8/kNrGu6koaFMHHxi9+qVIP9DWpGGZX
         jgWMVnxr0hEV8pT1RmVCEZJRAkkzBEjB/KAKrTq2mvYuAcwofy/hPgSBo7UAJS/39eEG
         45+cUWIYwjLuGaZXvBU/tK2MXIJ7v39oLFmv2flKjS8BEZVAqBwQCOiOb3eHJemlWDWu
         XO6uN/oxRxPGC816RMFZ9v1j1F3XEh0Xnh9gZhDRFg65iUofEbUd4uDTeP2CfDB4MDm6
         3P0Q==
X-Gm-Message-State: AOJu0YyrozBpfRJSN3+xN8H5PXEt5bB12vUYaRVcynMhbrCJ5DsewUbg
	AcX7tg3MC/VmlGc1u1NAGO2Ysr13UgWTpPMzgEI5e31XlGfCByJivPJmBVNVc2W1v3IHhYfVG0o
	s/srB
X-Gm-Gg: ASbGncsO0AboAbbbga9eArhfVG+rR2C3sN/ohtTTH0DeqnS5Io0x49X/hDQAekh+DyA
	IRpwNt6UqPAh45GM6AvziwmWYFX4cmg1c+kgHyq8N0cQE1LhAr2EJtO8jqNysWlLhrRPJ2y+Yr/
	XSqCuWNLSPr7JB4XjpdL2bUeHMvY+FMn4AIILKp1yTzvTnQE9Vi/Mbu9LT4UaoyO283zQjRGBpR
	E0k2X1WqVnTci/I3P6k5soTcgzv+Mqx2jjKsGQKEQk+n1hFxTrBW26M/Swu/m9PfV27kPXX8c19
	aEwDxz3rHFgPX/2x/SBfJJWXz7lpmn4wC+9fSXI0SRYAn3sQqT6V4w==
X-Google-Smtp-Source: AGHT+IHcJN5n7Vd8Zd3hSYcVsOWFzUFJRayivVS2WN3Nb+dOWSiklZfQ5ywV+ez0NYDlKTA9nmthDw==
X-Received: by 2002:a05:6a21:2d8c:b0:215:df62:7d51 with SMTP id adf61e73a8af0-21ad952ef1fmr6018856637.11.1748626752971;
        Fri, 30 May 2025 10:39:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2ecebb5f40sm1554314a12.67.2025.05.30.10.39.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:39:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 04/12] linux-yocto/6.12: bsp/genericarm64: modular configuration updates
Date: Fri, 30 May 2025 10:38:51 -0700
Message-ID: <b1d0c2ea78f6bc58c4abda5da771a5cbdaf1e47b.1748626640.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748626640.git.steve@sakoman.com>
References: <cover.1748626640.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 17:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217527

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/3 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: genericarm64: build drivers as modules
    Date: Tue, 6 May 2025 09:27:53 -0400

    Load on demand. They should not be needed
    to run the kernel since it has already been
    loaded and firmware has already configured HW
    enough to boot into kernel.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

2/3 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: nft_test.cfg: build CONFIG_LEDS_GPIO as module
    Date: Tue, 22 Apr 2025 17:38:28 +0300

    The driver can be compiled as module.

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

3/3 [
    Author: Mikko Rapeli
    Email: mikko.rapeli@linaro.org
    Subject: nft_test.cfg: build CONFIG_VETH as module
    Date: Tue, 22 Apr 2025 17:38:29 +0300

    The driver can be compiled as module

    Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50cc72621bf2253ada8f2704d8b1b89bc67f7d6a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
index 27bd9f66d8..2211f78cea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "a20f2b5c8760fc32bd7137fbd952f7f3f810ae26"
-SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
+SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.12;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
index 50a217958d..bfe1773e48 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
+SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
index 96954f24a3..b7cfbca475 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
 SRCREV_machine:qemux86-64 ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
 SRCREV_machine:qemumips64 ?= "54af295ab3ca402812576c8425d92dcabe9f0b0d"
 SRCREV_machine ?= "8bdb46d18b39209344e65cd7ee24d1fa451397d5"
-SRCREV_meta ?= "1f6ab68a1d86836bf1b82b791df03da3cfeacb3f"
+SRCREV_meta ?= "e8b9f0530a30d2536429c78676f09189ba5d3a50"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.43.0


