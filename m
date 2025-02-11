Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC07C021B0
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1128.1739286052946746079
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:00:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=vn89beCD;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeX49NRg1CEJeWydxb8SxMIbfKjJCd+rbvkhyUIxgcz0HWXF6ZYOHlGBj8qvZSX0/pzcjXGj9pw+941RTJXCTUNzJSiQecwtq09xh9JPixbxGc/kmdA+X0nKQNpwRd+TRYg0bmenpXeUm1FP/7bG7sA3aBcacqb0YzNaEQbHA5YIDklaGcCWOoKbP9jH6wRqLUwStr0gfYnAiawW89BIYlxA4sqR19f+UqOClfPWHz054/ecx+Bm59VR3xr7auiRegPp21JAtbqLky1viJ7eN/rKkMc+o2bXPhv7Rkc0duM0du52WsbW9p8e8l/mUhjYduB5ifWJTAqdIzqUAgH8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRc0aHqlTFpoUnUceSuiQsc+4UaAKu/w5b4M6wLQPmQ=;
 b=rjNloyJwW43k8v2CLv/0bHDKKmPL1cZA97mx2rpir/UGCfJTbEL6b6m/Q/VUIHPbbmGQni2jekSywFoaH/iS3CYWrO9p+6WdQ++uDxwaBvKh82a/Yjctn23sWPEmDlKxpsHt9OLQBgK5TXPXQH4c7FHtE0i8JeavdhLy6bNEd0WDTEjPFPBieICYK6waQ/h3h+LGn9JAmKALUaz0UwcAr5twD2nn81tu7HCHZbklomajHUzuustnkkZrYxCBnV+NT0M1JbmQTFu+c75vkHm+SKxE9dX/bodemXsDkp23qmxxNATu4KsCN2HmhA6bgxprbek6vFMvKaP0cuSAMJIc/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RRc0aHqlTFpoUnUceSuiQsc+4UaAKu/w5b4M6wLQPmQ=;
 b=vn89beCD3/ZP6xciZd4stSRcFVyKJqL8hk02JPKAFZX+Du3hDUWzPOd7kbjdqMfKXerYPKBdw5yT5YxfrCM+6x9Nsco3gRuWlxlBmZlEW0i0WANFsSw0YnFOPGPLprOz1pxDxvKxDe+oO77vO1CNaQiB9U5qdByX2KyC5O28/GkYSUb0MtyhykeBxjoySE8SWjng1AkJncZGKMdw1nhqhASevw9GJmOOgoI6HguzE/Xt36CyETYumCBVi3C5riVgPUhMLJO7cHqpogzHb0mqog/Z07lSAOfb3T4+isEUCnKsNXxNHcGMPbVq2O/2/6n1bK4ERggu6alnkUyQLjwlLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:51 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:51 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 04/30] lib: bb: fetch2: add support to unpack .crate files
Date: Tue, 11 Feb 2025 16:00:08 +0100
Message-ID: <20250211150034.18696-5-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: b4bcd7e9-7fb9-49b0-14da-08dd4aacde0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Wp9jVi3UlBV20HCnARbK+y25LoGux2bkjobmp/Xqo7d0euGOhPm/78XqXelt?=
 =?us-ascii?Q?rBMjcmL+7mbwUftxwp7Bii9A6Lwc8oltG54Om9s1PQHaltrl1DDpZVdSnxJ9?=
 =?us-ascii?Q?Yd1Pk9s0Qa2VDBNsA8vCk+kT+Z3M9MSV3q+dy6bBoIu0LRdPz1JA8/zA2Tbu?=
 =?us-ascii?Q?JAievi114j2L4z2FuBRA0FKJ8wH9U/Z1j0iBUK6wN3WnHmJJ802ltGuFOD+F?=
 =?us-ascii?Q?3+EPqj4A2Kjlhhs9VlJIskeQhSE7MekODWCZa4fpX/AgxP8F7wV/eqpr9OKQ?=
 =?us-ascii?Q?oZ6GwR1nxK6ipqWrJ6kRsVpUzqBxHicSAIXttjouO00+xFRtmJwtWrLDLrxo?=
 =?us-ascii?Q?3RQD1M2GCTps3x21zNRArkEEJGk78HrvdG2ie+X2CXutpYH4AQH3LOvqdT8c?=
 =?us-ascii?Q?FSfxEGVVg7CH4HxPvi1KDODyj3tmFHuAEaIuqpVJyhBmdJ7/hX4SX/O7dmGs?=
 =?us-ascii?Q?lQoU9oyqZM/ufV1p9o+kdR2JvUGOFVICqf8ghg3KK8sh8CqBv0fRQeNqLgr8?=
 =?us-ascii?Q?HHJSJi9bfM++5mlWJA5D6zqz7sJAhV25bAgxvUXvzC0mZAZwHlOJlIzV0d3R?=
 =?us-ascii?Q?Vl3WHyKyPG7vmbsZekiyUcN9FceCoHd+u/BRsB+u2BxUe4rrj6XBbXSg4D16?=
 =?us-ascii?Q?ajhifesVl3v1rthTZTTm1iRib/Ccze0Z9KqOX2KAm0BLGsS3fUgHK3NE9XCF?=
 =?us-ascii?Q?TASRbWqX1LTvtat4lqHLdeeW9ily5+0jHbQVr6Pe0KSI7QHBw+1elT9Dac/o?=
 =?us-ascii?Q?/VF0x0r5NzILI1f50U6lfTOHhLPyfoyq9y2XBo6/1FWaNONFdAT6nbHrm1IQ?=
 =?us-ascii?Q?dfyp7AKgp8phdRBnQB377Zg/vq/dHaVHtP0exX9Ww6LpB/8uBrcQFVfH0sLy?=
 =?us-ascii?Q?tl63+jtCJEyMHKyshotW/RQ7NZvt7K/IJN5zfOdbgnzplcIlYeB72OdWK04+?=
 =?us-ascii?Q?+gOXmUDjtcdv8H9fbEhLQYnKhseKXkKdzzaB27aP7adstOq0ibguNCaeTDtV?=
 =?us-ascii?Q?RH3Z1wsrpQrBKauJBaIfxy0QR6ieB0+YiCCqNkC2PMUcsC7gt3Awh8l+RAzK?=
 =?us-ascii?Q?XJtA1lGkAD+KZXf/BxJKjMJIqA3W+2PYdQJt/ufQsZhOSOqlN+cF0Y8Z50UI?=
 =?us-ascii?Q?lfhNmFYl5x6iJkETrnU+ViDqvtFm06HNFn+MxpMD+xyE/fdXj5y9JKWi1o9T?=
 =?us-ascii?Q?Y95qYiA5wT6dSydb9YQuLE8MZH+iwNUzYbOjShsyR/9CGmlCWCcO+Mb5Iyp7?=
 =?us-ascii?Q?awZCZMPb6IFFS//U2paaLpRwvTEouP8k2cq7nTJyMLrct/cLjVLEDNOZVUUA?=
 =?us-ascii?Q?YxCTt3WWKiPjqDfpbaZMaZruJRL6a0El5nI6REm+3HiRCixoNijUXuLEkuQh?=
 =?us-ascii?Q?ifPBrhu/DlJPlI2u+Wy6U7ydmCRXj8U2T4muornK7iEa5u7Hhl3asOgDPJrk?=
 =?us-ascii?Q?3hUqjyiUI6Gq+Y/qRy64g1acYh543o3V?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fISv6eCmynDuW6y+kKaUSyLg2/0N0kx9gdbwOnDTRsdhBxGmB2JX62Fn6iaw?=
 =?us-ascii?Q?poSuIccdzVxqhPEl3WE27FMSCpTvKvMR4PqFeXf5crQSpH2skAewxp8B3ERs?=
 =?us-ascii?Q?CE0sKcl5nwJKfrxK/kGtjBss6gDpcjV1ydmzfZ2eAr+fdKZGobDn1N9FFd/K?=
 =?us-ascii?Q?ZKvRKeIsXqCMnyn+gw0a4nBUCD0kK3KG0FI4Gb4OwDHkvCx8cmBoDZWAdiID?=
 =?us-ascii?Q?1SXk6xQhhDbvNMA+/KO7//B643pmbNkRAwh792co7dN92PapcTXzkJ49YDlb?=
 =?us-ascii?Q?YX7Yige3GyZoYo3iQi1Jh8Wvojz1vEKblSd7sV7T4nSmSFsGh0Gw9/dPQHL5?=
 =?us-ascii?Q?JFvQjhjbQQT0feUd6AgSic+2aznG5N8Bn38i0m8hBqi6UGkIdkbaMNKg2gaU?=
 =?us-ascii?Q?n0M5j/AZxDVjcn4bvrGMc7SUrXpIII9P3vBQ04I30+CQGia1NEtV308+5oZr?=
 =?us-ascii?Q?61FjU8iBkOO1WyshuGQrqaLFkP2Hf03yzGBXDc+qQnnH/gFdRufdtj1RAJ+a?=
 =?us-ascii?Q?TZD5jF/JQ7bcTzPmXQZUSzLyMjMNP3lmNPL+u0YK+IxoWvnklu9GfD2G5v10?=
 =?us-ascii?Q?lAYMGO0KO7mzoWjUzwXl07HGoDKuyYra6gmBkWllgqjazrjhW6LiJHe+ghhF?=
 =?us-ascii?Q?2Hn84QUwhuMLv5AhX85v8SC/EYHIeBVvOzh4HrFI5fnofeQ29cyw0YcF+d4g?=
 =?us-ascii?Q?ibEEJdiahAeC8mjowtVDxFEvxeGokW3ux7OEcQc11uk3y8RgKHvL/9FqqX7L?=
 =?us-ascii?Q?LpA9yPrjrkGKqZxwVkL/1VV7uNbe+frUUA08YQfnQmg3DgpOvcIVMFQDBXHD?=
 =?us-ascii?Q?IMO2knGl20MfdUkfCAnlcXgiG0hDZUJe+p1Vkbp1qv0kPI+frRtTOKNomSSO?=
 =?us-ascii?Q?o5DvrBnpGGQO/RD/TBlcBLXdHBXxfIOgqMy4KUdAohijMIQFtdzZ/zh+DMef?=
 =?us-ascii?Q?45iu4Y55dzPLkJWWT2Pc0O5Q8zr5D5y+CQDvmfEmdrBmqr1SP6zXr4vYXcwK?=
 =?us-ascii?Q?lAf0LlcuCBLP6hOXhSa/jMHdwHeJUhVQkY7sz5REJkL1iI2W8K7pGhKN718Q?=
 =?us-ascii?Q?VjtCLWxLbQMlfOPvCeJg78iJETu20tT1/uDDaEHQI7COpszhW6+QiaTm34Na?=
 =?us-ascii?Q?39hlsy0xETFlq3be+5KbfCpDtJ1PpRy3GEBmQ6gwGUkui3w5UvmWnwtkxnfh?=
 =?us-ascii?Q?SKTsQBF6sQCVi/JFrBZWkR2e9pXK8PW3CpBbsK0XzCr1duILTJKH8XGB/EJM?=
 =?us-ascii?Q?q6zDJ+mc6nwabkzsa/arXs2fYATOqAZcdFZC+y3xPHHQMqanlGOOHJE5IHAJ?=
 =?us-ascii?Q?I8ISt09fucQ8O/PZ2Bbsz8EdUHvtLOzm/uJEvCKgPOI16ZWy9peJIJsMVTDa?=
 =?us-ascii?Q?n9Nq1MqLFUBito8q99ajU7PF7r5seWS+CY9XTZMGntURZl8r2yUX/zilbNy8?=
 =?us-ascii?Q?Cjah0Pu9G5WZiVRHRQh/3owgv8QaoGWpTTj7MZP/GTTgs2y+xx7mD4ztShFa?=
 =?us-ascii?Q?N3m/aYz7+g1tNE3rwwsq2/LGTdMF8kHp0zi57VjBA++fEeteaPLd06vSHPVu?=
 =?us-ascii?Q?/CpgjTDAsYlFj3MDG/JboZmmL1ioRLMddXNSntOns3c8ozj8WguxdPPresX/?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bcd7e9-7fb9-49b0-14da-08dd4aacde0a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:47.8431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tadXkauKMRENB1w29CW/wby7nlWO+xh8XdiFMcfWH7xhvlJg5VIrO0efBEsbFSszZxV/NJoVoQZ+gPBy58UxiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211128

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 bitbake/lib/bb/fetch2/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bitbake/lib/bb/fetch2/__init__.py b/bitbake/lib/bb/fetch2/__in=
it__.py
index de36f06bfc..e4c489d059 100644
--- a/bitbake/lib/bb/fetch2/__init__.py
+++ b/bitbake/lib/bb/fetch2/__init__.py
@@ -1533,7 +1533,7 @@ class FetchMethod(object):
                 tar_cmd +=3D ' --strip-components=3D%s' %  urldata.parm['s=
triplevel']
             if file.endswith('.tar'):
                 cmd =3D '%s -f %s' % (tar_cmd, file)
-            elif file.endswith('.tgz') or file.endswith('.tar.gz') or file=
.endswith('.tar.Z'):
+            elif any(file.endswith(ext) for ext in {'.tgz', '.tar.gz', '.t=
ar.Z', '.crate'}):
                 cmd =3D '%s -z -f %s' % (tar_cmd, file)
             elif file.endswith('.tbz') or file.endswith('.tbz2') or file.e=
ndswith('.tar.bz2'):
                 cmd =3D 'bzip2 -dc %s | %s -f -' % (file, tar_cmd)
--=20
2.39.5


