Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87529C4321E
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7715.1639146169711834416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73C01106F
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F8C03F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:50 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 07/10] apr: remove obsolete support for renamed libtool
Date: Fri, 10 Dec 2021 14:22:39 +0000
Message-Id: <20211210142242.2698587-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159534

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

This means that apr now installs libtool into the build-1 folder, but
as this has never been needed before (as we use the system libtool) we
can remove it (it contains build paths so is unreproducible).  Also add
a RDEPENDS on libtool for the target -dev package.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/apr/apr_1.7.0.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.7.0.bb b/meta/recipes-support=
/apr/apr_1.7.0.bb
index 5f8fd6a4618..9c826d43807 100644
--- a/meta/recipes-support/apr/apr_1.7.0.bb
+++ b/meta/recipes-support/apr/apr_1.7.0.bb
@@ -63,7 +63,7 @@ MULTILIB_SCRIPTS =3D "${PN}-dev:${bindir}/apr-1-config =
\
                     ${PN}-dev:${datadir}/build-1/apr_rules.mk"
=20
 FILES:${PN}-dev +=3D "${libdir}/apr.exp ${datadir}/build-1/*"
-RDEPENDS:${PN}-dev +=3D "bash"
+RDEPENDS:${PN}-dev +=3D "bash libtool"
=20
 RDEPENDS:${PN}-ptest +=3D "libgcc"
=20
@@ -80,6 +80,8 @@ do_install:append() {
 }
=20
 do_install:append:class-target() {
+	rm -f ${D}${datadir}/build-1/libtool
+	sed -i s,LIBTOOL=3D.*,LIBTOOL=3Dlibtool,g ${D}${datadir}/build-1/apr_ru=
les.mk
 	sed -i -e 's,${DEBUG_PREFIX_MAP},,g' \
 	       -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_rules.m=
k
 	sed -i -e 's,${STAGING_DIR_HOST},,g' \
@@ -97,12 +99,12 @@ apr_sysroot_preprocess () {
 	cp ${S}/build/apr_rules.mk $d/
 	sed -i s,apr_builddir=3D.*,apr_builddir=3D,g $d/apr_rules.mk
 	sed -i s,apr_builders=3D.*,apr_builders=3D,g $d/apr_rules.mk
-	sed -i s,LIBTOOL=3D.*,LIBTOOL=3D${HOST_SYS}-libtool,g $d/apr_rules.mk
+	sed -i s,LIBTOOL=3D.*,LIBTOOL=3Dlibtool,g $d/apr_rules.mk
 	sed -i s,\$\(apr_builders\),${STAGING_DATADIR}/apr/,g $d/apr_rules.mk
 	cp ${S}/build/mkdir.sh $d/
 	cp ${S}/build/make_exports.awk $d/
 	cp ${S}/build/make_var_export.awk $d/
-	cp ${S}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${datadir}/build-1/libtoo=
l
+	cp ${S}/libtool ${SYSROOT_DESTDIR}${datadir}/build-1/libtool
 }
=20
 do_compile_ptest() {
--=20
2.25.1


