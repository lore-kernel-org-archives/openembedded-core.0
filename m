Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B8F197E553
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 05:52:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46HdLC3PzKz63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:52:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566885123;
	bh=opOoyFrtmhu1i/e7YkJ1rxdGs97R31sUlZjyA7vxp5I=;
	h=From:To:Subject:Date:From;
	b=s5FQLAFd3h0+v2J4mATSTj7s7ahWAyU3pD8gmbxWg0goQ5S1Db68gqkjM73IzPSxH
	I01QHi9zHr8pfk24BM6uKoQd6e65noaxZ9qUYJ3hwJ9XHhSBlMYl858/Du19NaJ/7V
	0i1f0MUl7NXY7FN1stIJIbIu+FZJfP7SKnilxWVfgYNABbTDrU8T1WiVHBxwf5xiyG
	ahFyBADiyBpcndVpzYJ7gMwR4f9w2pxj8Vz5BManFPfKVFWfWqQy1jc7SlJ4Eu9F6b
	wViyjLWQElswB4nDG4+v9C3+NG11kvVQyuNpSPvYkLFjvJQ7116TFQI2LS19YQvzuX
	LOK+x8MGrI5bzRm8z2pEHgE2DG+dPSkdBPXzzcVYaAXq7ur3AJSUigEfN0lDakHYWZ
	1UNBIpDLQAQMLr2PQrQmOpnlufbM1f3OKkjf153NsaOYrrC2WzTj/FQhb+3n7ooVqb
	wkYFR4IP4C6BWj09WHzcn36FnKTmVvXc2B/70zmqDUEEaWlVbWQnkYBuAWpXw0PXBE
	eDgbwMFqJN1YN0A7XMFXRWmx9mDYWRqoxsTEUk4UJEErC2YfWSkE0u8WvjGLydmJzA
	oMAaPaPy8xombErGRyGLyvAI2T3c8tTVXyOkiejYlPVOWsQQHq83yBmcPOVckKhnVA
	0WtC10KOV0tPxVTp2LEXDQNo=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 08:52:00 +0300
Message-Id: <20190827055200.3690-5-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] world-broken.inc: Remove
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
X-List-Received-Date: Tue, 27 Aug 2019 05:52:03 -0000

Move still required entries as COMPATIBLE_HOST_libc-musl = 'null'
to individual recipes.

This also gives users a proper error message when trying to build
a known non-building package.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/conf/distro/defaultsetup.conf           |  1 -
 meta/conf/distro/include/world-broken.inc    | 27 --------------------
 meta/recipes-devtools/prelink/prelink_git.bb |  3 +++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |  2 ++
 meta/recipes-devtools/qemu/qemu_4.1.0.bb     |  4 +++
 meta/recipes-rt/rt-tests/rt-tests_1.1.bb     |  4 +++
 6 files changed, 13 insertions(+), 28 deletions(-)
 delete mode 100644 meta/conf/distro/include/world-broken.inc

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 9b1ee20aaa..66fd246526 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -1,7 +1,6 @@
 include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
-include conf/distro/include/world-broken.inc
 include conf/distro/include/maintainers.inc
 
 TCMODE ?= "default"
diff --git a/meta/conf/distro/include/world-broken.inc b/meta/conf/distro/include/world-broken.inc
deleted file mode 100644
index 42cacfdf2e..0000000000
--- a/meta/conf/distro/include/world-broken.inc
+++ /dev/null
@@ -1,27 +0,0 @@
-#
-# Exclude known broken packages
-#
-
-# rt-tests needs PI mutex support in libc
-EXCLUDE_FROM_WORLD_pn-rt-tests_libc-musl = "1"
-
-# error: use of undeclared identifier '_STAT_VER'
-EXCLUDE_FROM_WORLD_pn-pseudo_libc-musl = "1"
-
-# error: error.h: No such file or directory
-EXCLUDE_FROM_WORLD_pn-prelink_libc-musl = "1"
-
-# error: obstack.h: No such file or directory
-EXCLUDE_FROM_WORLD_pn-systemtap_libc-musl = "1"
-EXCLUDE_FROM_WORLD_pn-systemtap-uprobes_libc-musl = "1"
-
-# error: a parameter list without types is only allowed in a function definition
-#            void (*_function)(sigval_t);
-EXCLUDE_FROM_WORLD_pn-qemu_libc-musl = "1"
-
-# error: format '%s' expects argument of type 'char *', but argument 4 has type 'int' [-Werror=format=]
-#   snprintf(buf, size, "%s", strerror_r(err, sbuf, sizeof(sbuf)));
-EXCLUDE_FROM_WORLD_pn-perf_libc-musl = "1"
-
-# error: 'RTLD_NEXT' was not declared in this scope
-EXCLUDE_FROM_WORLD_pn-gcc-sanitizers_libc-musl = "1"
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index b1261d5942..f0946de2cc 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -36,6 +36,9 @@ SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;branch=cross_prelink_sta
 "
 UPSTREAM_CHECK_COMMITS = "1"
 
+# error: error.h: No such file or directory
+COMPATIBLE_HOST_libc-musl = 'null'
+
 TARGET_OS_ORIG := "${TARGET_OS}"
 OVERRIDES_append = ":${TARGET_OS_ORIG}"
 
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 6cf711e4c2..9d2e349087 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,3 +12,5 @@ SRCREV = "060058bb29f70b244e685b3c704eb0641b736f73"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
+# error: use of undeclared identifier '_STAT_VER'
+COMPATIBLE_HOST_libc-musl = 'null'
diff --git a/meta/recipes-devtools/qemu/qemu_4.1.0.bb b/meta/recipes-devtools/qemu/qemu_4.1.0.bb
index 76776098d0..f0c1daabe1 100644
--- a/meta/recipes-devtools/qemu/qemu_4.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.1.0.bb
@@ -2,6 +2,10 @@ BBCLASSEXTEND = "nativesdk"
 
 require qemu.inc
 
+# error: a parameter list without types is only allowed in a function definition
+#            void (*_function)(sigval_t);
+COMPATIBLE_HOST_libc-musl = 'null'
+
 DEPENDS = "glib-2.0 zlib pixman bison-native"
 
 RDEPENDS_${PN}_class-target += "bash"
diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
index b673cd784f..5aa0aa10c3 100644
--- a/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
+++ b/meta/recipes-rt/rt-tests/rt-tests_1.1.bb
@@ -14,6 +14,10 @@ SRC_URI += " \
             file://run-ptest \
             file://rt_bmark.py \
            "
+
+# rt-tests needs PI mutex support in libc
+COMPATIBLE_HOST_libc-musl = 'null'
+
 # Do not install hwlatdetect
 EXTRA_OEMAKE += "PYLIB=''"
 
-- 
2.17.1


