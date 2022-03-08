Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE98BC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:30:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8702.1646749839887746095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 804D01650
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 06:30:39 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CB483FA58
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 06:30:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] flit_core: add variable to control where pyproject.toml
 is located
Date: Tue,  8 Mar 2022 14:30:33 +0000
Message-Id: <20220308143035.3569559-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308143035.3569559-1-ross.burton@arm.com>
References: <20220308143035.3569559-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 14:30:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162923

The PEP517[1] pyproject.toml doesn't have to be located at the top-level
of the source tree (for example, in recipes with multiple components), so
add a variable PEP517_SOURCE_PATH to set where the file is.

In the future there should be a pep517.bbclass to centralise the common
logic, but for now this can be defined in each of the relevant classes.

[1] https://www.python.org/dev/peps/pep-0517/

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/flit_core.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/flit_core.bbclass b/meta/classes/flit_core.bbcl=
ass
index 3481bb5089..7b578967a9 100644
--- a/meta/classes/flit_core.bbclass
+++ b/meta/classes/flit_core.bbclass
@@ -6,8 +6,12 @@ flit_core_do_configure () {
     :
 }
=20
+# Where to execute the build process from
+PEP517_SOURCE_PATH ?=3D "${S}"
+
 # TODO: ideally this uses pypa/build
 flit_core_do_compile () {
+    cd ${PEP517_SOURCE_PATH}
     nativepython3 -mflit_core.wheel --outdir ${PIP_INSTALL_DIST_PATH}
 }
 do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
--=20
2.25.1


