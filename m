Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A96E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 14:12:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.129767.1734617519127340701
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 06:11:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E82981D13
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:12:26 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B16D3F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 06:11:58 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] expect: cleanup do_install
Date: Thu, 19 Dec 2024 14:11:51 +0000
Message-ID: <20241219141151.2592031-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241219141151.2592031-1-ross.burton@arm.com>
References: <20241219141151.2592031-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 14:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208916

Clean up the do_install append, and remove a long-standing unused
variable that appears to be intending to not install the scripts but
would have never actually done that as the relevant override since 2008
has been task-install.  As we've been installing the scripts, keep
instaling them.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes=
-devtools/expect/expect_5.45.4.bb
index 3886a5771a2..93ecc3f0d69 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -42,11 +42,9 @@ S =3D "${WORKDIR}/${BPN}${PV}"
 EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
=20
 do_install:append() {
-	install -d ${D}${libdir}
-        install -m 0755 ${D}${libdir}/expect${PV}/libexpect*.so   ${D}${=
libdir}/
-        install -m 0755 ${S}/fixline1           ${D}${libdir}/expect${PV=
}/
-        rm ${D}${libdir}/expect${PV}/libexpect*.so
-        sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex=
.tcl
+    mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
+    install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/
+    sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
=20
 do_install_ptest() {
@@ -65,7 +63,6 @@ EXTRA_OECONF +=3D "--with-tcl=3D${STAGING_LIBDIR} \
                  --disable-rpath \
                  ${TCL_INCLUDE_PATH} \
                 "
-EXTRA_OEMAKE_install =3D " 'SCRIPTS=3D' "
=20
 ALTERNATIVE:${PN}  =3D "mkpasswd"
 ALTERNATIVE_LINK_NAME[mkpasswd] =3D "${bindir}/mkpasswd"
--=20
2.43.0


