Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F89ACD4F26
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 07:05:08 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15316.1782198303712510067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 00:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PsvzanNz;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7750; q=dns/txt;
  s=iport01; t=1782198303; x=1783407903;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=f1PVBsGki8MjMcqwpc7IxX8XWfDCCBZBQemHjWAKJFo=;
  b=PsvzanNzkSehOOdoAbwt/zuOIhvRhTwGxOxpqpymAt8cvRiRaSDtBDQI
   lidPIktRt9QQ1jk47BMNwrhb7S7R2I/g7Zfc+TVLp5+Q6zTpWgOvc8VTV
   6YhrNMcbkkL1IRF1yJRN81V4GV+HWTBLwhKyDg+Jpy43ijjR8UH7ryi0v
   37iSbtoT78mWu6/AzpXVEUcHKHe29y7OTuFFrp/uMPdBgwDWx2QOz1989
   n4MMUoOAnz4U+3VeWl7mJDNFTm+T5SErT33NzwV5ELB0cJPRaHLMHkC/k
   8R71ia8dC9JhVDo3k3gtR3inzqJU+J7XTCDxJSuhJzsTmKXcAzBMv8J6t
   A==;
X-CSE-ConnectionGUID: DRSF6UKKRHa86Xlv036AHQ==
X-CSE-MsgGUID: dhBnLVWxTlq+JbfitVCvew==
X-IPAS-Result: =?us-ascii?q?A0BGAgDgLjpq/43/Ja1aglmCV3ReQ0kDlkiBFp0IFIFqD?=
 =?us-ascii?q?wEBAQ9EDQQBAYRARo1MAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEqCwEYAS0sAwECWiMhgwIBgnMDEbFKGjeBeTOBAYMoA?=
 =?us-ascii?q?T8CQ1DbLAELFAEFgTOFP4gfWxgBhHwnGxuBcoEVgTuBOHaBBYFcAoFHhl4Eg?=
 =?us-ascii?q?iKBDIFaHoF+JoxlSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFg?=
 =?us-ascii?q?R2BboEEhQIjHwM5f4E/gSRkZhUwNYEBAREfCoEuAwsYDUgRLDcUGwQ+bgeMW?=
 =?us-ascii?q?xcPgXgzEgFjKgEKIRcLYxMII10MEZNpArMJCiiDdYwhlToaM4QElBeSUQuYf?=
 =?us-ascii?q?Y4KlWhohGiBaDyBWXAVO4JnCUoZD44qDguDYIUTx0lHMgIJAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokX0BAQ?=
IronPort-Data: A9a23:TcyLHKA0JhRqZRVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDwi1D0Ex
 zMbCGiOP/+CZDf8c48na43ioU0H6MKHyNRmOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH/gGYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE789VIh8LHq4i2u8nX1FK6
 6RDdhktV0XW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FAggOi0b4aNJ7RmQ+1Znmyeg
 lz571j9G1I4PtKe1QSu7H+z07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KIpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOL9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:7WDYdqF3fjpbtvsHpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90cu7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:XB9Ar28tI+zB7k2GpU2Vv2IuIe57T17+9lfZcxGIDXgxE+O8aWbFrQ==
X-Talos-MUID: 9a23:6ukMJwrYa2iq0OCiIeoezz1iHsFM3Zu+NEQU0rcMtciYCwduNijI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,220,1774310400"; 
   d="scan'208";a="498817405"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jun 2026 07:05:01 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 9C8C8180015CA;
	Tue, 23 Jun 2026 07:05:01 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 3D775CCA384; Tue, 23 Jun 2026 00:05:01 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH] libusb1: fix CVE-2026-23679 and CVE-2026-47104
Date: Tue, 23 Jun 2026 07:04:28 +0000
Message-ID: <20260623070446.2072593-1-adongare@cisco.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-10055.cisco.com [10.30.210.59];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 07:05:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239336

From: Anil Dongare <adongare@cisco.com>

- Pick the upstream patch [1] as mentioned in [2] and [3].
- To successfully apply the fixed commit, apply the dependent commits [4], which are
  included in v1.0.28.

[1] https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f185231
[2] https://security-tracker.debian.org/tracker/CVE-2026-23679.
[3] https://security-tracker.debian.org/tracker/CVE-2026-47104.
[4] https://github.com/libusb/libusb/commit/016a0de33ac94b19c7772d6c20fbea7fec23bf68

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 ...-2026-23679_CVE-2026-47104-dependent.patch | 46 ++++++++++
 .../CVE-2026-23679_CVE-2026-47104.patch       | 88 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.27.bb |  2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch

diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch
new file mode 100644
index 0000000000..04f1e68426
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch
@@ -0,0 +1,46 @@
+From 2c1bb758e3b61355f50df61b6eb474d90bec2fab Mon Sep 17 00:00:00 2001
+From: Sean McBride <sean@rogue-research.com>
+Date: Sat, 3 Feb 2024 22:32:52 -0500
+Subject: [PATCH] descriptor: Fix potential offsetting of pointer by too
+ much
+
+This was checking that `size` is at least `LIBUSB_DT_CONFIG_SIZE` (9)
+bytes long, but then increments the pointer with `buf +=
+header.bLength`. That could end up pointing past of the end of the
+buffer. There is a subsequent check that would prevent dereferencing it,
+but it's still undefined behaviour to even create such a pointer.
+
+Add a check with a similar pattern as elsewhere in this file.
+
+CVE: CVE-2026-23679 CVE-2026-47104
+Upstream-Status: Backport [https://github.com/libusb/libusb/commit/016a0de33ac94b19c7772d6c20fbea7fec23bf68]
+
+Backport Changes:
+- The upstream version_nano.h bump is omitted because this is a security
+  backport to libusb 1.0.27, not a version upgrade.
+
+(cherry picked from commit 016a0de33ac94b19c7772d6c20fbea7fec23bf68)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ libusb/descriptor.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libusb/descriptor.c b/libusb/descriptor.c
+index 4623ad1..4862c69 100644
+--- a/libusb/descriptor.c
++++ b/libusb/descriptor.c
+@@ -1233,6 +1233,11 @@ static int parse_iad_array(struct libusb_context *ctx,
+ 				 header.bLength);
+ 			return LIBUSB_ERROR_IO;
+ 		}
++		else if (header.bLength > size) {
++			usbi_warn(ctx, "short config descriptor read %d/%u",
++					  size, header.bLength);
++			return LIBUSB_ERROR_IO;
++		}
+ 		if (header.bDescriptorType == LIBUSB_DT_INTERFACE_ASSOCIATION)
+ 			iad_array->length++;
+ 		buf += header.bLength;
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch
new file mode 100644
index 0000000000..d868207e9a
--- /dev/null
+++ b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch
@@ -0,0 +1,88 @@
+From 0735213e5118d5c9c732b7c891446b35e0d6b8d5 Mon Sep 17 00:00:00 2001
+From: MarkLee131 <kaixuan.li@ntu.edu.sg>
+Date: Sat, 25 Apr 2026 18:33:17 +0800
+Subject: [PATCH] descriptor: Fix two memory-safety bugs in malformed
+ config descriptor handling
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
+  backport to libusb 1.0.27, not a version upgrade.
+
+Signed-off-by: MarkLee131 <kaixuan.li@ntu.edu.sg>
+(cherry picked from commit bc0886173ea15b8cc9bba2918f58a97a7f185231)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ libusb/descriptor.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/libusb/descriptor.c b/libusb/descriptor.c
+index 4862c69..97143bb 100644
+--- a/libusb/descriptor.c
++++ b/libusb/descriptor.c
+@@ -260,6 +260,10 @@ static int parse_interface(libusb_context *ctx,
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
+@@ -1226,16 +1230,16 @@ static int parse_iad_array(struct libusb_context *ctx,
+ 
+ 	// First pass: Iterate through desc list, count number of IADs
+ 	iad_array->length = 0;
+-	while (consumed < size) {
++	while (size - consumed >= DESC_HEADER_LENGTH) {
+ 		parse_descriptor(buf, "bb", &header);
+ 		if (header.bLength < 2) {
+ 			usbi_err(ctx, "invalid descriptor bLength %d",
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
+2.43.7
+
diff --git a/meta/recipes-support/libusb/libusb1_1.0.27.bb b/meta/recipes-support/libusb/libusb1_1.0.27.bb
index 5bf854f95d..3c46330164 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.27.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.27.bb
@@ -14,6 +14,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://run-ptest \
+           file://CVE-2026-23679_CVE-2026-47104-dependent.patch \
+           file://CVE-2026-23679_CVE-2026-47104.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"
-- 
2.42.0


