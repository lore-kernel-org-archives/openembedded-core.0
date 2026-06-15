Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346C3CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:05:44 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127095.1781521538023967249
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:05:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BcN9o7d3;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5344; q=dns/txt;
  s=iport01; t=1781521538; x=1782731138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B8PTD8UtaFG0uuLPg/SiMTekyZQKofvlUqLyxM71nqs=;
  b=BcN9o7d3yhI2XeEdkZ4EyOkN/lzUvhvFCEUsKDUwO3EWOd/kVu+zjcp0
   nDyQv7PU6eocx++z/fTSQezUQI4wy/fUYCLbeQtOOfgIPWW25eLg4ZhN2
   RtRuHmoVdHL4gehrYbN9IFXUysb9Ib5BbrjHW6d1zyeXTVSm2Q4ARYX6+
   pkog5/vdrsdzDr39HGwG8KIdwbpiI0/XAG0DT6DiHUoeAy1KIFSGjHk4a
   Uws1iNLl5fnBOFkqZpgvyucd3y11SMfBdT8Gzy7VKW8cRnXDdYjK24Can
   zJePDEqXKrMwRDj577kMn2Zyweeoa6qKh8GTUgotBH3Nbwhx+01bfjntQ
   w==;
X-CSE-ConnectionGUID: O4sejnJwSc6l1k1RkRBK2Q==
X-CSE-MsgGUID: T9jJauyMQfmH3ue6DF4jZQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgDZ2y9q/5T/Ja1aglmCV3RfQkkDlkgDgROdCBSBa?=
 =?us-ascii?q?g8BAQEPRA0EAQGEQEYCjUMCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnMCARGzUBo3g?=
 =?us-ascii?q?XkzgQGDKAE/AkNQ2ywBCxQBBYEzhT+IH1sYAYR8JxsbgXKBFYE7gTh2gQWBX?=
 =?us-ascii?q?AKBR4ZeBIIigQyBWh6CJCaMQEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBDBsHBYFKgg+BBYUNIx8DOX+BcIElZ2YVMDWBAQERHwocAwsYDUgRLDcUG?=
 =?us-ascii?q?wQ+bgeMUhcPgXgzEgFjKgEKISJjEwiBAAwRk2kCkXqhDwoog3WMIZU6GjOEB?=
 =?us-ascii?q?JQXklELmH2OCpVoaIRogWg8gVlwFTuCZwlKGQ+OKg4Lg2CFE8MKJDUCCQMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:d9bgY6vVJirzT8xy+RnipBxYk+fnVAdfMUV32f8akzHdYApBsoF/q
 tZmKWuHM/6Oa2Lyfd13atiwoUwH7MPSzdNgQVQ6+H81QSgQgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZDdJ5xYuajhKs/za9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw3bpsDGNI1
 +MjI24JNxPaveGM6pHhc7w57igjBJGD0II3oHpsy3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtHYH49tL/Aan3XejFfrl2cv6cf6GnIxws327/oWDbQUoDbGZoLxBzE9
 goq+UzFUxM4PcGO7AOL91L3m+KRsQ2nWrArQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2cYLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:1zO1cayqYkiBHqBVo5kFKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICOsqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3ALbhl3mlXAMv7JTebVSmFTAwKaTTXOVqB13rSJW2?=
 =?us-ascii?q?nMm03TOSWEGWTwolHyfM7zg=3D=3D?=
X-Talos-MUID: 9a23:Y1NvRQWMnpMh2Ebq/AO9hhNrKdZN2qqrKBsQnMsqlZWGBxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,206,1774310400"; 
   d="scan'208";a="494762248"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jun 2026 11:05:37 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id D8E2018000158;
	Mon, 15 Jun 2026 11:05:36 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 7CD9ECC12A6; Mon, 15 Jun 2026 04:05:36 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH v2] libusb1: fix CVE-2026-23679 and CVE-2026-47104
Date: Mon, 15 Jun 2026 04:05:12 -0700
Message-ID: <20260615110530.226509-1-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260612123944.1237170-1-adongare@cisco.com>
References: <20260612123944.1237170-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238833

From: Anil Dongare <adongare@cisco.com>

- Pick the upstream patch [1] as mentioned in [2] and [3].
  included in v1.0.28.

[1] https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f185231
[2] https://security-tracker.debian.org/tracker/CVE-2026-23679.
[3] https://security-tracker.debian.org/tracker/CVE-2026-47104.

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../CVE-2026-23679_CVE-2026-47104.patch       | 89 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.29.bb |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch

diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch
new file mode 100644
index 0000000000..f15f089f9f
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch
@@ -0,0 +1,89 @@
+From 04a9508e07582f553e9ea767f9e4a9b93839914b Mon Sep 17 00:00:00 2001
+From: MarkLee131 <kaixuan.li@ntu.edu.sg>
+Date: Sat, 25 Apr 2026 18:33:17 +0800
+Subject: [PATCH] descriptor: Fix two memory-safety bugs in malformed config
+ descriptor handling
+
+Two issues reachable from a malformed config descriptor returned by an
+attached USB device, both surfaced by the same libFuzzer + ASan run.
+
+1) parse_interface() reads bNumEndpoints from the interface descriptor and
+   increments usb_interface->num_altsetting before entering the inner loop
+   that skips class/vendor specific descriptors ahead of the endpoint
+   array. If that loop's bLength > size short-read branch fires, the
+   function returns before the endpoint array is allocated, leaving the
+   caller with bNumEndpoints > 0 and endpoint == NULL. libusb.h documents
+   endpoint as an array sized by bNumEndpoints, and the testlibusb and
+   xusb examples both iterate it accordingly, so a NULL deref follows.
+   Reset bNumEndpoints to 0 before returning so the invariant holds.
+
+2) The first-pass loop in parse_iad_array() compares header.bLength
+   against the original size argument instead of the remaining bytes,
+   so a single descriptor with bLength == size - 1 lets consumed reach
+   size - 1 and the next iteration enters with only one byte of buffer
+   left. The buf[1] read on the second line of the loop body lands one
+   byte past the malloc allocation that backs the descriptor data. The
+   sibling parsers parse_configuration() and parse_interface() in the
+   same file already use the remaining-bytes form. Switch the IAD parser
+   loop guard and bound check to match.
+
+Both code paths are reachable from public APIs (libusb_get_*_config_descriptor
+and libusb_get_*_interface_association_descriptors), with the malformed
+input supplied by the attached device. Minimal reproducers are 20 and
+9 bytes respectively.
+
+Fixes #1813
+
+CVE: CVE-2026-23679 CVE-2026-47104
+Upstream-Status: Backport [https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f185231]
+
+Backport Changes:
+- The upstream version_nano.h bump is omitted because this is a security
+  backport to libusb 1.0.29, not a version upgrade.
+
+Signed-off-by: MarkLee131 <kaixuan.li@ntu.edu.sg>
+(cherry picked from commit bc0886173ea15b8cc9bba2918f58a97a7f185231)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ libusb/descriptor.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/libusb/descriptor.c b/libusb/descriptor.c
+index 870883a..7d4f118 100644
+--- a/libusb/descriptor.c
++++ b/libusb/descriptor.c
+@@ -241,6 +241,10 @@ static int parse_interface(libusb_context *ctx,
+ 				usbi_warn(ctx,
+ 					  "short extra intf desc read %d/%u",
+ 					  size, header->bLength);
++				/* Keep the invariant: bNumEndpoints > 0 implies
++				 * endpoint != NULL. The endpoint array isn't
++				 * allocated yet on this early return. */
++				ifp->bNumEndpoints = 0;
+ 				return parsed;
+ 			}
+ 
+@@ -1365,7 +1369,7 @@ static int parse_iad_array(struct libusb_context *ctx,
+ 
+ 	/* First pass: Iterate through desc list, count number of IADs */
+ 	iad_array->length = 0;
+-	while (consumed < size) {
++	while (size - consumed >= DESC_HEADER_LENGTH) {
+ 		header.bLength = buf[0];
+ 		header.bDescriptorType = buf[1];
+ 		if (header.bLength < DESC_HEADER_LENGTH) {
+@@ -1373,9 +1377,9 @@ static int parse_iad_array(struct libusb_context *ctx,
+ 				 header.bLength);
+ 			return LIBUSB_ERROR_IO;
+ 		}
+-		else if (header.bLength > size) {
++		else if (header.bLength > size - consumed) {
+ 			usbi_warn(ctx, "short config descriptor read %d/%u",
+-					  size, header.bLength);
++					  size - consumed, header.bLength);
+ 			return LIBUSB_ERROR_IO;
+ 		}
+ 		if (header.bDescriptorType == LIBUSB_DT_INTERFACE_ASSOCIATION)
+-- 
+2.51.0
+
diff --git a/meta/recipes-support/libusb/libusb1_1.0.29.bb b/meta/recipes-support/libusb/libusb1_1.0.29.bb
index 856e32d1c6..d287ec171f 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
@@ -14,6 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://run-ptest \
+           file://CVE-2026-23679_CVE-2026-47104.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
-- 
2.51.0


