Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD0ACA0FEE
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 22:43:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.2524.1755816209416618362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Aug 2025 15:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CaKOuxIU;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb78d5e74so234631166b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 15:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755816208; x=1756421008; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+O/7ROG5ewgq6/fb53P2CYLkWGv2QJEPyFcP/MDen1k=;
        b=CaKOuxIUUdLhLODiFPT/iHouQPuv/VcDzmSeOFRQoRvLhBhVkW1gd2Tbac25GDQEvh
         kit/JKdayfdJVytX8qFsQuJmRmoYDNXjejSL+0MkvmZsXARiU9rlkaAKiJYh/n0Zj0kb
         KZvmcxcXh+SOMl/IWdr5KBnjFzlUCAEbOKk5R+zkQLlYf+r/yn8y5mTnMHhN9jbvkiDX
         Zssshfffju3l8K3gQyIXkslr6oAzdpg3KqXKfUyizMvhPHotCs3mBxYwjXuiLpxK17va
         0vMxs8F8L7q+fEZLIp5wAbMChHZy0qyj0vAZaa17Hnoo1/HLglk/STOoSrhqDGI0wNeI
         3Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755816208; x=1756421008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+O/7ROG5ewgq6/fb53P2CYLkWGv2QJEPyFcP/MDen1k=;
        b=g1pfQS8YrxgVluTpHwVILi4S++LIR93WTPyrdgyfenS3U6iYLTihd4EaRtJLwwqdM4
         EcY/RVbMr7DYS9xZbdTp3jiQa4lyOTFNf/A0jZMe6iyCA43qPc9czAMijmugLpj80w2o
         g5yAGSpPBsavF2UJ/eH+xxe7d/Sk00LulXhLrb3QIGRokYrAk0YhFiYO9ETVzSgYQ5o7
         gwGJcVnr8GeOq2/CvOCxOTTYBe22OzvG/x91QPILsz67k1d59UmO8lpbJV2af5Ss21zP
         +HtpZKvSzHBIDZ/WZASxoRLUF4HjRfqJH+NCXu/NIDbSWtAH+ljbT+4SUQ/38HHWexo7
         a9Kw==
X-Gm-Message-State: AOJu0Ywd0JFPDZyKf+7K5VQiKIUakz2wZ7B2+DTpk+1kbC9b/N6eYSl6
	rkBGvXNpANvXU0xlXb7APhY4dXXjbZBhfP+1CKT7/jTdANSzbVAUsTwwx+sFtg==
X-Gm-Gg: ASbGncti42eOw3GQe0Py2Ts8TvKE97TNQcH/+3mX9sLlkAGC42dOfL4s6MPoNnRwY9S
	FDwgGpSZK/Qm+plbOvVmvN6eoJg3EGhWgAmjMXcECL6BW8+wPBlBY2bcJc+4+aFuS4RJZDXzSSt
	NBcUfQWelu8RlUQZ0Q+jveJRlUipXTqL5nKFJExcdtjEGsLQRQLbB0BhTDaztbgEJrfF8ydnDcK
	XHEGW1I0+nCXQXRFgMKMn62m7/3ovFTv9V5lepJ9Az2MTm0sIohaKFNtAEm9T3TL1Mowoe11i+j
	CZ0byPu/uQs8TDbqCNJVjIme8g2t3kkt1TvOKUgpw0j1Em9Wm0dH4X0+Ohtu6jCZWz1zp+7fPU1
	v/yFdqjOlh/9zKt3PJ2JRwhjEnplyKcZfnNyp+N67QyGu7eLb0suhWVUG
X-Google-Smtp-Source: AGHT+IFL9ZJsCImf14b6H6HuVcaY8vppBc0C20B2/3XYWie9upPkATnkYBSVKVUqQaHXZKjtziPs1Q==
X-Received: by 2002:a17:907:97ca:b0:ade:7c6:498a with SMTP id a640c23a62f3a-afe28f767a7mr74280966b.10.1755816207679;
        Thu, 21 Aug 2025 15:43:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-afded530ecbsm474520266b.102.2025.08.21.15.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 15:43:27 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 08/15] libgpg-error: fix build with gcc-15
Date: Fri, 22 Aug 2025 00:43:02 +0200
Message-ID: <20250821224314.1690103-8-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821224314.1690103-1-martin.jansa@gmail.com>
References: <20250821224314.1690103-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 22:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222293

From: Martin Jansa <martin.jansa@gmail.com>

Backport a fix for native build with gcc-15 on host

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...oid-use-of-nullptr-for-an-identifier.patch | 52 +++++++++++++++++++
 .../libgpg-error/libgpg-error_1.48.bb         |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch b/meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch
new file mode 100644
index 0000000000..11ab7a2a4e
--- /dev/null
+++ b/meta/recipes-support/libgpg-error/libgpg-error/0001-Avoid-use-of-nullptr-for-an-identifier.patch
@@ -0,0 +1,52 @@
+From d14c69a7f256a9444c5c64b808d8767e5a8ba68e Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Wed, 23 Oct 2024 08:48:06 +0900
+Subject: [PATCH] Avoid use of 'nullptr' for an identifier.
+
+* tests/t-printf.c (check_fprintf_sf): Use 'null_ptr'
+as an identifier.
+
+--
+
+GnuPG-bug-id: 7344
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+
+Upstream-Status: Backport [libgpg-error-1.51 d14c69a7f256a9444c5c64b808d8767e5a8ba68e]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ tests/t-printf.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/t-printf.c b/tests/t-printf.c
+index c1ad0b0..87c201d 100644
+--- a/tests/t-printf.c
++++ b/tests/t-printf.c
+@@ -449,7 +449,7 @@ string_filter (const char *string, int no, void *opaque)
+ static void
+ check_fprintf_sf (void)
+ {
+-  volatile char *nullptr = NULL; /* Avoid compiler warning.  */
++  volatile char *null_ptr = NULL; /* Avoid compiler warning.  */
+   struct sfstate_s sfstate = {NULL};
+   gpgrt_stream_t stream;
+   const char *expect;
+@@ -461,8 +461,8 @@ check_fprintf_sf (void)
+ 
+   gpgrt_fprintf_sf (stream, string_filter, &sfstate,
+                     "%s a=%d b=%s c=%d d=%.8s null=%s\n",
+-                    nullptr, 1, "foo\x01 bar", 2,
+-                    "a longer string", nullptr);
++                    null_ptr, 1, "foo\x01 bar", 2,
++                    "a longer string", null_ptr);
+   expect = "[==>Niente<==] a=1 b=foo\x01 bar c=2 d=a longer null=(null)\n";
+   result = stream_to_string (stream);
+   if (strcmp (result, expect))
+@@ -475,7 +475,7 @@ check_fprintf_sf (void)
+ 
+   gpgrt_fprintf_sf (stream, string_filter, &sfstate,
+                     "a=%d b=%s c=%d d=%.8s e=%s\n",
+-                    1, "foo\n bar", 2, nullptr, "");
++                    1, "foo\n bar", 2, null_ptr, "");
+   expect = "a=1 b=foo\n bar c=2 d=[==>Nien e=\n";
+   result = stream_to_string (stream);
+   if (strcmp (result, expect))
diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
index 9f2b49209d..2106f3de85 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.48.bb
@@ -17,6 +17,7 @@ UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/libgpg-error/libgpg-error-${PV}.tar.bz2 \
            file://pkgconfig.patch \
            file://0001-Do-not-fail-when-testing-config-scripts.patch \
+           file://0001-Avoid-use-of-nullptr-for-an-identifier.patch \
            file://run-ptest \
            "
 

