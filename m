Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF77CA0EF7
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:15 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3390.1755634093682565485
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UfRrjUHx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2e89bebaso4236462b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634093; x=1756238893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wu41jHdngVGrEQ/A3ozZxDsVQu+zcIoXlNIMQlFns+U=;
        b=UfRrjUHxZO3LwHr2tPWq1TX3SWj42336uxpUEtT54AuXitTwSnj1Wuk2DEV90QLmEL
         AOqvfR1rS1CyAC0YHCazfFXwmnW/NbE44mMW2wgcb3U6GXyMT63FoaXH+CckDlIfSzP6
         jIiuqd+ZIRlCZSRd2aWt+EH4UrlEyJBimsy5D2FJNk7mlojFKxmektZOarkl0cT9txsS
         lcC5Fo06vDvJqjB9CyCM7qblPtIyEEsI65VjhTSdKwCU/bhwllKIIaVfs9/jMkTsr5tn
         F9NRoEkxITlOkJ8j1s5zwUYagkGXYrm+lyfTkcotr2IOPhYe8oWdkU/phGU1PkNwonNA
         ZmbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634093; x=1756238893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu41jHdngVGrEQ/A3ozZxDsVQu+zcIoXlNIMQlFns+U=;
        b=u8TU8MzFbhNSLqW9ltV4Cr35OCgbp+1p9pQ/RG+0IsD8a1DY1db0H0GT1Mled04f+O
         5a914CLR+07e5jgNwSlgnmmYeGB9HD9i3+dfermsVw3jNGGdLvjVEl3Ozuy9h6YEYcb9
         wY4kH1hF920O8K/e21SJqTn+xju/rU10P3eHazEZsif9MGpZSSwy/+Rc/7oAHtcXzkPW
         efsZTVdknEoGl7NANbN7848cbgyHSAVCNbDsc6bRo6xQ/hBOF1ZFBx5JpTCvSvYFIwRD
         64+4ulGQl58/qO/IcEJkfvWjDfLkXpN3u7zXViuMgUNtxYc8t3UVg4UXYmNievUcUGHc
         KHeQ==
X-Gm-Message-State: AOJu0Yw0ooXzRbea7a4+My877XNgIPYnTi1Ss447pFPeDAwclM/IwBLF
	OlIMQAUOIh9eGIZZ4oXEVrGa/X6XRCklwzxwyt9s1x2D9GmfTvQwKWIG8dKVbZu6ODuR5mkpdUN
	AuAup
X-Gm-Gg: ASbGnctKz5zKK0bE5BpNkm4XWB8NvWdsKPsOaIFlfJjqhLIkDC24LYDkVwqy6u+40va
	rzjA9C59nHQ26SUgje68Oe7+suDQQYY02WUhgOH+D9Znv7jaQzqgZIkoZSA3VG5EOKdAk7VVm2J
	vNBCtHVq625Hwlsq1jz83kVsT9JLKJucIeC+ju4qZllvHKasxupO/dFS5QeRaMjKoXy3KFV3XYr
	sCC/0Scp6igg4m621K4q7iaA/RAg8jvi9vmRbAuZNcN+nyrrJ8aubo5PvvG8DQ615VQSTVDQN/6
	S05NrqSyIICSmxtzg+uMIdrf1k0gtP9L+zO6DnpfoKU9N/R1ojLGuOtPwuGuk8kaXAAmwLjPm3C
	JESWSIC7DNuty2m7vF6whjcvE
X-Google-Smtp-Source: AGHT+IHSGaYnb33UdCnG1xkVRzonfsE83miLbNM8DgX5gczu1JM6BlUfJuyFKRMPlX615Nn0mjn0CA==
X-Received: by 2002:a05:6a20:72a3:b0:243:78a:82a6 with SMTP id adf61e73a8af0-2431ba7886fmr767578637.60.1755634092860;
        Tue, 19 Aug 2025 13:08:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/10] parted: Fix build with GCC 15
Date: Tue, 19 Aug 2025 13:07:50 -0700
Message-ID: <67c47f0ed5ba852930e0815691ee7ec06dec1d0e.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222134

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...CH-parted-fix-do_version-declaration.patch | 40 +++++++++++++++++++
 meta/recipes-extended/parted/parted_3.6.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch

diff --git a/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch b/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
new file mode 100644
index 0000000000..a8ea7ec4f7
--- /dev/null
+++ b/meta/recipes-extended/parted/files/0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch
@@ -0,0 +1,40 @@
+From eb6bb2e8dfc78ca1a187d07ea29b23a805c61794 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Wed, 20 Nov 2024 12:22:22 +0000
+Subject: [PATCH] bug#74444: [PATCH] parted: fix do_version declaration
+
+With gcc 15-20241117 compile fails with the below error, update the
+do_version declaration to match the header in command.h
+
+../../parted/parted.c: In function '_init_commands':
+../../parted/parted.c:2469:9: error: passing argument 2 of 'command_create' from incompatible pointer type [-Wincompatible-pointer-types]
+ 2469 |         do_version,
+      |         ^~~~~~~~~~
+      |         |
+      |         int (*)(void)
+In file included from ../../parted/parted.c:28:
+../../parted/command.h:35:39: note: expected 'int (*)(PedDevice **, PedDisk **)' {aka 'int (*)(struct _PedDevice **, struct _PedDisk **)'} but argument is of type 'int (*)(void)'
+   35 |                                 int (*method) (PedDevice** dev, PedDisk** diskp),
+      |                                 ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/parted.git/commit/?id=16343bda6ce0d41edf43f8dac368db3bbb63d271]
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Signed-off-by: Brian C. Lane <bcl@redhat.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ parted/parted.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/parted/parted.c b/parted/parted.c
+index 3abb52f..fc2aeba 100644
+--- a/parted/parted.c
++++ b/parted/parted.c
+@@ -2172,7 +2172,7 @@ do_unit (PedDevice** dev, PedDisk** diskp)
+ }
+ 
+ static int
+-do_version ()
++do_version (PedDevice** dev, PedDisk** diskp)
+ {
+     printf ("\n%s\n%s",
+             prog_name,
diff --git a/meta/recipes-extended/parted/parted_3.6.bb b/meta/recipes-extended/parted/parted_3.6.bb
index a537ef74db..0e79a2e837 100644
--- a/meta/recipes-extended/parted/parted_3.6.bb
+++ b/meta/recipes-extended/parted/parted_3.6.bb
@@ -10,6 +10,7 @@ SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.xz \
            file://fix-doc-mandir.patch \
            file://0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch \
            file://autoconf-2.73.patch \
+           file://0001-bug-74444-PATCH-parted-fix-do_version-declaration.patch \
            file://run-ptest \
            "
 
-- 
2.43.0


