Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAF2E95A9A
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 04:18:26 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.54163.1696825096294399457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Oct 2023 21:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=QBp8ffaq;
 spf=pass (domain: mvista.com, ip: 209.85.215.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-58916df84c8so2497324a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Oct 2023 21:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1696825095; x=1697429895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f8A7kYEq/k3HuOILRpwqEI9oIAU0tbNV8ibu+QGz7Nk=;
        b=QBp8ffaqensbMX+fAVV68aSP7nZl6pR0DaWVB/rVR+PXrAzI5RA8P3SXhMGKFve5+p
         rDvT5RNDj5avm8sCkPqxXK3GqPyzsj+6TmUSiKVfUufY07xG3Lrtq9uvZV9qsR+LtIr3
         kMEfLWqUgnAIPfJ+zNB2rxtSos+08yo+6w00g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696825095; x=1697429895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f8A7kYEq/k3HuOILRpwqEI9oIAU0tbNV8ibu+QGz7Nk=;
        b=D0K0O6xGUH5RzZ3qew3p2a/tKVtUYcWkdfJuPbTvUm1lsIv1UxSRr8jhsxu36EvSyK
         EkLy3LXNafMpSVtKLbFNFOTMbjcOt3OvdVXTceU/f/fITCesczV++GWjZooeD+ba124S
         a0ll72hRFx1vltCZ6+7OaR9a6VyrjVRFZ27U2cqZvZ8es4++bosaGZ6sVhCE9q02pMkN
         /hNnFkR5tP340JZy2uEJsF2GWFu3//5oYyJktYJ3oiKe+r3ggNQ4Jpx4KKNEm5Hf5pGD
         JJG8YRPmiahb1nmGyQDd+MiNy39zNjLmW2maCjXWV0dyilmXmOx+IrzXoIXbi5LMrMO4
         OKRg==
X-Gm-Message-State: AOJu0Yz2rTYbXZ7yzwKmVJ/Sm8NGmn+oW/KgJtzEmFzoa8vztytmPqY7
	dFpwzHyOhSNxjRXIEp7u9PGN8YwBtR9siENgSsM=
X-Google-Smtp-Source: AGHT+IHmce0tE7/b7Q/Kjf6ejUDdbW/xd7xxfHWt4Byi+1UR3Jb0wZneiaUcNHdAF1T6s12CJxRrpA==
X-Received: by 2002:a17:90a:fe94:b0:262:ba7f:30cd with SMTP id co20-20020a17090afe9400b00262ba7f30cdmr11307166pjb.31.1696825094966;
        Sun, 08 Oct 2023 21:18:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:7c68:5465:3a18:9991:b463])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090adb0200b002776288537fsm7230969pjv.53.2023.10.08.21.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Oct 2023 21:18:14 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] ghostscript: Backport fix CVE-2023-43115
Date: Mon,  9 Oct 2023 09:48:05 +0530
Message-Id: <20231009041805.979643-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 04:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188828

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
2.25.1


