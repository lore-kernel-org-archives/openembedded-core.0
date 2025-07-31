Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4C0C87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 09:39:19 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.14])
 by mx.groups.io with SMTP id smtpd.web10.57840.1753954755159170997
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 02:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gWvz9sm6;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gWvz9sm6;
 spf=pass (domain: arm.com, ip: 52.101.65.14, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=py1n8U4cW4L194BLUWYIT9HTAtB+wuYRTPNG0mwHw+5C1PZUdaCZVBCBl7yI4Ppbv1oSlIFmaWijH0QF3JYruHxzmCRd/ZBniH2aXzsdizMqCsUN6RclW/k7AArMO75Zt6KvGwZImndMHeuPt5IjLZDIJUI8NLRRG3lP2iq6B6huF+mXuG8Zx/RHKnojwum2T6vaiOe9uFJgi1/ula3DN6KoSf2AAJ47X4FNN7vBsrm9o3W5+MTnMngvwhfXhpMKXGuXV1DvvMrzKzHcO3FDrAhQzEhhfXZidbeEIBs6wv6EmduEPJp2QQxihhn7nklwu47OT/TQ/dt5UNoaJfVL/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEevYJAnkR+qWD4253xFBfti/+kq90Vr3Wcq97/446s=;
 b=k0qLxkjo8zVCoA8NWe7MNp9NXlhgBxO5wbEDzYAnP2cC8gjDbJIYhe6XWYw1fgv0C6q5J077K+gjh7N/AAlj6j6rdgXm7o6k1+7Yts3LPW/Ba7uZfYchVQ5x1baAoqD5tdRkyMGJLMlZnEDCG5dbihIHSvjLtsM7+CQ90nUvlFunP/MXTSuQVjiP1YfVxBe2jYAsJS1w1UG6umz+OYAvE5mJfQb9WXoAp2zLujJYMVILT1n5AVHMTB3tErm2mkfkNHqnwoXp8AZnWQ5z0Tu0m5y0haA2EirOIiRnnol9r7auEj0zzZAHGsqthqX2zAnILznsLwDfyD+sxRhwOUuy7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEevYJAnkR+qWD4253xFBfti/+kq90Vr3Wcq97/446s=;
 b=gWvz9sm672VglewvYv2EXdSHO396k+MVnnTxCO1WUWJzvoTgH9yrLNdmV/mTD9l+l88l6xDAlVAaAJyr57N5MofTnVguDVzbycwSmsNurk3OTOKv2xQWyA4lVhYGelGSO4PJ57Ersyr8dwIbf8uO42P504EMfz8vsVDN5yNQ1U8=
Received: from DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) by DB8PR08MB5466.eurprd08.prod.outlook.com
 (2603:10a6:10:114::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Thu, 31 Jul
 2025 09:39:09 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::10) by DUZPR01CA0295.outlook.office365.com
 (2603:10a6:10:4b7::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.14 via Frontend Transport; Thu,
 31 Jul 2025 09:39:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.10
 via Frontend Transport; Thu, 31 Jul 2025 09:39:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8v4jwT6emvDe0EJw5Jpu8y0zMI9heE1t1nvm0hbWac7D50ZgG81s+vwx+DO136IWMwSNjXSmq84LKA8UbwtGyjwUqcJYm0KWheh09kCmGDECtVLP3rzH8rNVMEJlU8Ifkxg65vnaKbO5lo8n4lS4HPo0CU7QVFisoVaVXOBfyA+Ju6wp75CzWqcol3qDxOv7Uc+a4FlUb1gd4RsQgcIM2xkd/66QphSBYbbqAoQwZl+70NLMVhwmIqtg0BG9IxCbRln2p+sPAkfePE0EaYhbZSHw8758eZRwlQSZlyk2TYReCtY4zrF7z7/MUznl5IqIlAnMbh3RXguLFg+TGHpsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEevYJAnkR+qWD4253xFBfti/+kq90Vr3Wcq97/446s=;
 b=FxLZmVDWsUSuLvnIV/9PdU8x+m6/BLa3PSRhT8EDGFfYwyLF1vsPGKUOgaFhRJZrIkgEoD2ZU8XlNtqZJPn9KLhTpc9VIWkgkePvCwEswhQfnbeob0Neu1nsGndIPKMx+p0EuZv/OGWteBvi5Rn/J5XOayFNYaAuSppVoGU3wL7O9/+/7BZuyd9ZNqLwedRxVvHi1XH/uoMl+Kt15LC4Ob9CCLtv0lJn8MWYk18LmkQng/XRIfDRdIaW/UEXBXoZZRDp2s7Ign2TtuSbZU7+ZBaA2puNPRWncF3WCA06Xr6CX/LZ/2BI6lWbfsYcHpshUQcbWiCuOtvI+V52dsJUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEevYJAnkR+qWD4253xFBfti/+kq90Vr3Wcq97/446s=;
 b=gWvz9sm672VglewvYv2EXdSHO396k+MVnnTxCO1WUWJzvoTgH9yrLNdmV/mTD9l+l88l6xDAlVAaAJyr57N5MofTnVguDVzbycwSmsNurk3OTOKv2xQWyA4lVhYGelGSO4PJ57Ersyr8dwIbf8uO42P504EMfz8vsVDN5yNQ1U8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB7955.eurprd08.prod.outlook.com (2603:10a6:150:7f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 09:38:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.011; Thu, 31 Jul 2025
 09:38:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "bruce.ashfield@gmail.com"
	<bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH] perf: improve fixing for buildpaths QA warning
Thread-Topic: [OE-core] [PATCH] perf: improve fixing for buildpaths QA warning
Thread-Index: AQHcAPNUt51tNASP20KFbvi3fKuL9LRL+9CA
Date: Thu, 31 Jul 2025 09:38:34 +0000
Message-ID: <6EFFF8DB-D5A5-463F-A8F0-5AB6CED660DA@arm.com>
References: <20250730014258.3962647-1-changqing.li@windriver.com>
In-Reply-To: <20250730014258.3962647-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB7955:EE_|DB5PEPF00014B8C:EE_|DB8PR08MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fafaa87-c197-4057-6749-08ddd016187c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?5Mr7OOU4mBa090habilUq9F07IZkK7pwsB30RwFRP9Fe17cr+9zLmqapW68T?=
 =?us-ascii?Q?TyuJycH+0QsxbyF06RUcgkNMyduFyDSfEm5u96ZjbpbpW9oMevuEV1Zw3vMZ?=
 =?us-ascii?Q?5A8aa/kZKtGBv5MojyWVd1PFocOV57OfTtGSP977rgjUAizyvSFpHQGxyid4?=
 =?us-ascii?Q?CvEhzgAVAbrrqqw5lKF8Lxc2Kqf+q9P/bHOvdlnIx+XShlWgp+34lCbP+N9O?=
 =?us-ascii?Q?MUqCki+/CfVkLtEDc0UW6236ef2oMjwWo6DC4z+D1TSVAEoUUJJVQsprsPGA?=
 =?us-ascii?Q?XsarMbY8EE9Lgp7Vw1bpO4bFGC7LigdDT6+fhXyp5iOcP4kbzMU4hzN0J8Jh?=
 =?us-ascii?Q?b4EaapJEspLx5YujlesI9SYBA2EstkcS4HsDvkwB3aMwdeRDh5e8LUtnEPTP?=
 =?us-ascii?Q?J2FIwxkdNOUN6P4tIbSa/bMypxQb83UvDkWJQK+lBUKDBaN4HzX8MAwUNdrn?=
 =?us-ascii?Q?ipGwky+vn4FoLc1zDfdEeHQulmxhfDNWEiuK0TjUlbwe2Fuj8enM7/C0coVK?=
 =?us-ascii?Q?FKLUoH4W2lnTFut+SoFtDIbyrpB6wD0K6j+dSmsvo/xwqYIVVFxsudhMxtUp?=
 =?us-ascii?Q?qUqE2eXlLnPOnfGWD0JcGSDG3u5aPtvRSOELWSh3i0sc0R0sYcxvqqaoNdu4?=
 =?us-ascii?Q?i9Nbk/vDk1pFs6eE/iBhU4O4wxnoyprMpTB1OvSyqL9R392PPHFmFUTTAI8X?=
 =?us-ascii?Q?rpRR7PgAwO73PFd2pXE/vzkPQtFsE7YT5i/eTXF97FgxNqi3U65vTs+26MT+?=
 =?us-ascii?Q?5a/wPlIJY4GK1oP6hTIalXlly/LvqO5knTy1KBz+iMPiNoylwuuxzfeKssyz?=
 =?us-ascii?Q?Revs2fVRQFDA3SXDcrxvgroBG4l8tRTdROhovqhiedNt8LqUYUWL1+GHVoXj?=
 =?us-ascii?Q?D2nyV1C9m/6YENqQ18DnA0YHJD6IZn1fZiXrbdi74qgJdeA0Mdjdt9bi1AP/?=
 =?us-ascii?Q?t8yODaWcuiWwCEAaTd4/jBxlC3jFOfpygHRdXcHVzcETiU7F58ClmPuzlkyV?=
 =?us-ascii?Q?lrGvt4yaczz5OxyQcp5CZqwtBZpDfbpAhIXOZuObvDCeBYFFcSdoEBs36/H0?=
 =?us-ascii?Q?fJie81pKfhq/tfi8PC0Y8hg55+u9PMoKqRGMpZ9UZR5P3CvGhQGcoQsYBonA?=
 =?us-ascii?Q?inkVyzm8+A+E0nfwTPKi6I12SF1rpnzuh3W2xkM1+qLndemtbpVwna0DMZJU?=
 =?us-ascii?Q?srK6i/Y2QV7K8Im5VAsWHqSNnFDeG7RY7nLP5a4U4KHOQnC9KsU2bt9WjTf1?=
 =?us-ascii?Q?ng8NEdP9pResKwElB4vJF+jbi0y9UrDR7LvuPI6N3M5aXSVM3SEbDQm3uKvV?=
 =?us-ascii?Q?XPoqPiC97ZfHxwqJZkDZNjBWZ0yFjWCCJzBto1lvpVDR6C/72rZMJPXiqls2?=
 =?us-ascii?Q?7mxo8QPGa/uIgdSoZkT7MRITSMooAtwaGLUtqmXFamHMmg10jIbCt9WSxblb?=
 =?us-ascii?Q?K+m8x7nhVBViTuFHgx4FdqhK3/9+ExSitv4z6ykNBmArmE1Zd/40BA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F5A1680A25319D40850EEDCD07D50509@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB7955
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b63a7e2d-03e7-4fd1-aa75-08ddd01604e4
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|376014|1800799024|82310400026|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?u8CCXH8KKj/2uIh35qyqBDfiFPQV67h63uw2GvOlZXygChF2HaHtUBq/iLwH?=
 =?us-ascii?Q?vuwiqWJ4EX1/vkLBzODwRsypjBVGQlwpp2mDdP1bQkI4fHGachg8iyA+fOyW?=
 =?us-ascii?Q?iaNdb090InYxf0S+eDHnEabvHIKRu839LT9Kul7NVXeYEXx5/oJY+snu/B7i?=
 =?us-ascii?Q?Z29+exPHTAT8LzrzBnBN+kFRTc6zUtXy+NyLzrEFMe54vAJzjXUi0mEtlAUA?=
 =?us-ascii?Q?ngVMcE0GQMWMfdf+94W9TxkhVwP+APGxVYAmfzJHSxrnMbQZ2RkQtLl/H2UC?=
 =?us-ascii?Q?NV4bCCLZzrJt/jSOWbZhRiV1AVeeVzeMZ1uxycC2/TU7vqWrehWkWQZ7UxK2?=
 =?us-ascii?Q?joPIw+U+AGEdXagT35iBfzfirNJTCSCqGwVSX0fksMPE+7JGynT2MyncFA/y?=
 =?us-ascii?Q?tvx5lBePDKPMYCzOelDdCfl3vGf75In22qt+O8h/7rFxOyNFRVjB/464Bpgz?=
 =?us-ascii?Q?n6N8k3bPGD7GIjrZ7W8sVPw0Y13ANAEwkc43Zqn7J2IOTrvRtRAe8DUIojPr?=
 =?us-ascii?Q?nCIeqzLbCg5s2Ll1IemB5DqYaRaIcNkBgqJuApEDh9yuzkMm/2fYE1nSCglv?=
 =?us-ascii?Q?Vojt/hkD7iv3yUJVF56zuFCNfKc+pLHy1/UrNTHnMMF0rSLIvuBb3PBabSzz?=
 =?us-ascii?Q?9+7gud49q//oF1NSM/RBz/B7Z0DXSnBrznLGdaHRVNyCQEWHt8Lmb2tjGTSQ?=
 =?us-ascii?Q?C59QaD3u6Si+siEdJL/qTKA4DcStTrO2Zgq2EdHtGO5CQS72+lvwQ5JjSIyr?=
 =?us-ascii?Q?voKUD/QHskRKYRQc1NeUlsnj07SOOgbeuSk8HdnJeSBHWKJPrbiuulZJHdQk?=
 =?us-ascii?Q?ThkDEORHFQTAVe2FrZKLhsebVnArGZTkn61phs5qhazawm24YcWYU3YWdO/N?=
 =?us-ascii?Q?W1JFT3BsHua3YHPz85EOcdBQMMJXQZcOafKqs4FA96JaYgFSoeDrhud0y5eN?=
 =?us-ascii?Q?LAcPHbVDBYo7/+SmjgQgtDqKqckmaoAWn75UH/DoBNyWb5R0/tSCYgffUQu7?=
 =?us-ascii?Q?Y1KGEg56+vzBWRbgbAoe8zo90dNlMNrD4fy4R05U3WDn5RgbLiM73yFz/5O1?=
 =?us-ascii?Q?QdcOgUIueuLOYE/22HibMVQ7TkmCVPqERyJcdmsdYG1OW65G/yYiRYMGGV/t?=
 =?us-ascii?Q?/6CbC/aHhF7UPYVK4+IDCuZjNrI95tprOsp1HgrG6ixpVcKITdDNKjXYANO0?=
 =?us-ascii?Q?LaEyQCDJtnh2k9ZscSCmubddIAGbsOWw+YBqugPpoeV2XejM7t1Dpe7gvd5D?=
 =?us-ascii?Q?z6jhW/nbOBYsDXbVaAcVEIG6MKgrT3av+YbVLppFcXClHH9ymbguvVtaNVQF?=
 =?us-ascii?Q?a592WNlMPy5UXgHH6dUFE8sx7xybN7MTtqMR4DDrBXK9wjLjUKWKi8cn3lD0?=
 =?us-ascii?Q?rdxjjvHGt0YVoW+V4VLrBAefSYrkYWZW8jMsi9gQVxFwRW7x8QqdXxSGetAL?=
 =?us-ascii?Q?nt3rZyWlQ+q6KMrBMEZbK6Lc+VXT7QsVQap/vLy9ZhAJWybh7Z38mA2o4Cl1?=
 =?us-ascii?Q?ZMhNzIdqZEGFmQ3vx/Cz1eX9Zehp7Iu+1eO9?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(1800799024)(82310400026)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 09:39:07.4104
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fafaa87-c197-4057-6749-08ddd016187c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5466
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 09:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221184

On 30 Jul 2025, at 02:42, Changqing Li via lists.openembedded.org <changqin=
g.li=3Dwindriver.com@lists.openembedded.org> wrote:
>=20
> From: Changqing Li <changqing.li@windriver.com>
>=20
> if O=3D${B} is removed from EXTRA_OEMAKE, perf will compile failed with
> error:

Why would you remove O=3D${B}?  That would cause the build to happen inside=
 the shared kernel source, correct?

Ross


