Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66CEC433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:35:37 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.22001.1655667328003947298
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NLV1Laor;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 31so8437836pgv.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PEJ8TmAQY2llFvlpFJqoNHMQ8aoYfWNWibG9KOrsNd4=;
        b=NLV1LaorKNIRbvFjPOFQGPwpoSlVMjEueZryCePo9ECMsUX6Pe6DO5AUcmU3GAEO2e
         7Wfpbqqcx62dBlVgtpBnYVVqhxRO+OVqEOt590SWXKk+Mj0O7Ux1eXzJ4xIw0oxQFU1Q
         x2uRVUi266YR6t9T3feFCq3mjseJAOH0ljtjrlC8rCpYNzXZGYD+Vb8bKPY/zlWWFBGw
         63x8OJjByB1p1PToUolB0k3PMT7SQ0XVJWpsehFrvhJNKP5kBYhf3cf4WtwnHeJ5M+U0
         vUcMVdy6uvKGffHICVuSeplDpYYEL9XWJzr05twLk8AMRhdkwyw8DE6AemAPLFUysn/h
         deJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEJ8TmAQY2llFvlpFJqoNHMQ8aoYfWNWibG9KOrsNd4=;
        b=M1fUpPgl8y8l6rfevV4mSzmDF5fzJWCLrDMxeXa5n9ZHNRtIz0tLw8o7KYtVO9kGOx
         luKAoWJA32qWOpohmY7Ev01/OeuE0ZuO62rf+epwvbxW6N7EUW46bXuoY2Bm0p3hfE/T
         4xkVD2SaE3N/fn4LvrWWTR3O+SWDWMaBEFn1wH164xePGrLxSX5Mb9+hnOBdgCXhGeeI
         111NDAfkdVIXZeHo/WkrAunTl/9OfxpLsyT1nH9KfvWFAceuQZtDBSW8X93pHvePdjwK
         8UCMfOzXLEpNcQaYdzTH3qFrCioz7CumOcwTBMd+OUBC1+ZDdKPKTFhO3CXEc7vtWukY
         uwIQ==
X-Gm-Message-State: AJIora9MMqQfovIEBTM0TF3n/h7sKn3bsgZvAJ6hNGsAZcG0QZ6Mb0a9
	kkCLU3aGv8uRQK6Ghb8ffOq8NVsTvYqjBEvZ
X-Google-Smtp-Source: 
 AGRyM1ukmqCK1zlDOFh7LUWk1PnH2Al/Irbfnsq6FPaseO78SttrK5cEgWp4A2N2Es/kF1ehhlIASw==
X-Received: by 2002:a65:4501:0:b0:3fc:4895:283b with SMTP id
 n1-20020a654501000000b003fc4895283bmr18788584pgq.231.1655667326947;
        Sun, 19 Jun 2022 12:35:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e5-20020a170902ed8500b001678dcb4c5asm216994plj.100.2022.06.19.12.35.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:35:26 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/12] alsa-plugins: fix libavtp vs. avtp
 packageconfig
Date: Sun, 19 Jun 2022 09:34:59 -1000
Message-Id: 
 <a1b73bc6ba90fb079e514e4eeda8e231a950b9f4.1655667170.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655667170.git.steve@sakoman.com>
References: <cover.1655667170.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:35:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167067

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Fix PACKAGECONFIG to refer to libavtp instead of avtp as this is what
the project and everything is really called everywhere.

Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8824d91fe2063195014c38c134b97946d3b429c2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
index 659eea672f..8205982fcc 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.1.bb
@@ -36,7 +36,7 @@ PACKAGECONFIG ??= "\
         speexdsp \
         ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)} \
 "
-PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,avtp"
+PACKAGECONFIG[aaf] = "--enable-aaf,--disable-aaf,libavtp"
 PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
 PACKAGECONFIG[libav] = "--enable-libav,--disable-libav,libav"
 PACKAGECONFIG[maemo-plugin] = "--enable-maemo-plugin,--disable-maemo-plugin"
-- 
2.25.1


