Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB534C4321E
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:43:01 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.1938.1667356976762702019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tEC6/SeH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id y203so1055039pfb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAVsOcaLD1JJEF4SQtdHT41TlloAWbrFQ36Q2wzO7zE=;
        b=tEC6/SeH8mBo3qf+KaPh3BKdi7vncZxor/x6YZjRKe29VnrImpOF85P+capWwQnsex
         WVAy4BmN/KvGkdQ/wRuLxFkZDw83s/uZ1+Xgf+QXnkY4m0M/kr9au5aEhEswTMf8FULh
         j1lsaS2y/JbN4xdThzXsDiufGxel6Ig+4gCkKqzSA4ThyWXHZSeSZ6s46zIvr9AVHux1
         H5tXc3Ky7LBp0rRCoW1WDdEPz+VHzvW1XG+zTbYgSgaTEbsBSop8uLDiXLLuxQjFjgIU
         BbYA35wxd39Q09M+Zvlmfz7jMjDhXnir4izY4Bg6iNi//X3aK9lwSivNN9POUNoS73R7
         VaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAVsOcaLD1JJEF4SQtdHT41TlloAWbrFQ36Q2wzO7zE=;
        b=Ut0WQRz68BuUr1qViswzfdP/LF5Qmd9K4xIYBKYwaRiQAK4q2ePtYiKO2thY1zerLO
         2+jhA5QdwW+azpwf9ZTsBLaBa8UyBuNwGTPykVH+gIlgyPSe2ixpyE2ng41NSBXvRDUm
         F69/NsgXc5kL56klVZ+ZKeG5hfNsvx5ueBA90FYbvg8kadg0Bl4Y7vtYktmDZztW/wmH
         2e9f6eAruJS+fQqR8/5bYoZsOP4YoSkVVNBNxSRmr80sRibgTafWXd21rvLhE8ZnJhqb
         siYrkoKV0HgJeTiN8sbff5txDRGk9pEuIMBFxW77OuNBsCO0DqjMaI3pU1CmEmPthcWp
         y5gw==
X-Gm-Message-State: ACrzQf20GAPGoyjc/StM35KWSVpBE6WkzEDv+ahQThomDJLV/b8YRlID
	uFWU+P+eY/lPQx8ToqBTFiro/oelYXTok5kk
X-Google-Smtp-Source: AMsMyM7rv9C7WPvp03PR+VPVOyJ4WoqYkWPZZc9mBgwn91cYD1wMSZa6ShKBqdFrrw2FrOaIBLIdPg==
X-Received: by 2002:a05:6a00:4508:b0:56d:8afe:b7c1 with SMTP id cw8-20020a056a00450800b0056d8afeb7c1mr11763921pfb.29.1667356975825;
        Tue, 01 Nov 2022 19:42:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 16/20] qemu-native: Add PACKAGECONFIG option for jack
Date: Tue,  1 Nov 2022 16:42:06 -1000
Message-Id: <7c8f23aa594175f2169df0d62051bf42d491a1bb.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:43:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172556

From: Jeremy Puhlman <jpuhlman@mvista.com>

With libjack-devel or jack-audio-connection-kit-devel, qemu-native
detects the library/header and tries to build with it. Since its
missing from the sysroot, it fails to build.

 -O2 -fPIE -D_REENTRANT -Wno-undef -MD -MQ libcommon.fa.p/audio_jackaudio.c.o
-MF libcommon.fa.p/audio_jackaudio.c.o.d -o libcommon.fa.p/audio_jackaudio.c.o
-c ../qemu-6.2.0/audio/jackaudio.c
| ../qemu-6.2.0/audio/jackaudio.c:34:10: fatal error: jack/jack.h: No such file
or directory
|    34 | #include <jack/jack.h>
|       |          ^~~~~~~~~~~~~
| compilation terminated.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 27260be388f7f9f324ff405e7d8e254925b4ae90)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3908aa0c7c..55aced9f9a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -199,6 +199,7 @@ PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.25.1


