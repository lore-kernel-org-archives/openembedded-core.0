Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C382D2ED1D
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 12:09:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5042.1768910958680656605
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 04:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=246PIiqz;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee4539adfso44009995e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 04:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768910957; x=1769515757; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkjmSAKt0Gg0OCpmRuhXxiy9bc+7Ga8tR+m7S57RKxY=;
        b=246PIiqzCri4CsXjxI0D/DPEyIg5xmP13MT3wR8p7fceerte1KU0/IF8QFQvdEPrb4
         3c0Ql1bRxoAH/CgCFEspdUNYnNxwT2bTWN0WF9d5XKIBFSJcIW+8gxk/IHZEPip6KD1P
         S+GKtETFX8BOd0ZmImXgSO4GSQLl67E7JOqfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768910957; x=1769515757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LkjmSAKt0Gg0OCpmRuhXxiy9bc+7Ga8tR+m7S57RKxY=;
        b=nmPfPp+MbViK1FsYBHhdtmOVwtDxGHrlr5CwsHZU9mIHa+eKXnRXh1VAL7KxGC7DO7
         rY1IvvmD2VJ6TDhl6/QfsoqXEd7JvY/w42LmydSW4fVcT5uucYZmAK01hn6qbtbqiCPw
         gChefkK2NL81HiNwWXQ7DVSwLRtxPOiCr1giKLbEkcVMPSMZOqpyyG3ZLs84Ozhrc78W
         HzNkMKXCYMc/38EFd54gbFcekVcDCcbcHzk4XGKCLGQ4gtIp3P+TijJKFFZc6fL45fwK
         wfLsAnpj/mInzcW+lHp/I/Ipe/38u5XiHF2kgWN/LQQj0xsWg/166VlryPfQHofpXG1W
         D2cg==
X-Gm-Message-State: AOJu0Yy8Qs2u9TCpWGECzaHbd3xDtxQX6CSBYLHhn8zSKin+QSPJg9iT
	57NI2SSHqNUlqafvGUmk4r2ncmnQETBDKLeK0DXyyN3e7Bbx/oLlN9UxE9HMzw07UOFncVyjRgz
	lon/y
X-Gm-Gg: AY/fxX7NXqz7FzAc/O9vBFwuW5wqhKAhr4fzlS0YNe01YoSs9bZ5G2kR1eGSEn93DMr
	qgzylYlKD+PX5tAif8fLnk04LTzzJeYY7V0JIiX2pMpCvKDooc7afY4uiE2CLgQ6rpxhzlk+XcE
	Xn8XxjweyOehmUN/sD7tFh67U9ie4feZkGwj0O7fJTELZHawZqm36Kis+DNh7puGXrpTemn6t8P
	bVzJkHEYlnf3f5ZBnAtIHM8Pr+DbBetgZaEnfmXF9OJ8HWXJo1vlqbWVtAnVBzBlUUg21qvz3yC
	FEk2nYsvTXdWsSp8qcO3CrHQWcYqGVoP5ZqZ1ZAJQ/TVqLc0vxdP9hiPo5CbJy4020L7lbqSKHK
	R2XFr1oDGtlQeMTuRf64lMp4Zx7vgiFjshv+aFCCRaeLiBYqWnOa1LwZn6vVvnDZPpENorYfJwF
	uvjcgrf+5V7HxajpIG/T1U2xLw1VRANdid1GOIsvHVaFTenWB16iteQMb3BHHHij/uf6HqdXfp1
	iTCpfWBc8wrDtCQROcX9g==
X-Received: by 2002:a05:600c:820b:b0:47a:9560:ec28 with SMTP id 5b1f17b1804b1-4803e7a2d1dmr21465195e9.13.1768910956767;
        Tue, 20 Jan 2026 04:09:16 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569927007sm28916097f8f.16.2026.01.20.04.09.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:09:16 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/22] glib-2.0: patch CVE-2025-14512
Date: Tue, 20 Jan 2026 13:08:21 +0100
Message-ID: <d73ff33860101e8b90c65c64e94df76bf235868e.1768910519.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1768910519.git.yoann.congal@smile.fr>
References: <cover.1768910519.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 12:09:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229685

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4935
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3845

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-14512.patch    | 70 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch
new file mode 100644
index 0000000000..689a433079
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
+@@ -22,6 +22,7 @@
+ 
+ #include "config.h"
+ 
++#include <stdint.h>
+ #include <string.h>
+ 
+ #include "gfileattribute.h"
+@@ -273,11 +274,12 @@ valid_char (char c)
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
+@@ -295,7 +297,12 @@ escape_byte_string (const char *str)
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index f4df61c896..c7e18c7bc4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -38,6 +38,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-01.patch \
            file://CVE-2025-14087-02.patch \
            file://CVE-2025-14087-03.patch \
+           file://CVE-2025-14512.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

