Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5DC10706ED
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 16:00:44 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.78])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17813.1773849637322579934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 09:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=KeIMdN4p;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.78, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPlVoyORVKdONDWeVqlappn29IWXoPJ5gcctRpLZLQxrXcDnQswU6zANp5USRry/iLlCNA1Q0d5eFDRIuOL6GxVUBphNzNlGboJxDZeL6TyXbh7xxPB+G2F3ItjwsqFPeKoQqxOzfoEG1E1tB8bhuUhOWBpzonD7FQg/nl02A6P/f0h6Ty2ZrzTx01QiNqWz+LEMLKso8uOjTqoUlRuk7gACKr76uHwnUHutv8KFKkVn+L/ROlO7hOpyc9arkUmw/mxF4LC4nMyMHEMXZwUjQs8b42Xkh7YrWM2JVWJGYdqnGEo68RIsebclfh0MPbZwx/puh5smHU7h5gKRnH0nuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/K07NNV2KkEFOQoeFdbjDZr6ZOu9xE1kWHbgvIMm7w=;
 b=hF68WU4OiAgjZ+ktfjMnWrx/U887HuiHHEtEqDtGGHRMrKnJtYCvLocGB9kSpxElo5LIJqf2cxl93tEvM/ni22blFCWP0FHbYaD3tQUpIii28uaufg2N3nqWz5A8k6mp1AK8RiOmTNml3obeUhfsXYJFA0n5VbY0Kjffp/DNuU90RZj2PgZiCTC1NNwMjJjbNftvx2XaySYQQ8duW+1OQy8GDL9ECrRWnvT3Iqx8MVsFqlwSPoiFIlsob3XojsGpHFUHgHDO+D+LKX+mrXbHidZRpbnLDhtDvWsfswRN+2G4VUdKgGau8Be2qn3Ln3R+qhGe2QGRx/v8HxWdZBGj7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/K07NNV2KkEFOQoeFdbjDZr6ZOu9xE1kWHbgvIMm7w=;
 b=KeIMdN4pm76+Q7mC7vXxkV3bXlcHQFBFb3+3wDxyqAENrZ3WgUHnKMpIUKfd9fugLdDDjldP0wsMXbjG3hKoQn4p+wGy7sJ7/uIIi23HE2nr2LnFKunGbrzQyBxdMDqsM4QRCsgPGMlenHb1+0Vzaj7IKFJDhaVbcy5eIKrjQhiZ4emHuVAkM3v81fMYFGxbkGLYXGW5v9+VKGa2ykBcALaiE0ai+O2WaM5bIfWbA5V5RC5VHFnvUqd9R9F1kf1eF0hokq0lAZ0e5WU1wGaIu4maY5J1YLy0eN+dN8C9mbbbFImMJkEZqNqoNFWp2/44aAB6sTUQJFBdMOVqWCzFmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AMBPR06MB10971.eurprd06.prod.outlook.com (2603:10a6:20b:720::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 16:00:33 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::fb61:408a:ba4e:990f%6]) with mapi id 15.20.9700.022; Wed, 18 Mar 2026
 16:00:33 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/2] documentation.conf: Drop obsolete QMAKE vars
Date: Wed, 18 Mar 2026 16:00:18 +0000
Message-ID: <20260318160018.1765725-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260318160018.1765725-1-niko.mauno@vaisala.com>
References: <20260318160018.1765725-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVZP280CA0036.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:26f::13) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AMBPR06MB10971:EE_
X-MS-Office365-Filtering-Correlation-Id: b0585db1-200d-4ee9-c0e4-08de85077c7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	AMnB61lHDPRsQ8jCFI7MglDfpED/J39QtR/lHAJ9vMmnxjFJqUx4J1dSCN3VlPC5JCI7ZY6zhoN3YwVOCIOawbogUgNvFsBluzENjTM+4p8pszVDy1WQCYnu9uSKJUTwNNDfPgQj9RRhCTEI+aeFXJsmmHmMNH48s6HOKmel0O0RqF0Mc49UGNm8anH1up4U6kN9nspMx5xB98rh6H+ZFC6iWtrBWcodNfAgq65iq6qwd18ctTLfMM6WjO0SPoSU8SPuKaRyCZC9fJH9zcTNonT3KpF7AuqWqyL6T01ml5kLx4ptpwZG7ZjMRMTdWQRsGKFPgsi8aX669Z/xrpihLw9KrRMtnSVH8wf8GllgZY4shX8sKSyUp+3N6by68Rr1Sfljn/Mr3jB8kZWF1eC1jXQKWyIXgP7u5aUlBg1mq2033cMHqJhd4i7zAr9geRYC88NmrX06eTvtuzUz+or4l2JeWEGXmHQEonPUmG194seUVVQVSJm7pNYFCkiGCOYDJR2IpOI7RLXpGF8H3sJEzqEF9+UGSoxGpCzxURdmWclhTQMtXeZ3tJ7Ja3z9i/ykeY2qsCSctJ7FqX7gprZ9oNfHzfLopm73Za/rgWar/wCydaXPafS4nZFK632LyWVcg5a8GFr6QeIJAmVT43Xun/EBgqJbpvNDmCQ6jWha1kXKcJue7CTBNqrvm3k59K2fcc17CbIWQX73eB/4pxhaGwvirVJbK5/sb9umoaSBxiToC5gHRvL9jPsVYHWlhGwpUT2Bh2s0yBj2C+SvucwvY0K25ydIqLZiUcmbsJSWr1g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BxgCEI3U/dXPXg/CwhDAYcBxJTC/rNRDM4ekW3zPZmcMix7IzMDTIyGLblLo?=
 =?us-ascii?Q?mEjRGxhxowenE/d/PDlVmnhN3qLapDMwgrQoip9h6da8RWAJwVr6fe9AscWM?=
 =?us-ascii?Q?c8DH1tVfqXJ0UTIKiU3qQA6dqSAHDRUxWfEp7OUzTLFSf8lff42HO7yyu0eG?=
 =?us-ascii?Q?s3bkqh+eD7+KPOc2djPtOj2I9c6IAsemMm3oTyOEtGtL1aauLDwhzgcMy/jB?=
 =?us-ascii?Q?TBSkyVcKFoGyQdAnpK7Vst0afF8y+gyZZv02Vb/k/YoohL4SXPVqLM9A7fct?=
 =?us-ascii?Q?AVQljhtOEMeOX0HWh+OBg3yzKiZc4vchN1Vw8uhd1D+U348nWHv7076rbRiv?=
 =?us-ascii?Q?xq0f/OaXBAqqr2vyOyEzhX84B3HfpQiFinlH9s/eUsUEeXqfNG8MdFr797Vv?=
 =?us-ascii?Q?USsdfV/N88SB+OKebs+ufQGLWozC7T+hQ6o2NO/M+lP1uUdbGvOdzLU0WGjp?=
 =?us-ascii?Q?O9Rm8vn7qKkQEr6u/bA6zkOucRnT3Re4CvXIhdl5DKyvss9mtU/cX9ame4Ka?=
 =?us-ascii?Q?xIlYlxIMvqRBVsqAjUWVldWAJR2PS5E+mWmM61O1xaz/Nl+/B5rbx5nHat3L?=
 =?us-ascii?Q?P7Qmf4igtwdRRotPERNZxqqRPKBM+7Q48uWsfxweYSD4i2jXdH+D9skN6Pf/?=
 =?us-ascii?Q?giRwgKUnONWfK+mBJOos4SM3eUuFyMcJtluqoXkWuOpEL1VAk+8RjNTU9StO?=
 =?us-ascii?Q?C98ufJ3vjZTklInssL6m5Y8wnJsGuFOie+6lte+T62e71HkpweqSB89CMTf/?=
 =?us-ascii?Q?ymmmHn2pNZ7AKR+McXAvft4ikIqEEG8OxR4PXhunK4Mp1ucuHz32tkwIvf8Y?=
 =?us-ascii?Q?azZsVlzudi0gaQBdpqnrZZjtBl6Fh/uT3WlyZQU4X/qAOxYrigelQmxh4WEV?=
 =?us-ascii?Q?Fguvf+W9ccbOelPzFlKG996Kw+NY+lpdQYsJ1z8cCIVsrkj1fp6kzrGZfw34?=
 =?us-ascii?Q?6M70LMDsWSDfNTlHDyGuwNFlnKw580AOD6XQ8lhF9hRVhm7p1E9EPlFcyFG5?=
 =?us-ascii?Q?/26iqZCpJHOrIRRuH62oIGDLXrxXtqfuCs+4ZBEa/lDPELp14aWP0PIhQz1O?=
 =?us-ascii?Q?LOOQ5aaxbVxFk0jPZDrtp+mByw1nBwcHsm32yAgnp+YvcokT/i5pIxnqc+qy?=
 =?us-ascii?Q?39d4njeivGzKA/ecPCt7LhV0zPVU5bCNoNUNpvVeSYsGxp0Bwmw02h8OT1GS?=
 =?us-ascii?Q?eDslMBZ8KILdCS0OavoilZNlWBoPwMy0+whRLfaT5kX4F3KIJCcWsoeIDR/c?=
 =?us-ascii?Q?6B3xFRz1UsSl2T0/363BHChz7krt6ej4lJeraBoFDKsNcHlKik6TSiwHli3B?=
 =?us-ascii?Q?yI3n+h0GSlRyf/Kh9Nr2QJuJ4CvcEwHTtaGo72okCMipC7MTqx3ouFMUXbmY?=
 =?us-ascii?Q?nKdZNDLaesDTlUxa4ppQ5A+3rp/yQrSxBKwMQMxqTaTvET9YjlUvPM0g9yMT?=
 =?us-ascii?Q?JdoYHvqjtXkQNE2QAuxbEuydxWTNa40YwVHu1A3pm3ZQl1YL7KiQ3f4p4v4s?=
 =?us-ascii?Q?ll8L6vDWLj/+oIHMgBdvc7qw5l7FkaxE3+1RP14a0WageVoZZg2US9wDa5vY?=
 =?us-ascii?Q?CzBzbmjqhUx4P2QbK+2UpZebOmYiCPY8vMNS00eFcXFuPU6AAIHUchL5onzn?=
 =?us-ascii?Q?aUOk2odYK8nsxhDUTPqB0DVhN1yj0bWJDCMxVjRzMwuf+o3ahwJCuB5SK9md?=
 =?us-ascii?Q?dIZm//MgLQMftjFUwR08niK6bTSRy4Lio7ihRFmKhK+MRdBLwmBUw8xfnDBr?=
 =?us-ascii?Q?qZr9qtIl4Y7SL4FfZrm/V7IkN3/LMFg=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0585db1-200d-4ee9-c0e4-08de85077c7c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 16:00:33.3798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcaJwFnzG/4awzmbCNqQ1wz6lsqXBihAVzsYDvStqVjUBVuZ7ybEDTHTYurF04jvwnPu8QMyfo+ytz3pmuuCcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10971
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 16:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233409

The use of these variables ceased already in 2015, since
commit cb89d2b25b4e ("qt4: remove recipes and classes")

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/conf/documentation.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index bf6b4193b2..c9b7711c01 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -164,8 +164,6 @@ EXTRA_OECMAKE[doc] =3D "Additional cmake options."
 EXTRA_OECONF[doc] =3D "Additional configure script options."
 EXTRA_OEMAKE[doc] =3D "Additional GNU make options."
 EXTRA_OESCONS[doc] =3D "When a recipe inherits the scons class, this varia=
ble specifies additional configuration options you want to pass to the scon=
s command line."
-EXTRA_QMAKEVARS_POST[doc] =3D "Configuration variables or options you want=
 to pass to qmake when the arguments need to be after the .pro file list on=
 the command line."
-EXTRA_QMAKEVARS_PRE[doc] =3D "Configuration variables or options you want =
to pass to qmake when the arguments need to be before the .pro file list on=
 the command line."
 EXTRA_USERS_PARAMS[doc] =3D "When a recipe inherits the extrausers class, =
this variable provides image level user and group operations."
=20
 #F
@@ -340,7 +338,6 @@ PYPI_SRC_URI[doc] =3D "The URI to use to fetch from pyp=
i, default uses pythonhoste
=20
 QA_EMPTY_DIRS[doc] =3D "A list of directories that are expected to be empt=
y."
 QA_EMPTY_DIRS_RECOMMENDATION[doc] =3D "This specifies a recommendation for=
 a directory why it must be empty, which will be included in the error mess=
age if the directory is not empty."
-QMAKE_PROFILES[doc] =3D "Specifies your own subset of .pro files to be bui=
lt for use with qmake."
=20
 #R
=20
--=20
2.47.3


