Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B21CF34C0
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 19:46:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6049.1727984797291983250
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 12:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B646339
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Oct 2024 12:47:06 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 407403F640
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Oct 2024 12:46:36 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] strace: download release tarballs from GitHub
Date: Thu,  3 Oct 2024 20:46:31 +0100
Message-Id: <20241003194631.3250792-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 19:46:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205212

Switch to downloading the release tarballs from GitHub.  Their CDN is
rock solid, and strace.io is hosted inside Russia which some networks
are blocking.

Signed-off-by: Ross Burton <ross.burton@arm.com>

diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-d=
evtools/strace/strace_6.11.bb
index d98b5fdec9a..a8f11ea8093 100644
--- a/meta/recipes-devtools/strace/strace_6.11.bb
+++ b/meta/recipes-devtools/strace/strace_6.11.bb
@@ -5,7 +5,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2433d82e1432a76dc3eadd9002bfe=
304"

-SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
+SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
@@ -17,7 +17,7 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
            "
 SRC_URI[sha256sum] =3D "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98ba=
b6e4883626e283a5"

-inherit autotools ptest
+inherit autotools github-releases ptest

 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 =3D "null"
---
 meta/recipes-devtools/strace/strace_6.11.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/strace/strace_6.11.bb b/meta/recipes-d=
evtools/strace/strace_6.11.bb
index d98b5fdec9a..a8f11ea8093 100644
--- a/meta/recipes-devtools/strace/strace_6.11.bb
+++ b/meta/recipes-devtools/strace/strace_6.11.bb
@@ -5,7 +5,7 @@ SECTION =3D "console/utils"
 LICENSE =3D "LGPL-2.1-or-later & GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2433d82e1432a76dc3eadd9002bfe=
304"
=20
-SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
+SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://update-gawk-paths.patch \
            file://Makefile-ptest.patch \
            file://run-ptest \
@@ -17,7 +17,7 @@ SRC_URI =3D "https://strace.io/files/${PV}/strace-${PV}=
.tar.xz \
            "
 SRC_URI[sha256sum] =3D "83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98ba=
b6e4883626e283a5"
=20
-inherit autotools ptest
+inherit autotools github-releases ptest
=20
 # Not yet ported to rv32
 COMPATIBLE_HOST:riscv32 =3D "null"
--=20
2.34.1


