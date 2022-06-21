Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEF8C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 23:29:48 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.1198.1655854178529839621
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=smPV9HD/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so11075120pjr.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 16:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=swi7c35LDRCmgDHDk7RiWoNHUMrHMlctRudLqBUeMsY=;
        b=smPV9HD/HUBrKjijBhH6uwns18toIgPuC3oRt30RjJ63o7vIv0j3ZBRz1ABOjuhl1N
         CKGJT41fA/SJaCzB/b9zydLOzUI6Xgyl3W8bHryf/7XdFMfENvYDKlOoNZVRAD8RKIBo
         s3IWG9Tb6tAP/YcXC1tajnmNjjB+a8qIu3Qt8pSfJkwbnY31uk7PmvlUpM++UArlTSS/
         dYCLq+UYgHcl/U536XM3sciFPuQqwZwwK4CAl4m9jT2EQW6kUU3uVA7XbbmIDxryXQQr
         0NGG+ZbiEsJaWuJEyfQ6JGOf0eqYqipczymESatFKaxgrSrBxSbcGehGxvsp/udgoJkS
         e1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=swi7c35LDRCmgDHDk7RiWoNHUMrHMlctRudLqBUeMsY=;
        b=CPZ+FH5vagGkEG/D3hcd9ALEEpBt6gE131HFb4SKYAvbe+sWr8gbbwqFqa0tYsYMhH
         Oa5ZwGTP6UonWliwqXX9qBZYJOi8G9mzFHb1TENtz/XPsgFOBCKC1phHzfJZPJd4UkZm
         bnwgbTrcEtOuvkPEz7xuu1KhQx9p0G17hITmXJZ984qiwGHJPZGeGRpjOATtuA8laZNe
         FCkjT2EoPGfABFzGtcFtFBOBheaV9PYSIX/XKR6PfJIZ80BHnJaWeDnY1SGnIkA/PgM1
         Xud4cUUDSGxbk/ky0loRdeNU9pAO+S4J4dZpGEFRrIaO/h3TSkDxBRChTJC4+O5uJ9tv
         JWuw==
X-Gm-Message-State: AJIora88wl/6/RksAaZDG7LLXNeirCTAFHmcdR82QlilpISFbx/hKspD
	guvduKWvmRxbjfDY10ueeOXxvbtUayOQQXJL
X-Google-Smtp-Source: 
 AGRyM1t+/cGw1raE7wCc/55FNIFFgSgJy7hjVedCrKL190lYdtADHdxJpAkUFlpBeGzKjVgzoWujCA==
X-Received: by 2002:a17:902:ed02:b0:169:e40a:7bed with SMTP id
 b2-20020a170902ed0200b00169e40a7bedmr25900001pld.167.1655854177579;
        Tue, 21 Jun 2022 16:29:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f25-20020a637559000000b0040cf934a1a0sm2041614pgn.28.2022.06.21.16.29.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 16:29:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 5/6] linux-firmware: add support for building
 snapshots
Date: Tue, 21 Jun 2022 13:29:02 -1000
Message-Id: 
 <6654baf267003ac62bc886901e5197fc211239f4.1655836866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655836866.git.steve@sakoman.com>
References: <cover.1655836866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 23:29:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167209

From: Dmitry Baryshkov <dbaryshkov@gmail.com>

In some cases it is useful to be able to test the snapshot of
linux-firmware (e.g. to test if the updated firmware works on the
particular hardware). Allow building the linux-firmware snapshots.

To switch to the most recent branch, add the following lines to the
local.conf file:

PREFERRED_VERSION_linux-firmware = "1:20220509+git%"
SRCREV:class-devupstream = "${AUTOREV}"
WHENCE_CHKSUM:class-devupstream:pn-linux-firmware = "4288aad55d189fa225d492526b8406d5"

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b023570ae1d239de14b50a0e827582d0e84ddf81)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux-firmware/linux-firmware_20220509.bb             | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
index ec92cae2fa..b6b4043002 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20220509.bb
@@ -69,6 +69,7 @@ LICENSE = "\
     & WHENCE \
 "
 
+WHENCE_CHKSUM = "d3eb82686904888f8bbbe8d865371404"
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
@@ -132,7 +133,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=d3eb82686904888f8bbbe8d865371404 \
+                    file://WHENCE;md5=${WHENCE_CHKSUM} \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -208,6 +209,11 @@ SRC_URI = "\
   file://0001-Makefile-replace-mkdir-by-install.patch \
 "
 
+BBCLASSEXTEND = "devupstream:target"
+SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=https;branch=main"
+# Pin this to the 20220509 release, override this in local.conf
+SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
+
 SRC_URI[sha256sum] = "376e0b3d7b4f8aaa2abf7f5ab74803dcf14b06b94e3d841b1467cd9a2848255e"
 
 inherit allarch
-- 
2.25.1


