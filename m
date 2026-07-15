Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D16C44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:22:21 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.375.1784136136323958637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FNl0RBx9;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6510; q=dns/txt;
  s=iport01; t=1784136136; x=1785345736;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PAhg+1RYDuo4h/fvEzprJVABQ5l73yTTOWJIDpAGhbo=;
  b=FNl0RBx9rJXCLrPFmlYKYksQZhf7RTWGqjcbAFx3grGTVQcT1A3kSW8m
   klU4x2fQ7QQUJFeI0IxsdmUi9GO0+hOT7/etrefZWXSx4kwCMDDZzBzFV
   gH81a/9AaKZfzNxqY0ZBrAs3crh8iGEwVZg9me0KhunaIxU0PbxRiwBLu
   rlfaIfIp8wB+oNWTgiXykw3XeH3ujr1Yh+utP99r8okRxtuW11r2N+HKd
   2WNKp2DUDB7Jz9IKGztkftoERyJ2yN6XlVV18bBFZ+10s6i4cL/yIXgmh
   07xpKzD7ul4ZFneZ1Zgf6VSav58RJUIocXMA1wd8yJQ7hJ+Zbhy4881MM
   A==;
X-CSE-ConnectionGUID: DLzFh7uDRVuHkF5p5MM4Iw==
X-CSE-MsgGUID: dUKk6tVXSbOQxX5f2fLAAA==
X-IPAS-Result: =?us-ascii?q?A0BKAgD+wFdq/4v/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhA4ETnQiBfg8BAQEPRA0EAQGFBQKNUQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwFWHAMBAgMCJgICKyMIEAEIg?=
 =?us-ascii?q?wIBgnQDEb0Fen8zgQGDaAJDUNsuAQUGFAGBCi6FP4MdAYUCXBgBhHwnGxuBc?=
 =?us-ascii?q?oEVgnN2gQWBXAGBKBuDeYJqBIIigQyBWpAWSIECHANZLAFVEw0KCwcFgWYDN?=
 =?us-ascii?q?RIqFW4yHYEjPhc0WBsHBYEdgVCBAoR2Ix8DOX+BMHVKdy1qEheBUYIUgRgDC?=
 =?us-ascii?q?xgNSBEsNxQbBD0BbgeNSSWCPz1RASuCUCqlJaESCiiDdYwhlToaM4QElBeSU?=
 =?us-ascii?q?QuYfY4KllCEaYFoPIFHCwdwFYMiUxkPjioDCwuFX4MUyQU8NQsyAQEHAgcOA?=
 =?us-ascii?q?wuBaJAAAiYEA4FPAQE?=
IronPort-Data: A9a23:4y8rla5sPjV0DUPoKBhfLAxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 mZOXWHTOq6DZTemLdt3aIWw9kIC7JTQx4JkHgQ/q3wwZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1NtvrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eEakK1OYoHE10y
 +E4Kx5Qdk2mor6X3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcqFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkYeUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeNI4PbH50Kwy50o
 ErKwkf6XA0kBOeV7gOVwi+i3OHrtArSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:/zzz76FCGnbXp7g8pLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AxFlduWu8w60Ll1++4AHMeIGJ6IsJVm/zzCjND3W?=
 =?us-ascii?q?GFEZqZuCNFHq1pIJ7xp8=3D?=
X-Talos-MUID: 9a23:ktm4cAlv38aJ+uYlLCy7dnpuCeRrvbiQOHsHtqwWi5SKbyJUEh602WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="501792075"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:22:15 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 0E12A18000203
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:15 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2DF88CC037D; Wed, 15 Jul 2026 22:52:13 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 4/6] glib-2.0: Fix CVE-2026-58013
Date: Wed, 15 Jul 2026 22:51:40 +0530
Message-Id: <20260715172142.1146263-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172142.1146263-1-deeratho@cisco.com>
References: <20260715172142.1146263-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241023

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58013. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/6a2583dec39bfe05553b16d9b7419d6c2a257244
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58013

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/files/CVE-2026-58013.patch       | 140 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58013.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58013.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58013.patch
new file mode 100644
index 0000000000..5677c91e09
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58013.patch
@@ -0,0 +1,140 @@
+From 6ced6ddb7c85bd7b6bd614835c030983078662d6 Mon Sep 17 00:00:00 2001
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
+index e54aea256..640f698cb 100644
+--- a/glib/giochannel.c
++++ b/glib/giochannel.c
+@@ -1828,7 +1828,8 @@ read_again:
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
+index cab486932..3ff5d38e3 100644
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
+@@ -228,6 +229,65 @@ test_read_line_embedded_nuls (void)
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
+@@ -236,6 +295,7 @@ main (int   argc,
+ 
+   g_test_add_func ("/io-channel/read-write", test_read_write);
+   g_test_add_func ("/io-channel/read-line/embedded-nuls", test_read_line_embedded_nuls);
++  g_test_add_func ("/io-channel/read-line/long-terminator", test_read_line_long_terminator);
+ 
+   return g_test_run ();
+ }
+-- 
+2.35.6
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 767f63d6d9..2da58cad2f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -236,6 +236,7 @@ SRC_URI += "\
            file://CVE-2026-58010.patch \
            file://CVE-2026-58011.patch \
            file://CVE-2026-58012.patch \
+           file://CVE-2026-58013.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


