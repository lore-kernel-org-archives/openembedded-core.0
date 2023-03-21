Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7883C74A5B
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 12:38:06 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11714.1679402281295157813
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 05:38:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFB60AD7;
	Tue, 21 Mar 2023 05:38:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A7463F71E;
	Tue, 21 Mar 2023 05:37:59 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 15/17] python3-wcwidth: use python3-unittest-automake-output
Date: Tue, 21 Mar 2023 12:37:43 +0000
Message-Id: <20230321123745.1248462-15-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321123745.1248462-1-ross.burton@arm.com>
References: <20230321123745.1248462-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178868

Instead of using sed to reformat the output use this new module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-wcwidth/run-ptest | 2 +-
 meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-wcwidth/run-ptest b/met=
a/recipes-devtools/python/python3-wcwidth/run-ptest
index b63c4de0d9a..8d2017d39ce 100644
--- a/meta/recipes-devtools/python/python3-wcwidth/run-ptest
+++ b/meta/recipes-devtools/python/python3-wcwidth/run-ptest
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
diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb b/meta=
/recipes-devtools/python/python3-wcwidth_0.2.6.bb
index 368146dba48..fbd008c13de 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.6.bb
@@ -14,11 +14,12 @@ SRC_URI +=3D " \
=20
 RDEPENDS:${PN}-ptest +=3D " \
        ${PYTHON_PN}-pytest \
+       ${PYTHON_PN}-unittest-automake-output \
 "
=20
 do_install_ptest() {
       install -d ${D}${PTEST_PATH}/tests
-        cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+      cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


