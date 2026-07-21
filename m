Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEB4C44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 13:46:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23109.1784641562825127059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 06:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=vVVM9SMe;
 spf=pass (domain: est.tech, ip: 52.101.69.39, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iulHoGrxcxInjaSR9HNbxNnqvjvMCPerzsjICR0dV7/EkkXf9FusKnAZh+z6usTma0H5ertqveobeMrOsXo/znkoMRf2USOJ0P3ebiVWfjpGWqrG0GpP9bZ9hGtWwSkSDOdIqhPRGNXbtVYHko/Bj32TDw2YTLFckWsmv5o3drT00+c3mwuGwLJHRUy57JOmipPN6PfhF09bpYwwkzLx9aTE9zqZ/QHDkzN5LZbfBco8zU522q/VyWRYeVH8nlkrTIoQPjCERokWcpolAd4uDq/x+mxwL32mKdOpJs6VULOL+RV2X7mqsdCzgoIouYl5GnDUKFDwRhzkGtF0KsixPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbm2JirvWGkcArmbzzl8SSidstCHnD0UCBSDbHV6Xh4=;
 b=JvrME9UW4ebhqarBlpFtUiQW5FKiTVtqCneKwtfH5dP5M1t+Z+UhewPkzqSpvfyLLPMcivVl1KRldqQuvQ0QCWjN+vcSAA1CulNLoYX7plHBLO02DEaP1+ehvqcemuut4OL+fsT6MK76iVjBpmptHQNlw1vmOddqxovi2zEyPfoyBzJO+G3zDCKxYYxVUcTLN84KYsg/IymAm6zA/Yu/FbkgY6qCCHJ75XFAiWa3LBqbXgN4iOtI/RtkgrDp5/DNmhUEAqcqCe+RtIc288hSkES9N0lbqwkMWqirYe2UudWr0rIC70oWTHaVqPPp733aUUbSTOQqMDhaddlib8F7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fbm2JirvWGkcArmbzzl8SSidstCHnD0UCBSDbHV6Xh4=;
 b=vVVM9SMeNsHWFn8LghIw3TF6xkSLnZO3bgkhasJymHNmz+wNL7bEFPyVXZVtw+sk/159avnarFxFJMduDNGirMNIcTUjcvmxr9Ii08i2MNTxqnpwCcma+o2NNDorDca+6YpIltr8zDhcW0x/AbvHcPpausVjUp8T58fwtzA0CrKFkqq/xXej71DPm3FPhjSGimP4YZh81hGkHP9HkGLSajNK2D15SXnMrBL1l5JKoMLWz+vna8mdhZFhettNrijr+/WiyzwG30X3MWwDojfbmX8cV5ca2F0e+hP+cmVLX8vKOfYI7ag0DflH+uTiwo2lxfGwON5E7PVHM8VkENdb4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by FRWP189MB3482.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 13:45:59 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0245.009; Tue, 21 Jul 2026
 13:45:59 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [wrynose][PATCH 0/2] perl: fix multiple CVEs
Date: Tue, 21 Jul 2026 15:45:41 +0200
Message-ID: <20260721134543.16442-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::20) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|FRWP189MB3482:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f63f02-9ad8-42ed-68da-08dee72e6584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|18002099003|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	RQ4Y2WC7TD9Ek50GianSq+YYjn8V0NugUHIegWKpz9ynzm7TkMqYy9bJE9mJKIN6L4h6wu252cid5SLisMeOXXQwemlcyHVtWqZtPGtmeKLhX3FRL9d2W8Aa6xDw9zgLn1azR7pFs8CgfMU/mLalGPyb2qqBHzep8ZuQBPOOGiq8YjmyIbTyDnRj6Hy1csJDtHkfomdVKxZOCZLO1CbOyEVuiWeABFQrNrBUiiTzRPoRpZgbA2A1NRUbu4o9r4/hhK945KRuGEAjAcPtNVWpjEHRIYuPaTfnd+uYQH8htBokaSPv5VZwAOX2GArs+mjOFP4P2eOOusQTW55COzFa11utJVYmYBtZXvanO/RSg7h01PM4+OeD/RBrLYJKSCUdWW2J+PlRatilCpltHnrF+FKZd1Zkl+Q3XtXVVzlLTIDMpOBebUykMhfxCbIS9ctUmJ8eZSffHoPcyuRavfXQjemnPEACxWdbYOXp5x2rnHiSM2cXMZXEgZY7piRLFGIvqcfDAsVG0bBQyIzA6OBryNf9agcWxzEqHgoO+TBVMtkiTUnLHi/JAbG6H2gTp7vOnvQw/sM1V5ZxdiCWydyjcpY0vCNB2DIjp4wv9y6wYszyCBGK4VxeClRg/vupuWoJndZwQEkuTg7M4+RtVwBEo59a8OZhEPD/J+dB9zeGkFg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nsDQPDz/anTJ1aJLTsXCCO7E3fsaytSTFitTAkE9EMVJpq4Ei2nzVJZhxA3Q?=
 =?us-ascii?Q?Xp3PlinYQx5gVLXvjYe9RbmOpBQl18udm2VhGxQqcJSYKjz+yc41blRbvAft?=
 =?us-ascii?Q?EuBJ3j8LOyn/BnR0UOtmFKwmu3k9OFLE26LQkDDtjAkDCYpLB8stvrIncslD?=
 =?us-ascii?Q?69at2Cj6VkX3bTk/LjUNKPG+dETW2pCF2gwRucFHX5SsywqUbtumj7vdeOy7?=
 =?us-ascii?Q?+dJU6u9NTI00ukM2lA87tR+Pu6i9mDdDmBwVZLtpptGqrRaatYOoxrkXf7fA?=
 =?us-ascii?Q?QUQ+ZlNmYsjcBcqIUhQZQsXrt6vOfDkc+oZWnxNeNarfXtwrnT5Fb/EmmFxZ?=
 =?us-ascii?Q?DIjMVvBqqrdD7f9Tp4WN1moi7+n+s1kVUBrWroTR0kNgv8KaXNKXcwhTX/Uh?=
 =?us-ascii?Q?lQuvwjgzuiBV+c44a5f/L4MK0fB7GlgF/+8dE1X6krk7b5R0QfxMppxNwJp0?=
 =?us-ascii?Q?07wjEF7KgblcdNM1qCLUC2OaAqio0EzhUdDFr30elOlIpOKL4nxLDv+y4L2v?=
 =?us-ascii?Q?qtf8coIt5UVmIXHa9jPJ/rzYLb799u33mLn/UThfO0SRgkHNGqVUNcUZmbfB?=
 =?us-ascii?Q?j4uFF2ZrI3AKP5LKSU/o1BUkm8H8E3HUa5witziK2LTrb5p6IyD629noGmqd?=
 =?us-ascii?Q?AaI+wcxnJjKOiTo4tdBlvvRR++MKapxc6u76VHHpps1hoJFef9HFphqwjAHm?=
 =?us-ascii?Q?eE5L/vvSZmOe9p+SXnNGX0jIR7cbmJr6Y8BKE3O5jrOQK7RaCqVHjuBUKwQQ?=
 =?us-ascii?Q?wfM6U85g3Lt10y+KDG1mvvprlaZ34WurKPr4nHyfvd1QpOxWJYB+o20+WaVx?=
 =?us-ascii?Q?JPDE6PQ5DVLZ0EsD/E2btTsDzYNpOW9NTek2FLBoPhJqQggPGzE6D62btOWY?=
 =?us-ascii?Q?W00fwpoZ/KPnjEjDciDL4UvUAn5mwhJC/AuLv2bdEctPuX3z+0l+3MWHV1xh?=
 =?us-ascii?Q?OiLwA18ys1yCHez1gO3ZqNuyaM2f3m5jFcuGwrhpiYwu/aH1gklp+A7RVODL?=
 =?us-ascii?Q?LCTJYN58/SpnUW2w8Y7yIKlXrF4hUJd5Q3p0XqrH1KtpykA2WhKAwn0CrDki?=
 =?us-ascii?Q?tAqpeT1+UQaCdknuda9KeIZfU/VD7tGdIbEUY/ulttGnOJIfWPT2qkv0+gIf?=
 =?us-ascii?Q?Wj6nYLHKsZVZWzkfU2dRv1gu/KV09VRcf14EDF0upyQzkwHSHyPsA71jrbKV?=
 =?us-ascii?Q?IheEuHy3yJ1d0fFC0fy+rIx+rJLui2sLhj0JNMqgXV8tmJvuc9P6ZKLnVjCZ?=
 =?us-ascii?Q?CBMMmA1S/P22K/ow0P82eI5hz3r21fR5sK1ZBGb7GAeQHH2qPsOhlRFFyF+B?=
 =?us-ascii?Q?TYt4VLalg1fXMPVtVxInLyJROuQdRM7mMjoOYahHAEItFGHvvualERc8zifb?=
 =?us-ascii?Q?xyL5wf/0uB60MQjHgTA9hLONN0heghoQ6DV3pfWO0gyzGHN9vQwHxN0Jw5iE?=
 =?us-ascii?Q?qlpcIk5fzuNL8q35jLKHrzgQFK5FEyy32LpUo8duyfylzj8BYGda0bvutfwk?=
 =?us-ascii?Q?XU5hv9QqiSADvrmjxMa+EIIRZxc27KOAoY0zvD364Yhpt2S8d4lyLIO6X22u?=
 =?us-ascii?Q?1XuAJBNXqLeU8bxkDl1RTXenCAzuH7cHYcQM/fNwt+ND8Y8TLnIbo+Q8HWGq?=
 =?us-ascii?Q?RNO2A6zGsQuKkUT7r6nBDCkdVkGpVUPxjlEnmzGcZyGyysfsPD0+5w08JdTR?=
 =?us-ascii?Q?Oh/A+clsX4b8RyLR7Bg+oivnDGY9NQqCzX9Rmdrt5aXxyawY6vr/EE8XaD+i?=
 =?us-ascii?Q?RcCN0QZx0uE6wL3gynOFqqowz4M2GBw=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f63f02-9ad8-42ed-68da-08dee72e6584
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 13:45:59.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAg89XKQOsCOJOcSE4VOdCQOjcerigjevRCMhmHwZbdVYBzSN0zgWNVPRw2m7PIKYsqOXAPstCi7iIh5K/W9q8w0E9M3UM/Wps3Tp/CM7ow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWP189MB3482
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 13:46:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241522

Fix two security vulnerabilities in perl 5.42.0:

- CVE-2026-13221: regex trie overflow causing incorrect matches when
  alternation has more than 65535 fixed string branches (CVSS 9.1)
- CVE-2026-57432: integer overflow in pack/unpack leading to
  out-of-bounds heap read (CVSS 8.4)

Both are fixed upstream in perl 5.44.0.

Jaipaul Cheernam (2):
  perl: fix CVE-2026-13221
  perl: fix CVE-2026-57432

 .../perl/files/CVE-2026-13221.patch           | 75 +++++++++++++++++++
 .../perl/files/CVE-2026-57432-01.patch        | 52 +++++++++++++
 .../perl/files/CVE-2026-57432-02.patch        | 34 +++++++++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |  3 +
 4 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patc=
h
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patc=
h


