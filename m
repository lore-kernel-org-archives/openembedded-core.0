Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7428360132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 20:40:44 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id rd3so43204634pab.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 12:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=n8iNlMWotsRva20iASLC9EogjOxtVDQQv3MrYM1uei0=;
	b=xuvSRRjPkwPy/lB2D0WUyYhW+2Rcv+iz8HHs7hlDAFezny9KtLbTImZlVhgopWxAzv
	wRp1ook4VL1wpYkhXNsURTB92+9osHpYMnilR7KUoqEGPFykCaNAJeEmZa1zDjpYyfFU
	ArP5kmY2i7TK31Gpr9AlNtBge6Ve/uKCcYVl1bojCyIrvOHFIoBWmuY8QIfOm36J4VDE
	4iXjHC+TEAHPsn7mqk05ccf3DYb/e0/HZAeVuHXmXSbWTeQv/LvT/ZE26aCouEcDdE+B
	8nXEteV/7o7p9rdGrDfTSED2Oy0I3xcFbk60anN5VtFgIq/zYml2V+dr1mea2t5JBpHL
	EkjA==
X-Received: by 10.70.14.229 with SMTP id s5mr3351080pdc.143.1422564046111;
	Thu, 29 Jan 2015 12:40:46 -0800 (PST)
Received: from haswell.localdomain (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85])
	by mx.google.com with ESMTPSA id qs3sm8629356pbc.28.2015.01.29.12.40.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 Jan 2015 12:40:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Jan 2015 12:44:20 -0800
Message-Id: <1422564260-24041-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.2.2
Subject: [PATCH V2] systemd: Backports fixes to 216
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
X-List-Received-Date: Thu, 29 Jan 2015 20:40:54 -0000

Fix systemd-timesyncd assertion

when networkd is disabled then we now do not
create /run/systemd/netif/links but timesyncd needs it. So lets
manually create this file when networkd is disabled so timesyncd
can still function

When enabling systemd-timesyncd we need systemd-timesync user

Backport patches to enable timesyncd when resolved and networkd
are disabled

replace the resolv.conf symlinink patch with a proper backport

Change-Id: I53f1a53eec4e4a4dbdfb7e8cd155d544ee5d81ec
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...onfigure-the-list-of-system-users-files-a.patch | 176 +++++++++++++++++++++
 ...o-not-install-tmpfiles-and-sysusers-files.patch |  56 +++++++
 ...ke-resolv.conf-entry-conditional-on-resol.patch | 142 +++++++++++++++++
 ...es.d-etc.conf-disable-resolv.conf-symlink.patch |  35 ----
 meta/recipes-core/systemd/systemd_216.bb           |  12 +-
 5 files changed, 384 insertions(+), 37 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch b/meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch
new file mode 100644
index 0000000..e004359
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-build-sys-configure-the-list-of-system-users-files-a.patch
@@ -0,0 +1,176 @@
+From 5a16bc264c32237e38a844d55e7a1820a31b8440 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
+Date: Fri, 28 Nov 2014 15:59:59 +0100
+Subject: [PATCH] build-sys: configure the list of system users, files and
+ directories
+
+Choose which system users defined in sysusers.d/systemd.conf and files
+or directories in tmpfiles.d/systemd.conf, should be provided depending
+on comile-time configuration.
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am                                  | 4 ++++
+ configure.ac                                 | 2 ++
+ sysusers.d/.gitignore                        | 1 +
+ sysusers.d/{systemd.conf => systemd.conf.m4} | 8 ++++++++
+ tmpfiles.d/.gitignore                        | 3 ++-
+ tmpfiles.d/{systemd.conf => systemd.conf.m4} | 2 ++
+ 6 files changed, 19 insertions(+), 1 deletion(-)
+ rename sysusers.d/{systemd.conf => systemd.conf.m4} (77%)
+ rename tmpfiles.d/{systemd.conf => systemd.conf.m4} (96%)
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am	2015-01-23 21:23:04.000000000 +0000
++++ git/Makefile.am	2015-01-23 21:23:04.000000000 +0000
+@@ -5698,6 +5698,10 @@
+ 	$(AM_V_at)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
+ 
++sysusers.d/%: sysusers.d/%.m4
++	$(AM_V_at)$(MKDIR_P) $(dir $@)
++	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
++
+ tmpfiles.d/%: tmpfiles.d/%.m4
+ 	$(AM_V_at)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac	2015-01-23 21:23:04.000000000 +0000
++++ git/configure.ac	2015-01-23 21:23:04.000000000 +0000
+@@ -971,6 +971,7 @@
+ AC_ARG_ENABLE(timesyncd, AS_HELP_STRING([--disable-timesyncd], [disable timesync daemon]))
+ if test "x$enable_timesyncd" != "xno"; then
+         have_timesyncd=yes
++        M4_DEFINES="$M4_DEFINES -DENABLE_TIMESYNCD"
+ fi
+ AM_CONDITIONAL(ENABLE_TIMESYNCD, [test "$have_timesyncd" = "yes"])
+ 
+@@ -1060,6 +1061,7 @@
+ AS_IF([test "x$enable_networkd" != "xno"], [
+         AC_DEFINE(ENABLE_NETWORKD, 1, [Define if networkd support is to be enabled])
+         have_networkd=yes
++        M4_DEFINES="$M4_DEFINES -DENABLE_NETWORKD"
+ ])
+ AM_CONDITIONAL(ENABLE_NETWORKD, [test "x$have_networkd" = "xyes"])
+ 
+Index: git/sysusers.d/systemd.conf
+===================================================================
+--- git.orig/sysusers.d/systemd.conf	2015-01-23 21:23:02.000000000 +0000
++++ /dev/null	1970-01-01 00:00:00.000000000 +0000
+@@ -1,12 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-g systemd-journal   - -
+-u systemd-bus-proxy - "systemd Bus Proxy"
+-u systemd-network   - "systemd Network Management"
+-u systemd-resolve   - "systemd Resolver"
+-u systemd-timesync  - "systemd Time Synchronization"
+Index: git/sysusers.d/systemd.conf.m4
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/sysusers.d/systemd.conf.m4	2015-01-23 21:26:30.000000000 +0000
+@@ -0,0 +1,20 @@
++#  This file is part of systemd.
++#
++#  systemd is free software; you can redistribute it and/or modify it
++#  under the terms of the GNU Lesser General Public License as published by
++#  the Free Software Foundation; either version 2.1 of the License, or
++#  (at your option) any later version.
++
++g systemd-journal   - -
++m4_ifdef(`ENABLE_KDBUS',
++u systemd-bus-proxy - "systemd Bus Proxy"
++)m4_dnl
++m4_ifdef(`ENABLE_NETWORKD',
++u systemd-network   - "systemd Network Management"
++)m4_dnl
++m4_ifdef(`ENABLE_RESOLVED',
++u systemd-resolve   - "systemd Resolver"
++)m4_dnl
++m4_ifdef(`ENABLE_TIMESYNCD',
++u systemd-timesync  - "systemd Time Synchronization"
++)m4_dnl
+Index: git/tmpfiles.d/systemd.conf
+===================================================================
+--- git.orig/tmpfiles.d/systemd.conf	2015-01-23 21:23:02.000000000 +0000
++++ /dev/null	1970-01-01 00:00:00.000000000 +0000
+@@ -1,32 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-# See tmpfiles.d(5) for details
+-
+-d /run/user 0755 root root -
+-F! /run/utmp 0664 root utmp -
+-
+-d /run/systemd/ask-password 0755 root root -
+-d /run/systemd/seats 0755 root root -
+-d /run/systemd/sessions 0755 root root -
+-d /run/systemd/users 0755 root root -
+-d /run/systemd/machines 0755 root root -
+-d /run/systemd/shutdown 0755 root root -
+-d /run/systemd/netif 0755 systemd-network systemd-network -
+-d /run/systemd/netif/links 0755 systemd-network systemd-network -
+-d /run/systemd/netif/leases 0755 systemd-network systemd-network -
+-
+-d /run/log 0755 root root -
+-
+-z /run/log/journal 2755 root systemd-journal - -
+-Z /run/log/journal/%m ~2750 root systemd-journal - -
+-
+-z /var/log/journal 2755 root systemd-journal - -
+-z /var/log/journal/%m 2755 root systemd-journal - -
+-
+-d /var/lib/systemd 0755 root root -
+-d /var/lib/systemd/coredump 0755 root root 3d
+Index: git/tmpfiles.d/systemd.conf.m4
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/tmpfiles.d/systemd.conf.m4	2015-01-23 21:26:46.000000000 +0000
+@@ -0,0 +1,34 @@
++#  This file is part of systemd.
++#
++#  systemd is free software; you can redistribute it and/or modify it
++#  under the terms of the GNU Lesser General Public License as published by
++#  the Free Software Foundation; either version 2.1 of the License, or
++#  (at your option) any later version.
++
++# See tmpfiles.d(5) for details
++
++d /run/user 0755 root root -
++F! /run/utmp 0664 root utmp -
++
++d /run/systemd/ask-password 0755 root root -
++d /run/systemd/seats 0755 root root -
++d /run/systemd/sessions 0755 root root -
++d /run/systemd/users 0755 root root -
++d /run/systemd/machines 0755 root root -
++d /run/systemd/shutdown 0755 root root -
++m4_ifdef(`ENABLE_NETWORKD',
++d /run/systemd/netif 0755 systemd-network systemd-network -
++d /run/systemd/netif/links 0755 systemd-network systemd-network -
++d /run/systemd/netif/leases 0755 systemd-network systemd-network -
++)m4_dnl
++
++d /run/log 0755 root root -
++
++z /run/log/journal 2755 root systemd-journal - -
++Z /run/log/journal/%m ~2750 root systemd-journal - -
++
++z /var/log/journal 2755 root systemd-journal - -
++z /var/log/journal/%m 2755 root systemd-journal - -
++
++d /var/lib/systemd 0755 root root -
++d /var/lib/systemd/coredump 0755 root root 3d
diff --git a/meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch b/meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch
new file mode 100644
index 0000000..4795f86
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch
@@ -0,0 +1,56 @@
+From bedd083aaedb3bbb14ef579a047bf4b4fed56d9b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>
+Date: Wed, 26 Nov 2014 09:17:50 +0100
+Subject: [PATCH] build-sys: do not install tmpfiles and sysusers files by
+ default
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ Makefile.am | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ddd0df1..65bb176 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2039,7 +2039,6 @@ nodist_tmpfiles_DATA = \
+ dist_tmpfiles_DATA = \
+ 	tmpfiles.d/systemd.conf \
+ 	tmpfiles.d/systemd-nologin.conf \
+-	tmpfiles.d/systemd-remote.conf \
+ 	tmpfiles.d/tmp.conf \
+ 	tmpfiles.d/x11.conf \
+ 	tmpfiles.d/var.conf
+@@ -2094,8 +2093,7 @@ SYSINIT_TARGET_WANTS += \
+ 	systemd-sysusers.service
+ 
+ dist_sysusers_DATA = \
+-	sysusers.d/systemd.conf \
+-	sysusers.d/systemd-remote.conf
++	sysusers.d/systemd.conf
+ 
+ nodist_sysusers_DATA = \
+ 	sysusers.d/basic.conf
+@@ -3839,6 +3837,16 @@ systemd_journal_remote_CFLAGS = \
+ systemd_journal_remote_LDADD += \
+ 	$(MICROHTTPD_LIBS)
+ 
++if ENABLE_SYSUSERS
++dist_sysusers_DATA += \
++	sysusers.d/systemd-remote.conf
++endif
++
++if ENABLE_TMPFILES
++dist_tmpfiles_DATA += \
++	tmpfiles.d/systemd-remote.conf
++endif
++
+ if HAVE_GNUTLS
+ systemd_journal_remote_LDADD += \
+ 	$(GNUTLS_LIBS)
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch
new file mode 100644
index 0000000..b5b0168
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch
@@ -0,0 +1,142 @@
+From aeb50ff0bd4bbbca74c4695072232348351d512d Mon Sep 17 00:00:00 2001
+From: Tom Gundersen <teg@jklm.no>
+Date: Wed, 27 Aug 2014 17:45:41 +0200
+Subject: [PATCH] tmpfiles: make resolv.conf entry conditional on resolved
+ support
+
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ Makefile.am                          | 15 +++++++++++++--
+ TODO                                 |  2 --
+ configure.ac                         |  1 +
+ tmpfiles.d/.gitignore                |  1 +
+ tmpfiles.d/{etc.conf => etc.conf.m4} |  2 ++
+ 5 files changed, 17 insertions(+), 4 deletions(-)
+ create mode 100644 tmpfiles.d/.gitignore
+ rename tmpfiles.d/{etc.conf => etc.conf.m4} (95%)
+
+Index: git/Makefile.am
+===================================================================
+--- git.orig/Makefile.am	2015-01-24 00:41:20.134716451 -0800
++++ git/Makefile.am	2015-01-24 00:41:20.126716451 -0800
+@@ -1935,14 +1935,16 @@
+ 	units/systemd-tmpfiles-setup.service \
+ 	units/systemd-tmpfiles-clean.service
+ 
++nodist_tmpfiles_DATA = \
++	tmpfiles.d/etc.conf
++
+ dist_tmpfiles_DATA = \
+ 	tmpfiles.d/systemd.conf \
+ 	tmpfiles.d/systemd-nologin.conf \
+ 	tmpfiles.d/systemd-remote.conf \
+ 	tmpfiles.d/tmp.conf \
+ 	tmpfiles.d/x11.conf \
+-	tmpfiles.d/var.conf \
+-	tmpfiles.d/etc.conf
++	tmpfiles.d/var.conf
+ 
+ if HAVE_SYSV_COMPAT
+ dist_tmpfiles_DATA += \
+@@ -1965,10 +1967,14 @@
+ endif
+ 
+ EXTRA_DIST += \
++	tmpfiles.d/etc.conf.m4 \
+ 	units/systemd-tmpfiles-setup-dev.service.in \
+ 	units/systemd-tmpfiles-setup.service.in \
+ 	units/systemd-tmpfiles-clean.service.in
+ 
++CLEANFILES += \
++	tmpfiles.d/etc.conf
++
+ # ------------------------------------------------------------------------------
+ if ENABLE_SYSUSERS
+ systemd_sysusers_SOURCES = \
+@@ -5684,6 +5690,11 @@
+ 	$(AM_V_at)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
+ 
++tmpfiles.d/%: tmpfiles.d/%.m4
++	$(AM_V_at)$(MKDIR_P) $(dir $@)
++	$(AM_V_M4)$(M4) -P $(M4_DEFINES) < $< > $@
++
++
+ units/%: units/%.m4
+ 	$(AM_V_at)$(MKDIR_P) $(dir $@)
+ 	$(AM_V_M4)$(M4) -P $(M4_DEFINES) -DFOR_SYSTEM=1 < $< > $@
+Index: git/TODO
+===================================================================
+--- git.orig/TODO	2015-01-24 00:41:20.134716451 -0800
++++ git/TODO	2015-01-24 00:41:20.126716451 -0800
+@@ -111,8 +111,6 @@
+ 
+ * Allow multiple ExecStart= for all Type= settings, so that we can cover rescue.service nicely
+ 
+-* the resolv.conf tmpfiles line should be covered by ENABLE_NETWORKD...
+-
+ * Add a new verb "systemctl top"
+ 
+ * logind: allow users to kill or lock their own sessions
+Index: git/configure.ac
+===================================================================
+--- git.orig/configure.ac	2015-01-24 00:41:20.134716451 -0800
++++ git/configure.ac	2015-01-24 00:41:20.126716451 -0800
+@@ -1041,6 +1041,7 @@
+ AC_ARG_ENABLE(resolved, AS_HELP_STRING([--disable-resolved], [disable resolve daemon]))
+ if test "x$enable_resolved" != "xno"; then
+         have_resolved=yes
++        M4_DEFINES="$M4_DEFINES -DENABLE_RESOLVED"
+ fi
+ AM_CONDITIONAL(ENABLE_RESOLVED, [test "$have_resolved" = "yes"])
+ 
+Index: git/tmpfiles.d/.gitignore
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/tmpfiles.d/.gitignore	2015-01-24 00:41:20.126716451 -0800
+@@ -0,0 +1 @@
++etc.conf
+Index: git/tmpfiles.d/etc.conf
+===================================================================
+--- git.orig/tmpfiles.d/etc.conf	2015-01-24 00:41:20.134716451 -0800
++++ /dev/null	1970-01-01 00:00:00.000000000 +0000
+@@ -1,15 +0,0 @@
+-#  This file is part of systemd.
+-#
+-#  systemd is free software; you can redistribute it and/or modify it
+-#  under the terms of the GNU Lesser General Public License as published by
+-#  the Free Software Foundation; either version 2.1 of the License, or
+-#  (at your option) any later version.
+-
+-# See tmpfiles.d(5) for details
+-
+-L /etc/os-release - - - - ../usr/lib/os-release
+-L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
+-L+ /etc/mtab - - - - ../proc/self/mounts
+-L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
+-C /etc/nsswitch.conf - - - -
+-C /etc/pam.d - - - -
+Index: git/tmpfiles.d/etc.conf.m4
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ git/tmpfiles.d/etc.conf.m4	2015-01-24 00:41:20.126716451 -0800
+@@ -0,0 +1,17 @@
++#  This file is part of systemd.
++#
++#  systemd is free software; you can redistribute it and/or modify it
++#  under the terms of the GNU Lesser General Public License as published by
++#  the Free Software Foundation; either version 2.1 of the License, or
++#  (at your option) any later version.
++
++# See tmpfiles.d(5) for details
++
++L /etc/os-release - - - - ../usr/lib/os-release
++L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
++L+ /etc/mtab - - - - ../proc/self/mounts
++m4_ifdef(`ENABLE_RESOLVED',
++L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
++)
++C /etc/nsswitch.conf - - - -
++C /etc/pam.d - - - -
diff --git a/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch b/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch
deleted file mode 100644
index 7218322..0000000
--- a/meta/recipes-core/systemd/systemd/0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f0ab1600fb56d680e6aba3d0d51dfb9ffa3d9403 Mon Sep 17 00:00:00 2001
-From: "Peter A. Bigot" <pab@pabigot.com>
-Date: Thu, 18 Sep 2014 08:36:54 -0500
-Subject: [PATCH] tmpfiles.d/etc.conf: disable resolv.conf symlink
-
-This link is valid only if ENABLE_RESOLVED is configured for systemd.
-If left unconditional, the symlink is created preventing connman from
-storing the configuration it received from DHCP or other sources.
-
-Upstream has a TODO to fix this, but has not done so as of this date.
-Provide a temporary workaround for OE until this is done properly
-upstream.
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
----
- tmpfiles.d/etc.conf | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tmpfiles.d/etc.conf b/tmpfiles.d/etc.conf
-index b23272c..5364dd8 100644
---- a/tmpfiles.d/etc.conf
-+++ b/tmpfiles.d/etc.conf
-@@ -10,6 +10,7 @@
- L /etc/os-release - - - - ../usr/lib/os-release
- L /etc/localtime - - - - ../usr/share/zoneinfo/UTC
- L+ /etc/mtab - - - - ../proc/self/mounts
--L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
-+# TODO: conditional on ENABLE_RESOLVED
-+#L /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf
- C /etc/nsswitch.conf - - - -
- C /etc/pam.d - - - -
--- 
-1.8.5.5
-
diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index bfd5544..47691a9 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -35,11 +35,13 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd;branch=master;protocol=
            file://0001-Make-root-s-home-directory-configurable.patch \
            file://0001-systemd-user-avoid-using-system-auth.patch \
            file://0001-journal-Fix-navigating-backwards-missing-entries.patch \
+           file://0001-tmpfiles-make-resolv.conf-entry-conditional-on-resol.patch \
+           file://0001-build-sys-do-not-install-tmpfiles-and-sysusers-files.patch \
+           file://0001-build-sys-configure-the-list-of-system-users-files-a.patch \
            file://touchscreen.rules \
            file://00-create-volatile.conf \
            file://init \
            file://run-ptest \
-           ${@bb.utils.contains('PACKAGECONFIG', 'resolved', '', 'file://0001-tmpfiles.d-etc.conf-disable-resolv.conf-symlink.patch', d)} \
           "
 
 S = "${WORKDIR}/git"
@@ -151,6 +153,12 @@ do_install() {
 
 	# Enable journal to forward message to syslog daemon
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
+	# its needed in 216 upstream has fixed it with 919699ec301ea507edce4a619141ed22e789ac0d
+	# don't order journal flushing afte remote-fs.target
+	sed -i -e 's/ remote-fs.target$//' ${D}${systemd_unitdir}/system/systemd-journal-flush.service
+	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
+	# for existence else it fails
+	${@bb.utils.contains('PACKAGECONFIG', 'networkd', '', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
 }
 
 do_install_ptest () {
@@ -182,7 +190,7 @@ SYSTEMD_PACKAGES = "${PN}-binfmt"
 SYSTEMD_SERVICE_${PN}-binfmt = "systemd-binfmt.service"
 
 USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} += "--system systemd-journal-gateway"
+USERADD_PARAM_${PN} += "--system systemd-journal-gateway; --system systemd-timesync"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-- 
2.1.1


