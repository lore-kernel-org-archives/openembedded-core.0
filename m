Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85518C4450E
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:22:21 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.376.1784136139026162008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EJnQWXEx;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5128; q=dns/txt;
  s=iport01; t=1784136139; x=1785345739;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=TmkESNh+dOtBsX/3/u8ko7unlalUCue7TB6w2JswY4w=;
  b=EJnQWXExzlG4Vo3wX6+CdlUVOZuM1ZV9FX9+xXeZ7nySnm7gOe6hj7FS
   a2xesIdCyJ+C9RXxTU0il3kQOzpWvYvguK/3UaWiqmoihKuPZg/+R5/vu
   g34sXS3AMYcz4vFtwCky80LfheyM2/W2RdbuQrNzg5QxX8j3JnO9Tmi5D
   X1Ux5imuuRX2Pl5Yii3Wmpy7xTQFrGMDq6bNZP3AUeyNv1Q7mKBOKnjTE
   z4xnJxCthJ+ZSBf96UKqtQC283gnXqavrDiQAmAY76UyLHn+8H36jv/5F
   P/JiMXA6wmxCM7E3H05UBDb1fnCiFOfNbtP4wW0y7MYmhuzzAUPwa/wcz
   w==;
X-CSE-ConnectionGUID: J8uiJFOCTGW+2tZjgor3WA==
X-CSE-MsgGUID: k8+eVCaNQumvoNVKcmDLYg==
X-IPAS-Result: =?us-ascii?q?A0BHAgCFwFdq/5D/Ja1aglmCV3RfQkmUKYIhA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjVECJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwFWHAMBAi8rIwgRCIMCAYJ0AxG9HYF5M4EBg2gCQ?=
 =?us-ascii?q?1DbLgEFBhQBgTiFP4ggXBgBhHwnGxuBcoEVg2mBBYFcAYEohn4EgiKBDIFag?=
 =?us-ascii?q?iSNckiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgVCBAoR2I?=
 =?us-ascii?q?x8DOX+BMHVKdy1qEheBUYIUgRgDCxgNSBEsNxQbBD5uB41JJYFMcwGBDQErI?=
 =?us-ascii?q?lkKeFGTFRuSIaESCiiDdYwhlToaM4QElBeSUQuYfY4KllCEaYFoPIFHCwdwF?=
 =?us-ascii?q?TuCZ1MZD44tCwuFX4MUyS88NQsyAQEHAgcOAwuBaJAAgX4BAQ?=
IronPort-Data: A9a23:WiBjR6wxpkXdPNdbXJR6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUEx
 jMeXm+BOPeJNzP2eNEibYS/pE5Tu5XTmNcwSAM9/lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYraz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJGNmIIw61MFcPU5xt
 qYEGjICaQrYuMvjldpXSsE07igiBNPgMIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cP3WjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCwaYKNJYLWGJw9ckCwp
 TKF8lrSCzcjKdmBzhy70Xmpqsv+knauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:S9rq+aHeMJob3CB+pLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:761q1G3sKfonTYujQskmPrxfOJA4c1/z61zsDHD7U3pbSrKSUwSv0fYx
X-Talos-MUID: 9a23:fuulDQR7SUd3HvFYRXTv1HJvCuxhxZ2zDV4Kt6slsMyoER1/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510076451"
Received: from rcdn-l-core-07.cisco.com ([173.37.255.144])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:22:18 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-07.cisco.com (Postfix) with ESMTPS id A58CD180003CF
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:17 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id C649BCC037D; Wed, 15 Jul 2026 22:52:15 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 5/6] glib-2.0: Fix CVE-2026-58014
Date: Wed, 15 Jul 2026 22:51:41 +0530
Message-Id: <20260715172142.1146263-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172142.1146263-1-deeratho@cisco.com>
References: <20260715172142.1146263-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241024

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58014. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/94ecb5b44a1cae09f481dd5e693832f129948893
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58014

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/files/CVE-2026-58014.patch       | 106 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58014.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58014.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58014.patch
new file mode 100644
index 0000000000..41507aa549
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58014.patch
@@ -0,0 +1,106 @@
+From 3aa697cd4dce40df02ed75dbe51ba411ef45f004 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Sat, 11 Apr 2026 14:42:57 +0100
+Subject: [PATCH] gkeyfile: Fix a one-byte heap under-read with
+ g_key_file_get_locale_string_list()
+
+If this method was called on a key file key which has an empty value,
+`len == 0` and this leads to a one-byte under-read off the start of the
+key file buffer.
+
+Spotted by linhlhq as #YWH-PGM9867-200. The suggested fix is theirs, and
+the unit test is adapted from their report. I added the fuzzing test.
+
+Fixes: #3930
+
+CVE: CVE-2026-58014
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/94ecb5b44a1cae09f481dd5e693832f129948893]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit 94ecb5b44a1cae09f481dd5e693832f129948893)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ fuzzing/fuzz_key.c   |  9 +++++++++
+ glib/gkeyfile.c      |  2 +-
+ glib/tests/keyfile.c | 23 +++++++++++++++++++++++
+ 3 files changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/fuzzing/fuzz_key.c b/fuzzing/fuzz_key.c
+index 77cb684..7d00443 100644
+--- a/fuzzing/fuzz_key.c
++++ b/fuzzing/fuzz_key.c
+@@ -26,11 +26,20 @@ test_parse (const gchar   *data,
+             GKeyFileFlags  flags)
+ {
+   GKeyFile *key = NULL;
++  char *comment = NULL;
++  char **list = NULL;
+ 
+   key = g_key_file_new ();
+   g_key_file_load_from_data (key, (const gchar*) data, size, G_KEY_FILE_NONE,
+                              NULL);
+ 
++  /* Also try some additional parsing and see if it crashes */
++  comment = g_key_file_get_comment (key, "group", "key", NULL);
++  g_free (comment);
++
++  list = g_key_file_get_locale_string_list (key, "group", "key", "de", NULL, NULL);
++  g_strfreev (list);
++
+   g_key_file_free (key);
+ }
+ 
+diff --git a/glib/gkeyfile.c b/glib/gkeyfile.c
+index 84ddddc..5ee2296 100644
+--- a/glib/gkeyfile.c
++++ b/glib/gkeyfile.c
+@@ -2462,7 +2462,7 @@ g_key_file_get_locale_string_list (GKeyFile     *key_file,
+     }
+ 
+   len = strlen (value);
+-  if (value[len - 1] == key_file->list_separator)
++  if (len > 0 && value[len - 1] == key_file->list_separator)
+     value[len - 1] = '\0';
+ 
+   list_separator[0] = key_file->list_separator;
+diff --git a/glib/tests/keyfile.c b/glib/tests/keyfile.c
+index 64a9ec3..da5cad8 100644
+--- a/glib/tests/keyfile.c
++++ b/glib/tests/keyfile.c
+@@ -889,6 +889,28 @@ test_locale_string_multiple_loads (void)
+   g_free (old_locale);
+ }
+ 
++static void
++test_locale_string_empty (void)
++{
++  GKeyFile *keyfile = NULL;
++  GError *local_error = NULL;
++  const char *data =
++    "[valid]\n"
++    "key1=\n";
++
++  g_test_summary ("Check that loading an empty translatable string works");
++  g_test_bug ("https://gitlab.gnome.org/GNOME/glib/-/issues/3930");
++
++  keyfile = g_key_file_new ();
++
++  g_key_file_load_from_data (keyfile, data, -1, G_KEY_FILE_NONE, &local_error);
++  g_assert_no_error (local_error);
++
++  check_locale_string_list_value (keyfile, "valid", "key1", NULL, NULL);
++
++  g_key_file_free (keyfile);
++}
++
+ static void
+ test_lists (void)
+ {
+@@ -2011,6 +2033,7 @@ main (int argc, char *argv[])
+   g_test_add_func ("/keyfile/number", test_number);
+   g_test_add_func ("/keyfile/locale-string", test_locale_string);
+   g_test_add_func ("/keyfile/locale-string/multiple-loads", test_locale_string_multiple_loads);
++  g_test_add_func ("/keyfile/locale-string/empty", test_locale_string_empty);
+   g_test_add_func ("/keyfile/lists", test_lists);
+   g_test_add_func ("/keyfile/lists-set-get", test_lists_set_get);
+   g_test_add_func ("/keyfile/group-remove", test_group_remove);
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 2da58cad2f..018e6e55fb 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -237,6 +237,7 @@ SRC_URI += "\
            file://CVE-2026-58011.patch \
            file://CVE-2026-58012.patch \
            file://CVE-2026-58013.patch \
+           file://CVE-2026-58014.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


