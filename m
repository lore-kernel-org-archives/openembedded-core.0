Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50BAEE6423
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 09:56:20 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.82865.1767174972466217088
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Dec 2025 01:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=jPAdXxdq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20251231095610fa79df102a00020763-dhqkru@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20251231095610fa79df102a00020763
        for <openembedded-core@lists.openembedded.org>;
        Wed, 31 Dec 2025 10:56:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kO9qe7sNN5aEkXKRxRBjIeexbns2NesU73P1tudEXlY=;
 b=jPAdXxdqe3/HR2nDF2MW+ZVIc6Pe3YDBKS3fZRk97lF2FhOcmyfKGaPHz0FxjGiiLJ6RyL
 kHQdK/hmanHMr9dfd9f9vPd0GqiI+r/1eRbwB8NHLY+2BAYcFtpkJGRuV9d4YPRn2VgkJuE3
 11vZ23Xsz4AelpQbZLtBUJX0y44ATrlJy8BzmPVT9gssFQX4Wc63ULYBpyus4fIfUogDxEgH
 yGCBDToCB8jDD22pPD5bD9+w8nF6tuCEzPo4K7vdaDAWX4pOW0FSb077PlERJU/mPG4kpgXm
 6eO0p2hn5zb3pDSB4vJQPwiR3WACP9/ebdqG5bILfHzT5eBbiHRxBkhA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/3] glib-2.0: patch CVE-2025-14512
Date: Wed, 31 Dec 2025 10:55:44 +0100
Message-Id: <20251231095544.920217-3-peter.marko@siemens.com>
In-Reply-To: <20251231095544.920217-1-peter.marko@siemens.com>
References: <20251231095544.920217-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Dec 2025 09:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228730

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] linked from [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4935
[2] https://gitlab.gnome.org/GNOME/glib/-/issues/3845

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-14512.patch    | 70 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-14512.patch
new file mode 100644
index 00000000000..fd3ba765b11
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
index c5704a27bcc..50701be3d03 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -69,6 +69,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-14087-01.patch \
            file://CVE-2025-14087-02.patch \
            file://CVE-2025-14087-03.patch \
+           file://CVE-2025-14512.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

