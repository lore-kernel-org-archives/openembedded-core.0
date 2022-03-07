Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFE4C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 15:26:58 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.27433.1646666816475951975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 07:26:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56DBD1477
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 07:26:55 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01F603F66F
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 07:26:54 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 2/2] pip_install_wheel: clean up
Date: Mon,  7 Mar 2022 15:26:49 +0000
Message-Id: <20220307152649.2750721-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307152649.2750721-1-ross.burton@arm.com>
References: <20220307152649.2750721-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 15:26:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162850

There's been a lot of work in this class lately, so a little spring
cleaning is needed.

Remove redundant creation of PYTHON_SITEPACKAGES_DIR, pip will do that.

Remove redundant export of PYPA_WHEEL.

Simplyify recompile code using "realpath --relative-to".

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/pip_install_wheel.bbclass | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_in=
stall_wheel.bbclass
index 3beff685bb..c1680a24ed 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -20,29 +20,21 @@ PIP_INSTALL_ARGS ?=3D "\
     --prefix=3D${prefix} \
 "
=20
-pip_install_wheel_do_install:prepend () {
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-}
-
-export PYPA_WHEEL
-
 PIP_INSTALL_PYTHON =3D "python3"
 PIP_INSTALL_PYTHON:class-native =3D "nativepython3"
=20
 pip_install_wheel_do_install () {
     nativepython3 -m pip install ${PIP_INSTALL_ARGS} ${PYPA_WHEEL} ||
-    bbfatal_log "Failed to pip install wheel. Check the logs."
+      bbfatal_log "Failed to pip install wheel. Check the logs."
=20
+    cd ${D}
     for i in ${D}${bindir}/* ${D}${sbindir}/*; do
         if [ -f "$i" ]; then
             sed -i -e "1s,#!.*nativepython3,#!${USRBINPATH}/env ${PIP_IN=
STALL_PYTHON}," $i
             sed -i -e "s:${PYTHON}:${USRBINPATH}/env\ ${PIP_INSTALL_PYTH=
ON}:g" $i
             sed -i -e "s:${STAGING_BINDIR_NATIVE}:${bindir}:g" $i
-            # Recompile after modifying it
-            cd ${D}
-            file=3D`echo $i | sed 's:^${D}/::'`
-            ${STAGING_BINDIR_NATIVE}/python3-native/python3 -c "from py_=
compile import compile; compile('$file')"
-            cd -
+            # Not everything we find may be Python, so ignore errors
+            nativepython3 -mpy_compile $(realpath --relative-to=3D${D} $=
i) || true
         fi
     done
 }
--=20
2.25.1


