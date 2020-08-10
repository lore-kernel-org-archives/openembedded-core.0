Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.37287.1597028383370475198
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 19:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=cpl+VL/m;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.66, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f66.google.com with SMTP id d4so4187290pjx.5
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 19:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xhXtwWFwWe0CZQ7QCIza5DrocoVoyAcMdA9Wuq8T8tc=;
        b=cpl+VL/mo9JGRUcSWlNrNRlx3Rqhz3nXieHiheFbcSyRctQ7yEyksbeufdrz9RCA7Z
         ydDURE+J5M8gHyOkbNxua9mSeVXaN3c4w/OF24qvl/95emViwiNGrvjfcEPsEKwaV/ov
         rMSzbbQ10ep8CbvQn8cjALST4JhQoftGpEhGBJy/6237kPoLkOrMfd/x+cjnM0q2aWoU
         CKeNvbfIXb8oIdrZks0cf7OE0B0ktaNj2SQ50hV+3ntjOVi63nsF2As5b5x/83farDSO
         c+jLKeY618TCi7+xRZqxiC/ZTUsIDdn2CiPPPmwewqoUgYvbHNeC/D5DvARzw8H+1SW4
         aZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xhXtwWFwWe0CZQ7QCIza5DrocoVoyAcMdA9Wuq8T8tc=;
        b=iuVFUh/UtkXVzMsSWnQyKy2qduf96OK0fHNmAlj0Mo4G4fl3VAyzsi9uZKRIMArCaG
         n6k1dxaVJ8rvlQl7rw7X+BRSHwSSauaFvQbl1bT/7a8zr/N9mLa6gjfwAAdcpESa0N3L
         2QND3nu1gqYKeIgrcaKy+09M7wPpwbDttF1ZbwP4gmBGVcP8vTWk6i470NSYoX1FYSBq
         DlEkgPyrAxPG5x1dAcLgjDtAwAzjoYBgreEgCO2QPvnY1xITma4FzgS56h/i5Tw2BRSw
         KQxOBRT72yszFO5L21788fwu05NBpHDac0xrXuidYJAld8UphstbKjzmMa8p/ZpmF86E
         poNg==
X-Gm-Message-State: AOAM533UyD4jTpDJL6bdppKW+hALPuJVfDNhjNxqd/SZ3Gmvvd9Y6QSO
	8hujW5d44EpB9CdOaOE1hkes3AT6D6vgwg==
X-Google-Smtp-Source: ABdhPJwK821MZ9M8BhhPUSlbojWllRkSxxlOLb3bx40bciIetOT0Q2PxRDGXb9afa5zYO030nSv3HA==
X-Received: by 2002:a17:902:9883:: with SMTP id s3mr21472738plp.271.1597028382237;
        Sun, 09 Aug 2020 19:59:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.19.59.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 19:59:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/19] qemumips: Use 34Kf CPU emulation
Date: Sun,  9 Aug 2020 16:59:07 -1000
Message-Id: <6f24a70ed9323a89cb9d0e6c56bacb6a59e2c31f.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

Few years ago we switched to using mips32r2 tunings for qemumips however
the default CPU emulation still remained 24Kf which is not optimal for
mips32r2 ISA for qemu [1], therefore switch to recommended 32Kf for CPU
emulation when running qemu in system mode

Boot time to console is ~1s faster with this setting, hopefully this
should speed up qemumips in general

[1] https://www.qemu.org/docs/master/system/target-mips.html#preferred-cpu-models-for-mips-hosts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e68d2afd4a5529437824b5d6b9a2077c2fefd337)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/machine/qemumips.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index 31ad754483..4617c3c7b6 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -12,3 +12,5 @@ KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
 
 QB_SYSTEM_NAME = "qemu-system-mips"
+
+QB_CPU = "-cpu 34Kf"
-- 
2.17.1

