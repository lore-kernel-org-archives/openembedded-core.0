Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B43BE7849A
	for <webhook@archiver.kernel.org>; Mon,  2 Oct 2023 10:23:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.78417.1696242204360687888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Oct 2023 03:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43082C15;
	Mon,  2 Oct 2023 03:24:02 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 529453F762;
	Mon,  2 Oct 2023 03:23:23 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] remove obsolete workaround (https://github.com/python/cpython/commit/33d95c6facdfda3c8c0feffa7a99184e4abc2f63)
Date: Mon,  2 Oct 2023 11:23:19 +0100
Message-Id: <20231002102320.3692433-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Oct 2023 10:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188595

From: Ross Burton <ross.burton@arm.com>

---
 meta/recipes-devtools/python/python3-numpy_1.26.0.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb b/meta/=
recipes-devtools/python/python3-numpy_1.26.0.bb
index 4e1e34e8df3..3ae40a33fb4 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
+++ b/meta/recipes-devtools/python/python3-numpy_1.26.0.bb
@@ -30,15 +30,6 @@ do_compile:prepend() {
     export NPY_DISABLE_SVML=3D1
 }
=20
-# Unfortunately the following pyc files are non-deterministc due to 'fro=
zenset'
-# being written without strict ordering, even with PYTHONHASHSEED =3D 0
-# Upstream is discussing ways to solve the issue properly, until then le=
t's
-# just not install the problematic files.
-# More info: http://benno.id.au/blog/2013/01/15/python-determinism
-do_install:append() {
-	rm ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/typing/tests/data/pass/__pycach=
e__/literal.cpython*
-}
-
 FILES:${PN}-staticdev +=3D "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.=
a ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a"
=20
 # install what is needed for numpy.test()
--=20
2.34.1


