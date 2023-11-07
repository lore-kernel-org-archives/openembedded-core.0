Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A8EC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 05:42:30 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4275.1699335746764971281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 21:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=LB01ALfp;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: hprajapati@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6c115026985so5437713b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 21:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1699335746; x=1699940546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Vs9e0AQ+/7pxUuwDTvWxBaFcmhluVmmaFXtzzDEs/Y=;
        b=LB01ALfpicErcNN9QN386ywjochf1IT2y3MTQevdMOfGkteT83/tV8GUFDLlrQkKqL
         yNJ1APF5QBiYAwNZM0VnZ5n1heYG1VF1QoOSGEPALyQy90nCrJqkaa/yBl+16+Vo2AWr
         I77rTCpFuI8CmkpVgnImsUJL1B3qnPLC7/NIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699335746; x=1699940546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Vs9e0AQ+/7pxUuwDTvWxBaFcmhluVmmaFXtzzDEs/Y=;
        b=eUxAoYuu0GpNoKQOSeOiatYUtgTLQ5AzV/aBu0S5R3QB20b7LrTZfF7E/iZBpMOAu/
         Nt57PYaBr3PgYVfkKX4Yiqk3qmMza1wK8HsX/ZiuUs6Khv2ZictpZ/Y4A1u8M3TdU0jH
         dJ+eDoW747fPdkA/NlpoI/RDOWNHGvLGz5ux+wyuoyxxH7uPrkPO2QwbzmhpLabajqQ4
         Txq/wurpka+t1Y6ZladfeXU+bE5eVkGeVhM4x3cb2+UZCF6jWpgyuXTzIefXjH0ki4Ab
         ML1UL7QjVYUc4chIPAnJCymOjRXakScvBVVZ33ZuNuwlc5SmaK6nqgpqV5oGFT8+5i6n
         OSlw==
X-Gm-Message-State: AOJu0YwoocUH4E5lfcatMVYJFabkhN7Nt1G3tALwTD6ZbfI3jYDo5nAZ
	Jea1VJecDy8gbV0xq6y+VqcqHuKo2iG0lxJOn09eIA==
X-Google-Smtp-Source: AGHT+IE2f61RDphLbdO21bARhW08G5eyVJmKaUGUd5/5vlr4fF6RT4HqxHJbIV7p0OHIBL8U7s4d8w==
X-Received: by 2002:a05:6a20:8f07:b0:181:6f00:2f73 with SMTP id b7-20020a056a208f0700b001816f002f73mr20384622pzk.3.1699335745853;
        Mon, 06 Nov 2023 21:42:25 -0800 (PST)
Received: from MVIN00016.mvista.com ([27.121.101.117])
        by smtp.gmail.com with ESMTPSA id qc7-20020a17090b288700b00268b9862343sm2690947pjb.24.2023.11.06.21.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 21:42:25 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] tiff: Security fix for CVE-2023-40745
Date: Tue,  7 Nov 2023 11:12:20 +0530
Message-Id: <20231107054220.20853-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 05:42:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190252

Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libtiff/files/CVE-2023-40745.patch        | 34 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
new file mode 100644
index 0000000000..6eb286039f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-40745.patch
@@ -0,0 +1,34 @@
+From 4fc16f649fa2875d5c388cf2edc295510a247ee5 Mon Sep 17 00:00:00 2001
+From: Arie Haenel <arie.haenel@jct.ac.il>
+Date: Wed, 19 Jul 2023 19:34:25 +0000
+Subject: [PATCH] tiffcp: fix memory corruption (overflow) on hostile images
+ (fixes #591)
+
+Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/commit/4fc16f649fa2875d5c388cf2edc295510a247ee5]
+CVE: CVE-2023-40745
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcp.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tools/tiffcp.c b/tools/tiffcp.c
+index 83b3910..007bd05 100644
+--- a/tools/tiffcp.c
++++ b/tools/tiffcp.c
+@@ -1437,6 +1437,13 @@ DECLAREreadFunc(readSeparateTilesIntoBuffer)
+ 		TIFFError(TIFFFileName(in), "Error, cannot handle that much samples per tile row (Tile Width * Samples/Pixel)");
+ 		return 0;
+ 	}
++
++	if ( (imagew - tilew * spp) > INT_MAX ){
++        TIFFError(TIFFFileName(in),
++                  "Error, image raster scan line size is too large");
++        return 0;
++	}
++
+ 	iskew = imagew - tilew*spp;
+ 	tilebuf = _TIFFmalloc(tilesize);
+ 	if (tilebuf == 0)
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index d27381b4cd..31e7db19aa 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-3316.patch \
            file://CVE-2023-3576.patch \
            file://CVE-2023-3618.patch \
+           file://CVE-2023-40745.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


