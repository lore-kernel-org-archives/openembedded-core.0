Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E8B2CE7A81
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 21:05:17 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.8587.1695416715451812986
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 14:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SWnwFMvd;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-690d2e13074so2571891b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695416715; x=1696021515; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duVE5ww/fJzXBiO/obhwyd3U4Ii+9k7V2DW3/+1YIyU=;
        b=SWnwFMvd1JJu47oqk7+NbLIP3og6tnn+BTZW7N9N/pg9XOpJR0wo4eOHSZnisC8M8r
         jr6om8WkmaKY4LdDnoAaVbe2ajwrs1k9yPuSo4//pB/uHxsxmkJsgX1v6Mcw1aTRC2eN
         l6ZgTic16y6GRhqlejebtZzYiPPH8FSpEiJbBjcRSexlMF195lhAAyh2TjVlnGk9VCLS
         8mJMvex5nBauN0PB4x/Oi3x0uUGWEw2DKXj/UPnSVZRZwXgIuUCE6qWEHl2q6FxB5aYh
         f3sIfSrady+ptu05gF7frXXWdLyXa/AtXKGcJfA0tcgq5RT2N2U02SWJyo8dQ+hjqjix
         NmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695416715; x=1696021515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duVE5ww/fJzXBiO/obhwyd3U4Ii+9k7V2DW3/+1YIyU=;
        b=T3aKktQAWRezSG9aBLwmqWKslhsxCz6RVy7rcXjootJ5TcVLJDnWbS58zwC+kPrAkp
         nz7TE9LI7eDtUPBhhI00kcvQxjBkPBrXgASW5IORE+R5kjadhekwNGHT+4GukymysvI6
         ns7DOmzCFtHFuMpa1mGfLFTOAxyyxqrzXoswAu6oFS8lqt8pVcIDPLfbCx+oxz1e7j6G
         EYjhNQtwy9/LivkadS1HSFwHXIx9+QHszXHmnXbHbMFEXLCpgbrm7yJUMMssqYfn6+of
         WBN/G9bfUunWdSCQDVFGWxSJvlytBy3RBxkcoRHTOB7wRhicCr5e75NnxKbZqJe+wfj9
         DCgQ==
X-Gm-Message-State: AOJu0YxlnFghKL8tSgB+e9EEDkYF2E0s+H3BAFHfc5vju0VJEE2y4sB+
	m4wJK8znr6b2hd6o/ads4C3CSCK0V33L1w==
X-Google-Smtp-Source: AGHT+IGJV2stIS4LcYrjLjTcDmL4vNM20l0f11UcGDe5lo4VABbagkO0FL12QI88gyoq+JvpIPLqew==
X-Received: by 2002:a05:6a20:b29e:b0:14e:3ba7:2933 with SMTP id ei30-20020a056a20b29e00b0014e3ba72933mr545358pzb.54.1695416714609;
        Fri, 22 Sep 2023 14:05:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id u15-20020a170902e5cf00b001a5fccab02dsm3943623plf.177.2023.09.22.14.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 14:05:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 3/5] musl-legacy-error: Add recipe
Date: Fri, 22 Sep 2023 14:05:06 -0700
Message-ID: <20230922210508.24087-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230922210508.24087-1-raj.khem@gmail.com>
References: <20230922210508.24087-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 21:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188135

This adds glibc error() API implementation which is needed by few
packages still.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v3: Added new

 meta/conf/distro/include/maintainers.inc      |  1 +
 meta/recipes-core/musl/musl-legacy-error.bb   | 26 ++++++++
 .../musl/musl-legacy-error/error.h            | 60 +++++++++++++++++++
 3 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-core/musl/musl-legacy-error.bb
 create mode 100644 meta/recipes-core/musl/musl-legacy-error/error.h

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e977c84fc82..f69f229fc85 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -531,6 +531,7 @@ RECIPE_MAINTAINER:pn-mtd-utils = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-mtdev = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-mtools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-musl = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-musl-legacy-error = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-locales = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-obstack = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-musl-utils = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-core/musl/musl-legacy-error.bb b/meta/recipes-core/musl/musl-legacy-error.bb
new file mode 100644
index 00000000000..5ce5a233ab1
--- /dev/null
+++ b/meta/recipes-core/musl/musl-legacy-error.bb
@@ -0,0 +1,26 @@
+# Copyright (C) 2023 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "error API GNU extention implementation"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://error.h;beginline=1;md5=2ee396b23e8507fbf8f98af0471a77c6"
+SECTION = "devel"
+
+SRC_URI = "file://error.h"
+
+do_configure[noexec] = "1"
+do_compile[noexec] = "1"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+S = "${WORKDIR}"
+
+do_install() {
+	install -Dm 0644 ${S}/error.h -t ${D}${includedir}
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
+DEV_PKG_DEPENDENCY = ""
+RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
diff --git a/meta/recipes-core/musl/musl-legacy-error/error.h b/meta/recipes-core/musl/musl-legacy-error/error.h
new file mode 100644
index 00000000000..9a4e1f8d006
--- /dev/null
+++ b/meta/recipes-core/musl/musl-legacy-error/error.h
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


