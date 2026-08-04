Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1226AC561E6
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 22:05:09 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27923.1785881104103974171
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 15:05:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=nIE+Ix+f;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from alhe-dev-ub.waqitnwczulubdoacjva2kqlvd.phxx.internal.cloudapp.net (unknown [134.33.52.9])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5000720B716A
	for <openembedded-core@lists.openembedded.org>; Tue,  4 Aug 2026 15:04:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5000720B716A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1785881082;
	bh=QpazKjzKgqqlmNEAkcBE+hlXMT+vYa1cWfZMgg4qJQA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nIE+Ix+f4r3SWaHegcwKmBIHz4ap3xf1RQniCSu/o5rabXPXKEbIP/VbGL8fVkojc
	 YRz81EEovB9XQcDxYdqNxcGRTSuQbkyXKLwR8D69cS7KpCMuD2vZzPogXsJoXvY57q
	 1lu2STbrkhjmBG6O+nLWyJz+O2XMJifhz0d0o8QE=
From: Alejandro Hernandez <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] ptest.bbclass: strip build machine triplet from installed ptest Makefiles
Date: Tue,  4 Aug 2026 22:04:54 +0000
Message-ID: <20260804220456.2342710-2-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804220456.2342710-1-alhe@linux.microsoft.com>
References: <20260804220456.2342710-1-alhe@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 22:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242807

do_install_ptest_base already rewrites HOSTTOOLS_DIR and WORKDIR
references out of installed ptest Makefiles, but automake-generated
Makefiles (as shipped by strace-ptest, gnutls-ptest and others) also
carry six autoconf-generated variables that encode the *build
machine*, not the target:

  build_triplet, build_alias, build, build_cpu, build_vendor, build_os

Those values differ across autobuilder workers (typical values are
build=3Dx86_64-pc-linux-gnu, build_alias=3Dx86_64-linux, build_vendor=3Dp=
c),
causing corresponding -ptest packages to fail the reproducibility
selftest.

Add sed rules to blank the RHS of each of those assignments, plus the
matching automake helper lines `set build_triplet` and
`set build_alias`, and extend PTEST_BUILD_HOST_FILES to include
site.exp (also autoconf-generated with the same variables).

Verified locally: before this change strace-ptest carried
`build_triplet =3D x86_64-pc-linux-gnu`, `build =3D x86_64-pc-linux-gnu`,
`build_alias =3D x86_64-linux`, `build_cpu =3D x86_64`,
`build_vendor =3D pc`, `build_os =3D linux-gnu`; after this change all si=
x
lines have an empty RHS.

Assisted-by: AI - OpenAI
Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
---
 meta/classes-recipe/ptest.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/ptest.bbclass b/meta/classes-recipe/ptes=
t.bbclass
index 64c4bb9788..0f80fbc1d8 100644
--- a/meta/classes-recipe/ptest.bbclass
+++ b/meta/classes-recipe/ptest.bbclass
@@ -9,7 +9,7 @@ DESCRIPTION:${PN}-ptest ?=3D "${DESCRIPTION}  \
 This package contains a test directory ${PTEST_PATH} for package test pu=
rposes."
=20
 PTEST_PATH ?=3D "${libdir}/${BPN}/ptest"
-PTEST_BUILD_HOST_FILES ?=3D "Makefile"
+PTEST_BUILD_HOST_FILES ?=3D "Makefile site.exp"
 PTEST_BUILD_HOST_PATTERN ?=3D ""
 PTEST_PARALLEL_MAKE ?=3D "${PARALLEL_MAKE}"
 PTEST_PARALLEL_MAKEINST ?=3D "${PARALLEL_MAKEINST}"
@@ -69,6 +69,14 @@ do_install_ptest_base() {
             sed -e 's#${HOSTTOOLS_DIR}/*##g' \
                 -e 's#${WORKDIR}/*=3D#.=3D#g' \
                 -e 's#${WORKDIR}/*##g' \
+                -e 's#^\(build_triplet[[:space:]]*=3D\).*#\1#' \
+                -e 's#^\(build_alias[[:space:]]*=3D\).*#\1#' \
+                -e 's#^\(build[[:space:]]*=3D\).*#\1#' \
+                -e 's#^\(build_cpu[[:space:]]*=3D\).*#\1#' \
+                -e 's#^\(build_vendor[[:space:]]*=3D\).*#\1#' \
+                -e 's#^\(build_os[[:space:]]*=3D\).*#\1#' \
+                -e 's#^\(set build_triplet\).*#\1#' \
+                -e 's#^\(set build_alias\).*#\1#' \
                 -i $installed_ptest_file
             if [ -n "${PTEST_BUILD_HOST_PATTERN}" ]; then
                sed -E '/${PTEST_BUILD_HOST_PATTERN}/d' \
--=20
2.43.0


