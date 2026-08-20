Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7801EC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 11:04:47 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4554.1787223881151480444
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 04:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=C+9R4xFG;
 spf=pass (domain: est.tech, ip: 40.107.159.29, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7aLKsURKhnOsG5M2ac+vhqb1pNqyYWkIWpCcAK4oeaz8FHtyQvrJJMA5EHMtmntDHCENYeenTmkizOAAmUpmTH9lY0MgloHRYkiMLeDrmmbJMM7qUK4CckUTDHdB3BeosfZSzZMCtHkE2sVAjOTFyYuk+34MM6f1gET82KhYBH4FG3JRXglPNCFbG9Z9uZFda4U5OINBfIcVvYWp4aIEsj+B+UhzykkBfF774pxv5EaSEsaVWcPuB5kWgTQ+iGiKxoK5vCN4Wr0PWadjCZfHxLHvdmkIYkvj9YRCpfMNhRxsmcPz3EmGeQz9yIQOoeQdw3+acXtl+1dwXwusIcMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0OPZEhiEchYHeHE1JMJCRP4//Ynhur1jm9CRZRtGfN4=;
 b=P400jEPeiOFkdyJIezMCaL9gCU918MgYZ5XXWLh3kvyzN5hA/CScI6M6dlWGBjBAIaCzm71Yffjb08TL/aCy1o8wNplYOjeJfTa9PCplICXxAcj78HsfTsTb3O8gkVWqi2+a2xPeYXMgy2e+dLeomlGx9OpOaABPyFAu7KziFslp2f1AbNDDijJLdToRuNPhFkWBB3zxAQsYlS0eoTKKgwigwwtNWoN/f85kb7atUDGxkbOG367XmtY8rUKDqBV01sNQxkPJbEZVsMWPxynovnRD1aNpBhCBrUpzRKCte/s0gST9r7Iilt9rRc18kzOz37kIOEOQnH5h36i9pW4iAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0OPZEhiEchYHeHE1JMJCRP4//Ynhur1jm9CRZRtGfN4=;
 b=C+9R4xFGeCMMjrpj4kdMlP37KUC2P4jg39+lQ8vqeYm3Z8RFXSYON2Pt/ibT81tETHNRyI+NJA9maYDkgaHTFZOiBy+YyuFm4EOspNyLcpa5RumWH3NBg0F7v/m6By1Au8qg7eA0xzt6n/5rPyv77LIKQ2D3K3nv5sCfUEmUPQk7S315AiNGpaVZwBjzUKNUEvixMCikjor+OzutHvZoWCznb4yZNddNMRh9HYskwtsQ8KBOrxAR7lxKd0sBy8j1aUOh5wIWNxuaC5kiknYmREscvqE+mAo2OZjCO7oj48iIRPaezBrBTtm9x3KitNbSe6xLcCDbfms8XoKq8/Ci+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by VE1P189MB0911.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:169::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 11:04:35 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 11:04:35 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] procps: fix Upstream-Status in skip-pgrep-full-process-name-match-test.patch
Date: Thu, 20 Aug 2026 13:04:30 +0200
Message-ID: <20260820110430.21657-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO0P123CA0006.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::8) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|VE1P189MB0911:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d799e1e-64a8-43db-c3af-08defeaad1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tUgY+4RisfO3Ol11T3jfz2TBbrEGaaAlHYz7fcXgzzLYtos45nJQRsmK9BMtwBoYCPcoiVDQ7k/ku2xqpES0pW4Jqivl54SWj0zrCENLYpfJYcOQBSjDfPyoVR18A9xk7Y/YHnWDUlF3xQpXWyh9SgluV0DBcepM4+f4aDZncsaFVy2RAxjB8bzm8PRU5u8b+9v/NTGEFa/QKzEbucFhSz3b+qArhOCDOfQ/CEw/sPN8oHe9kP/7QeLi6mXCSeLXj4xR6hb0DLwwXjTLB/8nSBv2OL/wMgv1Qi43h9pBSlkezWjOPU8uL90tNeW20J31HqBnAsyBwDIw4dlxPkhwddNNqD2q5z7hQdgBADU1h6YIofgCmULWi8bS+THbXBN0/T3MvzSSUP39CMwy9r4+D9AjtwnDNEQ7qMy9dxgt/e8XZ4Vc3upFOzLAmFIj9aYnwBWAuPMYTCGUqphkQ86rHyjPcfzolTaH0VFvvX90usU6XCPaKF2f/Q89kshcZz7/ujUVf5b1ssoEEZA7SK/3hcti85EWyePczGbAck1Mvk6NaI0oPT8pJlKWE6iF2chOIHPObeSCBoMAQz/M6xg3KU9p7yI/iqo5pEhyKZMkvjc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CLtRQVppr7SIN+usGMO4xIlqdeaKnb17Dldsg7QVamXd5w4pKFgT9RSuQXkM?=
 =?us-ascii?Q?iqB4UG7nj7dYhYWjJUufGBgo1LzT5Q6xGA1qzrbsniP97hmkpvTDFPViQFnx?=
 =?us-ascii?Q?R2tYhmHPLGkJxfX7ETheByqsmCAnsFPTTYQBjvi8rOXvDEOaUgl9cdT8YERl?=
 =?us-ascii?Q?phlMpv8OMM1XbpEYbV/eHTKt7z9IQjjH9rSLnisjaMXTgqdIlHz9R7ilr1Mi?=
 =?us-ascii?Q?y2y63iUDY9FdjQKA93TyfGiHl6NF64/l4sR03WL5WNfQlEGTSUcoyU28Gm/K?=
 =?us-ascii?Q?+wq2Ch2iyAwoalsD5iLvRPgfpAODnwHZmQ/DYoDHlM+I1129v6FJ4dnfpP1l?=
 =?us-ascii?Q?iQFAx7cNNf9Czm8QjGZJM0zzxlFt10HbEjr/UxQrqWvR3VBv9i9Mfj+22Zjx?=
 =?us-ascii?Q?IKqqBSfmj63IrCE22qAZYgAc/4tAGb7JjQNoyARMHT0zToNoKfGOVJGBfcRa?=
 =?us-ascii?Q?hhapc/cCTCrGp5uPkDYSooho7DYY06uK4Z1TxVu9/ZjsKIvO+uISWPh/bt9o?=
 =?us-ascii?Q?5i4cEI9rMm0IMl6KiB3AqWN9gVOPRWv/osO5YqvfU+CbPpRir7tVbhTo8GIi?=
 =?us-ascii?Q?buzpHJdb74dC3GRHXtjnDg58vS3AkwfCjh80TTZt6rcpZrOUxyOOgblINprI?=
 =?us-ascii?Q?6bvYdc4Bw8zuSCHgfokvK3f25OK2AJ6qr0TrXTMj8o7vx1PyhRH21mhhI3uX?=
 =?us-ascii?Q?4h5c+1inAlBn10ZNchHJx9g/Xx/rN1ivE7zE69MbtkZjPCQ+PMvLkaf5kxl8?=
 =?us-ascii?Q?xsC9AgYXjcqZyBh543KHQaCFU/f+wGHaMVAJKd1IyVSCBpVsKFwPW3787vFn?=
 =?us-ascii?Q?+plBVAAYnP7NNBmoUfPbm23G9SdviMeBQ8xgab/Bu87/sObODHNtBUGwLzOC?=
 =?us-ascii?Q?bbOxmOuQQjN83hsBDpmlIjezjloARx4aiPP13yJGtthgYdPUMRmnnDLg5DBQ?=
 =?us-ascii?Q?fjLFgbLQiDs0VSs0NsEWcsBZdgGjYvaf0TnTZVZ2Axdc/mmWEfPtxqJwWVBf?=
 =?us-ascii?Q?fSyl1TDf5sMJK0o+JRAQYatz7KvQ4O5SN8vpcQNOr3lnuksqkwoI8nJNtX7s?=
 =?us-ascii?Q?QPGUratu4N5FDVkWCSClWhwkyKbF2xNgAwHBlCR+C46hOg3rkfPl7g48dbYK?=
 =?us-ascii?Q?efc2vU05+bFHNqFR41rwawt/dzwDmPRoANULs4LdKVqG1bNVKl2d4a58VG4Z?=
 =?us-ascii?Q?yDFj6vYhlIFUhDSlBR3EDO1dkJI1SEiXsNKyE2wpMlrz9/sjMu95l1CJYvdb?=
 =?us-ascii?Q?Vc6YBz85MZqAVqN/eQz63fWxtn5tTh5EiJTpKkfq8HKqdIIkoUD83RElX/SF?=
 =?us-ascii?Q?0cZv6rxeUloB671KKKovJW6AwFe4eXLq1dxtN2KCJDi26z5HVlNE99U3AeWB?=
 =?us-ascii?Q?PQHzU+SkmsTm2GrNCWB+gfZTVA9iPSBTud9tE6QY0DhStsiimL55AXNcUJAJ?=
 =?us-ascii?Q?lNSKjzz/TV/SaFWxW09oCKWAMDXUPgg4bpdmAh78yiz+NM2jj5ClJ014N1V5?=
 =?us-ascii?Q?vrHAEnISKNuzuYOMCn7djNJKDG21rAqkx9UfpRxXKag3GWYqG3BueqRSyXVO?=
 =?us-ascii?Q?Sbqdga0/qzawblOoIjpbA0R85sSR/gCQX5IbbzoaAMELHIfzzumb7PKuvNTV?=
 =?us-ascii?Q?O26nwv6I3sh8sSfe8qzysm0Dg84QKrRyFGRSWja04wP1LOdwMxfPlIbbFBR3?=
 =?us-ascii?Q?CjsXDP3ykNnNL2mcQ94dW3uZ9lummo1ie4YFe8jPVLxGKo5Se1NzEB0mYiVb?=
 =?us-ascii?Q?/g/ZQDkaLw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d799e1e-64a8-43db-c3af-08defeaad1ea
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 11:04:35.4149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGL63OYxn2WcjJGB4WlfzcDVHrJ9qgl4HqGW8V5w3c6R5+cdYRXIRX+7IwTiC/4FT9u08Ex/0qPLWIk8OkzNsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1P189MB0911
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 11:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243853

Update Upstream-Status from 'Inappropriate [OE-ptest specific: ...]' to
'Inappropriate [upstream ticket: ...]' with a link to the upstream
issue filed at procps-ng GitLab.

[YOCTO #16290]

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 ...0001-testsuite-skip-pgrep-full-process-name-match-test.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-=
full-process-name-match-test.patch b/meta/recipes-extended/procps/procps/00=
01-testsuite-skip-pgrep-full-process-name-match-test.patch
index 43c930ce08..7c2a4ea3c5 100644
--- a/meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-pr=
ocess-name-match-test.patch
+++ b/meta/recipes-extended/procps/procps/0001-testsuite-skip-pgrep-full-pr=
ocess-name-match-test.patch
@@ -14,7 +14,7 @@ are reliable.
=20
 https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16290
=20
-Upstream-Status: Inappropriate [OE-ptest specific: fails only under QEMU T=
CG emulation]
+Upstream-Status: Inappropriate [upstream ticket: https://gitlab.com/procps=
-ng/procps/-/work_items/435]
 Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
 ---
  testsuite/pgrep.test/pgrep.exp | 6 +++---
--=20
2.43.0


