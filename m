Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 40BAF74B14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 18:24:30 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id j4-v6so7735108wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 11:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=361Fw4xySK7RCu7ZKRbE9HaoOwPQTLqcSo0lfgnMrZo=;
	b=HDoH9yvevvyjOTBEiW698aFhX0j+DDecm8qiTcWeYAiByUnY49JNJxGwJ8a32fzVLg
	Ro17nzmGB39TocJZBL//BDv1jVstJt1cNakluwmPW3aMJHzQk7IxgXW6+rg5xKGpLtPU
	MjQq6+rODmk7x3lxb2ifJg/J+pTf4yTz5L8FN/GHeMOhyfzQljwKgqFuGfsXtMkg5o4T
	jk8gHHDT98fQ9fX5hrYNhE5FByMWrTPgrBj3IK9THOZgXPnRZpgr5Ym1qbJXhayqXys6
	PjaeCVmWBUUe7VY2WeemrST6eT9rSoEq1+6uwx6skDsEa5Jzgv1zsh+81fTiTp1aETzk
	ypCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=361Fw4xySK7RCu7ZKRbE9HaoOwPQTLqcSo0lfgnMrZo=;
	b=sYYRwt8PUfXz9qkaEvRWzqjpK/LAdc/PVeW7UA7Hb5PndItqGbaq7vwdTAfBfMVvpL
	qXblpLPPK7D5UDbQjwZnzwdhP+N1AAK8GlS90MPxtW6kzgFf+6K64qtNHNNl/FkdP0nr
	mq1V/MR2RFzWVSoKS1MIXE859DIY01jJ3JdkR24SErqxDH76sN0RXMxjEjTieTTtZs07
	GaHOJL7hiwK98ZbKnsBb6yw28hpeM0CYmFBQ83LD90tHZaHSNYcm+R4MVWgt10psa6Vi
	0viisVF5orregilkLfX0W2J/YDEPARtjMFFU5hyDfbpDS132Kxu7V1gHlSxJe8inGiFR
	E0kQ==
X-Gm-Message-State: ALKqPwc0fvHNc95+mtTXRBhi3zE6Pnl/JDfDulaf8e5ThvsnOvQ0nAER
	68hSPOJaa8KcZCMq22VhNiSp8TDq
X-Google-Smtp-Source: AB8JxZo/uFjLvntyJ95vX+F67c93tnjsDqB8dbQRjkRgQs093GN+UoocAJeoSXDaOfpIU0JXJS0eFA==
X-Received: by 2002:a50:85c6:: with SMTP id q6-v6mr2590023edh.86.1527186271035;
	Thu, 24 May 2018 11:24:31 -0700 (PDT)
Received: from piling.lan (80-71-134-83.u.parknet.dk. [80.71.134.83])
	by smtp.gmail.com with ESMTPSA id
	e24-v6sm11834326edc.80.2018.05.24.11.24.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 May 2018 11:24:29 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org, obi@opendreambox.org,
	akuster808@gmail.com
Date: Thu, 24 May 2018 20:24:21 +0200
Message-Id: <20180524182421.1964-1-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH] busybox: Make readlink compatible with coreutils
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
X-List-Received-Date: Thu, 24 May 2018 18:24:31 -0000

Busybox readlink behaves diferently that coreutils readlink:

root@qt5122:~# touch /tmp/this_file_exist
root@qt5122:~# busybox readlink -f /tmp/this_file_exist
/tmp/this_file_exist
root@qt5122:~# readlink -f /tmp/this_file_exist
/tmp/this_file_exist

root@qt5122:~# readlink -f /tmp/this_file_does_not_exist
/tmp/this_file_does_not_exist
root@qt5122:~# busybox readlink -f /tmp/this_file_does_not_exist
root@qt5122:~#
This leads to apt-key miss-behaving and also secure apt-get

root@qt5122:~# apt-key exportall
touch: : No such file or directory

W: An error occurred during the signature verification. The repository is not updated and the previous index files will be used. GPG error: http://release.qtec.com:5022/qtec/europa/deb/qt5122 ./ Release: At least one invalid signature was encountered.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 .../busybox/busybox/fix-readlink-f.patch      | 96 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.27.2.bb   |  1 +
 2 files changed, 97 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/fix-readlink-f.patch

diff --git a/meta/recipes-core/busybox/busybox/fix-readlink-f.patch b/meta/recipes-core/busybox/busybox/fix-readlink-f.patch
new file mode 100644
index 0000000000..505fdd032f
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/fix-readlink-f.patch
@@ -0,0 +1,96 @@
+From 747162109fb1c891baf6aafa1ca0410bd08d04a4 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Thu, 24 May 2018 17:29:14 +0200
+Subject: realpath,readlink -f: coreutils compat, closes 11021
+
+function                                             old     new   delta
+xmalloc_realpath_coreutils                             -     121    +121
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Upstream-Status: Backport https://bugs.busybox.net/show_bug.cgi?id=11021
+---
+ coreutils/readlink.c |  2 +-
+ coreutils/realpath.c |  2 +-
+ include/libbb.h      |  1 +
+ libbb/xreadlink.c    | 30 ++++++++++++++++++++++++++++++
+ 4 files changed, 33 insertions(+), 2 deletions(-)
+
+diff --git a/coreutils/readlink.c b/coreutils/readlink.c
+index b8e327d..49361ce 100644
+--- a/coreutils/readlink.c
++++ b/coreutils/readlink.c
+@@ -86,7 +86,7 @@ int readlink_main(int argc UNUSED_PARAM, char **argv)
+ 		logmode = LOGMODE_NONE;
+ 
+ 	if (opt & 1) { /* -f */
+-		buf = xmalloc_realpath(fname);
++		buf = xmalloc_realpath_coreutils(fname);
+ 	} else {
+ 		buf = xmalloc_readlink_or_warn(fname);
+ 	}
+diff --git a/coreutils/realpath.c b/coreutils/realpath.c
+index 0c2d544..d2b4bf2 100644
+--- a/coreutils/realpath.c
++++ b/coreutils/realpath.c
+@@ -36,7 +36,7 @@ int realpath_main(int argc UNUSED_PARAM, char **argv)
+ 	}
+ 
+ 	do {
+-		char *resolved_path = xmalloc_realpath(*argv);
++		char *resolved_path = xmalloc_realpath_coreutils(*argv);
+ 		if (resolved_path != NULL) {
+ 			puts(resolved_path);
+ 			free(resolved_path);
+diff --git a/include/libbb.h b/include/libbb.h
+index 8eccd81..64531c0 100644
+--- a/include/libbb.h
++++ b/include/libbb.h
+@@ -475,6 +475,7 @@ DIR *xopendir(const char *path) FAST_FUNC;
+ DIR *warn_opendir(const char *path) FAST_FUNC;
+ 
+ char *xmalloc_realpath(const char *path) FAST_FUNC RETURNS_MALLOC;
++char *xmalloc_realpath_coreutils(const char *path) FAST_FUNC RETURNS_MALLOC;
+ char *xmalloc_readlink(const char *path) FAST_FUNC RETURNS_MALLOC;
+ char *xmalloc_readlink_or_warn(const char *path) FAST_FUNC RETURNS_MALLOC;
+ /* !RETURNS_MALLOC: it's a realloc-like function */
+diff --git a/libbb/xreadlink.c b/libbb/xreadlink.c
+index 7d4cb60..cae322a 100644
+--- a/libbb/xreadlink.c
++++ b/libbb/xreadlink.c
+@@ -123,3 +123,33 @@ char* FAST_FUNC xmalloc_realpath(const char *path)
+ 	return xstrdup(realpath(path, buf));
+ #endif
+ }
++
++char* FAST_FUNC xmalloc_realpath_coreutils(const char *path)
++{
++	char *buf;
++
++	errno = 0;
++	buf = xmalloc_realpath(path);
++	/*
++	 * There is one case when "readlink -f" and
++	 * "realpath" from coreutils succeed,
++	 * even though file does not exist, such as:
++	 *     /tmp/file_does_not_exist
++	 * (the directory must exist).
++	 */
++	if (!buf && errno == ENOENT) {
++		char *last_slash = strrchr(path, '/');
++		if (last_slash) {
++			*last_slash++ = '\0';
++			buf = xmalloc_realpath(path);
++			if (buf) {
++				unsigned len = strlen(buf);
++                                buf = xrealloc(buf, len + strlen(last_slash) + 2);
++				buf[len++] = '/';
++				strcpy(buf + len, last_slash);
++			}
++		}
++	}
++
++	return buf;
++}
+-- 
+cgit v0.12
+
diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
index 36a6342aaf..cb1ae4c169 100644
--- a/meta/recipes-core/busybox/busybox_1.27.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
@@ -45,6 +45,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2011-5325.patch \
            file://CVE-2017-15873.patch \
            file://busybox-CVE-2017-16544.patch \
+           file://fix-readlink-f.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.17.0


