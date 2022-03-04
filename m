Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A1B9C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 17:14:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1053.1646414053899465869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 09:14:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFDB314BF
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 09:14:12 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B9103F73D
	for <openembedded-core@lists.openembedded.org>;
 Fri,  4 Mar 2022 09:14:12 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] setuptools3.bbclass: clean up
Date: Fri,  4 Mar 2022 17:14:07 +0000
Message-Id: <20220304171408.2672507-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220304171408.2672507-1-ross.burton@arm.com>
References: <20220304171408.2672507-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 17:14:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162745

There's been a lot of work in this class lately, so a little spring
cleaning is needed.

Create wheels verbosely to help debug problems.

Remove unused SETUPTOOLS_INSTALL_ARGS, these can't be passed to
bdist_wheel.

Remove duplicate manipulation of files in bindir as pip_install_wheel
does the same.

Remove obsolete deletion of easy-install.pth, wheels don't generate that.

Remove obsolete ${datadir}/share fixup, pip-installed wheels can't
generate that path combination.

Remove purging of ${D} references from *.py, these won't be written by
standard setuptools, and recipes can do it themselves to work around
specific issues if needed.

Remove obsolete vardepsexclude of MACHINE on do_install, as that variable
isn't referenced.

Signed-off-by: Ross Burton <ross.burton@arm.com>

fixup! setuptools3.bbclass: clean up
---
 meta/classes/setuptools3.bbclass | 34 +-------------------------------
 1 file changed, 1 insertion(+), 33 deletions(-)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.=
bbclass
index 564996c556..1b1a8aac76 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -4,13 +4,6 @@ inherit setuptools3-base pip_install_wheel
 #B =3D "${WORKDIR}/build"
=20
 SETUPTOOLS_BUILD_ARGS ?=3D ""
-SETUPTOOLS_INSTALL_ARGS ?=3D "--root=3D${D} \
-    --prefix=3D${prefix} \
-    --install-lib=3D${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=3D${datadir}"
-
-SETUPTOOLS_PYTHON =3D "python3"
-SETUPTOOLS_PYTHON:class-native =3D "nativepython3"
=20
 SETUPTOOLS_SETUP_PATH ?=3D "${S}"
=20
@@ -24,42 +17,17 @@ setuptools3_do_compile() {
         STAGING_INCDIR=3D${STAGING_INCDIR} \
         STAGING_LIBDIR=3D${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.=
py \
-        bdist_wheel ${SETUPTOOLS_BUILD_ARGS} || \
+        bdist_wheel --verbose ${SETUPTOOLS_BUILD_ARGS} || \
         bbfatal_log "'${PYTHON_PN} setup.py bdist_wheel ${SETUPTOOLS_BUI=
LD_ARGS}' execution failed."
 }
 setuptools3_do_compile[vardepsexclude] =3D "MACHINE"
 do_compile[cleandirs] +=3D "${SETUPTOOLS_SETUP_PATH}/dist"
=20
 setuptools3_do_install() {
-        cd ${SETUPTOOLS_SETUP_PATH}
-
         pip_install_wheel_do_install
-
-        # support filenames with *spaces*
-        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
-                               -exec sed -i -e s:${D}::g {} \;
-
-        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
-            if [ -f "$i" ]; then
-                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${SETUPTOOLS_PY=
THON}:g $i
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            fi
-        done
-
-        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
-
-        #
-        # FIXME: Bandaid against wrong datadir computation
-        #
-        if [ -e ${D}${datadir}/share ]; then
-            mv -f ${D}${datadir}/share/* ${D}${datadir}/
-            rmdir ${D}${datadir}/share
-        fi
 }
-setuptools3_do_install[vardepsexclude] =3D "MACHINE"
=20
 EXPORT_FUNCTIONS do_configure do_compile do_install
=20
 export LDSHARED=3D"${CCLD} -shared"
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
-
--=20
2.25.1


