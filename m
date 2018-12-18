Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 232617BD8B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:15 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u4so15588130wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wH0P//Znw/+q2+608l46v8euGjMsysu4iYCZlZbkFuk=;
	b=GdBhL5wuBe+ZV6FfJeRsmMhyX54w/GrFAaBXvf0pu1h7+YTu69c8BDN0DLc3Fy3mo9
	mNPL7UmbHyz9MaZO0UUQ0FBt9a5bCqqEzf+HBeXrQNCN1ojVJVk5T6yGS9T+ewF1N9UG
	UGsIBfh8DBgwczZRNItmTahbzYr5w0Z97uTLIRSgZD+hLNJaoSkyfrJpcPn3YQ4E8gWT
	NoZL+Q0U7lpKsiuUFJslDmw62kUEAdd71EYfSn5FpL+4Ud0pPPRqE0F5E7QygOv1A9J3
	yaPX8XlGsn+LfeRLIgDgwce4yu/B3RzZLAvRxoqwuFOe2pJMxq917W6/RTxHjxIGlchB
	VeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wH0P//Znw/+q2+608l46v8euGjMsysu4iYCZlZbkFuk=;
	b=Tu2U7mugURYzWsiVHU5o6BuK8BQepCjQ6J1bivjkb6qwCWhUUl3SY6pxHSR/+Yf/Fe
	3zHtqV+buF01ziuwSgJRuP1Dq3r0okIFSvLulRZgXBHpE0tTakbjXUdJYgr41xI2YCvk
	qVj4NL26l8/VmWn+ksxwvy2+aQSDhaynvg0iG6Bnzmjb8+FBmyuZVKsRkxLpI+UO4kkT
	YXUQ5CCBg3UEr5DRXrVEeZ3KT4FNHpENyW1ueRVhzZNyo3qicefyC7R53iETrlaFs5HP
	xYJKMzxQ+d4+pAXpluGWVL9anuzdCxVgRqy6ig7Koy9YCCmlmLCd9yO4019FWT12i8We
	fDmg==
X-Gm-Message-State: AA+aEWabixRNZpWFhIhyF/JMWlOB7b6i85BZ0JIY8llRVo7Mjm7zMGR6
	XBxs+4dYabXFqbSFyTdlKQf8HjiJ
X-Google-Smtp-Source: AFSGD/XBzZa1txGia9PqYIMY8U5Vx5SH7tTA/2r0akLuCh9lTviSaFi9401nilNDuuHfknOuwXNGcw==
X-Received: by 2002:adf:ae41:: with SMTP id u1mr14466769wrd.20.1545150616514; 
	Tue, 18 Dec 2018 08:30:16 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:29:55 +0100
Message-Id: <20181218163005.1330-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 03/13] systemd: backport a patch to fix meson 0.49.0 issue
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Dec 2018 16:30:16 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_239.bb |  1 +
 ...-meson-rename-Ddebug-to-Ddebug-extra.patch | 45 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_239.bb      |  1 +
 3 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch

diff --git a/meta/recipes-core/systemd/systemd-boot_239.bb b/meta/recipes-core/systemd/systemd-boot_239.bb
index 7fe420c2622..312a0145d83 100644
--- a/meta/recipes-core/systemd/systemd-boot_239.bb
+++ b/meta/recipes-core/systemd/systemd-boot_239.bb
@@ -6,6 +6,7 @@ DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
 SRC_URI += "file://0002-use-lnr-wrapper-instead-of-looking-for-relative-opti.patch \
             file://0006-remove-nobody-user-group-checking.patch \
             file://0001-Fix-to-run-efi_cc-and-efi_ld-correctly-when-cross-co.patch \
+            file://0001-meson-rename-Ddebug-to-Ddebug-extra.patch \
             "
 
 inherit meson pkgconfig gettext
diff --git a/meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch b/meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch
new file mode 100644
index 00000000000..d6d305cb37c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-meson-rename-Ddebug-to-Ddebug-extra.patch
@@ -0,0 +1,45 @@
+From 8f6b442a78d0b485f044742ad90b2e8271b4e68e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@in.waw.pl>
+Date: Sun, 19 Aug 2018 19:11:30 +0200
+Subject: [PATCH] meson: rename -Ddebug to -Ddebug-extra
+
+Meson added -Doptimization and -Ddebug options, which obviously causes
+a conflict with our -Ddebug options. Let's rename it.
+
+Fixes #9883.
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build       | 2 +-
+ meson_options.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index f79ac4b12..2209c935a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -763,7 +763,7 @@ substs.set('DEBUGTTY', get_option('debug-tty'))
+ 
+ enable_debug_hashmap = false
+ enable_debug_mmap_cache = false
+-foreach name : get_option('debug')
++foreach name : get_option('debug-extra')
+         if name == 'hashmap'
+                 enable_debug_hashmap = true
+         elif name == 'mmap-cache'
+diff --git a/meson_options.txt b/meson_options.txt
+index e3140c8c1..7b1f61bf4 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -45,7 +45,7 @@ option('debug-shell', type : 'string', value : '/bin/sh',
+        description : 'path to debug shell binary')
+ option('debug-tty', type : 'string', value : '/dev/tty9',
+        description : 'specify the tty device for debug shell')
+-option('debug', type : 'array', choices : ['hashmap', 'mmap-cache'], value : [],
++option('debug-extra', type : 'array', choices : ['hashmap', 'mmap-cache'], value : [],
+        description : 'enable extra debugging')
+ option('memory-accounting-default', type : 'boolean',
+        description : 'enable MemoryAccounting= by default')
+-- 
+2.17.1
+
diff --git a/meta/recipes-core/systemd/systemd_239.bb b/meta/recipes-core/systemd/systemd_239.bb
index a40c89973a8..7e5eefeeaed 100644
--- a/meta/recipes-core/systemd/systemd_239.bb
+++ b/meta/recipes-core/systemd/systemd_239.bb
@@ -35,6 +35,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch \
            file://0001-Revert-sysctl.d-request-ECN-on-both-in-and-outgoing-.patch \
            file://0001-timesync-changes-type-of-drift_freq-to-int64_t.patch \
+           file://0001-meson-rename-Ddebug-to-Ddebug-extra.patch \
            "
 
 # patches made for musl are only applied on TCLIBC is musl
-- 
2.17.1


