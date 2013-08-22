Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id F325D6B8B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 04:31:56 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so1350434pde.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 21:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=IO/5BpgnAQJeJT8AyejcOAd1kkqnqHZXy8sKq3JqeoE=;
	b=XxYTlicXi2ebrW4qwje3iiUooeCmSe1kWBshkifHs5JK4+uARS5MA0jXeAJd3Q3RMZ
	SsTrceThM5z27sfJiR4PvsC0kGphTMM0ngetOFNy8jEdB7p5GhtV5b6yIMf4fJnd1l7I
	RovxbPX+1wc5vHyIN3G5+X9bHMP0dVfeDZQ5lT5qgvE9DgQ2Bv806ZEyYEr5Rj97ZgwA
	kHg/sFQnkXk3sjB8eYWg03GJn/9HBCr3K0+haPCyjzBxFPjy3arYcXFVY8KiWbLdtS8T
	eEKMZaw2LEVlwyqDuGOXy7yTrj3RAEsVzPmkKcNWjY+coHYgXS+mijBx3k7YwJRkCZLP
	ptkQ==
X-Received: by 10.68.169.161 with SMTP id af1mr11259003pbc.22.1377145917969;
	Wed, 21 Aug 2013 21:31:57 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	hx1sm12017781pbb.35.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 21 Aug 2013 21:31:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Aug 2013 21:31:15 -0700
Message-Id: <a7cb7b0c2c43a8cc4c45608ed805dbf015e4fdc6.1377145501.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
References: <39306cf37bfb1b6ccf99c049498d6b4cf6c60976.1377145501.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377145501.git.raj.khem@gmail.com>
References: <cover.1377145501.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] systemd: Upgrade to 206
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
X-List-Received-Date: Thu, 22 Aug 2013 04:31:57 -0000

Add new PACKAGE systemd-rpm-macros, this will hold
the macros which are interesting when rpm is used as
package management backend

Forward port uclibc only patches. Add a new patch
to stub out use of preadv/pwritev in testcases

Delete patches that have been merged upstream in systemd

Remove force export of GPERF variable in environment
this was causing AC_CHECK_TOOL to not populate GPERF
variable as expected

systemd needs kmod to be present on rootfs so add it
to RDEPENDS

some services substitute discovered kmod when the service
file is generated during boot, however the discovered kmod
is from native sysroot and it gets into the service file
with absolute path. So specify the target path of kmod using
KMOD variable so the unit files have correct pointer to kmod
on target

Add a patch to make sure that mknod capability is checked
before the service which excercise mknod, this patch is also
submitted to upstream systemd

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-uClibc-doesn-t-implement-pwritev-preadv.patch |  37 +++
 .../0001-use-CAP_MKNOD-ConditionCapability.patch   |  32 ++
 ...ystemd-update-utmp-shutdown.service-into-.patch | 367 ---------------------
 .../systemd/systemd/install-quotaon-once.patch     |  34 --
 .../systemd/systemd-pam-fix-getty-unit.patch       |  24 +-
 .../systemd/systemd/systemd-pam-fix-mkostemp.patch |  59 ++--
 .../systemd/{systemd_204.bb => systemd_206.bb}     |  19 +-
 7 files changed, 120 insertions(+), 452 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/install-quotaon-once.patch
 rename meta/recipes-core/systemd/{systemd_204.bb => systemd_206.bb} (95%)

diff --git a/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch b/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
new file mode 100644
index 0000000..e204a50
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-uClibc-doesn-t-implement-pwritev-preadv.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Inappropriate [uclibc specific]
+
+From 7be9273548bcb1f57d011fc252965e45dd2a058c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Aug 2013 19:09:27 -0700
+Subject: [PATCH] uClibc doesn't implement pwritev/preadv
+
+Lets stub out the testcase for building.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libsystemd-bus/test-bus-memfd.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libsystemd-bus/test-bus-memfd.c b/src/libsystemd-bus/test-bus-memfd.c
+index 05ef555..45e5e44 100644
+--- a/src/libsystemd-bus/test-bus-memfd.c
++++ b/src/libsystemd-bus/test-bus-memfd.c
+@@ -145,6 +145,7 @@ int main(int argc, char *argv[]) {
+         /* check content */
+         assert_se(memcmp(buf, "ll", 2) == 0);
+ 
++#ifndef __UCLIBC__
+         /* writev it out*/
+         iov[0].iov_base = (char *)"ABC";
+         iov[0].iov_len = 3;
+@@ -167,6 +168,7 @@ int main(int argc, char *argv[]) {
+         assert_se(memcmp(bufv[0], "ABC", 3) == 0);
+         assert_se(memcmp(bufv[1], "DEF", 3) == 0);
+         assert_se(memcmp(bufv[2], "GHI", 3) == 0);
++#endif /* __UCLIBC__ */
+ 
+         sd_memfd_free(m);
+ 
+-- 
+1.8.3.4
+
diff --git a/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch b/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
new file mode 100644
index 0000000..4a35c23
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-use-CAP_MKNOD-ConditionCapability.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted
+
+From cfdd1eb76dced87c73bac8ec22d3a10244c9bbf6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 21 Aug 2013 20:25:19 -0700
+Subject: [PATCH] use CAP_MKNOD ConditionCapability
+
+Fixes errors seen when booting VMs on QEMU like
+
+systemd[1]: kmod-static-nodes.service: main process exited, code=exited, status=203/EXEC
+systemd[1]: Failed to start Create list of required static device nodes for the current kernel.
+systemd[1]: Unit kmod-static-nodes.service entered failed state.
+
+Make sure that mknod capability is available
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ units/kmod-static-nodes.service.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: systemd-206/units/kmod-static-nodes.service.in
+===================================================================
+--- systemd-206.orig/units/kmod-static-nodes.service.in	2013-08-21 19:13:02.000000000 -0700
++++ systemd-206/units/kmod-static-nodes.service.in	2013-08-21 20:39:13.310689871 -0700
+@@ -9,6 +9,7 @@
+ Description=Create list of required static device nodes for the current kernel
+ DefaultDependencies=no
+ Before=sysinit.target systemd-tmpfiles-setup-dev.service
++ConditionCapability=CAP_MKNOD
+ 
+ [Service]
+ Type=oneshot
diff --git a/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch b/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
deleted file mode 100644
index 86fab97..0000000
--- a/meta/recipes-core/systemd/systemd/0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch
+++ /dev/null
@@ -1,367 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-From 3f92e4b4b61042391bd44de4dceb18177df0dd57 Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Thu, 16 May 2013 00:19:03 +0200
-Subject: [PATCH] utmp: turn systemd-update-utmp-shutdown.service into a normal
- runtime service
-
-With this change systemd-update-utmp-shutdown.service is replaced by
-systemd-update-utmp.service which is started at boot and stays around
-until shutdown. This allows us to properly order the unit against both
-/var/log and auditd.
-
-https://bugzilla.redhat.com/show_bug.cgi?id=853104
-https://bugs.freedesktop.org/show_bug.cgi?id=64365
----
- Makefile-man.am                               | 12 ++---
- Makefile.am                                   |  8 +--
- man/systemd-update-utmp-runlevel.service.xml  | 76 ---------------------------
- man/systemd-update-utmp.service.xml           | 76 +++++++++++++++++++++++++++
- src/update-utmp/update-utmp.c                 |  2 +-
- units/.gitignore                              |  2 +-
- units/systemd-update-utmp-runlevel.service.in |  8 +--
- units/systemd-update-utmp-shutdown.service.in | 19 -------
- units/systemd-update-utmp.service.in          | 21 ++++++++
- 9 files changed, 114 insertions(+), 110 deletions(-)
- delete mode 100644 man/systemd-update-utmp-runlevel.service.xml
- create mode 100644 man/systemd-update-utmp.service.xml
- delete mode 100644 units/systemd-update-utmp-shutdown.service.in
- create mode 100644 units/systemd-update-utmp.service.in
-
-diff --git a/Makefile-man.am b/Makefile-man.am
-index 7d62094..5888158 100644
---- a/Makefile-man.am
-+++ b/Makefile-man.am
-@@ -72,7 +72,7 @@ MANPAGES += \
- 	man/systemd-tmpfiles.8 \
- 	man/systemd-tty-ask-password-agent.1 \
- 	man/systemd-udevd.service.8 \
--	man/systemd-update-utmp-runlevel.service.8 \
-+	man/systemd-update-utmp.service.8 \
- 	man/systemd.1 \
- 	man/systemd.automount.5 \
- 	man/systemd.device.5 \
-@@ -191,7 +191,7 @@ MANPAGES_ALIAS += \
- 	man/systemd-udevd-control.socket.8 \
- 	man/systemd-udevd-kernel.socket.8 \
- 	man/systemd-udevd.8 \
--	man/systemd-update-utmp-shutdown.service.8 \
-+	man/systemd-update-utmp-runlevel.service.8 \
- 	man/systemd-update-utmp.8 \
- 	man/systemd-user.conf.5
- man/SD_ALERT.3: man/sd-daemon.3
-@@ -289,8 +289,8 @@ man/systemd-tmpfiles-setup.service.8: man/systemd-tmpfiles.8
- man/systemd-udevd-control.socket.8: man/systemd-udevd.service.8
- man/systemd-udevd-kernel.socket.8: man/systemd-udevd.service.8
- man/systemd-udevd.8: man/systemd-udevd.service.8
--man/systemd-update-utmp-shutdown.service.8: man/systemd-update-utmp-runlevel.service.8
--man/systemd-update-utmp.8: man/systemd-update-utmp-runlevel.service.8
-+man/systemd-update-utmp-runlevel.service.8: man/systemd-update-utmp.service.8
-+man/systemd-update-utmp.8: man/systemd-update-utmp.service.8
- man/systemd-user.conf.5: man/systemd-system.conf.5
- man/SD_ALERT.html: man/sd-daemon.html
- 	$(html-alias)
-@@ -577,10 +577,10 @@ man/systemd-udevd-kernel.socket.html: man/systemd-udevd.service.html
- man/systemd-udevd.html: man/systemd-udevd.service.html
- 	$(html-alias)
- 
--man/systemd-update-utmp-shutdown.service.html: man/systemd-update-utmp-runlevel.service.html
-+man/systemd-update-utmp-runlevel.service.html: man/systemd-update-utmp.service.html
- 	$(html-alias)
- 
--man/systemd-update-utmp.html: man/systemd-update-utmp-runlevel.service.html
-+man/systemd-update-utmp.html: man/systemd-update-utmp.service.html
- 	$(html-alias)
- 
- man/systemd-user.conf.html: man/systemd-system.conf.html
-diff --git a/Makefile.am b/Makefile.am
-index 8d8139c..4c5e6fc 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -417,8 +417,8 @@ nodist_systemunit_DATA = \
- 	units/systemd-initctl.service \
- 	units/systemd-shutdownd.service \
- 	units/systemd-remount-fs.service \
-+	units/systemd-update-utmp.service \
- 	units/systemd-update-utmp-runlevel.service \
--	units/systemd-update-utmp-shutdown.service \
- 	units/systemd-tmpfiles-setup-dev.service \
- 	units/systemd-tmpfiles-setup.service \
- 	units/systemd-tmpfiles-clean.service \
-@@ -463,8 +463,8 @@ EXTRA_DIST += \
- 	units/systemd-initctl.service.in \
- 	units/systemd-shutdownd.service.in \
- 	units/systemd-remount-fs.service.in \
-+	units/systemd-update-utmp.service.in \
- 	units/systemd-update-utmp-runlevel.service.in \
--	units/systemd-update-utmp-shutdown.service.in \
- 	units/systemd-tmpfiles-setup-dev.service.in \
- 	units/systemd-tmpfiles-setup.service.in \
- 	units/systemd-tmpfiles-clean.service.in \
-@@ -4070,8 +4070,8 @@ RUNLEVEL4_TARGET_WANTS += \
- RUNLEVEL5_TARGET_WANTS += \
- 	systemd-update-utmp-runlevel.service
- endif
--SHUTDOWN_TARGET_WANTS += \
--	systemd-update-utmp-shutdown.service
-+SYSINIT_TARGET_WANTS += \
-+	systemd-update-utmp.service
- LOCAL_FS_TARGET_WANTS += \
- 	systemd-remount-fs.service \
- 	systemd-fsck-root.service \
-diff --git a/man/systemd-update-utmp-runlevel.service.xml b/man/systemd-update-utmp-runlevel.service.xml
-deleted file mode 100644
-index 867b958..0000000
---- a/man/systemd-update-utmp-runlevel.service.xml
-+++ /dev/null
-@@ -1,76 +0,0 @@
--<?xml version="1.0"?>
--<!--*-nxml-*-->
--<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
--<!--
--  This file is part of systemd.
--
--  Copyright 2012 Lennart Poettering
--
--  systemd is free software; you can redistribute it and/or modify it
--  under the terms of the GNU Lesser General Public License as published by
--  the Free Software Foundation; either version 2.1 of the License, or
--  (at your option) any later version.
--
--  systemd is distributed in the hope that it will be useful, but
--  WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
--  Lesser General Public License for more details.
--
--  You should have received a copy of the GNU Lesser General Public License
--  along with systemd; If not, see <http://www.gnu.org/licenses/>.
---->
--<refentry id="systemd-update-utmp-runlevel.service">
--
--        <refentryinfo>
--                <title>systemd-update-utmp-runlevel.service</title>
--                <productname>systemd</productname>
--
--                <authorgroup>
--                        <author>
--                                <contrib>Developer</contrib>
--                                <firstname>Lennart</firstname>
--                                <surname>Poettering</surname>
--                                <email>lennart@poettering.net</email>
--                        </author>
--                </authorgroup>
--        </refentryinfo>
--
--        <refmeta>
--                <refentrytitle>systemd-update-utmp-runlevel.service</refentrytitle>
--                <manvolnum>8</manvolnum>
--        </refmeta>
--
--        <refnamediv>
--                <refname>systemd-update-utmp-runlevel.service</refname>
--                <refname>systemd-update-utmp-shutdown.service</refname>
--                <refname>systemd-update-utmp</refname>
--                <refpurpose>Write audit and utmp updates at runlevel
--                changes and shutdown</refpurpose>
--        </refnamediv>
--
--        <refsynopsisdiv>
--                <para><filename>systemd-update-utmp-runlevel.service</filename></para>
--                <para><filename>systemd-update-utmp-shutdown.service</filename></para>
--                <para><filename>/usr/lib/systemd/systemd-update-utmp</filename></para>
--        </refsynopsisdiv>
--
--        <refsect1>
--                <title>Description</title>
--
--                <para><filename>systemd-update-utmp-runlevel.service</filename>
--                is a service that writes SysV runlevel changes to utmp
--                and wtmp, as well as the audit logs, as they
--                occur. <filename>systemd-update-utmp-shutdown.service</filename>
--                does the same for shut-down requests.</para>
--        </refsect1>
--
--        <refsect1>
--                <title>See Also</title>
--                <para>
--                        <citerefentry><refentrytitle>systemd</refentrytitle><manvolnum>1</manvolnum></citerefentry>,
--                        <citerefentry><refentrytitle>utmp</refentrytitle><manvolnum>5</manvolnum></citerefentry>,
--                        <citerefentry><refentrytitle>auditd</refentrytitle><manvolnum>8</manvolnum></citerefentry>
--                </para>
--        </refsect1>
--
--</refentry>
-diff --git a/man/systemd-update-utmp.service.xml b/man/systemd-update-utmp.service.xml
-new file mode 100644
-index 0000000..846fc95
---- /dev/null
-+++ b/man/systemd-update-utmp.service.xml
-@@ -0,0 +1,76 @@
-+<?xml version="1.0"?>
-+<!--*-nxml-*-->
-+<!DOCTYPE refentry PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN" "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd">
-+<!--
-+  This file is part of systemd.
-+
-+  Copyright 2012 Lennart Poettering
-+
-+  systemd is free software; you can redistribute it and/or modify it
-+  under the terms of the GNU Lesser General Public License as published by
-+  the Free Software Foundation; either version 2.1 of the License, or
-+  (at your option) any later version.
-+
-+  systemd is distributed in the hope that it will be useful, but
-+  WITHOUT ANY WARRANTY; without even the implied warranty of
-+  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
-+  Lesser General Public License for more details.
-+
-+  You should have received a copy of the GNU Lesser General Public License
-+  along with systemd; If not, see <http://www.gnu.org/licenses/>.
-+-->
-+<refentry id="systemd-update-utmp.service">
-+
-+        <refentryinfo>
-+                <title>systemd-update-utmp.service</title>
-+                <productname>systemd</productname>
-+
-+                <authorgroup>
-+                        <author>
-+                                <contrib>Developer</contrib>
-+                                <firstname>Lennart</firstname>
-+                                <surname>Poettering</surname>
-+                                <email>lennart@poettering.net</email>
-+                        </author>
-+                </authorgroup>
-+        </refentryinfo>
-+
-+        <refmeta>
-+                <refentrytitle>systemd-update-utmp.service</refentrytitle>
-+                <manvolnum>8</manvolnum>
-+        </refmeta>
-+
-+        <refnamediv>
-+                <refname>systemd-update-utmp.service</refname>
-+                <refname>systemd-update-utmp-runlevel.service</refname>
-+                <refname>systemd-update-utmp</refname>
-+                <refpurpose>Write audit and utmp updates at bootup, runlevel
-+                changes and shutdown</refpurpose>
-+        </refnamediv>
-+
-+        <refsynopsisdiv>
-+                <para><filename>systemd-update-utmp.service</filename></para>
-+                <para><filename>systemd-update-utmp-runlevel.service</filename></para>
-+                <para><filename>/usr/lib/systemd/systemd-update-utmp</filename></para>
-+        </refsynopsisdiv>
-+
-+        <refsect1>
-+                <title>Description</title>
-+
-+                <para><filename>systemd-update-utmp-runlevel.service</filename>
-+                is a service that writes SysV runlevel changes to utmp
-+                and wtmp, as well as the audit logs, as they
-+                occur. <filename>systemd-update-utmp.service</filename>
-+                does the same for system reboots and shut-down requests.</para>
-+        </refsect1>
-+
-+        <refsect1>
-+                <title>See Also</title>
-+                <para>
-+                        <citerefentry><refentrytitle>systemd</refentrytitle><manvolnum>1</manvolnum></citerefentry>,
-+                        <citerefentry><refentrytitle>utmp</refentrytitle><manvolnum>5</manvolnum></citerefentry>,
-+                        <citerefentry><refentrytitle>auditd</refentrytitle><manvolnum>8</manvolnum></citerefentry>
-+                </para>
-+        </refsect1>
-+
-+</refentry>
-diff --git a/src/update-utmp/update-utmp.c b/src/update-utmp/update-utmp.c
-index 9184025..202aa98 100644
---- a/src/update-utmp/update-utmp.c
-+++ b/src/update-utmp/update-utmp.c
-@@ -104,7 +104,7 @@ static int get_current_runlevel(Context *c) {
-                 { '3', SPECIAL_RUNLEVEL3_TARGET },
-                 { '4', SPECIAL_RUNLEVEL4_TARGET },
-                 { '2', SPECIAL_RUNLEVEL2_TARGET },
--                { 'S', SPECIAL_RESCUE_TARGET },
-+                { '1', SPECIAL_RESCUE_TARGET },
-         };
-         const char
-                 *interface = "org.freedesktop.systemd1.Unit",
-diff --git a/units/systemd-update-utmp-runlevel.service.in b/units/systemd-update-utmp-runlevel.service.in
-index 27fae2c..99783e2 100644
---- a/units/systemd-update-utmp-runlevel.service.in
-+++ b/units/systemd-update-utmp-runlevel.service.in
-@@ -7,12 +7,14 @@
- 
- [Unit]
- Description=Update UTMP about System Runlevel Changes
--Documentation=man:systemd-update-utmp-runlevel.service(8) man:utmp(5)
-+Documentation=man:systemd-update-utmp.service(8) man:utmp(5)
- DefaultDependencies=no
- RequiresMountsFor=/var/log/wtmp
--After=systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
-+Conflicts=shutdown.target
-+Requisite=systemd-update-utmp.service
-+After=systemd-update-utmp.service
- After=runlevel1.target runlevel2.target runlevel3.target runlevel4.target runlevel5.target
--Before=final.target
-+Before=shutdown.target
- 
- [Service]
- Type=oneshot
-diff --git a/units/systemd-update-utmp-shutdown.service.in b/units/systemd-update-utmp-shutdown.service.in
-deleted file mode 100644
-index aa93562..0000000
---- a/units/systemd-update-utmp-shutdown.service.in
-+++ /dev/null
-@@ -1,19 +0,0 @@
--#  This file is part of systemd.
--#
--#  systemd is free software; you can redistribute it and/or modify it
--#  under the terms of the GNU Lesser General Public License as published by
--#  the Free Software Foundation; either version 2.1 of the License, or
--#  (at your option) any later version.
--
--[Unit]
--Description=Update UTMP about System Shutdown
--Documentation=man:systemd-update-utmp-runlevel.service(8) man:utmp(5)
--DefaultDependencies=no
--RequiresMountsFor=/var/log/wtmp
--After=systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
--After=systemd-update-utmp-runlevel.service
--Before=final.target
--
--[Service]
--Type=oneshot
--ExecStart=@rootlibexecdir@/systemd-update-utmp shutdown
-diff --git a/units/systemd-update-utmp.service.in b/units/systemd-update-utmp.service.in
-new file mode 100644
-index 0000000..e7c20a5
---- /dev/null
-+++ b/units/systemd-update-utmp.service.in
-@@ -0,0 +1,21 @@
-+#  This file is part of systemd.
-+#
-+#  systemd is free software; you can redistribute it and/or modify it
-+#  under the terms of the GNU Lesser General Public License as published by
-+#  the Free Software Foundation; either version 2.1 of the License, or
-+#  (at your option) any later version.
-+
-+[Unit]
-+Description=Update UTMP about System Reboot/Shutdown
-+Documentation=man:systemd-update-utmp.service(8) man:utmp(5)
-+DefaultDependencies=no
-+RequiresMountsFor=/var/log/wtmp
-+Conflicts=shutdown.target
-+After=systemd-readahead-collect.service systemd-readahead-replay.service systemd-remount-fs.service systemd-tmpfiles-setup.service auditd.service
-+Before=sysinit.target shutdown.target
-+
-+[Service]
-+Type=oneshot
-+RemainAfterExit=yes
-+ExecStart=@rootlibexecdir@/systemd-update-utmp reboot
-+ExecStop=@rootlibexecdir@/systemd-update-utmp shutdown
--- 
-1.8.2.3
-
diff --git a/meta/recipes-core/systemd/systemd/install-quotaon-once.patch b/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
deleted file mode 100644
index 6b7cf2f..0000000
--- a/meta/recipes-core/systemd/systemd/install-quotaon-once.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 622004565eca385c685086cd478aa79afe73b785 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 11 Jun 2013 17:16:37 +0100
-Subject: [PATCH] build-sys: don't install quotaon.service twice
-
-quotaon.service is already installed through dist_systemunit_DATA, so it doesn't
-need to be added to nodist_systemunit_DATA.  Installing the same file twice
-results in a race condition where the install process can fail.
-
-https://bugs.freedesktop.org/show_bug.cgi?id=65659
-
-[zj: actually remove quotaon.service from the other list.]
----
- Makefile.am |    1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 3a196a6..d444eac 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -401,7 +401,6 @@ dist_systemunit_DATA = \
- 	units/bluetooth.target \
- 	units/smartcard.target \
- 	units/systemd-tmpfiles-clean.timer \
--	units/quotaon.service \
- 	units/systemd-ask-password-wall.path \
- 	units/systemd-ask-password-console.path \
- 	units/systemd-udevd-control.socket \
--- 
-1.7.10.4
-
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
index 72d1411..ceb8483 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-getty-unit.patch
@@ -7,29 +7,29 @@ Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
  units/serial-getty@.service.m4 |    2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
-Index: systemd-196/units/getty@.service.m4
+Index: systemd-206/units/getty@.service.m4
 ===================================================================
---- systemd-196.orig/units/getty@.service.m4	2012-11-20 12:39:16.000000000 -0800
-+++ systemd-196/units/getty@.service.m4	2013-01-21 16:08:03.707533381 -0800
-@@ -45,7 +45,7 @@
+--- systemd-206.orig/units/getty@.service.m4	2013-07-21 15:43:28.000000000 -0700
++++ systemd-206/units/getty@.service.m4	2013-08-21 08:45:48.569886828 -0700
+@@ -27,7 +27,7 @@
  
  [Service]
  # the VT is cleared by TTYVTDisallocate
--ExecStart=-/sbin/agetty --noclear %I 38400 linux
-+ExecStart=-/sbin/getty -L %I 115200 linux
+-ExecStart=-/sbin/agetty --noclear %I
++ExecStart=-/sbin/getty -L %I
  Type=idle
  Restart=always
  RestartSec=0
-Index: systemd-196/units/serial-getty@.service.m4
+Index: systemd-206/units/serial-getty@.service.m4
 ===================================================================
---- systemd-196.orig/units/serial-getty@.service.m4	2012-11-20 12:39:16.000000000 -0800
-+++ systemd-196/units/serial-getty@.service.m4	2013-01-21 16:09:01.763535039 -0800
-@@ -40,7 +40,7 @@
+--- systemd-206.orig/units/serial-getty@.service.m4	2013-07-21 15:43:28.000000000 -0700
++++ systemd-206/units/serial-getty@.service.m4	2013-08-21 08:48:52.337890275 -0700
+@@ -22,7 +22,7 @@
  IgnoreOnIsolate=yes
  
  [Service]
--ExecStart=-/sbin/agetty -s %I 115200,38400,9600 vt102
-+ExecStart=-/sbin/getty -L %I 115200 vt102
+-ExecStart=-/sbin/agetty --keep-baud %I 115200,38400,9600
++ExecStart=-/sbin/getty -L %I 115200
  Type=idle
  Restart=always
  RestartSec=0
diff --git a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
index 0ea2da3..99ea573 100644
--- a/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
+++ b/meta/recipes-core/systemd/systemd/systemd-pam-fix-mkostemp.patch
@@ -1,10 +1,10 @@
 Upstream-Status: Denied [no desire for uclibc support]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: systemd-204/src/journal/journal-send.c
+Index: systemd-206/src/journal/journal-send.c
 ===================================================================
---- systemd-204.orig/src/journal/journal-send.c	2013-05-06 12:06:04.000000000 -0700
-+++ systemd-204/src/journal/journal-send.c	2013-05-23 11:21:14.500338688 -0700
+--- systemd-206.orig/src/journal/journal-send.c	2013-07-21 15:43:28.000000000 -0700
++++ systemd-206/src/journal/journal-send.c	2013-08-21 08:50:50.825892498 -0700
 @@ -46,6 +46,8 @@
                  memcpy(*_f + 10, _func, _fl);     \
          } while(false)
@@ -14,7 +14,7 @@ Index: systemd-204/src/journal/journal-send.c
  /* We open a single fd, and we'll share it with the current process,
   * all its threads, and all its subprocesses. This means we need to
   * initialize it atomically, and need to operate on it atomically
-@@ -312,8 +314,13 @@
+@@ -311,8 +313,13 @@
          /* Message doesn't fit... Let's dump the data in a temporary
           * file and just pass a file descriptor of it to the other
           * side */
@@ -29,20 +29,19 @@ Index: systemd-204/src/journal/journal-send.c
          if (buffer_fd < 0)
                  return -errno;
  
-Index: systemd-204/src/core/manager.c
+Index: systemd-206/src/core/manager.c
 ===================================================================
---- systemd-204.orig/src/core/manager.c	2013-04-25 17:53:56.000000000 -0700
-+++ systemd-204/src/core/manager.c	2013-05-23 11:23:15.864340878 -0700
-@@ -72,6 +72,8 @@
+--- systemd-206.orig/src/core/manager.c	2013-07-21 15:43:28.000000000 -0700
++++ systemd-206/src/core/manager.c	2013-08-21 08:51:35.209893331 -0700
+@@ -71,6 +71,7 @@
  #include "audit-fd.h"
+ #include "efivars.h"
  #include "env-util.h"
- 
 +#include "config.h"
-+
- /* As soon as 16 units are in our GC queue, make sure to run a gc sweep */
- #define GC_QUEUE_ENTRIES_MAX 16
  
-@@ -1973,7 +1975,12 @@
+ /* As soon as 5s passed since a unit was added to our GC queue, make sure to run a gc sweep */
+ #define GC_QUEUE_USEC_MAX (10*USEC_PER_SEC)
+@@ -2058,7 +2059,12 @@
                  return -ENOMEM;
  
          RUN_WITH_UMASK(0077) {
@@ -55,10 +54,10 @@ Index: systemd-204/src/core/manager.c
          }
  
          if (fd < 0) {
-Index: systemd-204/src/shared/util.c
+Index: systemd-206/src/shared/util.c
 ===================================================================
---- systemd-204.orig/src/shared/util.c	2013-05-07 12:07:22.000000000 -0700
-+++ systemd-204/src/shared/util.c	2013-05-23 11:19:35.028336822 -0700
+--- systemd-206.orig/src/shared/util.c	2013-07-21 15:43:28.000000000 -0700
++++ systemd-206/src/shared/util.c	2013-08-21 08:50:50.829892498 -0700
 @@ -74,6 +74,8 @@
  #include "env-util.h"
  #include "fileio.h"
@@ -68,7 +67,7 @@ Index: systemd-204/src/shared/util.c
  int saved_argc = 0;
  char **saved_argv = NULL;
  
-@@ -3921,7 +3923,12 @@
+@@ -3980,7 +3982,12 @@
          t[k] = '.';
          stpcpy(stpcpy(t+k+1, fn), "XXXXXX");
  
@@ -81,10 +80,10 @@ Index: systemd-204/src/shared/util.c
          if (fd < 0) {
                  free(t);
                  return -errno;
-Index: systemd-204/src/shared/ask-password-api.c
+Index: systemd-206/src/shared/ask-password-api.c
 ===================================================================
---- systemd-204.orig/src/shared/ask-password-api.c	2013-04-08 08:26:34.000000000 -0700
-+++ systemd-204/src/shared/ask-password-api.c	2013-05-23 11:24:43.456342451 -0700
+--- systemd-206.orig/src/shared/ask-password-api.c	2013-07-21 15:43:28.000000000 -0700
++++ systemd-206/src/shared/ask-password-api.c	2013-08-21 08:50:50.829892498 -0700
 @@ -37,6 +37,8 @@
  
  #include "ask-password-api.h"
@@ -107,11 +106,11 @@ Index: systemd-204/src/shared/ask-password-api.c
          }
  
          if (fd < 0) {
-Index: systemd-204/src/journal/journalctl.c
+Index: systemd-206/src/journal/journalctl.c
 ===================================================================
---- systemd-204.orig/src/journal/journalctl.c	2013-05-07 12:07:22.000000000 -0700
-+++ systemd-204/src/journal/journalctl.c	2013-05-23 11:19:35.028336822 -0700
-@@ -755,7 +755,13 @@
+--- systemd-206.orig/src/journal/journalctl.c	2013-07-21 15:43:28.000000000 -0700
++++ systemd-206/src/journal/journalctl.c	2013-08-21 08:50:50.833892498 -0700
+@@ -1005,7 +1005,13 @@
          n /= arg_interval;
  
          close_nointr_nofail(fd);
@@ -125,11 +124,11 @@ Index: systemd-204/src/journal/journalctl.c
          if (fd < 0) {
                  log_error("Failed to open %s: %m", k);
                  r = -errno;
-Index: systemd-204/src/journal/journal-verify.c
+Index: systemd-206/src/journal/journal-verify.c
 ===================================================================
---- systemd-204.orig/src/journal/journal-verify.c	2012-11-20 13:42:23.000000000 -0800
-+++ systemd-204/src/journal/journal-verify.c	2013-05-23 11:19:35.032336822 -0700
-@@ -700,8 +700,12 @@
+--- systemd-206.orig/src/journal/journal-verify.c	2013-07-21 15:43:28.000000000 -0700
++++ systemd-206/src/journal/journal-verify.c	2013-08-21 08:50:50.833892498 -0700
+@@ -811,8 +811,12 @@
  #endif
          } else if (f->seal)
                  return -ENOKEY;
@@ -143,7 +142,7 @@ Index: systemd-204/src/journal/journal-verify.c
          if (data_fd < 0) {
                  log_error("Failed to create data file: %m");
                  r = -errno;
-@@ -709,7 +713,12 @@
+@@ -820,7 +824,12 @@
          }
          unlink(data_path);
  
@@ -156,7 +155,7 @@ Index: systemd-204/src/journal/journal-verify.c
          if (entry_fd < 0) {
                  log_error("Failed to create entry file: %m");
                  r = -errno;
-@@ -717,7 +726,12 @@
+@@ -828,7 +837,12 @@
          }
          unlink(entry_path);
  
diff --git a/meta/recipes-core/systemd/systemd_204.bb b/meta/recipes-core/systemd/systemd_206.bb
similarity index 95%
rename from meta/recipes-core/systemd/systemd_204.bb
rename to meta/recipes-core/systemd/systemd_206.bb
index 6261367..f05aa1b 100644
--- a/meta/recipes-core/systemd/systemd_204.bb
+++ b/meta/recipes-core/systemd/systemd_206.bb
@@ -18,15 +18,14 @@ SECTION = "base/shell"
 inherit gtk-doc useradd pkgconfig autotools perlnative update-rc.d update-alternatives qemu
 
 SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
+           file://0001-use-CAP_MKNOD-ConditionCapability.patch \
            file://touchscreen.rules \
            ${UCLIBCPATCHES} \
-           file://0001-utmp-turn-systemd-update-utmp-shutdown.service-into-.patch \
-           file://install-quotaon-once.patch \
            file://00-create-volatile.conf \
            file://init \
           "
-SRC_URI[md5sum] = "a07619bb19f48164fbf0761d12fd39a8"
-SRC_URI[sha256sum] = "072c393503c7c1e55ca7acf3db659cbd28c7fe5fa94fab3db95360bafd96731b"
+SRC_URI[md5sum] = "89e36f2d3ba963020b72738549954cbc"
+SRC_URI[sha256sum] = "4c993de071118ea1df7ffc4be26ef0b0d78354ef15b2743a2783d20edfcde9de"
 
 UCLIBCPATCHES = ""
 UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
@@ -36,6 +35,7 @@ UCLIBCPATCHES_libc-uclibc = "file://systemd-pam-configure-check-uclibc.patch \
                              file://systemd-pam-fix-mkostemp.patch \
                              file://systemd-pam-fix-msformat.patch \
                              file://optional_secure_getenv.patch \
+                             file://0001-uClibc-doesn-t-implement-pwritev-preadv.patch \
                             "
 LDFLAGS_libc-uclibc_append = " -lrt"
 
@@ -80,9 +80,7 @@ EXTRA_OECONF_append_libc-uclibc = " --disable-myhostname "
 
 do_configure_prepend() {
 	export CPP="${HOST_PREFIX}cpp ${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}"
-
-	export GPERF="${HOST_PREFIX}gperf"
-
+	export KMOD="${base_bindir}/kmod"
 	sed -i -e 's:=/root:=${ROOT_HOME}:g' ${S}/units/*.service*
 }
 
@@ -120,7 +118,7 @@ python populate_packages_prepend (){
 }
 PACKAGES_DYNAMIC += "^lib(udev|gudev|systemd).*"
 
-PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install"
+PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze ${PN}-kernel-install ${PN}-rpm-macros"
 
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
@@ -140,6 +138,9 @@ FILES_${PN}-kernel-install = "${bindir}/kernel-install \
                               ${sysconfdir}/kernel/ \
                               ${exec_prefix}/lib/kernel \
                              "
+FILES_${PN}-rpm-macros = "${libdir}/rpm \
+                         "
+
 RRECOMMENDS_${PN}-vconsole-setup = "kbd kbd-consolefonts"
 
 CONFFILES_${PN} = "${sysconfdir}/systemd/journald.conf \
@@ -189,7 +190,7 @@ FILES_${PN} = " ${base_bindir}/* \
 FILES_${PN}-dbg += "${rootlibdir}/.debug ${systemd_unitdir}/.debug ${systemd_unitdir}/*/.debug ${base_libdir}/security/.debug/"
 FILES_${PN}-dev += "${base_libdir}/security/*.la ${datadir}/dbus-1/interfaces/ ${sysconfdir}/rpm/macros.systemd"
 
-RDEPENDS_${PN} += "dbus util-linux-mount"
+RDEPENDS_${PN} += "kmod dbus util-linux-mount"
 
 RRECOMMENDS_${PN} += "systemd-serialgetty systemd-compat-units \
                       util-linux-agetty \
-- 
1.8.3.4


