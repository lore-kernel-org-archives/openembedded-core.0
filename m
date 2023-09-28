Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A62EECE7AE5
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 02:48:58 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web10.6267.1695869336947476652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Sep 2023 19:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EfRTAdFi;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.180, mailfrom: steve@sakoman.com)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-496a775af2fso4621817e0c.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Sep 2023 19:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695869335; x=1696474135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=weD//oPJA4T98dUW5eFuSvl0r7CHxPoNlwnyQo7ZTE8=;
        b=EfRTAdFifnhial0ZCLZ+1RP1nccab7y5FrjlqTBuRZ7K3vZYaM30xyLHcHfYSmOAny
         QcP3tZW6ICevsYNLdqKdUbznWWU/+fAD2Q1303UQeLBtOvEoNQRtyoujV5TQOgInL5bH
         9FuXPkKLvUWq4jusTK+bNm9kslg2USKGj6Bnfp3jSV8+YAcu4X9TFqpNCV+tBFILv6GB
         nOhCdEa5yCeW4Z4zQtHtaEnJp6IM7DOxscSguUd3xWHNe8bNdF/8cXxa/3eo4TkpZD4/
         l1hw0n+OEAl22b5xhzYEu/ch7poJf2KD6OcpQIrR2U0vUGZRdFUiiLD8sKLhQK1yQlLN
         QYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695869335; x=1696474135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weD//oPJA4T98dUW5eFuSvl0r7CHxPoNlwnyQo7ZTE8=;
        b=Yak9lq0VSDr3OQlKWtMaj+hCin0oMggeanf2oNMtzgPya4yrQiktfYYwJ4yqh4iYG6
         z8XAOoIt0fFyUXsS40wJFFvgesdzn7QrOQovJojjuCcJt+ubfq6KCuwurFD0txNRz2DA
         Popphb1ShHlz/4WKOSJDXpgQ73fvTb4eddpKzgDi24sRTHAgOTpxBJouKWI1wUBoprCj
         5wJuAPGRrytAY3XLnSY/MGHTv4uXW+6ju45Wld0BbAGGMwxjq37n+eRl+q3JSwFtJdve
         TI58EimAgPDa2jwHWcriz96DeFIJFjbRSTOloeDxgWWeaMUbMivJ9bRZxDfemmOY/+Xc
         /fgg==
X-Gm-Message-State: AOJu0YzuZv8FgI8/UfYbAsQ5665IxCBdDfYNoN+Ot5/h8BqbZXnOuFUy
	UtoLd9sys93Xv7ueGti61xO7wzIIKtdESNZ6KBM=
X-Google-Smtp-Source: AGHT+IHc6L3hGbTg/FvT9ldWTS45w5MD1ZXX189r1U09CP2Q21DWgX69zDKOZhmA15LLuZLfr8pK1w==
X-Received: by 2002:a1f:c645:0:b0:47e:8a9:478c with SMTP id w66-20020a1fc645000000b0047e08a9478cmr2933562vkf.16.1695869335440;
        Wed, 27 Sep 2023 19:48:55 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id n3-20020aa79043000000b0068e12e6954csm1850214pfo.36.2023.09.27.19.48.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 19:48:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/17] ghostscript: fix CVE-2023-43115
Date: Wed, 27 Sep 2023 16:48:31 -1000
Message-Id: <1d169e50f28c93434461aa3ecbc47c21509143e9.1695869144.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695869144.git.steve@sakoman.com>
References: <cover.1695869144.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Sep 2023 02:48:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188352

From: Archana Polampalli <archana.polampalli@windriver.com>

In Artifex Ghostscript through 10.01.2, gdevijs.c in GhostPDL can lead to remote
code execution via crafted PostScript documents because they can switch to the
IJS device, or change the IjsServer parameter, after SAFER has been activated.
NOTE: it is a documented risk that the IJS server can be specified on a gs
command line (the IJS device inherently must execute a command to start the IJS server).

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-43115

Upstream patches:
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=8b0f20002536867bd73ff4552408a72597190cbe

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-43115.patch          | 62 +++++++++++++++++++
 .../ghostscript/ghostscript_9.55.0.bb         |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch
new file mode 100644
index 0000000000..979f354ed5
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch
@@ -0,0 +1,62 @@
+From 8b0f20002536867bd73ff4552408a72597190cbe Mon Sep 17 00:00:00 2001
+From: Ken Sharp <ken.sharp@artifex.com>
+Date: Thu, 24 Aug 2023 15:24:35 +0100
+Subject: [PATCH] IJS device - try and secure the IJS server startup
+
+Bug #707051 ""ijs" device can execute arbitrary commands"
+
+The problem is that the 'IJS' device needs to start the IJS server, and
+that is indeed an arbitrary command line. There is (apparently) no way
+to validate it. Indeed, this is covered quite clearly in the comments
+at the start of the source:
+
+ * WARNING: The ijs server can be selected on the gs command line
+ * which is a security risk, since any program can be run.
+
+Previously this used the awful LockSafetyParams hackery, which we
+abandoned some time ago because it simply couldn't be made secure (it
+was implemented in PostScript and was therefore vulnerable to PostScript
+programs).
+
+This commit prevents PostScript programs switching to the IJS device
+after SAFER has been activated, and prevents changes to the IjsServer
+parameter after SAFER has been activated.
+
+SAFER is activated, unless explicitly disabled, before any user
+PostScript is executed which means that the device and the server
+invocation can only be configured on the command line. This does at
+least provide minimal security against malicious PostScript programs.
+
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=8b0f20002536867bd73ff4552408a72597190cbe]
+
+CVE: CVE-2023-43115
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ devices/gdevijs.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/devices/gdevijs.c b/devices/gdevijs.c
+index 8cbd84b97..16f5a1752 100644
+--- a/devices/gdevijs.c
++++ b/devices/gdevijs.c
+@@ -888,6 +888,8 @@ gsijs_initialize_device(gx_device *dev)
+     static const char rgb[] = "DeviceRGB";
+     gx_device_ijs *ijsdev = (gx_device_ijs *)dev;
+
++    if (ijsdev->memory->gs_lib_ctx->core->path_control_active)
++        return_error(gs_error_invalidaccess);
+     if (!ijsdev->ColorSpace) {
+         ijsdev->ColorSpace = gs_malloc(ijsdev->memory, sizeof(rgb), 1,
+                                        "gsijs_initialize");
+@@ -1326,7 +1328,7 @@ gsijs_put_params(gx_device *dev, gs_param_list *plist)
+     if (code >= 0)
+         code = gsijs_read_string(plist, "IjsServer",
+             ijsdev->IjsServer, sizeof(ijsdev->IjsServer),
+-            dev->LockSafetyParams, is_open);
++            ijsdev->memory->gs_lib_ctx->core->path_control_active, is_open);
+
+     if (code >= 0)
+         code = gsijs_read_string_malloc(plist, "DeviceManufacturer",
+--
+2.40.0
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
index ad0b008cab..4c4c22cf39 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.55.0.bb
@@ -38,6 +38,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-36664-0001.patch \
                 file://CVE-2023-36664-0002.patch \
                 file://CVE-2023-38559.patch \
+                file://CVE-2023-43115.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


