Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD6DC76195
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 12:37:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11943.1679402274937973622
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 05:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 937B5AD7;
	Tue, 21 Mar 2023 05:38:38 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 309963F71E;
	Tue, 21 Mar 2023 05:37:54 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 08/17] python3-hypothesis: use python3-unittest-automake-output
Date: Tue, 21 Mar 2023 12:37:36 +0000
Message-Id: <20230321123745.1248462-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321123745.1248462-1-ross.burton@arm.com>
References: <20230321123745.1248462-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178861

Instead of using sed to reformat the output use this new module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-hypothesis/run-ptest | 2 +-
 meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-hypothesis/run-ptest b/=
meta/recipes-devtools/python/python3-hypothesis/run-ptest
index 8d44d7c49ac..54f6e7930f1 100644
--- a/meta/recipes-devtools/python/python3-hypothesis/run-ptest
+++ b/meta/recipes-devtools/python/python3-hypothesis/run-ptest
@@ -7,4 +7,4 @@
 #
 # Instead we run two test suites imported from examples/
=20
-pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/S=
KIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{p=
rint}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" =
|| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb b/=
meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb
index 23e842f2e28..4ffe278d78a 100644
--- a/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb
+++ b/meta/recipes-devtools/python/python3-hypothesis_6.68.2.bb
@@ -27,6 +27,7 @@ RDEPENDS:${PN} +=3D " \
=20
 RDEPENDS:${PN}-ptest +=3D " \
     ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unittest-automake-output \
     "
=20
 do_install_ptest() {
--=20
2.34.1


