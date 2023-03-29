Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECD4C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 06:52:03 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.18122.1680072721019698190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 23:52:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VDSdRlZo;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id d8so8687529pgm.3
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 23:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680072720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2eMZQG/qiOV4Qlwe1FImnwmL1Of70ho7hb8Iau1kOcM=;
        b=VDSdRlZoKT2b6LvVLbGpFll4IlYevI/b1aOVrlOWketUNRBA4YPT6EPq8HRR0C6DND
         SxVUF8nDCeJXHa101zXgtqE8VmsPAXg0T0hrRljTnemUfm1/ckidJKIZgRWGhQex0aSa
         R8AeKR6v/dM36xE9X2GsAnz2/zHGHbZu17RY3GXV/dC7XuyH3CFpbgZ7lTTXcixvmjww
         39aiHni3VLvodGs7P8AjvyIz0RjT/FRibfMr+V1QU0GmMlKcxuM7sae8noCxc/k+cqAh
         hhZclGrFPxA2P13Thhpf6oSeZjr37GNI+ti2lSOt8RNCPBUGdew7blUGwrdHeujKK9JS
         mYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680072720;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eMZQG/qiOV4Qlwe1FImnwmL1Of70ho7hb8Iau1kOcM=;
        b=Vw4N/yMhzwDR1M0IGWqBedNhgRGsc3JpT7wMewmB0l5EPLMQGnWLF1FuOnIHgcTRER
         8zHu5W8VY+gIj8J3zAWQNLPhfVYSyDO3FUIf+Qdu7TktqdPslIdtBQR5CJrXjUk7G/6S
         QOYBHlnCOkKpqEbsrgw4zebHSgz6r+O0kwc1jqSeDRw0ymbfHjpnmPOqMqw5SzUFNZV8
         IEPt1dlIKbvkmbuLyVeLhR+J4EApcZX+Ve7vE+uPhnrf2fiRfvhsMd2SiydXmhL2ECDr
         lquBNeMJSJx9eoGO3JayJxH1PkcTjaJAH0sAnuPI42rurbul/TPLahDh5L/9I/DCGlJi
         8qRw==
X-Gm-Message-State: AAQBX9dtp2EDFa0Z4BElTv+Ztd836brmIY50PyRW2WSK3yLjPx8/E+B5
	4xmVDI+bYshJNZmWKYdsT+xdgL9WnjYbIBg=
X-Google-Smtp-Source: AKy350YOokpnTXV4rWqF5xttH2EbaUH4xlXiRgZj3LlW7vsUgEgTL1zlmaVLT5t+sMaI6ub3DfeY8Q==
X-Received: by 2002:aa7:946f:0:b0:62d:b210:8c9d with SMTP id t15-20020aa7946f000000b0062db2108c9dmr788867pfq.32.1680072719988;
        Tue, 28 Mar 2023 23:51:59 -0700 (PDT)
Received: from localhost.localdomain ([103.171.194.54])
        by smtp.gmail.com with ESMTPSA id v5-20020aa78085000000b006254794d5b2sm10650678pff.94.2023.03.28.23.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 23:51:59 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
To: openembedded-core@lists.openembedded.org,
	sanak@kpit.com
Cc: ranjitsinh.rathod@kpit.com,
	Nikhil R <nikhilar2410@gmail.com>,
	Sana Kazi <Sana.Kazi@kpit.com>,
	Sana Kazi <sanakazisk19@gmail.com>
Subject: [meta][kirkstone][PATCH] busybox: Make high ASCII chars printable
Date: Wed, 29 Mar 2023 12:21:52 +0530
Message-Id: <20230329065152.2588019-1-nikhilar2410@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Mar 2023 06:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179262

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
 meta/recipes-core/busybox/busybox_1.35.0.bb   |  1 +
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
diff --git a/meta/recipes-core/busybox/busybox_1.35.0.bb b/meta/recipes-core/busybox/busybox_1.35.0.bb
index e9ca6fdb1a..75b7975ff7 100644
--- a/meta/recipes-core/busybox/busybox_1.35.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.35.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0002-nslookup-sanitize-all-printed-strings-with-printable.patch \
            file://CVE-2022-30065.patch \
            file://0001-devmem-add-128-bit-width.patch \
+           file://270-libbb_make_unicode_printable.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 
-- 
2.25.1


