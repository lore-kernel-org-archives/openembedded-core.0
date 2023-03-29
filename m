Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7668C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 06:47:33 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.18071.1680072449436143241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 23:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfgrlkpz;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id z18so8651513pgj.13
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680072448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5zEcIhcS5dhArxDTe1+dlyTleyACwHdfeoM7qNeMn8=;
        b=lfgrlkpzTSuiKAZVSrf/ZkBOVaJmtd0ProTKwIb8QLZ5Gsq0ywMrjUonjvseEYYsz2
         N6vrhl7yEUn27714/V4V+/MMvdosnhu14Woz0Wr4aW+zwIp+wg5wWgN+XorIuPPicbMC
         JjFdSgVS733zN2JdYibvGLA5TUeiNPz0vAkzJYs1uGBnUgu3rD0GyS7MewGJiIsoOXuM
         iOJlp39Z0qyw89+2EyQZuAyxWDGb6dFm8ovzNXYCWZ+NgMCviQbWdxxsnhyN9M6ACChT
         +UeU0qNk+Sth4lrveqVUMqHVVxhWy0yTSapBEwe/BySpEJisn4OkHWb9eAasvPGhuJcz
         k1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680072448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5zEcIhcS5dhArxDTe1+dlyTleyACwHdfeoM7qNeMn8=;
        b=gTjmtosJROd5325UXUCS1Vax+V9KcoiDE2p6HaWslJ+QcyWgicbowo3an4y6HzyWi4
         cmtY7tiEjQcE0VFaHkWfewvpRhPqW/HHv0MYhNm3eMRf6p3YXQ8mbxwF2TWklZXtchzo
         1dSBZFGOG7jY1MkFsEvK2CMHmTm68a7rIwIT4+Mgg1p75fyRKMg/fOwYVcYLCb4BTVNo
         GOZBkptlPDNleUUyb1XVDidT9jdwo8zB1jxtEVzGnxFRMPh4cr2eZuvabLXd+CXSEWVJ
         mxICFi9ROoXVR+S50nIG1a6f/gzs+7mXSaoKUnZeOHbDZX9oy0b7pdSo1NDmQk5op04p
         DtCg==
X-Gm-Message-State: AAQBX9esMmacy5YsmuLqOSt9lE591AK7UkSaCnAGabqi3cWojlSkb5oX
	OX/72HSvhGp8rjUQJkGcVnyh+//g0RqWWmM=
X-Google-Smtp-Source: AKy350aRCYZ/IqC5wRdu9rbnmth96HWWUweCABL+wpsJ/IHcz8hWqRr/LJ2SP2lL6BxpO6YTOkqaoQ==
X-Received: by 2002:aa7:950d:0:b0:625:e728:4c5f with SMTP id b13-20020aa7950d000000b00625e7284c5fmr16657866pfp.22.1680072448119;
        Tue, 28 Mar 2023 23:47:28 -0700 (PDT)
Received: from localhost.localdomain ([103.171.194.54])
        by smtp.gmail.com with ESMTPSA id y3-20020aa78543000000b005ded4825201sm22196948pfn.112.2023.03.28.23.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 23:47:27 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-core@lists.openembedded.org,
	sanak@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhilar2410@gmail.com>,
	Sana Kazi <Sana.Kazi@kpit.com>,
	Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta][dunfell][PATCH] busybox: Make high ASCII chars printable
Date: Wed, 29 Mar 2023 12:17:17 +0530
Message-Id: <20230329064717.2486576-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 06:47:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179261

Currently busybox utilty "ls" fails to display filenames contains
UTF-8 characters and replaces with "?".

Steps to reproduce:
bin/busybox touch utf_test-Ü
bin/busybox ls utf_test-* > sample.log
bin/busybox cat sample.log
utf_test-??
bin/busybox hexdump -C sample.log | grep "c3 9c"

Therefore, above hexdump command is unable to find matching hex value
for the umlaute character.
Hence, change the libbb's printable_string() function to allow high ASCII
characters so that unicode filenames are displayed correctly.
This issue is not observed in upstream busybox.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
Signed-off-by: Nikhil R <nikhilar2410@gmail.com>
---
 .../270-libbb_make_unicode_printable.patch    | 39 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/270-libbb_make_unicode_printable.patch

diff --git a/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_printable.patch b/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_printable.patch
new file mode 100644
index 0000000000..001d2847fe
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/270-libbb_make_unicode_printable.patch
@@ -0,0 +1,39 @@
+busybox: make high ASCII chars printable (#7993)
+
+Currently busybox utils like "ls" fail to display filenames containing UTF-8
+characters, replacing any special characters with "?".
+
+Change libbb's printable_string() function to allow high ASCII characters so
+that unicode filenames are displayed correctls.
+
+Signed-off-by: Jo-Philipp Wich <jow@openwrt.org>
+Upstream-Status: Pending [https://git.openwrt.org/?p=openwrt/svn-archive/archive.git;a=patch;h=bbca780ca657d894fc457cac8eaaaec9d414bfc8]
+
+SVN-Revision: 43084
+---
+ .../270-libbb_make_unicode_printable.patch    | 20 +++++++++++++++++++
+ create mode 100644 package/utils/busybox/patches/270-libbb_make_unicode_printable.patch
+
+diff --git a/package/utils/busybox/patches/270-libbb_make_unicode_printable.patch b/package/utils/busybox/patches/270-libbb_make_unicode_printable.patch
+--- a/libbb/printable_string.c
++++ b/libbb/printable_string.c
+@@ -28,8 +28,6 @@
+ 		}
+ 		if (c < ' ')
+ 			break;
+-		if (c >= 0x7f)
+-			break;
+ 		s++;
+ 	}
+ 
+@@ -42,7 +40,7 @@
+ 			unsigned char c = *d;
+ 			if (c == '\0')
+ 				break;
+-			if (c < ' ' || c >= 0x7f)
++                        if (c < ' ')
+ 				*d = '?';
+ 			d++;
+ 		}
+--
+2.20.1
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index d062f0f7dd..3e0d888b05 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -57,6 +57,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2021-423xx-awk.patch \
            file://0001-libbb-sockaddr2str-ensure-only-printable-characters-.patch \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
+           file://270-libbb_make_unicode_printable.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.25.1


