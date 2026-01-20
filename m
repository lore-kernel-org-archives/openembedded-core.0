Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5706CD2ED1F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 13:38:16 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6467.1768916287689894676
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 05:38:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=A+cQMvfj;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee0291921so36470395e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768916286; x=1769521086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cu9r7P8Z5D/iQtu6B9uXWBn7dzzRr+bx1pNyuBVpngk=;
        b=A+cQMvfjSdyqVjVgkDjHo6T+OogmJJyVctNkgAqRf6ybE6y2dlX6awBSFqbX2oEOxE
         sPXJonMQytP4RoobSa/6lqelRWubPKBh/oyXOrmJqNByZcrtXkRsXsdpdR8+uWt1zdXj
         qDtnjncF6JlKJVpbma7mndoKQzb2r3h9N37kA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916286; x=1769521086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cu9r7P8Z5D/iQtu6B9uXWBn7dzzRr+bx1pNyuBVpngk=;
        b=i3PLe3yDc9CcjF9Ntzp/6VVllvUcNacuG+0s9d6Pfydt1s17Hn0XVSXD0ZNSzZwPq5
         ezUrZy8PltGfmDdEhw2qJtJHlyuLTr5X8ExSsvlpkrzzAP94WEGC6HkaNRk6XRfPACVY
         4zcpYSbfyByZ0SoClqRUhtQjRzz+D0EwItLzeZ5vjhWf9LBGTy7pTszy8g9ugT5qfIda
         nu+oCvGzbGy5PN8GSJiMzMF4D4zJs3rYsv3FcnkBJ2FgtyTichGGrkRtH4LC+NE/5nGb
         p8XWsyS7dFkOLa7nITF0hdC/k2tQmInFlXlhL9IbMu4V4RxPKMZYpHPeFb0iAZBW8chj
         Nu0w==
X-Gm-Message-State: AOJu0Yy5hDY/ljl865aihuxplGu6KSNpSV8OAVoEwuEZ4k+qXqpAtwKS
	mr1gt5M7mtEXWN+oJLS8ODV7bd/xxzqZfLhJKM2l0khafoao6nySue/FPl70uLS2vjXAPTLHwBN
	tmlY0
X-Gm-Gg: AY/fxX5uUS0GVLLYmAnDaRam37YYVs8ScO+9VB2atxfgTNaWOpSv4cY9oibOfIj5DsP
	NQ4gXnpQTKsYkAuU779xGSrX8SufQPTlHoP+qs+Gf3aRSx6gbGWNOVVsnS1ni1kUM+ecjytGAUy
	KTOrmB8QSR/I5sxM/Ck9clie4vyT3eLwjL6TE+8EsyPBAcRnnk6GGA2b9zXu/ezAOlV92e+FErZ
	YakTfnI6l6Oxa/rOaVoI0TsCoVm1XtwRmmMxRlVvWaVvkJGL6Eqv7e3MgK9RmSWFvSOSfzVn/O3
	S6hIFf8MH0OqLF3o6CGkai+bWwTFV/LmR4TB+V8FmOcBAXRYNaLFtIvVRlDtzpxSQlZoqKhUTOi
	aqQON4mGZOnLQWMqkrTYEDmcgtBbr0B9C+Plvy5kgGwWg7GjI0O8WPaIIYH9f8fMVw7aav4AXO5
	0LYeoic4HL55GHabCYYf8faJPFX39AAfc+H6ylXh9caQTc2j/2mFKex0gPX0EAF9MxOyvfPxMfY
	6BcPGgujD6T81tVSokoFw==
X-Received: by 2002:a05:600c:46ce:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4801eb0efe0mr202186175e9.31.1768916285619;
        Tue, 20 Jan 2026 05:38:05 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4b26764fsm303400035e9.12.2026.01.20.05.38.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:38:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/26] glib-2.0: patch CVE-2025-14512
Date: Tue, 20 Jan 2026 14:37:26 +0100
Message-ID: <e1f4bfda4f0f5d481b44264c5f4acff7a78614bd.1768914702.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768914702.git.yoann.congal@smile.fr>
References: <cover.1768914702.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 13:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229710

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4935
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3845

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2025-14512.patch    | 70 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch
new file mode 100644
index 0000000000..fd3ba765b1
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch
@@ -0,0 +1,70 @@
+From 1909d8ea9297287f1ff6862968608dcf06e60523 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Thu, 4 Dec 2025 16:37:19 +0000
+Subject: [PATCH] gfileattribute: Fix integer overflow calculating escaping for
+ byte strings
+
+The number of invalid characters in the byte string (characters which
+would have to be percent-encoded) was only stored in an `int`, which
+gave the possibility of a long string largely full of invalid
+characters overflowing this and allowing an attacker-controlled buffer
+size to be allocated.
+
+This could be triggered by an attacker controlled file attribute (of
+type `G_FILE_ATTRIBUTE_TYPE_BYTE_STRING`), such as
+`G_FILE_ATTRIBUTE_THUMBNAIL_PATH` or `G_FILE_ATTRIBUTE_STANDARD_NAME`,
+being read by user code.
+
+Spotted by Codean Labs.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+
+Fixes: #3845
+
+CVE: CVE-2025-14512
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/1909d8ea9297287f1ff6862968608dcf06e60523]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ gio/gfileattribute.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/gio/gfileattribute.c b/gio/gfileattribute.c
+index c6fde60fa..d3083e5bd 100644
+--- a/gio/gfileattribute.c
++++ b/gio/gfileattribute.c
+@@ -20,6 +20,7 @@
+ 
+ #include "config.h"
+ 
++#include <stdint.h>
+ #include <string.h>
+ 
+ #include "gfileattribute.h"
+@@ -271,11 +272,12 @@ valid_char (char c)
+   return c >= 32 && c <= 126 && c != '\\';
+ }
+ 
++/* Returns NULL on error */
+ static char *
+ escape_byte_string (const char *str)
+ {
+   size_t i, len;
+-  int num_invalid;
++  size_t num_invalid;
+   char *escaped_val, *p;
+   unsigned char c;
+   const char hex_digits[] = "0123456789abcdef";
+@@ -293,7 +295,12 @@ escape_byte_string (const char *str)
+     return g_strdup (str);
+   else
+     {
+-      escaped_val = g_malloc (len + num_invalid*3 + 1);
++      /* Check for overflow. We want to check the inequality:
++       * !(len + num_invalid * 3 + 1 > SIZE_MAX) */
++      if (num_invalid >= (SIZE_MAX - len) / 3)
++        return NULL;
++
++      escaped_val = g_malloc (len + num_invalid * 3 + 1);
+ 
+       p = escaped_val;
+       for (i = 0; i < len; i++)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index c5704a27bc..50701be3d0 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -69,6 +69,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-01.patch \
            file://CVE-2025-14087-02.patch \
            file://CVE-2025-14087-03.patch \
+           file://CVE-2025-14512.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

