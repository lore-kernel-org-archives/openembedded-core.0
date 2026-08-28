Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB11C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 12:24:52 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5047.1787919884563544573
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 05:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Pk3wLhGm;
 spf=pass (domain: est.tech, ip: 52.101.66.13, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUCBGSvwbl1Ku8fNQfbYbS829+ScahBckNByQn3IMvGtn75LF7t8ZOtt2Liqsl4Ly6ROYs2cowRedzZu37SOFDnWIy15c3uBcZLwD3UbQhhf99s9H/4IK0MO0mqlv8rhHd5OROqnpf7mtxsDUyAW3e4nfmwoDCjPHwEqIsVgfO6i+Wwec9uw5CEAnSdlhK49y7/pxOu6AiFIP4sEDkEBFQ5goPt2kck/MZVdn3KMxvS9m3u23oiNULiq8HLJRSGmZoR8CEZtc8Ie5fFw8xO13y5tEVL0jH7QFS3DSA9Br+J23o3kHT+lOXNK1oap8zrO7bal0l21CCOqwa+29RUMeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfAvYDjrpB+Oce9yC1DxrAQrEKRCG0sMjRulHtNTt+M=;
 b=rEZhdTs4FYpbKmXauLgxzVKyRIR28PSq0JedzjvckX38lyY51yW5ETGFNc/7U+6lxPl3r5+VOMlo05nqvxZE/CfZqTxygHwtoXLyxhmukHVYIEJPbfrFvhbE2ZIpr+gm0wnovjA+eH7WeAyZRlHTdq8rbUoEJdrS0aj3iFOK5WiCbdiMPSAT71el8Uqxysb/anFbLaewUgcArHvmb/CjyWRvomMRiAi6XUJXNpQMLmf1oqhJIZcWMXSUXaaMIHWhehve68Fj9GT882nUYtSlYyjwNu2NiR4DqukSa2Y0ZQIpzBK24kkt2YgTTwTWZaXBEbHKgIMFmg50y7p0zc5lIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfAvYDjrpB+Oce9yC1DxrAQrEKRCG0sMjRulHtNTt+M=;
 b=Pk3wLhGmJg5nvde4cCnE8Gkf09RiGi6xtMtdbybodUBgh+C0Jg64l99ul7sZqmvVlJNqMzEibc+It+e8vNT6M9BJDnouTqs5+/iACMZPcREljGYj+6ukemc4yJeRUiQbJq9Io/50y9iYNo9jDzqwsDjeL5H/RMPet7ucKlKg+T4XO2UsL+Yb8E/U2p1hq4505dezygmnVtX8bx/U3NWdKVddcP+wIScObs/K4RZRHH3wfCxTYNDXsl6F8ZaAsny3D+QHCFX/no0kyqWu9bRr4T6jVDO0H3KAEHPpc1QHOIUtzxXW+K8ZGs2go6EBrr0J+h9c1DSm33yTh3F6r7GOIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DU2P189MB2523.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:495::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 12:24:39 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 12:24:39 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [OE-core][wrynose][PATCH] procps: ptest: skip flaky pgrep full process name match test
Date: Fri, 28 Aug 2026 14:24:07 +0200
Message-ID: <20260828122407.32772-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0012.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::7) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DU2P189MB2523:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ceed56f-b23f-40dd-2101-08df04ff5463
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|3023799007|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	fYaBkzIYSFHlSHI1bNuzypdGyZ7psYAyGN/MUmM6ffuJSQqnitjutA6INzIgZ8qN3eL9CyD9q1sbteoVB9TakQFEDhEWwCEy5ZGXRdabkTjR8Qp9JsdOrCdi0C2Xo3IYYUxma/B0Q064z3e2vFwi/nAYI+ULSJ4dXlq6Dy3MLY+ZCFQSOSxAMQcvqCqja6hWWunDlnDfkK/+eEwTv6InZoEDZJYXMQF9ikxTG7qjiKhTUPWNneWEsrHwGOVucS+VCpp6YjsK2fYpk1uj8fi+4w81sX5BhNt4Eam1B6DV+etJ4yCGhUt9xsVc4LN0ibk6BW9ZBD7EthoVjtXxA2FWHPx4TUqKsoz1HbvfflLK5OjBpaqWa/C2u77MNLHSazMrPUojaeBZU0tIhI+KpM96xd/iuEIjOp3D2o4UIGbUNECCMLXxFI477/QzWFSdOGjhVBjiew60+phsHRt5hGUkMAOTkby+VZ0FCffbejiWZc10ZQkqrr9OiBQ9+EgRGImLB0hrO8T/UxeAyjc464X9J/pHbGHTLvrh54nZDhYMDACOOuhOz4p3z2EKvilGEoaKbFv6iI6+ufd16utPrfb1F/XVxnEueezqiv5eZmV92c0Jh8fL6Rem6XR3uDqUfYMT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qtWLcgiM7VBhoeXyB7X3ooXUTcX8GeQIo0m4b54SZSGhqeYDlhiIWFIj/sB8?=
 =?us-ascii?Q?8pRPJUG2HZv58ulvZSRgmWSclqJ6poZh6xZfKTAqWZK6Tqdb3QfTmXBSCNuk?=
 =?us-ascii?Q?D4OUhR1s2qfNgptImu4n65/vnEiVvXKTdfBSpkgDz0Jfd+xprR0wI/TI7WDl?=
 =?us-ascii?Q?Cy0tpzyc9R276KkIrX780xzPNUdnZZrlIWmXWoCkW+Bv7UipiCTBB0S1b09X?=
 =?us-ascii?Q?MJzWArRSWvgg5cSD3q8sj7U3WnAxAliN7LzmwEAgBT3MQy07DSHFUS3V6G9V?=
 =?us-ascii?Q?/QF+XRnIltsEzm9Eb1zBdhgd3nlCeG6sEIaEGcifSe+xI826PouMCiSkHLMN?=
 =?us-ascii?Q?ZdkxGwZSMrLyJUcG4o0oEiIcpGx1/h7WlH6nVTy6l5eWTTJ1xomcACllEdON?=
 =?us-ascii?Q?lRiXSPvchAZd8OOKC5HjhPQ+YWWgkcw7OKvo9k7FvT1F8OiC+YIcF/s9YwGE?=
 =?us-ascii?Q?WUQ/7GBfgU2Mu+bot6OfMPTfRiE4L/7wicaCqzvnRBL8LT9I7nCBNaIrJ+IP?=
 =?us-ascii?Q?JgUZscinjJ/ioKs0BRv0hJewbv/K6SForTYsowYUDyUy6PyLDx0TrUAydfmG?=
 =?us-ascii?Q?yIu1ZkO22Dnpns0N5A9t5ls1o0RKW6N3URhwOWGPqPkAbvH88P88qXYsgOwo?=
 =?us-ascii?Q?9bTidcU4+9LtismYTrn+oEXQUFMyHEQJ3qhw1fdEDvJ/AGvKUNaKOwaPXu7o?=
 =?us-ascii?Q?nTaWq/IhPsTTBPBrB2FMsnFyctF/av8r2VREY/1I8BH19JYjBd9c5Rd3vEOd?=
 =?us-ascii?Q?8fUZD6J5ipDDFlrRhuq4IRIZT7+WA2zogBRmY1egvFTKzs/dNIR6ru2uFmJD?=
 =?us-ascii?Q?ZBcN0LiWUEuxPGm2IkfBQ3fJQOUxk0W6aMbJ+4MXZfE6fItANCBNmQykT94L?=
 =?us-ascii?Q?q5d1sgVPllDOhUXx1J6viqcF2fl3RV9PJoA6sB2EZ3VL/0vyDhLjUqObO7G5?=
 =?us-ascii?Q?kHXxhnxi35MCex4EnxAbXDQ9WGKhGkXQZtExb6V+miTwusiESm57Voq0WMUN?=
 =?us-ascii?Q?45Jv1wn8L1Fxv1aS4Mt1O7MdryCHg7+mVTkEyl/cQ2u/l1ruz30qFzVQn72r?=
 =?us-ascii?Q?MIzknbKwnfriN/n/Ffg5NztHi4eSbQrz4iVHqs6wM0C67J/Ml/fZPsxRv0qx?=
 =?us-ascii?Q?3CFIqzG4oPjtJTjQzKxdDKvLtolgntymYxNr72Bhs0RLMA5xsfMVQTULv7X3?=
 =?us-ascii?Q?owG//Fk8iZ0Zl7OFZ7UxBk67M+yQbr02/tKsFZB43KjunA15iiu8pjE8+Apy?=
 =?us-ascii?Q?UBpMKAFn5B63+T1DuxNXgCHfQuJm3f4o4fgfYF8Zbq9C4F93m/7tuZvAfORu?=
 =?us-ascii?Q?JnZHY9Kx0ANiZwYRgqDe0l1EJER/mbYVLnfyqMxRNVaYCr6BJKAAFZFhMWct?=
 =?us-ascii?Q?cMZ+RqhhBaUFQoFYaPkYW7Ha4EZ5g3dvUTMVDCCG1rB8I0Jumj5bN7Xxg08g?=
 =?us-ascii?Q?OFNowJ2gY29vgGa/ENAtRRZ7VP5SDmZQ2hDMJxalqNtwH0rWGx3bHzfZqeZ+?=
 =?us-ascii?Q?g/UGuRF46Rn4GBTMFO5Xcd0Mt8/lx9evFDOiEP3LENs04YwSGo0EKjUGeahs?=
 =?us-ascii?Q?i8XYKu4IRkglMHsEDEHROxaWFLMu+wv4IXG3ANyEpRuXLTQb2Gf9GE07Jk9Z?=
 =?us-ascii?Q?eTv7n2G3FAklEaGS0KHFHnLM8P7sEYaPv9ExDj1fKNtBMhdKZsR0wKkTI1R2?=
 =?us-ascii?Q?hmQgVi/J0AoEgzFQQBFXf9Ez937gneR95udkjjv+wy4sf33qSsk04E6Tyye/?=
 =?us-ascii?Q?Ga450Nwnlw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ceed56f-b23f-40dd-2101-08df04ff5463
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 12:24:38.9844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yqrNmbJgS+eM9g5z06eLKuVK1SfLE63CbU8pYP6ZWUmWBa7LaHoMkAHzRgC2ISSS3oalhD0qQMDlznHHuVMpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2P189MB2523
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244537

The 'pgrep match against full process name' test uses pgrep -f with a
regex pattern close to ARG_MAX in size (~100KB). This intermittently
fails on qemuriscv64 where the process cmdline may not be fully visible
in /proc/<pid>/cmdline at the time pgrep reads it, or the large regex
match times out under TCG emulation.

Skip this single test case while keeping all other 30+ pgrep tests
which are reliable.

[YOCTO #16290]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...p-pgrep-full-process-name-match-test.patch | 39 +++++++++++++++++++
 meta/recipes-extended/procps/procps_4.0.6.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-extended/procps/procps/0001-testsuite-skip=
-pgrep-full-process-name-match-test.patch

diff --git a/meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-=
full-process-name-match-test.patch b/meta/recipes-extended/procps/procps/00=
01-testsuite-skip-pgrep-full-process-name-match-test.patch
new file mode 100644
index 0000000000..43c930ce08
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-pr=
ocess-name-match-test.patch
@@ -0,0 +1,39 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Pratik Farkase <pratik.farkase@est.tech>
+Date: Mon, 17 Aug 2026 10:00:00 +0000
+Subject: [PATCH] testsuite: skip pgrep full process name match test
+
+The "pgrep match against full process name" test uses pgrep -f with a
+regex pattern close to ARG_MAX in size (~100KB). This intermittently
+fails on qemuriscv64 where the process cmdline may not be fully visible
+in /proc/<pid>/cmdline at the time pgrep reads it, or the large regex
+match times out under TCG emulation.
+
+Skip this single test case while keeping all other pgrep tests which
+are reliable.
+
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16290
+
+Upstream-Status: Inappropriate [OE-ptest specific: fails only under QEMU T=
CG emulation]
+Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
+---
+ testsuite/pgrep.test/pgrep.exp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/testsuite/pgrep.test/pgrep.exp b/testsuite/pgrep.test/pgrep.e=
xp
+index 54e75df..66edbaa 100644
+--- a/testsuite/pgrep.test/pgrep.exp
++++ b/testsuite/pgrep.test/pgrep.exp
+@@ -35,9 +35,9 @@ set test "pgrep with : delimiter"
+ spawn $pgrep -d : $testproc_comm
+ expect_pass "$test" "^${testproc1_pid}:${testproc2_pid}\\s*$"
+=20
+-set test "pgrep match against full process name"
+-spawn $pgrep -f "$testproc_path\\s+$testproc_arg_str"
+-expect_pass "$test" "^$testproc1_pid\\s*$"
++# Skip: intermittent failure on riscv64 - pgrep -f with large ARG_MAX
++# patterns can fail under QEMU emulation (timing/cmdline visibility race)
++untested "pgrep match against full process name"
+=20
+ set test "pgrep with matching gid"
+ spawn $pgrep -G $gid $testproc_comm
diff --git a/meta/recipes-extended/procps/procps_4.0.6.bb b/meta/recipes-ex=
tended/procps/procps_4.0.6.bb
index a9ec3f39d6..541a8cd99c 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -15,6 +15,7 @@ inherit autotools gettext pkgconfig update-alternatives p=
test
 SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3Dv${PV} \
            file://sysctl.conf \
            file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
+           file://0001-testsuite-skip-pgrep-full-process-name-match-test.p=
atch \
            file://run-ptest \
            "
 SRCREV =3D "4dafddf4c3f4646caa517f039a2307e92657ec93"
--=20
2.43.0


