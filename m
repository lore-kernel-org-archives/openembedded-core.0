Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F3ACFC503
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:28:03 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.113])
 by mx.groups.io with SMTP id smtpd.web10.50170.1728894474603875736
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=rIT6xUQv;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.113, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuzE1ucY1ngtW4YVADvLuGSgjaGYuoTlCE7PBKTIhl3Z9ShHlEt13e4ylG96PaGLoso4vV47G0e9TigbD2YH8/qp3UahDRojzOwhp8fw48hX+edgdbfrLESKa1EjYDftX4Umyc2eg4WFAYAuMsriA75lNEfT63v+yez5DFACswJbsXq5rtk7Y71DMNIXR4ETfcNXDI7xSpXCmC6RxNW7kMt8oi9ZiRFVnDg/QeH1i3QsBlPEPfyTfPCUo5UvbKbpOsFf2SkjIEidUDbDHWlUqzTQ6tWZxXMTeSDasgHtBGqToYuTD7KsaFUjzA2lCQ2Ogt1gsqNkn00X+zTlKVrfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRPACjcE1bGPwC8hM1OeEBFuRMad8quODlGkOAfmt90=;
 b=mNx0c+G8imJeGsqN1MMgdQ9EVEgKGz5wseYXEwyvdZHXxu/Ak8+z3KQzvqd+fcEHw206E1ZRpWj8wz+wVk1Q8LvD2VcKTzYMkYv0/aTojU1jb8NxjtTDlICM63eOYY5tlMhtFsVWAeHBZQyDOYoiaCxc7LhUZceca29SC0M93liEgdzMOV5vyJUf6EVzIjLpyTR4g8DAIcghTzCQHhUnawuLi/27v7ytyEpRSFyy/mhsP76vGcTN/ZmI4KmlXNNEWRD0+hOSCL9k6JIXvXn+q3/f1OAJ9O4No9+5XrQxlASyPLaGUTxhGVx2k9RrDVuE9P7Prd+7Jlp6yTRvhZsQYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRPACjcE1bGPwC8hM1OeEBFuRMad8quODlGkOAfmt90=;
 b=rIT6xUQv34qw1daXNhay9xj9f6z+dye2Y2Z4++KScq8Qgy2Pwgl/JVocnRcBuLoM1WkL5QeDI8nCgvUvfsOK2hjf8KiA8rDnks0dki12ZdRu/qx7P2UUJFBEVo80kOjMZ8WSclFdSzAg9erWu5jlXOcj6oaO0LGdHTc7e7rpXRiwsxzEGtx9yCul72WcgoIUo2B2K618zGfGk6l229YvFc/es4XrdW3oOQjSSvVAg2ciB0jRWX8U9Eq/bh3icok1C1oLu2EA5uzXZZpHPe8qY7I+thIL0NPjfvwaY7Q87td0wk76IQTl+z3/xliBdTy+Ezt2bZNf+dOi3zUF6gchlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VI1PR06MB6560.eurprd06.prod.outlook.com (2603:10a6:800:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 08:27:31 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 08:27:31 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/2] bitbake.conf: Mark VOLATILE_TMP_DIR as obsolete
Date: Mon, 14 Oct 2024 08:27:04 +0000
Message-ID: <20241014082704.841698-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241014082704.841698-1-niko.mauno@vaisala.com>
References: <20241014082704.841698-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000045B1.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::41d) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VI1PR06MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: b595d264-4a79-4d3c-7366-08dcec2a0bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vVR+Zx/aQObSm+y65oOKyzkiKpCd5e+pPs6v75tI2pCrvW1xiQ4WD30nyPA/?=
 =?us-ascii?Q?PAChadMH10Qj3s5oHNw+zYxX4BTHoMfso13Daw2sJW8aux42FXOm0RKO88W0?=
 =?us-ascii?Q?G2ybbCSxxAezxevvNrtsITCEEh1nsNoa6gIxM+84XKXHWAgOORNKru8UlPFD?=
 =?us-ascii?Q?S5ctJjRM9TBA7aQNKx4PZSgnm8Btly/zBHxdxq7Lb5Qr9hwX2Nxrg44iWKhM?=
 =?us-ascii?Q?hGZ6jiDZAK8XmWHMUw/kzvcX4wU44YsfYfOOXZiWheRWABot3MEEFiPoldMn?=
 =?us-ascii?Q?Jbou+CqAvTDDrk2mQIoB2mFPn0Cz5WfrV9GcX7Qw4ZB6ty4FdYAOXsQSBQOd?=
 =?us-ascii?Q?cBq2zueFTzlalNPA3IrJigjO4EACy+mGnFdX6kv2AzMk79VDJcvJKWZOA2eH?=
 =?us-ascii?Q?pomykamDzn556gcmP9u/I5tNJN5fPAM8j+xSvDId4Oweq1WyPHtQrWv8JKvY?=
 =?us-ascii?Q?A4++jA/vX5at6HhWyMBImyJSxSHaB72n3TIJDRkdUnJzDv3ySWtbAFnPCUCr?=
 =?us-ascii?Q?mawl0hDVPNsd4auC8tkRf9LdyWRw7qpFMWXA5fzct6V/Ybho/ua+7oGfzi5r?=
 =?us-ascii?Q?Mt+tw/EYot5880p2a/oYrTTZW2xPZejmCMvNKZcD/jYkd8PiuThT6YPIRWva?=
 =?us-ascii?Q?TSe8DGAHi28cuHDjWOu3douGOUdeYuEEnvEil5bJkNHRSr3dHusVMy7TGnpX?=
 =?us-ascii?Q?f589Rg1DsXwvt29JsiHoh3EBVWYOuQH6zdE9IGek6aLb5zSAjOTzIo00m/AY?=
 =?us-ascii?Q?aO9WS7sz1DLseePEIM/avn18enHB9nT/i3ptqhmgG9E/ownsq2v5fjA7WIF4?=
 =?us-ascii?Q?wmRhJEYo9cOaO6RS0TITpUU+JfADa/0SeVFF8+EgmUqBGfWCR5bFXKSjNEQG?=
 =?us-ascii?Q?0H5AKMs5mcdcU79OLa8g7+io/gYqA2MC/Qjo0fihp5IFvAkDS/wJeDNNLq/9?=
 =?us-ascii?Q?JDKsKhcTU4h93eiKj0In/3OhkTpxIpsZlIrO45eeYQfE2W29Tah3qWqrlnql?=
 =?us-ascii?Q?PEwtELQ1xeBvBP5gaFYA6vEFTUocAHgVcc8lq3K/xL84XVJHqcGYx6Ro/ZwS?=
 =?us-ascii?Q?hddoEC8BKw4NAP5OM32lpoez3WEB4dfDJ2Is4N1aUaCAcTZErMQcffkhq3AN?=
 =?us-ascii?Q?KlOoXQB75I6cxF10qMDefjHIOJaAdTf/WNKrtDsOuPvNeQPomttQsInWxZDq?=
 =?us-ascii?Q?8T86z43eEj4LBK38JP2utA7HVeQkZh0uX67Axb1Gto5SuK8otAVUzuZkDkL4?=
 =?us-ascii?Q?lDFccIvctDI7JdVRM9w+1XfxKvv5UK+vYDTyKr4R1w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?082wQAP2tE5fXKcwcoxs68RvQfHhnGV9IswrSNu9v9vzEQmuLyTnqnwfdMVb?=
 =?us-ascii?Q?9lWaf0xVRXIWBTKk0XB5OmrqCB1fjXDKyN726Q7ZJ+dEJUzg/7CyWKfcf7/7?=
 =?us-ascii?Q?R9hn++zy/nhIIwPKoi6+YxjolPSdZL3FJj2BEsOcyaqsYuWb/cbPhMcB3Ege?=
 =?us-ascii?Q?Dsev1iJyQkm4b8ZoSwYHRKIu6JRTe7IQ7hoCLCYW39jbxfNQj0Q9vnASpxss?=
 =?us-ascii?Q?ZgwZVP/QzzQJr404slrgnb96sh27CygtEdVqR09lUwOhgkyhPQUwV087Bthl?=
 =?us-ascii?Q?5ZBj2tBs45lacMuSVSlmnrcgSWLw+zutuXLAViTVGthNkDlUr7kdb+iL5mtB?=
 =?us-ascii?Q?WlXZSdSuGKQvkIdKGf5xak7oQ4FFpY4esGiYXhWKNygKL6b2lkbkGkhRlGUB?=
 =?us-ascii?Q?ELw8WRQWidr1KLUgRvvjLO1OOFdUYmweNpYvjEWyIJpcXM7rF/qKlhs8xO/6?=
 =?us-ascii?Q?bDD8OTGKz4Xdwf8jKy2Sj3/mqazNiOLsmKJsqI0YM6HVecbL7/8rtF+xc4Sj?=
 =?us-ascii?Q?9aWazS9xfo7dMcXTet5o+qOXEjgF59if0peg22LR+fqCEm0nOLpOUKWeRLdt?=
 =?us-ascii?Q?dkHE1MWrg1h4419uWEk32g+9INQF4nwbD0pgx+ZOjtzbGytpnvbw9ur1Si/m?=
 =?us-ascii?Q?8eECFI5O0t2BsuMPMi9Yx42kMWohyoPXQLbL1J8Y24j4GEEJTmuwDBBPV2da?=
 =?us-ascii?Q?nV99stwhG2c87mQ6aDLcB+4VoD9pvTlFz6+LT8j8FoS7BB9xU4BNjayb17Sp?=
 =?us-ascii?Q?NWle2k69B/Vz5xDG77oRKCuZiPhgdn6gF7mLTz4mg3B9uH8GkgJKMnYQiM5x?=
 =?us-ascii?Q?IUB9KZXd78K2RuJU5+neF7r9SMKMHkK9w8kZ95+RuubuCHA/eo/SRAmGb/eg?=
 =?us-ascii?Q?9/hKx6CeejctFUcCNKzjhbwxbi4WeGOAoziHCsNsVIqI7d19zt1gF5WFfu4D?=
 =?us-ascii?Q?3x7W4o0RV5eSU8KHeDLwKkRItbJxvGNAKhV1JbpqV9yY4jwbuzUiXiUDn6GU?=
 =?us-ascii?Q?2wXmm7UWbI7oRINOvOirZRDoYHTfd5cObxhnewVX2M2Yt1DC+IqV9P14BHYG?=
 =?us-ascii?Q?Q2D+2yeq1IUbG5HOH4t+76I/IFail+GyUvAu7eY8M/jqYq8qPVqSGNp/dE2z?=
 =?us-ascii?Q?Lz3iczHWd/Y38QacAyIfbtEB9n38+IDIrfwRA2NLwm7ztUcCItoRktP1wCf4?=
 =?us-ascii?Q?nOst5O7c6Wm17CWFnGT449wsggui3F0ZoHCKRJ56kv6hYPKBEtKdQdfpkLmf?=
 =?us-ascii?Q?U+AKteTRilOB0xO+I/lxbwC17PZIPzxnRgmToJbv/VjH4WKZqxeQKBQXJPOb?=
 =?us-ascii?Q?r6gQOihWBJc+wMPcKxkbOH0HouzE5LUQXx+wvoxloN0m9NTZKIfiVuK8CbHf?=
 =?us-ascii?Q?Q/QNM0VDhX3+GFrr5LkUmaqClKldlRsi+vpLQ3wv6Af0K7TPpb9pPQsYqXI4?=
 =?us-ascii?Q?8F/KVZqukUgf3iNRRuq1UihBQE3+QZxr2xDb6P9Bg+IjHBXM4rOK+y1nYf9k?=
 =?us-ascii?Q?uv9c+7bzcMSR/UGzEAVi5UhR7mUiDU1UeqJU34UymYqfuLbyi35AF48MNEVH?=
 =?us-ascii?Q?MJupEGWsSCgUlfMI7PLh7t/q9t7T74jHPuSYt9IDUIvdVeD6PYTv2K30zWz+?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b595d264-4a79-4d3c-7366-08dcec2a0bb5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 08:27:31.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fuQJI49+DibOBIpUHemX286N/VIRxM7d0WM5jIgL4vcJ2OyQ0RutnvnNtEA5Peq0mpi/IsTfvXqTDOzQMoV37g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB6560
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 08:28:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205732

This variable was removed in
https://git.yoctoproject.org/poky/commit/?id=3D2f46b6f27dfa3a9d5ad177900fce=
cfe64c3536f1
("bitbake.conf: drop VOLATILE_TMP_DIR, use FILESYSTEM_PERMS_TABLES instead"=
)
so ensure that distributions become aware that it no longer has any
effect.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ca4b5a6637..eda505c861 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -107,6 +107,7 @@ BB_RENAMED_VARIABLES[TUNEABI_WHITELIST] =3D "is a depre=
cated variable and support
 BB_RENAMED_VARIABLES[LICENSE_FLAGS_WHITELIST] =3D "LICENSE_FLAGS_ACCEPTED"
 BB_RENAMED_VARIABLES[TCLIBCAPPEND] =3D "is no longer used, modify TMPDIR d=
irectly if required"
 BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] =3D "is obsolete and no longer supp=
orted"
+BB_RENAMED_VARIABLES[VOLATILE_TMP_DIR] =3D "is obsolete and no longer supp=
orted"
=20
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-only] =3D "INCOMPATIBLE_LICENSE_EXC=
EPTIONS"
 BB_RENAMED_VARIABLES[WHITELIST_GPL-3.0-or-later] =3D "INCOMPATIBLE_LICENSE=
_EXCEPTIONS"
--=20
2.39.2


