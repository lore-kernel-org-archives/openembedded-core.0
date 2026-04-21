Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4EBF8FA96
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 15:12:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34206.1776784372881382777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2026 08:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=o17yrnK4;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60558263D
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 08:12:46 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 979DE3FAF5
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 08:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776784371; bh=PpQEQxPiwmKDWIj59GWvOa/9t7kbhJDM0DEZnb7NOYc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o17yrnK42mO8wR2R+9zdg3ZH983gyxeeTOOwewf/osIwLVbgcvPR9FnA0fR2CeKcN
	 wX8f45eE1z0dv+vJC2SmE4O5+gIOWeBSEhHnbXSd7NSiPuVuP2rSLBWzhj2gL3Cynr
	 pLpZdLbIuj7hPvBQpFjIeLFuuE/M1fulb02QYNcQ=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] quilt: remove bzip2 RDEPENDS
Date: Tue, 21 Apr 2026 16:12:47 +0100
Message-ID: <20260421151247.754876-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260421151247.754876-1-ross.burton@arm.com>
References: <20260421151247.754876-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Apr 2026 15:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235686

quilt has support for compressed patches but for some reason we only
listed bzip2 explicitly, despite it also supporting gzip/xz/lzma/lz/zst.

We don't have any recipes that use compressed patches and there's
nothing special about bzip2, so if a recipe does want to use compressed
patches then it can add the required dependency itself.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtool=
s/quilt/quilt.inc
index 387e132b602..202c2103fbc 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -86,8 +86,8 @@ FILES:guards =3D "${bindir}/guards"
 FILES:${PN}-doc =3D "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
 FILES:guards-doc =3D "${mandir}/man1/guards.1"
=20
-RDEPENDS:${PN} =3D "bash patch diffstat bzip2 util-linux less"
-RDEPENDS:${PN}:class-native =3D "diffstat-native patch-native bzip2-nati=
ve"
+RDEPENDS:${PN} =3D "bash patch diffstat util-linux less"
+RDEPENDS:${PN}:class-native =3D "diffstat-native patch-native"
=20
 RDEPENDS:${PN}-ptest +=3D "file sed gawk diffutils findutils ed perl \
                          perl-module-filehandle perl-module-getopt-std \
--=20
2.43.0


