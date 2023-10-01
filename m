Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D479E748F6
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:25 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.62417.1696176024690835717
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1J5mdrc3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c724577e1fso55922685ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176024; x=1696780824; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z4grpk/IikyrN3dXNuC1VJgUDQJxTFa+s/XmHKAOBNc=;
        b=1J5mdrc3EW4O+YTSzC69NG0o5VwCH5FU/iyviQunfUxGAtha5x56o/CndmpEDzJZqP
         1RIwWTNQD/b/LFj9MTmSHcQ2YXIWV7+QTwqG/8uM3ZMfGPdnQ8oPgPDGo4dsLsZfI6fI
         J1tqSJ51lfOTptJHNtQYwL8/tsJG9dt/unG83IuuzRXQIxtZbvfY1c8vOU9FVxfIn0pj
         cNh9WeFtNmA48eroLrJSQUxtvBZXxPCMhuYatT5EzZTZkvcoOvyhoQC6uk8sqNsiAxn3
         IRuPHpgayFtQ4As2EOT55m+aKhhhZhn4eHYUL7MbOWu0L0fMow+WDg3YvOWa4sTl2AwJ
         XREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176024; x=1696780824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z4grpk/IikyrN3dXNuC1VJgUDQJxTFa+s/XmHKAOBNc=;
        b=BV3lyWKdbQWGk4atS7txPSpMWjftAsM25OtTcBfzHDdAfu7AenZ0gBtu0gTBCdRcrQ
         jazvbkGAVvW3vvLxd9pAqqIpYqJi+QoDWQM9AYgZhCjmpwCCXkj/8xdN2tAtFNSzqoWC
         899kdzr7i776BVQqBHRGDPsFMr9GGSC8ZtjwAoglXzp9NeN7Ee+fta1rZpeqh6T1zHMI
         yu94Rolba8nI+xoqT+0niE/qTbHqmP890NgHm97NY0L8IQJrIWrITcO7SsBv5Ez5aclQ
         b7SdbtQDbmXiRgOXHrI78mvBrE7dC2yKJ83Qlf+V/2vJs8kauq+l+m8Tdn+1FlgZZIRW
         f/Xg==
X-Gm-Message-State: AOJu0YwFZNrT/ekX7g/TJwNT0jDM3jmNI7eyFSIBcnbuVFydeKrnzqsO
	w49+zjNZz+Ih6E7wUa0FrXhD78ASp4ntHum8D/KXzw==
X-Google-Smtp-Source: AGHT+IFQpLtMSZB2bvgJbpr6ugdk37U/Rc1+xxneEDkhZJyFMti16ZT6FM1YmA87ZHAy1Udr8sdPHg==
X-Received: by 2002:a17:903:26ce:b0:1c6:1928:59b9 with SMTP id jg14-20020a17090326ce00b001c6192859b9mr10014811plb.10.1696176023368;
        Sun, 01 Oct 2023 09:00:23 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/23] file: fix call to localtime_r()
Date: Sun,  1 Oct 2023 05:59:50 -1000
Message-Id: <c99d7fc46a1070b1c659ed16fbff6a3553aaf209.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188492

From: Joe Slater <joe.slater@windriver.com>

Depending on the version of glibc, localtime_r() must
be preceded by a call to tzset() or it will ignore any
value of TZ in the environment.  This problem will only
be seen when building file-native on outdated hosts.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 791145f3064d7807630d3591b9e7c7b2dc37152c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/file/file_5.45.bb       |  4 ++-
 .../recipes-devtools/file/files/print_c.patch | 27 +++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/file/files/print_c.patch

diff --git a/meta/recipes-devtools/file/file_5.45.bb b/meta/recipes-devtools/file/file_5.45.bb
index a7127023cb..8477668658 100644
--- a/meta/recipes-devtools/file/file_5.45.bb
+++ b/meta/recipes-devtools/file/file_5.45.bb
@@ -11,7 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;beginline=2;md5=0251eaec1188b20d9a72c502ecfdd
 DEPENDS = "file-replacement-native"
 DEPENDS:class-native = "bzip2-replacement-native"
 
-SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/file/file.git;branch=master;protocol=https \
+           file://print_c.patch \
+          "
 
 SRCREV = "4cbd5c8f0851201d203755b76cb66ba991ffd8be"
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/file/files/print_c.patch b/meta/recipes-devtools/file/files/print_c.patch
new file mode 100644
index 0000000000..760813f9c2
--- /dev/null
+++ b/meta/recipes-devtools/file/files/print_c.patch
@@ -0,0 +1,27 @@
+From e329257b8e22362b62e6c930447ef6feadd63f32 Mon Sep 17 00:00:00 2001
+From: Joe Slater <joe.slater@windriver.com>
+Date: Mon, 7 Aug 2023 22:37:19 +0000
+Subject: [PATCH] print.c: initialize timezone data for localtime_r()
+
+The man page for localtime() points out that while it acts
+like tzset() has been called, localtime_r() might not.  We
+have a local version of localtime_r() that avoids this, but
+we do not compile it.
+
+Upstream-Status: Submitted [file@astron.com]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ src/print.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+--- git.orig/src/print.c
++++ git/src/print.c
+@@ -289,6 +289,7 @@ file_fmtdatetime(char *buf, size_t bsize
+ 		goto out;
+ 
+ 	if (flags & FILE_T_LOCAL) {
++		tzset();
+ 		tm = localtime_r(&t, &tmz);
+ 	} else {
+ 		tm = gmtime_r(&t, &tmz);
-- 
2.34.1


