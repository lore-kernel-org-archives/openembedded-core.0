Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E9BC433FE
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:21 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web09.16785.1667744291554862083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LajkMsWM;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id p21so8917477plr.7
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hEjE6CuB8QOSwk0Vg3vg+ve+Eak9QULOn33S2hMEk+Q=;
        b=LajkMsWMnSl2oW5po2K0ZBiWTpJlJV8LuIzAHtb4kzMRHxGiqjL8ykJKkAMN9W6wzH
         TND4Y7ztl957KimbcQEI+ohY2Dz0+TmFtKg/s02FOg+3AR58fBeqJsoqt9hGKIr1v4Jk
         jC4bKLmB6ybPiqa7zXQQzCGX3Z1/bfUnP1LpqjXRE8zVRy2uU8KsqgpKJ53qtKpQt9yv
         pTWBB30yTdtfOiE2slisAVZWuOefn32LU1EmtrjRXoSp9PLdScTp+W6FouDzR9DMB9VO
         ppBas0R9nRc15l8ojxTJYdoh70YeOAIR8/B5JyHEoUndG4C1O1W7jOEp1bX0KHYEbROG
         S5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hEjE6CuB8QOSwk0Vg3vg+ve+Eak9QULOn33S2hMEk+Q=;
        b=xpnCNb+2VrEb3TFkDbLSbj0ABR3Ax2g/HwPqihOt3HIUFvdUstQ7qhah1eCaqmt/ZM
         3GNDEoS7pAet9m1LzsL1oIE48y2tLYYuTLQpFZISr+EZwQDLNqrLfEbHg1gh3yGjZ3Os
         u4rLBEUhOc1QnmBmusk2VEy4WaADuXTljaCxm5WTpl2dDjSTxN/lzdHP0ud8e9aHmfhq
         wDLRN9joVFyWPRy9XDhMhTzgCIFW6lBvY+mnJyS1525TAyubNMqrad7jn1/tdQic3jjo
         nNhjVOQr6c4uQsv2D5a+CB6zCyA0g/vp675PDtTc+iKEt19jKm/4nqifNvpqZk0Hm8+L
         Hghg==
X-Gm-Message-State: ANoB5pnlsmi5dqpR5IbWRRffteE1WXsxNG/HG6KOdyXOdfK1LJxlL7IO
	OkIiMEKVecb/axXNZSzuCW61g7Vf9aU0j2Vq
X-Google-Smtp-Source: AA0mqf7UeXDM3inIWftdXzN6CgYJlrbwv72zpGP+Yi7k2Rez6E8QXJ/dWIfA3rPzA5EiLWTt46/6Xg==
X-Received: by 2002:a17:902:ce07:b0:188:7cd7:1ff0 with SMTP id k7-20020a170902ce0700b001887cd71ff0mr2393580plg.174.1667744290636;
        Sun, 06 Nov 2022 06:18:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 20/34] grub: disable build on armv7ve/a with hardfp
Date: Sun,  6 Nov 2022 04:17:03 -1000
Message-Id: <3d4bb6b1ba41e83c98e821ddf86e231daec029b1.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172788

From: Mingli Yu <mingli.yu@windriver.com>

The commit(75dbdea940 grub: Allow build on armv7ve/a with softfp)
enable build on armv7ve/a with softfp, but it acutally enable
build on armv7ve/a with hardfp altogether and result in below build
failure:
 | checking for compile options to get strict alignment... -mno-unaligned-access
 | checking if compiler generates unaligned accesses... no
 | checking if C symbols get an underscore after compilation... no
 | checking whether target compiler is working... no
 | configure: error: cannot compile for the target

So update the check to disable build on armv7ve/a with hardfp.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit f67b2880fc2cfb21f51216c63b5f24d0524b4278)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2545b99b6a..7161c4560b 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -50,8 +50,8 @@ COMPATIBLE_HOST = "${GRUB_COMPATIBLE_HOST}"
 # Grub doesn't support hard float toolchain and won't be able to forcefully
 # disable it on some of the target CPUs. See 'configure.ac' for
 # supported/unsupported CPUs in hardfp.
-COMPATIBLE_HOST:armv7a = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
-COMPATIBLE_HOST:armv7ve = "${@'null' if d.getVar('TUNE_CCARGS_MFLOAT') == 'hardfp' else d.getVar('GRUB_COMPATIBLE_HOST')}"
+COMPATIBLE_HOST:armv7a = "${@'null' if bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', True, False, d) else d.getVar('GRUB_COMPATIBLE_HOST')}"
+COMPATIBLE_HOST:armv7ve = "${@'null' if bb.utils.contains('TUNE_CCARGS_MFLOAT', 'hard', True, False, d) else d.getVar('GRUB_COMPATIBLE_HOST')}"
 
 # configure.ac has code to set this automagically from the target tuple
 # but the OE freeform one (core2-foo-bar-linux) don't work with that.
-- 
2.25.1


