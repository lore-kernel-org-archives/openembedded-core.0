Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40150103A9A9
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:07:49 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19571.1774436859797778624
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=voDXLLRE;
 spf=pass (domain: ericsson.com, ip: 52.101.66.45, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqYOBlPs44FRefDnYw4fIzGreaUNLuaMy5alkmiZbmJ2SmAmMtcyVHw+wqBzbZs4nH6RINNerfptNCLPCOSz/anXXZyfvXWZ3zSS5Jtwp2ydBwYQM6sLZLKynUeUbAhnd/7+CFj9uYZt37tJX0/63ngCAwSnCYVW2SNEq5nKDjfa121xqOMSxyOzzXAjcrtbJ/SNm/UR9TLIhHxFHLlhZLDb8VKWFj37b+da5C75e2pXon3G1ohGaOx6rUiQBak7+izdy+TVsj5KIA1Livxu/8huhISB99zt4CgjfUeAwJtLL+iYH6ImkscjECWdfvWVkvrFF5YWij9IqFYN30Cc9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfzRWg6CiNt930Y3SSiqa6J1gnUNUI16GjiAIT8MJPU=;
 b=dTquCPZr3gaXbqXR8vWyjcorVSR8LbyODLbOOjIAafkgl756ymM2/gQRrXJjUlxR4gLT6fM/TwFf8jOR/tzMNadHo+JUE4SqHE4Q0DsYGzA5+ZT7fnjS+zJ+D06Q2yhSuvLp/wA9uACdQihINwf3hCviTcOfTQ2uDhjkHqcq8yZ7/u9STT9iIHfWtVvockEOGwFhde6w/yMfn3/9O+1Q47To/SGG61Q+b2BIs4sXqy150IihFG+LvxqNW9bGUJSBkner40BVJV404ME9Qe6miINEWnErys8AQilIJEln+X4fOWn5AEiOhYZzsg9sB02r7ekXb4biCD9rx6VtQ20igg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfzRWg6CiNt930Y3SSiqa6J1gnUNUI16GjiAIT8MJPU=;
 b=voDXLLREGH6atReGZOSD35kPAm2rrQ03b+he1VvmLMT6pIVwCPh2IKYv8fgbvA/c7JP6SsFnscupb8CCg7um2GyhNN6zyEgGlzrL0/CeFKc+mTfSyQ0ZNgQhIxLF2bgZXSFKxu7BI4eLg3SQDyVcVNjue7/+LVKnPfo49FJpTSfr6gk+qrqcXznFyVmVWupd7JO2fYOMyN8ZzMrTpyqK0LAPRTr3sNQKOtonEzowQkRsKFCpqgzY4TGQO5GfrUxyRkWde16Vla9hePcbecm2Q1QDNiM9qhE3w50osuX5bHpl9hCutWfPkOWVfLav6Fox9PwWtoDwkCWHYx3iaOe8ow==
Received: from DBBPR09CA0035.eurprd09.prod.outlook.com (2603:10a6:10:d4::23)
 by DU2PR07MB8112.eurprd07.prod.outlook.com (2603:10a6:10:271::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:07:33 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:10:d4:cafe::6) by DBBPR09CA0035.outlook.office365.com
 (2603:10a6:10:d4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 11:07:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Wed, 25 Mar 2026 11:07:33 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 25 Mar 2026 12:07:29 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 3586612FB9A;
	Wed, 25 Mar 2026 09:40:34 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 22591700CF09; Wed, 25 Mar 2026 09:40:34 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>, "Daniel
 Turull" <daniel.turull@ericsson.com>
Subject: [PATCH 2/2] oeqa: replace runltp with kirk
Date: Wed, 25 Mar 2026 09:40:20 +0100
Message-ID: <20260325084021.3915804-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325084021.3915804-1-daniel.turull@ericsson.com>
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00039231:EE_|DU2PR07MB8112:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dea024e-501c-4be6-7d71-08de8a5eb736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	FTrfEowbecYc4KiL6NuO1c2NOokQps49/bbuuiGPkZDByP1tsSlhEZ2klYh0R2VkRR40ajCs8jqOwvc1CRVkTEXhe0djzwvojh9JOrJiyLzQiyWtJLp8puAfFxEzLeTTPFIW/fyjVu2iJmZgQx+DcBkpevaPIzXcEzLHUBMQvAWz0mt1DY0NhPfKA0H9cSqYIZBiLO6szJZ6NlcIJ5WYSDQjLZ0Bh1dGrOv/NoqLZ5U7fx6edlzoAVCi+EMxR2e33so/jC4FzdRGs14nXR0T3Ni/C248x5gI2/C2F1bYcjgsJpdix3fQ85MIKLgzqLOX7J8UNMLA+nonqFfolCoRHV2MGngdypCZnzYdKvOgLoyYO0Xw2ZftcoX53LxNGnvCf21hh9TUKBjnUqqnpTw1R1WHBY4HLfe2h//otVzKx2QYGsHgv5Frgkjfcdhn4YnzsHw2+z4pC2SxxYsSHWnrJMKWtG9sIDoNiZEaVX3SYl+xhqr0QOh/CkIkAw6/ALW7orwc3jXkw3W1P2+jLwjoG90J57KhiUWR4E8pAYX+j4YdaJbLb2rygK63y3lZJr4L/qHJ6nNNb6i3poGoGPMEp19VT7cuL6Si8AL9OG7ZFazCpPGsXiXaDK2G66d9s3asRei0MYnl9qePjih3An/a6Pp4Urmp22ecqdu2gnFyzGJg6Dsawpug+KZA77mloDJXjQvne71DBQFJWdrBItaoWhSXaaQNmF+uglqO2CXAZ0ockjaq1krDsAXCkG0ZqMgJ9aCriRqzAH82BwF8AMizUDm9uVLlVUQ/RdEbYGBNKh0=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0JHMVz8o4amRrlPOwtKnKlP4vrnof60SFrrX4GXJPdrhAuQUqfsOYABYrzVyLhv43mPMUwBIfr0c0+fa3n0SH/x+eF7JFW9i46AU4EL29GSS4nI2cPP1JypNmO7n6qFjJFT/4HeeLu6i972FiEkBoIE76XkWjOqC8HT3x6q/LI0+d21nz64bDXh9AvvtjA/DE9rpWyElWA391jDJbuF3mlDyR6X87RBqXNOEanjX0DbXH5Zn8oZHmElTJ7tKe+6qq6VBXs3rKXzCc1JVGZCjyaEduGOJp1cnzeQ+TbN+TLLhATY1Mq9jnw011wcl9DB6WA9jGL3NqwImnZJUKfvbOg3VVVyBzpwwrJUP4Xh7PZ43RjmM1N11x5jEQvKKk8+Ywxy8yPKp+9niG4AnzS9se3VMCNcmL3GRYH5x608gghtYSL6PNLJsfbk+27TvYUft
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:07:33.7742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dea024e-501c-4be6-7d71-08de8a5eb736
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233871

From: Daniel Turull <daniel.turull@ericsson.com>

runltp has been removed from ltp and kirk is the official tool to
invoke linux ltp tests.

See:
https://github.com/linux-test-project/ltp/commit/6efd3605dc005c3ed135b463f1=
82174e24bdce1b

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Assisted-by: Claude, Anthropic
---
 meta/lib/oeqa/runtime/cases/ltp.py        | 16 ++++++-------
 meta/lib/oeqa/runtime/cases/ltp_stress.py | 16 +++++++++----
 meta/lib/oeqa/utils/logparser.py          | 29 +++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20260130.bb |  1 +
 4 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cas=
es/ltp.py
index 0ffdbe23e4..11c4814090 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -12,7 +12,7 @@ import pprint
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
-from oeqa.utils.logparser import LtpParser
+from oeqa.utils.logparser import LtpKirkParser
=20
 class LtpTestBase(OERuntimeTestCase):
=20
@@ -66,9 +66,9 @@ class LtpTest(LtpTestBase):
=20
     def runltp(self, ltp_group):
             # LTP appends to log files, so ensure we start with a clean lo=
g
-            self.target.deleteFiles("/opt/ltp/results/", ltp_group)
+            self.target.deleteFiles("/opt/ltp/results/", "%s.json" % ltp_g=
roup)
=20
-            cmd =3D '/opt/ltp/runltp -f %s -q -r /opt/ltp -l /opt/ltp/resu=
lts/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
+            cmd =3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s=
.json -n' % (ltp_group, ltp_group)
=20
             starttime =3D time.time()
             (status, output) =3D self.target.run(cmd, timeout=3D1200)
@@ -87,14 +87,14 @@ class LtpTest(LtpTestBase):
             self.extras['ltpresult.rawlogs']['log'] =3D self.extras['ltpre=
sult.rawlogs']['log'] + output
=20
             # Copy the machine-readable test results locally so we can par=
se it
-            dst =3D os.path.join(self.ltptest_log_dir, ltp_group)
-            remote_src =3D "/opt/ltp/results/%s" % ltp_group=20
+            dst =3D os.path.join(self.ltptest_log_dir, "%s.json" % ltp_gro=
up)
+            remote_src =3D "/opt/ltp/results/%s.json" % ltp_group
             (status, output) =3D self.target.copyFrom(remote_src, dst, Tru=
e)
             if status:
                 msg =3D 'File could not be copied. Output: %s' % output
                 self.target.logger.warning(msg)
=20
-            parser =3D LtpParser()
+            parser =3D LtpKirkParser()
             results, sections  =3D parser.parse(dst)
=20
             sections['duration'] =3D int(endtime-starttime)
@@ -113,9 +113,9 @@ class LtpTest(LtpTestBase):
=20
     # LTP runtime tests
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(["ltp"])
+    @OEHasPackage(["ltp", "python3-kirk"])
     def test_ltp_help(self):
-        (status, output) =3D self.target.run('/opt/ltp/runltp --help')
+        (status, output) =3D self.target.run('kirk --help')
         msg =3D 'Failed to get ltp help. Output: %s' % output
         self.assertEqual(status, 0, msg=3Dmsg)
=20
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runt=
ime/cases/ltp_stress.py
index ce6f4bf59d..cf84ec1182 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -13,7 +13,7 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.decorator.data import skipIfQemu
-from oeqa.utils.logparser import LtpParser
+from oeqa.utils.logparser import LtpKirkParser
=20
 class LtpStressBase(OERuntimeTestCase):
=20
@@ -60,7 +60,7 @@ class LtpStressBase(OERuntimeTestCase):
 class LtpStressTest(LtpStressBase):
=20
     def runltp(self, stress_group):
-            cmd =3D '/opt/ltp/runltp -f %s -p -q 2>@1 | tee /opt/ltp/resul=
ts/%s' % (stress_group, stress_group)
+            cmd =3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s=
.json -n' % (stress_group, stress_group)
             starttime =3D time.time()
             (status, output) =3D self.target.run(cmd)
             endtime =3D time.time()
@@ -69,8 +69,16 @@ class LtpStressTest(LtpStressBase):
=20
             self.extras['ltpstressresult.rawlogs']['log'] =3D self.extras[=
'ltpstressresult.rawlogs']['log'] + output
=20
-            parser =3D LtpParser()
-            results, sections  =3D parser.parse(os.path.join(self.ltptest_=
log_dir, "%s" % stress_group))
+            # Copy kirk JSON report from target
+            dst =3D os.path.join(self.ltptest_log_dir, "%s.json" % stress_=
group)
+            remote_src =3D "/opt/ltp/results/%s.json" % stress_group
+            (status, output) =3D self.target.copyFrom(remote_src, dst, Tru=
e)
+            if status:
+                msg =3D 'File could not be copied. Output: %s' % output
+                self.target.logger.warning(msg)
+
+            parser =3D LtpKirkParser()
+            results, sections  =3D parser.parse(dst)
=20
             runtime =3D int(endtime-starttime)
             sections['duration'] =3D runtime
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logpars=
er.py
index c479864162..a907421fab 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -5,6 +5,7 @@
 #
=20
 import enum
+import json
 import os
 import re
=20
@@ -158,6 +159,34 @@ class LtpParser:
         return results, section
=20
=20
+class LtpKirkParser:
+    """Parse kirk JSON report into the same format as LtpParser."""
+
+    STATUS_MAP =3D {
+        "pass": "PASSED",
+        "fail": "FAILED",
+        "brok": "FAILED",
+        "conf": "SKIPPED",
+        "warn": "PASSED",
+    }
+
+    def parse(self, jsonfile):
+        with open(jsonfile, errors=3D"replace") as f:
+            report =3D json.load(f)
+
+        results =3D {}
+        section =3D {"duration": 0, "log": ""}
+
+        for entry in report.get("results", []):
+            results[entry["test_fqn"]] =3D self.STATUS_MAP.get(entry.get("=
status", ""), "FAILED")
+            test =3D entry.get("test", {})
+            section["log"] +=3D test.get("log", "")
+
+        section["duration"] =3D int(report.get("stats", {}).get("runtime",=
 0))
+
+        return results, section
+
+
 # ltp Compliance log parsing
 class LtpComplianceParser(object):
     def __init__(self):
diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-exten=
ded/ltp/ltp_20260130.bb
index dcd1e81398..1ff20a7898 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -104,6 +104,7 @@ RDEPENDS:${PN} =3D "\
     net-tools \
     perl \
     python3-core \
+    python3-kirk \
     procps \
     quota \
     unzip \

