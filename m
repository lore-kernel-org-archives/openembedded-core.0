Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AEDCD37B5
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8170.1778224353708350604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0YRosonD;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44b330c5cc6so1186751f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224352; x=1778829152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8O7Iu1ER7xa6Nzms4p7Af7/0HO3ouo9FLhOP0QUSiQ=;
        b=0YRosonD6ioZ3iSyNc9i1wIZ6DnQ8hy239cIPG7dwS/341ezdmrG3VxeHPgt6//aDy
         m3JRnezWLRrKCBKFYZ+7QE2bSQ9NxsIJCh+97D7qrniTRA3qiLDh4xhYQOeoKMHPCKPk
         9Y1LR7rarls9XaLDQ+8jwEIyWnk9CkknmrM8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224352; x=1778829152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W8O7Iu1ER7xa6Nzms4p7Af7/0HO3ouo9FLhOP0QUSiQ=;
        b=MWU8dFEBRc9NU6TGT00nShJA/GiKG3Cg0AG4wqwSJNbfdzF7J1ANXIG8HTNWLb4e/H
         jykrrZ91x/MyC2ygVzRYKBZn9pf3yC57G591Uc/q6IdWOGanZM+WInTn/KGm+eFvHot1
         gGsf+TVExhNH/JjtVbtF8sowdsaxExzspQ3nBwpRpaxpMIxnq6JcRO+ieT97oNhaV9vp
         bVmatmSyTYcZouLVjadVP4PA9UgTt6ftGa/2hoX+X28mVeG1JRZnqlnm/kdvE1vHEDkK
         3B0cYS/+DGf44U85ZmhCIzONDmmatsaak3xDfsFvsN3hjjhzDyI7DmDgaInbILGPOFWq
         LCiw==
X-Gm-Message-State: AOJu0Yze3hnxlrsXx929PTLZ+o5GpW+7qe3uLd3SrxudNt5NTgHoFBkh
	D6TE3yGKGh/EnDUJL83MSCKdxIRz40zswjQXeTYCnoahDZrBgvkNoo2vyakAdxD3V1Dnhbj6aAq
	pJx5VyXc=
X-Gm-Gg: Acq92OFRUewFMaRSPDHKtjbSadEcxmplqthLy7vTvVlfLAd7JbduzWoXwzEeqZPl4AI
	xz/fmLcdRQLTHNdq76KYQ1Ys+8nejAZymmTE3emdX27FKlbhoWR3exff7gKYvCjkpsLTS+wMzrc
	BvtE/bKMU7zoKLijvkXuLe75kxhriw+C84KduYQYD0AG1IbABqaI59Vm+aN5BzmKse5lfcS8WUR
	61VYod3kwnVgSoJnjpFpwyY80MH5JuEk74/BKxhOmojh6+DjZ5KqtvQB3werGU8618Gh+rxM6aJ
	CAmsobPg1jQaFKSb4qgpXZj6PBp+qu9ul9gzlm3ff8joQTbJSCN9dwiDjbGWhp8qnWYrmsIbB+0
	wwrZzB65XrTmvo1lw1YFMkJ2dSpynzzkfqo94i5QoIYucVgSvCw3gZg4AJnE/OtycVgTjj1eRHs
	u6bBVYnyDhhmjxNxpdvOJKncIibGDpjVLQMs9kZwyjFzyg32xJTji65Z4s+GUtjGemmWNXZiUpW
	QxqK7Rj3GLOS+Slyxw3fcxgo9ChIH1WtcqzeA==
X-Received: by 2002:adf:f146:0:b0:452:bc55:c684 with SMTP id ffacd0b85a97d-452bc55c6cemr7615710f8f.19.1778224351723;
        Fri, 08 May 2026 00:12:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 29/52] bluez5: add patches to fix 8.56 cli issues
Date: Fri,  8 May 2026 09:11:22 +0200
Message-ID: <9ba494f3f3a06979fb23be925ed90d9e2720f2d7.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236671

From: Leonardo Costa <leonardo.costa@toradex.com>

On bluez5 5.86, the bluetoothctl cli interface does not work outside of
the dedicated shell to list controllers and devices [1]. These patches fix
the issue while version 5.87 is not published.

[1] https://github.com/bluez/bluez/issues/1896

Upstream-Status: Backport [https://github.com/bluez/bluez/commit/b33e923b55e4d0e9d78a83cfcb541fd1f687ef54,
                           https://github.com/bluez/bluez/commit/21e13976f2e375d701b8b7032ba5c1b2e56c305f]

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 922227e3ed694f3c96ce3d761ba594255c03b5cc)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +
 ...ell-Don-t-init-input-for-non-interac.patch | 42 +++++++++++++++++++
 ...d-broken-stdin-handling-in-home-made.patch | 36 ++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-Work-around-broken-stdin-handling-in-home-made.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index dd205830159..843e36b78de 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -68,6 +68,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://init \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
+           file://0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch \
+           file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch
new file mode 100644
index 00000000000..a0271513eb4
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch
@@ -0,0 +1,42 @@
+From b33e923b55e4d0e9d78a83cfcb541fd1f687ef54 Mon Sep 17 00:00:00 2001
+From: Bastien Nocera <hadess@hadess.net>
+Date: Fri, 27 Feb 2026 12:27:17 +0100
+Subject: [PATCH] Revert "shared/shell: Don't init input for non-interactive
+ shells"
+
+This reverts commit e73bf582dae60356641a32fc27ae03d359ec4c47.
+
+The fix caused "bluetoothctl list" to not output any text, breaking
+a lot of existing scripts.
+
+Closes: https://bugzilla.redhat.com/show_bug.cgi?id=2440346
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/b33e923b55e4d0e9d78a83cfcb541fd1f687ef54]
+Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
+---
+ src/shared/shell.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/shared/shell.c b/src/shared/shell.c
+index 78d58c513..b061f8001 100644
+--- a/src/shared/shell.c
++++ b/src/shared/shell.c
+@@ -1642,13 +1642,13 @@ static bool shell_quit(void *data)
+ 
+ bool bt_shell_attach(int fd)
+ {
+-	if (data.mode == MODE_INTERACTIVE) {
+-		struct input *input;
++	struct input *input;
+ 
+-		input = input_new(fd);
+-		if (!input)
+-			return false;
++	input = input_new(fd);
++	if (!input)
++		return false;
+ 
++	if (data.mode == MODE_INTERACTIVE) {
+ 		io_set_read_handler(input->io, input_read, input, NULL);
+ 		io_set_disconnect_handler(input->io, input_hup, input, NULL);
+ 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Work-around-broken-stdin-handling-in-home-made.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Work-around-broken-stdin-handling-in-home-made.patch
new file mode 100644
index 00000000000..c362936bc20
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-tools-Work-around-broken-stdin-handling-in-home-made.patch
@@ -0,0 +1,36 @@
+From 21e13976f2e375d701b8b7032ba5c1b2e56c305f Mon Sep 17 00:00:00 2001
+From: Bastien Nocera <hadess@hadess.net>
+Date: Fri, 27 Feb 2026 12:27:18 +0100
+Subject: [PATCH] tools: Work-around broken stdin handling in home-made
+ mainloop
+
+bluetoothd has 3 mainloop implementations, one relying on ell, one
+relying on glib, and another home-made.
+
+The home-made mainloop handler use epoll() without any fallbacks, and
+will hang if one tries to epoll() an stdin that redirects from
+/dev/null.
+
+Closes: https://github.com/bluez/bluez/issues/700
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/b33e923b55e4d0e9d78a83cfcb541fd1f687ef54]
+Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
+---
+ Makefile.tools | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.tools b/Makefile.tools
+index 589f7c94f..7c52e053f 100644
+--- a/Makefile.tools
++++ b/Makefile.tools
+@@ -531,8 +531,8 @@ tools_obexctl_LDADD = gdbus/libgdbus-internal.la src/libshared-glib.la \
+ 
+ tools_btmgmt_SOURCES = tools/btmgmt.c src/uuid-helper.c client/display.c \
+ 			client/mgmt.c
+-tools_btmgmt_LDADD = lib/libbluetooth-internal.la src/libshared-mainloop.la \
+-				-lreadline
++tools_btmgmt_LDADD = lib/libbluetooth-internal.la src/libshared-glib.la \
++				$(GLIB_LIBS) -lreadline
+ if DEPRECATED
+ noinst_PROGRAMS += attrib/gatttool
+ 

