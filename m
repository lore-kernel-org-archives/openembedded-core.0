Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D03AC46467
	for <webhook@archiver.kernel.org>; Sat, 14 Jan 2023 04:54:30 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.109978.1673672064293217703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 20:54:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U6PXTlSt;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id z4-20020a17090a170400b00226d331390cso26318641pjd.5
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 20:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VvdvaJ236RM3t66Fo7G/2jIbHGcCDDF2PiAwB5Ka/yU=;
        b=U6PXTlStmKmBn278eHJw8PQwzp/u7VU7o9pU6kYWd/rXEDBaz6ej7X97YS7IAQNVNP
         KqvSj46ok7fnkPuKsQmtpnSa5q194uwzhBI4A6kDXm0fdFu79nBvPMtq5NtsCDCuIj1z
         7KulD7fBtYyZQ4jJJPkzQuphNXsza6KPk/NuhE3VKWG+Ew7bJPaEQ+A1x+bqFlpwnkU1
         wOXhMTlWRAY9y1YI2LVH8QALI78i226Rjna4d/+Aq+AiP6hZM+AL5eBdrCYsf6agr09y
         90LtvK3OghLjQAfpselNZmBf9ZlK+vr5l45arP5LXLh1pHF2Ea+M4rSocL9Rpcod3rQR
         s6mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvdvaJ236RM3t66Fo7G/2jIbHGcCDDF2PiAwB5Ka/yU=;
        b=bDazBCZcUSK7HoCv5xa+UxiqvvuFXn7NWBHlGKZKXZgorezA/0EXvRnsntP04sfoOH
         wkYS2XnpVRxjp8Cyzc3xky37Z4WlmrESTmjb8yPwpH3jClOxy3Y57ANeOsypfu5OHeAq
         nFRxI8vver7ynqf7995NJbts6Whkfo9NyrQHFWlr30coMFSzYOS2eJvOFLCJfUZXk+Sp
         mVJRrO7Zst1n+w8JnVEmYJGXtdWFgzOlhFqwVkAYWYDBlJO5vAyVB8Uaomdq+J/FhYtd
         MPfmKLEhnjKWnyQtINlquflvZPS9PxiTbsJIlkUMTdm24jJAf+9neLfO92C/2EyrL/F3
         9GQA==
X-Gm-Message-State: AFqh2kptbD4I8WM2mBOMW6JqEPChDNa08NLaGf59S+Rup3hPJkeoZkuq
	ZJpcpXoJrHKO4iQmstFoa3bZrrqoLYFJYg==
X-Google-Smtp-Source: AMrXdXv2ej6ewhdVOXg4wUoIOaFrtwCHhM7cPsEOKjZj1Vc6tLxljwD9tdiLXl+GDVvf4WrgEAsl6A==
X-Received: by 2002:a17:902:6908:b0:194:7227:84db with SMTP id j8-20020a170902690800b00194722784dbmr4013386plk.37.1673672063247;
        Fri, 13 Jan 2023 20:54:23 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::b940])
        by smtp.gmail.com with ESMTPSA id j15-20020a170903028f00b00190c6518e30sm15019524plr.243.2023.01.13.20.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 20:54:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] createrepo-c: Include missing rpm/rpmstring.h
Date: Fri, 13 Jan 2023 20:54:20 -0800
Message-Id: <20230114045420.2637555-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Jan 2023 04:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175848

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-rpm-rpmstring.h.patch        | 27 +++++++++++++++++++
 .../createrepo-c/createrepo-c_0.20.1.bb       |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
new file mode 100644
index 0000000000..a249eaf5a1
--- /dev/null
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-include-rpm-rpmstring.h.patch
@@ -0,0 +1,27 @@
+From 8defe6aaf91613c3fcb540df65a94cd56d377367 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 13 Jan 2023 13:21:51 -0800
+Subject: [PATCH 1/2] include rpm/rpmstring.h
+
+Its needed for rasprintf declaration
+
+Fixes
+src/xml_file.c:341:36: error: call to undeclared functi
+on 'rasprintf'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
+
+Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/340]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/xml_file.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- a/src/xml_file.c
++++ b/src/xml_file.c
+@@ -19,6 +19,7 @@
+ 
+ #include <glib.h>
+ #include <glib/gstdio.h>
++#include <rpm/rpmstring.h>
+ #include <assert.h>
+ #include "xml_file.h"
+ #include <errno.h>
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
index d309bb895f..053198ca5e 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;protocol=https \
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
+           file://0001-include-rpm-rpmstring.h.patch \
            "
 
 SRCREV = "af14e164a3e4ab9dfaef1212e852b9ecebc326a2"
-- 
2.39.0


