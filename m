Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D76C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 22:36:38 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web12.4504.1661294189280425355
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=c04Mwn1D;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id
 c13-20020a17090a4d0d00b001fb6921b42aso2899813pjg.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=wyMerV5om738SFJmB/2+rByfNad7Wd3TnXnvuJS1is0=;
        b=c04Mwn1Da2tQ72+kjbyUBWPunle2MjRfi2zzzaVEDP9Zyg6V1Y1vsxd8yJOILqNU4n
         UWNAKqsgUd1PVoG/b/NoU6tc3ag7IUisngxLtg+eLERLK9/wkeXkQ/jJBmb674LSDRPN
         U0dKsf9pAKensGEWyfUvP6JsZqhqQl83EWDg4cXeOAaTagIN7MDiz1zEJFOVeWuE/OL7
         YnX3gJXvZgo/tgqEVp0bZdUSFb1V0kQRuTDaJw2KD24fBoUUzDREbWz8AHsAAm87UiTP
         z6IMU/t/wAeYubPMAzcCx1RffCqHzSPBbdmp5fd9/4nb2pEAoJlrnREvsN9Vpyd7JYm2
         HDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=wyMerV5om738SFJmB/2+rByfNad7Wd3TnXnvuJS1is0=;
        b=uR7aASGFWtoU/eOBqhNcp3haHPMpyugiZwU0IZb078ZfwGaxd0vtyrMUQDNDkzhN4I
         SRTS+OIyoTBjDAQquVf8i8oE9ESbxSGN1fTQZ/aluxLHG0IYmHJ0pLWpItHvYQ/AfTaN
         hwgsr1wUObN12W3P6wqp/acY3SUxCH85JSihwlEqcn7JodzcgzzQrTUq/r4ZchJwJT0o
         2b338pQ34imwMwV/F9FqNsDun/EAzHbJdvlnLs/jw1cDw1acBkofes9StqZTOcBwnnxs
         Y6u3IQPMMD+WbDvd5w+dppCqh9c/VSQ0Pas0hJZWFTHgeZr2b7vQqciz5X7KGal21o9A
         dqRA==
X-Gm-Message-State: ACgBeo3mM10gfUxAuzvgzG+ySHoCQVwN1PvZKNBpcqt8/6nwDKa8I2L2
	1Aq9NNsPa8oRADeNnZHZ7WtRFhNXHM31/N3X
X-Google-Smtp-Source: 
 AA6agR4FnFgJKhnjpaPhTHwnh+X10uJVc40i/KUNK4r85VEJxH9yBDpuOcMfi8sSs0Xhh53jazAX9Q==
X-Received: by 2002:a17:902:e848:b0:172:dda3:780f with SMTP id
 t8-20020a170902e84800b00172dda3780fmr14367160plg.66.1661294188383;
        Tue, 23 Aug 2022 15:36:28 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 p4-20020a1709026b8400b001729da53673sm11042141plk.14.2022.08.23.15.36.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 15:36:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/28] python3-pip: Fix RDEPENDS after the update
Date: Tue, 23 Aug 2022 12:35:31 -1000
Message-Id: 
 <3e1c254f71a4d22ebde063e23242cd838fb917f9.1661293746.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 22:36:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169751

From: Daiane Angolini <daiane.angolini@foundries.io>

Fix the following error messages:

   ModuleNotFoundError: No module named 'distutils'

   ModuleNotFoundError: No module named 'colorsys'

Signed-off-by: Daiane Angolini <daiane.angolini@foundries.io>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8beef93e6e341566eba8a125f75ad836ac6a3d69)
Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-pip_22.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pip_22.0.3.bb b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
index 09a305edf8..6e28b87ba3 100644
--- a/meta/recipes-devtools/python/python3-pip_22.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pip_22.0.3.bb
@@ -55,6 +55,8 @@ RDEPENDS:${PN} = "\
   python3-unixadmin \
   python3-xmlrpc \
   python3-pickle \
+  python3-distutils \
+  python3-image \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


