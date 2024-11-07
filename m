Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C797D5D672
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 17:24:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78028.1731000251900852408
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 09:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59219497
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:41 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0C0F63F6A8
	for <openembedded-core@lists.openembedded.org>; Thu,  7 Nov 2024 09:24:10 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 3/8] python3-numpy: don't do out-of-tree builds
Date: Thu,  7 Nov 2024 17:23:59 +0000
Message-Id: <20241107172404.4017047-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241107172404.4017047-1-ross.burton@arm.com>
References: <20241107172404.4017047-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 17:24:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206844

The source generation in numpy appears to be fragile and silently fails
when an out-of-tree build is done with setuptools.  The result is that
importing the numpy library results in failing linkage.

We should move numpy to build with mesonpy, but until that is done we
can simply reset B to be at the default location under the source tree.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-numpy_1.26.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.4.bb
index 914245507c7..4ffbe0d3708 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
@@ -23,6 +23,9 @@ DEPENDS +=3D "python3-cython-native"
 inherit ptest setuptools3 github-releases
=20
 S =3D "${WORKDIR}/numpy-${PV}"
+# numpy built with setuptools fails to build correctly when out-of-tree,=
 so
+# until we switch to mesonpy we need this.
+B =3D "${S}/build"
=20
 CLEANBROKEN =3D "1"
=20
--=20
2.34.1


