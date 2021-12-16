Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2EBC4332F
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 10:39:14 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.96.53])
 by mx.groups.io with SMTP id smtpd.web11.9009.1639651153848476738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 02:39:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=bBxBf0C3;
 spf=pass (domain: synaptics.com, ip: 40.107.96.53,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgI7X8yiN0/Qha5iYVU1Bt69DjqaAdRDJ1KW48qXutYpySFYGklM3DngZsPNG/Mz8gPpNQwieZsaCAM5k01MPPLzYQGirNxUhvsfUAPBmRnXgnb6PSUnnCwzF8EDX2kjNlmNJIpbXS51KPxqXMMOV+IfoVGyD39Yd+kdGGYl7o9Fu6nbT3bMSoMZ/QK4U/2thfoHwla1re1APxUiu/lZG4QqvYhAP8ZS74NKEjs7t1hjMmB5EMQFJ9iQLwJpLimRd/76W/zp8xp9IbiDte/j1GbC5Mhrz/oZw8TZ8jgj1GWwBkZxDztI6IeAv6CL1R4dYICq/UPPhKVEcU6z0FsmuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYS4mfyGK02zcFuK1oI8h7YcIHgioDWgA7RwSMMProY=;
 b=MDPyHUpmtoTH6YSFaQ5JcFy8TV1/N6SPPXCw/tLQCUmc3k/ZtjsnhDBD/928e2eTxHu4L6tgnAoPnsBSzIV85bXB/d4EH0kU6zhTYwc09Exy6lUe4hG/i4Ax3H/0n34Tz7QqIV3vmxPM7vOhqXa07M1uljNm7WgXD4ycPvd7l59/G0a7mWq//UnrQkXwFHf7gnJOJGxvr8cmkPBJHYOifz5shZ3Qk+Lm4nKlSWobTB3S5c2GFwzX0cbB7nqeSsuJKKiZyP95nHGO7GdyVpivj2iwv+UuSL9nSppwCKXPq/Kb2apjc0VoqvTjliO3rOv5hUY8X0zmOoETpF7tpa5QHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYS4mfyGK02zcFuK1oI8h7YcIHgioDWgA7RwSMMProY=;
 b=bBxBf0C3IjLigfCQtUOz/lICtTgnor/TUoGFsxq31k9lkb2jt6RLeyCGmZoa5C1xlZv3sjj0dyqrTHE3Me3DdOOxQUMkRTT5LanwbZ4ZvBNk9374X5CyE4pDGomrPSctb/a1iS4szJKKSLSzUn7+7/PpUXbgIZSF/ND0g4FfNn4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4745.namprd03.prod.outlook.com (2603:10b6:5:182::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 10:39:12 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665%3]) with mapi id 15.20.4778.018; Thu, 16 Dec 2021
 10:39:13 +0000
From: Hsia-Jun Li <randy.li@synaptics.com>
To: openembedded-core@lists.openembedded.org
CC: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>,
	Randy Li <ayaka@soulik.info>
Subject: [PATCH 2/3] classes/meson: support Android os
Date: Thu, 16 Dec 2021 18:38:45 +0800
Message-ID: <20211216103846.718910-3-randy.li@synaptics.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211216103846.718910-1-randy.li@synaptics.com>
References: <20211216103846.718910-1-randy.li@synaptics.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0042.prod.exchangelabs.com (2603:10b6:a03:94::19)
 To DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f7776abb-f423-4330-66ae-08d9c0804cc6
X-MS-TrafficTypeDiagnostic: DM6PR03MB4745:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB4745EFA0548DB040BC5405FB86779@DM6PR03MB4745.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1265;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mPI/s/DUo61A3TZRFD5l/FMUIlMHJRcrYyn40IGcqwf0USzumMYsPh6R5ZaGueAQYxAvX4eYwwVWcQT4tFtBnOIkxmrDoRT/t9rEpxhOfX+k2H/Vew6teh/r80xfD05f8SFnDDq+iTOvYLYIwks7a7IDK9GutfXm1gnbG93tjubv6lcVQ3LXpCe2zRqLPWeqKS1F8DtO/Fn5qlupigtoX4h8Zs5tFtEioiMO+5mWAy9r+tUU8+rTnibdRzjSqGtsFk7gVVM5aIrwfpvhNyCP6ybFvHHfz116/qkin/N9AzUrt34G+9J9dcgeoF1Dy2rzM/xKAH5I8HTGgRG6V86PKtRk/TgMNSyin1qevL1z5Jx/i/CxtFI3W0ybCFXK9bkkh/bgsOmNdM21oL3ZK+fWrJKeEQHY3lvjnDncYjMJ7EiDrC8MxzNv4LuMb2g2rK+qxH3hB8nYJz+5qNYlWy831cR9pwux1SBkQtX9UUAqiosvYyGMcGKLqJpaBEtUG5f3WeH4r13j23UUXeOAnZkXHLrB+S1swn3LtWI+EG6LZvCfbsCcrXvcZB0C4oeB0AP20YGeGZChHDbj1PCwphF8RxcJXjKNnwwE/zyd2xaaA9T6zaIi+Bnonu4NoQPsE6hpgXDEQCTx572PP+ipN9ouTmoURUqSh16mZEPE2WOE0Hg/GLlGpBO84PQEnPqyqvn+0RmLIUyuMirNAZkw6TKX4PlGNrIz2mernL6MUcgEdFMkM+UlVkwraX5REtTsXICHkuGH3UDvvBCm3Xz7NBys8of5MH5UQGet639FHXpEEKM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(186003)(966005)(2616005)(6916009)(36756003)(6512007)(8676002)(2906002)(66556008)(5660300002)(4744005)(66946007)(508600001)(6666004)(8936002)(38100700002)(4326008)(54906003)(26005)(6486002)(66476007)(38350700002)(86362001)(316002)(6506007)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OB92aBtL2vjAUZ0XB/qBOZ3MwlLUUM6sVH23zIpG0t/O0eZuJaIvLcmvrwiH?=
 =?us-ascii?Q?0+ZiNoBa71MB+7KEd8tdjhXZusDO6J/iYx2CtkQRwAuzaECrdbH7d/lRVP7e?=
 =?us-ascii?Q?Jy+Ev7rfqxPpthkLVRFt4k4frPjxkSb3EfXmls6HZGqZi2N3jF8tBfLsZIz2?=
 =?us-ascii?Q?r3PJIsAXNPaPd8OCnBIKRYjhmmwmvCkdSljVm0Qy2musNtHIB1yN4efHJ2Tt?=
 =?us-ascii?Q?gY47q851jRj4N3Rm1u0ltvQmM/NLwHBR1RrbnGfXQNFtDCPnKeFkl3keX06T?=
 =?us-ascii?Q?Z1y+DD4udyUtUFwUr2Gk4m0kg4OguMkMjkBzgtW3DaaMKsjc/etQnYypfQtK?=
 =?us-ascii?Q?oKiVvTwBf2wOqFsh4KM8sR7S8196TZGeMeQr6LJ960LaUVqN9qenz22QoLNV?=
 =?us-ascii?Q?fmgw//utNmVqIDYddd1M4cE25tQu01mKNjmkcSaFiZVgkIwLDbRjo7ae7EuI?=
 =?us-ascii?Q?2MK0kL7Kyl5/50bEBhQCFqaRadGR51cRRV+BTDt3rvfDjXMDqBrPHTsYl2yD?=
 =?us-ascii?Q?FHhdVqoNzBnxqWdd9mukKoE4ZwCQ72Umgp9K3+LqY8Ie8M5mUc90pAmhGy17?=
 =?us-ascii?Q?kz/Tiad7Hyda7ycigL4RHWLj4abNVPHMF8dXNJfDgxewPv1ZuxlFR0B2pAfp?=
 =?us-ascii?Q?+Drc9ly+D/q9CVSt7ZQpXJqBfrNg08Oyt+D3Rasjx2ApSHENT0E1EmElpGX7?=
 =?us-ascii?Q?knewZCTMU0wxrDNUP9AN+BXfk87nigSz2ESNr97Wi8JwTgiBqZEE4XaP+dm4?=
 =?us-ascii?Q?Krym/lBCkpwsaFX539/cKqxY0smCZls9XhGvZXkFEkCLHKHGHS77OFiITsZD?=
 =?us-ascii?Q?Y3x9nKcPE1gu1mYbqfTuDnwXBtoV2jjni127NhNYEDTAX6b8uF4H3GnYxTau?=
 =?us-ascii?Q?YMeuysCdfzddYOCKSwM5YfXuge+v77mjFuwGPqehYiK0XAdy4FStQgPZhEkI?=
 =?us-ascii?Q?5FHJsDqWfJgNhdD7kAYy59/7x59esJYvPJyQmcDzvYygUHWERwEbjEQDEIk4?=
 =?us-ascii?Q?1AIPJnzaSkNeU6z3AaqVOiGd6xCQmk12883wQ9ld8JVE26ZSe0cRKDqOq2b0?=
 =?us-ascii?Q?fiF/9bWUt/lT1maDZoVXqMYgWT8Dq4v00i5ljQTeRv41Nj/uQeeckXcTcq/H?=
 =?us-ascii?Q?6RzI4CTflpmmlYDlE1EGLLL/dPK9wbAumiaPKCLU+XZOuMyASukiSnivCnux?=
 =?us-ascii?Q?+4i0pZe9KPb52yJnAzFpX2+qJPQV0uv8JY9pcSVMQvkK456ZWFvbr7mnSBGE?=
 =?us-ascii?Q?NUsSi6BcW/ax+pp2N5zVYopH5IhEanP1Iwfa7c7KZkVqJtRAHXu1F62EGzFI?=
 =?us-ascii?Q?qGkrTiPjNyhzyqYifDZLKK2Mp2Gml+9KvsSfmQNiNR2f/xVweP5zDXAOkOnn?=
 =?us-ascii?Q?n8CYL44CypXWP0yVOSPMBTl1V/m1y+mWUrzmf1YE9UygICS0awbDOAriYalq?=
 =?us-ascii?Q?fzltUxRTH7pnVY2xxyU/xu6ejv0aIC8+nUq79cQlVBg3m8/TW6luA6lGHhxf?=
 =?us-ascii?Q?LZw6ni4GpQYd88lWRB6PeDqsm8zP+ySCivbzq1uTr5rQ/ornkvm+YyPpbAJw?=
 =?us-ascii?Q?Lg5RE/DX+KPvct+HavLtLlxoJQvcAcHm4TSNcFuhHDF1U7CJ63umUXOuz5R6?=
 =?us-ascii?Q?AxXb23StIDeTmKz7giS6F3s=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f7776abb-f423-4330-66ae-08d9c0804cc6
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 10:39:12.8866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fa+h5gguPIygvPzlPlbIm40SqeGgChGAkrOm1YRn7tPlJ0MstLYdKvOlkL8PIRCV5MtApl2F+YknBfA7dDsZYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4745
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 10:39:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159778

From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>

Signed-off-by: Randy Li <ayaka@soulik.info>
Signed-off-by: Hsia-Jun(Randy) Li <randy.li@synaptics.com>
---
 meta/classes/meson-routines.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson-routines.bbclass b/meta/classes/meson-routi=
nes.bbclass
index be3aeedeba..f9a06a16d8 100644
--- a/meta/classes/meson-routines.bbclass
+++ b/meta/classes/meson-routines.bbclass
@@ -32,6 +32,8 @@ def meson_cpu_family(var, d):
 # https://mesonbuild.com/Reference-tables.html#operating-system-names
 def meson_operating_system(var, d):
     os =3D d.getVar(var)
+    if "android" in os:
+        return "android"
     if "mingw" in os:
         return "windows"
     # avoid e.g 'linux-gnueabi'
--=20
2.17.1


