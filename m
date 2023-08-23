Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A20EE49B6
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.13052.1692801379760954066
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=E3UF7rpS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bdbf10333bso44901685ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801379; x=1693406179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OqpSWAXvG9LG5hKQvGeIO3dODRolEUtBz4FxbvN7vtQ=;
        b=E3UF7rpSZXYq3DnnI0nAICDNU9oQSTfYnda0blAF5h4t1yiwKUBpevCbGGKNGmUchG
         ElD3KQp0tAoNyC8e6LYN0vLuHrjuS1HgBYJo0j3EzAJJQodUKEmC35hnKo9YyxoGJ48f
         Zw3DsA5xXJbQKZs/tMiiI9rsf1dAolmGzfCXU4G8vgPsNxQA51lMqUljfoEw73aidzjs
         5zDFoKlfvdFVPmQqEY1H9byBlJMYQbqNvR4QrQVUw5gDi+bCaMzgVEQaw0wiOuKtjN7i
         m7RDImBh6Y4Rm3D8rA+DPOrX8sfp3GdPZzPc+Mf5d9AvJZW5PcsTzpPNEfn8ryITc6Cz
         jLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801379; x=1693406179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqpSWAXvG9LG5hKQvGeIO3dODRolEUtBz4FxbvN7vtQ=;
        b=iMpziz4yN4T6ToSIsk+JEcFEVE50kC8FpiFRE/zbogdOsrLjs7mGRCZs9IQmJoFG51
         +WfobBryyPx9EkPkqcmtyIqe6F4/0G501Vl0P4EK9mtiFSq02RMgybV6XP3lt6hWp7CT
         ifDiU9uR9kvCTESU3T3lY7MLSOFn2TVniaseaf/yjoDecnDjgamRvfg1UCk9x+CeVu/i
         v3hERabkrDiTN646tOBEEEPXl683NA3cg2DpIS1K/k2+aG4wKY6srOD0FnUchikki8z2
         5A6b0YVKWq5ChgmumAmTxqVY14rPGaSj2S9sdh1ezJXosDu4QzSUD/40bMGkvIDqTyW1
         OndA==
X-Gm-Message-State: AOJu0Yxcc6E5y5aDoMJgChA6SwoYcZBOEwA/XQM+3PXs42sFkl6nRh3V
	bAnO3Ptm5GtngbfiKLi5sQHlJk7dZHiXuQbotbM=
X-Google-Smtp-Source: AGHT+IEEmCMzkHOILeLHPIlGCj+Mt28o66tE9713gZizdEbWXcbKgnY3piwFitc1tcULELOl+Zc0bg==
X-Received: by 2002:a17:902:ec87:b0:1bb:9f07:5e0 with SMTP id x7-20020a170902ec8700b001bb9f0705e0mr14034590plg.60.1692801377541;
        Wed, 23 Aug 2023 07:36:17 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/36] glib-2.0: Fix CVE-2023-32665
Date: Wed, 23 Aug 2023 04:35:31 -1000
Message-Id: <2c1476bed55dc16a84b0fe163a4abb13e3ac5734.1692799745.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692799745.git.steve@sakoman.com>
References: <cover.1692799745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 14:36:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186582

From: Soumya Sambu <soumya.sambu@windriver.com>

GVariant deserialisation does not match spec for non-normal data

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/CVE-2023-32665-0001.patch        | 104 +++++
 .../glib-2.0/CVE-2023-32665-0002.patch        | 211 +++++++++
 .../glib-2.0/CVE-2023-32665-0003.patch        | 418 ++++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0004.patch        | 114 +++++
 .../glib-2.0/CVE-2023-32665-0005.patch        |  81 ++++
 .../glib-2.0/CVE-2023-32665-0006.patch        | 397 +++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0007.patch        |  50 +++
 .../glib-2.0/CVE-2023-32665-0008.patch        | 395 +++++++++++++++++
 .../glib-2.0/CVE-2023-32665-0009.patch        |  98 ++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   9 +
 10 files changed, 1877 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patch
new file mode 100644
index 0000000000..2b7536c42d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0001.patch
@@ -0,0 +1,104 @@
+From 1deacdd4e8e35a5cf1417918ca4f6b0afa6409b1 Mon Sep 17 00:00:00 2001
+From: William Manley <will@stb-tester.com>
+Date: Wed, 9 Aug 2023 10:04:49 +0000
+Subject: [PATCH] gvariant-core: Consolidate construction of
+ `GVariantSerialised`
+
+So I only need to change it in one place.
+
+This introduces no functional changes.
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/1deacdd4e8e35a5cf1417918ca4f6b0afa6409b1]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c | 49 ++++++++++++++++++++++----------------------
+ 1 file changed, 25 insertions(+), 24 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index a31d396..496f2e2 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -349,6 +349,27 @@ g_variant_ensure_size (GVariant *value)
+     }
+ }
+
++/* < private >
++ * g_variant_to_serialised:
++ * @value: a #GVariant
++ *
++ * Gets a GVariantSerialised for a GVariant in state STATE_SERIALISED.
++ */
++inline static GVariantSerialised
++g_variant_to_serialised (GVariant *value)
++{
++  g_assert (value->state & STATE_SERIALISED);
++  {
++    GVariantSerialised serialised = {
++      value->type_info,
++      (gpointer) value->contents.serialised.data,
++      value->size,
++      value->depth,
++    };
++    return serialised;
++  }
++}
++
+ /* < private >
+  * g_variant_serialise:
+  * @value: a #GVariant
+@@ -1007,16 +1028,8 @@ g_variant_n_children (GVariant *value)
+   g_variant_lock (value);
+
+   if (value->state & STATE_SERIALISED)
+-    {
+-      GVariantSerialised serialised = {
+-        value->type_info,
+-        (gpointer) value->contents.serialised.data,
+-        value->size,
+-        value->depth,
+-      };
+-
+-      n_children = g_variant_serialised_n_children (serialised);
+-    }
++    n_children = g_variant_serialised_n_children (
++        g_variant_to_serialised (value));
+   else
+     n_children = value->contents.tree.n_children;
+
+@@ -1083,12 +1096,7 @@ g_variant_get_child_value (GVariant *value,
+     }
+
+   {
+-    GVariantSerialised serialised = {
+-      value->type_info,
+-      (gpointer) value->contents.serialised.data,
+-      value->size,
+-      value->depth,
+-    };
++    GVariantSerialised serialised = g_variant_to_serialised (value);
+     GVariantSerialised s_child;
+     GVariant *child;
+
+@@ -1201,14 +1209,7 @@ g_variant_is_normal_form (GVariant *value)
+
+   if (value->state & STATE_SERIALISED)
+     {
+-      GVariantSerialised serialised = {
+-        value->type_info,
+-        (gpointer) value->contents.serialised.data,
+-        value->size,
+-        value->depth
+-      };
+-
+-      if (g_variant_serialised_is_normal (serialised))
++      if (g_variant_serialised_is_normal (g_variant_to_serialised (value)))
+         value->state |= STATE_TRUSTED;
+     }
+   else
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patch
new file mode 100644
index 0000000000..4eff85a5f3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0002.patch
@@ -0,0 +1,211 @@
+From 446e69f5edd72deb2196dee36bbaf8056caf6948 Mon Sep 17 00:00:00 2001
+From: William Manley <will@stb-tester.com>
+Date: Wed, 9 Aug 2023 10:39:34 +0000
+Subject: [PATCH] gvariant-serialiser: Factor out functions for dealing with
+ framing offsets
+
+This introduces no functional changes.
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/446e69f5edd72deb2196dee36bbaf8056caf6948]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c | 108 +++++++++++++++++++------------------
+ 1 file changed, 57 insertions(+), 51 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 7b13381..e71248e 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -633,30 +633,62 @@ gvs_calculate_total_size (gsize body_size,
+   return body_size + 8 * offsets;
+ }
+
++struct Offsets
++{
++  gsize     data_size;
++
++  guchar   *array;
++  gsize     length;
++  guint     offset_size;
++
++  gboolean  is_normal;
++};
++
+ static gsize
+-gvs_variable_sized_array_n_children (GVariantSerialised value)
++gvs_offsets_get_offset_n (struct Offsets *offsets,
++                          gsize           n)
++{
++  return gvs_read_unaligned_le (
++      offsets->array + (offsets->offset_size * n), offsets->offset_size);
++}
++
++static struct Offsets
++gvs_variable_sized_array_get_frame_offsets (GVariantSerialised value)
+ {
++  struct Offsets out = { 0, };
+   gsize offsets_array_size;
+-  gsize offset_size;
+   gsize last_end;
+
+   if (value.size == 0)
+-    return 0;
+-
+-  offset_size = gvs_get_offset_size (value.size);
++    {
++      out.is_normal = TRUE;
++      return out;
++    }
+
+-  last_end = gvs_read_unaligned_le (value.data + value.size -
+-                                    offset_size, offset_size);
++  out.offset_size = gvs_get_offset_size (value.size);
++  last_end = gvs_read_unaligned_le (value.data + value.size - out.offset_size,
++                                    out.offset_size);
+
+   if (last_end > value.size)
+-    return 0;
++    return out;  /* offsets not normal */
+
+   offsets_array_size = value.size - last_end;
+
+-  if (offsets_array_size % offset_size)
+-    return 0;
++  if (offsets_array_size % out.offset_size)
++    return out;  /* offsets not normal */
++
++  out.data_size = last_end;
++  out.array = value.data + last_end;
++  out.length = offsets_array_size / out.offset_size;
++  out.is_normal = TRUE;
+
+-  return offsets_array_size / offset_size;
++  return out;
++}
++
++static gsize
++gvs_variable_sized_array_n_children (GVariantSerialised value)
++{
++  return gvs_variable_sized_array_get_frame_offsets (value).length;
+ }
+
+ static GVariantSerialised
+@@ -664,8 +696,9 @@ gvs_variable_sized_array_get_child (GVariantSerialised value,
+                                     gsize              index_)
+ {
+   GVariantSerialised child = { 0, };
+-  gsize offset_size;
+-  gsize last_end;
++
++  struct Offsets offsets = gvs_variable_sized_array_get_frame_offsets (value);
++
+   gsize start;
+   gsize end;
+
+@@ -673,18 +706,11 @@ gvs_variable_sized_array_get_child (GVariantSerialised value,
+   g_variant_type_info_ref (child.type_info);
+   child.depth = value.depth + 1;
+
+-  offset_size = gvs_get_offset_size (value.size);
+-
+-  last_end = gvs_read_unaligned_le (value.data + value.size -
+-                                    offset_size, offset_size);
+-
+   if (index_ > 0)
+     {
+       guint alignment;
+
+-      start = gvs_read_unaligned_le (value.data + last_end +
+-                                     (offset_size * (index_ - 1)),
+-                                     offset_size);
++      start = gvs_offsets_get_offset_n (&offsets, index_ - 1);
+
+       g_variant_type_info_query (child.type_info, &alignment, NULL);
+       start += (-start) & alignment;
+@@ -692,11 +718,9 @@ gvs_variable_sized_array_get_child (GVariantSerialised value,
+   else
+     start = 0;
+
+-  end = gvs_read_unaligned_le (value.data + last_end +
+-                               (offset_size * index_),
+-                               offset_size);
++  end = gvs_offsets_get_offset_n (&offsets, index_);
+
+-  if (start < end && end <= value.size && end <= last_end)
++  if (start < end && end <= value.size && end <= offsets.data_size)
+     {
+       child.data = value.data + start;
+       child.size = end - start;
+@@ -768,34 +792,16 @@ static gboolean
+ gvs_variable_sized_array_is_normal (GVariantSerialised value)
+ {
+   GVariantSerialised child = { 0, };
+-  gsize offsets_array_size;
+-  guchar *offsets_array;
+-  guint offset_size;
+   guint alignment;
+-  gsize last_end;
+-  gsize length;
+   gsize offset;
+   gsize i;
+
+-  if (value.size == 0)
+-    return TRUE;
+-
+-  offset_size = gvs_get_offset_size (value.size);
+-  last_end = gvs_read_unaligned_le (value.data + value.size -
+-                                    offset_size, offset_size);
++  struct Offsets offsets = gvs_variable_sized_array_get_frame_offsets (value);
+
+-  if (last_end > value.size)
++  if (!offsets.is_normal)
+     return FALSE;
+
+-  offsets_array_size = value.size - last_end;
+-
+-  if (offsets_array_size % offset_size)
+-    return FALSE;
+-
+-  offsets_array = value.data + value.size - offsets_array_size;
+-  length = offsets_array_size / offset_size;
+-
+-  if (length == 0)
++  if (value.size != 0 && offsets.length == 0)
+     return FALSE;
+
+   child.type_info = g_variant_type_info_element (value.type_info);
+@@ -803,14 +809,14 @@ gvs_variable_sized_array_is_normal (GVariantSerialised value)
+   child.depth = value.depth + 1;
+   offset = 0;
+
+-  for (i = 0; i < length; i++)
++  for (i = 0; i < offsets.length; i++)
+     {
+       gsize this_end;
+
+-      this_end = gvs_read_unaligned_le (offsets_array + offset_size * i,
+-                                        offset_size);
++      this_end = gvs_read_unaligned_le (offsets.array + offsets.offset_size * i,
++                                        offsets.offset_size);
+
+-      if (this_end < offset || this_end > last_end)
++      if (this_end < offset || this_end > offsets.data_size)
+         return FALSE;
+
+       while (offset & alignment)
+@@ -832,7 +838,7 @@ gvs_variable_sized_array_is_normal (GVariantSerialised value)
+       offset = this_end;
+     }
+
+-  g_assert (offset == last_end);
++  g_assert (offset == offsets.data_size);
+
+   return TRUE;
+ }
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patch
new file mode 100644
index 0000000000..183c6b20e7
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0003.patch
@@ -0,0 +1,418 @@
+From ade71fb544391b2e33e1859645726bfee0d5eaaf Mon Sep 17 00:00:00 2001
+From: William Manley <will@stb-tester.com>
+Date: Wed, 16 Aug 2023 03:12:21 +0000
+Subject: [PATCH] gvariant: Don't allow child elements to overlap with each
+ other
+
+If different elements of a variable sized array can overlap with each
+other then we can cause a `GVariant` to normalise to a much larger type.
+
+This commit changes the behaviour of `GVariant` with non-normal form data. If
+an invalid frame offset is found all subsequent elements are given their
+default value.
+
+When retrieving an element at index `n` we scan the frame offsets up to index
+`n` and if they are not in order we return an element with the default value
+for that type.  This guarantees that elements don't overlap with each
+other.  We remember the offset we've scanned up to so we don't need to
+repeat this work on subsequent accesses.  We skip these checks for trusted
+data.
+
+Unfortunately this makes random access of untrusted data O(n) — at least
+on first access.  It doesn't affect the algorithmic complexity of accessing
+elements in order, such as when using the `GVariantIter` interface.  Also:
+the cost of validation will be amortised as the `GVariant` instance is
+continued to be used.
+
+I've implemented this with 4 different functions, 1 for each element size,
+rather than looping calling `gvs_read_unaligned_le` in the hope that the
+compiler will find it easy to optimise and should produce fairly tight
+code.
+
+Fixes: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/ade71fb544391b2e33e1859645726bfee0d5eaaf]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c       | 35 ++++++++++++++++
+ glib/gvariant-serialiser.c | 86 ++++++++++++++++++++++++++++++++++++--
+ glib/gvariant-serialiser.h |  8 ++++
+ glib/tests/gvariant.c      | 45 ++++++++++++++++++++
+ 4 files changed, 171 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index 496f2e2..4e0b2b5 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -65,6 +65,7 @@ struct _GVariant
+     {
+       GBytes *bytes;
+       gconstpointer data;
++      gsize ordered_offsets_up_to;
+     } serialised;
+
+     struct
+@@ -162,6 +163,24 @@ struct _GVariant
+  *                if .data pointed to the appropriate number of nul
+  *                bytes.
+  *
++ *     .ordered_offsets_up_to: If ordered_offsets_up_to == n this means that all
++ *                             the frame offsets up to and including the frame
++ *                             offset determining the end of element n are in
++ *                             order. This guarantees that the bytes of element
++ *                             n don't overlap with any previous element.
++ *
++ *                             For trusted data this is set to G_MAXSIZE and we
++ *                             don't check that the frame offsets are in order.
++ *
++ *                             Note: This doesn't imply the offsets are good in
++ *                             any way apart from their ordering.  In particular
++ *                             offsets may be out of bounds for this value or
++ *                             may imply that the data overlaps the frame
++ *                             offsets themselves.
++ *
++ *                             This field is only relevant for arrays of non
++ *                             fixed width types.
++ *
+  *   .tree: Only valid when the instance is in tree form.
+  *
+  *          Note that accesses from other threads could result in
+@@ -365,6 +384,7 @@ g_variant_to_serialised (GVariant *value)
+       (gpointer) value->contents.serialised.data,
+       value->size,
+       value->depth,
++      value->contents.serialised.ordered_offsets_up_to,
+     };
+     return serialised;
+   }
+@@ -396,6 +416,7 @@ g_variant_serialise (GVariant *value,
+   serialised.size = value->size;
+   serialised.data = data;
+   serialised.depth = value->depth;
++  serialised.ordered_offsets_up_to = 0;
+
+   children = (gpointer *) value->contents.tree.children;
+   n_children = value->contents.tree.n_children;
+@@ -439,6 +460,15 @@ g_variant_fill_gvs (GVariantSerialised *serialised,
+   g_assert (serialised->size == value->size);
+   serialised->depth = value->depth;
+
++  if (value->state & STATE_SERIALISED)
++    {
++      serialised->ordered_offsets_up_to = value->contents.serialised.ordered_offsets_up_to;
++    }
++  else
++    {
++      serialised->ordered_offsets_up_to = 0;
++    }
++
+   if (serialised->data)
+     /* g_variant_store() is a public API, so it
+      * it will reacquire the lock if it needs to.
+@@ -481,6 +511,7 @@ g_variant_ensure_serialised (GVariant *value)
+       bytes = g_bytes_new_take (data, value->size);
+       value->contents.serialised.data = g_bytes_get_data (bytes, NULL);
+       value->contents.serialised.bytes = bytes;
++      value->contents.serialised.ordered_offsets_up_to = G_MAXSIZE;
+       value->state |= STATE_SERIALISED;
+     }
+ }
+@@ -561,6 +592,7 @@ g_variant_new_from_bytes (const GVariantType *type,
+   serialised.type_info = value->type_info;
+   serialised.data = (guchar *) g_bytes_get_data (bytes, &serialised.size);
+   serialised.depth = 0;
++  serialised.ordered_offsets_up_to = trusted ? G_MAXSIZE : 0;
+
+   if (!g_variant_serialised_check (serialised))
+     {
+@@ -611,6 +643,8 @@ g_variant_new_from_bytes (const GVariantType *type,
+       value->contents.serialised.data = g_bytes_get_data (bytes, &value->size);
+     }
+
++  value->contents.serialised.ordered_offsets_up_to = trusted ? G_MAXSIZE : 0;
++
+   g_clear_pointer (&owned_bytes, g_bytes_unref);
+
+   return value;
+@@ -1130,6 +1164,7 @@ g_variant_get_child_value (GVariant *value,
+     child->contents.serialised.bytes =
+       g_bytes_ref (value->contents.serialised.bytes);
+     child->contents.serialised.data = s_child.data;
++    child->contents.serialised.ordered_offsets_up_to = s_child.ordered_offsets_up_to;
+
+     return child;
+   }
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index e71248e..6fb3f2f 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -1,6 +1,7 @@
+ /*
+  * Copyright © 2007, 2008 Ryan Lortie
+  * Copyright © 2010 Codethink Limited
++ * Copyright © 2020 William Manley
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -264,6 +265,7 @@ gvs_fixed_sized_maybe_get_child (GVariantSerialised value,
+   value.type_info = g_variant_type_info_element (value.type_info);
+   g_variant_type_info_ref (value.type_info);
+   value.depth++;
++  value.ordered_offsets_up_to = 0;
+
+   return value;
+ }
+@@ -295,7 +297,7 @@ gvs_fixed_sized_maybe_serialise (GVariantSerialised        value,
+ {
+   if (n_children)
+     {
+-      GVariantSerialised child = { NULL, value.data, value.size, value.depth + 1 };
++      GVariantSerialised child = { NULL, value.data, value.size, value.depth + 1, 0 };
+
+       gvs_filler (&child, children[0]);
+     }
+@@ -317,6 +319,7 @@ gvs_fixed_sized_maybe_is_normal (GVariantSerialised value)
+       /* proper element size: "Just".  recurse to the child. */
+       value.type_info = g_variant_type_info_element (value.type_info);
+       value.depth++;
++      value.ordered_offsets_up_to = 0;
+
+       return g_variant_serialised_is_normal (value);
+     }
+@@ -358,6 +361,7 @@ gvs_variable_sized_maybe_get_child (GVariantSerialised value,
+     value.data = NULL;
+
+   value.depth++;
++  value.ordered_offsets_up_to = 0;
+
+   return value;
+ }
+@@ -388,7 +392,7 @@ gvs_variable_sized_maybe_serialise (GVariantSerialised        value,
+ {
+   if (n_children)
+     {
+-      GVariantSerialised child = { NULL, value.data, value.size - 1, value.depth + 1 };
++      GVariantSerialised child = { NULL, value.data, value.size - 1, value.depth + 1, 0 };
+
+       /* write the data for the child.  */
+       gvs_filler (&child, children[0]);
+@@ -408,6 +412,7 @@ gvs_variable_sized_maybe_is_normal (GVariantSerialised value)
+   value.type_info = g_variant_type_info_element (value.type_info);
+   value.size--;
+   value.depth++;
++  value.ordered_offsets_up_to = 0;
+
+   return g_variant_serialised_is_normal (value);
+ }
+@@ -691,6 +696,32 @@ gvs_variable_sized_array_n_children (GVariantSerialised value)
+   return gvs_variable_sized_array_get_frame_offsets (value).length;
+ }
+
++/* Find the index of the first out-of-order element in @data, assuming that
++ * @data is an array of elements of given @type, starting at index @start and
++ * containing a further @len-@start elements. */
++#define DEFINE_FIND_UNORDERED(type) \
++  static gsize \
++  find_unordered_##type (const guint8 *data, gsize start, gsize len) \
++  { \
++    gsize off; \
++    type current, previous; \
++    \
++    memcpy (&previous, data + start * sizeof (current), sizeof (current)); \
++    for (off = (start + 1) * sizeof (current); off < len * sizeof (current); off += sizeof (current)) \
++      { \
++        memcpy (&current, data + off, sizeof (current)); \
++        if (current < previous) \
++          break; \
++        previous = current; \
++      } \
++    return off / sizeof (current) - 1; \
++  }
++
++DEFINE_FIND_UNORDERED (guint8);
++DEFINE_FIND_UNORDERED (guint16);
++DEFINE_FIND_UNORDERED (guint32);
++DEFINE_FIND_UNORDERED (guint64);
++
+ static GVariantSerialised
+ gvs_variable_sized_array_get_child (GVariantSerialised value,
+                                     gsize              index_)
+@@ -706,6 +737,49 @@ gvs_variable_sized_array_get_child (GVariantSerialised value,
+   g_variant_type_info_ref (child.type_info);
+   child.depth = value.depth + 1;
+
++  /* If the requested @index_ is beyond the set of indices whose framing offsets
++   * have been checked, check the remaining offsets to see whether they’re
++   * normal (in order, no overlapping array elements). */
++  if (index_ > value.ordered_offsets_up_to)
++    {
++      switch (offsets.offset_size)
++        {
++        case 1:
++          {
++            value.ordered_offsets_up_to = find_unordered_guint8 (
++                offsets.array, value.ordered_offsets_up_to, index_ + 1);
++            break;
++          }
++        case 2:
++          {
++            value.ordered_offsets_up_to = find_unordered_guint16 (
++                offsets.array, value.ordered_offsets_up_to, index_ + 1);
++            break;
++          }
++        case 4:
++          {
++            value.ordered_offsets_up_to = find_unordered_guint32 (
++                offsets.array, value.ordered_offsets_up_to, index_ + 1);
++            break;
++          }
++        case 8:
++          {
++            value.ordered_offsets_up_to = find_unordered_guint64 (
++                offsets.array, value.ordered_offsets_up_to, index_ + 1);
++            break;
++          }
++        default:
++          /* gvs_get_offset_size() only returns maximum 8 */
++          g_assert_not_reached ();
++        }
++    }
++
++  if (index_ > value.ordered_offsets_up_to)
++    {
++      /* Offsets are invalid somewhere, so return an empty child. */
++      return child;
++    }
++
+   if (index_ > 0)
+     {
+       guint alignment;
+@@ -840,6 +914,9 @@ gvs_variable_sized_array_is_normal (GVariantSerialised value)
+
+   g_assert (offset == offsets.data_size);
+
++  /* All offsets have now been checked. */
++  value.ordered_offsets_up_to = G_MAXSIZE;
++
+   return TRUE;
+ }
+
+@@ -1072,7 +1149,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+   for (i = 0; i < length; i++)
+     {
+       const GVariantMemberInfo *member_info;
+-      GVariantSerialised child;
++      GVariantSerialised child = { 0, };
+       gsize fixed_size;
+       guint alignment;
+       gsize end;
+@@ -1132,6 +1209,9 @@ gvs_tuple_is_normal (GVariantSerialised value)
+       offset = end;
+     }
+
++  /* All element bounds have been checked above. */
++  value.ordered_offsets_up_to = G_MAXSIZE;
++
+   {
+     gsize fixed_size;
+     guint alignment;
+diff --git a/glib/gvariant-serialiser.h b/glib/gvariant-serialiser.h
+index 859cb7b..3ab83b3 100644
+--- a/glib/gvariant-serialiser.h
++++ b/glib/gvariant-serialiser.h
+@@ -29,6 +29,14 @@ typedef struct
+   guchar           *data;
+   gsize             size;
+   gsize             depth;  /* same semantics as GVariant.depth */
++  /* If ordered_offsets_up_to == n this means that all the frame offsets up to and
++   * including the frame offset determining the end of element n are in order.
++   * This guarantees that the bytes of element n don't overlap with any previous
++   * element.
++   *
++   * This is both read and set by g_variant_serialised_get_child for arrays of
++   * non-fixed-width types */
++  gsize             ordered_offsets_up_to;
+ } GVariantSerialised;
+
+ /* deserialization */
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 0110f26..291f796 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -1,5 +1,6 @@
+ /*
+  * Copyright © 2010 Codethink Limited
++ * Copyright © 2020 William Manley
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -1279,6 +1280,7 @@ random_instance_filler (GVariantSerialised *serialised,
+     serialised->size = instance->size;
+
+   serialised->depth = 0;
++  serialised->ordered_offsets_up_to = 0;
+
+   g_assert_true (serialised->type_info == instance->type_info);
+   g_assert_cmpuint (serialised->size, ==, instance->size);
+@@ -5023,6 +5025,47 @@ test_normal_checking_array_offsets (void)
+   g_variant_unref (variant);
+ }
+
++/* This is a regression test that we can't have non-normal values that take up
++ * significantly more space than the normal equivalent, by specifying the
++ * offset table entries so that array elements overlap.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_832242 */
++static void
++test_normal_checking_array_offsets2 (void)
++{
++  const guint8 data[] = {
++    'h', 'i', '\0',
++    0x03, 0x00, 0x03,
++    0x06, 0x00, 0x06,
++    0x09, 0x00, 0x09,
++    0x0c, 0x00, 0x0c,
++    0x0f, 0x00, 0x0f,
++    0x12, 0x00, 0x12,
++    0x15, 0x00, 0x15,
++  };
++  gsize size = sizeof (data);
++  const GVariantType *aaaaaaas = G_VARIANT_TYPE ("aaaaaaas");
++  GVariant *variant = NULL;
++  GVariant *normal_variant = NULL;
++  GVariant *expected = NULL;
++
++  variant = g_variant_new_from_data (aaaaaaas, data, size, FALSE, NULL, NULL);
++  g_assert_nonnull (variant);
++
++  normal_variant = g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++  g_assert_cmpuint (g_variant_get_size (normal_variant), <=, size * 2);
++
++  expected = g_variant_new_parsed (
++      "[[[[[[['hi', '', ''], [], []], [], []], [], []], [], []], [], []], [], []]");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
+ /* Test that a tuple with invalidly large values in its offset table is
+  * normalised successfully without looping infinitely. */
+ static void
+@@ -5189,6 +5232,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuples);
+   g_test_add_func ("/gvariant/normal-checking/array-offsets",
+                    test_normal_checking_array_offsets);
++  g_test_add_func ("/gvariant/normal-checking/array-offsets2",
++                   test_normal_checking_array_offsets2);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets",
+                    test_normal_checking_tuple_offsets);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patch
new file mode 100644
index 0000000000..791efdee87
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0004.patch
@@ -0,0 +1,114 @@
+From 345cae9c1aa7bf6752039225ef4c8d8d69fa8d76 Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Fri, 11 Aug 2023 04:09:12 +0000
+Subject: [PATCH] gvariant-serialiser: Factor out code to get bounds of a tuple
+ member
+
+This introduces no functional changes.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/345cae9c1aa7bf6752039225ef4c8d8d69fa8d76]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c | 73 ++++++++++++++++++++++++--------------
+ 1 file changed, 46 insertions(+), 27 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 2932427..1c23eab 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -946,6 +946,51 @@ gvs_variable_sized_array_is_normal (GVariantSerialised value)
+  * for the tuple.  See the notes in gvarianttypeinfo.h.
+  */
+
++static void
++gvs_tuple_get_member_bounds (GVariantSerialised  value,
++                             gsize               index_,
++                             gsize               offset_size,
++                             gsize              *out_member_start,
++                             gsize              *out_member_end)
++{
++  const GVariantMemberInfo *member_info;
++  gsize member_start, member_end;
++
++  member_info = g_variant_type_info_member_info (value.type_info, index_);
++
++  if (member_info->i + 1)
++    member_start = gvs_read_unaligned_le (value.data + value.size -
++                                          offset_size * (member_info->i + 1),
++                                          offset_size);
++  else
++    member_start = 0;
++
++  member_start += member_info->a;
++  member_start &= member_info->b;
++  member_start |= member_info->c;
++
++  if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_LAST)
++    member_end = value.size - offset_size * (member_info->i + 1);
++
++  else if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_FIXED)
++    {
++      gsize fixed_size;
++
++      g_variant_type_info_query (member_info->type_info, NULL, &fixed_size);
++      member_end = member_start + fixed_size;
++    }
++
++  else /* G_VARIANT_MEMBER_ENDING_OFFSET */
++    member_end = gvs_read_unaligned_le (value.data + value.size -
++                                        offset_size * (member_info->i + 2),
++                                        offset_size);
++
++  if (out_member_start != NULL)
++    *out_member_start = member_start;
++  if (out_member_end != NULL)
++    *out_member_end = member_end;
++}
++
+ static gsize
+ gvs_tuple_n_children (GVariantSerialised value)
+ {
+@@ -1001,33 +1046,7 @@ gvs_tuple_get_child (GVariantSerialised value,
+         }
+     }
+
+-  if (member_info->i + 1)
+-    start = gvs_read_unaligned_le (value.data + value.size -
+-                                   offset_size * (member_info->i + 1),
+-                                   offset_size);
+-  else
+-    start = 0;
+-
+-  start += member_info->a;
+-  start &= member_info->b;
+-  start |= member_info->c;
+-
+-  if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_LAST)
+-    end = value.size - offset_size * (member_info->i + 1);
+-
+-  else if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_FIXED)
+-    {
+-      gsize fixed_size;
+-
+-      g_variant_type_info_query (child.type_info, NULL, &fixed_size);
+-      end = start + fixed_size;
+-      child.size = fixed_size;
+-    }
+-
+-  else /* G_VARIANT_MEMBER_ENDING_OFFSET */
+-    end = gvs_read_unaligned_le (value.data + value.size -
+-                                 offset_size * (member_info->i + 2),
+-                                 offset_size);
++  gvs_tuple_get_member_bounds (value, index_, offset_size, &start, &end);
+
+   /* The child should not extend into the offset table. */
+   if (index_ != g_variant_type_info_n_members (value.type_info) - 1)
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patch
new file mode 100644
index 0000000000..6c71c20819
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0005.patch
@@ -0,0 +1,81 @@
+From 73d0aa81c2575a5c9ae77dcb94da919579014fc0 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Fri, 11 Aug 2023 04:13:02 +0000
+Subject: [PATCH] gvariant-serialiser: Rework child size calculation
+
+This reduces a few duplicate calls to `g_variant_type_info_query()` and
+explains why they’re needed.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/73d0aa81c2575a5c9ae77dcb94da919579014fc0]
+
+Signed-off-by: Soumya <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c | 31 +++++++++----------------------
+ 1 file changed, 9 insertions(+), 22 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 1c23eab..b63e99f 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -1011,14 +1011,18 @@ gvs_tuple_get_child (GVariantSerialised value,
+   child.depth = value.depth + 1;
+   offset_size = gvs_get_offset_size (value.size);
+
++  /* Ensure the size is set for fixed-sized children, or
++   * g_variant_serialised_check() will fail, even if we return
++   * (child.data == NULL) to indicate an error. */
++  if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_FIXED)
++    g_variant_type_info_query (child.type_info, NULL, &child.size);
++
+   /* tuples are the only (potentially) fixed-sized containers, so the
+    * only ones that have to deal with the possibility of having %NULL
+    * data with a non-zero %size if errors occurred elsewhere.
+    */
+   if G_UNLIKELY (value.data == NULL && value.size != 0)
+     {
+-      g_variant_type_info_query (child.type_info, NULL, &child.size);
+-
+       /* this can only happen in fixed-sized tuples,
+        * so the child must also be fixed sized.
+        */
+@@ -1036,29 +1040,12 @@ gvs_tuple_get_child (GVariantSerialised value,
+   else
+     {
+       if (offset_size * (member_info->i + 1) > value.size)
+-        {
+-          /* if the child is fixed size, return its size.
+-           * if child is not fixed-sized, return size = 0.
+-           */
+-          g_variant_type_info_query (child.type_info, NULL, &child.size);
+-
+-          return child;
+-        }
++        return child;
+     }
+
+-  gvs_tuple_get_member_bounds (value, index_, offset_size, &start, &end);
+-
+   /* The child should not extend into the offset table. */
+-  if (index_ != g_variant_type_info_n_members (value.type_info) - 1)
+-    {
+-      GVariantSerialised last_child;
+-      last_child = gvs_tuple_get_child (value,
+-                                        g_variant_type_info_n_members (value.type_info) - 1);
+-      last_end = last_child.data + last_child.size - value.data;
+-      g_variant_type_info_unref (last_child.type_info);
+-    }
+-  else
+-    last_end = end;
++  gvs_tuple_get_member_bounds (value, index_, offset_size, &start, &end);
++  gvs_tuple_get_member_bounds (value, g_variant_type_info_n_members (value.type_info) - 1, offset_size, NULL, &last_end);
+
+   if (start < end && end <= value.size && end <= last_end)
+     {
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patch
new file mode 100644
index 0000000000..194ce15287
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0006.patch
@@ -0,0 +1,397 @@
+From 7cf6f5b69146d20948d42f0c476688fe17fef787 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 16 Aug 2023 12:09:06 +0000
+Subject: [PATCH] gvariant: Don't allow child elements of a tuple to overlap
+ each other
+
+This is similar to the earlier commit which prevents child elements of a
+variable-sized array from overlapping each other, but this time for
+tuples. It is based heavily on ideas by William Manley.
+
+Tuples are slightly different from variable-sized arrays in that they
+contain a mixture of fixed and variable sized elements. All but one of
+the variable sized elements have an entry in the frame offsets table.
+This means that if we were to just check the ordering of the frame
+offsets table, the variable sized elements could still overlap
+interleaving fixed sized elements, which would be bad.
+
+Therefore we have to check the elements rather than the frame offsets.
+
+The logic of checking the elements up to the index currently being
+requested, and caching the result in `ordered_offsets_up_to`, means that
+the algorithmic cost implications are the same for this commit as for
+variable-sized arrays: an O(N) cost for these checks is amortised out
+over N accesses to O(1) per access.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7cf6f5b69146d20948d42f0c476688fe17fef787]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c       |   6 +-
+ glib/gvariant-serialiser.c |  40 ++++++++
+ glib/gvariant-serialiser.h |   7 +-
+ glib/gvariant.c            |   1 +
+ glib/tests/gvariant.c      | 181 +++++++++++++++++++++++++++++++++++++
+ 5 files changed, 232 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index 4e0b2b5..c57ee77 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -1,6 +1,7 @@
+ /*
+  * Copyright © 2007, 2008 Ryan Lortie
+  * Copyright © 2010 Codethink Limited
++ * Copyright © 2022 Endless OS Foundation, LLC
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -179,7 +180,7 @@ struct _GVariant
+  *                             offsets themselves.
+  *
+  *                             This field is only relevant for arrays of non
+- *                             fixed width types.
++ *                             fixed width types and for tuples.
+  *
+  *   .tree: Only valid when the instance is in tree form.
+  *
+@@ -1139,6 +1140,9 @@ g_variant_get_child_value (GVariant *value,
+      */
+     s_child = g_variant_serialised_get_child (serialised, index_);
+
++    /* Update the cached ordered_offsets_up_to, since @serialised will be thrown away when this function exits */
++    value->contents.serialised.ordered_offsets_up_to = MAX (value->contents.serialised.ordered_offsets_up_to, serialised.ordered_offsets_up_to);
++
+     /* Check whether this would cause nesting too deep. If so, return a fake
+      * child. The only situation we expect this to happen in is with a variant,
+      * as all other deeply-nested types have a static type, and hence should
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 2493e76..d46d05c 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -942,6 +942,10 @@ gvs_variable_sized_array_is_normal (GVariantSerialised value)
+  * for the tuple.  See the notes in gvarianttypeinfo.h.
+  */
+
++/* Note: This doesn’t guarantee that @out_member_end >= @out_member_start; that
++ * condition may not hold true for invalid serialised variants. The caller is
++ * responsible for checking the returned values and handling invalid ones
++ * appropriately. */
+ static void
+ gvs_tuple_get_member_bounds (GVariantSerialised  value,
+                              gsize               index_,
+@@ -1028,6 +1032,42 @@ gvs_tuple_get_child (GVariantSerialised value,
+       return child;
+     }
+
++  /* If the requested @index_ is beyond the set of indices whose framing offsets
++   * have been checked, check the remaining offsets to see whether they’re
++   * normal (in order, no overlapping tuple elements).
++   *
++   * Unlike the checks in gvs_variable_sized_array_get_child(), we have to check
++   * all the tuple *elements* here, not just all the framing offsets, since
++   * tuples contain a mix of elements which use framing offsets and ones which
++   * don’t. None of them are allowed to overlap. */
++  if (index_ > value.ordered_offsets_up_to)
++    {
++      gsize i, prev_i_end = 0;
++
++      if (value.ordered_offsets_up_to > 0)
++        gvs_tuple_get_member_bounds (value, value.ordered_offsets_up_to - 1, offset_size, NULL, &prev_i_end);
++
++      for (i = value.ordered_offsets_up_to; i <= index_; i++)
++        {
++          gsize i_start, i_end;
++
++          gvs_tuple_get_member_bounds (value, i, offset_size, &i_start, &i_end);
++
++          if (i_start > i_end || i_start < prev_i_end || i_end > value.size)
++            break;
++
++          prev_i_end = i_end;
++        }
++
++      value.ordered_offsets_up_to = i - 1;
++    }
++
++  if (index_ > value.ordered_offsets_up_to)
++    {
++      /* Offsets are invalid somewhere, so return an empty child. */
++      return child;
++    }
++
+   if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_OFFSET)
+     {
+       if (offset_size * (member_info->i + 2) > value.size)
+diff --git a/glib/gvariant-serialiser.h b/glib/gvariant-serialiser.h
+index 3ab83b3..03826f9 100644
+--- a/glib/gvariant-serialiser.h
++++ b/glib/gvariant-serialiser.h
+@@ -34,8 +34,11 @@ typedef struct
+    * This guarantees that the bytes of element n don't overlap with any previous
+    * element.
+    *
+-   * This is both read and set by g_variant_serialised_get_child for arrays of
+-   * non-fixed-width types */
++   * This is both read and set by g_variant_serialised_get_child() for arrays of
++   * non-fixed-width types, and for tuples.
++   *
++   * Even when dealing with tuples, @ordered_offsets_up_to is an element index,
++   * rather than an index into the frame offsets. */
+   gsize             ordered_offsets_up_to;
+ } GVariantSerialised;
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 42ffc9a..f645e05 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5997,6 +5997,7 @@ g_variant_byteswap (GVariant *value)
+       serialised.size = g_variant_get_size (trusted);
+       serialised.data = g_malloc (serialised.size);
+       serialised.depth = g_variant_get_depth (trusted);
++      serialised.ordered_offsets_up_to = G_MAXSIZE;  /* operating on the normal form */
+       g_variant_store (trusted, serialised.data);
+       g_variant_unref (trusted);
+
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 291f796..3ddff96 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -1,6 +1,7 @@
+ /*
+  * Copyright © 2010 Codethink Limited
+  * Copyright © 2020 William Manley
++ * Copyright © 2022 Endless OS Foundation, LLC
+  *
+  * This library is free software; you can redistribute it and/or
+  * modify it under the terms of the GNU Lesser General Public
+@@ -1447,6 +1448,7 @@ test_maybe (void)
+         serialised.data = flavoured_malloc (needed_size, flavour);
+         serialised.size = needed_size;
+         serialised.depth = 0;
++	serialised.ordered_offsets_up_to = 0;
+
+         g_variant_serialiser_serialise (serialised,
+                                         random_instance_filler,
+@@ -1570,6 +1572,7 @@ test_array (void)
+         serialised.data = flavoured_malloc (needed_size, flavour);
+         serialised.size = needed_size;
+         serialised.depth = 0;
++	serialised.ordered_offsets_up_to = 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_filler,
+                                         (gpointer *) instances, n_children);
+@@ -1734,6 +1737,7 @@ test_tuple (void)
+         serialised.data = flavoured_malloc (needed_size, flavour);
+         serialised.size = needed_size;
+         serialised.depth = 0;
++	serialised.ordered_offsets_up_to = 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_filler,
+                                         (gpointer *) instances, n_children);
+@@ -1830,6 +1834,7 @@ test_variant (void)
+         serialised.data = flavoured_malloc (needed_size, flavour);
+         serialised.size = needed_size;
+         serialised.depth = 0;
++	serialised.ordered_offsets_up_to = 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_filler,
+                                         (gpointer *) &instance, 1);
+@@ -5090,6 +5095,176 @@ test_normal_checking_tuple_offsets (void)
+   g_variant_unref (variant);
+ }
+
++/* This is a regression test that we can't have non-normal values that take up
++ * significantly more space than the normal equivalent, by specifying the
++ * offset table entries so that tuple elements overlap.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_838503 and
++ * https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_838513 */
++static void
++test_normal_checking_tuple_offsets2 (void)
++{
++  const GVariantType *data_type = G_VARIANT_TYPE ("(yyaiyyaiyy)");
++  const guint8 data[] = {
++    0x12, 0x34, 0x56, 0x78, 0x01,
++    /*
++         ^───────────────────┘
++
++    ^^^^^^^^^^                   1st yy
++          ^^^^^^^^^^             2nd yy
++                ^^^^^^^^^^       3rd yy
++                            ^^^^ Framing offsets
++     */
++
++  /* If this variant was encoded normally, it would be something like this:
++   * 0x12, 0x34,  pad,  pad, [array bytes], 0x56, 0x78,  pad,  pad, [array bytes], 0x9A, 0xBC, 0xXX
++   *                                      ^─────────────────────────────────────────────────────┘
++   *
++   * ^^^^^^^^^^                                                                                     1st yy
++   *                                        ^^^^^^^^^^                                              2nd yy
++   *                                                                               ^^^^^^^^^^       3rd yy
++   *                                                                                           ^^^^ Framing offsets
++   */
++  };
++  gsize size = sizeof (data);
++  GVariant *variant = NULL;
++  GVariant *normal_variant = NULL;
++  GVariant *expected = NULL;
++
++  variant = g_variant_new_from_data (data_type, data, size, FALSE, NULL, NULL);
++  g_assert_nonnull (variant);
++
++  normal_variant = g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++  g_assert_cmpuint (g_variant_get_size (normal_variant), <=, size * 3);
++
++  expected = g_variant_new_parsed (
++      "@(yyaiyyaiyy) (0x12, 0x34, [], 0x00, 0x00, [], 0x00, 0x00)");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
++/* This is a regression test that overlapping entries in the offset table are
++ * decoded consistently, even though they’re non-normal.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_910935 */
++static void
++test_normal_checking_tuple_offsets3 (void)
++{
++  /* The expected decoding of this non-normal byte stream is complex. See
++   * section 2.7.3 (Handling Non-Normal Serialised Data) of the GVariant
++   * specification.
++   *
++   * The rule “Child Values Overlapping Framing Offsets” from the specification
++   * says that the first `ay` must be decoded as `[0x01]` even though it
++   * overlaps the first byte of the offset table. However, since commit
++   * 7eedcd76f7d5b8c98fa60013e1fe6e960bf19df3, GLib explicitly doesn’t allow
++   * this as it’s exploitable. So the first `ay` must be given a default value.
++   *
++   * The second and third `ay`s must be given default values because of rule
++   * “End Boundary Precedes Start Boundary”.
++   *
++   * The `i` must be given a default value because of rule “Start or End
++   * Boundary of a Child Falls Outside the Container”.
++   */
++  const GVariantType *data_type = G_VARIANT_TYPE ("(ayayiay)");
++  const guint8 data[] = {
++    0x01, 0x00, 0x02,
++    /*
++               ^──┘
++
++    ^^^^^^^^^^                   1st ay, bytes 0-2 (but given a default value anyway, see above)
++                                 2nd ay, bytes 2-0
++                                     i,  bytes 0-4
++                                 3rd ay, bytes 4-1
++          ^^^^^^^^^^ Framing offsets
++     */
++  };
++  gsize size = sizeof (data);
++  GVariant *variant = NULL;
++  GVariant *normal_variant = NULL;
++  GVariant *expected = NULL;
++
++  variant = g_variant_new_from_data (data_type, data, size, FALSE, NULL, NULL);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant = g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++  g_assert_cmpuint (g_variant_get_size (normal_variant), <=, size * 3);
++
++  expected = g_variant_new_parsed ("@(ayayiay) ([], [], 0, [])");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
++/* This is a regression test that overlapping entries in the offset table are
++ * decoded consistently, even though they’re non-normal.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2121#note_910935 */
++static void
++test_normal_checking_tuple_offsets4 (void)
++{
++  /* The expected decoding of this non-normal byte stream is complex. See
++   * section 2.7.3 (Handling Non-Normal Serialised Data) of the GVariant
++   * specification.
++   *
++   * The rule “Child Values Overlapping Framing Offsets” from the specification
++   * says that the first `ay` must be decoded as `[0x01]` even though it
++   * overlaps the first byte of the offset table. However, since commit
++   * 7eedcd76f7d5b8c98fa60013e1fe6e960bf19df3, GLib explicitly doesn’t allow
++   * this as it’s exploitable. So the first `ay` must be given a default value.
++   *
++   * The second `ay` must be given a default value because of rule “End Boundary
++   * Precedes Start Boundary”.
++   *
++   * The third `ay` must be given a default value because its framing offsets
++   * overlap that of the first `ay`.
++   */
++  const GVariantType *data_type = G_VARIANT_TYPE ("(ayayay)");
++  const guint8 data[] = {
++    0x01, 0x00, 0x02,
++    /*
++               ^──┘
++
++    ^^^^^^^^^^                   1st ay, bytes 0-2 (but given a default value anyway, see above)
++                                 2nd ay, bytes 2-0
++                                 3rd ay, bytes 0-1
++          ^^^^^^^^^^ Framing offsets
++     */
++  };
++  gsize size = sizeof (data);
++  GVariant *variant = NULL;
++  GVariant *normal_variant = NULL;
++  GVariant *expected = NULL;
++
++  variant = g_variant_new_from_data (data_type, data, size, FALSE, NULL, NULL);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant = g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++  g_assert_cmpuint (g_variant_get_size (normal_variant), <=, size * 3);
++
++  expected = g_variant_new_parsed ("@(ayayay) ([], [], [])");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
+ /* Test that an empty object path is normalised successfully to the base object
+  * path, ‘/’. */
+ static void
+@@ -5236,6 +5411,12 @@ main (int argc, char **argv)
+                    test_normal_checking_array_offsets2);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets",
+                    test_normal_checking_tuple_offsets);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets2",
++                   test_normal_checking_tuple_offsets2);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets3",
++                   test_normal_checking_tuple_offsets3);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets4",
++                   test_normal_checking_tuple_offsets4);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+                    test_normal_checking_empty_object_path);
+
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patch
new file mode 100644
index 0000000000..8a408ab030
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0007.patch
@@ -0,0 +1,50 @@
+From e6490c84e84ba9f182fbd83b51ff4f9f5a0a1793 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Wed, 16 Aug 2023 03:42:47 +0000
+Subject: [PATCH] gvariant: Port g_variant_deep_copy() to count its iterations
+ directly
+
+This is equivalent to what `GVariantIter` does, but it means that
+`g_variant_deep_copy()` is making its own `g_variant_get_child_value()`
+calls.
+
+This will be useful in an upcoming commit, where those child values will
+be inspected a little more deeply.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/e6490c84e84ba9f182fbd83b51ff4f9f5a0a1793]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 42ffc9a..ca13cc1 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5850,14 +5850,13 @@ g_variant_deep_copy (GVariant *value)
+     case G_VARIANT_CLASS_VARIANT:
+       {
+         GVariantBuilder builder;
+-        GVariantIter iter;
+-        GVariant *child;
++        gsize i, n_children;
+
+         g_variant_builder_init (&builder, g_variant_get_type (value));
+-        g_variant_iter_init (&iter, value);
+
+-        while ((child = g_variant_iter_next_value (&iter)))
++        for (i = 0, n_children = g_variant_n_children (value); i < n_children; i++)
+           {
++            GVariant *child = g_variant_get_child_value (value, i);
+             g_variant_builder_add_value (&builder, g_variant_deep_copy (child));
+             g_variant_unref (child);
+           }
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patch
new file mode 100644
index 0000000000..9b074a543d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0008.patch
@@ -0,0 +1,395 @@
+From d1a293c4e29880b8d17bb826c9a426a440ca4a91 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 01:30:38 +0000
+Subject: [PATCH] gvariant: Track checked and ordered offsets independently
+
+The past few commits introduced the concept of known-good offsets in the
+offset table (which is used for variable-width arrays and tuples).
+Good offsets are ones which are non-overlapping with all the previous
+offsets in the table.
+
+If a bad offset is encountered when indexing into the array or tuple,
+the cached known-good offset index will not be increased. In this way,
+all child variants at and beyond the first bad offset can be returned as
+default values rather than dereferencing potentially invalid data.
+
+In this case, there was no information about the fact that the indexes
+between the highest known-good index and the requested one had been
+checked already. That could lead to a pathological case where an offset
+table with an invalid first offset is repeatedly checked in full when
+trying to access higher-indexed children.
+
+Avoid that by storing the index of the highest checked offset in the
+table, as well as the index of the highest good/ordered offset.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/d1a293c4e29880b8d17bb826c9a426a440ca4a91]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c       | 28 ++++++++++++++++++++++++
+ glib/gvariant-serialiser.c | 44 +++++++++++++++++++++++++++-----------
+ glib/gvariant-serialiser.h |  9 ++++++++
+ glib/gvariant.c            |  1 +
+ glib/tests/gvariant.c      |  5 +++++
+ 5 files changed, 75 insertions(+), 12 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index c57ee77..7b71efc 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -67,6 +67,7 @@ struct _GVariant
+       GBytes *bytes;
+       gconstpointer data;
+       gsize ordered_offsets_up_to;
++      gsize checked_offsets_up_to;
+     } serialised;
+
+     struct
+@@ -182,6 +183,24 @@ struct _GVariant
+  *                             This field is only relevant for arrays of non
+  *                             fixed width types and for tuples.
+  *
++ *     .checked_offsets_up_to: Similarly to .ordered_offsets_up_to, this stores
++ *                             the index of the highest element, n, whose frame
++ *                             offsets (and all the preceding frame offsets)
++ *                             have been checked for validity.
++ *
++ *                             It is always the case that
++ *                             .checked_offsets_up_to ≥ .ordered_offsets_up_to.
++ *
++ *                             If .checked_offsets_up_to == .ordered_offsets_up_to,
++ *                             then a bad offset has not been found so far.
++ *
++ *                             If .checked_offsets_up_to > .ordered_offsets_up_to,
++ *                             then a bad offset has been found at
++ *                             (.ordered_offsets_up_to + 1).
++ *
++ *                             This field is only relevant for arrays of non
++ *                             fixed width types and for tuples.
++ *
+  *   .tree: Only valid when the instance is in tree form.
+  *
+  *          Note that accesses from other threads could result in
+@@ -386,6 +405,7 @@ g_variant_to_serialised (GVariant *value)
+       value->size,
+       value->depth,
+       value->contents.serialised.ordered_offsets_up_to,
++      value->contents.serialised.checked_offsets_up_to,
+     };
+     return serialised;
+   }
+@@ -418,6 +438,7 @@ g_variant_serialise (GVariant *value,
+   serialised.data = data;
+   serialised.depth = value->depth;
+   serialised.ordered_offsets_up_to = 0;
++  serialised.checked_offsets_up_to = 0;
+
+   children = (gpointer *) value->contents.tree.children;
+   n_children = value->contents.tree.n_children;
+@@ -464,10 +485,12 @@ g_variant_fill_gvs (GVariantSerialised *serialised,
+   if (value->state & STATE_SERIALISED)
+     {
+       serialised->ordered_offsets_up_to = value->contents.serialised.ordered_offsets_up_to;
++      serialised->checked_offsets_up_to = value->contents.serialised.checked_offsets_up_to;
+     }
+   else
+     {
+       serialised->ordered_offsets_up_to = 0;
++      serialised->checked_offsets_up_to = 0;
+     }
+
+   if (serialised->data)
+@@ -513,6 +536,7 @@ g_variant_ensure_serialised (GVariant *value)
+       value->contents.serialised.data = g_bytes_get_data (bytes, NULL);
+       value->contents.serialised.bytes = bytes;
+       value->contents.serialised.ordered_offsets_up_to = G_MAXSIZE;
++      value->contents.serialised.checked_offsets_up_to = G_MAXSIZE;
+       value->state |= STATE_SERIALISED;
+     }
+ }
+@@ -594,6 +618,7 @@ g_variant_new_from_bytes (const GVariantType *type,
+   serialised.data = (guchar *) g_bytes_get_data (bytes, &serialised.size);
+   serialised.depth = 0;
+   serialised.ordered_offsets_up_to = trusted ? G_MAXSIZE : 0;
++  serialised.checked_offsets_up_to = trusted ? G_MAXSIZE : 0;
+
+   if (!g_variant_serialised_check (serialised))
+     {
+@@ -645,6 +670,7 @@ g_variant_new_from_bytes (const GVariantType *type,
+     }
+
+   value->contents.serialised.ordered_offsets_up_to = trusted ? G_MAXSIZE : 0;
++  value->contents.serialised.checked_offsets_up_to = trusted ? G_MAXSIZE : 0;
+
+   g_clear_pointer (&owned_bytes, g_bytes_unref);
+
+@@ -1142,6 +1168,7 @@ g_variant_get_child_value (GVariant *value,
+
+     /* Update the cached ordered_offsets_up_to, since @serialised will be thrown away when this function exits */
+     value->contents.serialised.ordered_offsets_up_to = MAX (value->contents.serialised.ordered_offsets_up_to, serialised.ordered_offsets_up_to);
++    value->contents.serialised.checked_offsets_up_to = MAX (value->contents.serialised.checked_offsets_up_to, serialised.checked_offsets_up_to);
+
+     /* Check whether this would cause nesting too deep. If so, return a fake
+      * child. The only situation we expect this to happen in is with a variant,
+@@ -1169,6 +1196,7 @@ g_variant_get_child_value (GVariant *value,
+       g_bytes_ref (value->contents.serialised.bytes);
+     child->contents.serialised.data = s_child.data;
+     child->contents.serialised.ordered_offsets_up_to = s_child.ordered_offsets_up_to;
++    child->contents.serialised.checked_offsets_up_to = s_child.checked_offsets_up_to;
+
+     return child;
+   }
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index d46d05c..9c7f12a 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -120,6 +120,8 @@
+  *
+  * @depth has no restrictions; the depth of a top-level serialized #GVariant is
+  * zero, and it increases for each level of nested child.
++ *
++ * @checked_offsets_up_to is always ≥ @ordered_offsets_up_to
+  */
+
+ /* < private >
+@@ -147,6 +149,9 @@ g_variant_serialised_check (GVariantSerialised serialised)
+            !(serialised.size == 0 || serialised.data != NULL))
+     return FALSE;
+
++  if (serialised.ordered_offsets_up_to > serialised.checked_offsets_up_to)
++    return FALSE;
++
+   /* Depending on the native alignment requirements of the machine, the
+    * compiler will insert either 3 or 7 padding bytes after the char.
+    * This will result in the sizeof() the struct being 12 or 16.
+@@ -266,6 +271,7 @@ gvs_fixed_sized_maybe_get_child (GVariantSerialised value,
+   g_variant_type_info_ref (value.type_info);
+   value.depth++;
+   value.ordered_offsets_up_to = 0;
++  value.checked_offsets_up_to = 0;
+
+   return value;
+ }
+@@ -297,7 +303,7 @@ gvs_fixed_sized_maybe_serialise (GVariantSerialised        value,
+ {
+   if (n_children)
+     {
+-      GVariantSerialised child = { NULL, value.data, value.size, value.depth + 1, 0 };
++      GVariantSerialised child = { NULL, value.data, value.size, value.depth + 1, 0, 0 };
+
+       gvs_filler (&child, children[0]);
+     }
+@@ -320,6 +326,7 @@ gvs_fixed_sized_maybe_is_normal (GVariantSerialised value)
+       value.type_info = g_variant_type_info_element (value.type_info);
+       value.depth++;
+       value.ordered_offsets_up_to = 0;
++      value.checked_offsets_up_to = 0;
+
+       return g_variant_serialised_is_normal (value);
+     }
+@@ -362,6 +369,7 @@ gvs_variable_sized_maybe_get_child (GVariantSerialised value,
+
+   value.depth++;
+   value.ordered_offsets_up_to = 0;
++  value.checked_offsets_up_to = 0;
+
+   return value;
+ }
+@@ -392,7 +400,7 @@ gvs_variable_sized_maybe_serialise (GVariantSerialised        value,
+ {
+   if (n_children)
+     {
+-      GVariantSerialised child = { NULL, value.data, value.size - 1, value.depth + 1, 0 };
++      GVariantSerialised child = { NULL, value.data, value.size - 1, value.depth + 1, 0, 0 };
+
+       /* write the data for the child.  */
+       gvs_filler (&child, children[0]);
+@@ -413,6 +421,7 @@ gvs_variable_sized_maybe_is_normal (GVariantSerialised value)
+   value.size--;
+   value.depth++;
+   value.ordered_offsets_up_to = 0;
++  value.checked_offsets_up_to = 0;
+
+   return g_variant_serialised_is_normal (value);
+ }
+@@ -739,39 +748,46 @@ gvs_variable_sized_array_get_child (GVariantSerialised value,
+
+   /* If the requested @index_ is beyond the set of indices whose framing offsets
+    * have been checked, check the remaining offsets to see whether they’re
+-   * normal (in order, no overlapping array elements). */
+-  if (index_ > value.ordered_offsets_up_to)
++   * normal (in order, no overlapping array elements).
++   *
++   * Don’t bother checking if the highest known-good offset is lower than the
++   * highest checked offset, as that means there’s an invalid element at that
++   * index, so there’s no need to check further. */
++  if (index_ > value.checked_offsets_up_to &&
++      value.ordered_offsets_up_to == value.checked_offsets_up_to)
+     {
+       switch (offsets.offset_size)
+         {
+         case 1:
+           {
+             value.ordered_offsets_up_to = find_unordered_guint8 (
+-                offsets.array, value.ordered_offsets_up_to, index_ + 1);
++                offsets.array, value.checked_offsets_up_to, index_ + 1);
+             break;
+           }
+         case 2:
+           {
+             value.ordered_offsets_up_to = find_unordered_guint16 (
+-                offsets.array, value.ordered_offsets_up_to, index_ + 1);
++                offsets.array, value.checked_offsets_up_to, index_ + 1);
+             break;
+           }
+         case 4:
+           {
+             value.ordered_offsets_up_to = find_unordered_guint32 (
+-                offsets.array, value.ordered_offsets_up_to, index_ + 1);
++                offsets.array, value.checked_offsets_up_to, index_ + 1);
+             break;
+           }
+         case 8:
+           {
+             value.ordered_offsets_up_to = find_unordered_guint64 (
+-                offsets.array, value.ordered_offsets_up_to, index_ + 1);
++                offsets.array, value.checked_offsets_up_to, index_ + 1);
+             break;
+           }
+         default:
+           /* gvs_get_offset_size() only returns maximum 8 */
+           g_assert_not_reached ();
+         }
++
++      value.checked_offsets_up_to = index_;
+     }
+
+   if (index_ > value.ordered_offsets_up_to)
+@@ -916,6 +932,7 @@ gvs_variable_sized_array_is_normal (GVariantSerialised value)
+
+   /* All offsets have now been checked. */
+   value.ordered_offsets_up_to = G_MAXSIZE;
++  value.checked_offsets_up_to = G_MAXSIZE;
+
+   return TRUE;
+ }
+@@ -1040,14 +1057,15 @@ gvs_tuple_get_child (GVariantSerialised value,
+    * all the tuple *elements* here, not just all the framing offsets, since
+    * tuples contain a mix of elements which use framing offsets and ones which
+    * don’t. None of them are allowed to overlap. */
+-  if (index_ > value.ordered_offsets_up_to)
++  if (index_ > value.checked_offsets_up_to &&
++      value.ordered_offsets_up_to == value.checked_offsets_up_to)
+     {
+       gsize i, prev_i_end = 0;
+
+-      if (value.ordered_offsets_up_to > 0)
+-        gvs_tuple_get_member_bounds (value, value.ordered_offsets_up_to - 1, offset_size, NULL, &prev_i_end);
++      if (value.checked_offsets_up_to > 0)
++        gvs_tuple_get_member_bounds (value, value.checked_offsets_up_to - 1, offset_size, NULL, &prev_i_end);
+
+-      for (i = value.ordered_offsets_up_to; i <= index_; i++)
++      for (i = value.checked_offsets_up_to; i <= index_; i++)
+         {
+           gsize i_start, i_end;
+
+@@ -1060,6 +1078,7 @@ gvs_tuple_get_child (GVariantSerialised value,
+         }
+
+       value.ordered_offsets_up_to = i - 1;
++      value.checked_offsets_up_to = index_;
+     }
+
+   if (index_ > value.ordered_offsets_up_to)
+@@ -1257,6 +1276,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+
+   /* All element bounds have been checked above. */
+   value.ordered_offsets_up_to = G_MAXSIZE;
++  value.checked_offsets_up_to = G_MAXSIZE;
+
+   {
+     gsize fixed_size;
+diff --git a/glib/gvariant-serialiser.h b/glib/gvariant-serialiser.h
+index 03826f9..2423e01 100644
+--- a/glib/gvariant-serialiser.h
++++ b/glib/gvariant-serialiser.h
+@@ -40,6 +40,15 @@ typedef struct
+    * Even when dealing with tuples, @ordered_offsets_up_to is an element index,
+    * rather than an index into the frame offsets. */
+   gsize             ordered_offsets_up_to;
++
++  /* Similar to @ordered_offsets_up_to. This gives the index of the child element
++   * whose frame offset is the highest in the offset table which has been
++   * checked so far.
++   *
++   * This is always ≥ @ordered_offsets_up_to. It is always an element index.
++   *
++   * See documentation in gvariant-core.c for `struct GVariant` for details. */
++  gsize             checked_offsets_up_to;
+ } GVariantSerialised;
+
+ /* deserialization */
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 1b1cbdc..2e288af 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5997,6 +5997,7 @@ g_variant_byteswap (GVariant *value)
+       serialised.data = g_malloc (serialised.size);
+       serialised.depth = g_variant_get_depth (trusted);
+       serialised.ordered_offsets_up_to = G_MAXSIZE;  /* operating on the normal form */
++      serialised.checked_offsets_up_to = G_MAXSIZE;
+       g_variant_store (trusted, serialised.data);
+       g_variant_unref (trusted);
+
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 3ddff96..31a7dde 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -1282,6 +1282,7 @@ random_instance_filler (GVariantSerialised *serialised,
+
+   serialised->depth = 0;
+   serialised->ordered_offsets_up_to = 0;
++  serialised->checked_offsets_up_to = 0;
+
+   g_assert_true (serialised->type_info == instance->type_info);
+   g_assert_cmpuint (serialised->size, ==, instance->size);
+@@ -1449,6 +1450,7 @@ test_maybe (void)
+         serialised.size = needed_size;
+         serialised.depth = 0;
+	serialised.ordered_offsets_up_to = 0;
++	serialised.checked_offsets_up_to = 0;
+
+         g_variant_serialiser_serialise (serialised,
+                                         random_instance_filler,
+@@ -1573,6 +1575,7 @@ test_array (void)
+         serialised.size = needed_size;
+         serialised.depth = 0;
+	serialised.ordered_offsets_up_to = 0;
++	serialised.checked_offsets_up_to = 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_filler,
+                                         (gpointer *) instances, n_children);
+@@ -1738,6 +1741,7 @@ test_tuple (void)
+         serialised.size = needed_size;
+         serialised.depth = 0;
+	serialised.ordered_offsets_up_to = 0;
++	serialised.checked_offsets_up_to = 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_filler,
+                                         (gpointer *) instances, n_children);
+@@ -1835,6 +1839,7 @@ test_variant (void)
+         serialised.size = needed_size;
+         serialised.depth = 0;
+	serialised.ordered_offsets_up_to = 0;
++	serialised.checked_offsets_up_to = 0;
+
+         g_variant_serialiser_serialise (serialised, random_instance_filler,
+                                         (gpointer *) &instance, 1);
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patch
new file mode 100644
index 0000000000..7a43b138f3
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32665-0009.patch
@@ -0,0 +1,98 @@
+From 298a537d5f6783e55d87e40011ee3fd3b22b72f9 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 01:39:01 +0000
+Subject: [PATCH] gvariant: Zero-initialise various GVariantSerialised objects
+
+The following few commits will add a couple of new fields to
+`GVariantSerialised`, and they should be zero-filled by default.
+
+Try and pre-empt that a bit by zero-filling `GVariantSerialised` by
+default in a few places.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2121
+
+CVE: CVE-2023-32665
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/298a537d5f6783e55d87e40011ee3fd3b22b72f9]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant.c       |  2 +-
+ glib/tests/gvariant.c | 12 ++++++------
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 2e288af..30a3280 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5987,7 +5987,7 @@ g_variant_byteswap (GVariant *value)
+   if (alignment)
+     /* (potentially) contains multi-byte numeric data */
+     {
+-      GVariantSerialised serialised;
++      GVariantSerialised serialised = { 0, };
+       GVariant *trusted;
+       GBytes *bytes;
+
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 31a7dde..2f33a3e 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -1442,7 +1442,7 @@ test_maybe (void)
+
+     for (flavour = 0; flavour < 8; flavour += alignment)
+       {
+-        GVariantSerialised serialised;
++        GVariantSerialised serialised = { 0, };
+         GVariantSerialised child;
+
+         serialised.type_info = type_info;
+@@ -1568,7 +1568,7 @@ test_array (void)
+
+     for (flavour = 0; flavour < 8; flavour += alignment)
+       {
+-        GVariantSerialised serialised;
++        GVariantSerialised serialised = { 0, };
+
+         serialised.type_info = array_info;
+         serialised.data = flavoured_malloc (needed_size, flavour);
+@@ -1734,7 +1734,7 @@ test_tuple (void)
+
+     for (flavour = 0; flavour < 8; flavour += alignment)
+       {
+-        GVariantSerialised serialised;
++        GVariantSerialised serialised = { 0, };
+
+         serialised.type_info = type_info;
+         serialised.data = flavoured_malloc (needed_size, flavour);
+@@ -1831,7 +1831,7 @@ test_variant (void)
+
+     for (flavour = 0; flavour < 8; flavour += alignment)
+       {
+-        GVariantSerialised serialised;
++        GVariantSerialised serialised = { 0, };
+         GVariantSerialised child;
+
+         serialised.type_info = type_info;
+@@ -2280,7 +2280,7 @@ serialise_tree (TreeInstance       *tree,
+ static void
+ test_byteswap (void)
+ {
+-  GVariantSerialised one, two;
++  GVariantSerialised one = { 0, }, two = { 0, };
+   TreeInstance *tree;
+
+   tree = tree_instance_new (NULL, 3);
+@@ -2354,7 +2354,7 @@ test_serialiser_children (void)
+ static void
+ test_fuzz (gdouble *fuzziness)
+ {
+-  GVariantSerialised serialised;
++  GVariantSerialised serialised = { 0, };
+   TreeInstance *tree;
+
+   /* make an instance */
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index b5ab6502a3..b04b5f0a44 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -17,6 +17,15 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch \
+           file://CVE-2023-32665-0001.patch \
+           file://CVE-2023-32665-0002.patch \
+           file://CVE-2023-32665-0003.patch \
+           file://CVE-2023-32665-0004.patch \
+           file://CVE-2023-32665-0005.patch \
+           file://CVE-2023-32665-0006.patch \
+           file://CVE-2023-32665-0007.patch \
+           file://CVE-2023-32665-0008.patch \
+           file://CVE-2023-32665-0009.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.34.1


