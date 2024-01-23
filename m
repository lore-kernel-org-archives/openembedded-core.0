Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0405BC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 05:28:46 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.5314.1705987725006748987
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 21:28:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FsdERwmG;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bb53e20a43so2935757b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jan 2024 21:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705987723; x=1706592523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0rfJbwQyCT/hVnwNYjOqurDofHOUFwt6Nie79kmUstI=;
        b=FsdERwmGh/OquScRQyByUgisNkCf7h1gdlV8uHyhgbed0W0JNBswqlnzg4auDFS6S4
         yZSwquL6lZKI9C0Xvk34XoeMVYe0+Ji3Wg3ysPbzPqJ7VpBjCFUbgdW0G8g6R6Z9qKsW
         eeUup65ZVBmxcwg0uIYzVFOFajUNimYooVYxRVIpW821JzRq5bNZZkCCY6qRWna/CMuj
         M2X9DkHsXO72cubMKjO/4uoLpODIVrwEB7L7Qy9SNFG6nso6O1axONjuZtQ88HXE2p0r
         CPhYJ+Bw9xLD8Xtofsiei+9HGUWYZgIQXi3eOzIJcPsyr9yBTyp1OvNHblaZL1oFCkcD
         pPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705987723; x=1706592523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rfJbwQyCT/hVnwNYjOqurDofHOUFwt6Nie79kmUstI=;
        b=lrBP+QvE18W19ViIQefXHSqOyfb4qu/ob4QQ0+YWcPujBLW7sXN91SS8NU9MgeDHFk
         7RMD57J/6Y8DkC7VTiaT2VBctWP76YkLUKHJ68/FGLfL7qSWrIcIrvEqKaZN54Cp2HaM
         d3W7ezhocP+72zKFD70DDUVM4JHOhsQUk3GbvbRVUppR4h1iRhP7BRVJLZ3ko+uV+D5z
         Nxhu/eyltBShMPFO+QZulkYxs91S3/XXoqg8AkuZyOUhezD2lAShAs4E0kDDho4WyAt6
         c7x7BpwGMAll/Qhy6jJez7y3F5Cdtqf7ermxyzOXEGRZG2iHN+7qzEW4oc42kp8JGlDi
         xDvA==
X-Gm-Message-State: AOJu0YwPjb0Hb20nEYcFyu7v5HSzKLihQU6V7wv5OiACvfh8blQG8VD1
	2qG1NTe97PSThqRVQ9th6zq23LsFRpN0ICeAAHUBap2KWWItmALh4v/xAsvh
X-Google-Smtp-Source: AGHT+IFuHQU7zf2W1bBYa3+1yXKZLrzxVpn0u0tmCLEbRo7AlmR5Q02cEa147rIvNFH2NKMaH4z5Og==
X-Received: by 2002:a05:6808:3cf:b0:3bd:a2fd:5008 with SMTP id o15-20020a05680803cf00b003bda2fd5008mr5702430oie.75.1705987723488;
        Mon, 22 Jan 2024 21:28:43 -0800 (PST)
Received: from L-18076.kpit.com ([2401:4900:5629:fff2:efba:1026:6c89:161a])
        by smtp.gmail.com with ESMTPSA id ff21-20020a056a002f5500b006dbe165d513sm2640047pfb.76.2024.01.22.21.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 21:28:43 -0800 (PST)
From: virendra thakur <thakur.virendra1810@gmail.com>
X-Google-Original-From: virendra thakur <virendrak@kpit.com>
To: openembedded-core@lists.openembedded.org,
	alex.stewart@ni.com
Subject: [dunfell][PATCH] opkg: Fix bad memory acces error observe in file_read_line_alloc
Date: Tue, 23 Jan 2024 10:58:20 +0530
Message-Id: <20240123052820.50430-1-virendrak@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:28:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194201

In the case of a zero length string being returned by fgets(), the condition
checking for a trailing new line would perform a bad memory access outside
of `buf`. This might happen when line with a leading null byte is read.

Avoid this case by checking that the string has a length of at least one
byte.

Link: https://github.com/ndmsystems/opkg/commit/8b45a3c4cab95382beea1ecdddeb2e4a9ed14aba

Signed-off-by: virendra thakur <virendrak@kpit.com>
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
2.25.1


