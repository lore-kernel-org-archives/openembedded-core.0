Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1B2D711BB
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:23 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1947.1766089399062075082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OoctSnvp;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8888a1c50e8so12514446d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089398; x=1766694198; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fvdc3y2o2FNP+sv+ocmgVGW/5bUv4yz1V6Bzmo2wvtQ=;
        b=OoctSnvpJo6QwDC2m89lW1qjpROsLr2zD5EZeC1T+NI7CNQGMqesPGsiZevJA7fVVG
         j16atUAjyIX4r7ZFGvHuDkcFnwQGPufIPHmk+uN+G4yIhwD0Wh2/pp7A7GL1d0K8Cs9p
         lA66UYwxAXIbX3TtCP97sLmAJ58cMn60NhcqrYVJLtBDUcYWhrvnzoAoy2Dp4yn3ldVI
         eLuagZojoGUwJbUvhY84XeU59scqdTQyIMS/rgE/8ulQn2p13zH9aZnscG/+shHpwcSu
         OpNzG4sHGOkLzOehOTzcfs4jz2OQvRVR9sZ4eBmgD4VrWVl2xOPLUt6bxJdmlF0zW6ud
         9bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089398; x=1766694198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fvdc3y2o2FNP+sv+ocmgVGW/5bUv4yz1V6Bzmo2wvtQ=;
        b=RYzOs3V/OH0zL4ynM7jIMjVwJYKuHRUYmFjiBV5ptPXBy2ACA0whKDlwr91O1+yBfT
         0wHiX9jl2CDs46JMIUnYACnlcy9W851Yb+boBViGGZ+KcELb9BYTj5EM0f0vAKx6zoGp
         dmzRSVh6AGZw+nD7Phluzgen4CwM4z6wlEyZfJoKbPuGNZpStCzTTb9TjvtrJozQxW+M
         9F2wa8bYw1P2G9gdICeKg2KqHBPnz7NzYajFMcZHdiJWttcQDMl/6lZo25/QLTjJ1dmr
         +F/mRh0fRbW/zM/V75xkK4R9/dYfVsZjtto2EcfaLp/y8x9NuPsJT9yIeB9Z/1VnARAK
         QTbA==
X-Gm-Message-State: AOJu0YxocP8XukPUtWpTuyHzxLadtQx5IPPNLT0ty6+IWUkFAeiQZ/f2
	JwjHBs/aw+Pt4IdCApL7ntmDWBQ4JtGkNkzDOa1O4fvEwDTH6bmSW5LG
X-Gm-Gg: AY/fxX5PTLaYx2UETcJraf2rnRuA1w/E8d2IZjGy+bvMqUMkgZgv6ih3rMZN8LU3Atg
	y4GOzJXEY5W6wAecknHI+CGd9K79UlwC9PwskJjGas1dq0olsxomv9eNjZ3joZud6keeMOiU1tg
	nGSD2aCYsp6jc+UC+2e7HGth45sw3tN5mLoMgIt0db+/vAcUX6U9ah0EMs1XW020W1IFyhSCa3Y
	rU48sG7JKd3inu4qUF2niHMa5VIHn+VZqII42OC57mnOVS/g4Ti8DWd7NY8kTjv2rV6mw0s5xop
	LQa0XLiVMRaZpu7O66SaxGXJAj47ugeb0rcvuRupRRZDQ3eI9IzUKSIH3R4qKXIRGNt+LnuASE3
	horspDd/oXWDMeIgiv+jEEiSNVghfLYLJr3N6+2v3iZ6dLUT/St/AlcXNkmTCNgTFA+62REt0Ck
	+hXCChwFZvKT6OZrphghtUxhrnEEgjJQXu3pTRl/+tcw5QMjAh6fRRGMaCgkFgjfmnKQ3wfGxI4
	nkbmGoWpl7U6uk=
X-Google-Smtp-Source: AGHT+IF4U1jCJbwduQt3UpZPwY95Xz8K4V3ZvndQj+f6slucHupidPwlO4lz88QfoerTK+jKJr0N0w==
X-Received: by 2002:a05:6214:23c7:b0:88a:4698:1b37 with SMTP id 6a1803df08f44-88d853ec197mr16566066d6.60.1766089398038;
        Thu, 18 Dec 2025 12:23:18 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [05/06][meta-yocto] poky-alt: make default kernel 6.18
Date: Thu, 18 Dec 2025 15:22:45 -0500
Message-Id: <20251218202248.70476-20-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228163

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Making the alternate distro 6.18 to match our LTS bump in
the other reference distros.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta-poky/conf/distro/include/poky-distro-alt-test-config.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
index da9199d..a5214c5 100644
--- a/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
+++ b/meta-poky/conf/distro/include/poky-distro-alt-test-config.inc
@@ -2,7 +2,7 @@
 DISTRO_FEATURES:append = " pam usrmerge"
 
 # Use our alternate kernel version
-PREFERRED_VERSION_linux-yocto = "6.12%"
+PREFERRED_VERSION_linux-yocto = "6.18%"
 
 # Ensure the kernel nfs server is enabled
 KERNEL_FEATURES:append:pn-linux-yocto = " features/nfsd/nfsd-enable.scc"
-- 
2.39.2


