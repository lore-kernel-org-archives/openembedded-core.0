Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1D5565DAC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 19:20:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8CJKNWj006011
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Sep 2014 12:20:23 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 12 Sep 2014 12:20:22 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Sep 2014 12:20:22 -0700
Message-ID: <1410549622-30269-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] at-spi2-core: fix DBIND_CHECK_ALIGNOF m4 macro
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
X-List-Received-Date: Fri, 12 Sep 2014 19:20:31 -0000
Content-Type: text/plain

Modify the macro so it will work when cross-compiling.
Note that the values checked are normally in a site file
so the macro rarely has to discover them.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-support/atk/at-spi2-core_2.12.0.bb    |    5 ++-
 .../atk/files/core_acinclude_m4.patch              |   40 ++++++++++++++++++++
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/atk/files/core_acinclude_m4.patch

diff --git a/meta/recipes-support/atk/at-spi2-core_2.12.0.bb b/meta/recipes-support/atk/at-spi2-core_2.12.0.bb
index 31e133f..e67155c 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.12.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.12.0.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
+           file://core_acinclude_m4.patch \
+          "
+
 SRC_URI[md5sum] = "b12ad0e0924706f5e7f51216241068ef"
 SRC_URI[sha256sum] = "db550edd98e53b4252521459c2dcaf0f3b060a9bad52489b9dbadbaedad3fb89"
 
diff --git a/meta/recipes-support/atk/files/core_acinclude_m4.patch b/meta/recipes-support/atk/files/core_acinclude_m4.patch
new file mode 100644
index 0000000..29c538e
--- /dev/null
+++ b/meta/recipes-support/atk/files/core_acinclude_m4.patch
@@ -0,0 +1,40 @@
+at-spi2-core: fix alignof m4 macro
+
+DBIND_CHECK_ALIGNOF does not work when cross-compiling, so we modify
+it to use AC_CHECK_ALIGNOF.
+
+Upstream-Status:  Pending
+
+Signed-off-by: joe.slater@windriver.com
+
+
+--- a/acinclude.m4
++++ b/acinclude.m4
+@@ -2,7 +2,26 @@
+ # type alignment test #
+ #######################
+ 
+-AC_DEFUN([DBIND_CHECK_ALIGNOF],
++AC_DEFUN([DBIND_CHECK_ALIGNOF],[
++AC_CHECK_ALIGNOF($1,[
++#include <stdio.h>
++#include <stdlib.h>
++#define DBUS_API_SUBJECT_TO_CHANGE
++#include <dbus/dbus.h>
++typedef struct {char s1;} dbind_struct;
++typedef void *dbind_pointer;
++])
++
++dnl Note that we substitute for names like @DBIND_ALIGNOF_DBIND_STRUCT@, but
++dnl we #define names like ALIGNOF_DBIND_STRUCT in config.h!
++dnl
++AC_SUBST(translit(dbind_alignof_$1, [a-z *], [A-Z_P]),[$ac_cv_alignof_$1])
++
++])
++
++dnl The following does not work for cross-compilation.
++dnl
++AC_DEFUN([xDBIND_CHECK_ALIGNOF],
+ 	[changequote(<<, >>)dnl
+ 	dnl The name to #define.
+ 	define(<<AC_TYPE_NAME>>,
-- 
1.7.9.5


