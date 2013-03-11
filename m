Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UF7gD-00009G-9N
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 19:42:41 +0100
Received: by mail-pb0-f50.google.com with SMTP id up1so4056474pbc.37
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 11:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=dtscmjUwoUNYN5ROeILen0xV1OGv5+StiHr+vR8raz4=;
	b=Mq38Fc5CHP1UzhmYy12VinlwBrDAZVvyaUeAOundg1Uh5xAUNEZPPSBcamDGjeJlZj
	5reXgz6iRdNM9ueFyHEMDl1/N2pg8I919c0x7bKPJVCaAnj0PjssDmMoU1odjJR3uLEE
	pFn3v5nZSyGzwKj5Pxuhec9QNy82MF/5ccKTBnD7tswX0fv5OwVJz15VogKLUoFPkh5T
	T4vXgv13Zk0RLryypqojJWOHPw/V0676ASjvxwUBLmeekMK6kKD3Ka1cwvAFiC5SN5fD
	zmmj3PztIi8YHjfwl+31+pRIAuMTs2d29agDR1jklEB9ietf3UGbTQjlPxCGY25wITLW
	oOfg==
X-Received: by 10.68.251.169 with SMTP id zl9mr11831545pbc.17.1363026358071;
	Mon, 11 Mar 2013 11:25:58 -0700 (PDT)
Received: from flashheart.burtonini.com (or-67-237-97-32.sta.embarqhsd.net.
	[67.237.97.32])
	by mx.google.com with ESMTPS id hu2sm21402014pbc.38.2013.03.11.11.25.55
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Mar 2013 11:25:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Mar 2013 11:24:55 -0700
Message-Id: <1fd5b960dd36458b7b829f9094df18cd8b5ac201.1363025917.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
In-Reply-To: <cover.1363025917.git.ross.burton@intel.com>
References: <cover.1363025917.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl6zaxanIUcb5o1Q58KjVojlHkqg8SiTVWiFJnq17KA43lDU//SIDGMDXaGNGpaqiz+Eddw
Subject: [PATCH 12/12] systemd: remove libsystemd-daemon linkage in libudev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Mar 2013 18:42:45 -0000

libudev was statically linking to libsystemd-shared, which was linking to
libsystemd-daemon (via libtool).  This is a spurious dependency so backport a
commit from upstream to remove it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../systemd/systemd/udev-linkage.patch             |   62 ++++++++++++++++++++
 meta/recipes-core/systemd/systemd_197.bb           |    1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/udev-linkage.patch

diff --git a/meta/recipes-core/systemd/systemd/udev-linkage.patch b/meta/recipes-core/systemd/systemd/udev-linkage.patch
new file mode 100644
index 0000000..a0d9b4c
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/udev-linkage.patch
@@ -0,0 +1,62 @@
+Don't cause libudev to link against libsystemd-daemon.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 8ee37c2bed1d452d566abf85b0cdf732b7ca029a Mon Sep 17 00:00:00 2001
+From: Kay Sievers <kay@vrfy.org>
+Date: Thu, 7 Feb 2013 13:47:46 +0100
+Subject: [PATCH] build-sys: at least for now, never link libudev against
+ systemd's shared libraries
+
+---
+ Makefile.am |   12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 474110a..0e6c88f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -811,8 +811,6 @@ libsystemd_shared_la_SOURCES = \
+ 	src/shared/calendarspec.c \
+ 	src/shared/calendarspec.h
+ 
+-libsystemd_shared_la_LIBADD = libsystemd-daemon.la
+-
+ #-------------------------------------------------------------------------------
+ noinst_LTLIBRARIES += \
+ 	libsystemd-dbus.la
+@@ -1662,6 +1660,9 @@ systemd_tty_ask_password_agent_LDADD = \
+ libsystemd_daemon_la_SOURCES = \
+ 	src/libsystemd-daemon/sd-daemon.c
+ 
++libsystemd_daemon_internal_la_SOURCES = \
++        $(libsystemd_daemon_la_SOURCES)
++
+ libsystemd_daemon_la_CFLAGS = \
+ 	$(AM_CFLAGS) \
+ 	-fvisibility=hidden \
+@@ -1689,6 +1690,9 @@ UNINSTALL_EXEC_HOOKS += libsystemd-daemon-uninstall-hook
+ lib_LTLIBRARIES += \
+ 	libsystemd-daemon.la
+ 
++noinst_LTLIBRARIES += \
++        libsystemd-daemon-internal.la
++
+ pkgconfiglib_DATA += \
+ 	src/libsystemd-daemon/libsystemd-daemon.pc
+ 
+@@ -1768,7 +1772,9 @@ libudev_la_LDFLAGS = \
+ 	-Wl,--version-script=$(top_srcdir)/src/libudev/libudev.sym
+ 
+ libudev_la_LIBADD = \
+-	libsystemd-shared.la
++	libsystemd-shared.la \
++	libsystemd-daemon-internal.la \
++	libsystemd-id128-internal.la
+ 
+ pkgconfiglib_DATA += \
+ 	src/libudev/libudev.pc
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index e2bf415..5180eef 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -25,6 +25,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            ${UCLIBCPATCHES} \
            file://00-create-volatile.conf \
            file://0001-systemd-analyze-rewrite-in-C.patch \
+           file://udev-linkage.patch \
           "
 SRC_URI[md5sum] = "56a860dceadfafe59f40141eb5223743"
 SRC_URI[sha256sum] = "e6857ea21ae24d7056e7b0f4c2aaaba73b8bf57025b8949c0a8af0c1bc9774b5"
-- 
1.7.10.4



