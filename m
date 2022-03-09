Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24582C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 16:51:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.203.1646844677836144259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 08:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AFBB1691
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Mar 2022 08:51:17 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BC4253F7F5
	for <openembedded-core@lists.openembedded.org>;
 Wed,  9 Mar 2022 08:51:16 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] pip_install_wheel: install wheel with a glob
Date: Wed,  9 Mar 2022 16:51:13 +0000
Message-Id: <20220309165113.2757010-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 16:51:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162975

Now that the build systems that use pip_install_wheel are all building
their wheel into a directory that we knew was empty before, we can just
install *.whl and not need to know the precise names.

By design a pyproject.toml will always build a single wheel, so there
shouldn't be any way for this to end up installing more than expected.

This obsoletes PIP_INSTALL_PACKAGE and PYPA_WHEEL, neither of which are
needed anymore.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/pip_install_wheel.bbclass | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_in=
stall_wheel.bbclass
index 954a6b750f..3861dae75a 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -1,20 +1,10 @@
 DEPENDS:append =3D " python3-pip-native"
=20
-def guess_pip_install_package_name(d):
-    import re
-    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
-    name =3D d.getVar('PYPI_PACKAGE') or re.sub(r"^python3-", "", d.getV=
ar('BPN'))
-    return name.replace('-', '_')
-
-PIP_INSTALL_PACKAGE ?=3D "${@guess_pip_install_package_name(d)}"
-
 # The directory where wheels should be written too. Build classes
 # will ideally [cleandirs] this but we don't do that here in case
 # a recipe wants to install prebuilt wheels.
 PIP_INSTALL_DIST_PATH ?=3D "${WORKDIR}/dist"
=20
-PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.wh=
l"
-
 PIP_INSTALL_ARGS =3D "\
     -vvvv \
     --ignore-installed \
@@ -29,8 +19,14 @@ PIP_INSTALL_PYTHON =3D "python3"
 PIP_INSTALL_PYTHON:class-native =3D "nativepython3"
=20
 pip_install_wheel_do_install () {
-    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
-      bbfatal_log "Failed to pip install wheel. Check the logs."
+    COUNT=3D$(find ${PIP_INSTALL_DIST_PATH} -name '*.whl' | wc -l)
+    if test $COUNT -eq 0; then
+        bbfatal No wheels found in ${PIP_INSTALL_DIST_PATH}
+    elif test $COUNT -gt 1; then
+        bbfatal More than one wheel found in ${PIP_INSTALL_DIST_PATH}, t=
his should not happen
+    fi
+
+    nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PIP_INSTALL_DIST_=
PATH}/*.whl
=20
     cd ${D}
     for i in ${D}${bindir}/* ${D}${sbindir}/*; do
--=20
2.25.1


