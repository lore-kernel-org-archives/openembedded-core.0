Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03A9C4332F
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 14:30:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8612.1646749840226651308
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 06:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFA2C1516
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 06:30:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96AF43FA7A
	for <openembedded-core@lists.openembedded.org>;
 Tue,  8 Mar 2022 06:30:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] setuptools_build_meta: respect PIP_INSTALL_DIST_PATH
Date: Tue,  8 Mar 2022 14:30:32 +0000
Message-Id: <20220308143035.3569559-3-ross.burton@arm.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/162925

pip_install_wheel expects the wheels to be in PIP_INSTALL_DIST_PATH but
this class was writing to the same directory through chance not design.

Respect PIP_INSTALL_DIST_PATH as the output directory, and use
[cleandirs] to ensure that it exists and is empty.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/setuptools_build_meta.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/se=
tuptools_build_meta.bbclass
index 0651cca0a0..18ae2e6004 100644
--- a/meta/classes/setuptools_build_meta.bbclass
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -8,8 +8,8 @@ setuptools_build_meta_do_configure () {
=20
 # TODO: ideally this uses pypa/build
 setuptools_build_meta_do_compile () {
-    mkdir -p ${S}/dist
-    nativepython3 -c "from setuptools import build_meta; build_meta.buil=
d_wheel('./dist')"
+    nativepython3 -c "from setuptools import build_meta; build_meta.buil=
d_wheel('${PIP_INSTALL_DIST_PATH}')"
 }
+do_compile[cleandirs] +=3D "${PIP_INSTALL_DIST_PATH}"
=20
 EXPORT_FUNCTIONS do_configure do_compile
--=20
2.25.1


