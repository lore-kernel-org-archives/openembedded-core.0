Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4E6DCE79AD
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 04:33:19 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.web10.29877.1695184395625442378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 21:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MJQakMlK;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59c0d329a8bso45828347b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 21:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695184394; x=1695789194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaxH8kQ9oYfroY0iEr87c28vPsFrzPKmCEkIJGsQYFU=;
        b=MJQakMlKJ5ewqchFgKPIBLqBlNf7TDO1wO32qtnMZBbfRZvl4w+Hr1gwrWMv1DXlOV
         bnBVE/T6Jio0tW34VmwtxreJPq8STeOgese7aeF1juAeiSiq5x7igIsRtuYur26W6Q5+
         0vTmb3BzEa+eZA00IZ1+YgzmBh6W8tKqmAq7Hyi8lKeEC86WDONPkADUB81oEraF2JBq
         49EkiUOsM4Tc327DRy2Ixdx2pSKecpPSDY1Ww4wQNlJr2ACCJcHo1aUJdTUB0s8J9GO6
         Lg1FqgrQigY+uKd1Jg1lMBGlM6X80gCFwM1ae0Zj2MUtxBzJC+16/iKOlUG7XCTbuVkZ
         NRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695184394; x=1695789194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaxH8kQ9oYfroY0iEr87c28vPsFrzPKmCEkIJGsQYFU=;
        b=HHhbleipY1Jhxip3OqwUWhW2CEzHl042b84iu+S4n0QaDDikW1ibqcUgAaDctGA51P
         o/lJH8Vs8ouXJsGoYC4KJSUXPc/+10P6OA1j3uEU0ejov/vFKTIfg9XayVGernl0NoBW
         dOweRUnQlV/stLLGPQyOlBVowHHvRQIpq2x2577pAWgiy9cBv0nIjyiIUABsTa6Oo2WG
         yd7vdE8PS7pJDS9LFGPrg2cWsN+4EU3hMvb8nWMSH65un+/QIPYwBfy/Z4T38pZd/uMG
         YF3sLi0vMcUcWbljbkYnukWONFJz1c8cqYWO83wPuhFXAPD9RWNbEM4M95v5nRPp6fzo
         cmIA==
X-Gm-Message-State: AOJu0YwieQoUgjxVMu1FpnUjAbjWu5Zx59f01iCN0dojPj8F5oZmtRGU
	gDS0ePuOAm7o8AC/tVDA3nJbjM3rdoA=
X-Google-Smtp-Source: AGHT+IFtEis/BJjhcrsLy4yCDxnL/995DYYYrOPyYxwPPcN5vIoXWatpOnHJ1uHeLrj1mXYjYXAgkw==
X-Received: by 2002:a0d:e8d2:0:b0:586:9cbb:eef4 with SMTP id r201-20020a0de8d2000000b005869cbbeef4mr1610371ywe.2.1695184394553;
        Tue, 19 Sep 2023 21:33:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::cb5])
        by smtp.gmail.com with ESMTPSA id l2-20020a637002000000b00570668ccd5bsm8845828pgc.14.2023.09.19.21.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 21:33:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] bsd-headers: Update cdef.h and add error.h
Date: Tue, 19 Sep 2023 21:33:09 -0700
Message-ID: <20230920043309.265060-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230920043309.265060-1-raj.khem@gmail.com>
References: <20230920043309.265060-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 04:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187887

error.h is used in many packages and we can use this to provide for
these packages and report the portability problems upstream without
patching the packages here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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


