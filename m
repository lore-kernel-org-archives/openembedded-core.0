Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8F1C433F5
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:12:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8060.1647018730426519705
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7F7B175A
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:12:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 947AB3FA45
	for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:12:09 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python_pep517: move PEP517_SOURCE_PATH to python_pep517
Date: Fri, 11 Mar 2022 17:12:06 +0000
Message-Id: <20220311171206.41094-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:12:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163067

Now we have the start of a PEP-517 base class, the PEP517_SOURCE_PATH
variable can be defined in there instead of the classes that use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/flit_core.bbclass             | 3 ---
 meta/classes/python_pep517.bbclass         | 3 +++
 meta/classes/setuptools_build_meta.bbclass | 3 ---
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbcl=
ass
index 1ef8ce9429..5a602f54ab 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/flit_core.bbclass
@@ -6,9 +6,6 @@ flit_core_do_configure () {
     :
 }
=20
-# Where to execute the build process from
-PEP517_SOURCE_PATH ?=3D "${S}"
-
 # TODO: ideally this uses pypa/build
 flit_core_do_compile () {
     cd ${PEP517_SOURCE_PATH}
diff --git a/meta/classes/python_pep517.bbclass b/meta/classes/python_pep=
517.bbclass
index 76660e70f8..756333bcf2 100644
--- a/meta/classes/python_pep517.bbclass
+++ b/meta/classes/python_pep517.bbclass
@@ -3,6 +3,9 @@
=20
 DEPENDS:append =3D " python3-pip-native"
=20
+# Where to execute the build process from
+PEP517_SOURCE_PATH ?=3D "${S}"
+
 # The directory where wheels should be written too. Build classes
 # will ideally [cleandirs] this but we don't do that here in case
 # a recipe wants to install prebuilt wheels.
diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/se=
tuptools_build_meta.bbclass
index 424be85608..8791a2965f 100644
--- a/meta/classes/setuptools_build_meta.bbclass
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -2,9 +2,6 @@ inherit setuptools3-base python_pep517
=20
 DEPENDS +=3D "python3-setuptools-native python3-wheel-native"
=20
-# Where to execute the build process from
-PEP517_SOURCE_PATH ?=3D "${S}"
-
 setuptools_build_meta_do_configure () {
     :
 }
--=20
2.25.1


