Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10EB1C7EE29
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 11:59:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6999.1686225560306914781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 04:59:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 873ED1042;
	Thu,  8 Jun 2023 05:00:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 923903F663;
	Thu,  8 Jun 2023 04:59:18 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 2/2] nettle: inherit lib_package
Date: Thu,  8 Jun 2023 12:59:16 +0100
Message-Id: <20230608115916.1539101-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608115916.1539101-1-ross.burton@arm.com>
References: <20230608115916.1539101-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 11:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182507

From: Ross Burton <ross.burton@arm.com>

Nettle is primarily a library that ships some tools, so inherit the
lib_package class to package the tools in nettle-bin, and add a
dependency on it to nettle-ptest.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-support/nettle/nettle_3.8.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle_3.8.1.bb b/meta/recipes-s=
upport/nettle/nettle_3.8.1.bb
index 184023e4031..92cc966dbba 100644
--- a/meta/recipes-support/nettle/nettle_3.8.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.8.1.bb
@@ -24,7 +24,7 @@ SRC_URI[sha256sum] =3D "364f3e2b77cd7dcde83fd7c45219c83=
4e54b0c75e428b6f894a23d12dd
=20
 UPSTREAM_CHECK_REGEX =3D "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
=20
-inherit autotools ptest multilib_header
+inherit autotools ptest multilib_header lib_package
=20
 EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
=20
@@ -53,4 +53,6 @@ do_install_ptest() {
         sed -i -e 's|../examples/|./|g' ${D}${PTEST_PATH}/testsuite/*-te=
st
 }
=20
+RDEPENDS:${PN}-ptest +=3D "${PN}-bin"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


