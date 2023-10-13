Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A01CDB486
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 21:53:13 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.51156.1697233987619084178
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 14:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lboGmXSP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso1092066b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 14:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1697233987; x=1697838787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LUDpaCppW3BLZkbi1TL7Caurk+Nf06aSbpRp0Uwdm78=;
        b=lboGmXSPLofzffUfLZ+scd6MoK3xE95ymyzs1YFhLkcBMT9ZZp1gam75MaNL8WBolQ
         CiZOZ4c/s3K7kt/S+sLqBz+ewaQOdKoeSjT79uK8dBh2vkAGWaJ3SMXyU+dPaVLqCFjl
         ALLbn1wodjgWhIvPput5L2Zr9rY6P23WPPJq+sA7fgO0EQhhNMI69gUJYXXIEsAAvtz8
         aVtxsrVPTZew8kXGOHUV9+A2GZKrPd0QgmpvnykFALdTG0LPUSOcBJhiPlwqQSLCZ0zA
         9BLajGnVQb12r9wdqGVRbD7WrScxoqqF77WIPtJaCstWpfjUXh6PjQWKi8DT+92TbUMT
         Ca0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697233987; x=1697838787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUDpaCppW3BLZkbi1TL7Caurk+Nf06aSbpRp0Uwdm78=;
        b=L+bSlehB3T5QRwFeaYMULmOsJTFtr6Q05IU//oXKScUw9oblPAlVigBD1xdq5j3/p/
         /4iu/LieKy1sh0InoDU/03EYXpFbUUpuUadoE+CwAPP0zt+yShR3xSwM8tpqEwv7LyTA
         WGDIs9LwnrunJofizzhRnb5MH/O4h53aCzZCnU949f/iP2EPMgz5qJWA7xfZsSo0uLYT
         z3B9AhcuEAJIw3nmJj3hsBgtGM99gsp9LpIOkpcR9PbN04cCoywFHZYIRnFjQ/WaOUAR
         llcRv9SVDqVczA3tAoX3ncadl2pZsQMVgxnc4rnBxQb+AT5Zl/0g5gIy+UQUgQp5RGMT
         DNjQ==
X-Gm-Message-State: AOJu0YyaJS0D4LiSMPmgwTw/UuimD6BtQFtT2RSPS4Qb79Snbu6kRs63
	hzhosDxwdNgDaDbdB55fi9OpQ8PuFyr86K+qMCI=
X-Google-Smtp-Source: AGHT+IFGP4mW1u0npf/i05trJA64EUqItzIUiceObCqF+TuBJnf81LGkX2QdJQEy0j2NcHW1NyX7fQ==
X-Received: by 2002:a05:6a00:1255:b0:68a:5449:7436 with SMTP id u21-20020a056a00125500b0068a54497436mr31052571pfi.32.1697233986521;
        Fri, 13 Oct 2023 14:53:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u22-20020a62ed16000000b00690fe1c928csm14307334pfh.147.2023.10.13.14.53.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 14:53:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/27] ghostscript: fix CVE-2023-43115
Date: Fri, 13 Oct 2023 11:52:27 -1000
Message-Id: <80a9b54ca94a9fe5818daa1cd03ae8035043e1e8.1697233866.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697233866.git.steve@sakoman.com>
References: <cover.1697233866.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 21:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189080

From: Joe Slater <joe.slater@windriver.com>

The patch is copied from kirkstone.  master has advanced
to ghostscript 10.02.0 which includes the fix.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ghostscript/CVE-2023-43115.patch          | 62 +++++++++++++++++++
 .../ghostscript/ghostscript_10.0.0.bb         |  1 +
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
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
index 9e2cd01ff4..5c6be991d9 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.0.0.bb
@@ -37,6 +37,7 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://cve-2023-28879.patch \
                 file://cve-2023-36664.patch \
                 file://CVE-2023-38559.patch \
+                file://CVE-2023-43115.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
-- 
2.34.1


