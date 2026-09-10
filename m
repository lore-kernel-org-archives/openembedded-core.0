Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C370C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 05:12:08 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6892.1789017120475080008
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2026 22:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Ux5BmX9m;
 spf=pass (domain: est.tech, ip: 40.107.159.68, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6OM7+9xta8P5uc3uN9dJ0bmH16T+iiAKjp43FklpEOWji7u4Er6U+UCRDRRf9LKQ2WwDp6TkKHrSHWzwJyHuAZBnAVI8gfxR5rd4BKhwAOAikD/ecAqbNIuGLh6otBBl9lFPDQKZM0IzUVHzFAkQp6Ohbiip7cndFXmz+Qvz8iVjYa6SHqoIeaEUfHR6WXfyExUvtT21veB8D1iIeRFMqLlAu8uKSmJbTXxc3D5dZnyD/Q42xPneS8x+aeN0ClT5ozKh15DRKaV8wCrPU/f/xm7yEADyMsUtAo4c6rju89dPDSpA+MlgYYRFPvr3MNeuL8a7gB56DWjL7BbhfMFWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqkGNEE+uYAeRhA8/+HnMrhSVQy2tktadNWaGV6g4dg=;
 b=kWZPvaA3UhH2W/UPlKHFMr+ScWr6uCCIlTGvx8Xn5KxI1RoRev0ep1Ay356/hvsOuTvNDOETLJOje68nilXCsYF4lnczdX4gu/XhRwa9rkTpVWNGL00ViIwtSN1pQrydqP5Vm9bGAhbI82m7SGLJ9ciA1Y+fBkmwnQ8AbpD/ww2zW4s9X7zkwLNUKjjPkX/xRzKjei+TowZG/qbfifhlSQtK8mH/kkvX8HtRfbne8FbtC5V6pBl+cIOdFvmfe0VsqwnhUgikZfjZ9diZ8RJkTbZeIPBlMo3v/UlEJG+pcHifBhr5TS5YHdv97v/b4cW3c2LTTRyc1Ukt38LfWzlI6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqkGNEE+uYAeRhA8/+HnMrhSVQy2tktadNWaGV6g4dg=;
 b=Ux5BmX9mvc4c2Q7jLySMH7VzvXghQtF83PCBAM2gyp4p9KUsmJ7euJ5Z8WZy6W3z0jHEJngEmupHN0lPKBT8usVw+OpcxdfyXWpMucf83Ejo71a/Kkf9TGW3iILk2Ei+4cVMsZKCnYAUuoJUMzOuq88Afqi5YvrIYRJq6rNS9cQZffRzh24YDR9+s8FZRIfAXKzw1Q3UA0CCO31GronnIqv//doJTk/RIbk52hBmD6fyi4R/IoAqY2gawS2RcDIOfTd69gRk4EFGjdZhJLTFfKOb6reA6gfXLUVSUoIXDvqBsDqvtwz7nstkyzGC6aeZUK1NQl8mxMQzF/YPVjphHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by AS4P189MB2085.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:514::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 05:11:55 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0406.005; Thu, 10 Sep 2026
 05:11:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 0/7] libpcap: backport seven CVE fixes from 1.10.7
Date: Thu, 10 Sep 2026 07:11:47 +0200
Message-ID: <20260910051154.30595-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0330.eurprd04.prod.outlook.com
 (2603:10a6:10:2b5::35) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|AS4P189MB2085:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fe5d09-ba17-42d0-16a4-08df0efa083f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|1800799024|23010399003|376014|10067099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	e45LDdMRDShqO6vmwi1CYPT9c26/G6kZIYjRaxRDy+GzdOyW5Lu2KHzWbplp5UKw+ziDBaGzwE6BX6lZjjXpFkTHmCgE/AfazMC+DQJR+Z4o8hRgqNCQj40ZoBJazWAVrwnuNk1HWAmpXsPpp0Pg8NhT2yroA/R+2CpU8h6A8n4snQantMt2zrN2+VlWHcqhlDNj3ACqV59z2YdFj/lMdG/AmZ+Y7h+7b5HVzZ750Nfm/c5+gM6N5ae9A+DWB0yfD+FvMq4LU1ia2TSbbvJNZMAk9jDm4Dgr+pwqIMqo8ol5+F165LnyzfmcQhq+2I1a5Tjd7s7gB7fq4C2Xky7nIcQPK5yVhmImSrCjFvnbZowqqrEXLR4kOR3YWzFAJkEs53tzc1jCEHoDN5QS0bHlJ7oWeXxVaTpEYhhXQd8NClY7WVUib0Jv1NVOdCS0lL+DWHoAzFkzfWERGWiFK0nZKE4fqFCUsR71e7V5HBVDR6UMomlf3ypmm6zQf498rLIrS4wKXdDJC91w5vuh2ShwsH6ttt0lPZVyVdDDjJL7KYN7ZIkh19d/JvR73Vu8eHPTeL3zFS617Pvds07oXQAA+1hjJnXucXcAZuJKvKZlFK95L+x5nCBdK+muLJJH7n9S5zFRPiN9SrfWT1BMMXq14oKqI3HwLuqlOCB/c2C4o3I=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?efYv/C/fTABFZ4ctd8TxPftH9sNdE5doMVgMsg0RhnD9VFFR1N+6reZ1tsNS?=
 =?us-ascii?Q?OPgWPvBh8UvXcTAlVTpPPbbuO39d4ts5SDwRr2W96WuIL5ItMM3NgE6fw5aF?=
 =?us-ascii?Q?45JcCN9gYjQIYjCUxYhgpxppOSB3j1XK7NswgJ/uT01Y2ZNvksD8vSj4rfST?=
 =?us-ascii?Q?iSsnkvNu23cc15K2fU/GLYElcp20fqp3s/CruY/Q6JmjshCwi40+yZOEWZ9l?=
 =?us-ascii?Q?BczqdBsYaRh9tEXJuiu0BMq2bVCsR9HSgVUwL/S+u5vG/lfM2buqk7tC2/19?=
 =?us-ascii?Q?e3nsplF8paKOJ0ahc2hptnC8/pctFypzmDTMNXXQIVlwuBnZL/9VWJOA8vza?=
 =?us-ascii?Q?Sw6/wLABiGwUT1zQ0ll7xX4uwCLmh22r0bWUSytE+XGYlpGAlDnt5poZd4XI?=
 =?us-ascii?Q?O6iSrIjxrtJrCN7wgkG58FTkzyJ//aPCsUZ24s7y+pHGKXpR/dw8VfllgKhu?=
 =?us-ascii?Q?PQFlPjN+83Cyn2VCUUcm24okOyU1I3GGo8MxlM5TOcMc5YuOsaXcgCIonfyT?=
 =?us-ascii?Q?ud9qGeGhZwcOvBn/SpL9pYje8Y+CB66jAgcdhdNSXa9N02CUHEP/yOFjqp5P?=
 =?us-ascii?Q?EDzbyKxmC42FgNqzi3KoFRMgQo/91V6oMMDIgAy7cX8shX7k9AHpzcftgsv/?=
 =?us-ascii?Q?PcMj0B+eQyvTw+mZFmPHec3SxOQat7nUdRWFE1Cx1ne3YRxHELXSaas92F2V?=
 =?us-ascii?Q?H6gTlV8Lvoh47maTMWrDI4juMESmajH9cgMzqLq1omolXiSG0uO7LhFk6MsV?=
 =?us-ascii?Q?diPU64OT5Ll4xZKyoIbwTWTmAk9P+6fFWicUG5/tHjGvc/ArojtoqD2aU1HA?=
 =?us-ascii?Q?ZMAg4RmVL1w512fFCW/owg0xWEJ6i/YK7Si9jQyoePwKuhpbw/8UF6zVMzwn?=
 =?us-ascii?Q?xpR8rxA594NM/zanz2USw/OJmh6H8mTPCSk353DXdqp7gH75Mv4O2d01AGmx?=
 =?us-ascii?Q?dUjHu243S8cEkHoQL1XrvelnxglI/DCspXwoBh00NArhsv6VDHWUXRltwemH?=
 =?us-ascii?Q?vxZheR0TM8gPWXBu/ExFmhQJYdkzZZLw9kZZm0HkuMI0MF0DWDK7mKVO+hep?=
 =?us-ascii?Q?nfdxV5XuJM/+1bKdjR0W9q98Iv6mxu4vxLK2By1rXPQaxusC8TqcwND/x0tO?=
 =?us-ascii?Q?73uFQOiCoj/EYRiYUZSes7v4S8IwRBLCIsTzlp+f0JwIMaBwFMmMD5uhWWE7?=
 =?us-ascii?Q?helc0usCLOQgamNdcgyekDH6nHusUI5c3YRgExMDAJqzyWZbMmsAMS25ByCB?=
 =?us-ascii?Q?7eHcJum95plwRHkJVYVALrJ8GjkP/BYCIXc95AyVRLlYgMbtDLVal1qBx2Tz?=
 =?us-ascii?Q?844/4R4bIJ90G3Es6lt6ZIJeFfuLc+2TZDdUIcZudjwMDj+bWk5VxYZZa6Kt?=
 =?us-ascii?Q?KkRAYrNFk8wP+esQg6ffEmIgxVesKhT0CfFkEtgjxsUZNiVVjOenb5cjoXNc?=
 =?us-ascii?Q?6UV8BxNVSY5tqHzkTuxlcQo6YoZikVxC4ZrkENdejqNeVmqWWNP1COqysw/3?=
 =?us-ascii?Q?BrdyQ0QzCSfKZVmQDZTpOL09abs1FnHRXycfJPNsdscrnntwQZBDppkoJTnp?=
 =?us-ascii?Q?BdI5arrBpgngTaqGdtt42qDV8SrC9aPE3kPBgAcc7J/dzJd/Li4nYaS685Cv?=
 =?us-ascii?Q?8ehzP2J5zy7M3TBER8NGU7tehB5NfpGYVbeK5KMfNEKhzD6M6+HBWNTD9IQP?=
 =?us-ascii?Q?1eIcivhKUiT2zNSOH4BB0ETy1MwCm3Zmn3PP4xtSjjWmyWBscg8WkD7kCdNb?=
 =?us-ascii?Q?RgIfRlDwfQdnCw/aEyoma4Wot1LVrwCX5QBXSv2HwBSScndon1/JYFk/D4rM?=
X-MS-Exchange-AntiSpam-MessageData-1: bR8ji+NlPS0zkaSC4PmAn1BoQiThjyiYL3k=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fe5d09-ba17-42d0-16a4-08df0efa083f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 05:11:55.4028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m+v3Ri+Y7ckRaBAqK1rAPZEbRnEVnHn75tYlb+8WPFQ76hCarco0twi3z6Q0R3xOMOK/L0NOmPWyt2ZNrt04Wd/SSBZybI3LUMDNFt7QXLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 05:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245523

This series backports the seven security fixes that were released in
libpcap 1.10.7 to the 1.10.6 recipe.

The same set of fixes has already been addressed on master by upgrading
libpcap to 1.10.7.

CVEs addressed (see the upstream 1.10.7 CHANGES):

  CVE-2026-0799  - Access M[] safely in the BPF interpreter.
  CVE-2026-31912 - Mind the program bounds in pcap_offline_filter().
  CVE-2026-31911 - Fail opcodes safely in the BPF interpreter.
  CVE-2026-6244  - Avoid division by zero via pcap_offline_filter().
  CVE-2026-6554  - Limit "ja L" looping in pcap_offline_filter().
  CVE-2026-18313 - Fix a memory leak in rpcapd.
  CVE-2026-18238 - Fix RPCAP_MSG_PACKET validation.

Each CVE is a separate file:// patch, ordered so they apply on top of each
other. Some didn't apply as-is since upstream made them over unrelated
1.10.7 changes; those prerequisites are dropped and only the CVE fix is
adapted to 1.10.6. Such patches carry a backport note.

The CHANGES entries are recorded under a downstream "1.10.6 + backported
CVE fixes" heading instead of the 1.10.7 block; the first patch explains
why.

Verified by applying all seven patches in order onto a pristine libpcap
1.10.6 tree and building successfully, including with --enable-remote
(rpcapd).

Jaipaul Cheernam (7):
  libpcap: Fix CVE-2026-0799
  libpcap: Fix CVE-2026-31912
  libpcap: Fix CVE-2026-31911
  libpcap: Fix CVE-2026-6244
  libpcap: Fix CVE-2026-6554
  libpcap: Fix CVE-2026-18313
  libpcap: Fix CVE-2026-18238

 .../libpcap/libpcap/01-CVE-2026-0799.patch    |  87 +++
 .../libpcap/libpcap/02-CVE-2026-31912.patch   | 630 ++++++++++++++++++
 .../libpcap/libpcap/03-CVE-2026-31911.patch   |  57 ++
 .../libpcap/libpcap/04-CVE-2026-6244.patch    |  62 ++
 .../libpcap/libpcap/05-CVE-2026-6554.patch    | 108 +++
 .../libpcap/libpcap/06-CVE-2026-18313.patch   | 104 +++
 .../libpcap/libpcap/07-CVE-2026-18238.patch   | 234 +++++++
 .../libpcap/libpcap_1.10.6.bb                 |   7 +
 8 files changed, 1289 insertions(+)
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/01-CVE-2026-0=
799.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/02-CVE-2026-3=
1912.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/03-CVE-2026-3=
1911.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/04-CVE-2026-6=
244.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/05-CVE-2026-6=
554.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/06-CVE-2026-1=
8313.patch
 create mode 100644 meta/recipes-connectivity/libpcap/libpcap/07-CVE-2026-1=
8238.patch


