Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A56BC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 14:21:22 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.17197.1706278874927543644
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 06:21:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MRxS3plc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-5c66b093b86so1260691a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 06:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706278874; x=1706883674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YWfK8+yjIMbkbaAoEu2wYE+OCiSqV5IhhKukIaxnto4=;
        b=MRxS3plcrVv9ar7+E2xUa+ru8xACgtczSE7Hqef/Om6OKDDNgCUc/aqqyggIW18H5S
         DEFCznyP7rcJYuoM6AsskBlM2Fd2x+Q8VwF8UP01N78teO/IZN6VuTtns0Rn42QLpESw
         rsGo0yzW61eoJSGbRmkCulBjn2Hv8sUfoeAZOvTt2hIJZpzMVTZKXDskI7KeefZQXzzo
         2lAUMhZH5d7Gkr1dlwEFPxF+uAg+jFIn8RbGk1seBtbM+ASPV/ALYIGlyO00T8Ed53LU
         9SwFAN1q8ms0FXbp1I5dp8CO6nky1mLlorj/j2yHpi3QOjnZhWBbhDOlFLXNyAG1VzWL
         21Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706278874; x=1706883674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YWfK8+yjIMbkbaAoEu2wYE+OCiSqV5IhhKukIaxnto4=;
        b=ADU9Xg/bYTXjDWcJmNs/D5HgMizlvdjYai/lYe4EyuXNJxcx4kND1Pus7G2C1BU7L7
         iyXOU6oWiOuRBmlh548UHvvS3LdQGQ+g+Cvlgc45gCOUGXheYJlghcMwDpkCv815SibS
         79ik98/XniXKms+ZZTQFfm1INDZku3lHjq3VT0NLGrkRimQbwWvpA9hXlIL+9vj3A1dS
         FNDoeCWhbd6QZcdfsjyGPFNciz26UoqxT4ceeiKhH2lujT1zy+FyLYNgp86ozN2mBLF/
         dRTkUyDKQPSLBUwP84fieWT4R83uuWsEMaPXVFGP/+fxfD9HfqK/ZNivKXB1vxb7sflv
         fdsQ==
X-Gm-Message-State: AOJu0Yyg9IYWxtgt31x8jybI2mPyeHxPZS30eHRfOf+LFBKR05/MVlIf
	8Ynrk8fbwAbc5Nid/LzGo1b6Dxv+vogRpxjGV+7eR7fvMdcwLO+6FrF/BL7usxc0yToXmr2bp3R
	KwDM=
X-Google-Smtp-Source: AGHT+IF0qIHCeVSKtnq98nwUlY7NiZ+9vG+BHIZeBYGJPTBi/h6xl89Yi6KuFwhUYFSK6pNX3hTI0w==
X-Received: by 2002:a17:90a:b702:b0:290:2480:12cd with SMTP id l2-20020a17090ab70200b00290248012cdmr1433701pjr.23.1706278873907;
        Fri, 26 Jan 2024 06:21:13 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id rr14-20020a17090b2b4e00b0029095a896c8sm1136458pjb.40.2024.01.26.06.21.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 06:21:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 7/8] opkg: Fix bad memory access error observe in file_read_line_alloc
Date: Fri, 26 Jan 2024 04:20:40 -1000
Message-Id: <32e3618891295cec1ee5d4195998aa97f93b2207.1706278642.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706278642.git.steve@sakoman.com>
References: <cover.1706278642.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 14:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194381

From: virendra thakur <thakur.virendra1810@gmail.com>

In the case of a zero length string being returned by fgets(), the condition
checking for a trailing new line would perform a bad memory access outside
of `buf`. This might happen when line with a leading null byte is read.

Avoid this case by checking that the string has a length of at least one
byte.

Link: https://github.com/ndmsystems/opkg/commit/8b45a3c4cab95382beea1ecdddeb2e4a9ed14aba

Signed-off-by: virendra thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...possible-bad-memory-access-in-file_r.patch | 50 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch b/meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch
new file mode 100644
index 0000000000..bec21e67f4
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch
@@ -0,0 +1,50 @@
+From 8b45a3c4cab95382beea1ecdddeb2e4a9ed14aba Mon Sep 17 00:00:00 2001
+From: Jo-Philipp Wich <jo@mein.io>
+Date: Wed, 1 Apr 2020 21:47:40 +0200
+Subject: [PATCH 001/104] file_util.c: fix possible bad memory access in
+ file_read_line_alloc()
+
+In the case of a zero length string being returned by fgets(), the condition
+checking for a trailing new line would perform a bad memory access outside
+of `buf`. This might happen when line with a leading null byte is read.
+
+Avoid this case by checking that the string has a length of at least one
+byte. Also change the unsigned int types to size_t to store length values
+while we're at it.
+
+Upstream-Status: Backport [https://github.com/ndmsystems/opkg/commit/8b45a3c4cab95382beea1ecdddeb2e4a9ed14aba]
+
+Signed-off-by: Jo-Philipp Wich <jo@mein.io>
+Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
+Signed-off-by: virendra thakur <virendrak@kpit.com>
+---
+ libopkg/file_util.c | 7 ++-----
+ 1 file changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/libopkg/file_util.c b/libopkg/file_util.c
+index fbed7b4..ee9f59d 100644
+--- a/libopkg/file_util.c
++++ b/libopkg/file_util.c
+@@ -127,17 +127,14 @@ char *file_readlink_alloc(const char *file_name)
+ */
+ char *file_read_line_alloc(FILE * fp)
+ {
++    size_t buf_len, line_size;
+     char buf[BUFSIZ];
+-    unsigned int buf_len;
+     char *line = NULL;
+-    unsigned int line_size = 0;
+     int got_nl = 0;
+ 
+-    buf[0] = '\0';
+-
+     while (fgets(buf, BUFSIZ, fp)) {
+         buf_len = strlen(buf);
+-        if (buf[buf_len - 1] == '\n') {
++        if (buf_len > 0 && buf[buf_len - 1] == '\n') {
+             buf_len--;
+             buf[buf_len] = '\0';
+             got_nl = 1;
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.4.2.bb b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
index 55be6547c0..3ebc27c8ee 100644
--- a/meta/recipes-devtools/opkg/opkg_0.4.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.4.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
            file://sourcedateepoch.patch \
+           file://0001-file_util.c-fix-possible-bad-memory-access-in-file_r.patch \
            file://run-ptest \
 "
 
-- 
2.34.1


