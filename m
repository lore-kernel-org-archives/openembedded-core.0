Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E73C52D72
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 17:08:31 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.30058.1722791303795636317
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Aug 2024 10:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HuYHr+40;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cfdc4deeecso3538078a91.3
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722791303; x=1723396103; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dehuSI75RWOoZewEcPqUb4OhmEPs1xT7Uo9eC1gg0t0=;
        b=HuYHr+401dnjEARb8CkC3l/kmR6IQadAwaPzTOc69JsnIxAX+8doBL73ZdDjeMUxHY
         LzlklwdyILinFGvDvhyTEX5kzGHcGlzBC/kOUh7qeGAc4jPyT/HYsa5BE3Blh+WYXOKY
         05dhott+kutNrmlhtjnkw6Mz0DEfhFkxH76ZP3vF3aXS18kZ+Zjvh9NuvUECAFMcD1/j
         Fqre9LDD5d5guu7NDOf+xSYCV3zICxewW4wYwiow87lF07LhjxHcnflbKQFxBD6Z07Sp
         VTI/OVX7qQh+moMNruPgaNSf1Sqa/c5GYS2f74ETVCxszlrBJ1TFqHAa6uU1C5awRqJp
         WlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722791303; x=1723396103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dehuSI75RWOoZewEcPqUb4OhmEPs1xT7Uo9eC1gg0t0=;
        b=lyD5zuNyIn8S0eWy53F4Lbgb8EJwJ+1D2E0DgB9b6kUmtdhotJs3qewzuV1+rLking
         kruSpzLIpSCPDWbx1kkDnietz3F/r8xDgYr8o6v65RA9J1TAu4rcmGr+j5TqtwEgPBzm
         MuXMg+CSIzNU9ALUfX4EU5qWQXG2VSGfDfB3Jsrfg2ROhF6Eg5XrRZr0Znqt932Jt5xj
         J/JOi0qYIkAeLAc0LbGZrqouI/1IeBiu8qCzT2++YjhEDzr9h2Bt4F0WrS1AFdHMXY0G
         lLpDXf2YzyZTYZrAAizpeNpGX9wpeJisBt61yPSm3OksliwV+vj1+A8i9+5cH7begnnZ
         ep+g==
X-Gm-Message-State: AOJu0Yzwdu5uz24vYYHpPi71Y7+h0/lEveeUWTyZSBoeMQ+ncIrGj6Zy
	n0t6xW6PF9uIQgfKgRZ4m1WSgvpe4W2MLiVargg7xQcGJMikJkFPKlOU2CSiPKcQhgrQzWSAknm
	jOH11lQ==
X-Google-Smtp-Source: AGHT+IEFbSMqsmcKNgb7b3/DepUZwxsSCkpTClNIy3EbRndocSxidipbBRbPr7NXDeocXtoDlVeqtQ==
X-Received: by 2002:a17:90a:f02:b0:2cd:ba3e:38a5 with SMTP id 98e67ed59e1d1-2cff9469006mr10956923a91.21.1722791303003;
        Sun, 04 Aug 2024 10:08:23 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cfdc4e3c41sm8714415a91.48.2024.08.04.10.08.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Aug 2024 10:08:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] gtk+3 : backport fix for CVE-2024-6655
Date: Sun,  4 Aug 2024 10:08:07 -0700
Message-Id: <37b9eb01dc6342bc0308c9c970e3c379c83b706f.1722791084.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722791084.git.steve@sakoman.com>
References: <cover.1722791084.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Aug 2024 17:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202951

From: Ashish Sharma <asharma@mvista.com>

stop looking for modules in cwd in gtk/gtkmodules.c.

Upstream-Status: Backport [https://launchpad.net/ubuntu/+source/gtk+3.0/3.24.33-1ubuntu2.2]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


