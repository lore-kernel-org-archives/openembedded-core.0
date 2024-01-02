Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC43C47079
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 08:29:56 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.25110.1704184186655178257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 00:29:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HhM1f4/B;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6d9f9689195so1630876b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 00:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704184185; x=1704788985; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I7yJv8ULygEn9sbcPeJCx5hPXIvy6ONRuOeBXDX2KeQ=;
        b=HhM1f4/B+g67u9mjZ7LuRp9Co+Na73z0rSghFMANAp/O7h+CQzbhBogMIhDGA3+xE5
         xvv4W6cYSHLIUHOFetwATEGT9J5YSR5CydooocmrT1Vvrpf7HYa1s1GiQdT2qNJMBgRB
         6IevkYkJxrmwAojYCYL1p0KTV0KLR5qYlQKJJHmzxVxKrbiHvuOEOjzIvF+aaXEJpqr0
         uztUmFyogIPXMG21RziAjlc/tvwKN9XKLIXyHHDBkuWGXwTRCVTFpejDzwRy4cN7X3j7
         mvM6OiGrIe0v4WfSjV9GpvQqSZ5EGK2JxtKvyhBGLUwFmcI1VWO44yssStiknIiyR1M8
         SLOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704184185; x=1704788985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7yJv8ULygEn9sbcPeJCx5hPXIvy6ONRuOeBXDX2KeQ=;
        b=jDAtjOL9efId25xAW92QSN10IoI4QX46GLIXfePGUmcj4T1Uhqvzxyyov97h2s2i5j
         yF37Kq/kVOoS4+QhJxGmQj6rQGbFgkquChr+cCNTRgSltmzOUjxTx+tZ4QrKDPzcDrVO
         5oC1ArY6REa1PR1jF1G7foqYmhe15dwrvnIJXLXk13oAvGx0ih1OHbAzrL96u+TIFmuR
         nuEp9prEBZDOnL/1KpVQSHjoQ2ocgBjMBZ4aomBE4uphBfmuAeKRli3PNli7P4Y7xaWC
         PyOmBu0Z9+0DS4nUmUUlah+roIqsk5BlPMWpwOc+mXjNxDu22pMBLnH/mYrJz6LVYqNA
         mwFw==
X-Gm-Message-State: AOJu0Yxvhj9sMiGcckGt713Ir9C9CmlDbenzlu7h6gdR9ARBkRNJQ606
	zZGPDalf7H38Vg7f5/sNWptFXQ50ID8=
X-Google-Smtp-Source: AGHT+IGHK4NZKQoZskbf/0ZEMXVDq1be4LKun0zuo+kJTkIQC5p/1oqoBdL2pdwU2lw/DRL3+CKAIg==
X-Received: by 2002:a05:6a21:329b:b0:196:29e1:3230 with SMTP id yt27-20020a056a21329b00b0019629e13230mr4143377pzb.91.1704184185517;
        Tue, 02 Jan 2024 00:29:45 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id f30-20020aa79d9e000000b006d9ae6fe867sm15572202pfq.110.2024.01.02.00.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 00:29:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] connman: Fix build with musl
Date: Tue,  2 Jan 2024 00:29:41 -0800
Message-ID: <20240102082942.799830-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193218

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ....c-Include-libgen.h-for-basename-API.patch | 55 +++++++++++++++++++
 .../connman/connman_1.42.bb                   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch

diff --git a/meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch b/meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch
new file mode 100644
index 00000000000..8012606db7f
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch
@@ -0,0 +1,55 @@
+From cbba6638986c2de763981bf6fc59df6a86fed44f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 1 Jan 2024 17:42:21 -0800
+Subject: [PATCH v2] src/log.c: Include libgen.h for basename API
+
+Use POSIX version of basename. This comes to front with latest musl
+which dropped the declaration from string.h [1] it fails to build with
+clang-17+ because it treats implicit function declaration as error.
+
+Fix it by applying the basename on a copy of string since posix version
+may modify the input string.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://lore.kernel.org/connman/20240102015917.3732089-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+
+ src/log.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/log.c b/src/log.c
+index 554b046..2df3af7 100644
+--- a/src/log.c
++++ b/src/log.c
+@@ -24,6 +24,7 @@
+ #endif
+ 
+ #include <stdio.h>
++#include <libgen.h>
+ #include <unistd.h>
+ #include <stdarg.h>
+ #include <stdlib.h>
+@@ -196,6 +197,7 @@ int __connman_log_init(const char *program, const char *debug,
+ 		const char *program_name, const char *program_version)
+ {
+ 	static char path[PATH_MAX];
++	char* tmp = strdup(program);
+ 	int option = LOG_NDELAY | LOG_PID;
+ 
+ 	program_exec = program;
+@@ -212,8 +214,8 @@ int __connman_log_init(const char *program, const char *debug,
+ 	if (backtrace)
+ 		signal_setup(signal_handler);
+ 
+-	openlog(basename(program), option, LOG_DAEMON);
+-
++	openlog(basename(tmp), option, LOG_DAEMON);
++	free(tmp);
+ 	syslog(LOG_INFO, "%s version %s", program_name, program_version);
+ 
+ 	return 0;
+-- 
+2.43.0
+
diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/recipes-connectivity/connman/connman_1.42.bb
index c2fcd617aea..91ab9895ac8 100644
--- a/meta/recipes-connectivity/connman/connman_1.42.bb
+++ b/meta/recipes-connectivity/connman/connman_1.42.bb
@@ -6,6 +6,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            file://connman \
            file://no-version-scripts.patch \
            file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.patch \
+           file://0001-src-log.c-Include-libgen.h-for-basename-API.patch \
            "
 
 SRC_URI:append:libc-musl = " file://0002-resolve-musl-does-not-implement-res_ninit.patch"
-- 
2.43.0


