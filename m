Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65CEC77B60
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 13:28:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13901.1679318881337917241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 06:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F02A61424;
	Mon, 20 Mar 2023 06:28:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 97B7B3F71E;
	Mon, 20 Mar 2023 06:28:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 11/17] python3-more-itertools: use python3-unittest-automake-output
Date: Mon, 20 Mar 2023 13:27:45 +0000
Message-Id: <20230320132751.518693-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230320132751.518693-1-ross.burton@arm.com>
References: <20230320132751.518693-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 13:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178823

Instead of using sed to reformat the output use this new module.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-devtools/python/python3-more-itertools/run-ptest | 2 +-
 meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb  | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-more-itertools/run-ptes=
t b/meta/recipes-devtools/python/python3-more-itertools/run-ptest
index 3385d68939d..8d2017d39ce 100644
--- a/meta/recipes-devtools/python/python3-more-itertools/run-ptest
+++ b/meta/recipes-devtools/python/python3-more-itertools/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
=20
-pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" ||=
 $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pr=
int}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb=
 b/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
index 7602350795f..18a83ac0f53 100644
--- a/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
+++ b/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb
@@ -17,6 +17,7 @@ RDEPENDS:${PN} +=3D " \
=20
 RDEPENDS:${PN}-ptest +=3D " \
 	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-unittest-automake-output \
         "
=20
 do_install_ptest() {
--=20
2.34.1


