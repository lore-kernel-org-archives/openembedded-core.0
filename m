Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26192C433FE
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 16:25:10 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.5665.1653668706868025567
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=akrbT4V0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id k5so228792wrd.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYE91f0kywlXhZUaYt5JsVTsQwCXDduSzAM7CoVEQSE=;
        b=akrbT4V00+Xzg9GSZwkoFMWzDsYPZqRv2vVlvI8gHAkFxsAcVzeqNXtp/K5iMB6pz9
         CvzTJ6RxPUUto863mwaOQkRd6cectiyCMqnLJhTeStYBJODh0BKKYdgqCtLgKjn8R/io
         TYLVkDDl4KaYWXakYBv9Yc6xJFUQJof34oHgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LYE91f0kywlXhZUaYt5JsVTsQwCXDduSzAM7CoVEQSE=;
        b=1fJGwov2jfZ8VNz0hSbw4pEdg4KrX4DQ7hKOOYmUbo4R/Bn6k0sYZFBKJJNrJap6v7
         565+ZVc/97Z3JyhIoKSSAJuixNEOtBZ7Am30/wucvPFUFG53+s/aH5UGiRVJQ64i5SFS
         xBf3EE48fSeNTWWssw8a6vtZW92JX3gJFPTCIGAOoSoPdM3DyOX/DAyjn3lY7PESWmIu
         YDnep6t/0o9rga3M5uxyeP4KH0h84iEKIkbDRkoAtwiXiugfRmFyI77AIqEpTc0+u2EQ
         toHAqo+5T2BKaKtUEAi4tFaUiIrD9jorTj+lQB3wOTRkQ/YTl91jK2MZRtf50Z4Xg7CH
         2fyA==
X-Gm-Message-State: AOAM5308ikcrfuEBPXJS5vYb1OTkWorFEUX1m7yz02aOSrIGZEwEg0EA
	8JRAB8TTYyMt/cIAQVqbCcQp7Apu94rL9/Lk
X-Google-Smtp-Source: 
 ABdhPJx26ik3ZGFZ3Lvpc2rFPuKqc6fRErUXH9yEt9XHf/Ov2RZAPWhkaK7C4VJYlgEWJKTH1M5xfQ==
X-Received: by 2002:a5d:4e08:0:b0:210:297:7d4b with SMTP id
 p8-20020a5d4e08000000b0021002977d4bmr10294587wrt.112.1653668704887;
        Fri, 27 May 2022 09:25:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6a82:36c1:b105:e682])
        by smtp.gmail.com with ESMTPSA id
 y12-20020adff6cc000000b0020e6470b2a7sm2049715wrp.85.2022.05.27.09.25.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 09:25:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] Revert "qemu.inc: Remove empty egg-info directories
 before running meson"
Date: Fri, 27 May 2022 17:25:02 +0100
Message-Id: <20220527162503.463372-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 16:25:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166213

This reverts commit 9d05227e910d3f374ba7a9763ff2584b9e40db61.

This is no longer needed with a patch to importlib in python.
---
 meta/recipes-devtools/qemu/qemu.inc | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5f303992bed..e4ced6ac27e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 RDEPENDS:${PN}-ptest = "bash"
 
 require qemu-targets.inc
-inherit pkgconfig ptest python3-dir
+inherit pkgconfig ptest
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
@@ -111,11 +111,7 @@ do_configure:prepend:class-native() {
 }
 
 do_configure() {
-	# This is taken from meson.bbclass to avoid errors when updating to a
-	# new version of meson.
-	rmdir ${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/site-packages/*.egg-info 2>/dev/null || :
-
-	${S}/configure ${EXTRA_OECONF}
+    ${S}/configure ${EXTRA_OECONF}
 }
 do_configure[cleandirs] += "${B}"
 
-- 
2.34.1


