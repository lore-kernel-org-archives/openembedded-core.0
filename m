Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C3DC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:24:55 +0000 (UTC)
Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19.1784136290798318763
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JcVmczDe;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5241; q=dns/txt;
  s=iport01; t=1784136290; x=1785345890;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=lzm4+NyujaeY4vtiTErUmmNPL5un5fcXj7Lcgg6xTSs=;
  b=JcVmczDeVea/TVvGRa82T6gL6oFHrscJcFZ+u9kGUeFGbFzjubqfKdzE
   /+THttezGX4qb1kyenHAuFZLxpQ+Qorfe1DO2aNA2CtS879gFJ5XQQ67u
   H24NvLoYPKL96AmBmCBZJam4AAslLed5L1xYs+3NCR/3xJB9FYgrgI/uf
   Bch+lx7AqRC0dHmKSdPBICmv+I+bdGeqxiDO7mSh+U420whyq00f8rpuD
   JgK1seuM62+3NoGIgBundTVVu4FqAa10Jw1sQ23OOzteJ3gyvAlYQ70mN
   GfUbwrkGvdIZmMpGLbDXyqiIsvYZuD+SFA4x1j4o+A7CnfiXF1m6U7s/Y
   g==;
X-CSE-ConnectionGUID: /34nwod+RPipuhWCpwpdNg==
X-CSE-MsgGUID: vncknsiAQzGv42QTvzrtWA==
X-IPAS-Result: =?us-ascii?q?A0BIAgDtwVdq/4//Ja1aglmCV3RfQkmUKYIhA54bgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQUCjVECJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GWgECAQMnCwEYAT0cAwECLysjCBEIgwIBgnQDEb1EgXkzgQGDK?=
 =?us-ascii?q?AE/AkNQ2y4BCxQBgTiFP4ggXBgBhHwnGxuBcoEVg2mBBYFcAYEohn4EgiKBD?=
 =?us-ascii?q?IFaHoIGjXNIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYFQg?=
 =?us-ascii?q?QKEdiMfAzl/gTB1SnctahIXgVGCFIEaAwsYDUgRLDcUGwQ+bgeNSiWBTHMBg?=
 =?us-ascii?q?Q0BKyJZCnhRkxUbkiGhEgoog3WMIZU6GjOEBJQXklELmH2OCpZQhGmBaDyBR?=
 =?us-ascii?q?wsHcBU7gmcJShkPji0LC4VfgxTJBTw1AgEIMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:U4oxv6CRFhf4jRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDgh1WBVx
 2BNUDuBPfzcNGOjeNonYdnkpkoGusTdm4RnOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD8hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEhK4yCl4xMc4iwudvHGFx3
 uQHMDwrYUXW7w626OrTpuhEnM8vKozveYgYoHwllW+fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY0BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEoiOGyYYOLI7RmQ+1LmE2bo
 HnH1l3rLQ9GbuWj1yif7k2F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:J99As6xVRUt4K9YEmRlrKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3A2hOvFGhzSTrj8Tc69X+qD9syKzJuNSaBymjXLwy?=
 =?us-ascii?q?CMWdxVb2qYkeP4K9CnJ87?=
X-Talos-MUID: 9a23:RjKmMwYWTRk0I+BTqTnnhzd5Ne5R8YuwVBo0rYsUodW7HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="510179161"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:24:49 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 792831800025B
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:49 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 9B040CC037D; Wed, 15 Jul 2026 22:54:47 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 5/6] glib-2.0: fix CVE-2026-58014
Date: Wed, 15 Jul 2026 22:53:29 +0530
Message-Id: <20260715172330.1149253-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260715172330.1149253-1-deeratho@cisco.com>
References: <20260715172330.1149253-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241030

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58014. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/94ecb5b44a1cae09f481dd5e693832f129948893
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58014

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/glib-2.0/CVE-2026-58014.patch    | 106 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb |   1 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch
new file mode 100644
index 0000000000..4e5262b66d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2026-58014.patch
@@ -0,0 +1,106 @@
+From ba0478c206bc04542df774343c6c85f77df49f6e Mon Sep 17 00:00:00 2001
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
+index d08a485..54d77a5 100644
+--- a/glib/gkeyfile.c
++++ b/glib/gkeyfile.c
+@@ -2421,7 +2421,7 @@ g_key_file_get_locale_string_list (GKeyFile     *key_file,
+     }
+ 
+   len = strlen (value);
+-  if (value[len - 1] == key_file->list_separator)
++  if (len > 0 && value[len - 1] == key_file->list_separator)
+     value[len - 1] = '\0';
+ 
+   list_separator[0] = key_file->list_separator;
+diff --git a/glib/tests/keyfile.c b/glib/tests/keyfile.c
+index bc125c1..289bd2b 100644
+--- a/glib/tests/keyfile.c
++++ b/glib/tests/keyfile.c
+@@ -850,6 +850,28 @@ test_locale_string_multiple_loads (void)
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
+@@ -1939,6 +1961,7 @@ main (int argc, char *argv[])
+   g_test_add_func ("/keyfile/number", test_number);
+   g_test_add_func ("/keyfile/locale-string", test_locale_string);
+   g_test_add_func ("/keyfile/locale-string/multiple-loads", test_locale_string_multiple_loads);
++  g_test_add_func ("/keyfile/locale-string/empty", test_locale_string_empty);
+   g_test_add_func ("/keyfile/lists", test_lists);
+   g_test_add_func ("/keyfile/lists-set-get", test_lists_set_get);
+   g_test_add_func ("/keyfile/group-remove", test_group_remove);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
index 5486969abb..9f1cdbe544 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.78.6.bb
@@ -51,6 +51,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://CVE-2026-58011.patch \
            file://CVE-2026-58012.patch \
            file://CVE-2026-58013.patch \
+           file://CVE-2026-58014.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


