Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D3E10706DE
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 14:20:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10500.1773498017175938642
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 07:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0iSIKQJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48541edecf9so33073465e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773498015; x=1774102815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJUbWaK6rkrcV9OcBK7ciV+/JW4XqAfF3uDGhQ0K/G8=;
        b=k0iSIKQJwu56s0RxO2z6olMyE1xhehtgcEs2pClISwzroKe5ZwCvbNPKpR5hoaFD2+
         yxqYjjg8ZQiw0gt5d3J11UGPkxXXrbm4dttTvHuFx9LYrlAyqJyq8Ej2nwRCMm23BOcb
         aEhBvM5djFOx5k4iPF5yX4U7qAv619wODDv/3pt6k6i4EBvxp92l/QzpdKuS8IbmN9Gl
         fFTgKQ7dzYyTpLLztOMA6/0z7DE74fHkAurT0hc96I6nBN9COVlcHqvHG/pI/j1vbJcb
         NE6lnUPwzaJQJ2mC2OuGm9bTOwqbEjFrPJ7WpV03gCo1c2Z/VJCxRTdeE1ZPaEBAUagZ
         TWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773498015; x=1774102815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CJUbWaK6rkrcV9OcBK7ciV+/JW4XqAfF3uDGhQ0K/G8=;
        b=KtKfGaJSXkDNHKj3iV61aReKKQpUcVlt5DZvr5JBY5lmBQHHaiFxeKuf5aPZyTHaXf
         QdY4nADSl57ntdMmR14niZcJPSwpKmeerqRZ4kVvdsI3Ubf5HqejcBYvGPOX1I0B3pXg
         GpNQoWGmAeMhL5k1yKJTrk6uSLfK4BNZy6W4Cbyl/5qWJKOYTOfDB6RjidfebL9CfSiT
         CEOZt+d95IRCgrRjcL2VuNnUqqq1NiGe/+UgjAD8LChoHZgGPPgRKyt1Hb5bKqMMtVav
         kOoNEI/3e2nDu+WUD3D3noO/xzAfs0+KiwRtADQp6rF17kDVIbPgBFYXiQ3pBYVrCefr
         soOw==
X-Gm-Message-State: AOJu0Yy4cYrp9RKvuwZyiDYhW2Gz0R1TBEE/ani1xkNF2ONJgn7v03C9
	AtUJt18pfWYkTutAuv37paBCv4Ip4LarZzGoOHbTx2BielqEFHwv3KsfJywM3Q==
X-Gm-Gg: ATEYQzyTquOFFFV9BHUwtjTcj1uMn7y+lQ5VYsVTKOUqGNLfECZgdh99XpTYQBnlj2V
	y/TnA2ppncp0YvuhMioYq2P8e7wD3iBfs8qlwcFescrFIkx9+mXQU/TZD2+p7dd8yO8F+DqvsHV
	LeLO4HThobH12S9dht0eDflOlubiKNoIxAV2f/zVaI1JaWEA+dpcajYn4YTBjLKzVa3bxgk+QY0
	siwviUptbdfRAM5xLudX7qOS0x/mv+UwD6jI9l27dlGITNxlLUQoW/5a/Z1PhXrQoF37IRPDmHU
	LXNB61nW518haN7PW8Hv7EiYwOvbgD+DkTl3omZv/Ed32auzRthYfMhTtuPDac8OYY5SWLiSfxQ
	HnsqcMMI7j8WrR5GC79dirZrJ/ier0ICRUyV54SP50HjQ4AViH+2wI1uRXi1yX95dxZZbC9mOmi
	WJCe8mOoEXeUpDmqqwDa8di+LDMXelXl1gVBcDw0bVldbJFg/Q1g==
X-Received: by 2002:a05:600c:524b:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-485570ce1b9mr117443835e9.8.1773498015262;
        Sat, 14 Mar 2026 07:20:15 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556424322sm45900205e9.8.2026.03.14.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 07:20:14 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 2/2] gtk4: Fix a build error in examples/application8
Date: Sat, 14 Mar 2026 15:20:02 +0100
Message-ID: <20260314142002.925941-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260314142002.925941-1-zboszor@gmail.com>
References: <20260314142002.925941-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 14:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233086

Add a backported patch from master to use underscore instead of
space in a generated filename. This fixes the build error:

| /usr/bin/ld: cannot find examples/application8/exampleapp8.p/meson-generated_.._exampleapp8: No such file or directory
| /usr/bin/ld: cannot find resources.c.o: No such file or directory

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 ...-t-use-space-in-meson-generated-file.patch | 34 +++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk4_4.20.3.bb        |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch

diff --git a/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch b/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
new file mode 100644
index 0000000000..2a79fc637d
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk4/0001-application8-Don-t-use-space-in-meson-generated-file.patch
@@ -0,0 +1,34 @@
+From d26453923a21de0d908af3bf83c69263aaee5705 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 11 Mar 2026 07:02:10 +0100
+Subject: [PATCH] application8: Don't use space in meson generated filename
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+All other example apps use underscore, examples/application8
+has a build error:
+
+| /usr/bin/ld: cannot find examples/application8/exampleapp8.p/meson-generated_.._exampleapp8: No such file or directory
+| /usr/bin/ld: cannot find resources.c.o: No such file or directory
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/9627]
+---
+ examples/application8/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/examples/application8/meson.build b/examples/application8/meson.build
+index f2e1d7cea9..77987d554a 100644
+--- a/examples/application8/meson.build
++++ b/examples/application8/meson.build
+@@ -1,4 +1,4 @@
+-app8_resources = gnome.compile_resources('exampleapp8 resources',
++app8_resources = gnome.compile_resources('exampleapp8_resources',
+   'exampleapp.gresource.xml',
+   source_dir: meson.current_source_dir())
+ 
+-- 
+2.53.0
+
diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
index ef9a05f7fe..0cca44fb5c 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
@@ -35,6 +35,8 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
 
+SRC_URI += "file://0001-application8-Don-t-use-space-in-meson-generated-file.patch"
+
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
 CVE_PRODUCT = "gnome:gtk"
-- 
2.53.0


