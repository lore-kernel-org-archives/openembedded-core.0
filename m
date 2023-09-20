Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29B2CD13CF
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:09:49 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.2706.1695247780082285996
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:09:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EsbATmKV;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690d2441b95so154137b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695247779; x=1695852579; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWE+XYJHioY99/i7S2S9/FQhocvF1MiQlPzMNJRy7PI=;
        b=EsbATmKVpxY4Z/2+BoHBjxmhoPDchiRAf28N+fGrvpMnOh/1V/JsZ+e4t/UGW5UKNl
         Bec7CATTXUzc2yLslXH2P0CuO5S0/EKffyb9oa/hCwen0YU0w1XvbL1lBbLs1+jATFCb
         hOIn0Nc2FHjVoLs/2hSXum8REqb8l4qDj4gt3CVPUnevR7RqoLa1rBzwvFPNJ7TaXJE3
         4sqL/CI8FBf5I4abdg4rBeTqJ0VqSqgVsM4o/Q/jB+v1B5NPj+cZRLjo0A+1xvgacShb
         AFOYxbRF2tjDJ4tvFKxX9Cva2xHNtNZQhgCGmPE+dvO1zav5ytrafva/GK9C9w25UgL8
         QKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695247779; x=1695852579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWE+XYJHioY99/i7S2S9/FQhocvF1MiQlPzMNJRy7PI=;
        b=cZa2JJV9aAqVROy6wG3vlyczMSzn3iOk1x/N6nTtlE2fq5DEQ6Lc+3d2L4o/GRlfxn
         hocZoCbiBupeecGiTj4cFkOcP4xw20TVpvs34FZMj7BKwxPIbxTYpqpEQGFiJ/VeIrV+
         +Ldnjy/vMy7Nv/FvlzxxDkE5MiE/xb89wk8VeROo6zVuAAVYvQUOTmLl0To+brqrNXBI
         +AJHe5U7YCaPDiDAjZZ7BsVB9XoEnZMqY2XHvg1VYnTYHbOGi3Ltw+FrOeltf8CHrjPc
         7sL/qZgQEWkvJqF4zuyVdJ/VIBYxJ/m6ZCG8Xn7/yVMrhztVNTlP+CcaafWL9YdtQZmG
         +BYg==
X-Gm-Message-State: AOJu0YxYfFi3MU4X62jNvGGv4od67PtdEefzq9h+/j7REHInwX64euMH
	1kpd/4ClhhrV5l/ISvSy9q5Rw+X4CPo=
X-Google-Smtp-Source: AGHT+IFfoLMur1QYypxX8ac4Z4OS0/thRpIcYexsKrBKcEIvm6NAHqkTdd4Bgd2bkJcyYur0IX12bg==
X-Received: by 2002:a05:6a00:2287:b0:691:27b:15b4 with SMTP id f7-20020a056a00228700b00691027b15b4mr768555pfe.5.1695247779207;
        Wed, 20 Sep 2023 15:09:39 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id r22-20020a62e416000000b0068fe68de4e1sm24324pfh.145.2023.09.20.15.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:09:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2 2/3] bsd-headers: Add error.h
Date: Wed, 20 Sep 2023 15:09:34 -0700
Message-ID: <20230920220935.970957-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920220935.970957-1-raj.khem@gmail.com>
References: <20230920220935.970957-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187945

error.h is used in many packages and we can use this to provide for
these packages and report the portability problems upstream without
patching the packages here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Make Subject more relevant to change

 meta/recipes-core/musl/bsd-headers.bb      |  4 +-
 meta/recipes-core/musl/bsd-headers/error.h | 60 ++++++++++++++++++++++
 2 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/musl/bsd-headers/error.h

diff --git a/meta/recipes-core/musl/bsd-headers.bb b/meta/recipes-core/musl/bsd-headers.bb
index 887a8160313..91dc239f888 100644
--- a/meta/recipes-core/musl/bsd-headers.bb
+++ b/meta/recipes-core/musl/bsd-headers.bb
@@ -1,7 +1,7 @@
 # Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
 # Released under the MIT license (see COPYING.MIT for the terms)
 
-SUMMARY = "BSD compatible headers"
+SUMMARY = "Legacy compatible headers for musl libc"
 LICENSE = "BSD-3-Clause & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://sys-queue.h;beginline=1;endline=32;md5=c6352b0f03bb448600456547d334b56f"
 SECTION = "devel"
@@ -9,6 +9,7 @@ SECTION = "devel"
 SRC_URI = "file://sys-queue.h \
            file://sys-tree.h \
            file://sys-cdefs.h \
+           file://error.h \
           "
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
@@ -21,6 +22,7 @@ do_install() {
 	install -Dm 0644 ${S}/sys-queue.h ${D}${includedir}/sys/queue.h
 	install -Dm 0644 ${S}/sys-tree.h ${D}${includedir}/sys/tree.h
 	install -Dm 0644 ${S}/sys-cdefs.h ${D}${includedir}/sys/cdefs.h
+	install -Dm 0644 ${S}/error.h ${D}${includedir}/error.h
 }
 #
 # We will skip parsing for non-musl systems
diff --git a/meta/recipes-core/musl/bsd-headers/error.h b/meta/recipes-core/musl/bsd-headers/error.h
new file mode 100644
index 00000000000..9a4e1f8d006
--- /dev/null
+++ b/meta/recipes-core/musl/bsd-headers/error.h
@@ -0,0 +1,60 @@
+#ifndef _ERROR_H_
+#define _ERROR_H_
+
+#include <stdarg.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+
+#warning usage of non-standard #include <error.h> is deprecated
+
+static unsigned int error_message_count = 0;
+
+static inline void error(int status, int errnum, const char* format, ...)
+{
+	/* should be fflush(stdout), but that's unspecified if stdout has been closed;
+	 * stick with fflush(NULL) for simplicity (glibc checks if the fd is still valid) */
+	fflush(NULL);
+
+	va_list ap;
+	fprintf(stderr, "%s: ", program_invocation_name);
+	va_start(ap, format);
+	vfprintf(stderr, format, ap);
+	va_end(ap);
+	if (errnum)
+		fprintf(stderr, ": %s", strerror(errnum));
+	fprintf(stderr, "\n");
+	error_message_count++;
+	if (status)
+		exit(status);
+}
+
+static int error_one_per_line = 0;
+
+static inline void error_at_line(int status, int errnum, const char *filename,
+		unsigned int linenum, const char *format, ...)
+{
+	va_list ap;
+	if (error_one_per_line) {
+		static const char *old_filename;
+		static int old_linenum;
+		if (linenum == old_linenum && filename == old_filename)
+			return;
+		old_filename = filename;
+		old_linenum = linenum;
+	}
+	fprintf(stderr, "%s: %s:%u: ", program_invocation_name, filename, linenum);
+	va_start(ap, format);
+	vfprintf(stderr, format, ap);
+	va_end(ap);
+	if (errnum)
+		fprintf(stderr, ": %s", strerror(errnum));
+	fprintf(stderr, "\n");
+	error_message_count++;
+	if (status)
+		exit(status);
+}
+
+
+#endif	/* _ERROR_H_ */
-- 
2.42.0


