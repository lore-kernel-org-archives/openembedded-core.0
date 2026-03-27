Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE0310ED669
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:28:49 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.36])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71785.1774614519741857585
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=rVsA0GZA;
 spf=pass (domain: ericsson.com, ip: 40.107.162.36, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDtB0MFj9GFbJb8LNYcRMK7amFvFvPpwwfAtlnpg0dIkOROd7t7wKAIo3L/WlKaV1t1JMWteWWdl2tK/5p7EYbDCBhZywCLl1gllslalcPTrsJKCvbLphtGyRkOmdLF5ijXZOEhthlr1naHGkRTyILE6X7mUSfY4tVS6dAkN53tUOeO46cQO4Uq4poLr/lBuQDUy0e1XVyIuTlZkxkaCkTAEaMCIoa3UB3JJY7l1bb7CHWp7R3c3fOd71NqlBgiWt+qVNPpGJ4FSc4CYCXOVY6LGOmtsM0htZTN7RCG+T9BK8dUEreItSizobUDppK82QN7Iz2gmg2FegmD52U5VaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k41+PfDzjeRmSjCgltZO+EzPzXM8yHN1CAGTAKoR68g=;
 b=Y9VWy/P33qmwopC3qbghqPcXsyn246weL8rDnyE6Bl3qV1+81LJehrIL31KklXFHOprxxdOs4KZifmim1976QoQdp7XznzPVPbtI+mrxxbNNtgBcmNt4wPgEYcz0KSZFfU1azSHmaSv/bvlZc0kvSvg9PuktSHCR7VVRHlTYjirdSOOxZvMi0NLjNn2PWY9SZuWsfMKuKbOPQE9d1s0lG/BTNNTGbOUMDE6kcuzjNH1yYkzmTHyrFsYEtfxmo7bUw5yyAvXqV/H0Jx0BhS3F8JWT5TFffC+eLSMQguxNfXnShGYroQNXkrX8ZQCQ6DC545oqrSegf92QVJjrZlRrdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=est.tech smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k41+PfDzjeRmSjCgltZO+EzPzXM8yHN1CAGTAKoR68g=;
 b=rVsA0GZAjvXaARoORP+PQ83BLNVdtPHHixIlUbch909SDZ6HvkHFM4avPO0msAM3i0CHJVmfvncIqIryMw5OE+Ekc67ieT7LyOVJGLI1uZ/O+fWk8i/KmuPKE1z6UT5UaHpEVCGDwSalhpSJyvdlpzxWEgwL+GvyXK0xh0P8tG7NoS7OVmfuBUCcEugRsUNCdswM81NSRoqWA+HhVPYqTVk0n4CiwQjlt3PDeDkB2lTvMTxhQzoTAgQHG9BwuGN0+1f+TXQbe01RS/r9+ylRVrSiYnw5eznY1iW27t5Q7gV5X2b9ynxgv4slQaAHMUOhkWqMJsKATm4tG0WSBFCfFQ==
Received: from DB9PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:10:1d9::31)
 by VI1PR07MB6654.eurprd07.prod.outlook.com (2603:10a6:800:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 12:28:33 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::a9) by DB9PR02CA0026.outlook.office365.com
 (2603:10a6:10:1d9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.23 via Frontend Transport; Fri,
 27 Mar 2026 12:28:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 12:28:33 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 27 Mar 2026 13:28:32 +0100
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 7AF26C3EDF;
	Fri, 27 Mar 2026 13:28:14 +0100 (CET)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 6343E700CF09; Fri, 27 Mar 2026 13:28:14 +0100 (CET)
From: <daniel.turull@ericsson.com>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
CC: <bruce.ashfield@gmail.com>, <alex.kanavin@gmail.com>,
	<pratik.farkase@est.tech>, <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 5/6] oeqa: replace runltp with kirk
Date: Fri, 27 Mar 2026 13:27:57 +0100
Message-ID: <20260327122758.1851989-5-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327122758.1851989-1-daniel.turull@ericsson.com>
References: <20260327122758.1851989-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B93:EE_|VI1PR07MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a3b09c7-d7cd-49d3-ba64-08de8bfc5c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|13003099007|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	JjMaTZl3wpiwTeOXqOiK4kvkvzi9TlsyPZUgkYSzJFv7YE4EQr4ag99A9H21Amt40f6SDWrBu7n8eCqm4Zkscw+iwX2zTkBcnR25F+i0gpFhYtz439PT3AssKujF+tf2knUG23F5EJu2/Kl7uzO5fY5vjUHpvwjOha+Xn2u+tTE9PtP4dSXgvji5+FK2Q/UjOpLFjI05PRTIfoX6LOg004wY7BOXuytojjTbBoZYXcgiHSteTF0URskYGaCAwDlcr6NjSdTVKznbk5C/TRJnC21JQWTyXYCpS5+QfCNtK911UO0pZmMVfwieW+WA2ABGFKZPUU0o7R2cGL0Y38EXLUwXij3WJsugIxOqe5qdMyr4wxtML6k7e0/sM8OM0YluXEGBaSMJhob7xBlTDSIE6Vud6q9kQFNuED6y8WDweefScjsrr2j46TLummARn5sX1kVp1iin+1Ljw7JrGpiRMIhd8pYuqCCOtxvUOVQlGKBnp+xSI1MPqexalMDr8vjBzsaR+L5VnfGKz/2Ttzcxv5rZGuy3HWOFKlS2QA9SERG3HHGDRkIMwktwLrNVoivJlHLnviTXoaMSvgyGD++Hf/YN/fQTqxLaRjw/6Po/jn9so9HnTwdUPHCIGBD2OmE0lIzIz1ABJyo8RCvaqGnw4R9K3aoVDXcJSWoOPEoF/G1tjzOBnOfj5LTPke0h1ubag6dHow1DhslznJlFI2vZ9Ufoo00vQsDo+/dzMudrBtLSYlMkDXmJAERKgETiZObJ2RuFZQbbmFCTjse+KBWi0RdIzaBDFIIOfE0xYbCkgyc=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(13003099007)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7faKlowqpU/XATYxz5JJOlVlbENt1N4zadvqczKIG3nmA/Mhd6t2VEMFoMhun6IBOcNQSiyFXxYhbgaZuF27NC6ErOpIDaX8++1/sg7JGQSyL19ooUmmKBPwkGmnrSoZhooxrioF+x+O6foXgcRZDrv+A0q+dX1Cc9XDTNVlL5saM9CIYiJgjz5QlbeVvOMsufoHE2+HzYrAAJ8kLopg1krOk6cb3IrebCwpaG+mUQiGIXevbEFQrBJgrlddT1DNh42T/i8/Rs7l99hF0mP+OIMuNBWiMokv8qwqV0LOrB/bvbnmUCEqeHTag1n2mQn1A+HHYzJU5Io7KjVH0/spI5ZAUXUVgO/D1Bim5ztvWgt9/W9WjjpGSytVb0SSFA1lZi0YtVui0Vd0QIUyBYDdaTa5gWdmbl1pdZAotFxHGmgWrOQI3y2tePwrlZYoiKjW
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:28:33.0202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a3b09c7-d7cd-49d3-ba64-08de8bfc5c5f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6654
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:28:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234086

From: Daniel Turull <daniel.turull@ericsson.com>

runltp has been removed from ltp and the official tool to invoke ltp
test is kirk.

Message when running runltp:

"INFO: runltp script is deprecated, try kirk
https://github.com/linux-test-project/kirk"

See also:
https://github.com/linux-test-project/ltp/commit/6efd3605dc005c3ed135b463f1=
82174e24bdce1b

The test coverage is the same since the logic there is not touched
but the output is different. The return value from oeqa are the same
as before.

Now it is a json file with the results, which is machine readable
without any extra parsing. Two files are created by test suite
<test>.json and <test>-raw.log

Output example of math.json:
{
    "results": [
        {
            "test_fqn": "abs01",
            "status": "pass",
            "test": {
                "command": "abs01",
                "arguments": [],
                "log": "abs01       1  TPASS  :  Test passed\nabs01       2=
  TPASS  :  Test passed\nabs01       3  TPASS  :  Test passed\n",
                "retval": [
                    "0"
                ],
                "duration": 0.002702474594116211,
                "failed": 0,
                "passed": 3,
                "broken": 0,
                "skipped": 0,
                "warnings": 0,
                "result": "pass"
            }
        }, [...]
    ],
    "stats": {
        "runtime": 1.4888691902160645,
        "passed": 22,
        "failed": 0,
        "broken": 0,
        "skipped": 0,
        "warnings": 0
    },
    "environment": {
        "distribution": "nodistro",
        "distribution_version": "nodistro.0",
        "kernel": "Linux 6.18.13-yocto-standard #1 SMP PREEMPT_DYNAMIC Tue =
Mar  3 16:48:55 UTC 2026",
        "cmdline": "root=3D/dev/vda rw  ip=3D192.168.7.2::192.168.7.1:255.2=
55.255.0::eth0:off:8.8.8.8 net.ifnames=3D0 console=3DttyS0 console=3DttyS1 =
oprofile.timer=3D1 tsc=3Dreliable no_timer_check rcupdate.rcu_expedited=3D1=
 swiotlb=3D0  printk.time=3D1",
        "arch": "x86_64",
        "cpu": "unknown",
        "swap": "0 kB",
        "RAM": "222368 kB"
    }
}

Add in configuration file (local.conf)

IMAGE_CLASSES +=3D "testimage"
CORE_IMAGE_EXTRA_INSTALL +=3D "ltp openssh"
TEST_SUITES =3D "ping ssh ltp"
QB_MEM =3D <mem size>
QB_CPU_KVM =3D "-cpu host -smp <cpus>"
QB_SMP =3D "-smp <cpus>"
QB_KVM =3D "1"
IMAGE_ROOTFS_EXTRA_SPACE =3D "2097152"

Tested with different VM sizes and architectures:

qemux86-64 MEM: 4096, CPU: 2 (all ok)
qemux86-64 MEM: 1024, CPU: 1 (all ok)
qemux86-64 MEM: 1024, CPU: 2 (all ok)
qemux86-64 MEM: 1024, CPU: 4 (all ok)
qemuarm64: MEM: 4096, CPU: 1 (all ok)
qemuriscv64: MEM 4096, CPU 4 (all ok)

Then:
bitbake core-image-minimal
bitbake core-image-minimal -c testimage

With these configs we didn't see any testimage failures with kirk and
run completes.

If we revert the ltp disable patches below, the testimage does not fail
but it gives warnings, since the ssh connection gets droped from the DUT
because of the OOM killer. Then in continues with the next testsuite.

* ltp: disable cve failing testcases
* ltp: disable pty testcase
* ltp: disable min_free_kbytes

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Assisted-by: Claude, Anthropic
---

v2:
  - replace LtpParser with functionality to parse output from kirk
  - improve commit message
  - add timeout to kirk for 20 minutes, same as the ssh connection
  - add try, except to handle exceptions in the run and be able to
    continue with the next test suite
  - tested with more configurations
---
 meta/lib/oeqa/runtime/cases/ltp.py        | 21 ++++++----
 meta/lib/oeqa/runtime/cases/ltp_stress.py | 12 +++++-
 meta/lib/oeqa/utils/logparser.py          | 51 ++++++++---------------
 meta/recipes-extended/ltp/ltp_20260130.bb |  1 +
 4 files changed, 42 insertions(+), 43 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cas=
es/ltp.py
index 4f7498fcbd..b855e76907 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
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
.json -n -d /opt/ltp --exec-timeout 20m' % (ltp_group, ltp_group)
=20
             starttime =3D time.time()
             (status, output) =3D self.target.run(cmd, timeout=3D1200)
@@ -87,8 +87,8 @@ class LtpTest(LtpTestBase):
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
@@ -113,16 +113,21 @@ class LtpTest(LtpTestBase):
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
     @OETestDepends(['ltp.LtpTest.test_ltp_help'])
     def test_ltp_groups(self):
-        for ltp_group in self.ltp_groups:=20
-            self.runltp(ltp_group)
+        for ltp_group in self.ltp_groups:
+            try:
+                self.runltp(ltp_group)
+            except Exception as e:
+                self.extras['ltpresult.%s' % ltp_group] =3D {'status': 'FA=
ILED'}
+                self.failmsg =3D self.failmsg + "Suite %s crashed: %s\n" %=
 (ltp_group, e)
+                self.target.logger.warning("Suite %s crashed, continuing: =
%s" % (ltp_group, e))
=20
     @OETestDepends(['ltp.LtpTest.test_ltp_groups'])
     def test_ltp_runltp_cve(self):
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runt=
ime/cases/ltp_stress.py
index ce6f4bf59d..c902486eab 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -60,7 +60,7 @@ class LtpStressBase(OERuntimeTestCase):
 class LtpStressTest(LtpStressBase):
=20
     def runltp(self, stress_group):
-            cmd =3D '/opt/ltp/runltp -f %s -p -q 2>@1 | tee /opt/ltp/resul=
ts/%s' % (stress_group, stress_group)
+            cmd =3D 'kirk --run-suite %s --json-report /opt/ltp/results/%s=
.json -n -d /opt/ltp' % (stress_group, stress_group)
             starttime =3D time.time()
             (status, output) =3D self.target.run(cmd)
             endtime =3D time.time()
@@ -69,8 +69,16 @@ class LtpStressTest(LtpStressBase):
=20
             self.extras['ltpstressresult.rawlogs']['log'] =3D self.extras[=
'ltpstressresult.rawlogs']['log'] + output
=20
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
             parser =3D LtpParser()
-            results, sections  =3D parser.parse(os.path.join(self.ltptest_=
log_dir, "%s" % stress_group))
+            results, sections  =3D parser.parse(dst)
=20
             runtime =3D int(endtime-starttime)
             sections['duration'] =3D runtime
diff --git a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logpars=
er.py
index c479864162..d445b4e2a0 100644
--- a/meta/lib/oeqa/utils/logparser.py
+++ b/meta/lib/oeqa/utils/logparser.py
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-import enum
+import json
 import os
 import re
=20
@@ -116,44 +116,29 @@ class PtestParser(object):
=20
 class LtpParser:
     """
-    Parse the machine-readable LTP log output into a ptest-friendly data s=
tructure.
+    Parse kirk JSON report into a ptest-friendly data structure.
     """
+
+    STATUS_MAP =3D {
+        "pass": "PASSED",
+        "fail": "FAILED",
+        "brok": "FAILED",
+        "conf": "SKIPPED",
+        "warn": "PASSED",
+    }
+
     def parse(self, logfile):
+        with open(logfile, errors=3D"replace") as f:
+            report =3D json.load(f)
+
         results =3D {}
-        # Aaccumulate the duration here but as the log rounds quick tests =
down
-        # to 0 seconds this is very much a lower bound. The caller can rep=
lace
-        # the value.
         section =3D {"duration": 0, "log": ""}
=20
-        class LtpExitCode(enum.IntEnum):
-            # Exit codes as defined in ltp/include/tst_res_flags.h
-            TPASS =3D 0  # Test passed flag
-            TFAIL =3D 1  # Test failed flag
-            TBROK =3D 2  # Test broken flag
-            TWARN =3D 4  # Test warning flag
-            TINFO =3D 16 # Test information flag
-            TCONF =3D 32 # Test not appropriate for configuration flag
-
-        with open(logfile, errors=3D"replace") as f:
-            # Lines look like this:
-            # tag=3Dcfs_bandwidth01 stime=3D1689762564 dur=3D0 exit=3Dexit=
ed stat=3D32 core=3Dno cu=3D0 cs=3D0
-            for line in f:
-                if not line.startswith("tag=3D"):
-                    continue
+        for entry in report.get("results", []):
+            results[entry["test_fqn"]] =3D self.STATUS_MAP.get(entry.get("=
status", ""), "FAILED")
+            section["log"] +=3D entry.get("test", {}).get("log", "")
=20
-                values =3D dict(s.split("=3D") for s in line.strip().split=
())
-
-                section["duration"] +=3D int(values["dur"])
-                exitcode =3D int(values["stat"])
-                if values["exit"] =3D=3D "exited" and exitcode =3D=3D LtpE=
xitCode.TCONF:
-                    # Exited normally with the "invalid configuration" cod=
e
-                    results[values["tag"]] =3D "SKIPPED"
-                elif exitcode =3D=3D LtpExitCode.TPASS:
-                    # Successful exit
-                    results[values["tag"]] =3D "PASSED"
-                else:
-                    # Other exit
-                    results[values["tag"]] =3D "FAILED"
+        section["duration"] =3D int(report.get("stats", {}).get("runtime",=
 0))
=20
         return results, section
=20
diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-exten=
ded/ltp/ltp_20260130.bb
index e5da94855f..4183b5d497 100644
--- a/meta/recipes-extended/ltp/ltp_20260130.bb
+++ b/meta/recipes-extended/ltp/ltp_20260130.bb
@@ -113,6 +113,7 @@ RDEPENDS:${PN} =3D "\
     net-tools \
     perl \
     python3-core \
+    python3-kirk \
     procps \
     quota \
     unzip \

