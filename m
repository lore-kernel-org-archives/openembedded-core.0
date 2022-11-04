Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94203C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:02:17 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.7163.1667530928800680102
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5cuj79qd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso6921222pjn.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0K/JRd95ut1+dPVeYrDT2lGvuKp57vnidpoEFF4wcU=;
        b=5cuj79qdSuQUJIW2OxnvHvWPP8/7JaHI0TgeNxqQ4ED51cn2kKayVwBQfpj8s6SQX8
         Tqyly1GokKpK5cEiL5Lww/bZMK2Q0oKHyoJTZTiSIiaeDkTPyCir/WP9KdeoNmEpH+eq
         1k+9ssw/mW75bpQexkWLdWMeXMSqNARGG8GOAxpk4TYblkWGgWRpVPVuIZaekODWcm28
         wXTyW9aQJBdhs0EMhGsMWz756olt8UxvXrA2gUKMxcJeXM7EnQtfZKbo6tVOKN0ioVnf
         +3TWADqWtmMxhMl0bjwzLpW0c98ExIfqLRzvrHuLKhcCsg1kF/SgffFas3uTc3RAbUg1
         H55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0K/JRd95ut1+dPVeYrDT2lGvuKp57vnidpoEFF4wcU=;
        b=EStkhnjabI3VSUDhltFWA4LUXzIdviW7xNAkMDQ7SUkYBQf0EBCG4dAo/NwhZa1MoA
         Vx8LlENZTd67oFvtO4NER7pbWC9aHsPOlDh8Q+3NBvx/DBRPGYrVEzdIPGesSa682Cpx
         IujkfOLrQaJ+GOhA0f5kWJJMGake7jClhdqu+elBXq9qgvpbMv5Jhmyv9MIOwFHY8foH
         6ulWQGElWq8y19EMhckwCqKTsakn45ZVkk7fYaEN3sfX18y19z8xxbDuPhenJA9IDnM3
         4hkzdf2dj5GTFwGRDkjIsvBP0m8I7iHRaS+e84knBRvpxZDms1Y8bX6TIcF0XjyO3YRZ
         Nx4Q==
X-Gm-Message-State: ACrzQf2rO00YCQkv/sWLyvLa9lBDUdXJKKkGKouGOVX7RfF9yrOCtVTw
	Ba7JLY3Q9Gngf55OGoOUqCkVePF+30d+Pejb
X-Google-Smtp-Source: AMsMyM7mTiWfno5bLpnJkelPNrP/isN9jrJdbnPbwKEaKH9QqUCrnc0RO8pEac3D+VWoCvUeL/EjxQ==
X-Received: by 2002:a17:90b:30c1:b0:213:a155:949c with SMTP id hi1-20020a17090b30c100b00213a155949cmr35074782pjb.76.1667530927882;
        Thu, 03 Nov 2022 20:02:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.02.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:02:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 25/31] qemu-native: Add PACKAGECONFIG option for jack
Date: Thu,  3 Nov 2022 17:01:00 -1000
Message-Id: <105dc8fa3773f6efebb9e4f3cba37e49b58a0de6.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:02:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172686

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
index 14feb4f1e0..19431ee6dd 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -261,6 +261,7 @@ PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.25.1


