Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25685CD8CA8
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 12:38:31 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69510.1781267908372549889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2026 05:38:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=iOBIf7xZ;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5321; q=dns/txt;
  s=iport01; t=1781267908; x=1782477508;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GHUftrBl1C9o1iTw1PE0fbKKPIeur3GABe1e9Fkpnlk=;
  b=iOBIf7xZ4cfY2p9SOiB80MPumqhwOfC3g+SWrQaOHN8r5Omxoacd3sdN
   kae+WWgbmTpJAnHywkGyt/AZaruMmzKNYfc2bgfi5I7F9f+JAWlM34InR
   MLRlz3BSswsKdraWS4yY+/5SJykAOFgqePwt8ScbzbWcZz84gcvuupcSf
   Zwt7AQ/ZxHOkCJVUmMOZWmP5M4MnHB4/tSaS3OYPu+BnUTBDR8OZkpHIk
   E14VlD6fOiy5NLRRaOMKHHPfHM1EaWd3So0Gi8xeu+yM6K9a1x84uGdfk
   HPoQSulwhi7LrMl9K9bdr4bODALehZsG10t6FkT6s5SL4+RuN+EBNvhzB
   w==;
X-CSE-ConnectionGUID: l9ktUIn5Q5eYajlx6A+GNA==
X-CSE-MsgGUID: xs84QEl0RbSRPWvuxPBf4g==
X-IPAS-Result: =?us-ascii?q?A0BGAgC//Ctq/4r/Ja1aglmCV3RfQkkDlkiBFp0IFIFqD?=
 =?us-ascii?q?wEBAQ9EDQQBAYRARo1CAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgEqCwEYAS0sAwECWiMhgwIBgnMCARGyQxo3gXkzgQGDK?=
 =?us-ascii?q?AE/AkNQ2ywBCxQBBYEzhT+IH1sYAYR8JxsbgXKBFYE7gTh2gQWBXAKBR4ZeB?=
 =?us-ascii?q?IIigQyBXR6CLyaMFkiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHB?=
 =?us-ascii?q?YFKgStqgQOFDSMfAzl/gXSBKGdpFTA1gQEBERIDCxgNSBEsNxQbBD5uB4xCF?=
 =?us-ascii?q?w+BeTMSAWMqAQohImMTCIEADBGTaQKReqEPCiiDdYwhlToaM4QElBeSUQuYf?=
 =?us-ascii?q?Y4KlWhohGiBaDyBWXAVO4JnCUoZD44qDguDYIUTwwUkNQIJAzABBwIHDwKBc?=
 =?us-ascii?q?5F9AQE?=
IronPort-Data: A9a23:VezVaqleKjf6QESi/zP9jEbo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbCm7UPvyCMGfwedh0aYvg9UtT7cfcxodlSAplqH8wFFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKsvjb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYlJ+fpKIGcTz
 KEVGTkPagDdrqGZ5pvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9AusrnDzdDtXoUiYjaE2+GPUigd21dABNfKJK4fRFZsKxxbwS
 mTu73+pXig3MISlwwG/yk2ym//3ty2nV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:IjYF0awEX1DBPeyyECdeKrPwAL1zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qBHnlaKdiLN5VdzJYOCMggWVxe9ZgbcK6geQfxEWjtQttp
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:QPei/W/Kl/AT7pPFBgyVv0pFGdwYU3uA9SrdEka6DXY3Yf66b3bFrQ==
X-Talos-MUID: 9a23:ZjRWxgUKFb8114nq/C/31G1bGcMw2a6VMngyj4gWg+OKaSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,200,1774310400"; 
   d="scan'208";a="493386718"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 12 Jun 2026 12:38:27 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 569AA180001CD;
	Fri, 12 Jun 2026 12:38:27 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id EFBE1CC12A6; Fri, 12 Jun 2026 05:38:26 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, to@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [master] [PATCH] libusb1: fix CVE-2026-23679 and CVE-2026-47104
Date: Fri, 12 Jun 2026 05:38:22 -0700
Message-ID: <20260612123823.1236106-1-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2026 12:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238616

From: Anil Dongare <adongare@cisco.com>

- Pick the upstream patch [1] as mentioned in [2] and [3].

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
index 0000000000..9a21ee06ef
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
+Upstream-Status: Backport [https://github.com/libusb/libusb/commit/016a0de33ac94b19c7772d6c20fbea7fec23bf68]
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


