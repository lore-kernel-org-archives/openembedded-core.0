Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81BBDC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:28:22 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.6931.1645799302037729106
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mOKo4mqG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id e13so4964135plh.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:28:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3YqXd2gCh/j35avZ93e2pLFZOiTPC7a29C8nEUxLveA=;
        b=mOKo4mqG/s8vcJ0lpMbgcUQbBNhpYpZTqB/ZHmOJH5zIcL5IjbGVbcE1y4nEaOfWuB
         KeenEJsJJbkMQ2QMGGRFO3HpIklhUmAQQLP9e+Wgl7tXyeJdGrcDSzMUtRtKYukK1oXC
         oRw6er3/l8FcZWIi8U15iG6uYPt4qqO7AONJZ3KrpaJMv5myRBvw/UQS0Sbn7PwFtBXR
         7mGbx8KfuifzMLIza8SKpPMl8B8J7uRtcVAfRYkTxoRB+cB86TaBGWp3q5mmZ9+lvozG
         yqY+sAlmTGWV5ZKPtsTWBmJPWjQOcJpF94QdXXx2SfXL/1JeMX0gmcgdFb0LZ2TrK0ZT
         5orQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3YqXd2gCh/j35avZ93e2pLFZOiTPC7a29C8nEUxLveA=;
        b=wgHwjGLHAO09PNbMpdCp6BZP09L5JnPwxznkzHUFL+xIExXxdmycEI31TedncqjrLL
         wD6vDTvEK5P6+0vFPMLnt5rsoe0Eq+rKUS0pbtUwML+8btsMZjS0KZZmxl96e6aRZSw0
         bc8FSbVZE1OYqCVrRcraV+WGLaovZ/3sKuDijTSCimbkQjbUNxxEFMBmTzVV4QZP4QWe
         yhP50/8ypT9GlNOUkXsXf+Oq9nRq4wSaXkgrlJ4D6aOLdMY0+9zSRs2i+TcoK1sD4hGR
         P8U9mBg+TRqHXq/Mxaf0bLBd3hT/oM083NLMdI2qiJeXi8v650wztoHo5OQg1dv1g4VK
         6QpA==
X-Gm-Message-State: AOAM532MzRYir4pNkJA0/ZFL6zDlD/RkZDOXPMg4YwPhkgBbkkrzwNSy
	JLE0eZWCT3IqoI/tpPJ1CrPsrFIGu1joFWe/
X-Google-Smtp-Source: 
 ABdhPJzbHfUy3LJ2N0XInlllLVw9myD59BhzbIMMQd3sBPI+dWjzKgGM7Ui4CmQ9KDwAJfqc9cohCQ==
X-Received: by 2002:a17:90a:1548:b0:1b9:d1b7:bb1a with SMTP id
 y8-20020a17090a154800b001b9d1b7bb1amr3371065pja.125.1645799301022;
        Fri, 25 Feb 2022 06:28:21 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h17-20020a63df51000000b0036b9776ae5bsm2864538pgj.85.2022.02.25.06.28.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 06:28:20 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 41/50] grub: fix checking for NULL
Date: Fri, 25 Feb 2022 04:26:21 -1000
Message-Id: 
 <d4cc82cfdae5c44702925f901db4e35761b1bb7d.1645798648.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1645798648.git.steve@sakoman.com>
References: <cover.1645798648.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:28:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162387

From: Marta Rybczynska <rybczynska@gmail.com>

This patch adds a fix for checking for NULL in grub's loader/bsd.
It is a part of a security series [1].

[1] https://lists.gnu.org/archive/html/grub-devel/2021-03/msg00007.html

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ader-bsd-Check-for-NULL-arg-up-front.patch | 47 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch

diff --git a/meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch b/meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch
new file mode 100644
index 0000000000..34643e10ab
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0037-loader-bsd-Check-for-NULL-arg-up-front.patch
@@ -0,0 +1,47 @@
+From 7899384c8fdf9ed96566978c49b0c6e40e70703d Mon Sep 17 00:00:00 2001
+From: Darren Kenny <darren.kenny@oracle.com>
+Date: Tue, 8 Dec 2020 21:47:13 +0000
+Subject: [PATCH] loader/bsd: Check for NULL arg up-front
+
+The code in the next block suggests that it is possible for .set to be
+true but .arg may still be NULL.
+
+This code assumes that it is never NULL, yet later is testing if it is
+NULL - that is inconsistent.
+
+So we should check first if .arg is not NULL, and remove this check that
+is being flagged by Coverity since it is no longer required.
+
+Fixes: CID 292471
+
+Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=5d5391b0a05abe76e04c1eb68dcc6cbef5326c4a]
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ grub-core/loader/i386/bsd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/loader/i386/bsd.c b/grub-core/loader/i386/bsd.c
+index b92cbe9..8432283 100644
+--- a/grub-core/loader/i386/bsd.c
++++ b/grub-core/loader/i386/bsd.c
+@@ -1605,7 +1605,7 @@ grub_cmd_openbsd (grub_extcmd_context_t ctxt, int argc, char *argv[])
+   kernel_type = KERNEL_TYPE_OPENBSD;
+   bootflags = grub_bsd_parse_flags (ctxt->state, openbsd_flags);
+ 
+-  if (ctxt->state[OPENBSD_ROOT_ARG].set)
++  if (ctxt->state[OPENBSD_ROOT_ARG].set && ctxt->state[OPENBSD_ROOT_ARG].arg != NULL)
+     {
+       const char *arg = ctxt->state[OPENBSD_ROOT_ARG].arg;
+       unsigned type, unit, part;
+@@ -1622,7 +1622,7 @@ grub_cmd_openbsd (grub_extcmd_context_t ctxt, int argc, char *argv[])
+ 			   "unknown disk type name");
+ 
+       unit = grub_strtoul (arg, (char **) &arg, 10);
+-      if (! (arg && *arg >= 'a' && *arg <= 'z'))
++      if (! (*arg >= 'a' && *arg <= 'z'))
+ 	return grub_error (GRUB_ERR_BAD_ARGUMENT,
+ 			   "only device specifications of form "
+ 			   "<type><number><lowercase letter> are supported");
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 1a4be33fca..8b55afccbb 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -83,6 +83,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0034-video-fb-video_fb-Fix-possible-integer-overflow.patch \
            file://0035-video-readers-jpeg-Test-for-an-invalid-next-marker-r.patch \
            file://0036-gfxmenu-gui_list-Remove-code-that-coverity-is-flaggi.patch \
+           file://0037-loader-bsd-Check-for-NULL-arg-up-front.patch \
            "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.25.1


