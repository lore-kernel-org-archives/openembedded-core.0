Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59D9C53219
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7153.1785054628129854451
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rzSHUSoo;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso10021705e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054626; x=1785659426; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=duXZF6Ijywb7aJ6ZIkUoZTm9Jpqk4sI5rCyKqh32JJw=;
        b=rzSHUSoojCik4Ac/EX8J87PVLe7inTwEPcDjdouFBc538ifEvuwZsfPr/JuBqqO/gD
         IiTAMn3KOI4cw4Oa7Qt6yVuxtReaOtsShGYBriHLrQVEWQK7E0YUoAoj4njA4yH30WOI
         PrNmkr8aL7c/seHYUrso22f0QWuK+++C36+94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054626; x=1785659426;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=duXZF6Ijywb7aJ6ZIkUoZTm9Jpqk4sI5rCyKqh32JJw=;
        b=byc+iusEMshUf/0r2imb+UYkf+WZrLCnVJWv1rJKz+jIJmH/RmsWhDHXI5hLaYz2/a
         PI62evcQWel2Hff9y03QACZPd1M3hx2YplwrhXb7KrPdBXg7UNFR+MppERNdFeYcOI5/
         N6HBHkyTmnCB01YGVRc8aNUDDS3vJx5RotQzc6MnZ8Yn5Qn1i8uTTD8VH7XZ5AOuMYuU
         iaCb9GZaQyT6n6TBYAQwZ4YIGx5wTgZsny9y182FNAx8+Nbwfk6lNFNi4PtDGvCZWjcH
         xyGStsAl5LUqiDEIg52xGRnRru4yrzY4xfHGYXGpKVmR367eRxkVBz3E9GpTWGS85gzg
         E4Bw==
X-Gm-Message-State: AOJu0YznPT++Bo2UjiaFNEuGMb9o35ChnqF6UnlX5/0pWIj80KCvcz0H
	2G33t5CnMREPWT2ykkQ/YR50n2DLUmENcSpStRmNUfbv562zHlb/uNBC5TOU0tAsrVqg5SNgRP2
	YFZgrYqA=
X-Gm-Gg: AR+sD13bLeFdI1lLdIWYmCg9lY+dBzQ7DPN3SePEshkb4QRNUIhOyr9cmwTx/bagMUa
	Tuj3vSJszOnZyDXeGa1ktC6dc+nafm9+KBqK9NgHT0e3mfLkgxdaedmLVT+zJpzNc99Skr1gyvM
	LauXDEmioeLknOOS6JNw4tbpx3Qy1QLWe0p+9fGME7f+2rEeT+qTSCV5G9xo06XD+1I5JzqqAPu
	PU9P95LpGQ4eD60cb3LNQa8IxpjYmK275oByHQ8qz4e5BGzgxg5FpbqpKziOf6zwG16h67Y5tLR
	U0UPmSOfnBI2oGw4pQiAWXzyd38OTCisz7HgF+PJOrJoKRxkMbSaEcDJwQEFhlcsKJ6yS78VZRv
	WOnyoPluKfJbNey8EOwo3Sb51adswET9/bDQDPrd4pHr3TeJyd+8zLAKQ2XjeG2VrdnxP1+roRv
	27nl2OEHNxd3g3YzRYtFFoWDa8hahzI2176rm2zfZagxOz3dqBmUWYIh3dtrDN1ZtlGDVTilvbp
	tZ9GA==
X-Received: by 2002:a05:600c:1d11:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-496b56e6e35mr49857965e9.7.1785054626409;
        Sun, 26 Jul 2026 01:30:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:26 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 28/31] glib-2.0: fix CVE-2026-58013
Date: Sun, 26 Jul 2026 10:29:52 +0200
Message-ID: <cb2fd8601b4243183d5e219b901439da3f2d41c8.1785054430.git.yoann.congal@smile.fr>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242010

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58013. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/6a2583dec39bfe05553b16d9b7419d6c2a257244
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58013

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../glib-2.0/glib-2.0/CVE-2026-58013.patch    | 140 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58013.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58013.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58013.patch
new file mode 100644
index 00000000000..fa3db56bdbc
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58013.patch
@@ -0,0 +1,140 @@
+From cb9d97e1b261d75eb8ea255e0a9f3e846d547af7 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 28 Apr 2026 16:45:14 +0100
+Subject: [PATCH] giochannel: Fix memcmp() off the end of the buffer with long
+ terminators
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the line terminator is longer than a single byte, and the current
+line extends to the end of the buffer, and the buffer (which is a
+`GString`) is near a power of two in length (as that’s how `GString`s
+are allocated) it’s possible for the `memcmp()` which checks the
+terminator to read off the end of the string buffer.
+
+Fix that by checking the terminator length against the last character
+before calling `memcmp()`. Add a unit test.
+
+Spotted by linhlhq as #YWH-PGM9867-199. The fix is theirs (validated by
+me), and the unit test is adapted from their proof of concept.
+
+Fixes: #3925
+
+CVE: CVE-2026-58013
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/6a2583dec39bfe05553b16d9b7419d6c2a257244]
+
+Backport Changes:
+- Added the <stdint.h> include for the regression test because these target
+  branches do not otherwise expose uint8_t in glib/tests/io-channel.c.
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit 6a2583dec39bfe05553b16d9b7419d6c2a257244)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/giochannel.c       |  3 ++-
+ glib/tests/io-channel.c | 61 +++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 63 insertions(+), 1 deletion(-)
+
+diff --git a/glib/giochannel.c b/glib/giochannel.c
+index 7572c47a2..8d867d0fb 100644
+--- a/glib/giochannel.c
++++ b/glib/giochannel.c
+@@ -1833,7 +1833,8 @@ read_again:
+         {
+           if (channel->line_term)
+             {
+-              if (memcmp (channel->line_term, nextchar, line_term_len) == 0)
++              if ((size_t) (lastchar - nextchar) >= line_term_len &&
++                  memcmp (channel->line_term, nextchar, line_term_len) == 0)
+                 {
+                   line_length = nextchar - use_buf->str;
+                   got_term_len = line_term_len;
+diff --git a/glib/tests/io-channel.c b/glib/tests/io-channel.c
+index c5dd01d04..cf81a9f6b 100644
+--- a/glib/tests/io-channel.c
++++ b/glib/tests/io-channel.c
+@@ -29,6 +29,7 @@
+ 
+ #include <glib.h>
+ #include <glib/gstdio.h>
++#include <stdint.h>
+ 
+ static void
+ test_small_writes (void)
+@@ -216,6 +217,65 @@ test_read_line_embedded_nuls (void)
+   g_free (filename);
+ }
+ 
++static void
++test_read_line_long_terminator (void)
++{
++  uint8_t *test_data = NULL;
++  size_t test_data_len = 0;
++  int fd;
++  char *filename = NULL;
++  GIOChannel *channel = NULL;
++  GError *local_error = NULL;
++  char *line = NULL;
++  size_t line_length, terminator_pos;
++  const char *line_term;
++  int line_term_length;
++  GIOStatus status;
++
++  g_test_summary ("Test that reading a line when using a long terminator doesn’t over-read the buffer.");
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/work_items/3925");
++
++  /* Write out a temporary file containing 2047 bytes. This is enough to make it
++   * near the length of the GString buffer when read back in. */
++  fd = g_file_open_tmp ("glib-test-io-channel-XXXXXX", &filename, &local_error);
++  g_assert_no_error (local_error);
++  g_close (g_steal_fd (&fd), NULL);
++
++  test_data_len = 2047;
++  test_data = g_malloc (test_data_len);
++  memset (test_data, 'M', test_data_len);
++  g_file_set_contents (filename, (const gchar *) test_data, test_data_len, &local_error);
++  g_assert_no_error (local_error);
++
++  /* Create the channel. */
++  channel = g_io_channel_new_file (filename, "r", &local_error);
++  g_assert_no_error (local_error);
++
++  /* Use a long line terminator so it could potentially over-read the end of the buffer. */
++  g_io_channel_set_line_term (channel, "DEADBEEF", 8);
++
++  line_term = g_io_channel_get_line_term (channel, &line_term_length);
++  g_assert_cmpstr (line_term, ==, "DEADBEEF");
++  g_assert_cmpint (line_term_length, ==, 8);
++
++  g_io_channel_set_encoding (channel, "UTF-8", &local_error);
++  g_assert_no_error (local_error);
++
++  status = g_io_channel_read_line (channel, &line, &line_length,
++                                   &terminator_pos, &local_error);
++  g_assert_no_error (local_error);
++  g_assert_cmpint (status, ==, G_IO_STATUS_NORMAL);
++  g_assert_cmpuint (line_length, ==, 2047);
++  g_assert_cmpuint (terminator_pos, ==, 2047);
++  g_assert_cmpmem (line, line_length, test_data, test_data_len);
++
++  g_free (line);
++  g_io_channel_unref (channel);
++  g_free (test_data);
++  g_unlink (filename);
++  g_free (filename);
++}
++
+ int
+ main (int   argc,
+       char *argv[])
+@@ -224,6 +283,7 @@ main (int   argc,
+ 
+   g_test_add_func ("/io-channel/read-write", test_read_write);
+   g_test_add_func ("/io-channel/read-line/embedded-nuls", test_read_line_embedded_nuls);
++  g_test_add_func ("/io-channel/read-line/long-terminator", test_read_line_long_terminator);
+ 
+   return g_test_run ();
+ }
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 6dc3e0cc9cd..9516231cbad 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -52,6 +52,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58010.patch \
            file://CVE-2026-58011.patch \
            file://CVE-2026-58012.patch \
+           file://CVE-2026-58013.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \

