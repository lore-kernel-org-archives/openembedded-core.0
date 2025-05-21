Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAF0C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 14:59:42 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.1099.1747839572804733767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 07:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BfV5cSEp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22e16234307so62120835ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747839572; x=1748444372; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6TlYgMACoCA9dekaU8TAWagxgCrDaxa8ER7PtFJoc9A=;
        b=BfV5cSEpQvDpLlF3gCS8v0++CIT2CzVZBkq6SpNHc110wFO6qxMsMLaHY7I/JU9ix8
         988Pj7wdoKIiBE94Rk9UHTYRI3h/ybVtjBej0G2qNM0GLiixtqvHnnAOpjqyCHvTqvCz
         Emujnz447NtpgzOMYyFqtuYp8NY1Nn6RwBYoqnLQ6TmQEQczjX3CRQoK+0m1cBcbqkOA
         ZIQl+1L3r+FzMYhwx97jXsA+272ocL8bYr5t5We2MHkJIzh35m/j9eS8GTPgWB163If4
         ZRjC8xZ4rFpDRMPHAVwV/olgxmX/YzLCjgKlX9Ao/Z2I40ZDosfJfUoWMam38QnbmfTh
         xAxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747839572; x=1748444372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6TlYgMACoCA9dekaU8TAWagxgCrDaxa8ER7PtFJoc9A=;
        b=A9I6vILZMNmdvojGAEG4rQnTWuGjdItgYcMU+oXmCZFS/jRBXee+vU40j+0PsQuVeZ
         AqyRa4BCHXVAYqEZgz5Uk2NW1GNTE/0xoI5oTtt/Jzq9WnUSA2/S3w1rAGDO8sEvTPvE
         LrB4U9UEvfRh54KFEiIeQE9ezCvMSCznRBm0opIhEIvkVwV6p6za4hXGd7pJQ4TDZwbQ
         dDVXEmPdOG9HE/VHRuTE5Xnkc18rS3ke/at9qye6HSnsXbHv4ktOqBi1N8wYKoxhKnW7
         bIF3QqJzMYEjp4cP4fjLla9EmysPwOJKA76qUGJ4NfxGQuFQVkFP47gysYSeMK5hAhrG
         N0SQ==
X-Gm-Message-State: AOJu0Yx0mlqcOQ+O0qER2jvikCKALslRUmAGW0WPPJODtDxOnAOhUlfQ
	ChSglPEKCSiU4H2g4fmVrRy10sV6UQdHo5iJlrsm40HniGirJgsra3WQsmvhEw2vSDZf5jTsAxr
	kT1Jj
X-Gm-Gg: ASbGncuUIM4jGuicUsLlsOuIiVY/gOQ3gHqSx09DziWDX/73TdscDyPhCVMy0zgYeAU
	yTwINuUVrlbiPFtE7Zyjcm61XVm83Uom66oS/Cr0BVva7ToJLX/LYT4TaNSrwbDmsEftz3NKq+s
	l6zF/0d85Uqpx1NgDQgseR80tdgOyDFn3cBPU9Fu2UIWBxC0VTxip6nggHc1z5u9+6h5H4+9hhy
	Ey/+HUW3TpBX0G9ClJFFajp4LVBwi8/lZ0JZBVkgmH1rFNKigJL1iBxScLCIQlFFQYHOIGR0p7i
	HjE01BYik/5yH6bt/p9vRGziyv0ZZwUHtphRpnXWwTQ=
X-Google-Smtp-Source: AGHT+IH/YbdOgOHCrcWew6//FhVcm1ME5UjI/4X0knV8LG5mMjfghpqAGBJIiFGf0Ti1dkz9SUyFSg==
X-Received: by 2002:a17:903:22d2:b0:215:a56f:1e50 with SMTP id d9443c01a7336-231d4b0d49fmr305555415ad.8.1747839571968;
        Wed, 21 May 2025 07:59:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:89d4:3586:e576:3ce4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm94189645ad.53.2025.05.21.07.59.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:59:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 3/7] glib-2.0: fix CVE-2025-4373
Date: Wed, 21 May 2025 07:59:16 -0700
Message-ID: <02e2f5211962394ec3d66882daab240cb465ef85.1747839445.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747839445.git.steve@sakoman.com>
References: <cover.1747839445.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 14:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217039

From: Praveen Kumar <praveen.kumar@windriver.com>

A flaw was found in GLib, which is vulnerable to an integer overflow
in the g_string_insert_unichar() function. When the position at which
to insert the character is large, the position will overflow, leading
to a buffer underwrite.

References:
https://nvd.nist.gov/vuln/detail/CVE-2025-4373
https://security-tracker.debian.org/tracker/CVE-2025-4373

Upstream-patches:
https://gitlab.gnome.org/GNOME/glib/-/commit/cc647f9e46d55509a93498af19659baf9c80f2e3
https://gitlab.gnome.org/GNOME/glib/-/commit/4d435bb4809793c445846db8fb87e3c9184c4703

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2025-4373-01.patch  | 120 ++++++++++++++++++
 .../glib-2.0/glib-2.0/CVE-2025-4373-02.patch  |  29 +++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
new file mode 100644
index 0000000000..f99c4de7e1
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
@@ -0,0 +1,120 @@
+From cc647f9e46d55509a93498af19659baf9c80f2e3 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Thu, 10 Apr 2025 10:57:20 -0500
+Subject: [PATCH 1/2] gstring: carefully handle gssize parameters
+
+Wherever we use gssize to allow passing -1, we need to ensure we don't
+overflow the value by assigning a gsize to it without checking if the
+size exceeds the maximum gssize. The safest way to do this is to just
+use normal gsize everywhere instead and use gssize only for the
+parameter.
+
+Our computers don't have enough RAM to write tests for this. I tried
+forcing string->len to high values for test purposes, but this isn't
+valid and will just cause out of bounds reads/writes due to
+string->allocated_len being unexpectedly small, so I don't think we can
+test this easily.
+
+CVE: CVE-2025-4373
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/cc647f9e46d55509a93498af19659baf9c80f2e3]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ glib/gstring.c | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/glib/gstring.c b/glib/gstring.c
+index 9f04144..d016b65 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -490,8 +490,9 @@ g_string_insert_len (GString     *string,
+     return string;
+
+   if (len < 0)
+-    len = strlen (val);
+-  len_unsigned = len;
++    len_unsigned = strlen (val);
++  else
++    len_unsigned = len;
+
+   if (pos < 0)
+     pos_unsigned = string->len;
+@@ -788,10 +789,12 @@ g_string_insert_c (GString *string,
+   g_string_maybe_expand (string, 1);
+
+   if (pos < 0)
+-    pos = string->len;
++    pos_unsigned = string->len;
+   else
+-    g_return_val_if_fail ((gsize) pos <= string->len, string);
+-  pos_unsigned = pos;
++    {
++      pos_unsigned = pos;
++      g_return_val_if_fail (pos_unsigned <= string->len, string);
++    }
+
+   /* If not just an append, move the old stuff */
+   if (pos_unsigned < string->len)
+@@ -824,6 +827,7 @@ g_string_insert_unichar (GString  *string,
+                          gssize    pos,
+                          gunichar  wc)
+ {
++  gsize pos_unsigned;
+   gint charlen, first, i;
+   gchar *dest;
+
+@@ -865,15 +869,18 @@ g_string_insert_unichar (GString  *string,
+   g_string_maybe_expand (string, charlen);
+
+   if (pos < 0)
+-    pos = string->len;
++    pos_unsigned = string->len;
+   else
+-    g_return_val_if_fail ((gsize) pos <= string->len, string);
++    {
++      pos_unsigned = pos;
++      g_return_val_if_fail (pos_unsigned <= string->len, string);
++    }
+
+   /* If not just an append, move the old stuff */
+-  if ((gsize) pos < string->len)
+-    memmove (string->str + pos + charlen, string->str + pos, string->len - pos);
++  if (pos_unsigned < string->len)
++    memmove (string->str + pos_unsigned + charlen, string->str + pos_unsigned, string->len - pos_unsigned);
+
+-  dest = string->str + pos;
++  dest = string->str + pos_unsigned;
+   /* Code copied from g_unichar_to_utf() */
+   for (i = charlen - 1; i > 0; --i)
+     {
+@@ -931,6 +938,7 @@ g_string_overwrite_len (GString     *string,
+                         const gchar *val,
+                         gssize       len)
+ {
++  gssize len_unsigned;
+   gsize end;
+
+   g_return_val_if_fail (string != NULL, NULL);
+@@ -942,14 +950,16 @@ g_string_overwrite_len (GString     *string,
+   g_return_val_if_fail (pos <= string->len, string);
+
+   if (len < 0)
+-    len = strlen (val);
++    len_unsigned = strlen (val);
++  else
++    len_unsigned = len;
+
+-  end = pos + len;
++  end = pos + len_unsigned;
+
+   if (end > string->len)
+     g_string_maybe_expand (string, end - string->len);
+
+-  memcpy (string->str + pos, val, len);
++  memcpy (string->str + pos, val, len_unsigned);
+
+   if (end > string->len)
+     {
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch
new file mode 100644
index 0000000000..ea586c90dc
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch
@@ -0,0 +1,29 @@
+From 4d435bb4809793c445846db8fb87e3c9184c4703 Mon Sep 17 00:00:00 2001
+From: Peter Bloomfield <peterbloomfield@bellsouth.net>
+Date: Fri, 11 Apr 2025 05:52:33 +0000
+Subject: [PATCH 2/2] gstring: Make len_unsigned unsigned
+
+CVE: CVE-2025-4373
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/4d435bb4809793c445846db8fb87e3c9184c4703]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ glib/gstring.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/glib/gstring.c b/glib/gstring.c
+index d016b65..d9ad0c3 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -938,7 +938,7 @@ g_string_overwrite_len (GString     *string,
+                         const gchar *val,
+                         gssize       len)
+ {
+-  gssize len_unsigned;
++  gsize len_unsigned;
+   gsize end;
+
+   g_return_val_if_fail (string != NULL, NULL);
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 1a65f48399..e1a3b57270 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -27,6 +27,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-3360-04.patch \
            file://CVE-2025-3360-05.patch \
            file://CVE-2025-3360-06.patch \
+           file://CVE-2025-4373-01.patch \
+           file://CVE-2025-4373-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.43.0


