Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0428BFCEE86
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 11:29:02 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41976.1772011850693645706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=ZAXdmuQE;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.59, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mLDIQ3+jJi+DUFgXSSR17nG/aJ7QR4t0iRgFhJIoZGBZMBf8Qb8w2/i2BCCXquxThRzJ4xp7DQrlv3xf3cd9e2Fb7FjZrLK6n1usc2oh2+yNReAXnb/dYd+7UOZsgPYJlMlKbaTlennCbFQ5vwawPIxrEl6Tp47vKlLExtyIFwdhdJHM3SqeG82LMP7UNlB6EgiiQk0eKHoLS8zP+szJ/HT6K0LBo9+hmEPYsTw46dUnyGUBzniIWVYx+XjXFtflA3nWGSXP2c2nwBv89ePVTy3AG1KK6bFLJ/KIEVNcvpGGqOElhEmeGlZQuu8pfU0+2yLQIXyUwKIoF8w3jbgEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJJZPmCvxSYK+zmG2INFTBgMQqimyyCk8sEgmx/Sfro=;
 b=rEKlu48CbKs3Bz1P/EYs2QAquhRo72JefZ9ZIHJKo7WOxZs50iX4GnyoqH7BWhR5Fx0LlojHlzF9/4UgT21705Q9A1DoFt91JEwWHL019APaIPz8mXWmJHvvNYgIHL7RWluf2F8LieacpUStGrpr4ZTSixksylk0h3pR+zypn+oXjjcxZK9tyTX8vEx3l+p+5KLe4wzw4lowmgxwfCJFX8IidR9AWKb8Tk0ODYVTIQdDj1UOmiwMYzfg/FjGzugzxwaDyF8jgYoW52Yryqrm6H8LWAPmSF2JloFYwMKgP6mwUhAeSekS09afoyjfVdNi5piETQYx/seCEoihd6DSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJJZPmCvxSYK+zmG2INFTBgMQqimyyCk8sEgmx/Sfro=;
 b=ZAXdmuQEptHZG7+oGqcB+aPCLzKbSZSPBRIaCz+dorWAIT1Hg4rGsVdDyUiC+wWdHJQVZLsdmVcXFOJ0sYo1seCBEx1aOGW4h39GMVfzL+g3o7gBZziBpOhbxl3NHsKhnCHGqqwkFQB+blXSeTWGRC5LZ71tRqO3XSUnUF+rEKAh80swj+s84x3KKuNDZZkhDrfPTlVXtXe7BPqZnFdU5zu1BqFsfhwQCavCFKGUbYGMWtRvdw8nGgBs2EoNkQIq6s376Kl7rcccg/E5SL3nlxIJ8BqneAkDFQl+MgcF2aKYQeWTWVFfF1NBxu0PIJx9PRrXOkyVh0uo1L+Kfg8J+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN1P287MB3856.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:256::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 09:16:23 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9654.007; Wed, 25 Feb 2026
 09:16:23 +0000
From: Nikhil R <git-patches@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	nikhil.r@bmwtechworks.in
Subject: [OE-core][master][PATCH] libseccomp: add diffutils to ptest RDEPENDS
Date: Wed, 25 Feb 2026 14:46:11 +0530
Message-ID: <20260225091611.3758945-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: BM1P287CA0004.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::19) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN1P287MB3856:EE_
X-MS-Office365-Filtering-Correlation-Id: e5617e11-8d9c-468b-5487-08de744e8bb9
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zFTMJTJxfYFBUCq7OyJIJBLDWLgb3DFk6jWfR4c/Z+4sYhkcvxYP0lq89cq6lHeJ6L3JTXYN2N+9kcYTd8Bx0n03OXSHuXazS0psIuRzQQwJb+yAyB5V63POnG57h1nrM5PLud+zx2YQYUqimyhHwDIRMwyO25Xb2rTSIF4I9No4OsS+YptOKiVvm64khZT5yW3CwLcB4flXuhsmGxZQya7bccLiXw36BxQObrT1mglIUh2qkVjGntEg88t1CfjWd3I/bVFc4bV6mXfDIYXIXfHY1rYJrR+LgnuxzEEECKyQLna6/V04a6fu+xeb4zCbqSQ+ujSYug4lGxt2yCb7BuVBwqWuBF10EUDHDyyOOrfCxXgsBVSmhDrog/cTSTPN1ZcbFHHyCZEvWnII1hnmBTZd3O2xNNRy4wrvvx8pr7T4qtCORrqjNFeVvsr8F6/A4DyJixDItEmgp0BOoAYdCgTTMtjEpn6Ct+OAlbjulUgqYaS74SPiMH4wqB6RN2ZisdeHwUtpuascZdE5eNZQ1y06MCmwIYAIrWxbniz6zt3LbmzrgwUL890ER6MYo71OocxaohUZgAHrxfXiRGU6/9IZBgLQxtJF+3KhNjJedzCDVLyk4Rs/Qx0bpE3d+ihS0XpjK5dTIIbfE7OatK+VpgXUBWBAFye2XivlBuFk97W2GyKts10VkddBV7bfmxhMSFAwv459P6iLV0g9W5tIitDw3pTwwZWm1n7u9KfGKKz+VjoTGlVgFOHSqAmDPP5R/e9KL3jg8d+kJsAtftwMj7eQdMNzxvDI4tjzSn8TvI8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c/TBEhpZICRBct3v0u1pZFX2UFjjCVKImL4a4b79uq+MHj0eelOW0bVEHXOg?=
 =?us-ascii?Q?nix6ku0o4Y0Lo/vp9iVRxbd/YzBsARbT1SKcGIDVS+U4wgU+rr79MuqmuNMT?=
 =?us-ascii?Q?a6nRn26XjJigoKN/XQBkXMmGuioCM1BW/18biEVx37hgHLVey7nPPw0Pdbvf?=
 =?us-ascii?Q?mkRAinTKP/wRuGoIEqZO57I0xT4KCPUmU+vw9BRIL3fnZmt6XwCsUgDbsiBA?=
 =?us-ascii?Q?hOvbP/94ERZ2ErjvdX4LdSj6ALcW5Z6CVHntTssxsD5MnvWPnTSx2yjk2vdh?=
 =?us-ascii?Q?Wdpqi2twLxbaYdqSn5bR4Rp2ntT0eHRBNp/D8FARR/R8WM3GLwIdk0rEJIs5?=
 =?us-ascii?Q?xabGboy4QiSW5QVIPL/CEyLhPv3eJVXJSgql2TQJKYTEOKgw2va6dnxlugQj?=
 =?us-ascii?Q?3qPsW9IXDezp10s25UhOMJMNU4s1xdV8qjD4OTFag+BBJZ8h1sDJ6iwzdAz2?=
 =?us-ascii?Q?Y927KM/jnH5KwhPNCJp8AFp0iJemmfq86fL5bE/KfNBOB+1lGFe1W9rRqRYK?=
 =?us-ascii?Q?lUZ5G+w1QfqhQWw1UPMJ8iXpfdTYFKQ53txn3FL+jfwyK/kWywGNhMsdtrVD?=
 =?us-ascii?Q?FWPj/jrzzg8BwIuuB7yy1aAlcIUroZbsvGZVBTnQzn8QBAZGwbLCE/Jjja/C?=
 =?us-ascii?Q?w8gFAb/vJ0oL5AvFY5fB2iwIFnAzV755fXCW1J3rTEzuBXwnfdn4ETTynx+w?=
 =?us-ascii?Q?x2a3eAWqnLQO1kP1TlVtGhYo43tXeGVVP38GorLKkJlDTT2IddyZjTZOiLQx?=
 =?us-ascii?Q?L85q4VxYq1JDQIhIYXvcI/XS2llZdLTuxf7Z46FnoNlaAAMce4EFa2jBp5Gd?=
 =?us-ascii?Q?5AkwIJDulOAAGSAMMRg4macBvBqswJK+tVMdeLDw/jd+YDJSK1e3s0iAVH+F?=
 =?us-ascii?Q?4q/1fU+Gq0EoBayMPIxp2EnKHdHK6iiwIhZuBKbdvrIMT4fBVaK6ssa5jv+j?=
 =?us-ascii?Q?CFiIixyaAOZBr4Co8tRtXweRM47AuiOFs7cbw0ZSdD/B0FSyFCp0pjDdS6GK?=
 =?us-ascii?Q?msZT0WLqSJUNo3AjkwtWvptO7fJ+ruefQ/7NQOUY0wCMYrMfGirDZMaGJKY3?=
 =?us-ascii?Q?TMwf1BtKXFC9/lKVV7q3g0wzA2Y1EUOmj0j9ALYfUSSg2IgeZTEc4nzYiCPa?=
 =?us-ascii?Q?Ry/XrO17NkCR6Pj38jjwKuCV2JFsxZ1deTiiMDqpDgAH8bUwqDJ9JwNDj2s6?=
 =?us-ascii?Q?YtAOahFJ8SNaWpiYU2d8Y2pmKcZB6uaI8RU3Cl6bqC4fYfg1FTy6liEVqWQO?=
 =?us-ascii?Q?INBr7mlx5THLsnuVxErBRgTFr/cnGf/Ia3boJL5S4rEwf8FemSuLOGC0PfMV?=
 =?us-ascii?Q?qFCdaXFMPL1hQXTTu2t6VxfxTwjDKJAx3FQcxLU+BcyuShShdoXJ+3YNGcLz?=
 =?us-ascii?Q?LfMBuOrA1ndf09J7UpZbNwg6w1qt584hxV9HmI0nh+ggTdWCJBkhes5v9XTy?=
 =?us-ascii?Q?PdQF40Hwh899D6UsIjEr0ymGwKKnXnSfnOwvKorfIhXvHeNjnIxmh+H22+XG?=
 =?us-ascii?Q?m1u+608jUPGU9yQhD0PKtTMWUCbpXx3sDmDSH0nyy25EhS9J6NY25c9RC1jd?=
 =?us-ascii?Q?/var2jN21pz+olOTdSJ2A86oqTvuw7E7sZyMDDN6U5Wk2E2kGUi1bTPUbfx1?=
 =?us-ascii?Q?OFKEKZEbefn49erJNdTRFjc+ea0el6tfiXJl5dRJM1fsS4LlhMJ9r0GtgJFV?=
 =?us-ascii?Q?xoH0bA=3D=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: e5617e11-8d9c-468b-5487-08de744e8bb9
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 09:16:23.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppkpSf9b0nMoM9c05kuI/RcEI/UN+vPmyx7jKwP2n6hC5pV+B8UcwMBt7oh+9IO50sry1dCDx0jtjLVHJiRfEdwTqZ3hHrbt566Ad+Zl8kg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1P287MB3856
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 11:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231950

From: Nikhil R <nikhil.r@bmwtechworks.in>

libseccomp ptest needs diff during test execution,
Add diffutils to the runtime ptest dependency.

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
---
 meta/recipes-support/libseccomp/libseccomp_2.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb b/meta/rec=
ipes-support/libseccomp/libseccomp_2.6.0.bb
index 9bbdc6b833..b356862dfd 100644
--- a/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
+++ b/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb
@@ -61,4 +61,4 @@ do_install_ptest() {
 FILES:${PN} +=3D "${PYTHON_SITEPACKAGES_DIR}/"
=20
 RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'pyth=
on3', '', d)}"
-RDEPENDS:${PN}-ptest =3D "coreutils bash"
+RDEPENDS:${PN}-ptest =3D "coreutils bash diffutils"
--=20
2.34.1


