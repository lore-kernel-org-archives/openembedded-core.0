Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907C9C54F30
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 13:37:04 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.7113.1748093815113274478
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 May 2025 06:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=o5Tq/FRx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30ea7770bd2so937813a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 06:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748093814; x=1748698614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+ACKWBP0L8jXEOSnVhX8kvype/db1ltl921TvIxh4o=;
        b=o5Tq/FRx+TmdAsmMSoXt9syLrGDugj1R/PQoNjjhxrqmnEItvLAl5AA5N5bdi05ovs
         8Z2VACsPN+hg0XL8LKCHxq7qe/MbN9GqT2biz5+lE+7UiL7P2anmWgaHkd8M+88VO5kJ
         SaFyKZGYpCBa3RhNm/ixFBTqf9x5slUu8E+dh4KyUqONnVLxjQ0i/6HQ/YCZviNmW7kN
         HuC5GxDPLFAMuNv+2w8yvB2pvMia/GWPoemRDW7l1xdLYYVHjbiMaY8LdGmIy/W1tJMw
         FBiWMdspjeLLIJ3KEsOsOMfdzHYBuhOn0yWx8wC019NC6fiJlhdz+Z0vRwtvlckcO/My
         RkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748093814; x=1748698614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+ACKWBP0L8jXEOSnVhX8kvype/db1ltl921TvIxh4o=;
        b=mmHVy8V5uVPgxJXzgmRkHGX29qvqgpDpYZQWt8yLXI499NNQ4Yr3mBAcq66CMjLEnt
         LN2eF+Ni+8vFckbMEHCh0cXNEDe7MRpFIUnFx9Gd+fUVksgN1KytFDhT1hobd4IJCKkr
         hYe78BDYGkzvxDLeitBAwGifLu0T5Hozgbvd2cPwmoCKuk9Bb2TWluJGid0P8Te1NaF6
         JKGt3SW68GCfD2gh/rwENvNd/nvJH19bl/tolqWYawUyv7TeZ+99g+bcuJx9ofWvkkmv
         BgqD0e9DAWAAE1KjZ/AVpwPmINHRMxf/kM4PlwElE87qQrMaDKEEqYsfcd/2BY9RulU3
         gRKw==
X-Gm-Message-State: AOJu0YxYI++XODtKM68G8iI1Lj72Du4ZKfHm2p8T8EBFRXod0jCiBBsH
	bq/7AeJZhpkn0VtUmukwlf6xkW31tbQDPUwMkCzZBRuKLPhGQ4LxQfzgvD9rNU43C0wp2J3p1Gq
	rUnYM
X-Gm-Gg: ASbGncszYjS+xWJX/fNusxsm3HDfXWV0oAqqyEmfMcXI1nWEyHOkcinI1SfdalOBL3A
	49U5PsekYQR3Ib5moQFAty7yrf93nM7xWNYkyWfi3sQpKP1PR4Gk9IMm9b3+EX///sGPXQvhDjd
	ub3G141n83yaJgxxFdQyeycY6qZghTk2B3aVZ2Am47Pat6n78yaAtkmT87D6FTikVmBebmsb001
	ECuqQ+STAV4J7FLZTFhRq+0zMsLOpZiYdoVZ2+zEXi3A5zi2CyDBdsLy2BH44+bneb/0LoIH2zA
	md7dNctxRuvTyKoAMmPOMEeiTXYaXjJBxhjNhDhj348=
X-Google-Smtp-Source: AGHT+IEyS2Hv9fwJIS2Q3sprP3jKXMuB6houIMcEJQjHkijUfitDa76PY/825sWV4EQifo0JnWj3KA==
X-Received: by 2002:a17:90b:3851:b0:2fe:8c22:48b0 with SMTP id 98e67ed59e1d1-3110f10afbcmr5177477a91.15.1748093814154;
        Sat, 24 May 2025 06:36:54 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3157:44bf:9f62:fea8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4f9csm9058913a91.20.2025.05.24.06.36.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 06:36:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/12] glib-2.0: fix CVE-2025-4373
Date: Sat, 24 May 2025 06:36:25 -0700
Message-ID: <7a7319745637d4b681935ae71706dcc467df3040.1748093626.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748093626.git.steve@sakoman.com>
References: <cover.1748093626.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 May 2025 13:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217234

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
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-02.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2025-4373-01.patch
new file mode 100644
index 0000000000..5b43850c53
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
+index 0a509e5..d6f8735 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -424,8 +424,9 @@ g_string_insert_len (GString     *string,
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
+@@ -723,10 +724,12 @@ g_string_insert_c (GString *string,
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
+@@ -759,6 +762,7 @@ g_string_insert_unichar (GString  *string,
+                          gssize    pos,
+                          gunichar  wc)
+ {
++  gsize pos_unsigned;
+   gint charlen, first, i;
+   gchar *dest;
+
+@@ -800,15 +804,18 @@ g_string_insert_unichar (GString  *string,
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
+@@ -866,6 +873,7 @@ g_string_overwrite_len (GString     *string,
+                         const gchar *val,
+                         gssize       len)
+ {
++  gssize len_unsigned;
+   gsize end;
+
+   g_return_val_if_fail (string != NULL, NULL);
+@@ -877,14 +885,16 @@ g_string_overwrite_len (GString     *string,
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
index 0000000000..d5a4d8dacd
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
+index d6f8735..d097e2f 100644
+--- a/glib/gstring.c
++++ b/glib/gstring.c
+@@ -873,7 +873,7 @@ g_string_overwrite_len (GString     *string,
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index cebd84dd50..8d2c452088 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -60,6 +60,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2025-3360-04.patch \
            file://CVE-2025-3360-05.patch \
            file://CVE-2025-3360-06.patch \
+           file://CVE-2025-4373-01.patch \
+           file://CVE-2025-4373-02.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.43.0


