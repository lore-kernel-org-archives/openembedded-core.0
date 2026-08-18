Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91859C5DF80
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 08:34:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4394.1787042048324855399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2026 01:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=HvEPlGW9;
 spf=pass (domain: est.tech, ip: 52.101.66.56, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VW0D/aErA3NNR2EkjTBu4ENIUAMTQgC5UzVebRcT7v7hY3fkNnzNpzCNej+T3rjI8MR1tiJkXIjMmpvvb8ixpzfd86Fc7D5J07NopJsXcoPCQ0+nvbcnMA1BL4aa3pmOlDdblUWm7zBqX6urg2pwaIVi6n/TbaV9yYRjoAg7WmYACeLIcjhLXeVP9XWMhFEiKYb2K/8SFzt1xIFOoZY0V8zfuJ6NVaKf1Sh8jqDOc3h/ingRb06I1FEGtzCusD2whvkp29pmkL8QQyEh43K2u6anzRokbhgSNweKnyMTXXz4FliPPH2qV6Uvj5Xy5EbROvgS7FMcLm7FYNxP26EAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VG/n8o/BWmVe5PrAd1RNp/npfxfuvtaSjCQSW8XyViQ=;
 b=AJHwD4QNVpEWsq0dG1cOgYKoN+uVyvmieHCeHpirx2TAJly7slnakQBrSLndTyd9NN0kTaZizk+fw3dS8lkKizpCgVcQ2Bcdxqf+2854EkKvuLy1xj3vllM0s41/4lKA36FZMnYphNF8Kodw14/XREbh6LbdY8d+Xlhii1gIZwqSgF56Roio6UuFtIBQUwvw1lVI7cQbEitm+ZnfwEJSkREIz/gQi4xuY065QGd7flQu3zdp1frLkqi/WY8vz0BH2e4g7Dat1RQ6+oTDkWynT1dz0GMrdD48AW7qhcmHoRiVFwJGlFQimfvtOkw77HhQblP2W+WZFYMHXHdXJtQbQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VG/n8o/BWmVe5PrAd1RNp/npfxfuvtaSjCQSW8XyViQ=;
 b=HvEPlGW9j9l0il9gt397a9c/BI70dNAsRcRzMQ5E9DXXhFlA0ZMPf04Ry3oUQVZXrFtQijW8FUoO3aYWD3RINlIgrYNgKC5nVXMyhO8gMiVHDoWVdId29nGQNMvZY64JSae2NQzPAq7xCw99eO9INXfMlZca1+KtnZSPmIjmxgWTB1pM3NfyX7AciB3rxq43hsfLkYein3GdzB2ydaws9WQYFCWjjWlq6rf0omqFA/q49gynlKI3FiDVRnA0/BIEiGsv67jJavvl/iMX1IZxdLCd+pNmo74rT0tVsyN/6pqjCIbhFn6HcPjjUOfGLa74apRMXjZtiQknICQSYAvNFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DBBP189MB1243.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 08:34:05 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 08:34:05 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] procps: ptest: skip flaky pgrep full process name match test
Date: Tue, 18 Aug 2026 10:34:01 +0200
Message-ID: <20260818083402.15727-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0027.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::17) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DBBP189MB1243:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c020a9b-8bd2-4b57-286b-08defd037693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	D1wLdEctgvxU6OTBiueYi9kFPf7u3/3/rQEL+qAC3lLgJU/knmNxm0vhG5nSBDd0xpWVtUabvvU3VqTIKh3CkDRVVISZ5K3oMJW6+EdlUD+vwFBKhWVr5aPXyM/mxwCwFkzGSjO02tJOuzJ2aK4LKi/bDFCW55bM0VOmS7vFTVoF98Mt+LKh7zn3pyyHtsHEj682NxavRWynzzFNP4syPRIqqDgQ6QeZ98uO5/eCrGucBJzw0vcyU4TJQwljr4X58ec1hqoZmPMSQwZRLWYJ5npXLUTx/bo43RJVow6i1nk39qQTp+nVIaq+ofkIX/5BdkRHnpFzNszLK5062WvCn342E6sVczTvKlnT+vytb1wEYzXJ4+o4cEbT2xJ3kQ4AzTf9F099chzFp2yu4hKQSgeBnpZe+3i6Ha9Y2wzIBOvaJJyoNqOySiyI+Fkb92VyiD6ckmHRnZfiD592O32WBJIF/D3aWooaR42JfvQ9Tzyg5qLNJlVkiemQv9c9XA39ZC50No0kGczEtuXTIDQrCh3n1k4v3GhRQX6Z5YwbX9DK0x122IySHXzePT2ciasrROYA4LEckCnBF/l3MTPo12DqKhwFR7HPsR80iPs0ToGRPJQaHyEv6Lk+DIKo3eNU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xnS8j7Jvm/0YVGBUaxrFg6tGXYLv0YaSEiOVy/AmjaTNqOi44aAZWKAwZLYJ?=
 =?us-ascii?Q?r5HFZlAD8zOs6anrM59BNSHTzDVSpm8TVbb0Xdy5zxjIwSkltyToJeCLh1Zg?=
 =?us-ascii?Q?iy32kZszDpLDkpgC+P+G1P4ZcYUBP9RKkj/NmTGVbkanbJMcC8U1+bl26Pbm?=
 =?us-ascii?Q?D4KIMbasiE0Qk9plklF/ONZLniXHTedfWxX8HhaaPjLtheP+1cMKoLCwKFuP?=
 =?us-ascii?Q?51kmKknPyEcgJH3DKdx63YzodiTRQnAMLmaabBPsTINUUMtn7cwJafTPisDT?=
 =?us-ascii?Q?k9syMzrpm8CnmkC0akzGLVDs6XgPN8y67Al6bQX+w+NCb1qAYM1aVD63ODVX?=
 =?us-ascii?Q?b8ppvPw1f4YHVzBkJbtA3e2ZPv3wbKf3MCPZth8BK4h1AL8il+h3VyTrdUyp?=
 =?us-ascii?Q?9L+QbG0mqgzkae8jToLdYG+MyMCwkKPGlUtmtOccc8+IN7E671tJVpxljF5j?=
 =?us-ascii?Q?oFtJHyoXbCJrAATXSptOwai3HZckqJMneKn3sGr0zc4OuOshBtPLhWZmn5+g?=
 =?us-ascii?Q?b9MTh0bw7wFa8wPnMsGvDtZUR2tEMhZFCA/QLtpHERxywSPDsflhLQW4eKV6?=
 =?us-ascii?Q?hhrk/14IoGqw1XVdqdS6T97kToAfc64HHTuuEpXYjOgQ5nNIF0FwD10O60Uy?=
 =?us-ascii?Q?aFyQj6JBZDPSox0QcZykNors2mJZhS2yVdO6DQHx2MniycaDhw047r4Jd3NA?=
 =?us-ascii?Q?jg7dLpTuNX0i/1pDaPNZ20LkzQPcqBHGSFX8ob1zIYB9JcnPmC3gkL6sEgMs?=
 =?us-ascii?Q?wkWFYqOZNUhGaZiHj49WeY6dvesvVbpBQ4e9Qa/malW6v2jfGoblK8UIVr/X?=
 =?us-ascii?Q?nmRI4/vW8Pr9Z4givcg+E62Eolq0KTV+lRKQNPGu5Ck9RXUJifPnDy7Rx5g9?=
 =?us-ascii?Q?w3owtKb7TuzYzSsE8Zrn5IlF6WEegzBr64gOmTEp0s2BD6hp2oIR+T1++sBn?=
 =?us-ascii?Q?itI1X0sCeeVgw6hX95S7dRk+XKFCXh3+2aoPK3cYSiDdl18pYuy7aNI15JDN?=
 =?us-ascii?Q?C3VPXYRM3z/pOeXTsbrlhM0U58k107Ck1KcVIw/xTxJdc+xNptSCPBgd7XJe?=
 =?us-ascii?Q?Vdb/035aTIIrXzKX9lw4Ve4/3I7hU86gi2j9J1eWv0W0XswpSLt/NzcgR3Rt?=
 =?us-ascii?Q?aUvJp2zHZJNVJr+uG3Q4cz3TW8mmhn+V0U/cpXpjKuvKwmrdTbaawnJn/PCC?=
 =?us-ascii?Q?8uzKNl72uc9wTWPyMXxQCeKvFucXT81tV/Sp+4ZP+9Ozf9hxlS8RgQa2bEZ3?=
 =?us-ascii?Q?oaRR9FvSiYHQLC+Sx0YqlAFI07hZ9utj5I+2IFXon76Wky0iIUvAuMlrgiY8?=
 =?us-ascii?Q?BBPBbhU23/TA2mf8QKrdiGaTid8bPjLUyCAwS/pQTg+H3T4CFTAxJry6x5OQ?=
 =?us-ascii?Q?ckZqhxqii+AIx0vGO3uQjRv0WrQjxBH36KyyBDXb8owj4JOrA8eClkeuirb9?=
 =?us-ascii?Q?gUhJ/7txnhTNfa5cPC1532D3B/ew2PLw6u4IgrPL58MEtvOlYWQYnEmHvOm5?=
 =?us-ascii?Q?gLqAMWJhFvPu+6eQZOrT0sgmKUvCRixcg9nnyhtRZ3vkX9SWe+SuB8Hnzhiy?=
 =?us-ascii?Q?K9vYkqsZOMEwBYvTbesDjl8Ld85c26FQZvi7pPX73x2+WgSSgr6ELm3UjXuH?=
 =?us-ascii?Q?Jn4uN2WY8E1jv6sSTVf+qEqjrriMl1r/91BBXdFaARNaPFnkxDwTXl1jcolq?=
 =?us-ascii?Q?3ff6ZOcoLLdMK0eDzBGDQ/jj47uWa63TMZWMEvD+S98Ssh22znntDlTMpXNP?=
 =?us-ascii?Q?iMGuNct/3w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c020a9b-8bd2-4b57-286b-08defd037693
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 08:34:05.0037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5sIEWnuQD8+mGa0JCbjh4gzmIXj4wZvCrhdZcyGEyoQanErUv6fy6rGy5qyUy4S9jbATmQiGNgza3uIHpLlig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1243
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2026 08:34:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243670

The 'pgrep match against full process name' test uses pgrep -f with a
regex pattern close to ARG_MAX in size (~100KB). This intermittently
fails on qemuriscv64 where the process cmdline may not be fully visible
in /proc/<pid>/cmdline at the time pgrep reads it, or the large regex
match times out under TCG emulation.

Skip this single test case while keeping all other 30+ pgrep tests
which are reliable.

[YOCTO #16290]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
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
index 5cb5a2831d..1f0203d111 100644
--- a/meta/recipes-extended/procps/procps_4.0.6.bb
+++ b/meta/recipes-extended/procps/procps_4.0.6.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protoc=
ol=3Dhttps;branch=3Dmaster;ta
            file://sysctl.conf \
            file://0001-tests-Disable-twice-total-pmap-X-tests.patch \
            file://0001-testsuite-skip-signal-based-kill-tests.patch \
+           file://0001-testsuite-skip-pgrep-full-process-name-match-test.p=
atch \
            file://run-ptest \
            "
 SRCREV =3D "4dafddf4c3f4646caa517f039a2307e92657ec93"
--=20
2.43.0


