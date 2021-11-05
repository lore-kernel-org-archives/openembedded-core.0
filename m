Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A44FC433F5
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 16:58:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8414.1636131482131981738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 09:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF8B42F
	for <openembedded-core@lists.openembedded.org>;
 Fri,  5 Nov 2021 09:58:00 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 59F9C3F7F5
	for <openembedded-core@lists.openembedded.org>;
 Fri,  5 Nov 2021 09:58:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] scons: support out-of-tree builds
Date: Fri,  5 Nov 2021 16:57:58 +0000
Message-Id: <20211105165758.3779416-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 16:58:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157912

SCons has a slightly unusual implementation of out-of-tree builds where
there is no standard way of doing it. However, if a recipe sets B to
the idiomatic ${WORKDIR}/build and passes the right arguments so that thi=
s
is used then scons will fail as it is trying to find the SConstruct file
in ${B} not ${S}.

Always pass --directory=3D${S} to scons so that the SConstruct file can b=
e
found, and don't call --clean if out-of-tree builds are being used as
we would have just deleted the entire build tree already.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/scons.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 4f3ae502ef..80f8382107 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -5,9 +5,9 @@ DEPENDS +=3D "python3-scons-native"
 EXTRA_OESCONS ?=3D ""
=20
 do_configure() {
-	if [ -n "${CONFIGURESTAMPFILE}" ]; then
+	if [ -n "${CONFIGURESTAMPFILE}" -a "${S}" =3D "${B}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" !=3D =
"${BB_TASKHASH}" -a "${CLEANBROKEN}" !=3D "1" ]; then
-			${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=3D${prefix} prefix=3D${=
prefix} ${EXTRA_OESCONS}
+			${STAGING_BINDIR_NATIVE}/scons --directory=3D${S} --clean PREFIX=3D${=
prefix} prefix=3D${prefix} ${EXTRA_OESCONS}
 		fi
=20
 		mkdir -p `dirname ${CONFIGURESTAMPFILE}`
@@ -16,12 +16,12 @@ do_configure() {
 }
=20
 scons_do_compile() {
-	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=3D${prefix} pref=
ix=3D${prefix} ${EXTRA_OESCONS} || \
+	${STAGING_BINDIR_NATIVE}/scons --directory=3D${S} ${PARALLEL_MAKE} PREF=
IX=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS} || \
 	die "scons build execution failed."
 }
=20
 scons_do_install() {
-	${STAGING_BINDIR_NATIVE}/scons install_root=3D${D}${prefix} PREFIX=3D${=
prefix} prefix=3D${prefix} ${EXTRA_OESCONS} install || \
+	${STAGING_BINDIR_NATIVE}/scons --directory=3D${S} install_root=3D${D}${=
prefix} PREFIX=3D${prefix} prefix=3D${prefix} ${EXTRA_OESCONS} install ||=
 \
 	die "scons install execution failed."
 }
=20
--=20
2.25.1


