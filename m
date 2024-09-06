Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35632CE7AEF
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 09:02:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.119])
 by mx.groups.io with SMTP id smtpd.web11.30525.1725613362147603825
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 02:02:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Q0j3BEFk;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.119, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olMv/F7oPzaK2OiO7na5L0IbWd6/f/H2FHwmve2cBLpiasu3YEBxDORsYjfLUmREv+PZ9zxx5/T4B8e7glOdEEzs487EcQo05YNY9TwWEUrFVwnhV/uNZBuewYA+tJsKxUamenHiIQLjT2iBOzhZ15r/ZcLJDUbnPRejZVWPtIfsvLVctIWQEobNmRDvOWEdAmf7o3bUHa+OK3MUxq7pss7AMgeR5MpCg1zC0KN0is3gROZe3R15MHSK5LV3aQQVZ1ZKY2WJVXAeg20hODFw2se/lgNHjsJtj86lrR1zc9APrDYH3PNCgJMNK4ydZMB7xtyfxf/Gc7zm1X+gKrj4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao8Pr+QDFf7wkekwTSTUWeYXOk0c/eCpXH/WwWy5ug4=;
 b=K72yUG90dCH5mTrjR1eT2bC70ycKRs53YpmijXgwma4w/bi3+PhrnHmDDdzp2pK0YLLoywa4M241t01I0b5+mg42RI+3i97NiJW4rAD2cbWOqV6Fc64OdCCCR1H4yyAjlhuKpWk7szrS5GjLHxp3LDMJr2t5u2oaglTukm9LcSVNdS7NVzpp2hdTrQl2OzvRMSmsB/5CRnFrmpE7+FYwqWwfcSxfQU0PKIMa2POBe3noDC9dhJDmdO9pYxiqmkifarhbYmqzsCWt5R4ViBLb5ObapvSI3fsgDvFVjP7AtvwpXgR06Jbwwbio4mx39Cgc5t3tAkbj1MsI499v8JhKag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ao8Pr+QDFf7wkekwTSTUWeYXOk0c/eCpXH/WwWy5ug4=;
 b=Q0j3BEFkpFWm/KzMPuqcTdnIYDGEmNjh3Zkxvu6iU9Sc0OIWB/mZ4VuOasmV1neV2MS3sx4wfK7DLa/ol3OiqSXNqDFt3GmfIigaz7jW3nf17RY3ae0T/nuUcyqaqHnkGPyfEBkaXhhW4ApuAkB9J2xN9iWNJ47VWV45kOBZvpsbISmQStsgFSgfQ8XB451caNVhvjzm0lhJrvxH6C+jRu1aoluA9p4aYM91sb/lRTHXLqLRmQyoVEhFb8d9xh1OEeiqOtL5bEFtMeWoWhq+05RxdZ6MEQ0H0+r93xHNMjB/99nbys79a2NQAktxHrhiCqi75805/8+bahg8MbnyGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB6780.eurprd06.prod.outlook.com (2603:10a6:102:66::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 09:02:38 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 09:02:38 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 4/7] zip: Fix LICENSE
Date: Fri,  6 Sep 2024 09:01:48 +0000
Message-ID: <20240906090151.513160-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906090151.513160-1-niko.mauno@vaisala.com>
References: <20240906090151.513160-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 398ab3a0-ca52-4a5b-8514-08dcce52a80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Bwfok5FPJ/2ymgA8wNnIh/X6y/vaVVXMUog2FPqgWIJWy8jNFMNP4QmCrYU+?=
 =?us-ascii?Q?XNYkpDUvwn36E30kxAsOyCtJt1KNyriNkfZDn0Q3b6saLzlfTcxoCmh6ya5q?=
 =?us-ascii?Q?ea7MeKnoNwsbnvqescaR9iQAHaqp+xVYSGik1gUYN2bardgVUHNY6DqHYZ99?=
 =?us-ascii?Q?E0lvW6VjM7Cm4lhKUV2xOafi6pwr5LniLI04cYJ2gkJFgC2KUEmRsTXduoGo?=
 =?us-ascii?Q?Zv0Nb57ZRIWLDTg3LUDyq2lLIiEfK2bSt7+M3o/LyYDO/MrX2T0DkRbQZ1tF?=
 =?us-ascii?Q?d5IMrqZDg1AZLai45FHkFf8/GRPMgAqYW4HV7GqOeP//sptpCvLB2FzTvJM6?=
 =?us-ascii?Q?Ff1bT2KvgmUcuKUQ8fUeWRcQsJJooeMZQkry2KoRzF7JlUDVckWbrygsLus6?=
 =?us-ascii?Q?DI8uqk31lt9K0kCbjRDNd/1HNZy0oLCrMhDyzkJnjf70jzwkl9gToAEAzcyP?=
 =?us-ascii?Q?ayEsyoFWJ30tf+V1y2tvLSnIcfcoKH/S4ySXyYYPz72HicW+4Cr0Pe7J1Em0?=
 =?us-ascii?Q?umuG6viBDCgdkPpEm/klrt8GdDV7MTJ0R2EkswsL7vTi6y8Q7RAFuh2pt18q?=
 =?us-ascii?Q?L1Of5L2fPPHHT763w7DXEPvowlc2UyOlgbeiBQ0ysNKGjIFLIAycvzpxJi/g?=
 =?us-ascii?Q?f2yLhr/XhC1MvBUSyAjXE6YZi6EbRRXT4M6Bpt4c2SuhpQEcu2WPqv9t+LY4?=
 =?us-ascii?Q?WACCI4SwZX3ZsqYalwXBvwkC4RQXR8jOo47/sygwE9Scw5Qc4lFlp3sA38Qi?=
 =?us-ascii?Q?QQp2gQhF+nsORnj1CpTS1Whn+cQQME7sqLBH+iAdmdWwDE+uXQQLcSHMOL+P?=
 =?us-ascii?Q?GiXWF0Gw3wbMcGRef35P9TdSGNf4kOyyZsUQwQJFZlYu7PGXv1fVnpWWlQOJ?=
 =?us-ascii?Q?VGT2utwQEPPA5MStVI65GdQLFk2SVqYbq7MLvzimREb6slRbhm7p2BEypt4q?=
 =?us-ascii?Q?te5UlgqdSAa5PqdXMFEKBuSOTq3uejjqOAswqkxNLM9Ove7ppRz3FpddyfHn?=
 =?us-ascii?Q?0Yx7ZZZQjI6Vz0OSHlzFgrZS4Se1lMvr+/o+a8Yt7q88MIZYMLFVhW7DMENY?=
 =?us-ascii?Q?8hjj0XsOfc68TFobASNTgyFmn8/ORSU+N6kTfM/lKvHcOS6VCqPUnKELcYou?=
 =?us-ascii?Q?ASMx3CnDuKK6pUDSIWtPlPEYJpUyAo3aq/SqLAe+Jc1fnmkJVUP98VZeTsPL?=
 =?us-ascii?Q?XoRhCeouSWrxmT1WLDNy/I0De3lwPv4E6H4/EVGPEYrf6hw1jiA+GnEG/EGd?=
 =?us-ascii?Q?A1Ax7+sTu4RtVXVUkrs0W2+j80Se9bBSRLmj4b6joBsMx0FiXQmTBs4v2xMV?=
 =?us-ascii?Q?xBnk9OEOVj4lda7NsPzgQmxM9bFhJygc7KQBZ858C7kWU7NnThVmy+4AGxLx?=
 =?us-ascii?Q?GQnSQ6w=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h60JUISWWSGBY6cvbDWudeQqZXjS4b+9WwyzYZy4sJuUsGvnzYvJvuw8dk+O?=
 =?us-ascii?Q?Z1bzZjwQf1Hl56FRd4W6qt8ThgHexfSA1UYULZkTtpKmQT7t1zH4y+he/Wkr?=
 =?us-ascii?Q?cic2f1tamTW+lF6s0EEfJAn3dzfo1hM7iRBK42W/1jlzvvDrEBo5UpnOtw/m?=
 =?us-ascii?Q?oCJOk1PuMWJNrFnS7sGVCoP7ZqGiA0T3GisRtMDskzAbMsZopDFhS0Gjk/Vj?=
 =?us-ascii?Q?iQEHZI4bJ9GKDm6HyeJrmdbKItaC9fAaH251T/5+FpcXrMcpOr7wUlVbo7pl?=
 =?us-ascii?Q?0LXbhCzGLxgxp8k9ObLgyStdBQU+OGzO/dtqsdiXLF6wggBVBMo3N7pJeD0L?=
 =?us-ascii?Q?T3I6RWfGFR6nuLv/X9Y3aOeJZEuTKSdlhu066qE+LtUosy4qPZFd73q4xsGD?=
 =?us-ascii?Q?hR9RHKC+YN02lNcQOe61uQo5jxtO4MaXB/k0vKERV9nMWn7jt3PrlohfxXWm?=
 =?us-ascii?Q?RLdYU/XcAnpkIDKOGaKtC0oy9r6XnxGtPTojIc28/CuP93sqm/wOKogwNRqs?=
 =?us-ascii?Q?TsGJ7PUSH/GoAbXo9cHJW8Dmktezh8XpZY0MynhPu2G51GrmbGEUySOxOPxk?=
 =?us-ascii?Q?kcZHQsK9DDx4hv2Qh5GypZ54DDE1K84JIXJ0e5qIZ7/gsqapL/s1xO/4gV7+?=
 =?us-ascii?Q?e6rDJ9ZeL5Qx0nrqvQARdQSKCmuZhSkeO4aN9kk82t6cEBX/SjR5kEOS8Ylq?=
 =?us-ascii?Q?4EnMXEL+d+eqYWwyyFZeTRr5vxUPAnmoAKUukB542SA3/Pa9uqCV2/fjg3yC?=
 =?us-ascii?Q?I8vfv9cO+xoN0hpIlNbu6O3mHPH5xiz8YRMT7+7EqhO9njKgOpAZrVp0md2m?=
 =?us-ascii?Q?ad3dY0VjXjMRBvJLEe1eHVde5+5JYGOwClhxRoxjh64C4IryPzEoRBKprzNZ?=
 =?us-ascii?Q?Kr8AMG2hQQcXgc/xLQG4xE2+66New9dGX4O7AADwXpj1+sjyD85wRUNX7keV?=
 =?us-ascii?Q?DVfHe5xfsLPgECAp39uj31LQkwza2tSoe2t0eg6j8A9MDRjB6LGwv+MMpcjM?=
 =?us-ascii?Q?r9a6s65+EDueSKaiKJ6urjkYCSXsbAWlVF0beMtbBY456+/XKiX9qLem/iQO?=
 =?us-ascii?Q?8DIJ7M1UMuLWHjrwiQUfcUrXlXzSscHdcFlzK2fztMx8Kx8W//bFaDrA7rsY?=
 =?us-ascii?Q?r7q9XUCv7rB72rt/tz2Zl5XnSoqhJ8986SaLMy44eEGXNytDwuRaME06dVur?=
 =?us-ascii?Q?h/CkuEIJxPGSkZ4nF/2RDKZVIj7R+ZhgXw141kGWOTkliRG5v8ojPQZWKLli?=
 =?us-ascii?Q?HH/6EZJZa9hM5bAU8/XtLwEud3A9Yu6cywFRDSUtMyFiAPkAT2fJRO1czWZj?=
 =?us-ascii?Q?/xGwtZhbJxieYLIB3Cxe0qnUgFXqSlPkxPymXM9o7cvX0j8NCNXYJvhaxLy6?=
 =?us-ascii?Q?/K5pVYWHKXPCAztvUx6qj/+70HzDnvS2MgtGhaK/FWM6FD0zxuYAC+Qpcg9K?=
 =?us-ascii?Q?mANEyMHCst5yNTnC5akSbtOFngVM1gO7Kl9F4zVKVzZ5tOYRGv3Plz6GgLN1?=
 =?us-ascii?Q?0QBjCickfWMuELi3eF5cEXpVPhxB+b1znkQHzRDJob0umkOajM2vSi9tUcfs?=
 =?us-ascii?Q?WfN/ZMyryWwO/QqTHy46MptjN5f5dszLtj0Ld9fbY4eY3FhDWXHP0UM/ftkV?=
 =?us-ascii?Q?7Q=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398ab3a0-ca52-4a5b-8514-08dcce52a80d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:02:38.3109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjIae0ligrMWbsnFKgk0tv724SHzy3WJPYwYGW0LtvewUgBxmFR1Z/xmFwdbbXM1153W9XFKYDxhZm8PkaKPnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6780
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 09:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204256

The contents of the LICENSE file included in the current source code
package match those of Info-ZIP license, which seems to originate from
the year 2007:

  This is version 2007-Mar-4 of the Info-ZIP license.

(From OE-Core rev: 3739a1af61ff6f0faca23bb565f9e71666953715)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-extended/zip/zip_3.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/z=
ip/zip_3.0.bb
index ec54206335..58144baa14 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.info-zip.org"
 DESCRIPTION =3D "Info-ZIP's purpose is to provide free, portable, high-qua=
lity versions of the Zip and UnZip compressor-archiver utilities that are c=
ompatible with the DOS-based PKZIP by PKWARE, Inc."
 SECTION =3D "console/utils"
=20
-LICENSE =3D "BSD-3-Clause"
+LICENSE =3D "Info-ZIP"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D04d43c5d70b496c032308106e26ae17=
d"
=20
=20
--=20
2.39.2


