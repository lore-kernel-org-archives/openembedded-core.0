Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF98C433F5
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 16:44:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.12854.1647535478975384415
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 09:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F9681688
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 09:44:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3E07F3F7B4
	for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 09:44:38 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] python3-cryptography: enforce identical version for
 -cryptography-vectors
Date: Thu, 17 Mar 2022 16:44:34 +0000
Message-Id: <20220317164434.387779-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317164434.387779-1-ross.burton@arm.com>
References: <20220317164434.387779-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 16:44:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163426

python3-cryptography and python3-cryptography-vectors are actually the
same project but are on Pypi as two separate modules.

The test suite validates that they're the same version and fails if they
are not:

FAIL: tests/test_utils.py::test_vector_version
    def test_vector_version():
>       assert cryptography.__version__ =3D=3D cryptography_vectors.__ver=
sion__
E       AssertionError: assert '36.0.2' =3D=3D '36.0.1'

Catch this slightly earlier by mandating that python3-cryptography-ptest
pulls in an identically versioned python3-cryptography-vectors.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-cryptography_36.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb =
b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
index 940df60d44..cb3acdf7e2 100644
--- a/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
@@ -91,7 +91,7 @@ RDEPENDS:${PN}:append:class-target =3D " \
=20
 RDEPENDS:${PN}-ptest +=3D " \
     ${PYTHON_PN}-bcrypt \
-    ${PYTHON_PN}-cryptography-vectors \
+    ${PYTHON_PN}-cryptography-vectors (=3D ${PV}) \
     ${PYTHON_PN}-hypothesis \
     ${PYTHON_PN}-iso8601 \
     ${PYTHON_PN}-pretend \
--=20
2.25.1


