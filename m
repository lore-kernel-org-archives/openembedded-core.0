Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D57CD98ED
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 07:48:12 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10268.1781682491070214591
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2026 00:48:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3BB1p7y3;
 spf=pass (domain: smile.fr, ip: 209.85.221.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ef29c5561so2921331f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 00:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781682489; x=1782287289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4MdfBwCOsM/yIwHnL4kOnnt8u9j72yFSADMaboResc=;
        b=3BB1p7y3pen2SzAh5YH++kXbWspwwQZqjPYUH6Q3JfREC/e42zczKYG9ryAcQeCYwM
         DtjYQLluuJrrAG58XsymeED+Utwb5Rbj/H3xaW/fa4clG846ks50HWNRU6M24frgL8nG
         zfYk+9WaOjbxEzOgHGWOgZZ2jQSVvayxq/2iI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781682489; x=1782287289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x4MdfBwCOsM/yIwHnL4kOnnt8u9j72yFSADMaboResc=;
        b=nooisKoy7it+KjERQe7tHZdcx0J9BVwSI0DrWfWXoWFUIXa83c58ACwz2sCczxEoBm
         BAL24IB7KNMmI9EBanP1BW6UjuNaqTBQPO4IsvaMg8Qz1XazUimvkYhzNSu+l9PCTK2s
         4Qwmv6V/8MkOpuso5PmqaYJ9TeoyvLDDFHNWKNK6W05Bhvpq8kIq3ieW3jNTJTds36Sq
         Fea8sYxVfhBSB/kwz5RbTLVc9Z1JWid+rnsC9Z3GbLF4oPY/K8Jtfo4+Vk0jmW5zebdP
         rJnMHUAdOP0Brow8vxMrjIMUBm558FqzcBVYfHg5wuQwBl/LqssUk2DN5sib4viZ7IX2
         OjvA==
X-Gm-Message-State: AOJu0YzwVL4bTmWaCcUs9UcyCiB2wt7gwdhgMlG3c9JidRBsaR2To8qv
	DZB4hWmgQ8pgXTll0JVS8eJGj3NdlYE+1YG/rcSclY6hX/9vx0Aq0OqP7oarVMh3W5zlbOV2GHe
	YjV3C
X-Gm-Gg: AfdE7ckeSKpQPOCH+ISDX+XDSE0v45NAF1WjM0J3jZDE3+WQBoMoir5Tbx1IMOdplZn
	oV7R2lOfNCrmkVet49hP6XpyObqxlqBfIkPmCetaZp3L1bn1T2sjvuZJw9E7+wa8ofW5yVamMmO
	aJoUsDUXXlvDxAZQ/XtIEY9olbIIMQTojIGte3mUNelxja99Yi/q+nHu4KxEPvh5vMPY5ps1x2q
	bwd6+JQzP2IvNqFgtGSJ2l09jeyLSd9nXBI5sidQhIEOcFF9+CT3qll5PgGqhUiFKkYXNBBEVf6
	DNC2M7Fz63ifkz+w8VHHT9PYUuJORIDrT/BysFHZ3Wmc2IMoB5X6ItPGKTto67uCHPekS5MHbv7
	QY0vZFKOdfBvPI18y7P4jgkAW9EfUXK/CSbBpzKJ3XUMEQYfaqrYUmQ9lOD6JrfF91vO8ejT8t4
	wtup1eO527VzcMM7tcr4Fmix5WG7VHxJvLtuwwvYauwZrNNJT0HWS5Kb3ddxkUEhYsW/FJXucZm
	85Hmde4GriNZ9fc4w==
X-Received: by 2002:a05:6000:194f:b0:45e:fa38:c899 with SMTP id ffacd0b85a97d-462369304dbmr3583763f8f.4.1781682489242;
        Wed, 17 Jun 2026 00:48:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bc19bde07170effe.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bc19:bde0:7170:effe])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2dbfb1sm54721732f8f.35.2026.06.17.00.48.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:48:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 7/8] libusb1: fix CVE-2026-23679 and CVE-2026-47104
Date: Wed, 17 Jun 2026 09:47:58 +0200
Message-ID: <8068c867330345bfea046542c91ad3f83552c265.1781682367.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781682367.git.yoann.congal@smile.fr>
References: <cover.1781682367.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 07:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239022

From: Anil Dongare <adongare@cisco.com>

- Pick the upstream patch [1] as mentioned in [2] and [3].
  included in v1.0.30.

[1] https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f185231
[2] https://security-tracker.debian.org/tracker/CVE-2026-23679.
[3] https://security-tracker.debian.org/tracker/CVE-2026-47104.

Signed-off-by: Anil Dongare <adongare@cisco.com>
[YC: Fixed the version containing the commit]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../CVE-2026-23679_CVE-2026-47104.patch       | 89 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.29.bb |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch

diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch
new file mode 100644
index 00000000000..f15f089f9f6
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
index 856e32d1c62..d287ec171fe 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.29.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.29.bb
@@ -14,6 +14,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://run-ptest \
+           file://CVE-2026-23679_CVE-2026-47104.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"

