Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF172D711BA
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:23 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1944.1766089395227515939
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RsnxR0G6;
 spf=pass (domain: gmail.com, ip: 209.85.219.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88a37cb5afdso25514006d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089394; x=1766694194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWuwjsl1URiv+HE5cHya1B2pkOJOj09p8UxwHO+Km04=;
        b=RsnxR0G6G7wOzyOniGufNbsGY1pXinhcThnTramy98m8cnSAfAFpkInImF47PmvhwM
         qIB6sUj8GGvHOrInicSS6moa9b9BNud1hPS2sbc9xf2DSXiJzo5rB8iSC8A2M/GwBwVt
         T86P4MPckByIN1FqK1k9wk8OzfSfiHLgMZAdXjaedT4IGNh1VYccTldRdSHOqybzQmyn
         DO/vwtl4/jDOjavEK9pxQlFP7d/N7LsW9Nl0H21kjmYXSF4f6STUNLhO//U4Pc0kntfo
         gnr0YVAjJ4qKGToHpodK0qOfUuCDbHiHNholB5ymHEt/XTYAvvOAFsaftOLPLm8JZ3H+
         exkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089394; x=1766694194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kWuwjsl1URiv+HE5cHya1B2pkOJOj09p8UxwHO+Km04=;
        b=Kt+Y1B+yE5T4mk44xNiSVgd2S5I0oVTOw/2u5gOsr/XWta2b4qK4Sg/9UuYapMI61z
         kij3yoxPTlh3byzF47SBMrs81cNsyLC3+GBAafDEYMu3ISHJLg80wfKbGsWXUE4/oMsX
         J2NajAdnQOB/mQqop8E2uUtkY76ZY4m+59LqiB/qqqNc0nx7HJKybe4ZdxQPaxYn3Ja3
         qqnwUor1AeSU1j0GZ+0vkD4tD4iHhydetKnE8IQMm/C2UfJb2Zfrx3BS1bbQA0q0Bovp
         5WcmAk7d6MTCIFkFEgWYIJ3ODXAP7D85rvr+VbdZth5OUGlk6OrreZSB6YV+s0RoBiwQ
         yLbQ==
X-Gm-Message-State: AOJu0YwVeaeKiMU59Xyb6dt/jULB/8hWy5BQLhZJm2/PvKp/mY/9xv6/
	AeArLD8o6vvk4Z/6ZD4h/eo8THpwOGgh5FLQFgR0B8VZNHuSPMXkAZ3MGcsx6ecI0nc=
X-Gm-Gg: AY/fxX5OcOo0rlJym+PNpipc0kq7xSMesUIpHrDcHynuD9Jg/7Bk9h3GSPI/hOnhMwk
	vBuOTDifBBUwan/Lm+XJYneW9SRYuPlUE3S+ONi3P46J0UXOXXUzYptZ4gHRSVvTakL/hi+LT2c
	asmdK27Cw+yHja1IYZVaosIZ3Sdj4d++pDGi27K6E1vFVLgP5wE/BO7x1KyI397QRNU400cKHYD
	1EAW7DIQOveqt2X2XlR9GqoVtoighzhZKDt1+A+S4m+JZi1w9MGk2YjL54bbg0Ry2hCrtFel7dA
	BzziWJjNu1slYZzB9FLTdCORQ8xZrvNpZC7xfPediMhPQHiUY6fVgAuYAlSaOhlTHpQgz60cf3D
	x4zohZ0hKXLEtv4kZ6BzKyEzmFs72zespu9FP31S6Z7oxkizuox/Ngy+4U6qFcdDKEn7mvjmBUD
	DbsFIbTtUpWc/tgfbpQ0eWckNhf5XttHWmRc44uHNDZJRfqHOzpFKTn/SM/6Y/zibw/O2ZiSW68
	caavS8pi30KF7E=
X-Google-Smtp-Source: AGHT+IFpV4y+8CACF+XJjSNpOxq50ayzuflWfhXEHWS9D0mjoNr4ZPffWoUfVM+9SDWJHUyoaiaD5Q==
X-Received: by 2002:ad4:5ce9:0:b0:88a:2f52:cc3 with SMTP id 6a1803df08f44-88c50bdc1eemr64234116d6.14.1766089394190;
        Thu, 18 Dec 2025 12:23:14 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:12 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [03/06][meta-yocto] poky-tiny: make 6.18 preferred kernel version
Date: Thu, 18 Dec 2025 15:22:43 -0500
Message-Id: <20251218202248.70476-18-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228161

From: Bruce Ashfield <bruce.ashfield@gmail.com>

6.18-LTS is the reference kernel for upcoming releases, so bumping
-tiny to match.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/poky-tiny.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro/poky-tiny.conf
index 84baef3..43c9bae 100644
--- a/meta-poky/conf/distro/poky-tiny.conf
+++ b/meta-poky/conf/distro/poky-tiny.conf
@@ -41,7 +41,7 @@ FULL_OPTIMIZATION = "-Os"
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
 PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny ?= "6.16%"
+PREFERRED_VERSION_linux-yocto-tiny ?= "6.18%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
-- 
2.39.2


