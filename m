Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E740BC433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 07:16:33 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.22367.1647414992983466294
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 00:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qnw3Yfut;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id p8so2776507pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 00:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GEuyQp5PlxGpASiF742UwzbodXwCxhPTyVXtjBAiEk8=;
        b=qnw3YfutVMAiubXkYL1GgEUpZAYjhLF0MSia9+o65LucjwWEpXHjM2TvW8i/wc/Znv
         LIlUypsyG3V0Fz/j8kB7BgNLQNhiKjYqpvVbtV0ljY0d8zZ3akBIck5DQKAiQZnMdQ1W
         YvESd+jeXdOTUVU4JxcLu4YSPPux8TVajeXoisIYzr2BMOQGnK9Cw1wjsqNL3agFLGRG
         H5Am7z2QHLmann2UnvaNz2Y91CH4QGyvrPuVSMEzjK2+x6lR9IEwrEPzdViPxwW1CYWp
         O3/k8MumduqflIb5705erTaIKPhI4q8nF7U9t87L1rVtnFtBZHw/dS+3m92kSr22tFcc
         2w7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GEuyQp5PlxGpASiF742UwzbodXwCxhPTyVXtjBAiEk8=;
        b=HvKSFRNajqWTrJ/R0Oz6zZnuFOzktGf8V7k5Zh2rl/jHz3e3LEh2VqJZNf51t5iN7e
         DOMN+m6v3vm86Jsg1a8xLiM/xminRUx7C5NDWnmaRCAvutQMzvHcTn1KmsS28+y/3ltS
         pv5DesiyyNAOBKKNaW5M57DFl0S/MzR8H9BeB7C53ONkWW4/qJJGaOTzJLARlM18k6bX
         16+/etiqN7hbUm2TpNgCvhGBHktNrH/osrpz9oPSiO256ohDkWs6sVBs25OCqj/f2bDK
         93kLjdFdIOZeGPeg+y0dn6YQovqU4eupd+gbJSKu8ppNduZlkHXQMqYfoXB7hEjx10xx
         oe8g==
X-Gm-Message-State: AOAM533q9X5foxpE0tPHCzwGtNZhx2GbRaILXlAJEyJlHdvBoqL3oqx8
	tieROttvd73WkzURZXFmn4IFpUCPj8TOdA==
X-Google-Smtp-Source: 
 ABdhPJwxDOB1u/041gbdhDohlEuPMMK+D1BEtKG4w7wRv+5wA47+xC0LQwt55I1mKP2H4oHFEwB9OA==
X-Received: by 2002:a62:18cc:0:b0:4f6:fdff:5440 with SMTP id
 195-20020a6218cc000000b004f6fdff5440mr32827693pfy.35.1647414991935;
        Wed, 16 Mar 2022 00:16:31 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm1567648pfh.46.2022.03.16.00.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 00:16:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] qemuppc64.conf: Disable huge vmalloc
Date: Wed, 16 Mar 2022 00:16:28 -0700
Message-Id: <20220316071629.3494348-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 07:16:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163321

This feature results in X11 crashes on Qemu since 5.13+ when it was added
disable it therefore for qemuppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/qemuppc64.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/qemuppc64.conf b/meta/conf/machine/qemuppc64.conf
index a35c40b5927..5f4f68b9816 100644
--- a/meta/conf/machine/qemuppc64.conf
+++ b/meta/conf/machine/qemuppc64.conf
@@ -13,7 +13,7 @@ SERIAL_CONSOLES ?= "115200;hvc0"
 QB_SYSTEM_NAME = "qemu-system-ppc64"
 QB_MACHINE = "-machine pseries"
 QB_CPU = "-cpu POWER9"
-QB_KERNEL_CMDLINE_APPEND = "console=hvc0"
+QB_KERNEL_CMDLINE_APPEND = "console=hvc0 nohugevmalloc"
 #QB_OPT_APPEND += "-device qemu-xhci -device usb-tablet -device usb-kbd"
 QB_OPT_APPEND = "-usb -device usb-tablet"
 
-- 
2.35.1


