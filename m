Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C44C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:24:35 +0000 (UTC)
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11.1784136274298374170
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:24:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kuTFzIb3;
 spf=pass (domain: cisco.com, ip: 173.37.86.78, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6623; q=dns/txt;
  s=iport01; t=1784136274; x=1785345874;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ueZogpofnpgauFZTDpOcb5YHpjdI8VBBm3gTBXoIPZs=;
  b=kuTFzIb3zXavWBEeu6I7F5N98yWZDLPijtjZSLD8UOr9ataB1osNH3QY
   gtd2XzE8tEclQLldTj7zPmbTIF4fBGav0Eo/CnoJ6hDswhlOg4befDovn
   RtsFgdYdunoyBqwv4mqaYMY1jjul9zwuPL24LJ/zfGSByTYnxNNthkLY2
   c0ZH3oEer2C16VBk2S2cxxI0Mr0afjO0Pma5dCMn+4/msbDAx3sZXIJ8s
   25PY6UiiUhsnHWITM6f5TooUCBA6frvenvknxrt1ubmIT8wzq42dLyH7Y
   OnhG6n/9wd/FM6DXNvgugGFx7BDC0/Ch1zMdVfgjVxLcZgrGYUMpt0g9o
   A==;
X-CSE-ConnectionGUID: RsLCygjKRfu/oy8iZU52aQ==
X-CSE-MsgGUID: kxyyRMI6QOalq3Ksqrxx2Q==
X-IPAS-Result: =?us-ascii?q?A0BLAgD+wFdq/4z/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhA4ETnQiBfg8BAQEPRA0EAQGFBQKNUQImNAkOAQIEAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAyMECwEYAT0cAwECAwImAgIrIwgQA?=
 =?us-ascii?q?QiDAgGCdAMRvQV6fzOBAYMoAT8CQ1DbLgELFAGBCi6FP4MdAYUCXBgBhHwnG?=
 =?us-ascii?q?xuBcoEVgnN2gQWBXAGBKBuDeYJqBIIigQyBWh6PeEiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XNFgbBwWBHYFQgQKEdiMfAzl/gTB1SnctahIXgVGCF?=
 =?us-ascii?q?IEYAwsYDUgRLDcUGwQ9AW4HjUklgj89UQErglAqpSWhEgoog3WMIZU6GjOEB?=
 =?us-ascii?q?JQXklELmH2OCpZQhGmBaDyBRwsHcBWDIglKGQ+OKgMLC4VfgxTJBTw1AgEIM?=
 =?us-ascii?q?gEBBwIHDgMLgWiQAAImBAOBTwEB?=
IronPort-Data: A9a23:FnyHWazQsr5zmOhgmCF6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUFn
 DEaUD2HMqrfZ2ryed5/PYu39kkPsMKAyoNhHgtoqFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHstGaYJ9eRUO29Ts
 vsJeDE/U03ZjtvjldpXSsE07igiBNPgMIVavjRryivUSK59B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cO3WjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaIuJIoXSHJ49ckCwp
 XLX7l7cI08jE9Wb0GGm6Wu2lv+VpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:zPYmAK8gdoZH2pgom4Zuk+D6I+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYKcemvAJsQlzuQzW2gYzRLeDU=
X-Talos-CUID: =?us-ascii?q?9a23=3A1LakFGiEGTmKn0FGbUunBeG6fDJuSGb552bfIWy?=
 =?us-ascii?q?CB3suT6zFSG2tpfltqp87?=
X-Talos-MUID: 9a23:GAQ89gn5rAiNxy1MI/H8dnphJNZ52YGPVnkqmJEf4OqfLDZgK22k2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="509401013"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:24:33 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 1F321180001C7
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:33 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 41D97CC037D; Wed, 15 Jul 2026 22:54:31 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 4/6] glib-2.0: fix CVE-2026-58013
Date: Wed, 15 Jul 2026 22:53:28 +0530
Message-Id: <20260715172330.1149253-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172330.1149253-1-deeratho@cisco.com>
References: <20260715172330.1149253-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241029

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58013. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/6a2583dec39bfe05553b16d9b7419d6c2a257244
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58013

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-58013.patch    | 140 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58013.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58013.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58013.patch
new file mode 100644
index 0000000000..fa3db56bdb
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
index 2a4a1dad5b..5486969abb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -50,6 +50,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58010.patch \
            file://CVE-2026-58011.patch \
            file://CVE-2026-58012.patch \
+           file://CVE-2026-58013.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


