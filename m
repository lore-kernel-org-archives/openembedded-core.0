Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EEBAC87FD3
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 08:59:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2686.1753779584644859513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 01:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 565A61516
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:59:36 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DEE213F66E
	for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 01:59:43 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/7] setuptools3: pass -j to build step
Date: Tue, 29 Jul 2025 09:59:33 +0100
Message-ID: <20250729085935.1290438-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250729085935.1290438-1-ross.burton@arm.com>
References: <20250729085935.1290438-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 08:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221041

Explicitly call the build command, as by doing this we get to pass -j.

In packages without any C extensions this is mostly a no-op as
bdist_wheel will call it anyway. However, this does make a big
difference to build time for packages with non-trivial C extensions:

  python3-cython:do_compile     204.8s -> 70.9s
  python3-lxml:do_compile       157.5s -> 92.4s

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/setuptools3.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/setuptools3.bbclass b/meta/classes-recip=
e/setuptools3.bbclass
index f6194426cd9..f7cb79d2ebc 100644
--- a/meta/classes-recipe/setuptools3.bbclass
+++ b/meta/classes-recipe/setuptools3.bbclass
@@ -37,6 +37,7 @@ setuptools3_do_compile() {
         export STAGING_LIBDIR=3D${STAGING_LIBDIR}
=20
         nativepython3 setup.py --verbose \
+            build ${@oe.utils.parallel_make_argument(d, "-j %d")} \
             bdist_wheel --dist-dir ${PEP517_WHEEL_PATH} \
             ${SETUPTOOLS_BUILD_ARGS}
 }
--=20
2.43.0


