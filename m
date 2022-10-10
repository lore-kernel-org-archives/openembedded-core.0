Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3746C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 21:42:35 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web08.331.1665438146306781969
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 14:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fw0ogLL+;
 spf=pass (domain: mvista.com, ip: 209.85.215.182,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id s206so11280756pgs.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Oct 2022 14:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VXR5iquvwu575smf0Ew+KAaMyiGWNfGPMRMbyBnA3hU=;
        b=fw0ogLL+/jIg+uMjDyj9y56ye5dWSrLgkjXdt9LAb71a+S9OPUBYZTvTywEf59ANaL
         BO3TmCHxgw2CCjbJ6jD1YdkHfM+jbb7GQzGWPN8+vzfROUaDixosp4mxeaOHAAGjK+wA
         1JQlyk8lcWm/uQqJQJlUPdKvdBhnMcLDbmfPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VXR5iquvwu575smf0Ew+KAaMyiGWNfGPMRMbyBnA3hU=;
        b=db/374H9ddjjZu4Ml28k/BWjBmgp7NsXbp8YbVlSFNxgEPkb/UQdAIPxnm7MyWLtWM
         qluIgrijVgDWT1nHdTQykurSNo45Ypp2od5qFgMIf16wKgVBMKInKF7RoSnK1lcnqgvH
         SU/EytBEN1aU8ZWl5AmZl2BvXS9bphY6dcpQmF3WhQrLdcJ6yK+kSKR5vtkTGlB/RUNv
         iiHbU+BD2M8XS7vA9faz2SFqe/oP8rXW0fWuSyMO/alT225O/tathmPS79WHqGAGIp4Q
         uGJjr8hBrkG3FS/bXC05Oi5Rex2/Nb4BNyv8jLMnaAclbZjnoyj6hWTD09C3niuM7anA
         qDNA==
X-Gm-Message-State: ACrzQf1VHeVXrMjuKCb3c1Pf3gTEmsDW9Vp9n5W6cUaKzDSWxUVYZt/C
	Vnx/XMbViccGE/XXoZFVVT4A/EMxX22wHA==
X-Google-Smtp-Source: 
 AMsMyM42ad0VI7QMbFYoijMgdh6AA8vcRoBOGPnrbuOUcj9DuvEts2VzjGBh/YsaJKvvNL+u4jtL9A==
X-Received: by 2002:a05:6a00:1ac8:b0:563:7d18:7a15 with SMTP id
 f8-20020a056a001ac800b005637d187a15mr4763308pfv.59.1665438142185;
        Mon, 10 Oct 2022 14:42:22 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a170902cec500b001789ee5c821sm6776787plg.61.2022.10.10.14.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 14:42:15 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Mon, 10 Oct 2022 14:42:13 -0700
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Subject: [master|langdale|kirkstone][PATCH V3] qemu-native: Add PACKAGECONFIG
 option for jack
Date: Mon, 10 Oct 2022 14:42:11 -0700
Message-Id: <20221010214211.404291-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Oct 2022 21:42:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171586

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
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 612abd240a..711982ba8d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -198,6 +198,7 @@ PACKAGECONFIG[rdma] = "--enable-rdma,--disable-rdma"
 PACKAGECONFIG[vde] = "--enable-vde,--disable-vde"
 PACKAGECONFIG[slirp] = "--enable-slirp=internal,--disable-slirp"
 PACKAGECONFIG[brlapi] = "--enable-brlapi,--disable-brlapi"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.35.4


