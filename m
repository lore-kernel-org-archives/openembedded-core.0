Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA16C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:27:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89258.1754058442398639978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14DAA1516
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:27:14 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6CD43F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:27:21 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python3-build: simplifly native bootstrap
Date: Fri,  1 Aug 2025 15:27:11 +0100
Message-ID: <20250801142711.3276119-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801142711.3276119-1-ross.burton@arm.com>
References: <20250801142711.3276119-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221357

The pep517 class no longer called the "build" module directly, so we
can't play games with PYTHONPATH here.

However, the flit_core class has a bootstrap method so this recipe can
use that instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-build_1.2.2.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-build_1.2.2.bb b/meta/r=
ecipes-devtools/python/python3-build_1.2.2.bb
index 8f2ee920608..8d4ae2ca1d2 100644
--- a/meta/recipes-devtools/python/python3-build_1.2.2.bb
+++ b/meta/recipes-devtools/python/python3-build_1.2.2.bb
@@ -9,13 +9,8 @@ inherit pypi python_flit_core
=20
 DEPENDS +=3D "python3-pyproject-hooks-native"
=20
-DEPENDS:remove:class-native =3D "python3-build-native"
-
-# Skip dependencies as we're doing a minimal build to bootstrap
-PEP517_BUILD_OPTS:class-native =3D "--skip-dependency-check"
-
-do_compile:prepend:class-native() {
-    export PYTHONPATH=3D"${S}/src"
+do_compile:class-native() {
+    python_flit_core_do_manual_build
 }
=20
 RDEPENDS:${PN} +=3D " \
--=20
2.43.0


