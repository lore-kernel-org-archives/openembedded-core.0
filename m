Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBD8C71135
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 11:20:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.57257.1749467998628279129
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 04:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72A2C14BF
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:39 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F3EC83F59E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 04:19:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 09/16] squashfs-tools: update to 4.7
Date: Mon,  9 Jun 2025 12:19:41 +0100
Message-ID: <20250609111948.2282441-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609111948.2282441-1-ross.burton@arm.com>
References: <20250609111948.2282441-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 11:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218278

The REPRODUCIBLE_DEFAULT option was removed in 4.7[1].

Backport a patch to fix missing pthread typedefs, and a patch to fix
missing pid_t typedefs.

Also clean up the tasks to be neater and more concise.

[1] squash-tools ae9914d15293af7c596148aedd997b3058e35d9e

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../squashfs-tools/squashfs-tools/pid.patch   | 40 +++++++++++++++++++
 .../squashfs-tools/thread.patch               | 33 +++++++++++++++
 ...s-tools_4.6.1.bb =3D> squashfs-tools_4.7.bb} | 16 ++++----
 3 files changed, 81 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/p=
id.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/t=
hread.patch
 rename meta/recipes-devtools/squashfs-tools/{squashfs-tools_4.6.1.bb =3D=
> squashfs-tools_4.7.bb} (77%)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patc=
h b/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patch
new file mode 100644
index 00000000000..a15b6211248
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/pid.patch
@@ -0,0 +1,40 @@
+From 05a895b3f996d1ac157d95b04980f5f047e7dbf7 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 6 Jun 2025 15:23:07 +0100
+Subject: [PATCH] print_pager: add missing includes
+
+When building with musl:
+
+  print_pager.h:33:25: error: unknown type name 'pid_t'
+     33 | extern void wait_to_die(pid_t process);
+        |                         ^~~~~
+  print_pager.h:34:25: error: unknown type name 'pid_t'
+     34 | extern FILE *exec_pager(pid_t *process);
+        |                         ^~~~~
+
+print_pager.h uses pid_t and FILE, so add the required #includes to
+ensure that these are defined.
+
+Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/p=
ull/314]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ squashfs-tools/print_pager.h | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/squashfs-tools/print_pager.h b/squashfs-tools/print_pager.h
+index c33d4d2e..f3e0da6c 100644
+--- a/squashfs-tools/print_pager.h
++++ b/squashfs-tools/print_pager.h
+@@ -30,6 +30,9 @@
+ #define MORE_PAGER 2
+ #define UNKNOWN_PAGER 3
+=20
++#include <stdio.h>
++#include <sys/types.h>
++
+ extern void wait_to_die(pid_t process);
+ extern FILE *exec_pager(pid_t *process);
+ extern int get_column_width();
+--=20
+2.43.0
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.p=
atch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.patch
new file mode 100644
index 00000000000..01741639c03
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/thread.patch
@@ -0,0 +1,33 @@
+From b6e9f4b62cc3e762ceeddc0fc099f7d65f7b7361 Mon Sep 17 00:00:00 2001
+From: Shiji Yang <yangshiji66@outlook.com>
+Date: Wed, 4 Jun 2025 19:53:39 +0800
+Subject: [PATCH] thread: add the missing pthread.h header
+
+Fix build error on macos:
+
+In file included from mksquashfs_help.c:35:
+./thread.h:46:39: error: unknown type name 'pthread_mutex_t'; did you me=
an 'pthread_attr_t'?
+   46 | extern void wait_thread_idle(int tid, pthread_mutex_t *mutex);
+      |                                       ^~~~~~~~~~~~~~~
+      |                                       pthread_attr_t
+
+Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
+
+Upstream-Status: Backport [b6e9f4b62cc3e762ceeddc0fc099f7d65f7b7361]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ squashfs-tools/thread.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/squashfs-tools/thread.h b/squashfs-tools/thread.h
+index 5a22fc43..e56a58cf 100644
+--- a/squashfs-tools/thread.h
++++ b/squashfs-tools/thread.h
+@@ -22,6 +22,7 @@
+  *
+  * thread.h
+  */
++#include <pthread.h>
+=20
+ #define TRUE 1
+ #define FALSE 0
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb=
 b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
similarity index 77%
rename from meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
rename to meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
index 51a2fbdb934..3eb7ad46e94 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.6.1.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.7.bb
@@ -7,8 +7,10 @@ SECTION =3D "base"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
=20
-SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dv6.1.1"
-SRCREV =3D "d8cb82d9840330f9344ec37b992595b5d7b44184"
+SRC_URI =3D "git://github.com/plougher/squashfs-tools.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3D${PV} \
+           file://pid.patch \
+           file://thread.patch"
+SRCREV =3D "2e87d42ed089dc31990d83eeb07437b9d085d6d1"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>(\d+(\.\d+)+))"
=20
@@ -16,7 +18,7 @@ S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "${PACKAGECONFIG_CONFARGS}"
=20
-PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd reproducible"
+PACKAGECONFIG ??=3D "gzip xz lzo lz4 lzma xattr zstd"
 PACKAGECONFIG[gzip] =3D "GZIP_SUPPORT=3D1,GZIP_SUPPORT=3D0,zlib"
 PACKAGECONFIG[xz] =3D "XZ_SUPPORT=3D1,XZ_SUPPORT=3D0,xz"
 PACKAGECONFIG[lzo] =3D "LZO_SUPPORT=3D1,LZO_SUPPORT=3D0,lzo"
@@ -24,17 +26,15 @@ PACKAGECONFIG[lz4] =3D "LZ4_SUPPORT=3D1,LZ4_SUPPORT=3D=
0,lz4"
 PACKAGECONFIG[lzma] =3D "LZMA_XZ_SUPPORT=3D1,LZMA_XZ_SUPPORT=3D0,xz"
 PACKAGECONFIG[xattr] =3D "XATTR_SUPPORT=3D1,XATTR_SUPPORT=3D0,attr"
 PACKAGECONFIG[zstd] =3D "ZSTD_SUPPORT=3D1,ZSTD_SUPPORT=3D0,zstd"
-PACKAGECONFIG[reproducible] =3D "REPRODUCIBLE_DEFAULT=3D1,REPRODUCIBLE_D=
EFAULT=3D0,"
=20
 do_compile() {
-        cd ${S}/squashfs-tools
-	oe_runmake all
+	oe_runmake -C ${S}/squashfs-tools all
 }
=20
 do_install() {
-        cd ${S}/squashfs-tools
+	oe_runmake -C ${S}/squashfs-tools install INSTALL_PREFIX=3D${D}${prefix=
} INSTALL_MANPAGES_DIR=3D${D}${datadir}/man/man1
+
 	install -d "${D}${includedir}"
-	oe_runmake install INSTALL_PREFIX=3D${D}${prefix} INSTALL_MANPAGES_DIR=3D=
${D}${datadir}/man/man1
 	install -m 0644 "${S}"/squashfs-tools/squashfs_fs.h "${D}${includedir}"
 }
=20
--=20
2.43.0


