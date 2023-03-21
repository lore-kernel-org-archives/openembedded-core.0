Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29AEC77B62
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 12:37:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11941.1679402274352528957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 05:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E72CAC14;
	Tue, 21 Mar 2023 05:38:37 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 841EB3F71E;
	Tue, 21 Mar 2023 05:37:53 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v2 07/17] python3-cryptography: use python3-unittest-automake-output
Date: Tue, 21 Mar 2023 12:37:35 +0000
Message-Id: <20230321123745.1248462-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321123745.1248462-1-ross.burton@arm.com>
References: <20230321123745.1248462-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178860

Instead of using sed to reformat the output use this new module.

This shows that the previous sed expression wasn't sufficient because it
didn't handle tests throwing an error, and now the bench/ tests fail
because we don't have pytest-benchmark.  These tests are more of a
benchmark than a unit test, so just skip them.

Also show a skip message instead of nothing if the tests were skipped
due to a lack of memory.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-cryptography/check-memfree.py           | 2 +-
 .../recipes-devtools/python/python3-cryptography/run-ptest | 7 ++++++-
 .../recipes-devtools/python/python3-cryptography_39.0.2.bb | 1 +
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-cryptography/check-memf=
ree.py b/meta/recipes-devtools/python/python3-cryptography/check-memfree.=
py
index c111a9074c1..ed680d8d5b9 100755
--- a/meta/recipes-devtools/python/python3-cryptography/check-memfree.py
+++ b/meta/recipes-devtools/python/python3-cryptography/check-memfree.py
@@ -4,7 +4,7 @@ import sys
 meminfo =3D dict((i.split()[0].rstrip(':'),int(i.split()[1])) for i in o=
pen('/proc/meminfo').readlines())
 mem_free =3D meminfo['MemTotal']/1024./1024.
 if mem_free < 2.:
-    raise RuntimeError("Insufficient free memory({:.3f}): requires > 2 G=
B".format(mem_free))
+    print("Insufficient free memory({:.3f}): requires > 2 GB".format(mem=
_free))
     sys.exit(1)
 else:
     print("Free memory: {:.3f} GB".format(mem_free))
diff --git a/meta/recipes-devtools/python/python3-cryptography/run-ptest =
b/meta/recipes-devtools/python/python3-cryptography/run-ptest
index 3089df87819..0954b264a23 100644
--- a/meta/recipes-devtools/python/python3-cryptography/run-ptest
+++ b/meta/recipes-devtools/python/python3-cryptography/run-ptest
@@ -1,4 +1,9 @@
 #!/bin/sh
+
 if ./check-memfree.py; then
-    pytest -vvvv tests/ -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed =
-e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|se=
d -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || =
$NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n=
", $NF, $0}else{print}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" ||=
 $NF=3D=3D"SKIP" || $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print=
 $0}else{print}}'
+    # Skip the bench test module, we don't yet have pytest3-benchmark in=
 core
+    # and these are more benchmarks than unit tests.
+    pytest --automake -k bench
+else
+    echo "SKIP: crytography.not_enough_memory"
 fi
diff --git a/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb =
b/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
index 4b591bc59bf..449e3ba1bcc 100644
--- a/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_39.0.2.bb
@@ -43,6 +43,7 @@ RDEPENDS:${PN}-ptest +=3D " \
     ${PYTHON_PN}-pretend \
     ${PYTHON_PN}-psutil \
     ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-unittest-automake-output \
     ${PYTHON_PN}-pytest-subtests \
     ${PYTHON_PN}-pytz \
 "
--=20
2.34.1


