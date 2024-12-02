Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4409D7833B
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 17:30:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.179860.1733160598233349069
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 09:29:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F38D01007
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Dec 2024 09:30:25 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3445C3F71E
	for <openembedded-core@lists.openembedded.org>; Mon,  2 Dec 2024 09:29:57 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH] kselftest: add recipe
Date: Mon,  2 Dec 2024 17:29:53 +0000
Message-Id: <20241202172953.769101-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 17:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208149

There's a similar recipe in meta-oe (kernel-selftest) but it needs clang
and seems overly complicated.

This recipe still needs further improvements, primarily that there is no
integration into oeqa, but that can come later.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-kernel/linux/kselftest.bb   | 65 ++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-kernel/linux/kselftest.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 4cac0647c2a..3485c9df1b0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -304,6 +304,7 @@ RECIPE_MAINTAINER:pn-kexec-tools =3D "Unassigned <una=
ssigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-keymaps =3D "Alexander Kanavin <alex.kanavin@gmail.=
com>"
 RECIPE_MAINTAINER:pn-kmod =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-kmscube =3D "Carlos Rafael Giani <crg7475@mailbox.o=
rg>"
+RECIPE_MAINTAINER:pn-kselftest =3D "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-l3afpad =3D "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-lame =3D "Michael Opdenacker <michael@opdenacker.or=
g>"
 RECIPE_MAINTAINER:pn-ldconfig-native =3D "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-kernel/linux/kselftest.bb b/meta/recipes-kernel=
/linux/kselftest.bb
new file mode 100644
index 00000000000..dec57aca071
--- /dev/null
+++ b/meta/recipes-kernel/linux/kselftest.bb
@@ -0,0 +1,65 @@
+SUMMARY =3D "kselftest, the kernel test suite"
+SECTION =3D "kernel"
+LICENSE =3D "GPL-2.0-only"
+
+DEPENDS =3D "rsync-native"
+
+inherit kernelsrc kernel-arch pkgconfig
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+# Unconventional usage of PACKAGECONFIG to control how the tests are bui=
lt.
+#
+# Enabled should be unused, Disabled is the list of test targets which s=
hould
+# be skipped if this dependency isn't present.
+PACKAGECONFIG ??=3D "alsa libcap libcapng netlink numa openssl popt"
+PACKAGECONFIG[alsa] =3D ",alsa,alsa-lib"
+PACKAGECONFIG[bpf] =3D ",bpf hid,clang-native elfutils"
+PACKAGECONFIG[fuse] =3D ",,fuse"
+PACKAGECONFIG[libcap] =3D ",,libcap"
+PACKAGECONFIG[libcapng] =3D ",,libcap-ng"
+PACKAGECONFIG[netlink] =3D ",,libmnl"
+PACKAGECONFIG[numa] =3D ",,numactl"
+PACKAGECONFIG[openssl] =3D ",,openssl"
+PACKAGECONFIG[popt] =3D ",,popt"
+
+B =3D "${WORKDIR}/build"
+
+do_compile[cleandirs] =3D "${B}"
+
+CC:remove:aarch64 =3D "-mbranch-protection=3Dstandard"
+SECURITY_CFLAGS =3D ""
+
+SKIP_TARGETS =3D "${PACKAGECONFIG_CONFARGS}"
+
+EXTRA_OEMAKE +=3D "\
+    O=3D${B} \
+    V=3D1 \
+    ARCH=3D${ARCH} \
+    CROSS_COMPILE=3D${TARGET_PREFIX} \
+    CC=3D"${CC} ${DEBUG_PREFIX_MAP}" \
+    AR=3D"${AR}" \
+    LD=3D"${LD}" \
+    HOSTPKG_CONFIG=3Dpkg-config-native \
+    SKIP_TARGETS=3D"${SKIP_TARGETS}" \
+"
+
+# Force all tests to build successfully. Usually we just package what
+# successfully builds.
+# EXTRA_OEMAKE +=3D "FORCE_TARGETS=3D1"
+
+do_compile() {
+	oe_runmake -C ${S}/tools/testing/selftests
+}
+
+do_install() {
+	oe_runmake -C ${S}/tools/testing/selftests install INSTALL_PATH=3D${D}/=
${libexecdir}/kselftest
+	# install uses rsync -a so reset the permissions
+	chown -R root:root ${D}/${libexecdir}/kselftest
+}
+
+RDEPENDS:${PN} +=3D "bash coreutils grep iproute2 python3-core python3 p=
erl perl-module-io-handle"
+
+# Some binaries appear to be explicitly built without debug info, and of=
ten
+# don't pass LDFLAGS. As this is a testing tool this is acceptable.
+INSANE_SKIP:${PN} =3D "ldflags already-stripped textrel"
--=20
2.34.1


