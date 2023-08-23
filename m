Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7373EEE49B2
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.13049.1692801381595000391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=bPsMHd4d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68a440a8a20so3005612b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801380; x=1693406180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAy5ImEP31/ue2reDFsc9sev+Fz7w/3UGw/s4HX1kOU=;
        b=bPsMHd4dcZh+s+HvHbvvvftYZ23WASxX/ksnNwXJ248YN78SdtsKefRbf2q56W/e5w
         4UTH3w9ubZZZpylMH/xNUD36pHMWRiVKraYYBHc+dDYywgp3LUZ1Ej71d6E1A+xStkwH
         4H8+urkEQeU/DQ1XjG+rF51DUQwmwVn6LkGJZlZnZjA4tRjjxctiBFMgyOWcZ58Z25Tc
         IvoX8jkDZYNkHqqYl9TS5r7MZmNfUnx8+eH91gGcGoU2Hz1AcyFD0YxMUhQnNIQFsnLD
         DyFZlGKMiMxzZc88+cbTh9FieNcvWZ+az3XbEHRk9dyyF6oCfji/t6kjIR4/lic3xxTK
         +5WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801380; x=1693406180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAy5ImEP31/ue2reDFsc9sev+Fz7w/3UGw/s4HX1kOU=;
        b=jvlL0htOco1rZWdW6mudcbyqaCDEBJBb0YPLS8CKctuR0SUphkW2K/+DzmjUJ/wKPR
         aSF7QgtD7X3z67dBs6YgLTZj9X3sm6Jou2BpHJUhj1vEtYPL0Imrd7+/CZtbzptpbeHR
         +nCc8IDy8bGSzgWc/lCgTIPc5ZF6RNdtdyLkyJkeGePi1RzxzbJsM8fNt4pLoXGAHP4s
         xVIIto7hM8OEZPl3QB7BoAIFz/mZOWViEAHO7PElt1AdI5w2avRt1vjg6qTQOOZB/DHs
         Dlvwy0qTTJTGNOsBV0+/BrGj7EC2As6zidAJrD1oFv8cM3193IKhJClVockm+DYYpQNR
         mK8Q==
X-Gm-Message-State: AOJu0Yyk58G5r1XocbMIIcySMe7Vb6axvZpDV30+JWM827NSL8DDqW4Q
	PvKzfkys8QfrRHQ9EHsrLvwPn2PcWSvkw8mPLJw=
X-Google-Smtp-Source: AGHT+IGMPnZUL5N20jzv+w5jtWFL1mZTiA3rvWk9UgZXgm4yKu7dVUtCriEsjIfba94aWnzGczM/xQ==
X-Received: by 2002:a05:6a20:7f98:b0:134:76f6:e9e2 with SMTP id d24-20020a056a207f9800b0013476f6e9e2mr19003072pzj.58.1692801379954;
        Wed, 23 Aug 2023 07:36:19 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/36] glib-2.0: Fix CVE-2023-29499 and CVE-2023-32611
Date: Wed, 23 Aug 2023 04:35:32 -1000
Message-Id: <5ed552ce97e22b449c1036f6c58944ab26db2f0d.1692799745.git.steve@sakoman.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186583

From: Soumya Sambu <soumya.sambu@windriver.com>

GVariant offset table entry size is not checked in is_normal()

g_variant_byteswap() can take a long time with some non-normal inputs

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2023-29499.patch    | 291 ++++++++++++++++++
 .../glib-2.0/CVE-2023-32611-0001.patch        |  97 ++++++
 .../glib-2.0/CVE-2023-32611-0002.patch        | 282 +++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   3 +
 4 files changed, 673 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch
new file mode 100644
index 0000000000..65174efa6d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-29499.patch
@@ -0,0 +1,291 @@
+From 5f4485c4ff57fdefb1661531788def7ca5a47328 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 04:19:44 +0000
+Subject: [PATCH] gvariant-serialiser: Check offset table entry size is minimal
+
+The entries in an offset table (which is used for variable sized arrays
+and tuples containing variable sized members) are sized so that they can
+address every byte in the overall variant.
+
+The specification requires that for a variant to be in normal form, its
+offset table entries must be the minimum width such that they can
+address every byte in the variant.
+
+That minimality requirement was not checked in
+`g_variant_is_normal_form()`, leading to two different byte arrays being
+interpreted as the normal form of a given variant tree. That kind of
+confusion could potentially be exploited, and is certainly a bug.
+
+Fix it by adding the necessary checks on offset table entry width, and
+unit tests.
+
+Spotted by William Manley.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2794
+
+CVE: CVE-2023-29499
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/5f4485c4ff57fdefb1661531788def7ca5a47328]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c |  19 +++-
+ glib/tests/gvariant.c      | 176 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 194 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 9c7f12a..3d6e7b8 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -694,6 +694,10 @@ gvs_variable_sized_array_get_frame_offsets (GVariantSerialised value)
+   out.data_size = last_end;
+   out.array = value.data + last_end;
+   out.length = offsets_array_size / out.offset_size;
++
++  if (out.length > 0 && gvs_calculate_total_size (last_end, out.length) != value.size)
++    return out;  /* offset size not minimal */
++
+   out.is_normal = TRUE;
+
+   return out;
+@@ -1201,6 +1205,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+   gsize length;
+   gsize offset;
+   gsize i;
++  gsize offset_table_size;
+
+   /* as per the comment in gvs_tuple_get_child() */
+   if G_UNLIKELY (value.data == NULL && value.size != 0)
+@@ -1305,7 +1310,19 @@ gvs_tuple_is_normal (GVariantSerialised value)
+       }
+   }
+
+-  return offset_ptr == offset;
++  /* @offset_ptr has been counting backwards from the end of the variant, to
++   * find the beginning of the offset table. @offset has been counting forwards
++   * from the beginning of the variant to find the end of the data. They should
++   * have met in the middle. */
++  if (offset_ptr != offset)
++    return FALSE;
++
++  offset_table_size = value.size - offset_ptr;
++  if (value.size > 0 &&
++      gvs_calculate_total_size (offset, offset_table_size / offset_size) != value.size)
++    return FALSE;  /* offset size not minimal */
++
++  return TRUE;
+ }
+
+ /* Variants {{{2
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 44e4451..ad45043 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5076,6 +5076,86 @@ test_normal_checking_array_offsets2 (void)
+   g_variant_unref (variant);
+ }
+
++/* Test that an otherwise-valid serialised GVariant is considered non-normal if
++ * its offset table entries are too wide.
++ *
++ * See §2.3.6 (Framing Offsets) of the GVariant specification. */
++static void
++test_normal_checking_array_offsets_minimal_sized (void)
++{
++  GVariantBuilder builder;
++  gsize i;
++  GVariant *aay_constructed = NULL;
++  const guint8 *data = NULL;
++  guint8 *data_owned = NULL;
++  GVariant *aay_deserialised = NULL;
++  GVariant *aay_normalised = NULL;
++
++  /* Construct an array of type aay, consisting of 128 elements which are each
++   * an empty array, i.e. `[[] * 128]`. This is chosen because the inner
++   * elements are variable sized (making the outer array variable sized, so it
++   * must have an offset table), but they are also zero-sized when serialised.
++   * So the serialised representation of @aay_constructed consists entirely of
++   * its offset table, which is entirely zeroes.
++   *
++   * The array is chosen to be 128 elements long because that means offset
++   * table entries which are 1 byte long. If the elements in the array were
++   * non-zero-sized (to the extent that the overall array is ≥256 bytes long),
++   * the offset table entries would end up being 2 bytes long. */
++  g_variant_builder_init (&builder, G_VARIANT_TYPE ("aay"));
++
++  for (i = 0; i < 128; i++)
++    g_variant_builder_add_value (&builder, g_variant_new_array (G_VARIANT_TYPE_BYTE, NULL, 0));
++
++  aay_constructed = g_variant_builder_end (&builder);
++
++  /* Verify that the constructed array is in normal form, and its serialised
++   * form is `b'\0' * 128`. */
++  g_assert_true (g_variant_is_normal_form (aay_constructed));
++  g_assert_cmpuint (g_variant_n_children (aay_constructed), ==, 128);
++  g_assert_cmpuint (g_variant_get_size (aay_constructed), ==, 128);
++
++  data = g_variant_get_data (aay_constructed);
++  for (i = 0; i < g_variant_get_size (aay_constructed); i++)
++    g_assert_cmpuint (data[i], ==, 0);
++
++  /* Construct a serialised `aay` GVariant which is `b'\0' * 256`. This has to
++   * be a non-normal form of `[[] * 128]`, with 2-byte-long offset table
++   * entries, because each offset table entry has to be able to reference all of
++   * the byte boundaries in the container. All the entries in the offset table
++   * are zero, so all the elements of the array are zero-sized. */
++  data = data_owned = g_malloc0 (256);
++  aay_deserialised = g_variant_new_from_data (G_VARIANT_TYPE ("aay"),
++                                              data,
++                                              256,
++                                              FALSE,
++                                              g_free,
++                                              g_steal_pointer (&data_owned));
++
++  g_assert_false (g_variant_is_normal_form (aay_deserialised));
++  g_assert_cmpuint (g_variant_n_children (aay_deserialised), ==, 128);
++  g_assert_cmpuint (g_variant_get_size (aay_deserialised), ==, 256);
++
++  data = g_variant_get_data (aay_deserialised);
++  for (i = 0; i < g_variant_get_size (aay_deserialised); i++)
++    g_assert_cmpuint (data[i], ==, 0);
++
++  /* Get its normal form. That should change the serialised size. */
++  aay_normalised = g_variant_get_normal_form (aay_deserialised);
++
++  g_assert_true (g_variant_is_normal_form (aay_normalised));
++  g_assert_cmpuint (g_variant_n_children (aay_normalised), ==, 128);
++  g_assert_cmpuint (g_variant_get_size (aay_normalised), ==, 128);
++
++  data = g_variant_get_data (aay_normalised);
++  for (i = 0; i < g_variant_get_size (aay_normalised); i++)
++    g_assert_cmpuint (data[i], ==, 0);
++
++  g_variant_unref (aay_normalised);
++  g_variant_unref (aay_deserialised);
++  g_variant_unref (aay_constructed);
++}
++
+ /* Test that a tuple with invalidly large values in its offset table is
+  * normalised successfully without looping infinitely. */
+ static void
+@@ -5270,6 +5350,98 @@ test_normal_checking_tuple_offsets4 (void)
+   g_variant_unref (variant);
+ }
+
++/* Test that an otherwise-valid serialised GVariant is considered non-normal if
++ * its offset table entries are too wide.
++ *
++ * See §2.3.6 (Framing Offsets) of the GVariant specification. */
++static void
++test_normal_checking_tuple_offsets_minimal_sized (void)
++{
++  GString *type_string = NULL;
++  GVariantBuilder builder;
++  gsize i;
++  GVariant *ray_constructed = NULL;
++  const guint8 *data = NULL;
++  guint8 *data_owned = NULL;
++  GVariant *ray_deserialised = NULL;
++  GVariant *ray_normalised = NULL;
++
++  /* Construct a tuple of type (ay…ay), consisting of 129 members which are each
++   * an empty array, i.e. `([] * 129)`. This is chosen because the inner
++   * members are variable sized, so the outer tuple must have an offset table,
++   * but they are also zero-sized when serialised. So the serialised
++   * representation of @ray_constructed consists entirely of its offset table,
++   * which is entirely zeroes.
++   *
++   * The tuple is chosen to be 129 members long because that means it has 128
++   * offset table entries which are 1 byte long each. If the members in the
++   * tuple were non-zero-sized (to the extent that the overall tuple is ≥256
++   * bytes long), the offset table entries would end up being 2 bytes long.
++   *
++   * 129 members are used unlike 128 array elements in
++   * test_normal_checking_array_offsets_minimal_sized(), because the last member
++   * in a tuple never needs an offset table entry. */
++  type_string = g_string_new ("");
++  g_string_append_c (type_string, '(');
++  for (i = 0; i < 129; i++)
++    g_string_append (type_string, "ay");
++  g_string_append_c (type_string, ')');
++
++  g_variant_builder_init (&builder, G_VARIANT_TYPE (type_string->str));
++
++  for (i = 0; i < 129; i++)
++    g_variant_builder_add_value (&builder, g_variant_new_array (G_VARIANT_TYPE_BYTE, NULL, 0));
++
++  ray_constructed = g_variant_builder_end (&builder);
++
++  /* Verify that the constructed tuple is in normal form, and its serialised
++   * form is `b'\0' * 128`. */
++  g_assert_true (g_variant_is_normal_form (ray_constructed));
++  g_assert_cmpuint (g_variant_n_children (ray_constructed), ==, 129);
++  g_assert_cmpuint (g_variant_get_size (ray_constructed), ==, 128);
++
++  data = g_variant_get_data (ray_constructed);
++  for (i = 0; i < g_variant_get_size (ray_constructed); i++)
++    g_assert_cmpuint (data[i], ==, 0);
++
++  /* Construct a serialised `(ay…ay)` GVariant which is `b'\0' * 256`. This has
++   * to be a non-normal form of `([] * 129)`, with 2-byte-long offset table
++   * entries, because each offset table entry has to be able to reference all of
++   * the byte boundaries in the container. All the entries in the offset table
++   * are zero, so all the members of the tuple are zero-sized. */
++  data = data_owned = g_malloc0 (256);
++  ray_deserialised = g_variant_new_from_data (G_VARIANT_TYPE (type_string->str),
++                                              data,
++                                              256,
++                                              FALSE,
++                                              g_free,
++                                              g_steal_pointer (&data_owned));
++
++  g_assert_false (g_variant_is_normal_form (ray_deserialised));
++  g_assert_cmpuint (g_variant_n_children (ray_deserialised), ==, 129);
++  g_assert_cmpuint (g_variant_get_size (ray_deserialised), ==, 256);
++
++  data = g_variant_get_data (ray_deserialised);
++  for (i = 0; i < g_variant_get_size (ray_deserialised); i++)
++    g_assert_cmpuint (data[i], ==, 0);
++
++  /* Get its normal form. That should change the serialised size. */
++  ray_normalised = g_variant_get_normal_form (ray_deserialised);
++
++  g_assert_true (g_variant_is_normal_form (ray_normalised));
++  g_assert_cmpuint (g_variant_n_children (ray_normalised), ==, 129);
++  g_assert_cmpuint (g_variant_get_size (ray_normalised), ==, 128);
++
++  data = g_variant_get_data (ray_normalised);
++  for (i = 0; i < g_variant_get_size (ray_normalised); i++)
++    g_assert_cmpuint (data[i], ==, 0);
++
++  g_variant_unref (ray_normalised);
++  g_variant_unref (ray_deserialised);
++  g_variant_unref (ray_constructed);
++  g_string_free (type_string, TRUE);
++}
++
+ /* Test that an empty object path is normalised successfully to the base object
+  * path, ‘/’. */
+ static void
+@@ -5414,6 +5586,8 @@ main (int argc, char **argv)
+                    test_normal_checking_array_offsets);
+   g_test_add_func ("/gvariant/normal-checking/array-offsets2",
+                    test_normal_checking_array_offsets2);
++  g_test_add_func ("/gvariant/normal-checking/array-offsets/minimal-sized",
++                   test_normal_checking_array_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets",
+                    test_normal_checking_tuple_offsets);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets2",
+@@ -5422,6 +5596,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuple_offsets3);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets4",
+                    test_normal_checking_tuple_offsets4);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets/minimal-sized",
++                   test_normal_checking_tuple_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+                    test_normal_checking_empty_object_path);
+
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patch
new file mode 100644
index 0000000000..cc4b4055b2
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0001.patch
@@ -0,0 +1,97 @@
+From 4c4cf568f0f710baf0bd04d52df715636bc6b971 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 04:23:41 +0000
+Subject: [PATCH] gvariant: Fix g_variant_byteswap() returning non-normal data
+
+If `g_variant_byteswap()` was called on a non-normal variant of a type
+which doesn’t need byteswapping, it would return a non-normal output.
+
+That contradicts the documentation, which says that the return value is
+always in normal form.
+
+Fix the code so it matches the documentation.
+
+Includes a unit test.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Helps: #2797
+
+CVE: CVE-2023-32611
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/4c4cf568f0f710baf0bd04d52df715636bc6b971]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant.c       |  8 +++++---
+ glib/tests/gvariant.c | 24 ++++++++++++++++++++++++
+ 2 files changed, 29 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 30a3280..7e568d1 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -6004,14 +6004,16 @@ g_variant_byteswap (GVariant *value)
+       g_variant_serialised_byteswap (serialised);
+
+       bytes = g_bytes_new_take (serialised.data, serialised.size);
+-      new = g_variant_new_from_bytes (g_variant_get_type (value), bytes, TRUE);
++      new = g_variant_ref_sink (g_variant_new_from_bytes (g_variant_get_type (value), bytes, TRUE));
+       g_bytes_unref (bytes);
+     }
+   else
+     /* contains no multi-byte data */
+-    new = value;
++    new = g_variant_get_normal_form (value);
+
+-  return g_variant_ref_sink (new);
++  g_assert (g_variant_is_trusted (new));
++
++  return g_steal_pointer (&new);
+ }
+
+ /**
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index ad45043..36c86c2 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -3818,6 +3818,29 @@ test_gv_byteswap (void)
+   g_free (string);
+ }
+
++static void
++test_gv_byteswap_non_normal_non_aligned (void)
++{
++  const guint8 data[] = { 0x02 };
++  GVariant *v = NULL;
++  GVariant *v_byteswapped = NULL;
++
++  g_test_summary ("Test that calling g_variant_byteswap() on a variant which "
++                  "is in non-normal form and doesn’t need byteswapping returns "
++                  "the same variant in normal form.");
++
++  v = g_variant_new_from_data (G_VARIANT_TYPE_BOOLEAN, data, sizeof (data), FALSE, NULL, NULL);
++  g_assert_false (g_variant_is_normal_form (v));
++
++  v_byteswapped = g_variant_byteswap (v);
++  g_assert_true (g_variant_is_normal_form (v_byteswapped));
++
++  g_assert_cmpvariant (v, v_byteswapped);
++
++  g_variant_unref (v);
++  g_variant_unref (v_byteswapped);
++}
++
+ static void
+ test_parser (void)
+ {
+@@ -5553,6 +5576,7 @@ main (int argc, char **argv)
+   g_test_add_func ("/gvariant/builder-memory", test_builder_memory);
+   g_test_add_func ("/gvariant/hashing", test_hashing);
+   g_test_add_func ("/gvariant/byteswap", test_gv_byteswap);
++  g_test_add_func ("/gvariant/byteswap/non-normal-non-aligned", test_gv_byteswap_non_normal_non_aligned);
+   g_test_add_func ("/gvariant/parser", test_parses);
+   g_test_add_func ("/gvariant/parser/integer-bounds", test_parser_integer_bounds);
+   g_test_add_func ("/gvariant/parser/recursion", test_parser_recursion);
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patch
new file mode 100644
index 0000000000..304c15bceb
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32611-0002.patch
@@ -0,0 +1,282 @@
+From 7d7efce1d9c379fdd7d2ff58caea88f8806fdd2e Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 05:05:39 +0000
+Subject: [PATCH] gvariant: Allow g_variant_byteswap() to operate on tree-form
+ variants
+
+This avoids needing to always serialise a variant before byteswapping it.
+With variants in non-normal forms, serialisation can result in a large
+increase in size of the variant, and a lot of allocations for leaf
+`GVariant`s. This can lead to a denial of service attack.
+
+Avoid that by changing byteswapping so that it happens on the tree form
+of the variant if the input is in non-normal form. If the input is in
+normal form (either serialised or in tree form), continue using the
+existing code as byteswapping an already-serialised normal variant is
+about 3× faster than byteswapping on the equivalent tree form.
+
+The existing unit tests cover byteswapping well, but need some
+adaptation so that they operate on tree form variants too.
+
+I considered dropping the serialised byteswapping code and doing all
+byteswapping on tree-form variants, as that would make maintenance
+simpler (avoiding having two parallel implementations of byteswapping).
+However, most inputs to `g_variant_byteswap()` are likely to be
+serialised variants (coming from a byte array of input from some foreign
+source) and most of them are going to be in normal form (as corruption
+and malicious action are rare). So getting rid of the serialised
+byteswapping code would impose quite a performance penalty on the common
+case.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2797
+
+CVE: CVE-2023-32611
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/7d7efce1d9c379fdd7d2ff58caea88f8806fdd2e]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant.c       | 83 ++++++++++++++++++++++++++++++++-----------
+ glib/tests/gvariant.c | 57 +++++++++++++++++++++++++----
+ 2 files changed, 113 insertions(+), 27 deletions(-)
+
+diff --git a/glib/gvariant.c b/glib/gvariant.c
+index 7e568d1..65b8443 100644
+--- a/glib/gvariant.c
++++ b/glib/gvariant.c
+@@ -5839,7 +5839,8 @@ g_variant_iter_loop (GVariantIter *iter,
+
+ /* Serialized data {{{1 */
+ static GVariant *
+-g_variant_deep_copy (GVariant *value)
++g_variant_deep_copy (GVariant *value,
++                     gboolean  byteswap)
+ {
+   switch (g_variant_classify (value))
+     {
+@@ -5857,7 +5858,7 @@ g_variant_deep_copy (GVariant *value)
+         for (i = 0, n_children = g_variant_n_children (value); i < n_children; i++)
+           {
+             GVariant *child = g_variant_get_child_value (value, i);
+-            g_variant_builder_add_value (&builder, g_variant_deep_copy (child));
++            g_variant_builder_add_value (&builder, g_variant_deep_copy (child, byteswap));
+             g_variant_unref (child);
+           }
+
+@@ -5871,28 +5872,63 @@ g_variant_deep_copy (GVariant *value)
+       return g_variant_new_byte (g_variant_get_byte (value));
+
+     case G_VARIANT_CLASS_INT16:
+-      return g_variant_new_int16 (g_variant_get_int16 (value));
++      if (byteswap)
++        return g_variant_new_int16 (GUINT16_SWAP_LE_BE (g_variant_get_int16 (value)));
++      else
++        return g_variant_new_int16 (g_variant_get_int16 (value));
+
+     case G_VARIANT_CLASS_UINT16:
+-      return g_variant_new_uint16 (g_variant_get_uint16 (value));
++      if (byteswap)
++        return g_variant_new_uint16 (GUINT16_SWAP_LE_BE (g_variant_get_uint16 (value)));
++      else
++        return g_variant_new_uint16 (g_variant_get_uint16 (value));
+
+     case G_VARIANT_CLASS_INT32:
+-      return g_variant_new_int32 (g_variant_get_int32 (value));
++      if (byteswap)
++        return g_variant_new_int32 (GUINT32_SWAP_LE_BE (g_variant_get_int32 (value)));
++      else
++        return g_variant_new_int32 (g_variant_get_int32 (value));
+
+     case G_VARIANT_CLASS_UINT32:
+-      return g_variant_new_uint32 (g_variant_get_uint32 (value));
++      if (byteswap)
++        return g_variant_new_uint32 (GUINT32_SWAP_LE_BE (g_variant_get_uint32 (value)));
++      else
++        return g_variant_new_uint32 (g_variant_get_uint32 (value));
+
+     case G_VARIANT_CLASS_INT64:
+-      return g_variant_new_int64 (g_variant_get_int64 (value));
++      if (byteswap)
++        return g_variant_new_int64 (GUINT64_SWAP_LE_BE (g_variant_get_int64 (value)));
++      else
++        return g_variant_new_int64 (g_variant_get_int64 (value));
+
+     case G_VARIANT_CLASS_UINT64:
+-      return g_variant_new_uint64 (g_variant_get_uint64 (value));
++      if (byteswap)
++        return g_variant_new_uint64 (GUINT64_SWAP_LE_BE (g_variant_get_uint64 (value)));
++      else
++        return g_variant_new_uint64 (g_variant_get_uint64 (value));
+
+     case G_VARIANT_CLASS_HANDLE:
+-      return g_variant_new_handle (g_variant_get_handle (value));
++      if (byteswap)
++        return g_variant_new_handle (GUINT32_SWAP_LE_BE (g_variant_get_handle (value)));
++      else
++        return g_variant_new_handle (g_variant_get_handle (value));
+
+     case G_VARIANT_CLASS_DOUBLE:
+-      return g_variant_new_double (g_variant_get_double (value));
++      if (byteswap)
++        {
++          /* We have to convert the double to a uint64 here using a union,
++           * because a cast will round it numerically. */
++          union
++            {
++              guint64 u64;
++              gdouble dbl;
++            } u1, u2;
++          u1.dbl = g_variant_get_double (value);
++          u2.u64 = GUINT64_SWAP_LE_BE (u1.u64);
++          return g_variant_new_double (u2.dbl);
++        }
++      else
++        return g_variant_new_double (g_variant_get_double (value));
+
+     case G_VARIANT_CLASS_STRING:
+       return g_variant_new_string (g_variant_get_string (value, NULL));
+@@ -5947,7 +5983,7 @@ g_variant_get_normal_form (GVariant *value)
+   if (g_variant_is_normal_form (value))
+     return g_variant_ref (value);
+
+-  trusted = g_variant_deep_copy (value);
++  trusted = g_variant_deep_copy (value, FALSE);
+   g_assert (g_variant_is_trusted (trusted));
+
+   return g_variant_ref_sink (trusted);
+@@ -5967,6 +6003,11 @@ g_variant_get_normal_form (GVariant *value)
+  * contain multi-byte numeric data.  That include strings, booleans,
+  * bytes and containers containing only these things (recursively).
+  *
++ * While this function can safely handle untrusted, non-normal data, it is
++ * recommended to check whether the input is in normal form beforehand, using
++ * g_variant_is_normal_form(), and to reject non-normal inputs if your
++ * application can be strict about what inputs it rejects.
++ *
+  * The returned value is always in normal form and is marked as trusted.
+  *
+  * Returns: (transfer full): the byteswapped form of @value
+@@ -5984,22 +6025,21 @@ g_variant_byteswap (GVariant *value)
+
+   g_variant_type_info_query (type_info, &alignment, NULL);
+
+-  if (alignment)
+-    /* (potentially) contains multi-byte numeric data */
++  if (alignment && g_variant_is_normal_form (value))
+     {
++      /* (potentially) contains multi-byte numeric data, but is also already in
++       * normal form so we can use a faster byteswapping codepath on the
++       * serialised data */
+       GVariantSerialised serialised = { 0, };
+-      GVariant *trusted;
+       GBytes *bytes;
+
+-      trusted = g_variant_get_normal_form (value);
+-      serialised.type_info = g_variant_get_type_info (trusted);
+-      serialised.size = g_variant_get_size (trusted);
++      serialised.type_info = g_variant_get_type_info (value);
++      serialised.size = g_variant_get_size (value);
+       serialised.data = g_malloc (serialised.size);
+-      serialised.depth = g_variant_get_depth (trusted);
++      serialised.depth = g_variant_get_depth (value);
+       serialised.ordered_offsets_up_to = G_MAXSIZE;  /* operating on the normal form */
+       serialised.checked_offsets_up_to = G_MAXSIZE;
+-      g_variant_store (trusted, serialised.data);
+-      g_variant_unref (trusted);
++      g_variant_store (value, serialised.data);
+
+       g_variant_serialised_byteswap (serialised);
+
+@@ -6007,6 +6047,9 @@ g_variant_byteswap (GVariant *value)
+       new = g_variant_ref_sink (g_variant_new_from_bytes (g_variant_get_type (value), bytes, TRUE));
+       g_bytes_unref (bytes);
+     }
++  else if (alignment)
++    /* (potentially) contains multi-byte numeric data */
++    new = g_variant_ref_sink (g_variant_deep_copy (value, TRUE));
+   else
+     /* contains no multi-byte data */
+     new = g_variant_get_normal_form (value);
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 36c86c2..43091f2 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -2280,24 +2280,67 @@ serialise_tree (TreeInstance       *tree,
+ static void
+ test_byteswap (void)
+ {
+-  GVariantSerialised one = { 0, }, two = { 0, };
++  GVariantSerialised one = { 0, }, two = { 0, }, three = { 0, };
+   TreeInstance *tree;
+-
++  GVariant *one_variant = NULL;
++  GVariant *two_variant = NULL;
++  GVariant *two_byteswapped = NULL;
++  GVariant *three_variant = NULL;
++  GVariant *three_byteswapped = NULL;
++  guint8 *three_data_copy = NULL;
++  gsize three_size_copy = 0;
++
++  /* Write a tree out twice, once normally and once byteswapped. */
+   tree = tree_instance_new (NULL, 3);
+   serialise_tree (tree, &one);
+
++  one_variant = g_variant_new_from_data (G_VARIANT_TYPE (g_variant_type_info_get_type_string (one.type_info)),
++                                         one.data, one.size, FALSE, NULL, NULL);
++
+   i_am_writing_byteswapped = TRUE;
+   serialise_tree (tree, &two);
++  serialise_tree (tree, &three);
+   i_am_writing_byteswapped = FALSE;
+
+-  g_variant_serialised_byteswap (two);
+-
+-  g_assert_cmpmem (one.data, one.size, two.data, two.size);
+-  g_assert_cmpuint (one.depth, ==, two.depth);
+-
++  /* Swap the first byteswapped one back using the function we want to test. */
++  two_variant = g_variant_new_from_data (G_VARIANT_TYPE (g_variant_type_info_get_type_string (two.type_info)),
++                                         two.data, two.size, FALSE, NULL, NULL);
++  two_byteswapped = g_variant_byteswap (two_variant);
++
++  /* Make the second byteswapped one non-normal (hopefully), and then byteswap
++   * it back using the function we want to test in its non-normal mode.
++   * This might not work because it’s not necessarily possible to make an
++   * arbitrary random variant non-normal. Adding a single zero byte to the end
++   * often makes something non-normal but still readable. */
++  three_size_copy = three.size + 1;
++  three_data_copy = g_malloc (three_size_copy);
++  memcpy (three_data_copy, three.data, three.size);
++  three_data_copy[three.size] = '\0';
++
++  three_variant = g_variant_new_from_data (G_VARIANT_TYPE (g_variant_type_info_get_type_string (three.type_info)),
++                                           three_data_copy, three_size_copy, FALSE, NULL, NULL);
++  three_byteswapped = g_variant_byteswap (three_variant);
++
++  /* Check they’re the same. We can always compare @one_variant and
++   * @two_byteswapped. We can only compare @two_byteswapped and
++   * @three_byteswapped if @two_variant and @three_variant are equal: in that
++   * case, the corruption to @three_variant was enough to make it non-normal but
++   * not enough to change its value. */
++  g_assert_cmpvariant (one_variant, two_byteswapped);
++
++  if (g_variant_equal (two_variant, three_variant))
++    g_assert_cmpvariant (two_byteswapped, three_byteswapped);
++
++  g_variant_unref (three_byteswapped);
++  g_variant_unref (three_variant);
++  g_variant_unref (two_byteswapped);
++  g_variant_unref (two_variant);
++  g_variant_unref (one_variant);
+   tree_instance_free (tree);
+   g_free (one.data);
+   g_free (two.data);
++  g_free (three.data);
++  g_free (three_data_copy);
+ }
+
+ static void
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index b04b5f0a44..3545e6675a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -26,6 +26,9 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2023-32665-0007.patch \
            file://CVE-2023-32665-0008.patch \
            file://CVE-2023-32665-0009.patch \
+           file://CVE-2023-29499.patch \
+           file://CVE-2023-32611-0001.patch \
+           file://CVE-2023-32611-0002.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.34.1


