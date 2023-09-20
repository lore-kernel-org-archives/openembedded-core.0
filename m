Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C177CCE79AC
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 04:05:09 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.29649.1695182704218607177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 21:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g02MP2CA;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-57790939a2bso4428419a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695182703; x=1695787503; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MgiImB3dMhmQmT5xYBJIecwLvLdFKhCIyG7iI/XNvZs=;
        b=g02MP2CAz3Q7pWAuUGQiINFQ469jBqWY57aSoIvvArSPwdI7S50SkDzzdhpjcE7B9A
         q+oTF1T8QwCl5gzuSjWUr588++6rXyUH8kAD5S8j7u/gQchCwTpTZz6et1yoCGx5sosX
         IEn2S8P20MJzJ/66dHNUmgU6Bv441bovJs4wVFU3vRWpmBhQUY+1tWihWIz2ZvAoEOcs
         c8V7pKfCf/lmr/dkjDRB/0OivCcTRy3ApZTmA0EjlNqrR9zzwpI8rGCu/LPiK5J8usIs
         6gGhM9Kx4hJ6PJV4sBamemUcpMcIf87FJgKdBwNEKX/tP3scW8vXgctQMfui8dFX8PaD
         A2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695182703; x=1695787503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgiImB3dMhmQmT5xYBJIecwLvLdFKhCIyG7iI/XNvZs=;
        b=UR4FoUiqgreFi1cpx+jvIOjeSuItrAB0wSxoUayRPJi5lyv58DqbGMR8pdhwVdiq1E
         VuQO8ZUMc2mJzvPGuYvKTGB5WLuVYqSRfBJrCf65SJ1CLsNYeqJd7wS8KNQ77rJlE2W3
         DEDcEN6wIjZJCGSYDOigetocwR4761/qsKLl1IxiYdkRb2xkWchKqJEBvJQRWN0LULzi
         Nbxw9Rwj2BbRUnY/bQLKK5kddw/ZXAR89zaEdgMRE6bLicBWx9ZCGh+4/2/OVn0iydhC
         pEVhPnN1Bom1nlxiSb/ps5zPFy/cLRS0g7wV6xPKHgkeOtyB5IQKjerimerput2F9n3N
         vLQA==
X-Gm-Message-State: AOJu0Yx0oen5t+h0EAvxPnPQmSxa4q/FWXHhGuK0B66aEdruXOIp8K8L
	H8adEV4q/GIrImUzuYOigFtOLE0PCOU=
X-Google-Smtp-Source: AGHT+IHCDWowdh1eysWjPdbmJdY1wRgP04nLiYBObgSMz1wTTYPb4rngJbvaPCrTPQ486sWocmhHPg==
X-Received: by 2002:a05:6a21:7794:b0:14c:d105:2a59 with SMTP id bd20-20020a056a21779400b0014cd1052a59mr1251055pzc.55.1695182703218;
        Tue, 19 Sep 2023 21:05:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id jg13-20020a17090326cd00b001c0aa301703sm10737661plb.63.2023.09.19.21.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 21:05:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Add PACKAGECONFIG for dax
Date: Tue, 19 Sep 2023 21:04:59 -0700
Message-ID: <20230920040459.249862-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 04:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187885

Othereise it pokes at the build system and if ndctl is installed on the
system it adds dependency on libdaxctl which can make it not work on
other hosts where this is not available and qemu fails to run

Fixes

<recipe-sysroot-native>/usr/bin/qemu-system-x86_64: error while loading shared libraries: libdaxctl.so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 15b963d4488..9664b747b3c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -195,6 +195,7 @@ PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
 PACKAGECONFIG[alsa] = "--audio-drv-list=default,,alsa-lib"
 PACKAGECONFIG[epoxy] = "--enable-opengl,--disable-opengl,libepoxy"
 PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
+PACKAGECONFIG[dax] = "--enable-libdaxctl,--disable-libdaxctl,ndctl"
 PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
-- 
2.42.0


