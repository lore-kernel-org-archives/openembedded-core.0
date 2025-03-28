Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A16EC36013
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 15:02:07 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.67.81])
 by mx.groups.io with SMTP id smtpd.web11.13335.1743174120694761555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 08:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=RuTN0IgL;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.67.81, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHtwrIJVACaCOEBB+kc0Q6zKlfUdRe0bxWplHwoPtKuo97e6TpKOmkwdqHXVFnfEjTxwwJhokTBxLRzlit5olfRM3tgg3iTMJyoXdfHS4F5vo3cQW1bpeIP5hcFtCuVo7ogpbIvlLOheiB4Gms8Yhib75q4LiH5w0Tnhl4KbErn82AGduWZFsZGY+NKgrba4HTelAZUtj0SAt7fPX6lYp+IL7J3XZo048SCx0MArGPA9I07E5RbG6KX1nToeUCpxqWuJV4hbihrMz9DG8uJjfNIrlylocYf7uEBT1QYiXsX1AJSptNvuuab5dajzAWYAptnroeoyExfbMvh1O2x5Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1r5RkvnMFd94EnfJ/tAj624VMePeAgpxqi5rNXVarY=;
 b=Z/NrymTD8eg+NOzTKPH4e5dsoZA32LdbO53GUfdP8UE9mCXW97b3a+QAS42eQCRd/t7E7SDs+Nr+9wTsTpuTZWoSEUSJZAuCWXsbRqnjNDL5KiaBYWVTFGPb6MI6qbu3QlpV2DlcMkA5iTwdPoRN62cjn263ntQJDImtTzvtyiJRe2a+H3C5KVbDWc/eo4alYMlWKEU2tNCrHfllB4YL4fcZS4c+DzBCb2+XDU0oOg0vsF7vsVsvuGqMGpiIwZisD7+IPE7WX++9tfh2zR4nt794dkQX3Cda54LEPYcRTU34q+HEUncuWc305f4MCa5rL9vmPMofN2bHHZ0e3x720g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1r5RkvnMFd94EnfJ/tAj624VMePeAgpxqi5rNXVarY=;
 b=RuTN0IgLNlBvQ63k22Pt+CzYrUwpyJ2gELgwO38d3kMneeFOJiQA5fENNxj5vWKEpJcuLBwORU/ccZncKyqPOtrl3Lz8eUBSXVp/vQr0fu64txxzGpGv+y14dx1oJYRzt0cjpRUmq0vmbIgBt0A1V+uHKmakaEbXfRTXkZYvv2CN5vshmeJo/Byn+DxKOSCmSAFtzWy9TpDDsQWLlZq0soTtIk+WcbpdpLWUWfJZdXd04PeKMcoE1+ZNkiNowAu6Dyn+ouXJNOsKNzmGVzumku+qfjCkLFDnD6Q9hYY4K6CCLFzvugKO4E88/r6TC0C1hy+44+PRh+TGF5c8L2v4Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9285.eurprd06.prod.outlook.com (2603:10a6:102:455::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:01:57 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:01:57 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 1/6] default-providers: Add VIRTUAL-RUNTIME_dbus variable
Date: Fri, 28 Mar 2025 15:01:31 +0000
Message-ID: <20250328150136.1855862-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000045C6.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::43b) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9285:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b69e9a7-4eaf-44af-a04a-08dd6e097c08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oWa9XRjImIwHHXsL9Jlpibg8Y3giyr+ozvgg2/6kz+wC428DQTsXtpYwqJ7t?=
 =?us-ascii?Q?vCbLbAvv/y3reGHm/7rWZHJBXm8l2iIpTUxw6G60OkjNfN71g1zsjEhln/Dt?=
 =?us-ascii?Q?eOpweNh/yMuamZlZH8N/s6x3a/b9pGhDtCA2Ghxzjea2zAntP1Atf39p4Hnv?=
 =?us-ascii?Q?cvvX+sV+8aV9n8LI42TbBhbTJevIPjHu8EOcyjXnbN+/++C+cAhiskfFg1cl?=
 =?us-ascii?Q?H6O4BxqOV9ttDZoiGbW5P0j6nyDHuVFLmXcyMTlZ9tOM2wNh9LORdE1KOUiJ?=
 =?us-ascii?Q?QlYoSMRyjA0cqv6gHHI3umg+ARibIJkyqnqnOUkBl3G5HW30ZXSn1DzvUDQd?=
 =?us-ascii?Q?4uKarrPj0R/+J6ddH2jsyzS9U0cCaV+FNNspyB2jAPptM3YCeL03qZtkCONu?=
 =?us-ascii?Q?sGqEluuG/2PtcmNvTeMKBzUZUVWD5YPIAM+2p4Hvs9cph5eLx9VWfmIvgZC0?=
 =?us-ascii?Q?boUEYQY/E9vM+YGW3BTD9Eqw2uQqG9AQgeuo0wkwa5yB7PbroCg49cbJIyRF?=
 =?us-ascii?Q?Faf2fjXfSnjpouQpBWWjmWxhf6/mLAXDoqZFlWpM+bTweLl3CyPFDsCgYvSI?=
 =?us-ascii?Q?fFu2tziBw4+miffDKT+PDcdKehKl348Y5ZLqb2U5D+hssqTvhtTb42qvSpvf?=
 =?us-ascii?Q?eMPqLB9+zgelb5PwgtrqmbuqlZDDZH89VeX2y5NB17dEcrDGV/X3vjrglBfQ?=
 =?us-ascii?Q?eSYSINE5G1YNWvRDO+Giua+MiBwXJObeaRnO8tFYiQVffgEJqXu7haIfEjnE?=
 =?us-ascii?Q?rLTMzVLWJZc+JzElew9yjfHut0it5EpcvKhI8GY0/hk4wQgyoZwQIBH8GLzY?=
 =?us-ascii?Q?TnF588hsbTaV25P3oj+1AtpNMpljmUGolZCUXdqulxhvjFre3cngnkNgI/Ni?=
 =?us-ascii?Q?IDcDGL7mP8l5TuIGl3BK6Uxt+OHP0414EuJnycUPXk3rH9QzwfuNgOexV0Xu?=
 =?us-ascii?Q?iAaNhBWPjg944TzNfkW/cZlF70uDBUm2gaZn4ZnjyLLWCC4HBCfx+50XoQzf?=
 =?us-ascii?Q?NoDHCW70QMiDEkaXIgH16J2kowG+rFj8HuypmroRJ+pBVqG7EZi5+G1enm72?=
 =?us-ascii?Q?+okxIFaXl71QF9bL8rUSj8wsBB/Z+0tJYoljpbmMtUCv3zkA/ALJYGk3Vx/D?=
 =?us-ascii?Q?clgN5kDtSXZigfKuuIfR35X6NYhJmzlUGMI9tZojO5C+2ijZWMOltq5wojQy?=
 =?us-ascii?Q?A92XExhhFfo5ztUGu6nUazaJ+VEQPO8CbrHoLcLmDA3Xa0yzJcMPfZcQNZcs?=
 =?us-ascii?Q?M2guJjTER2IE5/LXB1GvSnRQj8az79pfFr5dK9GjsCoZh/zsUAsOGxwKLvho?=
 =?us-ascii?Q?9CSfQQwFM6XgNf2NDi4ojEP6qyyluYfcMuFUkX4ENny3VMV1dc5DPXy55rJt?=
 =?us-ascii?Q?SRkoAbhe91cRxtpryf0Spif63JxL31G4mvg/YP7ihLt7FQS6p3qHVT+50L4J?=
 =?us-ascii?Q?qe7C+fOG4mc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wVwtSfLP6rt8v6j/CoZxBfeb0LDnkadg1hUtoNiHBWaSBCUMKW8M3tCB5wyw?=
 =?us-ascii?Q?JSuk6oYPpju+agvPRVKMBUAdRfj//rgsB5Py9y1hynl7QgxNevMPB4WoQbTF?=
 =?us-ascii?Q?uZhvqO8Miqqi7uDQBqaInxqCqQCLQf9+lXi+c91i7g2mbtIypBmx3aMc792q?=
 =?us-ascii?Q?pQ70rJydDu4k0g5GQq115jPQXfR+p6BoWvopi8YFpSD3kSg8pxiikcz5VA4/?=
 =?us-ascii?Q?iqFWAWKIrvn++Noou5wljo6k20SiWW0KYv+QLzxWmkeapnKjLf5oaje0I92L?=
 =?us-ascii?Q?4qgu0pUEOdZ37R8wMACyfzlc4siSGHIbw1IC3Li3qrfXh0aI+aoeFUNzd4+7?=
 =?us-ascii?Q?RyU1mBMdAjhNw1BLiWiFzDIkNcyTR+/kOwjwp8ydL5oDjMYXrMGjCDLmB7N5?=
 =?us-ascii?Q?8OswBqgQoshcenP2m3SyrwvEyjeflhDhe4KK9G3sYRnBrsJW4hM8BtHHT5up?=
 =?us-ascii?Q?/FO2eYbI9jkMmJ+DggesYWm3DKaIHHSsHbAOTP1hw2I6HB0/swehM60tOuAk?=
 =?us-ascii?Q?xyrNTfOu5L7wKfUAbJC7oio5bEVRXZGiVvyK66lkC5v9euGsh4j88kyiQCN/?=
 =?us-ascii?Q?xRVjxEoFks0/V44G9BDX2x3x7VZNixlD6OMVViGts/Zz47bU2avkFqBUd/KH?=
 =?us-ascii?Q?kp53gTvySMEXJZs7tO7cruclA+N7oBzVDYgNd7AjZ94nmZYyKL+F0j/bzAxl?=
 =?us-ascii?Q?YYlI+yO3wGj1rHqP64Kw4l1xzK1IUTyA0krwPG/+yx68EYvs39HrG+FMidCj?=
 =?us-ascii?Q?d9UU5/ODFOoFo+r9xM+bF00Q0fT4J92TO7awSbhxcxUphtqgyQPbTCAhqITL?=
 =?us-ascii?Q?RNdJmSltbL4N7581Ar4/hrCoQ+KO6tLon0yrCSUnfan/3HE9Lxt+e3ldlSs+?=
 =?us-ascii?Q?AUBNBXAc6mp/f48bAc4K4jHph8UXXHlmAUFsWLJVTdhrf+5H7dHUma9Py56q?=
 =?us-ascii?Q?jnDoReFX9E+VVtGuTAdL1T+G0c3A24sAwpxscUtY6OU9Za0qK281+GFUnAke?=
 =?us-ascii?Q?HtVJcvJp6k36dD+xOOn2OiyHgz4V/FhlhiTxgmOF04hndBwV5AMZQYpRAiIK?=
 =?us-ascii?Q?sG09wOvTa3wRtRsRJa4QBTIYf/yacP3aS40RWc67kpbQCd5Zi22V6Al/iEPz?=
 =?us-ascii?Q?puTSQRvXawRB/wlaVbqH4zgqQDUxySfCJBu7M2A+rW1cf2b8Q36WaKYhA+1l?=
 =?us-ascii?Q?DZ7lSNIYuj3d1lzOxObBgYk9U/3vBC3Bha2gE/0LLyKZXoKbM11Itkv/D69E?=
 =?us-ascii?Q?RlS+i7ZuzXG/z6u8XGbGw4YxO4eQVeiu2I/wnAXtLtjQ+ileFOrfZ6JmBI2d?=
 =?us-ascii?Q?AGJRO1lhVgnj0Rzfm6QXmQeM5swGgpLDwQ0DBdszNmage/g3unYJFO+cbzCy?=
 =?us-ascii?Q?WH6ruMu4I3BRSQzESs/znvXBMYpbnvIMscEMH+cwmlT0yHKDA+Daojwvdyuh?=
 =?us-ascii?Q?bRuu0bBN0RKyWrcNJvBnolAUe62szkWoHIJ6uxKG4Lc1u9nXYimcSUpNweUw?=
 =?us-ascii?Q?UQ4o/TvjUUfg3E7e743qknzfBC0pJIBXwMLedzO27pl7hqSLDRF9JuHzrXqM?=
 =?us-ascii?Q?A5mbmbc4pCb7WjOWaWrYfjb9TfrUaBLM3kE6BG7s25LsLGq3eQGNPTauCp2b?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b69e9a7-4eaf-44af-a04a-08dd6e097c08
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:01:57.2165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cisAE5g766yQNYM8uq3J7rrjGvsfJFK067XgLxJlQ2UWGSscmj7E+b1b6z3nJmvRMAkw0PQxQ0LnicqgPdpfCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 15:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213847

The purpose of the new variable is to facilitate oe-core users who wish
to use an alternative runtime D-Bus implementation instead of the
default Freedesktop.org's dbus, such as dbus-broker, a recipe for which
is currently available under
meta-openembedded/meta-oe/recipes-core/dbus/

While introducing this facilitation the intent is to preserve the
existing functionality, while allowing the user to optionally select an
alternative runtime D-Bus implementation by adding the following line
e.g. to local.conf file:

  VIRTUAL-RUNTIME_dbus =3D "dbus-broker"

As a background, for example the Fedora distribution uses dbus-broker
instead of Freedesktop.org's D-Bus implementation. The following
excerpts from
https://fedoraproject.org/wiki/Changes/DbusBrokerAsTheDefaultDbusImplementa=
tion
provide background for their technological decision

  This change provides a more scalable and more reliable implementation in =
place of the reference implementation.
  The reference implementation suffers from long-standing issues including =
potential dead-locks and susceptibility to denial of service attacks, which=
 the replacement implementation does not.

and

  No visible changes in behavior are expected, except for different log mes=
sages.
  Any visibly different behavior to `dbus-daemon` should be reported as a r=
egression.
  Ideally, this change should only improve the performance and security of =
the message bus.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/distro/include/default-providers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc
index d3eefb754b..cebd0400f4 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -31,6 +31,7 @@ VIRTUAL-RUNTIME_base-utils ?=3D "busybox"
 VIRTUAL-RUNTIME_base-utils-hwclock ?=3D "busybox-hwclock"
 VIRTUAL-RUNTIME_base-utils-syslog ?=3D "busybox-syslog"
 VIRTUAL-RUNTIME_keymaps ?=3D "keymaps"
+VIRTUAL-RUNTIME_dbus ?=3D "dbus"
=20
 #
 # Default recipe providers
--=20
2.39.5


