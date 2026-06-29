Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C3CC44501
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 14:20:49 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93241.1782742840151955116
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 07:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kCX/mm5y;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45fd464d51fso1942212f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 07:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782742838; x=1783347638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AASe5hNtm3+pyHRJiSSUb8NINtGmY8YOjsgGM8RCKwM=;
        b=kCX/mm5ycq3Pd2eFJTU9ac6c/CXKX0bEtPeqIzicIgVx8Moy7tYE24iXrdCLcZ33A6
         3aLKIvnMgvqHi2M1vYLNi0msDHjIlPt1VT8+HqrVC7cbOi4ISrrzgGB0AsFs6m9kz1j9
         o3g5ANuFZnLMu1YWig+olqKJt03ONxbo7TBJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742838; x=1783347638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AASe5hNtm3+pyHRJiSSUb8NINtGmY8YOjsgGM8RCKwM=;
        b=Ar0rViy3PTCVXDflLc0VGSIc2+iRcTELQ+LMRJPm8bsY2zDbHhU6sFfeXiEVmb5H7+
         X7h1YYdd/5JX0aJTWkgwYJUKS4FBh2vVUTCxE9nqrI7TOlZx96PlD/I73WGUxjvopbwR
         3JtprIeYX1TsIzTCfMzeHfupIiKtndOucUKLvdHp4VNBPJ3+qz82hqi6K6Is8jNeACxb
         AuKA/OK+HKEU5BCtKG9kafrv/HkZKmrd2eWGjCwnUz9xzxMLoR18F7b27t3cp6xXFEHs
         PgSIwbCB7m5zTK3wuocLNmdpC26YX06RT+5o4YtfKh4bKpZRqBcNLqchbijSW7glkuXj
         VE0Q==
X-Gm-Message-State: AOJu0YzHPS2SqKfhANaahqQnMVxF+rkFqGZvfvhjiT/CwXs8R9I1gtuK
	ijDsBycyq6kiJlDV7p8U3OYFPyk5Sfm/3r4+vQsAChX8MbGh6CbvM52Zlh/hrATwXFUifd/wzjR
	zw9OpNP8=
X-Gm-Gg: AfdE7cmnGfKPK5ESCfrssqmV4XfTkicjsn6goTPdDKb4HJ2pgnKt0bU3QD8UQMRkLqv
	2i+6ZlOKbH0uw8iQuifurl8dlsTMqPXaCydOXfuWCkRzcW9UAMMisGSwtINWpq6H0vVWISWbstI
	2ln8lINYtwTM/cyUwYhyXNSN8VweLV9OPmPazL3SipMy+Qzwg+ZTdbHRs6nXSKw1h00bExcKmIg
	BT7UOzg69SB2JddAL8iNx0SgUWdpgX2f6jHAm7e5pXYakXyuJx81MvDSwNNQaPR0cUEwNOibvii
	VwHaYUQ9THffZEo3F0pX6Dt97f77gmS9vzJjM5Xrj3FsYL+hEuCISZ5wfbkB2TT83ERwg+p+YpI
	S6NtbgTwBvEcocH51iLSl07zVL0TTciGu6shYxagwyFkb2TETgNjbBLLcCkogwN5R1Ta3G71MMD
	pxwKlapjvzgEfeHDEWXDn0BttTCRYL0YYJiIUUzP+5bCZss/qVIWwm6QJ9U+VKGEHrpxdWAWaum
	nbskuk2M6vNjrF846GDGsfRGIu9FRr72g==
X-Received: by 2002:a05:6000:4210:b0:468:7ca1:2368 with SMTP id ffacd0b85a97d-46dc2a17107mr30603045f8f.29.1782742837701;
        Mon, 29 Jun 2026 07:20:37 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f8d6f10absm44958410f8f.5.2026.06.29.07.20.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:20:36 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/19] libusb1: fix CVE-2026-23679 and CVE-2026-47104
Date: Mon, 29 Jun 2026 16:19:59 +0200
Message-ID: <22580c001cc7426a6844cdc128120031c47d0d3b.1782742373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782742373.git.yoann.congal@smile.fr>
References: <cover.1782742373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 14:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239802

From: Anil Dongare <adongare@cisco.com>

- Pick the upstream patch [1] as mentioned in [2] and [3].
- To successfully apply the fixed commit, apply the dependent commits [4], which are
  included in v1.0.28.

[1] https://github.com/libusb/libusb/commit/bc0886173ea15b8cc9bba2918f58a97a7f185231
[2] https://security-tracker.debian.org/tracker/CVE-2026-23679.
[3] https://security-tracker.debian.org/tracker/CVE-2026-47104.
[4] https://github.com/libusb/libusb/commit/016a0de33ac94b19c7772d6c20fbea7fec23bf68

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...-2026-23679_CVE-2026-47104-dependent.patch | 46 ++++++++++
 .../CVE-2026-23679_CVE-2026-47104.patch       | 88 +++++++++++++++++++
 meta/recipes-support/libusb/libusb1_1.0.27.bb |  2 +
 3 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch
 create mode 100644 meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104.patch

diff --git a/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch b/meta/recipes-support/libusb/libusb1/CVE-2026-23679_CVE-2026-47104-dependent.patch
new file mode 100644
index 00000000000..04f1e684263
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
index 00000000000..d868207e9aa
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
index 5bf854f95d4..3c463301644 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.27.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.27.bb
@@ -14,6 +14,8 @@ BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://run-ptest \
+           file://CVE-2026-23679_CVE-2026-47104-dependent.patch \
+           file://CVE-2026-23679_CVE-2026-47104.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libusb/libusb/releases"

