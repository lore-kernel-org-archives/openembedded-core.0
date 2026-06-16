Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28597CD98E3
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 08:25:33 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149171.1781598324624140879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 01:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Qo0cJaY2;
 spf=pass (domain: est.tech, ip: 40.107.159.71, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pFI1f9fXFypZwHtRQCUYny7my0ovFWPLufpvLztrjKp4FqJ1imiUcVAYcV01Xr/KkAsSwMGDvfFjAqRIM86kxbKLkgffHnoHwFc0QHprNFt826wqf/lsNqm1ZpPBBtPHPiHX6DBJn4dqLkRpWgq+sDGd1/X1sZQFbYlOXhVagO99u/P2fEMvdXixe/okWwX/IAeEJKD42zFiKVUuQx5s5YXaVa/EXP/c1uZfPL0HDlzqnu21piCZcc7YsFM2YCXyUjs59Y7tqu2xnZRO4YK/t3pQ2dpWQ5glBpAotp9XD0Ks1YoVeiYw9BzGmXu5XZ8CsrYh6wRWtQimS/PUM11fOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIhBoRrJhkyiywW1fSzE83TUNiXf0OC3ice0sndvGFM=;
 b=yOki4dCiU44wKZ2pxTiO4EgeothWiYRyYZR7B29YqbX7Cpu0lisg5IkrqBDU/nfQbyMZaIB22U2d0LWQBHlIvE5DfuGb5Ybkysb8SYO7pX/AZTzWU1ET2NXYmWwAOhjKXN+pXC4OZTnboJS/Wxnk+6c77jndK3sgLryBgUxqi4xAWlJyv6lT10xM+W7CukPNtO2BLeS+SxubCK37LwneSERI7ruXN03tWxn32hBjQRFjzCYfJjJFV3MdWsK24IfR5cwethX0Weu92q4qqt+PpqR1A7Z9YmBLLcPpKODzNKOWtDi7suXlzsU4SAlzHDZKrCJqzSUrq8RGh6bf2KeIIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIhBoRrJhkyiywW1fSzE83TUNiXf0OC3ice0sndvGFM=;
 b=Qo0cJaY2lhIn+Q/rkAwtz7Mjf3WqtI8XWZKHjNfNBUGfS06usgWBvXHst4TyOJJ/vruUmdSvYga9BlqC+6b7SKQP9msohsQLQrdzsSt6xPMzmP5KMzQQWBjrmM0ZfyQ1PGrw+wYl3CLwRtrTTIucvFsF88oEsmxA6G1EjHkL/ezGGLV7UFrQ8EkBKFaiFqjIUMKi2xHdaUHpNU29WTJPDF8W9O7ROC0DM+NpE2kmtFaYsGhZC94DLPYmm/Ij6dWn0OpoTNxKnq32d8NOt2lr6hYWN5qbqFQ0qHD1+XLt74AnbFVcD830CKgsKP1OMPLAT3ibP4O2AkaIEZ3hfJY3HQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 VI0P189MB3317.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:2b1::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.18; Tue, 16 Jun 2026 08:25:19 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:25:19 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH 0/2] package: replace copydebugsources shell pipelines with Popen
Date: Tue, 16 Jun 2026 10:25:14 +0200
Message-ID: <20260616082516.1553768-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0072.eurprd04.prod.outlook.com
 (2603:10a6:10:232::17) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|VI0P189MB3317:EE_
X-MS-Office365-Filtering-Correlation-Id: 59733b31-7ba8-40e7-d02c-08decb80ccff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZRbs49SJXcxhqsHUhJYRtQ6iM6EH1JZBV1YjBjzUttkKg8c3G2KwjaeFYfe7IiF89qlMBMzB6aGZNVukaWDArCaRFcMeZXSvNuUHrxPzsd2Zv5Qdpl2hT2Q8dCvxjZt9ziNCX6EKX7ZeYuEHGtgs0+c3YlnQoLUhQHr1WIzFHjclyCmqmd+4+yacqb3EfmNQ+aVP9BmHqmHTVa+6+1sBXH0oZ8VcFJHnnPkxSrbEyZDWOUTRfCe69EFftoZIF6qyYaodUBJruX6FA44WYkLDmLTDmAQXtBZ+U+4Vi0FnnJ6dMimCND0U/UWi8aU1cBQgZpt1Mr6RnsE/qbMJSIsJBe76gt7tVa9gkXqm3klErlSJo5c1v6Xv+5/1Bq7ClEpLDNQzk+ubOxaSa2UqpA981Xfq0BfgWH5KxrFJva6Cdb/V+tfnhGVW9VmM3967v8UMUGn4y3XmlUxW/kj6ndD4gJmetdVAv6tSbuRlX1FjpNbCo7Dy7g1CMml+6UucQ0N5yu2gkJ1mOWS8lCKzNFWIYB/j1OJ8CNqWFdVcygxfUeWLWdj64nohl+0HmtJ8efh35BHtyMvqJnkKKkK4SWsFMUtZhEwmc8L8haHc/UZXunNFaFukewWQSbAHqa8SiOh69ZPsQVR/j/9ufbKTBzgH2D2znMoXl4IKpHvOi2f1OlOXW4MR9Cmod7Nrc+iyXHcr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2SW6xAoDtJBWeFGcLMWdxM3JZiqDN90HF6gX1WcgggfZYNn/DIyLpv+aNvfL?=
 =?us-ascii?Q?H6V1ERadnR/YhPYBBWAIxmfYtv91N2USphScdB5tQVJGUOJer+x25jbHpHzy?=
 =?us-ascii?Q?BEVkFHlZ/utX46vvjqzEhX74/c+QbfVO/X/rhSFF9xCfkwOPA6VDgRWvPb/a?=
 =?us-ascii?Q?jxUG94tBZTO8ncYgPwYsHpFnJi0VIbptjZ+yF7iWO9aOvP2t4nHjYcznyHwg?=
 =?us-ascii?Q?cpObdzXKTdGRD8QCLQfesNzdDVnRKmAO46aXsWbl4CwpsvGoHCbfRrJ1WB3I?=
 =?us-ascii?Q?UWlvX6KcRKAl8EdyPqQJL97A03LoMoYSm1i1djXnXC6P6DFPDnvxrDeUeX0H?=
 =?us-ascii?Q?cpyHiuByWVPQD6nSfJ6l4izrOxdmjThh/TKRRfP2qqfUYZtlyhlENbSZh8an?=
 =?us-ascii?Q?mwUwi0MGwNmhnZGojhSQem9WpJPNMARjgVMaTYu7QtrOsXBoRK/XJJIcUB+/?=
 =?us-ascii?Q?i5vvWJbFcScHLHmYpyCNhHleQHbtE5oohiCYKj6TKNHEvFVQvc8SEFzunL3G?=
 =?us-ascii?Q?Qg6pjT762M+QI3snkAfv9Aum9qWhjpbQ77tkoZF48WFP5oq8VWg07cWcdJxt?=
 =?us-ascii?Q?Cb+SGVDxfcxelD92INao3bUexoXgIo0CJJRgjPQVJgemsygw4AZ3fAeJy6Bw?=
 =?us-ascii?Q?zE8zyb5MX/+9iXqpTJNwlz/C4ZGziDcmHnIutu/l1+zXrhVyMvr2haZ2x4yS?=
 =?us-ascii?Q?t8yF+aAaJK6wVsiScOj4KaRCtLQFH/1aRCFoIHK3rhAZ91zo5mVTsMzpWeCh?=
 =?us-ascii?Q?Lix/VRF/AWOEw+erEcrqykOevsUewBQRCln+KjJ4zYherq6KkkBl+XWSdV2E?=
 =?us-ascii?Q?fLOO2s/Ae49YbNdFMzs82rNa/oIphClxOvJdpUG/cbiz3tfR2EI0F7w4YQxg?=
 =?us-ascii?Q?fopSoNBRqrhqe7dgWSKxPN73rjriloAtiCciZ8kwfhkQMHBC97nVMNJ2ty8+?=
 =?us-ascii?Q?H4sKzwpVsUlDGYtf2EvNRQuysYLv8PbigVMd0f6RL+6wmU/8acrN6ixkhxCL?=
 =?us-ascii?Q?pYiaDTaTkstGNqRwEQhRBjNPHBrjigA88BqP/R2w07v29DHEg1EpotwrQhB4?=
 =?us-ascii?Q?XHsq5mVUyqKLl8IYeZvBww5IpwPE+wQZI6lMZsOk0a6NskDY8+I/LQblDJK2?=
 =?us-ascii?Q?mHKc9LqhGZBIPbbbpiN0oHKwrM3+/Rgzk63i0voFvjji3dm+Zkvu1+C1AAUz?=
 =?us-ascii?Q?14olW/oCfH6wNVMBI6KWtc3Vj+J59P67wlZOFiVjJ0jahKsqb9iiWNkHxSER?=
 =?us-ascii?Q?xnkfeOzWT82qx4dIOUoB+KXrWtiISQKcIvNZeFeUo4R7+nkWMlc+y4F8c0wP?=
 =?us-ascii?Q?6Wp3rdVg3BK8NdR416ALe0sJIQENyL86mLn3VU3dsWyvwlCdhtaGglNaTz4V?=
 =?us-ascii?Q?GK0f2tt841/rfIYq/Rri6zGnFc3QcQqh6qmpyZEkXUnPvbcMRJ1cC1I797bt?=
 =?us-ascii?Q?e9woldeXw/FVjBHeAh8BCdt6gCUQF26pINLIXYt5uFVgE8VBX2XcBo7V6BE4?=
 =?us-ascii?Q?/rgLwKSWGnJIKDW7lfQUaPdGlhzgoa4qnQ7Bv/zdXOxOXgXC0bTMx7B2wHqv?=
 =?us-ascii?Q?SafRH2m0EXSsm+2CK/ibsJkxdQFntGLIDIxWPmU2gO1Q3eiIO4t6xaQnDvE3?=
 =?us-ascii?Q?cOezRex24ZkhicpXIRxLF+67imEY/hg2C4tRTmGNDnAcbPFKGI+2Ur560Qv1?=
 =?us-ascii?Q?oCCBZqcYaTpWCmZ24aEaXGDN5hsD9cAxLdla8ROvmiFscXKf6q75ImsyeSo8?=
 =?us-ascii?Q?L9c2Fuh8vQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 59733b31-7ba8-40e7-d02c-08decb80ccff
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 08:25:19.0046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QPQMBlzBQh3s7brkr/iZWJpkHEwcU2VhLdICGUNx6JZoVnYdoTHyK9CsYbPiulSkxa4FL9V/BD5lNlkkYKrv0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB3317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 08:25:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238877

Continue the OE-Core shell=3DTrue cleanup in oe.package.

Replace the copydebugsources() shell pipelines with explicit Popen
chains using argv lists, env=3D for LC_ALL and cwd=3D for cpio. Also replac=
e
the externalsrc mv shell glob with glob.glob(glob.escape(...)) so
metacharacters in the directory path are handled literally.

The first copy pipeline keeps the previous failure-tolerant behavior,
while the symlink fixup pipeline now checks each stage directly. Add
oeqa tests for normal copying, symlink dereferencing, multiple
-ffile-prefix-map entries, ignored source paths, and externalsrc
relocation.

Anders Heimer (2):
  package: replace copydebugsources shell pipelines with Popen
  oeqa/oelib: add copydebugsources tests

 meta/lib/oe/package.py                        |  63 +++--
 meta/lib/oeqa/selftest/cases/oelib/package.py | 220 ++++++++++++++++++
 2 files changed, 265 insertions(+), 18 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py


