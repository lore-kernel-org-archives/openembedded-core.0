Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C13CD3442
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 16:59:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1062.1778000346853456325
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 09:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=qZ5cmdWB;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso58041105e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 09:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778000345; x=1778605145; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rbyLKaUeMrL3Py2w9pL8JjeIEMbNpaie90EhJL2rDgs=;
        b=qZ5cmdWBTx1woj3p9lJH4KGYscqpi2d1n/y16dKzJBEKm0S1klMtZhCHMQQcKkfN89
         7ssVJTB0Es7zCDzKtff8AMLP62mhy59tG5AxYVlL0CivkXFaYlINbydMMfU5jO35c5RL
         s8aN2RU6OpUIXZtMxYMLXYfd3p3ILh6WUmHN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000345; x=1778605145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rbyLKaUeMrL3Py2w9pL8JjeIEMbNpaie90EhJL2rDgs=;
        b=n5PhCnBvoJuUrT7TskUc55j9k9rfhfzX9DPrYxtCNzgz7Y/vHNTK0gPLlepx2NXLbN
         Wacw6aNnRY31dhVZIQCi6PEeUCzo+kzmlLoN5I1nJoIkJHENWW2AZoaTYT9CJ3EinFoS
         bhYVW0nKwm8Vc+V58RcY6wAn5liVE5HaBds7+jlhL5OS2pV+GW/axrqcDIKMEsyBeHVg
         TlX+zmsSMgeyqb1SrjanpVlaR6+3vb9cgIe2BKR2sFuX2Y+c3J++M+hH+gs1ighoyNKy
         jSQfrMjlI4AJaSbepYqzC5xfp/4FhTAHK+13LVrihEuna6ZzNg5EInAzxMU1egtZT3hN
         ejuQ==
X-Gm-Message-State: AOJu0YwHCN0Bf7qrShVErZJzvVvG6AmPwyhd+OE/2RTlitHs6bkH9lc9
	1Xe43lMJ2JBJ3liT4T907miUOxenkQJwWTFpOfFwjLOZ/jUJqCiV56+D3uqJUW79dWZu3axZj6i
	afChqNbQ=
X-Gm-Gg: AeBDievxmZzygQxcJYADhX3B5se6HnND87EX1YVZDSoFaTivxLoOrfOS4VuNqKoZgqg
	ZLBqtdslemVIymvtB6PFwMAC5INdw8UBk2qHNdAlyS8kaHldQks2QzQGqbG6J0EAf2XlA/tW+MN
	J5EwYGvNlJ+OsGk4RDdpaWURwio3nPitbJf1qFIJR/ap8ZWwxymRYXDF/Y1UYXpl0Q+T35DAdy9
	1KYvW2mCwLQJaFeGNmsa1L8LWd4M7QKb7gbK8vWVAHbhYbDW6gC4MJjrPgk1dISTl70Y9nkxwXZ
	fNdg90rDgenHm0uKpDIQDY/dhjKCUWG3odXbCLvkktV2g2ryYLU93uKaslZK+b5zGzeX++qM419
	iuO6FoMhrDDht2JctBLRC+QuLveVe1HIsjVDX6FM1Q2PWbDebChK7WNQAV3i8xA95ZKX7EuerHM
	11Pu5PA6DSCi2l7CFuUcEwiMUCuCmZ7UrrOb+WUpB+UsPP4gOC0lSLeZeiVkhlv7+tPet3NlU4k
	r6QXbSIiwGmNs82VuiWFjx78Q==
X-Received: by 2002:a05:600c:c494:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48e51f32c35mr747955e9.13.1778000344945;
        Tue, 05 May 2026 09:59:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:8cc:5b00:b8fa:c45c:f26d:53a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e51f6805fsm60025e9.2.2026.05.05.09.59.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 09:59:03 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 19/23] ghostscript: fix build with gcc-15 on host
Date: Tue,  5 May 2026 18:57:36 +0200
Message-ID: <0769c461e545073772aecc34e81fa309ade68dcb.1777995876.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1777995876.git.fabien.thomas@smile.fr>
References: <cover.1777995876.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 16:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236510

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(From OE-Core rev: 02e282f6417274a93c6f01978bf33e2d171297b0)
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 ...Fix-compatibility-with-C23-compilers.patch | 67 +++++++++++++++++++
 .../ghostscript/ghostscript_10.05.1.bb        |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
new file mode 100644
index 0000000000..78f3fc1c34
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch
@@ -0,0 +1,67 @@
+From c595086bfe206776676e290df98cd09e91210e27 Mon Sep 17 00:00:00 2001
+From: Alex Cherepanov <alex@coscript.biz>
+Date: Thu, 3 Apr 2025 17:19:41 +0100
+Subject: [PATCH] Bug 708160: Fix compatibility with C23 compilers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* fixes:
+  http://errors.yoctoproject.org/Errors/Details/853021/
+
+In file included from ./base/genconf.c:18:
+./base/stdpre.h:348:13: error: ‘bool’ cannot be defined via ‘typedef’
+  348 | typedef int bool;
+      |             ^~~~
+./base/stdpre.h:348:13: note: ‘bool’ is a keyword with ‘-std=c23’ onwards
+./base/stdpre.h:348:1: warning: useless type name in empty declaration
+  348 | typedef int bool;
+      | ^~~~~~~
+
+Upstream-Status: Backport [Partial backport of https://cgit.ghostscript.com/cgi-bin/cgit.cgi/ghostpdl.git/commit/base/stdpre.h?id=ae940946473ceb8c5353bc6e7f04673c6e60502d]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ base/stdpre.h | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/base/stdpre.h b/base/stdpre.h
+index dda30b6..2f9c84e 100644
+--- a/base/stdpre.h
++++ b/base/stdpre.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -341,7 +341,9 @@ typedef signed char schar;
+  * and the MetroWerks C++ compiler insists that bool be equivalent to
+  * unsigned char.
+  */
+-#ifndef __cplusplus
++
++/* C23 has bool as a builtin type. */
++#if !defined(__cplusplus) && (!defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L)
+ #ifdef __BEOS__
+ typedef unsigned char bool;
+ #else
+diff --git a/base/gp.h b/base/gp.h
+index ad5bb61..cf2c9cf 100644
+--- a/base/gp.h
++++ b/base/gp.h
+@@ -1,4 +1,4 @@
+-/* Copyright (C) 2001-2023 Artifex Software, Inc.
++/* Copyright (C) 2001-2025 Artifex Software, Inc.
+    All Rights Reserved.
+ 
+    This software is provided AS-IS with no warranty, either express or
+@@ -646,7 +646,7 @@ int gp_fseek_impl(FILE *strm, gs_offset_t offset, int origin);
+ /* Create a second open gp_file on the basis of a given one */
+ FILE *gp_fdup_impl(FILE *f, const char *mode);
+ 
+-int gp_fseekable_impl(FILE *f);
++bool gp_fseekable_impl(FILE *f);
+ 
+ /* Force given file into binary mode (no eol translations, etc) */
+ /* if 2nd param true, text mode if 2nd param false */
diff --git a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
index 57a1098521..f7e1de734d 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_10.05.1.bb
@@ -28,6 +28,7 @@ SRC_URI = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/downlo
            file://CVE-2025-59798.patch \
            file://CVE-2025-59799.patch \
            file://CVE-2025-59800.patch \
+           file://0001-Bug-708160-Fix-compatibility-with-C23-compilers.patch \
            "
 
 SRC_URI[sha256sum] = "121861b6d29b2461dec6575c9f3cab665b810bd408d4ec02c86719fa708b0a49"

