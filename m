Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6E6CCA473
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:36:35 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.64577.1656876987597484452
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DITqoqxn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 h9-20020a17090a648900b001ecb8596e43so7560985pjj.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o34fG+NPXN0+GfpLzPo8UT3ICYNE5RuzcOPc4z9NdGs=;
        b=DITqoqxn9e74uCi7HIE2aHnls1zCIxR0/j6C0ancdDTeZFiB0duNgzLB2o+ODt64Vs
         OLehsqAQxoKSR7eiew7mIBAhg0Xgo/ka5K5wSz5On/Pq39g6LNpbNneoQM87tVimyZ0v
         IQBUS/B5R4V2hq8/k2in3nJB1rHeyLBxBA2ytFsnfsD9Crownrm0SRQwDlp3kpso14fu
         NFfpuxwWhgP9blda9MQzi6jgVzp1WH3f14iX/ninWvIaRtq0m0De0xeB09S3fz3Udujd
         bMBi4NhuoS6wF/5sbMb9LTe8+k53e5jxl51LTYGPRpHKnGfZ4KOC1iXgBOUHqMtfzzKA
         mtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o34fG+NPXN0+GfpLzPo8UT3ICYNE5RuzcOPc4z9NdGs=;
        b=EintaE5VEdV5dicSd3RVC5Snlr8+VpIpOR7Hew7VFmSHrnY9WMR+BpCgdNwmk3Xu5S
         484Nx+B3TS1KcZSZUlxomqjJRJMjDGOTW8wZMnHvGuHdntjrZDdZFEnDJs+x0/8iiBmn
         TRq+RH8A2H4R/ZgWjrvPe4d4snul/PQtJ0woIHY030oF8qIhrzCkKEL+jS9Lzf5u0JVT
         NZ2o6D7zFjlh9gXXdSbOam9gyjRPiC06PEuVxXlZyrKOhi9b93SZdqckTPj5bDZGnsHY
         WI4cootnwvfQlRV1d4jXxDCkoF7rtGgHVq1ovB9bl0FVRPtB7qDhU5sOZQTBDg9QWl0N
         WEcA==
X-Gm-Message-State: AJIora/aMMJFMimMPpcIgeRICuEMAeCT1AAxzlV1bXGSaMYEUQhOnNyn
	XEG8OHC+88TIM/2/7YLd16JMUD98y/laMpae
X-Google-Smtp-Source: 
 AGRyM1tz6QHQYs+DH3vtPxJQbpBNWZ4rWj2RGymDtVK31UOYx41xX7mm5Bmc5HzJ58XJ4JjiY83A5A==
X-Received: by 2002:a17:902:76c4:b0:16a:deb:c0ae with SMTP id
 j4-20020a17090276c400b0016a0debc0aemr33058309plt.22.1656876986588;
        Sun, 03 Jul 2022 12:36:26 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/30] ghostscript: fix CVE-2022-2085
Date: Sun,  3 Jul 2022 09:35:37 -1000
Message-Id: 
 <645a619524d04aa6a2029a2810e2d84dc751fc48.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167562

From: Lee Chee Yang <lcyang92@gmail.com>

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2022-2085.patch           | 44 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch
new file mode 100644
index 0000000000..58cb93727a
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2022-2085.patch
@@ -0,0 +1,44 @@
+From ae1061d948d88667bdf51d47d918c4684d0f67df Mon Sep 17 00:00:00 2001
+From: Robin Watts <Robin.Watts@artifex.com>
+Date: Wed, 16 Feb 2022 15:22:50 +0000
+Subject: [PATCH] Bug 704945: Add init_device_procs entry for mem_x_device.
+
+When allocating a buffer device, we rely on an init_device_procs
+being defined for the device we are using as a prototype. Which
+device we use as a prototype depends upon the number of bits per
+pixel we are using. For bpp > 64, we use mem_x_device, which does
+not currently have an init_device_procs defined.
+
+This is a fairly hard case to tickle, as very few devices use
+more than 64 bits per pixel. The DeviceN device is one of the
+few that does, and then the problem only kicks in if the
+MaxBitmap figure is high enough (or conversely the resolution is
+low enough).
+
+
+http://git.ghostscript.com/?p=ghostpdl.git;a=patch;h=ae1061d948d88667bdf51d47d918c4684d0f67df
+Upstream-Status: Backport
+CVE: CVE-2022-2085
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ base/gdevmx.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/base/gdevmx.c b/base/gdevmx.c
+index 08b0cbcfe..89e9ff774 100644
+--- a/base/gdevmx.c
++++ b/base/gdevmx.c
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2021 Artifex Software, Inc.
++/* Copyright (C) 2001-2022 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -25,4 +25,4 @@
+ 
+ /* The device descriptor. */
+ const gx_device_memory mem_x_device =
+-    mem_device("imagex", 256, 0, NULL);
++    mem_device("imagex", 256, 0, mem_initialize_device_procs);
+-- 
+2.25.1
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index c28e62f089..365420fb64 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -33,6 +33,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
+                file://CVE-2022-2085.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.25.1


