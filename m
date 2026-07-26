Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE7FC54F4C
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7150.1785054626252425601
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=vFEHowqn;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493b966dd74so10986195e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054624; x=1785659424; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=msRv3i1KJxOd+lvq7/uMdm8Oo1epWyntzFnbrODMUxY=;
        b=vFEHowqnwi1hPh58BUyGfmAkGEx9Y1GILQRwaF8koUiJLyV8Urj3djjEXuONyc9OwI
         r2+Sy5N3gq0kdmXe184RanXpfqpWs+SfI7YrKRlWoWBqmTT9TJ/4Zvu++YpP9udg2pQU
         9uedqRmECkZQQGMvbrf0DD3ltRZOOLn1XM3fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054624; x=1785659424;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=msRv3i1KJxOd+lvq7/uMdm8Oo1epWyntzFnbrODMUxY=;
        b=pHBr9q7fkcdMg3m+u7bi2N9soXVqrfn3AuahFka58/AQv2AmqM4july8meaRknfNNo
         2lR96A3NZdj7kmgKOyAR/S/2+lF0l0NFlACT46kd6+3pc7f0ZdmTp3kNjZiolCL6Xy2q
         jRDuR/UQcKXtCKsn8ReVyZqStT06QhbV5ADbM7v/Ufz8e23AHfwE0Gq2UnRPn6Ha7jZW
         iy3hNqjGADnazd5Vcvdl+FunYfF5LesiIjkDAdgsdPl+PtRn5JyVP7y3xJzpjZ/rstMU
         35wSfqFejoRotOjvWFSOaVArXbCxDdrfzwqDmoH/Pk10HCBYgO8IhCg5FFUk+kGek9M2
         v6rg==
X-Gm-Message-State: AOJu0YzswjsiMkuyVATzSop2pYJ+o+TzBUiXEChnyDitWH14VhkHSGCa
	zAkvs1JXp/HJ4IQ+wem40lsd4njhxQKWWpgOAmKga0sBNVGHI9jXaHFvTWEZh7sjXEXykEsK31u
	BQLeFS+E=
X-Gm-Gg: AR+sD12k1jw8aUEADKqSV5wcZaDwQ01G3n2uFkBObspZwqJNpxXVMbm6hmk0ogmf7Jh
	Wkx/Zuw9rUZKHWNWwqSsMu/c7bu6ejnkDRUOnpTclTItk7d/G5ct1P17VvlBxCoI94ZUTMYmKzZ
	9uzT+61Zr81nrOeDAu5FNH3/zanKI6n5+gFc54cbrrLztTZJNmE9xti7FTN66dSt89myYccCvtZ
	8VZwJ/3GLEkAtD8QSrXipsCotuXHJr96Uh1oLu+vEjg77/lsZ9n0iZDkd0/APn1JOpTbOgMfN75
	RtCsACMKIplNKy0O9UpvDyfHWVEWNtjHHW901Oov4tYdKh2UlzXSlljgyh3sbIMZy2Sio6D4c1z
	jKH49QdNbx63aTqX3ck4BJ8S46pYCJMptFiyrZeGt/tJZcULfXHfYkhxSvtMUOTEYsnElvK8IcK
	+11+/u6OswZaFuvppGNxxg4+7U2ouIoTMUH9kkvgGjiscaUlqttlwN2VE2g2m0xMdb9V/3TRYhk
	fa/sg==
X-Received: by 2002:a05:600c:4455:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-496b567b728mr54997125e9.0.1785054624478;
        Sun, 26 Jul 2026 01:30:24 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 25/31] glib-2.0: fix CVE-2026-58010
Date: Sun, 26 Jul 2026 10:29:49 +0200
Message-ID: <42905f772f74fd9977bb571380c8512f197a1473.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242007

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.86.5 backport for
CVE-2026-58010. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/aa1cb87d56111ef989811e824f0ac77484cc997f
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58010

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-58010.patch    | 113 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch
new file mode 100644
index 00000000000..842d53af5cf
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58010.patch
@@ -0,0 +1,113 @@
+From 333f164f00fb874e3c670ce70d2a2a3667b9ebf9 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Sun, 29 Mar 2026 19:10:41 +0100
+Subject: [PATCH] gvariant: Fix an off-by-one error in an offset comparison
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This allows a single byte out-of-bounds read off the end of the
+(potentially untrusted) byte array backing a `GVariant` when it’s
+being checked for normal form.
+
+I can’t see how this could practically be exploited, but it’s certainly
+a security bug as the `GVariant` normal form checking code is supposed
+to be robust to malicious inputs.
+
+Spotted by linhlhq as #YWH-PGM9867-190, and fix and reproducer provided
+by them too, thanks. Confirmed and turned into a unit test by me.
+
+Fixes: #3915
+
+CVE: CVE-2026-58010
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/aa1cb87d56111ef989811e824f0ac77484cc997f]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit aa1cb87d56111ef989811e824f0ac77484cc997f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gvariant-serialiser.c |  2 +-
+ glib/tests/gvariant.c      | 48 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 4e4a73ad1..99a1d3fbd 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -1247,7 +1247,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+ 
+       while (offset & alignment)
+         {
+-          if (offset > value.size || value.data[offset] != '\0')
++          if (offset >= value.size || value.data[offset] != '\0')
+             return FALSE;
+           offset++;
+         }
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index c8f13360c..55e2cee00 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5637,6 +5637,52 @@ test_normal_checking_tuple_offsets5 (void)
+   g_variant_unref (variant);
+ }
+ 
++/* This is a regression test that looping over the padding bytes in a short
++ * (non-normal) tuple doesn’t overflow the input data.
++ *
++ * See https://gitlab.gnome.org/GNOME/glib/-/issues/3915 */
++static void
++test_normal_checking_tuple_offsets6 (void)
++{
++  /*
++   * Type: (ynqiuxthdsog) — 12 members, first member 'y' (byte) has
++   * alignment 0, second 'n' (int16) has alignment 1.
++   * With 1 byte of data (0x28), after reading the first byte member,
++   * offset=1, alignment check for 'n' requires offset to be even,
++   * so the while loop checks value.data[1] — but size is only 1.
++   *
++   * Use heap allocation via GBytes so ASan reports heap-buffer-overflow.
++   */
++  guint8 *heap_data = NULL;
++  GBytes *bytes = NULL;
++  const GVariantType *data_type = G_VARIANT_TYPE ("(ynqiuxthdsog)");
++  GVariant *variant = NULL;
++  GVariant *normal_variant = NULL;
++  GVariant *expected = NULL;
++
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/3915");
++
++  heap_data = g_malloc (1);
++  heap_data[0] = 0x28;
++  bytes = g_bytes_new_take (heap_data, 1);
++
++  variant = g_variant_new_from_bytes (data_type, bytes, FALSE);
++  g_assert_nonnull (variant);
++
++  g_assert_false (g_variant_is_normal_form (variant));
++
++  normal_variant = g_variant_get_normal_form (variant);
++  g_assert_nonnull (normal_variant);
++
++  expected = g_variant_new_parsed ("(byte 0x28, int16 0, uint16 0, 0, uint32 0, int64 0, uint64 0, handle 0, 0.0, '', objectpath '/', signature '')");
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
+@@ -5890,6 +5936,8 @@ main (int argc, char **argv)
+                    test_normal_checking_tuple_offsets4);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets5",
+                    test_normal_checking_tuple_offsets5);
++  g_test_add_func ("/gvariant/normal-checking/tuple-offsets6",
++                   test_normal_checking_tuple_offsets6);
+   g_test_add_func ("/gvariant/normal-checking/tuple-offsets/minimal-sized",
+                    test_normal_checking_tuple_offsets_minimal_sized);
+   g_test_add_func ("/gvariant/normal-checking/empty-object-path",
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 549584f3d8f..54691690117 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -49,6 +49,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-1489-04.patch \
            file://CVE-2026-58016-1.patch \
            file://CVE-2026-58016-2.patch \
+           file://CVE-2026-58010.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

