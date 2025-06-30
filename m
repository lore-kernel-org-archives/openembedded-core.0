Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F389EC83029
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 18:06:31 +0000 (UTC)
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
 by mx.groups.io with SMTP id smtpd.web11.46471.1751304166113455503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jun 2025 10:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=Zn1R6xiR;
 spf=pass (domain: linux.dev, ip: 91.218.175.172, mailfrom: wen.yang@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751304154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tex6eNfpXREQAZIfM9HYDn+GIcir0sscUKDU37xBBZI=;
	b=Zn1R6xiR2w4t6+FlMfZarG5J5JsuZ3qCAAOIQEXRSO5nO3+a96qgC7z6DiQTXCKwOX6QZB
	BQbYG3rrYZqZM3OJ/3vg7PMU1Hg3K5eI1+TGFs7a+HmyvYrN46OHSDS4peFODQ12fXgbRo
	HpZIhDCrAwU1LtP/7CkPIh131PcnvhY=
From: Wen Yang <wen.yang@linux.dev>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Cc: Wen Yang <wen.yang@linux.dev>
Subject: [meta-oe][PATCH] pstack: add recipe
Date: Tue,  1 Jul 2025 01:22:24 +0800
Message-Id: <20250630172224.18568-1-wen.yang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jun 2025 18:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219535

This recipe provides pstack for C/C++, Go, Rust, and Python.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 ...e-issue-of-cross-compilation-failure.patch | 28 +++++++++++++
 meta-oe/recipes-devtools/pstack/pstack.inc    | 39 +++++++++++++++++++
 .../recipes-devtools/pstack/pstack_2.10.bb    | 33 ++++++++++++++++
 meta-oe/recipes-devtools/pstack/pstack_git.bb |  8 ++++
 4 files changed, 108 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pstack/files/0001-tests-fix-=
the-issue-of-cross-compilation-failure.patch
 create mode 100644 meta-oe/recipes-devtools/pstack/pstack.inc
 create mode 100644 meta-oe/recipes-devtools/pstack/pstack_2.10.bb
 create mode 100644 meta-oe/recipes-devtools/pstack/pstack_git.bb

diff --git a/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-iss=
ue-of-cross-compilation-failure.patch b/meta-oe/recipes-devtools/pstack/f=
iles/0001-tests-fix-the-issue-of-cross-compilation-failure.patch
new file mode 100644
index 0000000000..2b54750e7a
--- /dev/null
+++ b/meta-oe/recipes-devtools/pstack/files/0001-tests-fix-the-issue-of-c=
ross-compilation-failure.patch
@@ -0,0 +1,28 @@
+From a8c3996d3f8d9b8f3a2888b7062c1139263c5aba Mon Sep 17 00:00:00 2001
+From: Wen Yang <yellowriver2010@hotmail.com>
+Date: Mon, 23 Jun 2025 02:06:53 +0800
+Subject: [PATCH] tests: fix the issue of cross compilation failure
+
+By replacing objcopy with MAKE_OBJCOPY, pstack could support both
+native and cross compilation.
+
+Upstream-Status: Backport [https://github.com/peadar/pstack/pull/38]
+---
+ tests/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 71a62a7..bf11a04 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -38,7 +38,7 @@ SET_TARGET_PROPERTIES(noreturn PROPERTIES COMPILE_FLAG=
S "-O2 -g")
+
+ add_custom_command(
+    OUTPUT basic-no-unwind-gen
+-   COMMAND objcopy --strip-debug --remove-section .eh_frame basic basic=
-no-unwind
++   COMMAND ${CMAKE_OBJCOPY} --strip-debug --remove-section .eh_frame ba=
sic basic-no-unwind
+    VERBATIM )
+
+ add_custom_target(basic-no-unwind ALL DEPENDS basic basic-no-unwind-gen=
)
+--
+2.25.1
diff --git a/meta-oe/recipes-devtools/pstack/pstack.inc b/meta-oe/recipes=
-devtools/pstack/pstack.inc
new file mode 100644
index 0000000000..9831a74d1a
--- /dev/null
+++ b/meta-oe/recipes-devtools/pstack/pstack.inc
@@ -0,0 +1,39 @@
+SUMMARY =3D "A utility to print stack traces of running processes"
+DESCRIPTION =3D "A from-scratch implementation of pstack using DWARF deb=
ugging and unwind information. \
+Works for C/C++, Go, Rust, and Python. A traditional pstack command can =
generally print a backtrace \
+of each thread in a running program, and sometimes from a core file. Thi=
s version of pstack uses its \
+own self contained ELF and DWARF parsing library, libdwelf to parse the =
DWARF debug and unwind \
+information, to get a stack trace."
+HOMEPAGE =3D "https://github.com/peadar/pstack"
+SECTION =3D "devel"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D671019a96ba80415b696240ed2ca5=
e80"
+
+inherit cmake
+
+S =3D "${UNPACKDIR}/${BPN}-${PV}"
+DEPENDS +=3D "zlib xz libunwind elfutils"
+
+RDEPENDS:${PN} +=3D "elfutils"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/pstack ${D}${bindir}/pstack
+
+    install -d ${D}${libdir}
+    install -m 0755 ${B}/libprocman.so.${PV} ${D}${libdir}/libprocman.so=
.${PV}
+    ln -sf libprocman.so.${PV} ${D}${libdir}/libprocman.so
+    install -m 0755 ${B}/libdwelf.so.${PV}  ${D}${libdir}/libdwelf.so.${=
PV}
+    ln -sf libdwelf.so.${PV}  ${D}${libdir}/libdwelf.so
+}
+
+PACKAGES =3D "${PN}"
+FILES:${PN} =3D "${bindir}/pstack"
+FILES:${PN} +=3D "${libdir}/libprocman.so.${PV}"
+FILES:${PN} +=3D "${libdir}/libdwelf.so.${PV}"
+
+PACKAGES +=3D "${PN}-dbg"
+FILES:${PN}-dbg +=3D "${base_bindir}/.debug ${base_sbindir}/.debug ${bin=
dir}/.debug ${sbindir}/.debug"
+
+PACKAGES +=3D "${PN}-dev"
+FILES:${PN}-dev +=3D "${base_libdir}/*.so"
diff --git a/meta-oe/recipes-devtools/pstack/pstack_2.10.bb b/meta-oe/rec=
ipes-devtools/pstack/pstack_2.10.bb
new file mode 100644
index 0000000000..cebc13d36c
--- /dev/null
+++ b/meta-oe/recipes-devtools/pstack/pstack_2.10.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "A from-scratch implementation of pstack using DWARF debuggi=
ng \
+and unwind information. Works for C/C++, Go, Rust, and Python."
+
+HOMEPAGE =3D "https://github.com/peadar/pstack"
+SECTION =3D "devel/pstack"
+
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dea061f8731d5e6a5761dfad951ef5=
f5f"
+
+DEPENDS =3D "tcl virtual/libx11 libxt zip-native"
+
+SRC_URI =3D "git://github.com/peadar/pstack;branch=3Dmaster;tag=3Dv${PV}=
;protocol=3Dhttps"
+SRCREV =3D "a310df637d74917a1d3570c540bf3aef899d7e63"
+
+S =3D "${WORKDIR}/${BPN}${PV}"
+
+PACKAGES =3D+ "${PN}-lib"
+
+SOLIBS =3D ".so"
+FILES_SOLIBSDEV =3D ""
+
+# isn't getting picked up by shlibs code
+RDEPENDS:${PN} +=3D "tk-lib"
+RDEPENDS:${PN}:class-native =3D ""
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+inherit binconfig
+
+SYSROOT_DIRS +=3D "${bindir_crossscripts}"
+
+# Fix some paths that might be used by Tcl extensions
+BINCONFIG_GLOB =3D "*Config.sh"
diff --git a/meta-oe/recipes-devtools/pstack/pstack_git.bb b/meta-oe/reci=
pes-devtools/pstack/pstack_git.bb
new file mode 100644
index 0000000000..cc6721f9e3
--- /dev/null
+++ b/meta-oe/recipes-devtools/pstack/pstack_git.bb
@@ -0,0 +1,8 @@
+require pstack.inc
+
+SRCREV =3D "1e1734be3adb6d9c81b57c5cc3d0c8fbc43bdee3"
+PV =3D "2.11"
+
+SRC_URI =3D "git://github.com/peadar/pstack.git;branch=3Dmaster;protocol=
=3Dhttps \
+           file://0001-tests-fix-the-issue-of-cross-compilation-failure.=
patch \
+          "
--=20
2.25.1


