Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EF4F589C4
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 12:52:15 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18584.1776948653447368466
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 05:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=tNYCRI7h;
 spf=pass (domain: gmail.com, ip: 209.85.210.48, mailfrom: leoreis.costa@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7dbccf6a23dso5320291a34.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776948652; x=1777553452; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RsgCCxAgqI+9ofrhAcyttPBAbJRxbNGzHCXk5tLfpM=;
        b=tNYCRI7hmKFMQOEslWyri7c1+oiuBCd74ufcTsjWYC3Be9c8AByz1xI1c1ME31fRDM
         3pgr9qtJeN7UTCub+LcUYW1WxUghwTIA75MXGEmCWnKyLgHTwYeTQwlOhcFOC9wRc5pA
         ep4ecwS5O+HHRQ+mfFVPd0CwFpWQMZfEV0IVRKHvuEUHPqF5USN4QtFHMbt13ZIBYeUs
         EVZXj2G7KmiQ5I5PL0SZFSEiNoeWwf7PApbDf5CSOaCpEkvvi3mtIqh0RlJDbfarN7G0
         fho0LeJlqDttDGq5DXhEWVHLFJ5rzz0yiWzoaxei74Rdfrwo5M4JEJ1P0j/5Uafwc5rT
         QK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776948652; x=1777553452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RsgCCxAgqI+9ofrhAcyttPBAbJRxbNGzHCXk5tLfpM=;
        b=iYp/6s/uS+gabgHhEue24l8Uqg2uxfY3w5aeQWt6v2moeW6flhhUK3EMrayS1URXDP
         zCcFGVBakAolJjzrkY8ikZSwLCardI5EHdhUiYf2uYY7Q6RTJtcu34N/8DUwbQh/95sa
         PZ8r7ep2GEpNjYDCqGJD4vHBIBWWy3P6VefKfsprZqLJBo9icN9Y0VxX9QU4v4r9m1L3
         3WfGLKlKgZeTnX+z4u662RiiYyW1NVlrTE45WxfP8/mh6y4JNhYW9x+76GSAnfcz139A
         ajRjYl9MkPyeCeY1FL07G6lTf/m6cwGveuONmuhagOFBx3MxHov+CMU0fxR03Lcb1VeP
         08/A==
X-Gm-Message-State: AOJu0Yzp61N3ceJ7C/Ji7bbYI/bE7UgLN5UkayzkLWlEdz40SuG3pR3x
	EVWpXQmcm2VwvxG9CmzF1PvOVgsJg9WO1m1C5cBFB1vyqyR66npvQVWc5/sNBA==
X-Gm-Gg: AeBDiesT7kuzoLWzplIDCqNjhpOc0MNh9iaq3+smAHkFem5CN5W1/WEIA+JgUz5pWbL
	29FB1TLlZ86t6Oycyp7Iljkge5P6+uNsYDFQ0x8IXYPOW/debwKEyIHcd2u/CiEV43svpfB9a1r
	VmqYzyFRjhtn0ht25HjcB3SR3aBcYIEeaDJp6fZ7lNeoJHD3Mf4oAatxNV1y8JdZjQz/mxYRm1G
	QlKj43FuRnul2K+eH3MCb0K8V2zVLKopiiK/usaS+iNrf/I45noUjQe1lE4pcDKdEN+pszb44fO
	YIQuuV47Koa8daDDja653FvHekHYO1+ZFCGif3c8DEHcS7ZxC3yb0edJNPiwSm/LmQ0KvT+QrvH
	XrHVAyqs4w0FW2marxGwXzf+RGCxUbJcD/yEEhjI+tFc3fV/g7AXwSTq1lJmXYXIpW2i6Q8htHb
	O0voI1eJVIc067E4kFWTFPp6X7PS5vuFQHAqnlbZBY
X-Received: by 2002:a05:7300:f14d:b0:2ea:b7a9:580d with SMTP id 5a478bee46e88-2eab7a9593emr3835032eec.9.1776948189905;
        Thu, 23 Apr 2026 05:43:09 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce0f5sm27103828eec.17.2026.04.23.05.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:43:08 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Leonardo Costa <leonardo.costa@toradex.com>
Subject: [PATCH] bluez5: add patches to fix 8.56 cli issues
Date: Thu, 23 Apr 2026 09:40:30 -0300
Message-ID: <20260423124205.24189-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 12:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235768

From: Leonardo Costa <leonardo.costa@toradex.com>

On bluez5 5.86, the bluetoothctl cli interface does not work outside of
the dedicated shell to list controllers and devices [1]. These patches fix
the issue while version 5.87 is not published.

[1] https://github.com/bluez/bluez/issues/1896

Upstream-Status: Backport [https://github.com/bluez/bluez/commit/b33e923b55e4d0e9d78a83cfcb541fd1f687ef54,
                           https://github.com/bluez/bluez/commit/21e13976f2e375d701b8b7032ba5c1b2e56c305f]

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  2 +
 ...ell-Don-t-init-input-for-non-interac.patch | 42 +++++++++++++++++++
 ...d-broken-stdin-handling-in-home-made.patch | 36 ++++++++++++++++
 3 files changed, 80 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Revert-shared-shell-Don-t-init-input-for-non-interac.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-tools-Work-around-broken-stdin-handling-in-home-made.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index dd20583015..843e36b78d 100644
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
index 0000000000..a0271513eb
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
index 0000000000..c362936bc2
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

