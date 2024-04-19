Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AFCC07E8D
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.19245.1713529197452202032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jP85fEFQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d717603aa5so24004301fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529195; x=1714133995; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1At+IHOlH7GduliDiXdU7UYfbzA9H/Y8A26LgnLCoUE=;
        b=jP85fEFQq+F2v/5uD7zDP5MOSMvV9bWKHvhjdQYx7AF8WYZzqSj0+2WHbJQ+eDYRcZ
         ekkZw72HNRLGM9m8BoLYHSD/1s1uBqsazmzLXSLU5XuJh15WnKuH7yJVjSdn9QRC86Vm
         vWQFRNHwYxps2LN+FRJ3E6Ru0pRXlMB5l5LHH8ykqL0fY+e3O7Aa+OFltRDj7Rq/sSuQ
         yrR2PLpK8iy8x5hyF2UMEYwwTs4IRpbfRlhuROzhUr4aqHg4vDkQ79Y8swFDFLevTf1n
         A90/24v9WHpKlWmh95js4NhWiVChi5vOHvy19qmSdMn0s21o/MC3mEvsVGF2U9nf6oM2
         9kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529195; x=1714133995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1At+IHOlH7GduliDiXdU7UYfbzA9H/Y8A26LgnLCoUE=;
        b=BX7Ms0K1D0REg8DjgK9BoBs+pV4qWPWFs037lQmfqjNpCqf41Hi4l+BeaI0bW5sfe1
         iKJ9yB9ASIpjI88z4QDqlhMMFkOF0USEx5BqLMY6CxVGE6fZ0L+unZ4RHD46NjE91GEY
         A4RffwvJPAbnfR9COB/UO4fKR+fVrU09x3bzEEyFtBTz2ZsYj2fSFuHkp57jSK9vMnRd
         S2afWs3kqQcOX/cdyI7RVir5OytHZGbGHoz6+o9z8Ro60mbgdb9K635jT7x0rtwXvd/X
         4N4RacQVyx6K8DMPawowE54/nHlMeW9P+qOs9at/qv2KRx0ev6PRS6LrX7CA9ebSvKk+
         14uw==
X-Gm-Message-State: AOJu0YxQ7cey1Dgt3wRDAJhZRZxsS9F434WlIEs5ViRkdo6h/mpdBZpX
	KweK5+RnR+1J6Sk6J8dL7RDKGwXL3tb2ZpcrwnEhG6Wl9Egb09leJtjHJQ==
X-Google-Smtp-Source: AGHT+IHW4hjR/sFYiAQqw/q9kQsfGr2ubHHzPqnq4rM/OMpehZ+XiFpeUmYdLVIr5Pi62TYIBhxAJA==
X-Received: by 2002:a2e:9059:0:b0:2d7:17e0:ff56 with SMTP id n25-20020a2e9059000000b002d717e0ff56mr1584026ljg.18.1713529195331;
        Fri, 19 Apr 2024 05:19:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/19] busybox: remove busybox-udhcpc-no_deconfig.patch
Date: Fri, 19 Apr 2024 14:19:36 +0200
Message-Id: <20240419121945.1920944-10-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198538

The option was introduced in:
https://git.yoctoproject.org/poky/commit/?h=master&id=427472e980cd6254a5e4ef37209b327e15af259b
for the purpose of a standalone udhcpc service.

18 months later the service was removed as it was clashing with the
broader networking service, and the option isn't used
anywhere else:
https://git.yoctoproject.org/poky/commit/?h=master&id=a4b1e348484b74d055b8906413892789d3452f4a

There's a slight chance the option still survives
somewhere private, and is important in that context,
but I'd rather drop the patch so it can be maintained
where it's useful, and maybe even proposed upstream.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../busybox/busybox-udhcpc-no_deconfig.patch  | 87 -------------------
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 -
 2 files changed, 88 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch b/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
deleted file mode 100644
index 948932a3e89..00000000000
--- a/meta/recipes-core/busybox/busybox/busybox-udhcpc-no_deconfig.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 53626cd06a3ef05ed847daea802ef0aa9661caa7 Mon Sep 17 00:00:00 2001
-From: Anders Darander <anders@chargestorm.se>
-Date: Thu, 3 Nov 2011 08:51:31 +0100
-Subject: [PATCH] busybox-udhcpc-no_deconfig.patch
-
-Upstream-Status: Pending
-
-Add a new option -D to the udhcpc client that allows for
-dhcp renewal to occur without having to down the interface
-in the process.
-
-Signed-off-by: Greg Moffatt <greg.moffatt@windriver.com>
-
-Updated to latest Busybox 1.17.3
-
-Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
-
-Updated to Busybox 1.18.4
-option spec is changed
-
-Signed-off-by: Qing He <qing.he@intel.com>
-
-Updated to Busybox 1.19.3
-
-Signed-off-by: Anders Darander <anders@chargestorm.se>
-
-Fixed options -b, -a and -P.
-
-Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
----
- networking/udhcp/dhcpc.c                       | 29 ++++++++++++++++------
- 1 file changed, 21 insertions(+), 8 deletions(-)
-
-Index: busybox-1.34.0/networking/udhcp/dhcpc.c
-===================================================================
---- busybox-1.34.0.orig/networking/udhcp/dhcpc.c
-+++ busybox-1.34.0/networking/udhcp/dhcpc.c
-@@ -48,6 +48,8 @@
- };
- #endif
- 
-+/* option whether to down the interface when reconfiguring */
-+static int allow_deconfig = 1;
- 
- /* "struct client_data_t client_data" is in bb_common_bufsiz1 */
- 
-@@ -100,8 +102,10 @@
- 	OPT_x = 1 << 16,
- 	OPT_f = 1 << 17,
- 	OPT_B = 1 << 18,
-+	OPT_D = 1 << 19,
- /* The rest has variable bit positions, need to be clever */
- 	OPTBIT_B = 18,
-+	OPTBIT_D = 19,
- 	USE_FOR_MMU(             OPTBIT_b,)
- 	IF_FEATURE_UDHCPC_ARPING(OPTBIT_a,)
- 	IF_FEATURE_UDHCP_PORT(   OPTBIT_P,)
-@@ -587,7 +591,8 @@
- 
- static void d4_run_script_deconfig(void)
- {
--	d4_run_script(NULL, "deconfig");
-+	if (allow_deconfig)
-+		d4_run_script(NULL, "deconfig");
- }
- 
- /*** Sending/receiving packets ***/
-@@ -1244,7 +1249,7 @@
- 	/* Parse command line */
- 	opt = getopt32long(argv, "^"
- 		/* O,x: list; -T,-t,-A take numeric param */
--		"CV:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fB"
-+		"CV:F:i:np:qRr:s:T:+t:+SA:+O:*ox:*fBD"
- 		USE_FOR_MMU("b")
- 		IF_FEATURE_UDHCPC_ARPING("a::")
- 		IF_FEATURE_UDHCP_PORT("P:")
-@@ -1361,6 +1366,10 @@
- 		logmode |= LOGMODE_SYSLOG;
- 	}
- 
-+	if (opt & OPT_D) {
-+		allow_deconfig = 0;
-+	}
-+
- 	/* Create pidfile */
- 	write_pidfile(client_data.pidfile);
- 	/* Goes to stdout (unless NOMMU) and possibly syslog */
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 06eb9eb9996..373a6b7781b 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -2,7 +2,6 @@ require busybox.inc
 
 SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-depmod-Ignore-.debug-directories.patch \
-           file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
            file://busybox-httpd \
-- 
2.39.2


