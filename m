Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 06B5460235
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 08:54:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8U8s28F017784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 01:54:02 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 30 Sep 2016 01:54:01 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2016 16:49:55 +0800
Message-ID: <3fa953276902a363aa6b066a06d1f6a0a6a684d6.1475225357.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475225357.git.kai.kang@windriver.com>
References: <cover.1475225357.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] kbd: create ptest sub-package
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
X-List-Received-Date: Fri, 30 Sep 2016 08:54:02 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Create kbd-ptest sub-package:

* add file run-ptest and runtime dependency make
* modify installed Makefile to disable remake Makefile and the test
  cases when run the ptest
* add patch to set proper path for test cases to get resource files

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/kbd/kbd/run-ptest                |  4 ++
 .../kbd/kbd/set-proper-path-of-resources.patch     | 56 ++++++++++++++++++++++
 meta/recipes-core/kbd/kbd_2.0.3.bb                 | 19 ++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-core/kbd/kbd/run-ptest
 create mode 100644 meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch

diff --git a/meta/recipes-core/kbd/kbd/run-ptest b/meta/recipes-core/kbd/kbd/run-ptest
new file mode 100644
index 0000000..7a2d205
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+CURDIR=$(dirname `readlink -f $0`)
+make -k -C ${CURDIR}/tests check-TESTS
diff --git a/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
new file mode 100644
index 0000000..27d6f42
--- /dev/null
+++ b/meta/recipes-core/kbd/kbd/set-proper-path-of-resources.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+kbd is out of source built, then the value of $(srcdir) is relative path of
+${S}/tests to ${B}/tests. Macro DATADIR is defined with $(srcdir) and replaced
+in .c files by compiler, and string @DATADIR@ is replaced with $(srdir) by rule
+"%: %.in" in Makefile.
+
+But kbd-ptest puts test cases and resource files in same directory, then some
+ptest cases fail to find resources.
+
+Replace DATADIR and @DATADIR@ with current directory(dot) to make test cases
+run as expected.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 1976333..b36aef3 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -1,7 +1,7 @@
+ AM_CPPFLAGS = \
+ 	-I$(srcdir)/../src/libkeymap \
+ 	-I$(builddir)/../src/libkeymap \
+-	-DDATADIR=\"$(srcdir)\" -DBUILDDIR=\"$(builddir)\"
++	-DDATADIR=\".\" -DBUILDDIR=\"$(builddir)\"
+ 
+ AM_CFLAGS = $(CHECK_CFLAGS)
+ LDADD  = $(top_builddir)/src/libkeymap/libkeymap.la $(CHECK_LIBS)
+diff --git a/tests/alt-is-meta.in b/tests/alt-is-meta.in
+index ddd5ed8..772fb51 100755
+--- a/tests/alt-is-meta.in
++++ b/tests/alt-is-meta.in
+@@ -7,8 +7,8 @@ cd "$cwd"
+ rc=0
+ temp="$(mktemp "@BUILDDIR@/temp.XXXXXXXXX")"
+ 
+-./libkeymap-showmaps "@DATADIR@"/alt-is-meta.map > "$temp" || rc=$?
+-cmp -s "@DATADIR@//alt-is-meta.output" "$temp" || rc=$?
++./libkeymap-showmaps ./alt-is-meta.map > "$temp" || rc=$?
++cmp -s "./alt-is-meta.output" "$temp" || rc=$?
+ 
+ if [ "$rc" != 0 ]; then
+ 	printf 'failed\n'
+diff --git a/tests/dumpkeys-fulltable.in b/tests/dumpkeys-fulltable.in
+index 7c856e5..14d92c1 100755
+--- a/tests/dumpkeys-fulltable.in
++++ b/tests/dumpkeys-fulltable.in
+@@ -5,7 +5,7 @@ cwd="$(readlink -ev "${0%/*}")"
+ cd "$cwd"
+ 
+ BUILDDIR="@BUILDDIR@"
+-DATADIR="@DATADIR@"
++DATADIR="."
+ 
+ check_keymap() {
+ 	local kmap temp rc
diff --git a/meta/recipes-core/kbd/kbd_2.0.3.bb b/meta/recipes-core/kbd/kbd_2.0.3.bb
index ea1e0b4..54d1683 100644
--- a/meta/recipes-core/kbd/kbd_2.0.3.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.3.bb
@@ -11,6 +11,8 @@ RPROVIDES_${PN} = "console-tools"
 RCONFLICTS_${PN} = "console-tools"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
+           file://run-ptest \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'file://set-proper-path-of-resources.patch', '', d)} \
           "
 
 SRC_URI[md5sum] = "231b46e7142eb41ea3ae06d2ded3c208"
@@ -19,6 +21,21 @@ SRC_URI[sha256sum] = "7a899de1c0eb75f3aea737095a736f2375e1cbfbe693fc14a3fe0bfb46
 PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
 
+do_compile_ptest() {
+    oe_runmake -C ${B}/tests dumpkeys-fulltable alt-is-meta
+}
+
+do_install_ptest() {
+    install -D ${B}/tests/Makefile ${D}${PTEST_PATH}/tests/Makefile
+    sed -i -e '/Makefile:/,/^$/d' -e '/%: %.in/,/^$/d' \
+	-e '/libkeymap_.*_SOURCES =/d' -e '/$(EXEEXT):/,/^$/d' ${D}${PTEST_PATH}/tests/Makefile
+
+    find ${B}/tests -executable -exec install {} ${D}${PTEST_PATH}/tests \;
+    find ${S}/tests \( -name \*.map -o -name \*.bin -o -name \*.output \) -exec install {} ${D}${PTEST_PATH}/tests \;
+
+    install -D -m 755 ${S}/config/test-driver ${D}${PTEST_PATH}/config/test-driver
+}
+
 PACKAGES += "${PN}-consolefonts ${PN}-keymaps ${PN}-unimaps ${PN}-consoletrans"
 
 FILES_${PN}-consolefonts = "${datadir}/consolefonts"
@@ -26,6 +43,8 @@ FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-keymaps = "${datadir}/keymaps"
 FILES_${PN}-unimaps = "${datadir}/unimaps"
 
+RDEPENDS_${PN}-ptest = "make"
+
 inherit update-alternatives
 
 ALTERNATIVE_${PN} = "chvt deallocvt fgconsole openvt"
-- 
2.9.3


