Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829ACC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:33 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web09.6946.1645799313233140360
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MINZ+jhc;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 132so4794516pga.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=43BZAjoR3xkOZfygsBD8XxejPmOMMqWpmVIluChVhPU=;
        b=MINZ+jhcqaXxaoXDgDRq/2lKXThJHJ4hWq4lPKyT1ctpa8qJMnMlngCNSw+7bj0GNy
         jaZ1w/OG3642n/BIbVkTpub37cACqY1uNDNp4NLOVV4QQy8GL3wCahbOPg8usCEftFx0
         Ot+mQJdjrhiNydazMEBddzALwlJhbzWWR+oVrhWixtgGhgvigVS/NBw4yw/mGM+l2Ag9
         YpYOq4caaM2Bg7Hx0NomZQwpxr68yMg+/J1nyeZ7FMTzfDaX0kQ8iMsfmMvBEBVCKHlZ
         zK1atdbruKx15Yx1KDSYRqln+U1yZC8b6IevgSvd2QNR5dgE0Du/3eX2yojdUi0RmTEQ
         pyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=43BZAjoR3xkOZfygsBD8XxejPmOMMqWpmVIluChVhPU=;
        b=EnzIw9EFHUvJurB2ft3X5n9gr3Kjnipj0BNRoVfv6fPXhiuE/DECiJpFMmqAmkAldn
         +4fAywArOMaa10kKirw/XEazKhgp0X8fc7fxOhbno6sYOEUYERaiMmSGkUmCrPIpTOf0
         q7m5fJRXMSBjCJOOkfyuX6YttSrOUcpX1hDbIHGxqrKgvCdVMv7/r7rNZsBWweIsXJNL
         fQTOF2G8zr8iEepaF+zYjxicktlw8W0QJHH+FPpQ4PiX8yyIp+fkNsEKZOCRMt92i+ur
         UqcX2zTXYFufxm/uvIRAMA7+3NLDWnMDvYgktMNzBBJCBQ+4PfMWsU/ud2+6SlYvM61W
         lsnA==
X-Gm-Message-State: AOAM531V/4mUpL3ywncc0XcH4uK9+iNEqMaUrFjnB80VvN+lVyiAJO6Q
	SNb9+P84nYHrKylHfNHk3BsQFbdAcOKvumia
X-Google-Smtp-Source: 
 ABdhPJyC538LA2DzeLc0q5R6SBU4ZJfuOyqMr7e/tCeHNHATlJvCamV4DeAq3ND2TZ8K/s/BjRwAVQ==
X-Received: by 2002:a62:ce87:0:b0:4e0:cf48:e564 with SMTP id
 y129-20020a62ce87000000b004e0cf48e564mr7995920pfg.15.1645799312176;
        Fri, 25 Feb 2022 06:28:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:31 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 46/50] grub: add a fix for an incorrect cast
Date: Fri, 25 Feb 2022 04:26:26 -1000
Message-Id: 
 <906ecdc9efbc1b4025c2c7a9797ebd374f8508af.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162392

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for incorrect casting from signed to unsigned
in grub's util/grub-editenv. It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...v-Fix-incorrect-casting-of-a-signed-.patch | 46 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch

diff --git a/meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch b/meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch
new file mode 100644
index 0000000000..0cd8ec3611
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch
@@ -0,0 +1,46 @@
+From 3d68daf2567aace4b52bd238cfd4a8111af3bc04 Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Thu, 5 Nov 2020 14:33:50 +0000
+Subject: [PATCH] util/grub-editenv: Fix incorrect casting of a signed value
+
+The return value of ftell() may be negative (-1) on error. While it is
+probably unlikely to occur, we should not blindly cast to an unsigned
+value without first testing that it is not negative.
+
+Fixes: CID 73856
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5dc41edc4eba259c6043ae7698c245ec1baaacc6]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ util/grub-editenv.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/util/grub-editenv.c b/util/grub-editenv.c
+index f3662c9..db6f187 100644
+--- a/util/grub-editenv.c
++++ b/util/grub-editenv.c
+@@ -125,6 +125,7 @@ open_envblk_file (const char *name)
+ {
+   FILE *fp;
+   char *buf;
++  long loc;
+   size_t size;
+   grub_envblk_t envblk;
+ 
+@@ -143,7 +144,12 @@ open_envblk_file (const char *name)
+     grub_util_error (_("cannot seek `%s': %s"), name,
+ 		     strerror (errno));
+ 
+-  size = (size_t) ftell (fp);
++  loc = ftell (fp);
++  if (loc < 0)
++    grub_util_error (_("cannot get file location `%s': %s"), name,
++		     strerror (errno));
++
++  size = (size_t) loc;
+ 
+   if (fseek (fp, 0, SEEK_SET) < 0)
+     grub_util_error (_("cannot seek `%s': %s"), name,
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 7ca0b469e9..a1fbc5e644 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -88,6 +88,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0039-loader-xnu-Free-driverkey-data-when-an-error-is-dete.patch \
            file://0040-loader-xnu-Check-if-pointer-is-NULL-before-using-it.patch \
            file://0041-util-grub-install-Fix-NULL-pointer-dereferences.patch \
+           file://0042-util-grub-editenv-Fix-incorrect-casting-of-a-signed-.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


