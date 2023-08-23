Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EACBEE49A3
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 14:36:27 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.13058.1692801383168875503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 07:36:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=3HwkTC2r;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf3a2f44ffso41847085ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692801382; x=1693406182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKEfoIpUna6iFW0fu35S2EbUm9vnpKwOMzImnzGXaNk=;
        b=3HwkTC2rMuy5LU2BiXKZOoE2tP+bor8lyMNvsqH5Og3ERi5Axkm1ezQI9IHlpzpVk5
         M/injr6uw6OYAvSc7YKvQiAmrc+v4NXkn4mQHIscDuJxI4We6G1fMZNsCCiU0NHOnMRb
         YFHInxxBhBCUn4lgV80YTbGXvFRmuUQhggDoF6be9xOxSnI80nfEA3HOMax1MmA6oGl1
         2KRpm5/IeQm1XAlj5a8AuQnIKqprHUa9+7DNWTIKNQqeVyc6D/qI6QXqB4G6tVK63Ens
         RQdauONhVxU6Ic9ZGgwU+s7YqaNQihvhM4ncwrJueLiisKHyES1fobnb3d4Ly9Xghp++
         Kx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692801382; x=1693406182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKEfoIpUna6iFW0fu35S2EbUm9vnpKwOMzImnzGXaNk=;
        b=UAVCztq1jMtitkrY4/UCd8JMmH2w4rwEN3ziKh4PoGngArAT4Ip6bXF9LmfeXGpXD8
         54MOtf+6w/UhFney9QPBpnWns32KRMtrbPUN5A62xs49GJsfpWoUpj+N6gmzEsDnnPLk
         hHVqSsjBIO7hUxqYaw9NhjzI+wtE3WFWmRuMrXo4sgdnqkB+/y7ceryb7t7XSUdQchym
         pZtfG8z+MsQ3DT2W2aPSlUdbNlVgU7UrZa4Ger9dDgaPJkRW6GpeEI9kvG1AlF1DTjGE
         oSQnhNU0co06Jevb35NFH7L4ZBLxNxNB8iTjCevCNaGl4H4Thn3fxBh+aZrXGmZXemLQ
         3OFw==
X-Gm-Message-State: AOJu0YxuKLx81WJzSpdplOeJU6g4UbRNbLY63pBhWuCBGJp3XE8ijIXY
	GTUnY+zxYHLlyz5G0cxB1JJ8F9MZKxbBEPrmN5A=
X-Google-Smtp-Source: AGHT+IGCfFUEBiaVUEriN+3MkE8AFS5Pce4aXUnKzqW7Mmt4eDYSvd4LCKZJQ5wlqLJSmT8Ag+atMA==
X-Received: by 2002:a17:902:e88f:b0:1c0:afdb:1e6c with SMTP id w15-20020a170902e88f00b001c0afdb1e6cmr1727727plg.8.1692801382112;
        Wed, 23 Aug 2023 07:36:22 -0700 (PDT)
Received: from xps13.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902e9c200b001bb750189desm11062478plk.255.2023.08.23.07.36.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 07:36:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 03/36] glib-2.0: Fix CVE-2023-32643 and CVE-2023-32636
Date: Wed, 23 Aug 2023 04:35:33 -1000
Message-Id: <f6b85f043f826862c6221bd0875b04aef7ab35ba.1692799745.git.steve@sakoman.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186584

From: Soumya Sambu <soumya.sambu@windriver.com>

fuzz_variant_binary_byteswap: Heap-buffer-overflow in g_variant_serialised_get_child

fuzz_variant_text: Timeout in fuzz_variant_text

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../glib-2.0/glib-2.0/CVE-2023-32636.patch    |  50 ++++++
 .../glib-2.0/glib-2.0/CVE-2023-32643.patch    | 155 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb |   2 +
 3 files changed, 207 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch
new file mode 100644
index 0000000000..311993625a
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32636.patch
@@ -0,0 +1,50 @@
+From 21a204147b16539b3eda3143b32844c49e29f4d4 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 11:33:49 +0000
+Subject: [PATCH] gvariant: Propagate trust when getting a child of a
+ serialised variant
+
+If a variant is trusted, that means all its children are trusted, so
+ensure that their checked offsets are set as such.
+
+This allows a lot of the offset table checks to be avoided when getting
+children from trusted serialised tuples, which speeds things up.
+
+No unit test is included because this is just a performance fix. If
+there are other slownesses, or regressions, in serialised `GVariant`
+performance, the fuzzing setup will catch them like it did this one.
+
+This change does reduce the time to run the oss-fuzz reproducer from 80s
+to about 0.7s on my machine.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2841
+oss-fuzz#54314
+
+CVE: CVE-2023-32636
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/21a204147b16539b3eda3143b32844c49e29f4d4]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-core.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/glib/gvariant-core.c b/glib/gvariant-core.c
+index 7b71efc..a2c7d2d 100644
+--- a/glib/gvariant-core.c
++++ b/glib/gvariant-core.c
+@@ -1195,8 +1195,8 @@ g_variant_get_child_value (GVariant *value,
+     child->contents.serialised.bytes =
+       g_bytes_ref (value->contents.serialised.bytes);
+     child->contents.serialised.data = s_child.data;
+-    child->contents.serialised.ordered_offsets_up_to = s_child.ordered_offsets_up_to;
+-    child->contents.serialised.checked_offsets_up_to = s_child.checked_offsets_up_to;
++    child->contents.serialised.ordered_offsets_up_to = (value->state & STATE_TRUSTED) ? G_MAXSIZE : s_child.ordered_offsets_up_to;
++    child->contents.serialised.checked_offsets_up_to = (value->state & STATE_TRUSTED) ? G_MAXSIZE : s_child.checked_offsets_up_to;
+
+     return child;
+   }
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch
new file mode 100644
index 0000000000..b5cb4273b6
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2023-32643.patch
@@ -0,0 +1,155 @@
+From 78da5faccb3e065116b75b3ff87ff55381da6c76 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@endlessos.org>
+Date: Thu, 17 Aug 2023 11:24:43 +0000
+Subject: [PATCH] gvariant: Check offset table doesn't fall outside variant
+ bounds
+
+When dereferencing the first entry in the offset table for a tuple,
+check that it doesn’t fall outside the bounds of the variant first.
+
+This prevents an out-of-bounds read from some non-normal tuples.
+
+This bug was introduced in commit 73d0aa81c2575a5c9ae77d.
+
+Includes a unit test, although the test will likely only catch the
+original bug if run with asan enabled.
+
+Signed-off-by: Philip Withnall <pwithnall@endlessos.org>
+
+Fixes: #2840
+oss-fuzz#54302
+
+CVE: CVE-2023-32643
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/78da5faccb3e065116b75b3ff87ff55381da6c76]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ glib/gvariant-serialiser.c | 12 ++++++--
+ glib/tests/gvariant.c      | 63 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 72 insertions(+), 3 deletions(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 3d6e7b8..5abb87e 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -979,7 +979,8 @@ gvs_tuple_get_member_bounds (GVariantSerialised  value,
+
+   member_info = g_variant_type_info_member_info (value.type_info, index_);
+
+-  if (member_info->i + 1)
++  if (member_info->i + 1 &&
++      offset_size * (member_info->i + 1) <= value.size)
+     member_start = gvs_read_unaligned_le (value.data + value.size -
+                                           offset_size * (member_info->i + 1),
+                                           offset_size);
+@@ -990,7 +991,8 @@ gvs_tuple_get_member_bounds (GVariantSerialised  value,
+   member_start &= member_info->b;
+   member_start |= member_info->c;
+
+-  if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_LAST)
++  if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_LAST &&
++      offset_size * (member_info->i + 1) <= value.size)
+     member_end = value.size - offset_size * (member_info->i + 1);
+
+   else if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_FIXED)
+@@ -1001,11 +1003,15 @@ gvs_tuple_get_member_bounds (GVariantSerialised  value,
+       member_end = member_start + fixed_size;
+     }
+
+-  else /* G_VARIANT_MEMBER_ENDING_OFFSET */
++  else if (member_info->ending_type == G_VARIANT_MEMBER_ENDING_OFFSET &&
++           offset_size * (member_info->i + 2) <= value.size)
+     member_end = gvs_read_unaligned_le (value.data + value.size -
+                                         offset_size * (member_info->i + 2),
+                                         offset_size);
+
++  else  /* invalid */
++    member_end = G_MAXSIZE;
++
+   if (out_member_start != NULL)
+     *out_member_start = member_start;
+   if (out_member_end != NULL)
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index 43091f2..ab0361a 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5416,6 +5416,67 @@ test_normal_checking_tuple_offsets4 (void)
+   g_variant_unref (variant);
+ }
+
++/* This is a regression test that dereferencing the first element in the offset
++ * table doesn’t dereference memory before the start of the GVariant. The first
++ * element in the offset table gives the offset of the final member in the
++ * tuple (the offset table is stored in reverse), and the position of this final
++ * member is needed to check that none of the tuple members overlap with the
++ * offset table
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/2840 */
++static void
++test_normal_checking_tuple_offsets5 (void)
++{
++  /* A tuple of type (sss) in normal form would have an offset table with two
++   * entries:
++   *  - The first entry (lowest index in the table) gives the offset of the
++   *    third `s` in the tuple, as the offset table is reversed compared to the
++   *    tuple members.
++   *  - The second entry (highest index in the table) gives the offset of the
++   *    second `s` in the tuple.
++   *  - The offset of the first `s` in the tuple is always 0.
++   *
++   * See §2.5.4 (Structures) of the GVariant specification for details, noting
++   * that the table is only layed out this way because all three members of the
++   * tuple have non-fixed sizes.
++   *
++   * It’s not clear whether the 0xaa data of this variant is part of the strings
++   * in the tuple, or part of the offset table. It doesn’t really matter. This
++   * is a regression test to check that the code to validate the offset table
++   * doesn’t unconditionally try to access the first entry in the offset table
++   * by subtracting the table size from the end of the GVariant data.
++   *
++   * In this non-normal case, that would result in an address off the start of
++   * the GVariant data, and an out-of-bounds read, because the GVariant is one
++   * byte long, but the offset table is calculated as two bytes long (with 1B
++   * sized entries) from the tuple’s type.
++   */
++  const GVariantType *data_type = G_VARIANT_TYPE ("(sss)");
++  const guint8 data[] = { 0xaa };
++  gsize size = sizeof (data);
++  GVariant *variant = NULL;
++  GVariant *normal_variant = NULL;
++  GVariant *expected = NULL;
++
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/2840");
++
++  variant = g_variant_new_from_data (data_type, data, size, FALSE, NULL, NULL);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant = g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++
++  expected = g_variant_new_parsed ("('', '', '')");
++  g_assert_cmpvariant (expected, variant);
++  g_assert_cmpvariant (expected, normal_variant);
++
++  g_variant_unref (expected);
++  g_variant_unref (normal_variant);
++  g_variant_unref (variant);
++}
++
+ /* Test that an otherwise-valid serialised GVariant is considered non-normal if
+  * its offset table entries are too wide.
+  *
+@@ -5663,6 +5724,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuple_offsets3);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets4",
+                    test_normal_checking_tuple_offsets4);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets5",
++                   test_normal_checking_tuple_offsets5);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets/minimal-sized",
+                    test_normal_checking_tuple_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+--
+2.40.0
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
index 3545e6675a..24c590a714 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.72.3.bb
@@ -29,6 +29,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2023-29499.patch \
            file://CVE-2023-32611-0001.patch \
            file://CVE-2023-32611-0002.patch \
+           file://CVE-2023-32643.patch \
+           file://CVE-2023-32636.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 
-- 
2.34.1


