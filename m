Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E841BC5AE5D
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 11:53:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28044.1786362788231181119
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 04:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=aS8NvrWU;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D298A14BF
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:03 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 77F173F632
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786362787; bh=RTCzlIw1945YfzuMwolKo9RGMxMXM3rh1WFoLeWnfgs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aS8NvrWUe8Ik9GNfQ5UPC/DGrpzk5ESQqOl2SF21fxLFUlNQmIPqn/4yhWs6DwrRa
	 EJVP4MHyDD5YuyhYb7RfybYyqATn7rP7J4f44NWY2jissvoMVHCuzniZy9xqHYN8Tk
	 RyzkNAtxlrwFzQiCsClxdWwkdXr8CSt2SMR0AqVE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-pbr: use the python_pbr build class
Date: Mon, 10 Aug 2026 12:53:04 +0100
Message-ID: <20260810115304.562663-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810115304.562663-1-ross.burton@arm.com>
References: <20260810115304.562663-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 11:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243129

PBR builds on top of setuptools, so we need to have that as a dependency.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-pbr_7.0.3.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pbr_7.0.3.bb b/meta/rec=
ipes-devtools/python/python3-pbr_7.0.3.bb
index dee32aa885c..80092999fa8 100644
--- a/meta/recipes-devtools/python/python3-pbr_7.0.3.bb
+++ b/meta/recipes-devtools/python/python3-pbr_7.0.3.bb
@@ -5,9 +5,11 @@ SECTION =3D "devel/python"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1dece7821bf3fd70fe1309eaa37d5=
2a2"
=20
-inherit pypi python_setuptools_build_meta
+DEPENDS =3D "python3-setuptools-native"
=20
-RDEPENDS:${PN} +=3D "python3-pip"
+inherit pypi python_pbr
+
+RDEPENDS:${PN} +=3D "python3-setuptools"
=20
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.43.0


