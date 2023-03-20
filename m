Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D069FC77B6D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 13:28:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13807.1679318878104568377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 06:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A82F01042;
	Mon, 20 Mar 2023 06:28:41 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4F32E3F71E;
	Mon, 20 Mar 2023 06:27:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 06/17] python3-bcrypt: use python3-unittest-automake-output
Date: Mon, 20 Mar 2023 13:27:40 +0000
Message-Id: <20230320132751.518693-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320132751.518693-1-ross.burton@arm.com>
References: <20230320132751.518693-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178818

Instead of using sed to reformat the output use this new module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-bcrypt/run-ptest | 2 +-
 meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-bcrypt/run-ptest b/meta=
/recipes-devtools/python/python3-bcrypt/run-ptest
index b63c4de0d9a..8d2017d39ce 100644
--- a/meta/recipes-devtools/python/python3-bcrypt/run-ptest
+++ b/meta/recipes-devtools/python/python3-bcrypt/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
=20
-pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/S=
KIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{p=
rint}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" =
|| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb b/meta/=
recipes-devtools/python/python3-bcrypt_4.0.1.bb
index 6ce45ca6ee1..9f5b81330bb 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_4.0.1.bb
@@ -17,6 +17,7 @@ require ${BPN}-crates.inc
=20
 RDEPENDS:${PN}-ptest +=3D " \
 	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unittest-automake-output \
 "
=20
 do_install_ptest() {
--=20
2.34.1


