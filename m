Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F56C4706E
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 02:09:26 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web11.42656.1703124559881601662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 18:09:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Lijj4Y7E;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.45, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-593f6fb21a5so252706eaf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703124558; x=1703729358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVuw8VQq0P5bZML9ugEKpImWXNOHOr/8gAT0churCL0=;
        b=Lijj4Y7EpdAnaY24jbzS9XHFO47NJdLhWxsOljwYQ/BXMxgV0jToopuv/Vr6++lfJ5
         9efr98BAHOqRpIZYA7Pp6/l1rpP5KVMBLZO+NLxIaq8umW+dliFmNivScw8weq7lN6G2
         znlOmV65Y07E+6BSlBGJ7gEi399hyYiZuxIPuuZqHkYmzx9W09EYCuUOjQzqr2gBxYM5
         rT6sUbneK0Pzv2Z1XBOouxVYF2cC2z8KaW9A5cwvgFg3T32leB5NyHrqxwsyGb5+mdmw
         l9I+u/gyOWxQMi9Jdj9gmwf9ORqOs9x+ECmyQkp5PPhh97nZLlNHE411HmTP/8u/Ve6s
         WhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703124558; x=1703729358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVuw8VQq0P5bZML9ugEKpImWXNOHOr/8gAT0churCL0=;
        b=QiNsmBj1s/a3YIEsIJvxP92R2eE//3p/gyjbCWUiDP9H0uMHI0u6WB8WLpFhauICNf
         QtxX0iKeRDN/14YC4C6kjhpkXmLtBU0KL5Z7OmkBD9uZOHnx7TmhIMCB3gl3REtV/GdV
         8sDEDTpYrHN/FPo0YZQVnWy+c0rSxMWm699/mHIjtefZ/wrPdqDwJGyi80AbIELDNX5K
         aRtHNJPpsnrdlfNUwWjSPSzSUDx+VPAn4hbIbhvEHMCVVBKB53gtEvtKAkwS82b1oUyX
         VlLcMk3xnKdW6eINw0RFx47YyBiJjrH0Wt19bSagkWcvm3P3lTFJmq9ccAMfmgHubVri
         odvA==
X-Gm-Message-State: AOJu0YxQ7ZzNtEqjIgJCEtzWWolIve7L1GdRMWOdFFCMus1XC1klrYvv
	/bs+O9Zn5tcghoj/XsO2dZdMlsA+Mcf27jeWH9Cbcw==
X-Google-Smtp-Source: AGHT+IEw43Lf2uOaPINTZMQHb1+5PC5IekgJVOZ2+uQYCbvxFjRgl4VsQOJWXQrlhgr0vu+VM+A4Vw==
X-Received: by 2002:a05:6358:27a3:b0:170:17eb:9c45 with SMTP id l35-20020a05635827a300b0017017eb9c45mr670113rwb.38.1703124558336;
        Wed, 20 Dec 2023 18:09:18 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id qb4-20020a17090b280400b0028aecd6b29fsm4447297pjb.3.2023.12.20.18.09.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 18:09:18 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/11] ghostscript: Backport fix for CVE-2023-46751
Date: Wed, 20 Dec 2023 16:09:01 -1000
Message-Id: <f01a0e7fcf3c2d277be0cd85c0cd6b2eff2e5f0a.1703124430.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703124430.git.steve@sakoman.com>
References: <cover.1703124430.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 02:09:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192813

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5d2da96e81c7455338302c71a291088a8396245a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-46751.patch          | 41 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch
new file mode 100644
index 0000000000..6fe5590892
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-46751.patch
@@ -0,0 +1,41 @@
+From 5d2da96e81c7455338302c71a291088a8396245a Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Mon, 16 Oct 2023 16:49:40 +0100
+Subject: [PATCH] Bug 707264: Fix tiffsep(1) requirement for seekable output
+ files
+
+In the device initialization redesign, tiffsep and tiffsep1 lost the requirement
+for the output files to be seekable.
+
+Fixing that highlighted a problem with the error handling in
+gdev_prn_open_printer_seekable() where closing the erroring file would leave a
+dangling pointer, and lead to a crash.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=5d2da96e81c7455338302c71a291088a8396245a]
+CVE: CVE-2023-46751
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ base/gdevprn.c     | 1 +
+ devices/gdevtsep.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+--- a/base/gdevprn.c
++++ b/base/gdevprn.c
+@@ -1251,6 +1251,7 @@ gdev_prn_open_printer_seekable(gx_device
+               && !IS_LIBCTX_STDERR(pdev->memory, gp_get_file(ppdev->file))) {
+ 
+                 code = gx_device_close_output_file(pdev, ppdev->fname, ppdev->file);
++                ppdev->file = NULL;
+                 if (code < 0)
+                     return code;
+             }
+--- a/devices/gdevtsep.c
++++ b/devices/gdevtsep.c
+@@ -738,6 +738,7 @@ tiffsep_initialize_device_procs(gx_devic
+ {
+     gdev_prn_initialize_device_procs(dev);
+ 
++    set_dev_proc(dev, output_page, gdev_prn_output_page_seekable);
+     set_dev_proc(dev, open_device, tiffsep_prn_open);
+     set_dev_proc(dev, close_device, tiffsep_prn_close);
+     set_dev_proc(dev, map_color_rgb, tiffsep_decode_color);
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index 7f4050755c..e0d1e4618f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -42,6 +42,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-36664-0002.patch \
                 file://CVE-2023-38559.patch \
                 file://CVE-2023-43115.patch \
+                file://CVE-2023-46751.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


