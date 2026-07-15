Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99734C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 17:22:01 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.364.1784136112203994310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 10:21:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=geRniJOm;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5962; q=dns/txt;
  s=iport01; t=1784136112; x=1785345712;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jHkNSgkr0zsSPd6CdATF0oirU3BigwlKllvsFhzBjNs=;
  b=geRniJOmXQb5SoIC2oJeFUQtHZp08wFbRrR2KDizSStMBi0pxj5ylkqT
   5BF01ENeSINOf6wXXCMDi3OEk73bzcm9E1+pwZ6sbKYPfXEf92YMuiLwO
   fwbeJFD2I9YiII3yeSkCA6py2XsNQ32JAu4zwsOFOIY4riPyS3w3YhgS8
   HkfHo7JGCMrOujYYAj+G1AlPI436VaeSx4LpMQnfswphjxN+WXOLRfYf8
   ND3DCtlM/NTE/i5t7uOVLz6bZrsg7/z474L2HOjYhEPuY/Bwgd03edvt3
   4KJw6ToltrnU+2AmaxQ8o10BXMmzGFyJihR8gWJOiCUUxAwOv8YjpI1N/
   Q==;
X-CSE-ConnectionGUID: mnn4d6ECSMimtt9h2KLH/Q==
X-CSE-MsgGUID: L1pjBApAR82KzhpNMzJ5DA==
X-IPAS-Result: =?us-ascii?q?A0BFAgD+wFdq/5L/Ja1aHgEBCxIMggULgld0X0JJhFePU?=
 =?us-ascii?q?oIhnh6Bfg8BAQEPRA0EAQGSWAImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDYZaASkPAXIDAQIDAiYCLSMYAQiDAgGCdAMRvQV6gTKBA?=
 =?us-ascii?q?YNoAkNQ2y4BBQYUAYEKLoU/gx0BhQJcGAGEfCcbG4FygRWDaYEFgVwBgSiEF?=
 =?us-ascii?q?IJqBIIigQyBWpAWSIECHANZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPhc0WBsHB?=
 =?us-ascii?q?YEdgVCBAoR2Ix8DOX+BMHVKdy1qEheBUYIUgRgDCxgNSBEsNxQbBD0BbgeNS?=
 =?us-ascii?q?SWCPwEeXBMBCiEigWMnIpMTkj6hEgoog3WMIZU6GjOEBJQXklELmH2OCpZQh?=
 =?us-ascii?q?GmBaDyBRwsHcBWDIlMZD44qAwsLhV+DFMkFPDULMgEBBwIHDgMLgWiQAIF+A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:TyomjaA5Q6rS9BVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGwj1jBTz
 jdJWj2FOqyLYGX8edsjPt6xp0wP6JPSmoJlOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD8hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TExvNoUE1oEKYj3+dyHX0f9
 aY7DBBKV0XW7w626OrTpuhEnM8vKozveYgYoHwllWCfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGYxBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FAgjei2aICFI7RmQ+1xx16aj
 Eve1l6pWDIINMS57Cinr16F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KFpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:zvfa5qDNMGsazKblHema55DYdb4zR+YMi2TDsHoBLCC9E/bo9f
 xG88506faZslsssRIb6LO90de7IE80nKQdieJ6AV7IZmbbUQWTQL2KlbGD/xTQXwvj6+Vaya
 BsN4J6CNH2EBxGqPyS2njdLz7lq+P3lpxBQozlvhBQcT0=
X-Talos-CUID: 9a23:IHpIC2xxSWmiLkaXMO0KBgURHMZ5fiPw50z1IkqkFTdpEp6xaRiprfY=
X-Talos-MUID: 9a23:lZ3i3wqjBkh2nfdnsUwezxU7LMVCyryHMhBXsocGo++hJw4tFx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,165,1779148800"; 
   d="scan'208";a="495830281"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jul 2026 17:21:51 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id D557E18000238
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:21:50 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id F02F0CC037D; Wed, 15 Jul 2026 22:51:48 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/6] glib-2.0: Fix CVE-2026-58010
Date: Wed, 15 Jul 2026 22:51:37 +0530
Message-Id: <20260715172142.1146263-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 17:22:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241020

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream 2.88.1 backport for
CVE-2026-58010. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://gitlab.gnome.org/GNOME/glib/-/commit/be85f9429bb66412a9775440a88cb115803ba897
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-58010

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../glib-2.0/files/CVE-2026-58010.patch       | 113 ++++++++++++++++++
 meta/recipes-core/glib-2.0/glib.inc           |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch

diff --git a/meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch b/meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch
new file mode 100644
index 0000000000..9e56c8892d
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/files/CVE-2026-58010.patch
@@ -0,0 +1,113 @@
+From b1368983fea922237bc49f2651ed817f18472280 Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/be85f9429bb66412a9775440a88cb115803ba897]
+
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit be85f9429bb66412a9775440a88cb115803ba897)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ glib/gvariant-serialiser.c |  2 +-
+ glib/tests/gvariant.c      | 48 ++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 49 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gvariant-serialiser.c b/glib/gvariant-serialiser.c
+index 1a050c40b..73f78a072 100644
+--- a/glib/gvariant-serialiser.c
++++ b/glib/gvariant-serialiser.c
+@@ -1250,7 +1250,7 @@ gvs_tuple_is_normal (GVariantSerialised value)
+ 
+       while (offset & alignment)
+         {
+-          if (offset > value.size || value.data[offset] != '\0')
++          if (offset >= value.size || value.data[offset] != '\0')
+             return FALSE;
+           offset++;
+         }
+diff --git a/glib/tests/gvariant.c b/glib/tests/gvariant.c
+index c1d66e824..04925ae41 100644
+--- a/glib/tests/gvariant.c
++++ b/glib/tests/gvariant.c
+@@ -5779,6 +5779,52 @@ test_normal_checking_tuple_offsets5 (void)
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
++  uint8_t *heap_data = NULL;
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
+@@ -6057,6 +6103,8 @@ main (int argc, char **argv)
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
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index dee94ec060..36c837dc79 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -233,6 +233,7 @@ SRC_URI += "\
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0010-Do-not-hardcode-python-path-into-various-tools.patch \
            file://skip-timeout.patch \
+           file://CVE-2026-58010.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch \
                                 file://0001-meson.build-do-not-enable-pidfd-features-on-native-g.patch \
-- 
2.35.6


