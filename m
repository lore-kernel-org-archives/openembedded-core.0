Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD50EC32772
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 16:57:12 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.44940.1660841827187637374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SnOwAzfd;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id 130so2077144pfy.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Aug 2022 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=i9/j9T78zutpgzv41n9qunozGe1LyUGdY9k2KfbBP34=;
        b=SnOwAzfdzLxsGbzO3/oo58q/NTwWuAJ7BJ8zx+K0WA3gonFUFA9Gn2K2O9QK3EOVQ7
         q5sL4xMJcGfdck+gMX/OKTkw/VPDDjC5eJ4w1d5nALiBKJ4Ed/hCJLEeuzh3F+VG6R6x
         fbVL3XmrafVk+u9L2cuee5QARJr/87775Rly3SnkxTs4rW9RFLCjJfF1t3tTPyAoHYyW
         KOpXEuNis/yQG/KT+eHUcUvVB8jmQVTtNzZb2FqDtG+3UD1hAhboiwUQOhHJ1ohVgY3M
         NHmnfZvB69kLEZqV/9VK0mxabfeI30IgMte2S8E+wdJfk2jS9+LCMOj+0yUoCEwN2ReR
         4NEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=i9/j9T78zutpgzv41n9qunozGe1LyUGdY9k2KfbBP34=;
        b=zjsgzNz9x+qbxStmTE58vaKxpl+zaWEOW/CP1uAap8X6eRUa4qYP+pRW/D9YtRglnm
         LoYjhDEHaFn8O52JAAV+kTIk+XS+wU4hIDATSeF4qMaxRJLIEfGKkTXVp6irK0JO92kq
         T1eYfPybQ5jNebSestMdTpNe6o9UBYWLyx+2yIBDq3EEaoqQKREUOuVPsTr1s4Ht0MNO
         lu/bZIIomst9i3WgPpRf7tvU+QJe0V2bwFisxjByvXVy0IPTsQWN7eF7FW/EznxixfCv
         ObWF1XOYp782kTHUbh3tJab+DtgQ+E/ernPjIVnDsbyCmF74A/STpgq3voB707jB7W3J
         J37g==
X-Gm-Message-State: ACgBeo2mdWfczWQoPFzGl3LDTkvfHpmF3s4N3YR8lB0c7t2a05hf4qV1
	x5l3xx+ZzZfWXBGaraZKEaEBzRTl9cBCaGUU
X-Google-Smtp-Source: 
 AA6agR4MJPhviVdSHgMv/LzcXyk60+7D0OHfSxroHfFOoQZ9xA87WUiQr/qfCryk/zepTVvwLi+Y6A==
X-Received: by 2002:a63:86c6:0:b0:429:e4f2:3e7f with SMTP id
 x189-20020a6386c6000000b00429e4f23e7fmr3008159pgd.164.1660841826241;
        Thu, 18 Aug 2022 09:57:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h135-20020a62838d000000b0052d432b4cc0sm1897446pfe.33.2022.08.18.09.57.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 09:57:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/11] linux-firwmare: restore WHENCE_CHKSUM
 variable
Date: Thu, 18 Aug 2022 06:56:24 -1000
Message-Id: 
 <a92117ddc61f4c8bb32a4badcf00a5d1a0cb2371.1660841536.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660841536.git.steve@sakoman.com>
References: <cover.1660841536.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Aug 2022 16:57:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169529

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

Restore WHENCE_CHKSUM variable which is used to hold the WHENCE file
checksum. It is necessary to allow easily overriding it from local.conf
if the devupstream version is selected:

PREFERRED_VERSION_linux-firmware = "1:20220708+git%"
SRCREV:class-devupstream = "${AUTOREV}"
WHENCE_CHKSUM:class-devupstream:pn-linux-firmware = "abf1077491eeb261ecdcb680a34fc059"

Without the WHENCE_CHECKSUM one would need to manually patch the
LIC_FILES_CHKSUM variable to change the checksum of WHENC (e.g. using
the anonymous python function or remove expression).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 554be2af1e0a03a2d23032d48afbbe0913a45409)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-kernel/linux-firmware/linux-firmware_20220708.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
index e7a7e0828f..27146154be 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220708.bb
@@ -128,8 +128,11 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=def08711eb23ba967fb7e1f8cff66178 \
+                    file://WHENCE;md5=${WHENCE_CHKSUM} \
                     "
+# WHENCE checksum is defined separately to ease overriding it if
+# class-devupstream is selected.
+WHENCE_CHKSUM  = "def08711eb23ba967fb7e1f8cff66178"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
-- 
2.25.1


