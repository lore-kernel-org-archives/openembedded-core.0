Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B30AC3DA64
	for <webhook@archiver.kernel.org>; Wed, 31 Jul 2024 04:40:15 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.35591.1722400808679308975
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jul 2024 21:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OftApLYt;
 spf=pass (domain: mvista.com, ip: 209.85.214.171, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc491f9b55so40548435ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 21:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1722400808; x=1723005608; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fkLfOZE/MROa4jWhqsGGl+XXsAm5Mf5CM3zcdO9foKs=;
        b=OftApLYtq++iKD3e43knbGb425dX9s8A3eVlFx+nCLJxs5tG1wBsekgICJhBSuU2j5
         EYQigvO41DjKcvFlvQ2M6LOUlE2a5ZyMbVr9PinC5cugVwtTxZqlXDV/qh6DFcHYXvrL
         nGnTdCzFwoaiuVDffoeXSoXFkqNgb7CcE0S44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722400808; x=1723005608;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkLfOZE/MROa4jWhqsGGl+XXsAm5Mf5CM3zcdO9foKs=;
        b=JNbv01fIohUv0Rhd7TawQxh/Br8RbQDL6LXAntlD0Abn2TAfKjhS/7pcsO89pD8rRH
         DVYN/VsOH8EhQAb5BREiONZO/NnfuU6R3fnM0U8Onv62euDLocschF2hOQNQ4odYQioQ
         nJAxjOxCH4qScLzZUHvQmyQVOnpEWs1Pz/6Fq8vhHaBX97kXhPR3C7aeCg7lt+F7P8KB
         e7o4sQMpaNWEnQn3YVkQPW3WwrJWa+UBih7UuVme1M+mbx09cRMo+01sJ5zNDVw6IcBm
         HKWQX5ZhCp+FOJdbrohYOm+ZRxTKwfIE07eJqW3YCJGIQXqZ3qqInzk/r7rqGRXcWfdC
         oPLA==
X-Gm-Message-State: AOJu0YwyBYR/9NzbV2rfo84rhLVbfUDL12fRaYl1adwU2A3ueVtd9Sir
	Boye+ovFikW1kIVs8ZzJFYVwM8OxjKrfy/nJnz0G7p47t8gWZdv2X9TIGxId/lm6q6cBS34vyJb
	Y
X-Google-Smtp-Source: AGHT+IFI9DhhVvN6vy64VCx/5fhBhbdIOL3a956BFDMA9uj/0B69wV9GhpRIrOFZw9pdSsUI/oih0w==
X-Received: by 2002:a17:902:ea01:b0:1f9:c3e4:4c0f with SMTP id d9443c01a7336-1ff04844d19mr110261615ad.34.1722400807636;
        Tue, 30 Jul 2024 21:40:07 -0700 (PDT)
Received: from asharma-Latitude-3400 ([2401:4900:1c30:2930:4c22:347d:8445:7c05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7c7fce4sm110323025ad.32.2024.07.30.21.40.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 21:40:07 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Wed, 31 Jul 2024 10:10:01 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][kirkstone][PATCH] gtk+3 : backport fix for CVE-2024-6655
Date: Wed, 31 Jul 2024 10:09:53 +0530
Message-Id: <20240731043953.989-1-asharma@mvista.com>
X-Mailer: git-send-email 2.35.7
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jul 2024 04:40:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202690

stop looking for modules in cwd in gtk/gtkmodules.c.

Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/gtk+3.0/3.24.33-1ubuntu2.2]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../gtk+/gtk+3/CVE-2024-6655.patch            | 39 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch b/meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch
new file mode 100644
index 0000000000..2460b97b6b
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+3/CVE-2024-6655.patch
@@ -0,0 +1,39 @@
+From 3bbf0b6176d42836d23c36a6ac410e807ec0a7a7 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Sat, 15 Jun 2024 14:18:01 -0400
+Subject: [PATCH] Stop looking for modules in cwd
+
+This is just not a good idea. It is surprising, and can be misused.
+
+Fixes: #6786
+
+CVE: CVE-2024-6655
+Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/gtk+3.0/3.24.33-1ubuntu2.2]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ gtk/gtkmodules.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/gtk/gtkmodules.c b/gtk/gtkmodules.c
+index 704e412aeb5..f93101c272e 100644
+--- a/gtk/gtkmodules.c
++++ b/gtk/gtkmodules.c
+@@ -214,13 +214,8 @@ find_module (const gchar *name)
+   gchar *module_name;
+ 
+   module_name = _gtk_find_module (name, "modules");
+-  if (!module_name)
+-    {
+-      /* As last resort, try loading without an absolute path (using system
+-       * library path)
+-       */
+-      module_name = g_module_build_path (NULL, name);
+-    }
++  if (module_name == NULL)
++    return NULL;
+ 
+   module = g_module_open (module_name, G_MODULE_BIND_LOCAL | G_MODULE_BIND_LAZY);
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
index f862e143d4..3e974c91e5 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.34.bb
@@ -6,6 +6,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/${MAJ_VER}/gtk+-${PV}.tar
            file://0002-Do-not-try-to-initialize-GL-without-libGL.patch \
            file://0003-Add-disable-opengl-configure-option.patch \
            file://link_fribidi.patch \
+           file://CVE-2024-6655.patch \
            "
 SRC_URI[sha256sum] = "dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec"
 
-- 
2.35.7


