Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288F7C36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:40:59 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.42755.1744018851909555396
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:40:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IZwJeIMX;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so2504860f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744018850; x=1744623650; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iPrpgJo5foRgvBpiqptnXaxrdNknhyCP2UwPgiUcChE=;
        b=IZwJeIMX0qFm//ML0GWRV2u2H4U25GfcFG4c7j2rWSIOUZKzNZ5TuZZb8GdWQh5Ut/
         k07sdD6Zbfu5CJAHdgNAnXQN8LwZyfwI6SRFFoHaITQwXV2CwyP23ttDMkTFPsZBSDVk
         KcnHiJgXEy5LSHVuU6P8N5aVga/UR6e88UTsmtuPxWeorjcHFfelIHSdaiBpYMrTwiQx
         EyYeV3SxVEhTqKtYMJnZpfnK9P2SZjBaB/9Vdfwk3GUV2VS3vYYaiNKG2FRI678VVpdD
         5LIeDB/mxP5K66ySXQPOshZ/7vX7btlqKbNGLWDSH3tzFklExgPk/5cciu3Zo7XGLPey
         a9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744018850; x=1744623650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPrpgJo5foRgvBpiqptnXaxrdNknhyCP2UwPgiUcChE=;
        b=oJ/kNZcIMCtkS5AZ75DpgwJW8ys2VF/HdNOlvBCwpAeTPj6acTh/7vZMrXK7ZApln3
         vcsFqI0v9BDgf7oUDv02m+uHX0i+bM47D4rJi9Ppzm/Z0I6BIFd8XyYMiPHzPu6TegHa
         8sIxOr98svSoV+2ZXWaE/UTYwAt0Yhobjy912vmCp6cyJzsX0DFvIHr5ro9V+U8C3NFq
         bVzzyf7ssbb7IpSVg2vzp/79+nyduJYlinGKoYbSKtSY0Uag0Ka8zwkiB0WQCrpxqiBL
         YE4A3Gc/FCGrdarhZadnFNz9EUwDPbYLKlD5xbNjQi1hn9+WNlInLCrX4/sRpusXaDVM
         fHYA==
X-Gm-Message-State: AOJu0YyISg0YFDFnVbmmSb7AmbaxSnHI59knJt/9R4dbjLBI3EENz+XR
	UGKdcl32+LOf7jrVwRhY2+/IOjoY8HjLyk1yQtBQ+vPyG9S6/dW3KKkfbQ==
X-Gm-Gg: ASbGncuv+3TlSTpMYC8wo5u1i9k7qmbjTG3TL7iwDSPXgp28gLVxBTQQd2A330NET70
	DuJHGI/Yd42hm1JE0IRua/tx+Se82fOb7CcnH3usPb0J08fFAHcQ+U8ug+rU1gks2Z/U8sgjcjA
	yBUlNraKBLUfu1V3FPQx8FT7TIZsfbPR3RnzzojcAZ2IPdtmzlpVXlp3gatW+qyd2aVqUYQaGYx
	AolJYQR/gmZUAjwDq1jeO38qSL5N6QQbDHpg7bzzodwIYlgBzRtnoi/cJq9cp28diMRSvWLXpGt
	lrSU22HSXfpnzrsqt0bP81obmxDHy9ji/jNrUnLcukTovVrgKYVfa1A7E+0Ix5zAGHm17EQ13Ri
	YPnjP4sjcy16+B++F
X-Google-Smtp-Source: AGHT+IHYLXmi1olQFdV/cSS1eJrBS6yy2myHv7JWbtK//XNuSlJkxw2M7TpICBvAZ+9mwwHBuZ7DGg==
X-Received: by 2002:a5d:648a:0:b0:39a:cd84:a77a with SMTP id ffacd0b85a97d-39cba9332b0mr9330200f8f.37.1744018849808;
        Mon, 07 Apr 2025 02:40:49 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a76cesm11562459f8f.37.2025.04.07.02.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 02:40:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/18] nfs-utils: replace problematic pending patch with upstream submission
Date: Mon,  7 Apr 2025 11:40:28 +0200
Message-Id: <20250407094045.753021-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Apr 2025 09:40:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214410

From: Alexander Kanavin <alex@linutronix.de>

The now-removed patch was added for clang compatibility, but over time
started fixing problems that do not exist, and got its description
to mismatch the content.

The new patch is fixing the only problem with clang that still
occurs. I verified that all files that were patched before still
build without errors.

If you find other issues (this would be with non-default
options probably), please fix them similarly.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ect-warning-options-during-configure.patch | 109 ------------------
 ...mon.c-fix-a-formatting-error-with-cl.patch |  40 +++++++
 .../nfs-utils/nfs-utils_2.8.2.bb              |   2 +-
 3 files changed, 41 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Detect-warning-options-during-configure.patch
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Detect-warning-options-during-configure.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Detect-warning-options-during-configure.patch
deleted file mode 100644
index 69236e8278c..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Detect-warning-options-during-configure.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 1ab0c326405c6daa06f1a7eb4b0b60bf4e0584c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 31 Dec 2019 08:15:34 -0800
-Subject: [PATCH] Detect warning options during configure
-
-Certain options maybe compiler specific therefore its better
-to detect them before use.
-
-nfs_error copies the format string and appends newline to it
-but compiler can forget that it was format string since its not
-same fmt string that was passed. Ignore the warning
-
-Wdiscarded-qualifiers is gcc specific and this is no longer needed
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- support/nfs/xcommon.c          | 6 ++++++
- support/nfs/xlog.c             | 6 ++++++
- support/nfsidmap/libnfsidmap.c | 3 +++
- utils/exportfs/exportfs.c      | 3 +++
- 4 files changed, 18 insertions(+)
-
-diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
-index 3989f0bc..ff438c18 100644
---- a/support/nfs/xcommon.c
-+++ b/support/nfs/xcommon.c
-@@ -98,7 +98,10 @@ nfs_error (const char *fmt, ...) {
- 
-      fmt2 = xstrconcat2 (fmt, "\n");
-      va_start (args, fmt);
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
-      vfprintf (stderr, fmt2, args);
-+#pragma GCC diagnostic pop
-      va_end (args);
-      free (fmt2);
- }
-@@ -132,7 +135,10 @@ die(int err, const char *fmt, ...) {
- 	va_list args;
- 
- 	va_start(args, fmt);
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- 	vfprintf(stderr, fmt, args);
-+#pragma GCC diagnostic pop
- 	fprintf(stderr, "\n");
- 	va_end(args);
- 
-diff --git a/support/nfs/xlog.c b/support/nfs/xlog.c
-index fa125cef..dc4c9ea1 100644
---- a/support/nfs/xlog.c
-+++ b/support/nfs/xlog.c
-@@ -178,11 +178,16 @@ xlog_backend(int kind, const char *fmt, va_list args)
- 		fprintf(stderr, "%s: ", log_name);
- #endif
- 		va_copy(args2, args);
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- 		vfprintf(stderr, fmt, args2);
-+#pragma GCC diagnostic pop
- 		fprintf(stderr, "\n");
- 		va_end(args2);
- 	}
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- 	if (log_syslog) {
- 		switch (kind) {
- 		case L_FATAL:
-@@ -203,6 +208,7 @@ xlog_backend(int kind, const char *fmt, va_list args)
- 			break;
- 		}
- 	}
-+#pragma GCC diagnostic pop
- 
- 	if (kind == L_FATAL)
- 		exit(1);
-diff --git a/support/nfsidmap/libnfsidmap.c b/support/nfsidmap/libnfsidmap.c
-index f8c36480..1a28be0a 100644
---- a/support/nfsidmap/libnfsidmap.c
-+++ b/support/nfsidmap/libnfsidmap.c
-@@ -99,7 +99,10 @@ static void default_logger(const char *fmt, ...)
- 	va_list vp;
- 
- 	va_start(vp, fmt);
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- 	vsyslog(LOG_WARNING, fmt, vp);
-+#pragma GCC diagnostic pop
- 	va_end(vp);
- }
- 
-diff --git a/utils/exportfs/exportfs.c b/utils/exportfs/exportfs.c
-index b03a047b..eac1ff2a 100644
---- a/utils/exportfs/exportfs.c
-+++ b/utils/exportfs/exportfs.c
-@@ -646,7 +646,10 @@ dumpopt(char c, char *fmt, ...)
- 
- 	va_start(ap, fmt);
- 	printf("%c", c);
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- 	vprintf(fmt, ap);
-+#pragma GCC diagnostic pop
- 	va_end(ap);
- 	return ',';
- }
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
new file mode 100644
index 00000000000..a99ba284e02
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
@@ -0,0 +1,40 @@
+From cc59a7fe15b6ca2ee43cba0dc1d699323b36ffcc Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 21 Mar 2025 10:42:56 +0100
+Subject: [PATCH] support/nfs/xcommon.c: fix a formatting error with clang
+
+Specifically, this happens:
+
+| xcommon.c:101:24: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
+|   101 |      vfprintf (stderr, fmt2, args);
+|       |                        ^~~~
+
+A similar approach (print \n seprately) is already used elsewhere in
+the same file.
+
+Upstream-Status: Submitted [via email to steved@redhat.com,linux-nfs@vger.kernel.org]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ support/nfs/xcommon.c | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
+index 3989f0b..1d04dd1 100644
+--- a/support/nfs/xcommon.c
++++ b/support/nfs/xcommon.c
+@@ -94,13 +94,11 @@ xstrconcat4 (const char *s, const char *t, const char *u, const char *v) {
+ void
+ nfs_error (const char *fmt, ...) {
+      va_list args;
+-     char *fmt2;
+ 
+-     fmt2 = xstrconcat2 (fmt, "\n");
+      va_start (args, fmt);
+-     vfprintf (stderr, fmt2, args);
++     vfprintf (stderr, fmt, args);
++     fprintf (stderr, "\n");
+      va_end (args);
+-     free (fmt2);
+ }
+ 
+ /* Make a canonical pathname from PATH.  Returns a freshly malloced string.
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
index abbdec7808d..1f3afa05600 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
@@ -23,9 +23,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfscommon \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
            file://0001-Fix-typecast-warning-with-clang.patch \
-           file://0001-Detect-warning-options-during-configure.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
+           file://0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch \
            "
 
 SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
-- 
2.39.5


