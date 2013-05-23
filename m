Return-Path: <net147@gmail.com>
Received: from mail-da0-f51.google.com (mail-da0-f51.google.com
	[209.85.210.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0406089F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 09:02:03 +0000 (UTC)
Received: by mail-da0-f51.google.com with SMTP id h15so1569729dan.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=HZfcxDLgFHeaWfFTuMyLW20ciFw4zg9svbzgXoAoWf8=;
	b=vydcHDoagBD4qwjI29d8nAV9dvig/cTCvpQu10Pc5gLQG7O+EJZsa0DZ1Ab/aLeRoQ
	4N49wKI0EgPJEpTsZe/x0UbjN0KmKiUHUGb6oiGMa95gSKeYeAOkcWv+R9eFMmpnyH42
	4JqCvCKH0LVvV/m/I7j69l+wYXxgL/7axydEZIFUFLcpPCdJsRTPYeqId6IwQE6YERID
	aKVu18HRgEyAFRmZp+1Rgi9jSmyu6kmILbmbk9eic2XubO36y47b8e/sVNgasT/182Oh
	xvSDJOxRfkCdf/IEKkbzGivIZhm7bW8cGUc2DOe/fZnJewTUQI4uB+PFj8IWkYcSGdmO
	QbGA==
X-Received: by 10.66.251.163 with SMTP id zl3mr12193292pac.174.1369299724383; 
	Thu, 23 May 2013 02:02:04 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id do4sm10967606pbc.8.2013.05.23.02.02.01
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 02:02:03 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 19:15:11 +1000
Message-Id: <1369300511-16817-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v5] systemd: update to 204
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
X-List-Received-Date: Thu, 23 May 2013 09:02:04 -0000

Removed patches integrated upstream.
Added backport of fix for utmp not running at shutdown.
Updated serial-getty service.
Added missing util-linux dependency.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 .../systemd-serialgetty/serial-getty@.service      |  16 +-
 ...se-AC_CHECK_TOOL-for-objcopy-strings-and-.patch |  41 ---
 ...ystemd-update-utmp-shutdown.service-into-.patch | 367 +++++++++++++++++++++
 .../0002-readahead-chunk-on-spinning-media.patch   | 142 --------
 .../systemd/systemd/0003-readahead-cleanups.patch  |  86 -----
 ...ctl-Handle-missing-etc-sysctl.conf-proper.patch |  33 --
 .../systemd/systemd/199-firmware.patch             |  98 ------
 .../systemd/{systemd_199.bb => systemd_204.bb}     |  13 +-
 8 files changed, 381 insertions(+), 415 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/199-firmware.patch
 rename meta/recipes-core/systemd/{systemd_199.bb => systemd_204.bb} (95%)

diff --git a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
index 8eeaab6..1c14dfe 100644
--- a/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
+++ b/meta/recipes-core/systemd/systemd-serialgetty/serial-getty@.service
@@ -1,23 +1,27 @@
 #  This file is part of systemd.
 #
 #  systemd is free software; you can redistribute it and/or modify it
-#  under the terms of the GNU General Public License as published by
-#  the Free Software Foundation; either version 2 of the License, or
+#  under the terms of the GNU Lesser General Public License as published by
+#  the Free Software Foundation; either version 2.1 of the License, or
 #  (at your option) any later version.
 
 [Unit]
 Description=Serial Getty on %I
-BindTo=dev-%i.device
-After=dev-%i.device systemd-user-sessions.service
+Documentation=man:agetty(8) man:systemd-getty-generator(8)
+Documentation=http://0pointer.de/blog/projects/serial-console.html
+BindsTo=dev-%i.device
+After=dev-%i.device systemd-user-sessions.service plymouth-quit-wait.service
+After=rc-local.service
 
 # If additional gettys are spawned during boot then we should make
 # sure that this is synchronized before getty.target, even though
 # getty.target didn't actually pull it in.
 Before=getty.target
+IgnoreOnIsolate=yes
 
 [Service]
-Environment=TERM=vt100
-ExecStart=-/sbin/agetty -s %I @BAUDRATE@
+ExecStart=-/sbin/agetty -s %I @BAUDRATE@ vt102
+Type=idle
 Restart=always
 RestartSec=0
 UtmpIdentifier=%I
diff --git a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch b/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
deleted file mode 100644
index d847bbc..0000000
--- a/meta/recipes-core/systemd/systemd/0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d6f92bcbbae9a577adb9588c7b2783a5d0bf343d Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 16 Apr 2013 14:20:41 +0200
-Subject: [PATCH] configure: use AC_CHECK_TOOL for objcopy, strings and gperf
-
-* using AC_PATH_TOOL does not allow to override it from shell environment
-  which is useful when cross-compiling
-* with external toolchain I have different HOST_PREFIX and HOST_SYS
-  AC_PATH_TOOL is using HOST_SYS as prefix and fails to find objcopy
-  which is available only as ${TARGET_PREFIX}objcopy then it tries
-  objcopy without prefix which is found on host, but that objcopy
-  does not work for !host (e.g. arm when building on x86) libs
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Upstream-Status: Submitted
-http://lists.freedesktop.org/archives/systemd-devel/2013-April/010468.html
-
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 33b0ca9..519f1a9 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -86,9 +86,9 @@ GOBJECT_INTROSPECTION_CHECK([1.31.1])
-    AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
-    enable_introspection=no])
- 
--AC_PATH_TOOL(OBJCOPY, objcopy)
--AC_PATH_TOOL(STRINGS, strings)
--AC_PATH_TOOL(GPERF, gperf)
-+AC_CHECK_TOOL(OBJCOPY, objcopy)
-+AC_CHECK_TOOL(STRINGS, strings)
-+AC_CHECK_TOOL(GPERF, gperf)
- if test -z "$GPERF" ; then
-         AC_MSG_ERROR([*** gperf not found])
- fi
--- 
-1.8.1.5
-
diff --git a/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch b/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
new file mode 100644
index 0000000..86fab97
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
@@ -0,0 +1,367 @@
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+From 3f92e4b4b61042391bd44de4dceb18177df0dd57 Mon Sep 17 00:00:00 2001
+From: Lennart Poettering <lennart@poettering.net>
+Date: Thu, 16 May 2013 00:19:03 +0200
+Subject: [PATCH] utmp: turn systemd-update-utmp-shutdown.service into a normal
+ runtime service
+
+With this change systemd-update-utmp-shutdown.service is replaced by
+systemd-update-utmp.service which is started at boot and stays around
+until shutdown. This allows us to properly order the unit against both
+/var/log and auditd.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=853104
+https://bugs.freedesktop.org/show_bug.cgi?id=64365
+---
+ Makefile-man.am                               | 12 ++---
+ Makefile.am                                   |  8 +--
+ man/systemd-update-utmp-runlevel.service.xml  | 76 ---------------------------
+ man/systemd-update-utmp.service.xml           | 76 +++++++++++++++++++++++++++
+ src/update-utmp/update-utmp.c                 |  2 +-
+ units/.gitignore                              |  2 +-
+ units/systemd-update-utmp-runlevel.service.in |  8 +--
+ units/systemd-update-utmp-shutdown.service.in | 19 -------
+ units/systemd-update-utmp.service.in          | 21 ++++++++
+ 9 files changed, 114 insertions(+), 110 deletions(-)
+ delete mode 100644 man/systemd-update-utmp-runlevel.service.xml
+ create mode 100644 man/systemd-update-utmp.service.xml
+ delete mode 100644 units/systemd-update-utmp-shutdown.service.in
+ create mode 100644 units/systemd-update-utmp.service.in
+
+diff --git a/Makefile-man.am b/Makefile-man.am
+index 7d62094..5888158 100644
+--- a/Makefile-man.am
++++ b/Makefile-man.am
+@@ -72,7 +72,7 @@ MANPAGES += \
+ 	man/systemd-tmpfiles.8 \
+ 	man/systemd-tty-ask-password-agent.1 \
+ 	man/systemd-udevd.service.8 \
+-	man/systemd-update-utmp-runlevel.service.8 \
++	man/systemd-update-utmp.service.8 \
+ 	man/systemd.1 \
+ 	man/systemd.automount.5 \
+ 	man/systemd.device.5 \
+@@ -191,7 +191,7 @@ MANPAGES_ALIAS += \
+ 	man/systemd-udevd-control.socket.8 \
+ 	man/systemd-udevd-kernel.socket.8 \
+ 	man/systemd-udevd.8 \
+-	man/systemd-update-utmp-shutdown.service.8 \
++	man/systemd-update-utmp-runlevel.service.8 \
+ 	man/systemd-update-utmp.8 \
+ 	man/systemd-user.conf.5
+ man/SD_ALERT.3: man/sd-daemon.3
+@@ -289,8 +289,8 @@ man/systemd-tmpfiles-setup.service.8: man/systemd-tmpfiles.8
+ man/systemd-udevd-control.socket.8: man/systemd-udevd.service.8
+ man/systemd-udevd-kernel.socket.8: man/systemd-udevd.service.8
+ man/systemd-udevd.8: man/systemd-udevd.service.8
+-man/systemd-update-utmp-shutdown.service.8: man/systemd-update-utmp-runlevel.service.8
+-man/systemd-update-utmp.8: man/systemd-update-utmp-runlevel.service.8
++man/systemd-update-utmp-runlevel.service.8: man/systemd-update-utmp.service.8
++man/systemd-update-utmp.8: man/systemd-update-utmp.service.8
+ man/systemd-user.conf.5: man/systemd-system.conf.5
+ man/SD_ALERT.html: man/sd-daemon.html
+ 	$(html-alias)
+@@ -577,10 +577,10 @@ man/systemd-udevd-kernel.socket.html: man/systemd-udevd.service.html
+ man/systemd-udevd.html: man/systemd-udevd.service.html
+ 	$(html-alias)
+ 
+-man/systemd-update-utmp-shutdown.service.html: man/systemd-update-utmp-runlevel.service.html
++man/systemd-update-utmp-runlevel.service.html: man/systemd-update-utmp.service.html
+ 	$(html-alias)
+ 
+-man/systemd-update-utmp.html: man/systemd-update-utmp-runlevel.service.html
++man/systemd-update-utmp.html: man/systemd-update-utmp.service.html
+ 	$(html-alias)
+ 
+ man/systemd-user.conf.html: man/systemd-system.conf.html
+diff --git a/Makefile.am b/Makefile.am
+index 8d8139c..4c5e6fc 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -417,8 +417,8 @@ nodist_systemunit_DATA = \
+ 	units/systemd-initctl.service \
+ 	units/systemd-shutdownd.service \
+ 	units/systemd-remount-fs.service \
++	units/systemd-update-utmp.service \
+ 	units/systemd-update-utmp-runlevel.service \
+-	units/systemd-update-utmp-shutdown.service \
+ 	units/systemd-tmpfiles-setup-dev.service \
+ 	units/systemd-tmpfiles-setup.service \
+ 	units/systemd-tmpfiles-clean.service \
+@@ -463,8 +463,8 @@ EXTRA_DIST += \
+ 	units/systemd-initctl.service.in \
+ 	units/systemd-shutdownd.service.in \
+ 	units/systemd-remount-fs.service.in \
++	units/systemd-update-utmp.service.in \
+ 	units/systemd-update-utmp-runlevel.service.in \
+-	units/systemd-update-utmp-shutdown.service.in \
+ 	units/systemd-tmpfiles-setup-dev.service.in \
+ 	units/systemd-tmpfiles-setup.service.in \
+ 	units/systemd-tmpfiles-clean.service.in \
+@@ -4070,8 +4070,8 @@ RUNLEVEL4_TARGET_WANTS += \
+ RUNLEVEL5_TARGET_WANTS += \
+ 	systemd-update-utmp-runlevel.service
+ endif
+-SHUTDOWN_TARGET_WANTS += \
+-	systemd-update-utmp-shutdown.service
++SYSINIT_TARGET_WANTS += \
++	systemd-update-utmp.service
+ LOCAL_FS_TARGET_WANTS += \
+ 	systemd-remount-fs.service \
+ 	systemd-fsck-root.service \
+diff --git a/man/systemd-update-utmp-runlevel.service.xml b/man/systemd-update-utmp-runlevel.service.xml
+deleted file mode 100644
+index 867b958..0000000
+--- a/man/systemd-update-utmp-runlevel.service.xml
++++ /dev/null
+@@ -1,76 +0,0 @@
+-<?xml version="1.0"?>
+-<!--*-nxml-*-->
+-<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
+-<!--
+-  This file is part of systemd.
+-
+-  Copyright 2012 Lennart Poettering
+-
+-  systemd is free software; you can redistribute it and/or modify it
+-  under the terms of the GNU Lesser General Public License as published by
+-  the Free Software Foundation; either version 2.1 of the License, or
+-  (at your option) any later version.
+-
+-  systemd is distributed in the hope that it will be useful, but
+-  WITHOUT ANY WARRANTY; without even the implied warranty of
+-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
+-  Lesser General Public License for more details.
+-
+-  You should have received a copy of the GNU Lesser General Public License
+-  along with systemd; If not, see <http://www.gnu.org/licenses/>.
+--->
+-<refentry id="systemd-update-utmp-runlevel.service">
+-
+-        <refentryinfo>
+-                <title>systemd-update-utmp-runlevel.service</title>
+-                <productname>systemd</productname>
+-
+-                <authorgroup>
+-                        <author>
+-                                <contrib>Developer</contrib>
+-                                <firstname>Lennart</firstname>
+-                                <surname>Poettering</surname>
+-                                <email>lennart@poettering.net</email>
+-                        </author>
+-                </authorgroup>
+-        </refentryinfo>
+-
+-        <refmeta>
+-                <refentrytitle>systemd-update-utmp-runlevel.service</refentrytitle>
+-                <manvolnum>8</manvolnum>
+-        </refmeta>
+-
+-        <refnamediv>
+-                <refname>systemd-update-utmp-runlevel.service</refname>
+-                <refname>systemd-update-utmp-shutdown.service</refname>
+-                <refname>systemd-update-utmp</refname>
+-                <refpurpose>Write audit and utmp updates at runlevel
+-                changes and shutdown</refpurpose>
+-        </refnamediv>
+-
+-        <refsynopsisdiv>
+-                <para><filename>systemd-update-utmp-runlevel.service</filename></para>
+-                <para><filename>systemd-update-utmp-shutdown.service</filename></para>
+-                <para><filename>/usr/lib/systemd/systemd-update-utmp</filename></para>
+-        </refsynopsisdiv>
+-
+-        <refsect1>
+-                <title>Description</title>
+-
+-                <para><filename>systemd-update-utmp-runlevel.service</filename>
+-                is a service that writes SysV runlevel changes to utmp
+-                and wtmp, as well as the audit logs, as they
+-                occur. <filename>systemd-update-utmp-shutdown.service</filename>
+-                does the same for shut-down requests.</para>
+-        </refsect1>
+-
+-        <refsect1>
+-                <title>See Also</title>
+-                <para>
+-                        <citerefentry><refentrytitle>systemd</refentrytitle><manvolnum>1</manvolnum></citerefentry>,
+-                        <citerefentry><refentrytitle>utmp</refentrytitle><manvolnum>5</manvolnum></citerefentry>,
+-                        <citerefentry><refentrytitle>auditd</refentrytitle><manvolnum>8</manvolnum></citerefentry>
+-                </para>
+-        </refsect1>
+-
+-</refentry>
+diff --git a/man/systemd-update-utmp.service.xml b/man/systemd-update-utmp.service.xml
+new file mode 100644
+index 0000000..846fc95
+--- /dev/null
++++ b/man/systemd-update-utmp.service.xml
+@@ -0,0 +1,76 @@
++<?xml version="1.0"?>
++<!--*-nxml-*-->
++<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
++<!--
++  This file is part of systemd.
++
++  Copyright 2012 Lennart Poettering
++
++  systemd is free software; you can redistribute it and/or modify it
++  under the terms of the GNU Lesser General Public License as published by
++  the Free Software Foundation; either version 2.1 of the License, or
++  (at your option) any later version.
++
++  systemd is distributed in the hope that it will be useful, but
++  WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public License
++  along with systemd; If not, see <http://www.gnu.org/licenses/>.
++-->
++<refentry id="systemd-update-utmp.service">
++
++        <refentryinfo>
++                <title>systemd-update-utmp.service</title>
++                <productname>systemd</productname>
++
++                <authorgroup>
++                        <author>
++                                <contrib>Developer</contrib>
++                                <firstname>Lennart</firstname>
++                                <surname>Poettering</surname>
++                                <email>lennart@poettering.net</email>
++                        </author>
++                </authorgroup>
++        </refentryinfo>
++
++        <refmeta>
++                <refentrytitle>systemd-update-utmp.service</refentrytitle>
++                <manvolnum>8</manvolnum>
++        </refmeta>
++
++        <refnamediv>
++                <refname>systemd-update-utmp.service</refname>
++                <refname>systemd-update-utmp-runlevel.service</refname>
++                <refname>systemd-update-utmp</refname>
++                <refpurpose>Write audit and utmp updates at bootup, runlevel
++                changes and shutdown</refpurpose>
++        </refnamediv>
++
++        <refsynopsisdiv>
++                <para><filename>systemd-update-utmp.service</filename></para>
++                <para><filename>systemd-update-utmp-runlevel.service</filename></para>
++                <para><filename>/usr/lib/systemd/systemd-update-utmp</filename></para>
++        </refsynopsisdiv>
++
++        <refsect1>
++                <title>Description</title>
++
++                <para><filename>systemd-update-utmp-runlevel.service</filename>
++                is a service that writes SysV runlevel changes to utmp
++                and wtmp, as well as the audit logs, as they
++                occur. <filename>systemd-update-utmp.service</filename>
++                does the same for system reboots and shut-down requests.</para>
++        </refsect1>
++
++        <refsect1>
++                <title>See Also</title>
++                <para>
++                        <citerefentry><refentrytitle>systemd</refentrytitle><manvolnum>1</manvolnum></citerefentry>,
++                        <citerefentry><refentrytitle>utmp</refentrytitle><manvolnum>5</manvolnum></citerefentry>,
++                        <citerefentry><refentrytitle>auditd</refentrytitle><manvolnum>8</manvolnum></citerefentry>
++                </para>
++        </refsect1>
++
++</refentry>
+diff --git a/src/update-utmp/update-utmp.c b/src/update-utmp/update-utmp.c
+index 9184025..202aa98 100644
+--- a/src/update-utmp/update-utmp.c
++++ b/src/update-utmp/update-utmp.c
+@@ -104,7 +104,7 @@ static int get_current_runlevel(Context *c) {
+                 { '3', SPECIAL_RUNLEVEL3_TARGET },
+                 { '4', SPECIAL_RUNLEVEL4_TARGET },
+                 { '2', SPECIAL_RUNLEVEL2_TARGET },
+-                { 'S', SPECIAL_RESCUE_TARGET },
++                { '1', SPECIAL_RESCUE_TARGET },
+         };
+         const char
+                 *interface = "org.freedesktop.systemd1.Unit",
+diff --git a/units/systemd-update-utmp-runlevel.service.in b/units/systemd-update-utmp-runlevel.service.in
+index 27fae2c..99783e2 100644
+--- a/units/systemd-update-utmp-runlevel.service.in
++++ b/units/systemd-update-utmp-runlevel.service.in
+@@ -7,12 +7,14 @@
+ 
+ [Unit]
+ Description=Update UTMP about System Runlevel Changes
+-Documentation=man:systemd-update-utmp-runlevel.service(8) man:utmp(5)
++Documentation=man:systemd-update-utmp.service(8) man:utmp(5)
+ DefaultDependencies=no
+ RequiresMountsFor=/var/log/wtmp
+-After=systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
++Conflicts=shutdown.target
++Requisite=systemd-update-utmp.service
++After=systemd-update-utmp.service
+ After=runlevel1.target runlevel2.target runlevel3.target runlevel4.target runlevel5.target
+-Before=final.target
++Before=shutdown.target
+ 
+ [Service]
+ Type=oneshot
+diff --git a/units/systemd-update-utmp-shutdown.service.in b/units/systemd-update-utmp-shutdown.service.in
+deleted file mode 100644
+index aa93562..0000000
+--- a/units/systemd-update-utmp-shutdown.service.in
++++ /dev/null
+@@ -1,19 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-[Unit]
+-Description=Update UTMP about System Shutdown
+-Documentation=man:systemd-update-utmp-runlevel.service(8) man:utmp(5)
+-DefaultDependencies=no
+-RequiresMountsFor=/var/log/wtmp
+-After=systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
+-After=systemd-update-utmp-runlevel.service
+-Before=final.target
+-
+-[Service]
+-Type=oneshot
+-ExecStart=@rootlibexecdir@/systemd-update-utmp shutdown
+diff --git a/units/systemd-update-utmp.service.in b/units/systemd-update-utmp.service.in
+new file mode 100644
+index 0000000..e7c20a5
+--- /dev/null
++++ b/units/systemd-update-utmp.service.in
+@@ -0,0 +1,21 @@
++#  This file is part of systemd.
++#
++#  systemd is free software; you can redistribute it and/or modify it
++#  under the terms of the GNU Lesser General Public License as published by
++#  the Free Software Foundation; either version 2.1 of the License, or
++#  (at your option) any later version.
++
++[Unit]
++Description=Update UTMP about System Reboot/Shutdown
++Documentation=man:systemd-update-utmp.service(8) man:utmp(5)
++DefaultDependencies=no
++RequiresMountsFor=/var/log/wtmp
++Conflicts=shutdown.target
++After=systemd-readahead-collect.service systemd-readahead-replay.service systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
++Before=sysinit.target shutdown.target
++
++[Service]
++Type=oneshot
++RemainAfterExit=yes
++ExecStart=@rootlibexecdir@/systemd-update-utmp reboot
++ExecStop=@rootlibexecdir@/systemd-update-utmp shutdown
+-- 
+1.8.2.3
+
diff --git a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch b/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
deleted file mode 100644
index d57a01c..0000000
--- a/meta/recipes-core/systemd/systemd/0002-readahead-chunk-on-spinning-media.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-Upstream-Status: Backport
-
--Khem 2013/03/28
-
-From 94243ef299425d6c7089a7a05c48c9bb8f6cf3da Mon Sep 17 00:00:00 2001
-From: Auke Kok <auke-jan.h.kok@intel.com>
-Date: Fri, 22 Mar 2013 15:09:45 -0700
-Subject: [PATCH 02/17] readahead: chunk on spinning media
-
-Readahead has all sorts of bad side effects depending on your
-storage media. On rotating disks, it may be degrading startup
-performance if enough requests are queued spanning linearly
-over all blocks early at boot, and mount, blkid and friends
-want to insert reads to the start of these block devices after.
-
-The end result is that on spinning disks with ext3/4 that udev
-and mounts take a very long time, and nothing really happens until
-readahead is completely finished.
-
-This has the net effect that the CPU is almost entirely idle
-for the entire period that readahead is working. We could have
-finished starting up quite a lot of services in this time if
-we were smarter at how we do readahead.
-
-This patch sorts all requests into 2 second "chunks" and sub-sorts
-each chunk by block. This adds a single cross-drive seek per "chunk"
-but has the benefit that we will have a lot of the blocks we need
-early on in the boot sequence loaded into memory faster.
-
-For a comparison of how before/after bootcharts look (ext4 on a
-mobile 5400rpm 250GB drive) please look at:
-
-    http://foo-projects.org/~sofar/blocked-tests/
-
-There are bootcharts in the "before" and "after" folders where you
-should be able to see that many low-level services finish 5-7
-seconds earlier with the patch applied (after).
----
- Makefile.am                       |    2 +-
- src/readahead/readahead-collect.c |   28 +++++++++++++++++++++++++---
- 2 files changed, 26 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 37c1cc2..5861976 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES = \
- systemd_readahead_LDADD = \
- 	libsystemd-shared.la \
- 	libsystemd-daemon.la \
--	libudev.la
-+	libudev.la -lm
- 
- dist_doc_DATA += \
- 	src/readahead/sd-readahead.c \
-diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead-collect.c
-index 5d07f47..5d22949 100644
---- a/src/readahead/readahead-collect.c
-+++ b/src/readahead/readahead-collect.c
-@@ -42,6 +42,7 @@
- #include <sys/vfs.h>
- #include <getopt.h>
- #include <sys/inotify.h>
-+#include <math.h>
- 
- #ifdef HAVE_FANOTIFY_INIT
- #include <sys/fanotify.h>
-@@ -67,6 +68,7 @@
-  */
- 
- static ReadaheadShared *shared = NULL;
-+static struct timespec starttime;
- 
- /* Avoid collisions with the NULL pointer */
- #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
-@@ -205,6 +207,7 @@ static unsigned long fd_first_block(int fd) {
- struct item {
-         const char *path;
-         unsigned long block;
-+        unsigned long bin;
- };
- 
- static int qsort_compare(const void *a, const void *b) {
-@@ -213,6 +216,13 @@ static int qsort_compare(const void *a, const void *b) {
-         i = a;
-         j = b;
- 
-+        /* sort by bin first */
-+        if (i->bin < j->bin)
-+                return -1;
-+        if (i->bin > j->bin)
-+                return 1;
-+
-+        /* then sort by sector */
-         if (i->block < j->block)
-                 return -1;
-         if (i->block > j->block)
-@@ -250,6 +260,8 @@ static int collect(const char *root) {
-                 goto finish;
-         }
- 
-+        clock_gettime(CLOCK_MONOTONIC, &starttime);
-+
-         /* If there's no pack file yet we lower the kernel readahead
-          * so that mincore() is accurate. If there is a pack file
-          * already we assume it is accurate enough so that kernel
-@@ -447,10 +459,21 @@ static int collect(const char *root) {
-                                         free(p);
-                                 else {
-                                         unsigned long ul;
-+                                        struct timespec ts;
-+                                        struct item *entry;
-+
-+                                        entry = new0(struct item, 1);
- 
-                                         ul = fd_first_block(m->fd);
- 
--                                        if ((k = hashmap_put(files, p, SECTOR_TO_PTR(ul))) < 0) {
-+                                        clock_gettime(CLOCK_MONOTONIC, &ts);
-+
-+                                        entry->block = ul;
-+                                        entry->path = strdup(p);
-+                                        entry->bin = round((ts.tv_sec - starttime.tv_sec +
-+                                                     ((ts.tv_nsec - starttime.tv_nsec) / 1000000000.0)) / 2.0);
-+
-+                                        if ((k = hashmap_put(files, p, entry)) < 0) {
-                                                 log_warning("set_put() failed: %s", strerror(-k));
-                                                 free(p);
-                                         }
-@@ -518,8 +541,7 @@ done:
- 
-                 j = ordered;
-                 HASHMAP_FOREACH_KEY(q, p, files, i) {
--                        j->path = p;
--                        j->block = PTR_TO_SECTOR(q);
-+                        memcpy(j, q, sizeof(struct item));
-                         j++;
-                 }
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch b/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
deleted file mode 100644
index e0b68df..0000000
--- a/meta/recipes-core/systemd/systemd/0003-readahead-cleanups.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-Upstream-Status: Backport
-
--Khem 2013/03/28
-
-From b0640287f784a320661f7206c9ade07b99003fd5 Mon Sep 17 00:00:00 2001
-From: Auke Kok <auke-jan.h.kok@intel.com>
-Date: Tue, 26 Mar 2013 11:13:47 -0700
-Subject: [PATCH 03/17] readahead: cleanups
-
-- check for OOM
-- no need to use floats and round()
----
- Makefile.am                       |    2 +-
- src/readahead/readahead-collect.c |   20 ++++++++++++++------
- 2 files changed, 15 insertions(+), 7 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 5861976..37c1cc2 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -2956,7 +2956,7 @@ systemd_readahead_SOURCES = \
- systemd_readahead_LDADD = \
- 	libsystemd-shared.la \
- 	libsystemd-daemon.la \
--	libudev.la -lm
-+	libudev.la
- 
- dist_doc_DATA += \
- 	src/readahead/sd-readahead.c \
-diff --git a/src/readahead/readahead-collect.c b/src/readahead/readahead-collect.c
-index 5d22949..e2fd8df 100644
---- a/src/readahead/readahead-collect.c
-+++ b/src/readahead/readahead-collect.c
-@@ -68,7 +68,7 @@
-  */
- 
- static ReadaheadShared *shared = NULL;
--static struct timespec starttime;
-+static usec_t starttime;
- 
- /* Avoid collisions with the NULL pointer */
- #define SECTOR_TO_PTR(s) ULONG_TO_PTR((s)+1)
-@@ -260,7 +260,7 @@ static int collect(const char *root) {
-                 goto finish;
-         }
- 
--        clock_gettime(CLOCK_MONOTONIC, &starttime);
-+        starttime = now(CLOCK_MONOTONIC);
- 
-         /* If there's no pack file yet we lower the kernel readahead
-          * so that mincore() is accurate. If there is a pack file
-@@ -459,19 +459,27 @@ static int collect(const char *root) {
-                                         free(p);
-                                 else {
-                                         unsigned long ul;
--                                        struct timespec ts;
-+                                        usec_t entrytime;
-                                         struct item *entry;
- 
-                                         entry = new0(struct item, 1);
-+                                        if (!entry) {
-+                                                r = log_oom();
-+                                                goto finish;
-+                                        }
- 
-                                         ul = fd_first_block(m->fd);
- 
--                                        clock_gettime(CLOCK_MONOTONIC, &ts);
-+                                        entrytime = now(CLOCK_MONOTONIC);
- 
-                                         entry->block = ul;
-                                         entry->path = strdup(p);
--                                        entry->bin = round((ts.tv_sec - starttime.tv_sec +
--                                                     ((ts.tv_nsec - starttime.tv_nsec) / 1000000000.0)) / 2.0);
-+                                        if (!entry->path) {
-+                                                free(entry);
-+                                                r = log_oom();
-+                                                goto finish;
-+                                        }
-+                                        entry->bin = (entrytime - starttime) / 2000000;
- 
-                                         if ((k = hashmap_put(files, p, entry)) < 0) {
-                                                 log_warning("set_put() failed: %s", strerror(-k));
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch b/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
deleted file mode 100644
index f2c8e02..0000000
--- a/meta/recipes-core/systemd/systemd/0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Backport
-
--Khem 2013/03/28
-
-From 6f6fad96addf6b00b55c98cc0d0d8026b0c1e7ca Mon Sep 17 00:00:00 2001
-From: Eelco Dolstra <eelco.dolstra@logicblox.com>
-Date: Wed, 27 Mar 2013 13:41:59 +0100
-Subject: [PATCH 13/17] systemd-sysctl: Handle missing /etc/sysctl.conf
- properly
-
-Since fabe5c0e5fce730aa66e10a9c4f9fdd443d7aeda, systemd-sysctl returns
-a non-zero exit code if /etc/sysctl.conf does not exist, due to a
-broken ENOENT check.
----
- src/sysctl/sysctl.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/sysctl/sysctl.c b/src/sysctl/sysctl.c
-index 2d43660..79f3f77 100644
---- a/src/sysctl/sysctl.c
-+++ b/src/sysctl/sysctl.c
-@@ -125,7 +125,7 @@ static int parse_file(Hashmap *sysctl_options, const char *path, bool ignore_eno
- 
-         r = search_and_fopen_nulstr(path, "re", conf_file_dirs, &f);
-         if (r < 0) {
--                if (ignore_enoent && errno == -ENOENT)
-+                if (ignore_enoent && r == -ENOENT)
-                         return 0;
- 
-                 log_error("Failed to open file '%s', ignoring: %s", path, strerror(-r));
--- 
-1.7.9.5
-
diff --git a/meta/recipes-core/systemd/systemd/199-firmware.patch b/meta/recipes-core/systemd/systemd/199-firmware.patch
deleted file mode 100644
index aaab59b..0000000
--- a/meta/recipes-core/systemd/systemd/199-firmware.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-Upstream-Status: Backport
-http://cgit.freedesktop.org/systemd/systemd/patch/?id=d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff
-
-From d8d4bee76cf3b40ea923bc57d44aa0815ca9b5ff Mon Sep 17 00:00:00 2001
-From: Kay Sievers <kay@vrfy.org>
-Date: Thu, 28 Mar 2013 14:28:10 +0000
-Subject: build-sys: fix HAVE/ENABLE_FIRMWARE
-
-https://bugs.freedesktop.org/show_bug.cgi?id=62864
----
-diff --git a/configure.ac b/configure.ac
-index 5b88bcf..e73cd5c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -728,6 +728,7 @@ for i in $with_firmware_path; do
- done
- IFS=$OLD_IFS
- AC_SUBST(FIRMWARE_PATH)
-+AS_IF([test "x${FIRMWARE_PATH}" != "x"], [ AC_DEFINE(HAVE_FIRMWARE, 1, [Define if FIRMWARE is available]) ])
- AM_CONDITIONAL(ENABLE_FIRMWARE, [test "x${FIRMWARE_PATH}" != "x"])
- 
- # ------------------------------------------------------------------------------
-@@ -736,7 +737,6 @@ AC_ARG_ENABLE([gudev],
-        [], [enable_gudev=yes])
- AS_IF([test "x$enable_gudev" = "xyes"], [ PKG_CHECK_MODULES([GLIB], [glib-2.0 >= 2.22.0 gobject-2.0 >= 2.22.0 gio-2.0]) ])
- AM_CONDITIONAL([ENABLE_GUDEV], [test "x$enable_gudev" = "xyes"])
--
- AS_IF([test "x$enable_gudev" = "xyes"], [ AC_DEFINE(HAVE_GLIB, 1, [Define if glib is available]) ])
- 
- # ------------------------------------------------------------------------------
-diff --git a/src/udev/udev-builtin.c b/src/udev/udev-builtin.c
-index 13922d3..c7d4319 100644
---- a/src/udev/udev-builtin.c
-+++ b/src/udev/udev-builtin.c
-@@ -34,7 +34,7 @@ static const struct udev_builtin *builtins[] = {
-         [UDEV_BUILTIN_BLKID] = &udev_builtin_blkid,
- #endif
-         [UDEV_BUILTIN_BTRFS] = &udev_builtin_btrfs,
--#ifdef ENABLE_FIRMWARE
-+#ifdef HAVE_FIRMWARE
-         [UDEV_BUILTIN_FIRMWARE] = &udev_builtin_firmware,
- #endif
-         [UDEV_BUILTIN_HWDB] = &udev_builtin_hwdb,
-diff --git a/src/udev/udev.h b/src/udev/udev.h
-index aa2edbe..906dfba 100644
---- a/src/udev/udev.h
-+++ b/src/udev/udev.h
-@@ -140,7 +140,7 @@ enum udev_builtin_cmd {
-         UDEV_BUILTIN_BLKID,
- #endif
-         UDEV_BUILTIN_BTRFS,
--#ifdef ENABLE_FIRMWARE
-+#ifdef HAVE_FIRMWARE
-         UDEV_BUILTIN_FIRMWARE,
- #endif
-         UDEV_BUILTIN_HWDB,
-@@ -169,7 +169,7 @@ struct udev_builtin {
- extern const struct udev_builtin udev_builtin_blkid;
- #endif
- extern const struct udev_builtin udev_builtin_btrfs;
--#ifdef ENABLE_FIRMWARE
-+#ifdef HAVE_FIRMWARE
- extern const struct udev_builtin udev_builtin_firmware;
- #endif
- extern const struct udev_builtin udev_builtin_hwdb;
-diff --git a/src/udev/udevd.c b/src/udev/udevd.c
-index b30bedf..2ad7388 100644
---- a/src/udev/udevd.c
-+++ b/src/udev/udevd.c
-@@ -98,7 +98,7 @@ struct event {
-         dev_t devnum;
-         int ifindex;
-         bool is_block;
--#ifdef ENABLE_FIRMWARE
-+#ifdef HAVE_FIRMWARE
-         bool nodelay;
- #endif
- };
-@@ -444,7 +444,7 @@ static int event_queue_insert(struct udev_device *dev)
-         event->devnum = udev_device_get_devnum(dev);
-         event->is_block = streq("block", udev_device_get_subsystem(dev));
-         event->ifindex = udev_device_get_ifindex(dev);
--#ifdef ENABLE_FIRMWARE
-+#ifdef HAVE_FIRMWARE
-         if (streq(udev_device_get_subsystem(dev), "firmware"))
-                 event->nodelay = true;
- #endif
-@@ -527,7 +527,7 @@ static bool is_devpath_busy(struct event *event)
-                         return true;
-                 }
- 
--#ifdef ENABLE_FIRMWARE
-+#ifdef HAVE_FIRMWARE
-                 /* allow to bypass the dependency tracking */
-                 if (event->nodelay)
-                         continue;
---
-cgit v0.9.0.2-2-gbebe
diff --git a/meta/recipes-core/systemd/systemd_199.bb b/meta/recipes-core/systemd/systemd_204.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd_199.bb
rename to meta/recipes-core/systemd/systemd_204.bb
index b1cc046..ec5be1f 100644
--- a/meta/recipes-core/systemd/systemd_199.bb
+++ b/meta/recipes-core/systemd/systemd_204.bb
@@ -9,9 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 PROVIDES = "udev"
 
 PE = "1"
-PR = "r4"
 
-DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native"
+DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 qemu-native util-linux"
 DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 SECTION = "base/shell"
@@ -23,16 +22,12 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
            file://modprobe.rules \
            file://var-run.conf \
            ${UCLIBCPATCHES} \
+           file://0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch \
            file://00-create-volatile.conf \
-           file://0002-readahead-chunk-on-spinning-media.patch \
-           file://0003-readahead-cleanups.patch \
-           file://0013-systemd-sysctl-Handle-missing-etc-sysctl.conf-proper.patch \
-           file://0001-configure-use-AC_CHECK_TOOL-for-objcopy-strings-and-.patch \
-           file://199-firmware.patch \
            file://init \
           "
-SRC_URI[md5sum] = "4bb13f84ce211e93f0141774a90a2322"
-SRC_URI[sha256sum] = "8c4462a04f3ecf7f083782e5e0687913b1d33c6444bf20fa2f31df9222965fed"
+SRC_URI[md5sum] = "a07619bb19f48164fbf0761d12fd39a8"
+SRC_URI[sha256sum] = "072c393503c7c1e55ca7acf3db659cbd28c7fe5fa94fab3db95360bafd96731b"
 
 UCLIBCPATCHES = ""
 UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
-- 
1.8.2.3


