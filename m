Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC891CD8C89
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 14:14:49 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.92778.1696947287776586595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 07:14:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Hw6FXTAv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c5bf7871dcso42021665ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 07:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696947287; x=1697552087; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lMOjLP1M2xSDNne+vOs6OW1p42igPc8CZ4+zZUalB+Y=;
        b=Hw6FXTAvTz9JYpCUR0m528CWOKkg2OiX+vjOEWNeB0wPo+G5raXjXfZkd0phDhGef9
         kXcA0uqFnI7RUKNNeeK2WoBfCaN37V9HfycxvC2r1ViBKpE1E42Ge0aU1qlmY+cBXU+O
         oAvLJrLXx4WTkjvfr1xG683ZxLlMrl1+mWdxyaq+ZBUKj74edVYna+cXV8LfE8e+3Wi1
         ZVwLDvSIWHb4hJrHsYVZZj3P/grVQ5onp4IJWhGHTKGv67tAkWSQGg0+UYEv47LCUfMI
         lFuN0ZZAQ6mWpLaosVjMa/pTT1/a9XwhnQUIwDLVAkCPWkn2om64JT+FkYe3vk8E4Wxv
         ++Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696947287; x=1697552087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMOjLP1M2xSDNne+vOs6OW1p42igPc8CZ4+zZUalB+Y=;
        b=ZWH7Vxn2sRIF+DlWKQ8TZ4ue+SMMiJaqkC3PtJm7F8mBgXIJuOm1AtdXV3/jWlL9ds
         2oXkLa4dkA5Ja6wfU3dcr6kSk80J1bWPBLjyhZP1NVDud/YWmTV2o5+B8CO1cjg2JX+2
         oB+a01banCApFh0kbsyfoPZmnuRTayGriXq48PZ3yizaB5u3zChM4eE3BMug1RR9oIQf
         9OEKtHQkSpbbcFXI7HYudyv8tOxNUR4RzRXoSKyb/R2VLzGvvFMG852YA72ksgZWRvUC
         2Ie3n2gGWJBq58qJYI8myoMQQnXure4y6yDpXnbhnbERVfukaUDVfQ9wT1BZQJE2KaFH
         Mciw==
X-Gm-Message-State: AOJu0YyTQqUKB5SLynleJ4zSS7w7F7X831hrrwxD4caCTt3siy3gXdf2
	w2jfuE5osmCwDkwySbt2c8d0l5mO8ln5RdROkJI=
X-Google-Smtp-Source: AGHT+IEETG9EPuuLebb1wqfEA0X+MBJr1PA7cJufFu8jFJgY0AsJhW1Q5HcDtOHXJl16tW3Bk9o5bw==
X-Received: by 2002:a17:902:d4c9:b0:1c8:9832:8278 with SMTP id o9-20020a170902d4c900b001c898328278mr8987865plg.48.1696947286884;
        Tue, 10 Oct 2023 07:14:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b8-20020a170902d50800b001b81a97860asm11737610plg.27.2023.10.10.07.14.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 07:14:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/11] ghostscript: Backport fix CVE-2023-43115
Date: Tue, 10 Oct 2023 04:14:25 -1000
Message-Id: <a43f7277061ee6c30c42c9318e3e9dd076563f5d.1696946306.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696946306.git.steve@sakoman.com>
References: <cover.1696946306.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 14:14:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188906

From: Vijay Anusuri <vanusuri@mvista.com>

In Artifex Ghostscript through 10.01.2, gdevijs.c in GhostPDL can lead to remote
code execution via crafted PostScript documents because they can switch to the
IJS device, or change the IjsServer parameter, after SAFER has been activated.
NOTE: it is a documented risk that the IJS server can be specified on a gs
command line (the IJS device inherently must execute a command to start the IJS server).

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-43115

Upstream commit:
https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=e59216049cac290fb437a04c4f41ea46826cfba5

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-43115.patch          | 62 +++++++++++++++++++
 .../ghostscript/ghostscript_9.52.bb           |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch b/meta/recipes-extended/ghostscript/ghostscript/CVE-2023-43115.patch
new file mode 100644
index 0000000000..3acb8a503c
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
+Upstream-Status: Backport [https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=e59216049cac290fb437a04c4f41ea46826cfba5]
+CVE: CVE-2023-43115
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ devices/gdevijs.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/devices/gdevijs.c b/devices/gdevijs.c
+index 3d337c5..e50d69f 100644
+--- a/devices/gdevijs.c
++++ b/devices/gdevijs.c
+@@ -934,6 +934,9 @@ gsijs_finish_copydevice(gx_device *dev, const gx_device *from_dev)
+     static const char rgb[] = "DeviceRGB";
+     gx_device_ijs *ijsdev = (gx_device_ijs *)dev;
+ 
++    if (ijsdev->memory->gs_lib_ctx->core->path_control_active)
++	return_error(gs_error_invalidaccess);
++
+     code = gx_default_finish_copydevice(dev, from_dev);
+     if(code < 0)
+         return code;
+@@ -1363,7 +1366,7 @@ gsijs_put_params(gx_device *dev, gs_param_list *plist)
+     if (code >= 0)
+         code = gsijs_read_string(plist, "IjsServer",
+             ijsdev->IjsServer, sizeof(ijsdev->IjsServer),
+-            dev->LockSafetyParams, is_open);
++	    ijsdev->memory->gs_lib_ctx->core->path_control_active, is_open);
+ 
+     if (code >= 0)
+         code = gsijs_read_string_malloc(plist, "DeviceManufacturer",
+-- 
+2.25.1
+
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
index 0a2f9f5046..9712871e7f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.52.bb
@@ -44,6 +44,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://CVE-2023-36664-pre1.patch \
                 file://CVE-2023-36664-1.patch \
                 file://CVE-2023-36664-2.patch \
+                file://CVE-2023-43115.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


