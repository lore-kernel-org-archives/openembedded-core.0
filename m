Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25189C4332F
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 18:32:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.424.1647455568050268594
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C33C41476
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 736EE3F766
	for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 11:32:48 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] classes/setuptools_build_meta: use
 python_pep517_do_compile
Date: Wed, 16 Mar 2022 18:32:40 +0000
Message-Id: <20220316183243.876234-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316183243.876234-1-ross.burton@arm.com>
References: <20220316183243.876234-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 18:32:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163351

Instead of implementing our own do_compile, set PEP517_BUILD_API and
use the generic do_compile.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/setuptools_build_meta.bbclass | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/se=
tuptools_build_meta.bbclass
index 8791a2965f..62b037363d 100644
--- a/meta/classes/setuptools_build_meta.bbclass
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -2,15 +2,10 @@ inherit setuptools3-base python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
=20
+PEP517_BUILD_API =3D "setuptools.build_meta"
+
 setuptools_build_meta_do_configure () {
     :
 }
=20
-# TODO: ideally this uses pypa/build
-setuptools_build_meta_do_compile () {
-    cd ${PEP517_SOURCE_PATH}
-    nativepython3 -c "from setuptools import build_meta; build_meta.buil=
d_wheel('${PEP517_WHEEL_PATH}')"
-}
-do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
-
-EXPORT_FUNCTIONS do_configure do_compile
+EXPORT_FUNCTIONS do_configure
--=20
2.25.1


