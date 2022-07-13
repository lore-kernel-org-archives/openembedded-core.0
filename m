Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92896CCA481
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 16:28:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.24133.1657729705100478754
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 09:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 159561C01;
	Wed, 13 Jul 2022 09:28:25 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 148513F792;
	Wed, 13 Jul 2022 09:28:23 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/8] python3-flit-core: bootstrap explicitly
Date: Wed, 13 Jul 2022 17:28:15 +0100
Message-Id: <20220713162821.974801-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713162821.974801-1-ross.burton@arm.com>
References: <20220713162821.974801-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Jul 2022 16:28:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167967

Add a method to python_flit_core.bbclass that does a manual build with
flit explicitly, and use that to bootstrap python3-flit-core-native which
can build itself.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/python_flit_core.bbclass                   | 5 +++++
 meta/recipes-devtools/python/python3-flit-core_3.7.1.bb | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/meta/classes/python_flit_core.bbclass b/meta/classes/python_=
flit_core.bbclass
index 96652aa2043..a900f7b5579 100644
--- a/meta/classes/python_flit_core.bbclass
+++ b/meta/classes/python_flit_core.bbclass
@@ -3,3 +3,8 @@ inherit python_pep517 python3native python3-dir setuptool=
s3-base
 DEPENDS +=3D "python3 python3-flit-core-native"
=20
 PEP517_BUILD_API =3D "flit_core.buildapi"
+
+python_flit_core_do_manual_build () {
+    cd ${PEP517_SOURCE_PATH}
+    nativepython3 -m flit_core.wheel --outdir ${PEP517_WHEEL_PATH} .
+}
diff --git a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb b/me=
ta/recipes-devtools/python/python3-flit-core_3.7.1.bb
index 8d107384a6d..abe620374c0 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.7.1.bb
@@ -20,6 +20,10 @@ DEPENDS:append:class-native =3D " unzip-native"
 PYPI_PACKAGE =3D "flit"
 PEP517_SOURCE_PATH =3D "${S}/flit_core"
=20
+do_compile:class-native () {
+    python_flit_core_do_manual_build
+}
+
 do_install:class-native () {
     python_pep517_do_bootstrap_install
 }
--=20
2.34.1


