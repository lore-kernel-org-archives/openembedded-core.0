Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E77CCA488
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:19 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.4019.1657773369391101534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Gd6OkoYC;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id l124so805339pfl.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aTqyKQQ/GCveklXjGkpvJPcpBetXztIr+nGVpq+AqVM=;
        b=Gd6OkoYCU5zoKLNPbizcZex21iqXzLlaGjlayaX1M8lkPy2LSVxj6yrYGyDl2+R+U8
         cxTodrzdLUftWnpXO+Ujoit0/JogU1BYmrSar+a+J4GIlzI5uUkLIuxoY6Pc5W9BfVzk
         3iW7p9PySw7GHhBHKiOGPzWBypJLyMOBZOG9KZqU3Gsz8PRVlBxEacehTqaded91ApKS
         QW2vaavR43MTzTu0XD9az8wvHRVdys9dBCUdYIdAJ77ZBymzyeyk5I4z8sIY0GQPojSC
         unQlKzrt9B2gH1K9SgghYw9SFJz/y4cn3OcL00DMIDcgfQ9InIwTlr9V6IV4TtPcsUhH
         Dy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTqyKQQ/GCveklXjGkpvJPcpBetXztIr+nGVpq+AqVM=;
        b=gUHnxoW6EDKzdhAq5U8Zg0mctbSnAdwK/K+ox0VB0XKO2dtnjkVc5tUjd/RA60QBmA
         NEh14L9fMXvpZXlOEqtkpusIKSLnFJrasCOLL3wyC6qtxmrEMZPDmOSB9YMxT2sxMbra
         KfI88ypcIdu92bo0ELAtgwcgZo90gh3C/JpCxBjQ32tpE/NkJ4rOa37RVevhgu1BDvRk
         omV32VhKYOcdCfHfDinlK3WgtHqO37ILhgkTjENKgZhGrEcgvBQkoyq5XrDVjgSmM4xi
         TUEAG4b6atpVkvqRJG176Fs1C1R4HLFri7dV0t7w329GhjKE1KFZPwu8w4mRevUYqrmG
         ua6w==
X-Gm-Message-State: AJIora/Zp8gjKmiQ/TnPCjuNtJkfE/+pvElXCkAlIYhoaop8QK3gMndr
	QJXbk2OV8M6/ozpMbD5I9uzRtP9ESSLrtdR+
X-Google-Smtp-Source: 
 AGRyM1vOQ6ZyYRlsNpLTj+C4H274pTmiTrH/RoHo76hOLCQYIvAN2ptb1TsE4fTVHbE01l4IQ8SqZw==
X-Received: by 2002:a63:d94a:0:b0:412:6986:326e with SMTP id
 e10-20020a63d94a000000b004126986326emr6144989pgj.56.1657773368364;
        Wed, 13 Jul 2022 21:36:08 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/27] qemu: add PACKAGECONFIG for capstone
Date: Wed, 13 Jul 2022 18:35:22 -1000
Message-Id: 
 <171fa2d7092db896ba0816074a435a883447fdb8.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167999

Autobuilder workers were non-deterministically enabling capstone
depending on whether the worker had libcapstone installed.

Add PACKAGECONFIG for capstone with default off, since qemu does not
require capstone support.

Qemu version in dunfell has capstone in the source tree as a submodule
and has configure options to enable it using that source code or using
the system libcapstone.

Qemu versions in master and kirkstone have removed the capstone
submodule and configure options, but added libcapstone autodetection to
meson.

In all cases using PACKAGECONFIG will allow a deterministic build.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 052ef1f14d1e6a5ee34f742f65e51b20b416f79f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index cc69eca9ae..edfd5bf86c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -199,6 +199,7 @@ PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
 PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
+PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
 
 INSANE_SKIP:${PN} = "arch"
 
-- 
2.25.1


