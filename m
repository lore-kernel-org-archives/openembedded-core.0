Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D13CD98F0
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 04:46:06 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13878.1782189956534568429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2026 21:45:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=QW9vhRfr;
 spf=pass (domain: est.tech, ip: 40.107.159.41, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiD2ZZGg4iK6Slir23/acPbCA5UYumswuaJKclSzpfzeBQ4vEA0IHdlYte3lT93eIwPdBTqFqmxP1L6fZ6geZ6LO6WDWl6D2Qz6nqOEq5HB4bUrxYY0WZNJbpPz/7cTJnbdJeN2m+tfVTQ6aubIaN8iWVvcmSh+G+sevSLqi++/XqioWcHb3kjqApK4jgUD4eM9YO7PHPWPevdDENAQ04eOszGopM4R+0Dn4BHSfBHnh5TPeC32JGZSiKOUhZI2f46vGSGXGzZlWAF8LiR52iGR+4YUgZnCt3VnFbLJu2voboCfh9KC+MDHtUlQjL8ZLOxkXdBTv0TzhXt9gfzj9pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJHwk+Eji8yY0AroxRy7jYTxAdOexbd7Z9zB3Z0aQmQ=;
 b=jIAI6y+4mveS3saMg20uak8jb6hZgAZ5Q6NNp/CF5FVDhGNs9mz+g26ivabirJSERyMVGftaBknRM/FkIg5D2Ld3Sar8TsF6Az9UJuydSfaMr8lEnQInpmNZuz05IihoseRqrz7E3Zy7Sa4Ovmij4DCzTkek/Zu9koiJp1dGZYZEcqupfxvQNyLAz8NgdxBHeBXrfYEEOUR73bBVs1vta1dTSiNmBExEK+/qeZkDkXuwNSf5zDVDPztFdEZ27199CavhZSynOAnMuzvZ4Xt6aqcmVONWsdpGMASAxc0H09QXrl15NG+HwjQCRme5gmYdmLzry7LwoIlSqHcfTtEniw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJHwk+Eji8yY0AroxRy7jYTxAdOexbd7Z9zB3Z0aQmQ=;
 b=QW9vhRfrHUkGfLPDhm6CTD7ohDFylZbAdioxH8b024ZRBcAL/n2QG8/lemtl7RHxuf1qQJwJqFpssEkdDM8fj6vV52DLlKqkqY5IB+mkDPEElKqQruHkPBuE8NRnoWMw3YaMJ9d+HFmuS8dxPvM5/6lk/2toU5OI1PvJBiGiYaB9bXZ+bu3jPR+dAclkNl6onl6UjGAn++3WclsKQsDMGBKk3qMGZmVcng19OEk9Ig378aLIyMdvEZesTL5gssS4DTIfV7wUBu3Cac3Fxy0a3VRZK5bt7tg3VRrB59nllVzyHLBNLohmgBXUXRM67J6cOyUaqeqkLEfmIV2FrWW9Pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DB8P189MB0700.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:fd::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.11; Tue, 23 Jun 2026 04:45:51 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 04:45:51 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [PATCH v4 0/2] package: replace copydebugsources shell pipelines
Date: Tue, 23 Jun 2026 06:45:46 +0200
Message-ID: <cover.1782189065.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9::24) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DB8P189MB0700:EE_
X-MS-Office365-Filtering-Correlation-Id: 97737a60-b09e-44a9-3ec9-08ded0e24d41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	oCqQj0Ds8uosnquSGHfjSzA2rHUQOcl9dP1zjoASvDlO87yRv4FldQyYAwbEwxBom6JEJmrFkv/TQGCsUaFjHM5jI9XRlESJGrISTP6Q+G5eb9+K4Fz85GFdrQYTqNcAlCNngebikvllPr/e/UmdwPCoPacWI4/b3zez93Sf39Viq4146wX40BrVQkXC1B37wsH64u5DShm2OWaTKNExQ9XDT2z/vz14gx/+I5/cHKKgiOON6tw7/32WwgS5acvC8mTcBbZjx5SnUJ/JNNGckihx3W586JFp6p8qzL7eP9YMK+7rZuqerN9J0UczEQQHKyvSIjpt9ErGODX839bc5iGUY35tLO9X+Udg0YHIetN3ishd8jYWtssX7iwhNx9sYW9UATvcWmPFTDzrY9BJgTjZxNo2DXISAqWtxIZidsqe1tPVL8zXefWYm2dmqZUHZj9p3nxoslEDMmtiMZXpkvUWMX/XAaagdbRxDTpCunQdN3OvPsQMRQLB3jnG26DBpeoITh62dHKe7vKMAQaC1lu48NWxzRgnTrTTKQbtiFHtH28nX4a9k5WX7ZB7LUP9UztkEja6ciume2H51HcSVMP1ZRLtf6sW1ZAszV8mVj1VQcK1fOEIslsUREYh3BnPPcXpF0WYxCfowbdCbK8h9C+sr4RKsLA0vup+Fe55ECA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JtPD9S9nPhN5iVAfbfddL9LBwCgPpI/Q3ZVI9UDxv85vvwxLnk2qq4UywnXq?=
 =?us-ascii?Q?T6YTpiqlBXzS4KhSKOCtrGb78ZEOsscLW1e5vA7DK7Qp0Jojsp0YlRNMqkcl?=
 =?us-ascii?Q?GF4VT8VCdl8BWz0QzSZ+niSVbvILqh93c3habcfGCwZchIC8yfrC7mCgUIZ+?=
 =?us-ascii?Q?3allGKU12wrMydF4FlaM42QpZPAqfywC0fXNG6GXD9YlATg6JDHHB82Vj5gC?=
 =?us-ascii?Q?5hZg3NVLoJWKA23PHUIDJsZNlVziQd0+A1L/NH7KDD7fo/Jzv0j9T60OgP2X?=
 =?us-ascii?Q?ofJusRDyIJ6YSPvk7H3LTzVcYCUWNh5ENwMcbPDdHBvzVFx0Bd6Ab/FZ5HP0?=
 =?us-ascii?Q?OkhyZB0ynaC0IXUdE7xm6frmmh/nB2a8HO/UaOhuxoAn4LoIl1VRE8A4JHLn?=
 =?us-ascii?Q?4Zic4lDVqFa7h/c43msedtrLHkFQXz1HZG8s4Eof7Csqd9RKf/XS+NNp8IDL?=
 =?us-ascii?Q?oPddiiLdlam6cfwFZIqz01qyIUsAOkNzdWEowJGPxQ4KJclosYWYqfoPP9I8?=
 =?us-ascii?Q?7KVB/M7vQvjDMkCnVFLtVqsSiQ63VtM1igcz0AsJwkPJR9XfubAi9939QtLM?=
 =?us-ascii?Q?Ts65rJaBPOrpLqXbii/i75k5UeMeTh1VIogeXozBXUB5osFvz6EsfUeKatp+?=
 =?us-ascii?Q?ZndvbJFKYAUIlfWkZq1U3yKBNg51mHWQnBBncu9++FQOaAOwRaBRJdiplInL?=
 =?us-ascii?Q?Tdh+6D3RV1DjqjNoHQ7nSbHZrEZU3UIrfkH62nxyMGtzhldf6aZEQWxgnNjV?=
 =?us-ascii?Q?/IW1zwor9RiK4OuKDcEa9G2+gQ6lHVRvzqHc/rYnNTNB16ofNcKzNkGe8uIj?=
 =?us-ascii?Q?CEtJa1FWHI5WYC1L+ohCDLQXZ9ml8BcFRnnwh22sWpv2BLuztlMWs4IvYm3t?=
 =?us-ascii?Q?cujk9434XEuWa+oegL8u2otfdTlgZKo9/Z0rcXyyrVI2aHoIMABKcnz1sZyA?=
 =?us-ascii?Q?ZnNrMli395hxn4EFad5SrdOCxFFxd7QRYrPalzCYp/XLkqU+RvBsoLOUZGxL?=
 =?us-ascii?Q?W2Jw0WtI/w849PnUAW8nFFlC+FvYhNzvSWNZ8+cSlTHcRxJM0AmHbGNEbvrv?=
 =?us-ascii?Q?C42waQywIBEJoF4xTxskeQlds0tDO8+0/ipUWy/P/Uk9nh6A/inksLnOvZ0H?=
 =?us-ascii?Q?k9nO/4Z2k8rA0pcyb2gnVk4I0QlIvEFCtVXwSs1ylNWQABi9uYAmnX1m00Cx?=
 =?us-ascii?Q?2d2fS20oFyJtD4aXM5bF7Asc1CjQvVkkGEhSQQDXtR4GFN9ZnYemKs6Km3MU?=
 =?us-ascii?Q?WlH+0tNojxpsZ5j0NuJiTf8Mf+0eJNF5BwO/3YKxlRx3EMGR2qpcK305DxN5?=
 =?us-ascii?Q?Oy6LqTeZ68ZVsUYB55cNw+RPQqfrlDoi7OeKSyZrxJguZibGMy/Iys+yG7PN?=
 =?us-ascii?Q?6Urj9S0f7kdXDK/5aCYrQWC20NVW8vAXV8I/MaLG3DxPBCFtps6MTcvF7Qri?=
 =?us-ascii?Q?apafufbCtDD2GxFLcpQ45KLmRtLlTAPOy3jJ/c0MRMSHVJoPQonuW+9taIhs?=
 =?us-ascii?Q?UfQPvLKMUoJkoZc2Q4gwo0iCKO+fPUC72mMlBNcEtEKYK4Z4DIIJ88iC7YBp?=
 =?us-ascii?Q?sLwPB8pJ98LmMSfgBt3J6DsQ+aQbPsytETCMpl1P5XYkP2T4IDZtiAleob1J?=
 =?us-ascii?Q?OKYjb7pV6bmSVhQS+6w1W6jaXRx4DUn49eHwE7vW/UdhJ14jJjlJdN4S4dfC?=
 =?us-ascii?Q?Au1rAmt+vdfCqTFbb2/fuctyuDR0/3fDCDPagLn2meZhIIE/YjFG3xv3+yqA?=
 =?us-ascii?Q?+gockRSBcA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 97737a60-b09e-44a9-3ec9-08ded0e24d41
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 04:45:51.1514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lRbXrX1V52ObjfRBrRrTNEcA+eqSp97HrdYF2/dxKDLHPGqbGBW5OB7Cb8O+Y3rIByaJGIlrQalky/f2Hwio0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0700
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 04:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239327

Replace the copydebugsources() sort/grep/sed shell pipeline with Python
filtering over the NUL-separated source list while keeping cpio for the
copy pass. Use an explicit prefix + "/" match before stripping the mapped
debug source prefix, replace the symlink fixup pipeline with os.walk()
plus cpio, use an argv-list mv for externalsrc relocation, and pass the
empty-directory find command as an argv list.

The externalsrc relocation keeps mv, but now with an argv list and
glob.glob(glob.escape(...)). This preserves the old shell "*" and mv
overwrite semantics.

The first cpio copy pass keeps the previous failure-tolerant behavior,
while the symlink fixup copy still reports cpio failures.

Benchmarks did not indicate regression.

Changes in v4:
  - Rebase on origin/master instead of master-next.

Anders Heimer (2):
  package: replace copydebugsources shell pipelines
  oeqa/selftest: add copydebugsources tests

 meta/lib/oe/package.py                        |  72 +++--
 meta/lib/oeqa/selftest/cases/oelib/package.py | 274 ++++++++++++++++++
 2 files changed, 324 insertions(+), 22 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py


