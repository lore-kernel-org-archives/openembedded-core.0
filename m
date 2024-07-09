Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC840C3DA41
	for <webhook@archiver.kernel.org>; Tue,  9 Jul 2024 16:51:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.906.1720543871280232208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jul 2024 09:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F33101063
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jul 2024 09:51:35 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 523E73F766
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Jul 2024 09:51:10 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glibc: add task to list exported symbols
Date: Tue,  9 Jul 2024 17:51:04 +0100
Message-Id: <20240709165104.150624-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jul 2024 16:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201667

When upgrading glibc it's important to know if there are any new symbols
that pseudo needs to wrap. In the future a generalised ABI comparison too=
l
would be good, but to solve the immediate need we can simply list the
exported symbols to files in WORKDIR.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/glibc/glibc_2.39.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/gl=
ibc/glibc_2.39.bb
index 2484ae1cd99..411d226ef60 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -128,4 +128,15 @@ do_compile () {
=20
 require glibc-package.inc
=20
+# When upgrading glibc it's important to know if there are any new symbo=
ls
+# that pseudo needs to wrap. In the future a generalised ABI comparison =
tool
+# would be good, but to solve the immediate need we can simply list the
+# exported symbols to files in WORKDIR.
+do_symlist() {
+    for LIB in ${D}${base_libdir}/lib*.so.*; do
+        ${NM} --dynamic $LIB | awk --source '$2 =3D=3D "T" { print $3 }'=
 | sort > ${WORKDIR}/$(basename $LIB)-${PV}.symbols
+    done
+}
+addtask symlist after do_install
+
 BBCLASSEXTEND =3D "nativesdk"
--=20
2.34.1


