Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 807E0C43219
	for <webhook@archiver.kernel.org>; Fri, 10 Dec 2021 14:22:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7715.1639146169711834416
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 599A6106F
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:49 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 053EA3F5A1
	for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Dec 2021 06:22:48 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 05/10] db: remove obsolete support for renamed libtool
Date: Fri, 10 Dec 2021 14:22:37 +0000
Message-Id: <20211210142242.2698587-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210142242.2698587-1-ross.burton@arm.com>
References: <20211210142242.2698587-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Dec 2021 14:22:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159532

libtool is now longer renamed to ${host}-libtool, so remove the changes
to support this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/=
db/db_5.3.28.bb
index d5b788a3d78..c5427f54eb0 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -66,8 +66,6 @@ PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[verify] =3D "--enable-verify, --disable-verify"
 PACKAGECONFIG[dbm] =3D "--enable-dbm,--disable-dbm,"
=20
-EXTRA_OEMAKE +=3D "LIBTOOL=3D'./${HOST_SYS}-libtool'"
-
 EXTRA_AUTORECONF +=3D "--exclude=3Dautoheader  -I ${S}/dist/aclocal -I${=
S}/dist/aclocal_java"
 AUTOTOOLS_SCRIPT_PATH =3D "${S}/dist"
=20
@@ -91,7 +89,7 @@ oe_runconf:prepend() {
=20
 do_compile:prepend() {
     # Stop libtool adding RPATHs
-    sed -i -e 's|hardcode_into_libs=3Dyes|hardcode_into_libs=3Dno|' ${B}=
/${HOST_SYS}-libtool
+    sed -i -e 's|hardcode_into_libs=3Dyes|hardcode_into_libs=3Dno|' ${B}=
/libtool
 }
=20
 do_install:append() {
--=20
2.25.1


