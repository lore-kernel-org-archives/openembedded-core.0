Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68C6FC433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 11:55:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6166.1646394929234305565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 03:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED9A8143D
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 03:55:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 988023F70D
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 03:55:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] classes: add setuptools3_legacy
Date: Fri,  4 Mar 2022 11:55:25 +0000
Message-Id: <20220304115525.2240283-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 11:55:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162715

Following a good discussion with PyPA upstream[1] the migration of the
setuptools3.bbclass to use bdist_wheel+pip turns out to be more complex
than thought.

Essentially, we're midway through a lot of changes: the future of Python
packaging is wheels and pip, but those by design are not as flexible as
traditional distutils and setup.py.

Specifically, with traditional distutils the package can implement its
own install task and write arbitrary files (such as init scripts).  With
wheels this is explicity impossible, so packages that do this cannot use
the new setuptools class and must continue to use the build/install tasks
as before.

This class is the old setuptools behaviour, bought back. However, as
distutils and the setuptools install task are both deprecated and will
soon be removed entirely, any users of this class should be moving to an
alternative build tool, be it a modern Python tool which works with
wheels, or a non-Pythonic tool such as Meson.

[1] https://github.com/pypa/packaging-problems/issues/576

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/setuptools3_legacy.bbclass | 78 +++++++++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 meta/classes/setuptools3_legacy.bbclass

diff --git a/meta/classes/setuptools3_legacy.bbclass b/meta/classes/setup=
tools3_legacy.bbclass
new file mode 100644
index 0000000000..5a99daadb5
--- /dev/null
+++ b/meta/classes/setuptools3_legacy.bbclass
@@ -0,0 +1,78 @@
+# This class is for packages which use the deprecated setuptools behavio=
ur,
+# specifically custom install tasks which don't work correctly with bdis=
t_wheel.
+# This behaviour is deprecated in setuptools[1] and won't work in the fu=
ture, so
+# all users of this should consider their options: pure Python modules c=
an use a
+# modern Python tool such as build[2], or packages which are doing more =
(such as
+# installing init scripts) should use a fully-featured build system such=
 as Meson.
+#
+# [1] https://setuptools.pypa.io/en/latest/history.html#id142
+# [2] https://pypi.org/project/build/
+
+inherit setuptools3-base
+
+B =3D "${WORKDIR}/build"
+
+SETUPTOOLS_BUILD_ARGS ?=3D ""
+SETUPTOOLS_INSTALL_ARGS ?=3D "--root=3D${D} \
+    --prefix=3D${prefix} \
+    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
+    --install-data=3D${datadir}"
+
+SETUPTOOLS_PYTHON =3D "python3"
+SETUPTOOLS_PYTHON:class-native =3D "nativepython3"
+
+SETUPTOOLS_SETUP_PATH ?=3D "${S}"
+
+setuptools3_legacy_do_configure() {
+    :
+}
+
+setuptools3_legacy_do_compile() {
+        cd ${SETUPTOOLS_SETUP_PATH}
+        NO_FETCH_BUILD=3D1 \
+        STAGING_INCDIR=3D${STAGING_INCDIR} \
+        STAGING_LIBDIR=3D${STAGING_LIBDIR} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py \
+        build --build-base=3D${B} ${SETUPTOOLS_BUILD_ARGS} || \
+        bbfatal_log "'${PYTHON_PN} setup.py build ${SETUPTOOLS_BUILD_ARG=
S}' execution failed."
+}
+setuptools3_legacy_do_compile[vardepsexclude] =3D "MACHINE"
+
+setuptools3_legacy_do_install() {
+        cd ${SETUPTOOLS_SETUP_PATH}
+        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+        STAGING_INCDIR=3D${STAGING_INCDIR} \
+        STAGING_LIBDIR=3D${STAGING_LIBDIR} \
+        PYTHONPATH=3D${D}${PYTHON_SITEPACKAGES_DIR} \
+        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py \
+        build --build-base=3D${B} install --skip-build ${SETUPTOOLS_INST=
ALL_ARGS} || \
+        bbfatal_log "'${PYTHON_PN} setup.py install ${SETUPTOOLS_INSTALL=
_ARGS}' execution failed."
+
+        # support filenames with *spaces*
+        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
+                               -exec sed -i -e s:${D}::g {} \;
+
+        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
+            if [ -f "$i" ]; then
+                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${SETUPTOOLS_PY=
THON}:g $i
+                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
+            fi
+        done
+
+        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
+
+        #
+        # FIXME: Bandaid against wrong datadir computation
+        #
+        if [ -e ${D}${datadir}/share ]; then
+            mv -f ${D}${datadir}/share/* ${D}${datadir}/
+            rmdir ${D}${datadir}/share
+        fi
+}
+setuptools3_legacy_do_install[vardepsexclude] =3D "MACHINE"
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
+
+export LDSHARED=3D"${CCLD} -shared"
+DEPENDS +=3D "python3-setuptools-native"
+
--=20
2.25.1


