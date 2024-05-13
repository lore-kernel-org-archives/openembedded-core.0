Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518F0C25B10
	for <webhook@archiver.kernel.org>; Mon, 13 May 2024 12:18:29 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.58752.1715602700532728208
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 May 2024 05:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cQYMUjRO;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ed96772f92so34667835ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 05:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715602700; x=1716207500; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GJsDKjo/1yxtSTYL9koEbC4h+xVUEEj3kUncyP2cMc=;
        b=cQYMUjRO+EMPGxUtSIhaZKMaj8/LQdwnbIDkIHhuHAX6KgiwIWPEDIWheLCl4ABSDh
         KTtnbWlQ13Q8fzkMW+A64DoTareal+QeAcSa4E6s0hTI8R9g8UuaV5Zf5uT4xbQ5bT0l
         u0BiSsIxMtTXbQZQUBnjU3tAxsbSlUTnq95LPvSg9zZeOHyFSav39dYS4l+zEKMhymNJ
         6uocFsEBwNIhi4zBuJ+Hw5NEKBBOQ/46AD5DJhYTNNo3YEWXMo2OgSMO2tJbZgEsCk/p
         Iyu9yday8F88RWbzv3+L9Pfg5ORgimgIWEVkzUWbXarnsr7D0F71BTjNYZyO8aPXaz1M
         nrUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715602700; x=1716207500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GJsDKjo/1yxtSTYL9koEbC4h+xVUEEj3kUncyP2cMc=;
        b=O+MD4VgezoplaW5KrE6X0YgTC6oJVJSXr11myqflJpHavfLMAhJcVz7nxLjHO4g1qF
         9kFvbgS1rFI7mmQOkldrjVnog8cR+l5Fr5QSha6kXPX/aG1B+19AURzxG9V6LWFUuShM
         sBzAYCaRCYah6nFjJpO0XjxdOMTFSjEP+ZdsYx0Y1mOwbpLYQxlJtOrRO0UxwH7SLwov
         jDKhO8YGPnRlYRHoI/bC4xAWZ3q5XaF6kO+0LacNWzfmnbfKGbvjF4gkIL2uhHOZ/QiD
         Hi4F8dllhxyRCc5K06FWdM0DO9SxByUzwYCj7hdhq/u9FVlbia0F9UM+sRTDM/SkRW8B
         RtIg==
X-Gm-Message-State: AOJu0YwHff3A01bDgc9Eo74iaCIi3GiCf/5wMfjtjw3gSHLXlpIEC09Z
	x0aPnH0OG0LakSwDC1a6TUfsPXx/i13tON9F2TQEQYdjjVXzZVYxSSh6CuKY1VibcrJ8vZJ+kqK
	6HoM=
X-Google-Smtp-Source: AGHT+IGWnhdOEVWF407/Zz2VIU1o2/SURNdkBxPpC7+g1MhbErD8j6++p1IPUmv9KCIq5nsG7/qXhg==
X-Received: by 2002:a17:902:db09:b0:1e4:2451:c2b5 with SMTP id d9443c01a7336-1ef43c0f6d1mr123374605ad.13.1715602699511;
        Mon, 13 May 2024 05:18:19 -0700 (PDT)
Received: from xps13.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bf30b85sm77599225ad.181.2024.05.13.05.18.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 05:18:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/6] xserver-xorg: fix CVE-2024-31082
Date: Mon, 13 May 2024 05:18:07 -0700
Message-Id: <32fc43f0c3c5481b2c38c2136706758dba054b6e.1715602539.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715602539.git.steve@sakoman.com>
References: <cover.1715602539.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 May 2024 12:18:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199233

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xserver-xorg/CVE-2024-31082.patch         | 52 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_21.1.8.bb       |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch
new file mode 100644
index 0000000000..81d76977bb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2024-31082.patch
@@ -0,0 +1,52 @@
+From 6c684d035c06fd41c727f0ef0744517580864cef Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Fri, 22 Mar 2024 19:07:34 -0700
+Subject: [PATCH] Xquartz: ProcAppleDRICreatePixmap needs to use unswapped
+ length to send reply
+
+CVE-2024-31082
+
+Fixes: 14205ade0 ("XQuartz: appledri: Fix byte swapping in replies")
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1463>
+
+CVE: CVE-2024-31082
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/6c684d035c06fd4]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ hw/xquartz/xpr/appledri.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/hw/xquartz/xpr/appledri.c b/hw/xquartz/xpr/appledri.c
+index 7757465..40422b6 100644
+--- a/hw/xquartz/xpr/appledri.c
++++ b/hw/xquartz/xpr/appledri.c
+@@ -272,6 +272,7 @@ ProcAppleDRICreatePixmap(ClientPtr client)
+     xAppleDRICreatePixmapReply rep;
+     int width, height, pitch, bpp;
+     void *ptr;
++    CARD32 stringLength;
+
+     REQUEST_SIZE_MATCH(xAppleDRICreatePixmapReq);
+
+@@ -307,6 +308,7 @@ ProcAppleDRICreatePixmap(ClientPtr client)
+     if (sizeof(rep) != sz_xAppleDRICreatePixmapReply)
+         ErrorF("error sizeof(rep) is %zu\n", sizeof(rep));
+
++    stringLength = rep.stringLength;  /* save unswapped value */
+     if (client->swapped) {
+         swaps(&rep.sequenceNumber);
+         swapl(&rep.length);
+@@ -319,7 +321,7 @@ ProcAppleDRICreatePixmap(ClientPtr client)
+     }
+
+     WriteToClient(client, sizeof(rep), &rep);
+-    WriteToClient(client, rep.stringLength, path);
++    WriteToClient(client, stringLength, path);
+
+     return Success;
+ }
+--
+2.40.0
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
index b9eed92103..0a8cb7d81a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_21.1.8.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.pat
            file://CVE-2024-0409.patch \
            file://CVE-2024-31080.patch \
            file://CVE-2024-31081.patch \
+           file://CVE-2024-31082.patch \
            "
 SRC_URI[sha256sum] = "38aadb735650c8024ee25211c190bf8aad844c5f59632761ab1ef4c4d5aeb152"
 
-- 
2.34.1


