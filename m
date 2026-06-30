Return-Path: <roland.kovacs@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E55C44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 13:04:12 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20927.1782824643216728830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 06:04:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=I8YaaXxg;
 spf=pass (domain: est.tech, ip: 40.107.130.16, mailfrom: roland.kovacs@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJYUpK3YJa4Y2yy6MofRWoJv/KhE71aIlfgCtataWqbqWaSpm5iz9Yn3cL0MH8RhNAx/xQhSHp6IVnalTyqjCWGRB7BX2uhv7FLNayT+Ez4dZJoAZeNs4OxKKGAjrvHZjx29US3PaXWBdzauFatqFJnYiw52u6RpvdlYNAEL9HRpTyARJgnlKO8Vu2Bk19OJK7LmQKrVaxuGRZn6tIqBgQSVStcWb/9LzIow11/p7xpbhXIM9Ndz5FrrAVtNWRSgAr4pQLOUtYG9xlb+tg1VlE6/d4grCtPuS1gOsFaBFRrP6RCeRaExWohKxisFZxymLg4U1FCuyUscPpygVNBFDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3jOGiWaTEvGVa/PCE1u+DThjSlRuGTqt55uOb/vyNqQ=;
 b=vdEhagCciMOHLtHpjoD2PdA3wLVVrhW/Y7gdAT99hlzRWOdJxDBpJdZ5xdQIl3c2e3Chaw47f0jvwvaUMW/SC1wEp59bnWU1RCjXk4tpqD0zU3TfzjiapmTUCu17Jn4ZL8r0BeCZ8JVZqF4tW/PgjywGT5uqX2AnMdqHg4KkQYt72qxslEE7uvItdIpXN16FN77gnqvt9ySSvED6bi8HFs5uJDnbjtoQrHMOe9iqzFrmfjdzg9CoR//8wNgjhBx4SnoYmjaYBZ8SlIl51yn9bSirJ6gFtBsz+NryMOq1TIlP1obs1s5ee+IRuc74LwrFmjKuk8k7rbg4XCOvRHjALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3jOGiWaTEvGVa/PCE1u+DThjSlRuGTqt55uOb/vyNqQ=;
 b=I8YaaXxgNPLIJUEpq5T0FL0zrAYgw3/T6GYfKpKZzHyOyMGzixjTRhzz3gMOISEg0256J+QLTv+5DdJ1OSn3F2pQ8+1bYvkaSrPDy8l6ZnbhL9Fz7sgEAvxidsozCXrsPhir3wuycLK8zRpLqoMb7u61jg8OCghqA+Z68FtapPtjnNwj5b8yf5Kg1gx0vCvjoyJepspsCHTSV/iWZUaM+QZU1RuJpBNr5LIWyo6CH4ppKamUt+As5L0y4hCNAjoMQXg1XRZCI1nk0hH05pNRzZIqjU1ehbdukYLxYb3DFFe8SxBhdmkVL0nPg6xhZHrmEPlTy1L5kCeWsVzjZWli7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:111::20)
 by PAWP189MB2777.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:46a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 13:04:01 +0000
Received: from AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d]) by AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 ([fe80::ab4f:3151:4330:625d%5]) with mapi id 15.21.0181.008; Tue, 30 Jun 2026
 13:04:00 +0000
From: Roland Kovacs <roland.kovacs@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [wrynose][PATCH 1/2] gnupg: Upgrade 2.5.17 -> 2.5.20
Date: Tue, 30 Jun 2026 15:03:57 +0200
Message-ID: <20260630130358.71091-2-roland.kovacs@est.tech>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630130358.71091-1-roland.kovacs@est.tech>
References: <20260630130358.71091-1-roland.kovacs@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0412.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:189::21) To AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:111::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7P189MB0725:EE_|PAWP189MB2777:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6f701b-91cf-4f2f-cac2-08ded6a80dbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	p+1f0sAMzc/oybRFshn0AaqOdzXT34KhIbza74iYuQLsIHjVlWvq+Rsu4uhZMPrVamTUlNMDPpaldA/hsKM3rKzfAEBnGrOVvQyRLrkRdVz7VdNN1pHEEQdXR0+rjKQYGBC11tanuvEI8tpNZajbiGwmAghT+ELVlxlddMGNJxeEKncGYiSRQrlQM57GsdzV9aU/BYDqxf6yPKxi7Gxo7rXNgcvwApsnkC2MPqJhVCrI6T3Wlj/ltg+44jHWGS2H+i9BGVyq/4Tiyaue1KvlroQmK/gPja8lZMbnlELab6xyZnZ6vcOfdZF60Cq796O8YIovdF5F+tezygQfWPxxsZDdYdxFKr/EYE++nEb5x21tU5cWASysOHWa39KF9oNQRB1pl23yTj5puILDwia4sicWo+xoTV8Ni/tcdCPCW17Gd/mA5ypcZ5Urdh6OwIKuIep3I/Nk+r4DzFo1aiwkR9HHYpZH0IDBZ8s7wWZAOOI2qRTDXbLSeoZg2qtDML0+/M3ur7AXDq5Jpq4WXubGfIQXGpCUgzhLO5WmQMQrH2CvphxtNwV3DHIF445JsQdhfh23L/UruPHPytFof/6ybFwQWpbhXBj1Nld0iaLlYGCJ/Nj6Vz26IeHSeJ509/4s
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7P189MB0725.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OPUrV9B+GxTCeoYxVTXO7yYMbYjZ1u0RV59t0Tzl1N29G5PdGibUh77TSnuu?=
 =?us-ascii?Q?oMq5C3QSrms4pF29VXyPlzvJxZNB49bcX4urtMI7RazEC1m5P0OgVUNkKKOq?=
 =?us-ascii?Q?FCqV3Yxi25j+f3tfQu8AE+J6LVJrO0Ed4MpEMOYAUnFIGokEfhAuS1Mjsibr?=
 =?us-ascii?Q?EJajDIbGxgIMzosMr+xjBwh9XurxPk/JEf0O6fVE4RC5RdIUbPFo5wOHg0k0?=
 =?us-ascii?Q?VBRR/1zsYEuFreRBnqh9cCTSwp33jWGCsFGefVWrGHjNqaX8rw1Mddu53itC?=
 =?us-ascii?Q?UdF0+9cUlCZUv+pKk38Pj+5g6DjnqtXI6eksAvFuYHowgjsmhCmdmrO46mOi?=
 =?us-ascii?Q?b3BcnHJuRQOfBnDaBJ/tfyUITugDGgJ5uW1466/LqFQSDCFGfkf0HK4u2Xo1?=
 =?us-ascii?Q?PNc+JXKAdg9sTSvRfkrXccpUuRYpYIq0cll3fMG3AQ9y49R0ZNVw1iy75obR?=
 =?us-ascii?Q?pk3teIVWb5638ZTRcZDuTUDW8Ak/sjmv/aaDP56A91oOZGDVij/O55VAxE48?=
 =?us-ascii?Q?0FpY73LWIXC8XLXNsQqCtvHPojjKnt6iE57BHDcVS8IYvBreEXyx2Ykq1QqU?=
 =?us-ascii?Q?XvFcltzYTshqhADvHv/QSji5GSZVn66dRo3S7ufxiE5yvDlpl2aM11a+17CF?=
 =?us-ascii?Q?O3ueiRHDMtJb/XS2AyRaycHz06sDzFqFHf8xZdTZC5/UzCvv760mQkm2qsil?=
 =?us-ascii?Q?Ihms+upQSBCR0pM187gCrYNCAhKERldaty1vuMPmOW2Ww6NV5b0falI2kH4o?=
 =?us-ascii?Q?LJGah8AAndhSVqBeFzVuGIf5ax9uqP6nB+PklxzXLIykpusiu9iWdw+GJZOe?=
 =?us-ascii?Q?NZFHpuuNYyXQt3pWn9kMeX0qeN7llhGFx6nqSIeyxnEYAKpfXa55TAw/pr1w?=
 =?us-ascii?Q?rg8pRivKW+3S0RqFOFoN82bdgL/Qd4WAoFGUiINeoG1WQQG73MqIBOvVefVF?=
 =?us-ascii?Q?4y61G9v04M+TegIz1WnHp2Lg1xw65scyXqd3fr71g+2WJUFsHquRH3hyk33O?=
 =?us-ascii?Q?oqIF/cgtC94Uxv4dNlxQ4UjfH76r6P8YXhqieKS2HbICoLUZMljUKcSyLuX0?=
 =?us-ascii?Q?CcZ82zx8donsoQqDlSnAJdACyRi9a9+xxDZgL1+BrqZXlghsXU8RDTjumUt2?=
 =?us-ascii?Q?aXfLBV7mBoNTJWBm10tGP8VC/J8gKh9QK8Io8iUk0SbD4BpAk0l9fk/qTcFp?=
 =?us-ascii?Q?WeQBG+Xoc2SBTJFGx5oG5Ca1dY6FeGGur+3XB51DApveEE/ey8H+a+BseztB?=
 =?us-ascii?Q?dhoMi9z6mLC9WSLoR3yzhlZVUgCylsHeUPN4r5xgGgaDWO5hIElc7nBpv8Lz?=
 =?us-ascii?Q?BNAWy1jVD59dOhkaFgNkfEzGlhH6wuab3ZSfzqDR5BTuAhJkzyTIoD1BFVBO?=
 =?us-ascii?Q?Iff3OEP//tJ+AiIlB53cXHG29nrQDZ0xh7C/LXyYibHILm9MOXCtZtaZgcaz?=
 =?us-ascii?Q?FprYDmhynV/Jixxbe/q0XaG7JKvUEaSA1Mt6p4mi2VTuuPW3lqaXFzKly0e/?=
 =?us-ascii?Q?7mHszCX984qoZ0hy8powjnnwJuRFwcrSBNkB4lCEvNddr0NdLPsbp3l+ym5P?=
 =?us-ascii?Q?+drIXTdPbZ+ck9rTEuOmM+7MDXNX9TPLV/cqVpu4EFoo7Mo0+viVNLatgCL6?=
 =?us-ascii?Q?7g7LAcWvDYijbtK0emK1KmUrnlirT7OgCyrsS6QtaArFxD6PG5bQgpt2fl1Y?=
 =?us-ascii?Q?PJ9nBuMQCtbdC8o2e0nsLePgCQKu5pDQMAsnFuofeoVCn1SWF9p55i2rEX+0?=
 =?us-ascii?Q?D/UBaRkwUQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6f701b-91cf-4f2f-cac2-08ded6a80dbd
X-MS-Exchange-CrossTenant-AuthSource: AM7P189MB0725.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 13:04:00.7379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hrz3UaGEx0WdJZqyCsgcEKgnCHJZzeyLF3H+rWk150khXWxcar1iBTV1V9y8/ZwllWHp19Ux5yKRzbU4FHFPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2777
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 13:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239892

Bug fixes included in this release:
   - gpg: Fix wrong assertion failure which could very rarely occur
     during key signature checking.  [rG693f5642f6]
   - gpg: Consider certify-only keys for revocation signature check.
     [T8196]
   - gpgsm: Fix possible double free in the CMS parser.  [T8240]
   - gpgsm: Fix possible too early removal of ephemeral keys.  [T8236]
   - gpgsm: Avoid emitting a final FAILURE status line if --status-fd
     is not used.  [rG69c27fe377]
   - gpgsm: Fix a regression in 2.5.19 for password encrypted GCM
     data.  [rG60a823c97b]
   - agent: Fix not using cache for pinentry loopback.  [rGd4b608a31f]
   - agent: Fix command PUT_SECRET by saving input line.  [rG1875bc185e]
   - keyboxd: Mark keys searched but not imported via LDAP correctly
     as ephemeral.  [T8048]
   - scdaemon: Avoid buffer overflow with SC-HSM cards providing RSA
     keys > 2k.  [T8244]
   - dirmngr: Fix uninitialized use of the dns_any union in
     dns_rr_cmp.  [T8251]
 Release-info: https://dev.gnupg.org/T7997

Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
---
 .../recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.17.bb =3D> gnupg_2.5.20.bb} (=
95%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.17.bb b/meta/recipes-supp=
ort/gnupg/gnupg_2.5.20.bb
similarity index 95%
rename from meta/recipes-support/gnupg/gnupg_2.5.17.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.20.bb
index fd6588769c..a1a50e2384 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.17.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.20.bb
@@ -16,6 +16,7 @@ inherit autotools gettext texinfo pkgconfig upstream-vers=
ion-is-even
 require drop-unknown-suffix.inc
=20
 UPSTREAM_CHECK_URI =3D "https://gnupg.org/ftp/gcrypt/gnupg/"
+SRCREV =3D "343d0cb8910441aa44c56ce8673a78e137040c87"
 SRC_URI =3D "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-use-pkgconfig-instead-of-npth-config.patch \
            file://0001-Woverride-init-is-not-needed-with-gcc-9.patch \
@@ -24,7 +25,7 @@ SRC_URI:append:class-native =3D " file://0001-configure.a=
c-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
=20
-SRC_URI[sha256sum] =3D "2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af=
4bc3a10888685d"
+SRC_URI[sha256sum] =3D "6461266e99c308419a379abe6c356d54c214136c4589bd6595=
1091138989ffc6"
=20
 EXTRA_OECONF =3D "--disable-ldap \
 		--disable-ccid-driver \
--=20
2.34.1


