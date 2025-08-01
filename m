Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41D3C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:27:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89105.1754058441899950652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:27:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63C581516
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:27:13 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 01DF13F673
	for <openembedded-core@lists.openembedded.org>; Fri,  1 Aug 2025 07:27:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] classes/python_pep517: use pyproject-build instead of nativepython3
Date: Fri,  1 Aug 2025 15:27:10 +0100
Message-ID: <20250801142711.3276119-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250801142711.3276119-1-ross.burton@arm.com>
References: <20250801142711.3276119-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:27:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221356

The build package installs an entry point now, so we run that instead of
calling the module directly.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes-recipe/python_pep517.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/python_pep517.bbclass b/meta/classes-rec=
ipe/python_pep517.bbclass
index 4935b2cbe92..128c943794a 100644
--- a/meta/classes-recipe/python_pep517.bbclass
+++ b/meta/classes-recipe/python_pep517.bbclass
@@ -39,7 +39,7 @@ python_pep517_do_configure () {
 # When we have Python 3.11 we can parse pyproject.toml to determine the =
build
 # API entry point directly
 python_pep517_do_compile () {
-    nativepython3 -m build --no-isolation --wheel --outdir ${PEP517_WHEE=
L_PATH} ${PEP517_SOURCE_PATH} ${PEP517_BUILD_OPTS}
+    pyproject-build --no-isolation --wheel --outdir ${PEP517_WHEEL_PATH}=
 ${PEP517_SOURCE_PATH} ${PEP517_BUILD_OPTS}
 }
 do_compile[cleandirs] +=3D "${PEP517_WHEEL_PATH}"
=20
--=20
2.43.0


