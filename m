Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D119C83013
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 18:55:33 +0000 (UTC)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
 by mx.groups.io with SMTP id smtpd.web11.14210.1751188143307761183
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Jun 2025 02:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.dev header.s=key1 header.b=BRsnqDLc;
 spf=pass (domain: linux.dev, ip: 91.218.175.186, mailfrom: wen.yang@linux.dev)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751188140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JSfw9IeNpccQPyAHR0sdJrW+zwazdQnaqubZcAoGbg8=;
	b=BRsnqDLcMlDwnzyX3Eh2acfuAPwfBC3CShQCYgPOiMHAohUzkT6UJE/oMO9LPwl038AZxs
	fbnVhEvfaO99fCqPIo1NGTLOruI0GA48STnAPNYN3jwCRvgsPzjt8yZTdD4v7W/o2HcVoU
	NwKpEv1s6IeUJZgVFMDyIdxYEI3PIhs=
From: Wen Yang <wen.yang@linux.dev>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Cc: Wen Yang <wen.yang@linux.dev>
Subject: [oe-core][PATCH] pstack: add recipe
Date: Sun, 29 Jun 2025 17:07:57 +0800
Message-Id: <20250629090757.11773-1-wen.yang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Jun 2025 18:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219453

This recipe provides pstack for C/C++, Go, Rust, and Python.

Signed-off-by: Wen Yang <wen.yang@linux.dev>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 ...e-issue-of-cross-compilation-failure.patch | 28 +++++++++++++
 meta/recipes-devtools/pstack/pstack.inc       | 39 +++++++++++++++++++
 meta/recipes-devtools/pstack/pstack_git.bb    |  8 ++++
 4 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/pstack/files/0001-tests-fix-the=
-issue-of-cross-compilation-failure.patch
 create mode 100644 meta/recipes-devtools/pstack/pstack.inc
 create mode 100644 meta/recipes-devtools/pstack/pstack_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index d94fb693e3..2f04c69445 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -609,6 +609,7 @@ RECIPE_MAINTAINER:pn-procps =3D "Unassigned <unassign=
ed@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pseudo =3D "Robert Yang <liezhi.yang@windriver.com>=
"
 RECIPE_MAINTAINER:pn-psmisc =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-psplash =3D "Yi Zhao <yi.zhao@windriver.com>"
+RECIPE_MAINTAINER:pn-pstack =3D "Wen Yang <wen.yang@linux.dev>"
 RECIPE_MAINTAINER:pn-ptest-runner =3D "Ross Burton <ross.burton@arm.com>=
"
 RECIPE_MAINTAINER:pn-pulseaudio =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-pulseaudio-client-conf-sato =3D "Unassigned <unassi=
gned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/pstack/files/0001-tests-fix-the-issue-=
of-cross-compilation-failure.patch b/meta/recipes-devtools/pstack/files/0=
001-tests-fix-the-issue-of-cross-compilation-failure.patch
new file mode 100644
index 0000000000..2b54750e7a
--- /dev/null
+++ b/meta/recipes-devtools/pstack/files/0001-tests-fix-the-issue-of-cros=
s-compilation-failure.patch
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
diff --git a/meta/recipes-devtools/pstack/pstack.inc b/meta/recipes-devto=
ols/pstack/pstack.inc
new file mode 100644
index 0000000000..9831a74d1a
--- /dev/null
+++ b/meta/recipes-devtools/pstack/pstack.inc
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
diff --git a/meta/recipes-devtools/pstack/pstack_git.bb b/meta/recipes-de=
vtools/pstack/pstack_git.bb
new file mode 100644
index 0000000000..cc6721f9e3
--- /dev/null
+++ b/meta/recipes-devtools/pstack/pstack_git.bb
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


