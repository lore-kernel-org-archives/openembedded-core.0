Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4955BC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 19:42:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2516.1646682159472416139
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 11:42:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F1FF153B
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:42:38 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A4963F7F5
	for <openembedded-core@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:42:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] pip_install_wheel: don't lazy assign PIPINSTALLARGS
Date: Mon,  7 Mar 2022 19:42:33 +0000
Message-Id: <20220307194236.3837684-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 19:42:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162860

If we expect users to extend this we should use =3D, as otherwise a recip=
e
that does +=3D will replace the default value.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/pip_install_wheel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_in=
stall_wheel.bbclass
index c1680a24ed..febcc8e445 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -10,7 +10,7 @@ PIP_INSTALL_PACKAGE ?=3D "${@guess_pip_install_package_=
name(d)}"
 PIP_INSTALL_DIST_PATH ?=3D "${@d.getVar('SETUPTOOLS_SETUP_PATH') or d.ge=
tVar('B')}/dist"
 PYPA_WHEEL ??=3D "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-*-*.wh=
l"
=20
-PIP_INSTALL_ARGS ?=3D "\
+PIP_INSTALL_ARGS =3D "\
     -vvvv \
     --ignore-installed \
     --no-cache \
--=20
2.25.1


