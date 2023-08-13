Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14484C001E0
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:19 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.93776.1691961553192421325
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RdNzqQh5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-268bc714ce0so3278846a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961552; x=1692566352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SViTr2GEW6vIkK5R2YvMUBOkbRPreyAxVr1BdIBCh5c=;
        b=RdNzqQh5/n5/nmMvWWDEybTrO9jjXnPxZP8jCHyr/T/L5xRbwr5EkSYMw7JxS5YSR9
         enJUGNksZJYgCDxhOtpuC/DyETbmTxLzJ8iFbR1m+N55PL1LfhEiEpwY3/0zNe3/GDOi
         Q1cf5yQng6ci+E4s6+jFLPafl9LsBBaGHKWLc3TarJVq8JSfjCJz6hdeopqNKnNmbHON
         RuRoyUu3GimQCH2jeYep5PoUgHbrqD3ql3ZtifbNjotfSa85uukNJaUkRQM9dnr9IDV1
         k+T8kEjnaKhYuxKkAa2ydipklXcx0ZI3GN8x1DTsVy4/PFMVNgvCCtUiv6KjVcyYHUmh
         8pLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961552; x=1692566352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SViTr2GEW6vIkK5R2YvMUBOkbRPreyAxVr1BdIBCh5c=;
        b=dLTa6yby3mvjUscXcQZYhpNEi9wGyQtaQ8eLGREnKH9q+fT0aS6PDhpYQU3EsrhJYQ
         ftA0ZAGxPklZYL9Zk9/8PSD86mZ91VxS0i5dZAUSPwVt7COMtFufRLsKjSDooSxIdpbS
         eTMdLWXjXWPdI77ib1LVFT9dRQ+lSPtx2TaXatUpb6+ZrTlHhg+XYEylL5ANBCOZQM9G
         xNuIc3IlLqX1nK8NBE+yGKaduPtyW7ZHGWhFBL9W9XuJlHFUA4mbXprfYZnM921W3oBA
         2dlVUbJxPM67UeMYFO4bWqhSrIevGmZeWBMDDQVpnyJWTiLdoL6dVmqmNWST62vqM+w5
         NVXQ==
X-Gm-Message-State: AOJu0YxZFInmC8xIosF1dMq7mmCQ3wvdYIrco33zX2xq1fXgkQvcoZtE
	VTBNMetYhD9DolsJhZctOQeXhz0XmdcypCFp4td1cg==
X-Google-Smtp-Source: AGHT+IFNkXRaBjTst2QOvsFqXjG3CzRHBsZdAHAtYe/OoaeoOY/ksI2D60eeIQ9zkOgjoukdkKQvvg==
X-Received: by 2002:a17:90a:5a85:b0:268:808:8e82 with SMTP id n5-20020a17090a5a8500b0026808088e82mr9733552pji.1.1691961552246;
        Sun, 13 Aug 2023 14:19:12 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/22] ghostscript: backport fix for CVE-2023-38559
Date: Sun, 13 Aug 2023 11:18:18 -1000
Message-Id: <f70113d1d5b5359c8b668ba43aac362457927d9e.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185903

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1fb9991bb95f1201abb5dea55f57f

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...pcx-buffer-overrun-fix-from-devices-.patch | 31 +++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
new file mode 100644
index 0000000000..91b9f6df50
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch
@@ -0,0 +1,31 @@
+From d81b82c70bc1fb9991bb95f1201abb5dea55f57f Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 17 Jul 2023 14:06:37 +0100
+Subject: [PATCH] Bug 706897: Copy pcx buffer overrun fix from
+ devices/gdevpcx.c
+
+Bounds check the buffer, before dereferencing the pointer.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commitdiff;h=d81b82c70bc1fb9991bb95f1201abb5dea55f57f]
+CVE: CVE-2023-38559
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gdevdevn.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/base/gdevdevn.c b/base/gdevdevn.c
+index 3b019d6..2888776 100644
+--- a/base/gdevdevn.c
++++ b/base/gdevdevn.c
+@@ -1980,7 +1980,7 @@ devn_pcx_write_rle(const byte * from, const byte * end, int step, gp_file * file
+         byte data = *from;
+ 
+         from += step;
+-        if (data != *from || from == end) {
++        if (from >= end || data != *from) {
+             if (data >= 0xc0)
+                 gp_fputc(0xc1, file);
+         } else {
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 57f0b51ad3..37e9ed8e84 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -40,6 +40,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2021-3781_2.patch \
                 file://CVE-2021-3781_3.patch \
                 file://CVE-2023-28879.patch \
+                file://0001-Bug-706897-Copy-pcx-buffer-overrun-fix-from-devices-.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


