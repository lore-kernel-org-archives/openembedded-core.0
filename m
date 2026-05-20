Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEC67CD4F3C
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 15:42:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15357.1779291723376624403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 08:42:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gTcWRW+1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96001520eb=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFFdaA2487603
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 15:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=wnNtHWIp3
	x+3ENYEQy2RVlvO+U0LERq9EISImzl+68c=; b=gTcWRW+11do+e4TnsCP0QNA6P
	FutWz6ou+b0CUo0pDGVlOIEFwOwctlub7fcsAVvaX+xViOn7+cePDzfTOl6bZAWP
	jCsALoM1gh4EkV8Hny2XaqTL2HjIEtjO36w3QLjusWT+E2yp+GtLWjXBMxmgT7xK
	TeZ+v27Oot9NFUQNKMVWDa6k2ZF0SqeP3pRjJXhKxcNb0Lc9+dFpg2o9s3jPTh5O
	y0GfsMhF9Z6r2SSQT0riWrWLLvOz3sU9f7LjNrpLinkSj9YKvv7PV7joMObF1Poo
	8hSHzJeBy8+8O17+7JNvSESxm6ALYyignLh1QTwLmJ7uNReDrXDxuOsst+QRQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010016.outbound.protection.outlook.com [52.101.46.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf5kmg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 15:42:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=klZL2JArhjWvdtS1udN4DbuSpfKyIEHqGvQoaTIeBKGqDWfD6ZeiBB3xQmC+b3LptowWloO9/5s7JhrBiccXslp/hXKW92RMG8UDQGTTY3Z6BXmtZuPjefy9Egz0HOJZhWAwlGP3XOXlwpy7i7427MkBDoV9NwYmR8ehXXpJV2MpomN4vS8j/4qfRRA2FEcqoURY7FZKle03IHBitM7vw6AvynIKMMvbfDQO9gMpEwEitu4UTWtJdoWs/o3vl9Rti02Ne+UR6XzOmsTSAUrqjpYKwak4w4ztibKNna6Y9U452t2lVg6Rg3YW5jWvYqJX5iuKSFvLLkzKPfRPSjO7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnNtHWIp3x+3ENYEQy2RVlvO+U0LERq9EISImzl+68c=;
 b=DnFq82AjOVubvq/zDdsTfOKqPsgXb41f31X+f+ufMlMvq2AFrG1byjNEFloLu8gN3PJg+NQXawdR16P+1rmYA91UZMScSbQARADTPjNCT14uj+ZQDSh4njfYE2HY8dMcBMzSns/WKEB2WkI1UdgkTuXdLxYOidThXLetbDf+bRo9lN9AdZfkEzSkiZT+Kz6shaHPAH3GxWKZFFDRjOoMDSbr879nZsYAWe3ukPJthhfkUfkRzVLo0txjen2ie4AY/4LDkvSFa81uPFnUKibMUdbZu/Uh+o5wZKXqPd07VLB3RrOgFn38idXtHPno32R3juTWVGOvYt+ZGMHDWa37qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA1PR11MB6394.namprd11.prod.outlook.com (2603:10b6:208:3ad::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Wed, 20 May
 2026 15:41:57 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 15:41:57 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [PATCH] glibc: fix CVE-2026-5450
Date: Wed, 20 May 2026 08:41:42 -0700
Message-ID: <20260520154142.2981426-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::15) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA1PR11MB6394:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4e0ee9-a1be-4cb2-5b2b-08deb6865331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|18002099003|56012099003|38350700014|13003099007|11063799006|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: 
	SdXks6wAsq/fT7aNL3ghPMa2pEiFUyHS8FmD6i3b5x7UCMwiV7JWvElex28Vz+PlSn8VYJbh8DSP+WX4KiM05AwRxm0n3ZTfdCowapjkv6UC8pqYlWcVUmmoP4fkVGKsymcDrdUl7U8gqnLVESbRHLnHHBnE8x820NVTD3hy3AqSHVad9WOAF+zQgPuZUTOfY7MyIcC03c/og9zdYItH6Qb3wXfElsHBW+fFKVXSvVMw1xgR3ejp7+eya6P6RKNcocpzixfzpod+OKgJ7G1ewcpaUYikrA81qsBIhrfMD+ezjZAvHbdCGt8tjVHAw0Jx++mL1OBf6wJpC1sWHzNT3As9z4Jn7GPoSCGSgD3ifYv0yvQljG9ZHLzsevWnuiVest7TODLS8/R94IgE5k19f6pJvmsiEdARlIc9wnEFAMgo898c5UnVhSI7w62BxfzLy8hSyIuaSVKc7w3TMyyMrhnjWaQf1SsAareZIP99m9sDRp14FkwvF8VkzPdNQHnhWNc7HSh0PXhiEXl1myqrdd5eHjAGxSKBJTxpjSpw/OUPz4zI2kyvKmvN7eGEUUcP+b9HG5tP0XczBFLTYDGFKgSquO8xJUNGqtTuot6xdLT3zmlwm1tUgWMvIVCYJwBAXNaQ33e2avKMBEBy1+mSJwkUKRpROfyA8pCiAR0MSUh+2t/z/NTKqMyGQUchKihIyR3ul8gKYjSrtaSKQzKrkw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(18002099003)(56012099003)(38350700014)(13003099007)(11063799006)(5023799004)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M7YJyhyjqeas9BiUYHqqIPqzp/ZuXUdkxX/5Bzc2TmpiTieT4+n6JmaPkeD+?=
 =?us-ascii?Q?rOW47kkiInmdUHrF+Ic/Bve0fAEcBJ23KL90I6OSZTEnakpQKcB9LTpb0R8G?=
 =?us-ascii?Q?2m5Va4fNf/BrxNk6gfmCvn06Tw71Q7Cf59ier8B2gOE533LXCw9LMijetk3D?=
 =?us-ascii?Q?HGPMqgrhOd9RmJZoG7rq+TeCg/eLs+41gTB46pTZ5Bfv6IXRZCKwzRQIgtKK?=
 =?us-ascii?Q?t4ypDOICK30/YYuhvPBEiPOLDQar/FX+fVv5ie+WGQAYjrKbjBeb3vAUgar2?=
 =?us-ascii?Q?01rKaRyKbrHUwIL8hFphz8/5pbC2R9mW50Kh58h5CLaU/wQRPB8nYTYlZZm5?=
 =?us-ascii?Q?biET5BPzNtDE/OxkrveIdhoBk1AlKGA6YvIJ/+VBvrvbcU4wPeHjUbc2BWbS?=
 =?us-ascii?Q?DEm8+VSI9N9QCQcZJ6PuxwMd+XbX4VOqVCym4YqjIfHjqu8lTiHCCmvZ6rQb?=
 =?us-ascii?Q?uTsPR1T6AGk9yYefITX+z70ZWb0ApguR9+BchGJBAWKp0ckSDEBxzMKWOP91?=
 =?us-ascii?Q?fJjmwbNG6Agj9f++ASPWhidHOGWOP0b/zPSTgDKLE5NkbO2IhZlxlCVeH0nd?=
 =?us-ascii?Q?m5hnDBv1tPaqI6kiEsa+aPn/ZvVGYOJS28QBFTCHDjk9w6xEKihE3U3o0LOp?=
 =?us-ascii?Q?CnT51l1PjsWnc1qcyAbW6rxoR/ninWLjTVJGOVyzAvXxQ4ClnQjyjusB8bS2?=
 =?us-ascii?Q?MDjW121ZwOfMTWKoz8FLSjmI20htKelFH3nrzLFF7H5mAUubadVaTRtZ9x4E?=
 =?us-ascii?Q?WPubi0gufgufCmO8ewHKqXJ4wRBVVDQ6VXj4ut6Kcgkw4JHTzkj0BIWK/pEV?=
 =?us-ascii?Q?YnBTfYoQa/aM/WOdaHtK6lAtPxsmTzOMWKu3qK8P0mDamIdYG6VWn+lQK23E?=
 =?us-ascii?Q?CP8mYfdr6WHRrXxloUrF3fhbcSkFFSeWlxHZAGMMip4Z0b2obE5zwVNKvQ38?=
 =?us-ascii?Q?c34oil6h4oOnzTgm7MXbxnc2hsuHX61wcMQy7+AyicYylfaxzAnLeQXaMr7c?=
 =?us-ascii?Q?SjLwrtOcdjYjlHmYyv7knGxTGLIBBLtEg4bzSIxIN4XE5lf+cHouvQM1fEIx?=
 =?us-ascii?Q?kh4DN9Q1vjlXMLR3T6CAYnGBv5BLm74p1iDGosaP6dAx1cC0wS6o8PGhbVSW?=
 =?us-ascii?Q?urvVmREbaEzPwjzsAWoucUQjLIsL4g3iMHoQ/T7zwf4nRk/HYjAF/jLeW2U/?=
 =?us-ascii?Q?yCq4042WR7xKrzduAXKjc8v+4Pc4JEpkQoimeGIIErjtLAaoSIkytibIBeru?=
 =?us-ascii?Q?ePwDXtwWd0iDLJ58uKLSlfRe8IpmSJiMOGm6l+wo5Aiyc8UIqTCpCQYIOVd4?=
 =?us-ascii?Q?kB2LSUBkNjeCfXOc/yNigaLK8+Odf65u5N6BY+KU2alixKhzKhfqGNcGlDKS?=
 =?us-ascii?Q?Dm1iVXRKAWveo5W/DzO8hHPfiJWNu8ljrQARj3S1JmAz0lm3Dc78F4KTUTqK?=
 =?us-ascii?Q?7Bw6akvS1h1lvmTLtz8nmwbHU4JduMJ94vu+vFoSgZgj0sEf4MT5i429BySl?=
 =?us-ascii?Q?FXzUy6elmV9KquSyducQ8zU+jK6mjbeQDtdoeXEAflH9GlxDSr03xjeGixMT?=
 =?us-ascii?Q?FNbXRAA50orQJcUnnjmfg3ggMvORgOe8KAtLWba0vi8NqEBp1OWUtJWiwQq0?=
 =?us-ascii?Q?hdugSzyIdS96e5VG0E+SX6vCnFxR5dxXrcgvvCv2FvQ8dHzg83Y7CExB3UCV?=
 =?us-ascii?Q?+Aa7NKVIhOE8C5N+/dYCI8wP/zQqqYVQ63W7FhU3hoI6NE3FpkCgsRnjFbx8?=
 =?us-ascii?Q?cdWjdwjX0qwzik6MGOQGz0YGs11pY3w=3D?=
X-Exchange-RoutingPolicyChecked: 
	UgXzbsPCqIG/LicnBlvph/sYrnk+QaM+iLjJev2lh1TTcmWjCPEMPK9oS3Pzm4FssakKZQCQRB7i+zddf/fpDYarYGUTFFPR91jTCBZ37OvRgAeZYiCIghZXRfrxldpO3Nl7W7jTlBTbCB92LJfQt4S4tHUgZqSq+Jt5p/hRadiFFzhB40OtFcFRVQRf+4JlhKRn04D0w61JJpIFeOdFnaaq/R2kqFMESzQNwhlFCkRDKmxirixCqRm15YUCjby3Fduiak4FUdylY8UBipMGzK/whs5eSpn1GJR41MKQl7sxbl1URA5JC3gdMrRpyO2SqohT1LsgQ7gozWnpDlUkQQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4e0ee9-a1be-4cb2-5b2b-08deb6865331
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 15:41:57.2636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAgstHHqN89+xg1CGj+cDX+xt9pQPpEnjxx+9srdugQHyW1SqRaWbHKPhFQqkvh3r+yiakEM0/VSXiPD9MM2qIIVrPWisIBHdr1xZfa77HU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6394
X-Proofpoint-ORIG-GUID: QisscB2Hzzac9lW2dtn4HTkhcWsWAqrL
X-Proofpoint-GUID: QisscB2Hzzac9lW2dtn4HTkhcWsWAqrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1MiBTYWx0ZWRfX1n0N37fYBJPN
 iR8ovQie8v1RHfA84wo0tHtfTlBUv4a6bTJ7GHSlaXgDhfiJ+x0cI4VUVoB2i4NDns1/er7jH4C
 CLBV6t7UEVUh1RgmU6dT9kHG9wiSdIiIHImF8y6WUjaa2PgaTMrsGhEUAEVHkXZnGrh6JhM406k
 Ny3Vlei6eVSeWpBOGQLU8aiOCSHt6ExKmn60BImMtYNzMu/nFf0/YmM1jUu+tl/XsOV3gdHBnpM
 Nd+8A1C5kp6aPvy9R8b2p8RJn8hFuHpcyl4hOSMVS3dSDEOuBeg22dcxpatwekxT8KdkuxwdPtm
 owQfG/awf9cMwr88p7VDoD1PycaX4po0v5IfvkilcAErAEMut5ftNNh2pWSQnSoZhcd1TDR+ztj
 hrjm3c2FSd1kANxdUYHAvuR4BW8fWPN1UV11mEL6iTTm79eZbCxG8rnbkREONmCKARtYiFiNsyN
 2hhGK7nO/5wEMmp+ong==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0dd64a cx=c_pps
 a=+tUgqrp9vGCFEjR5l+cGAg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=CCpqsmhAAAAA:8
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=aGpRCxnKhhQui_rX8FoA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200152
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 15:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237452

From: Sunil Dora <sunilkumar.dora@windriver.com>

Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=839898777226a3ed88c0859f25ffe712519b4ead]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0023-CVE-2026-5450.patch      | 135 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.43.bb         |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0023-CVE-2026-5450.patch

diff --git a/meta/recipes-core/glibc/glibc/0023-CVE-2026-5450.patch b/meta/recipes-core/glibc/glibc/0023-CVE-2026-5450.patch
new file mode 100644
index 0000000000..22408708ac
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0023-CVE-2026-5450.patch
@@ -0,0 +1,135 @@
+From e3e9a51815d6582206eef9b3f5ce408507c81e2c Mon Sep 17 00:00:00 2001
+From: Rocket Ma <marocketbd@gmail.com>
+Date: Wed, 20 May 2026 07:01:58 -0700
+Subject: [PATCH] stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]
+
+* stdio-common/vfscanf-internal.c: When enlarging allocated buffer with
+format %mc or %mC, glibc allocates one byte less, leading to
+user-controlled one byte overflow. This commit fixes BZ #34008, or
+CVE-2026-5450.
+
+Upstream-Status: Backport [http://sourceware.org/git/gitweb.cgi?p=glibc.git;h=839898777226a3ed88c0859f25ffe712519b4ead]
+CVE: CVE-2026-5450
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+Signed-off-by: Rocket Ma <marocketbd@gmail.com>
+Reviewed-by: H.J. Lu <hjl.tools@gmail.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ stdio-common/Makefile              |  4 +++
+ stdio-common/tst-vfscanf-bz34008.c | 48 ++++++++++++++++++++++++++++++
+ stdio-common/vfscanf-internal.c    |  7 ++---
+ 3 files changed, 55 insertions(+), 4 deletions(-)
+ create mode 100644 stdio-common/tst-vfscanf-bz34008.c
+
+diff --git a/stdio-common/Makefile b/stdio-common/Makefile
+index 21094483..0c0085e6 100644
+--- a/stdio-common/Makefile
++++ b/stdio-common/Makefile
+@@ -349,6 +349,7 @@ tests := \
+   tst-vfprintf-user-type \
+   tst-vfprintf-width-i18n \
+   tst-vfprintf-width-prec-alloc \
++  tst-vfscanf-bz34008 \
+   tst-wc-printf \
+   tstdiomisc \
+   tstgetln \
+@@ -564,6 +565,9 @@ tst-printf-bz18872-ENV = MALLOC_TRACE=$(objpfx)tst-printf-bz18872.mtrace \
+ tst-vfprintf-width-prec-ENV = \
+   MALLOC_TRACE=$(objpfx)tst-vfprintf-width-prec.mtrace \
+   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
++tst-vfscanf-bz34008-ENV = \
++  MALLOC_CHECK_=3 \
++  LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
+ tst-printf-bz25691-ENV = \
+   MALLOC_TRACE=$(objpfx)tst-printf-bz25691.mtrace \
+   LD_PRELOAD=$(common-objpfx)/malloc/libc_malloc_debug.so
+diff --git a/stdio-common/tst-vfscanf-bz34008.c b/stdio-common/tst-vfscanf-bz34008.c
+new file mode 100644
+index 00000000..48371c8a
+--- /dev/null
++++ b/stdio-common/tst-vfscanf-bz34008.c
+@@ -0,0 +1,48 @@
++/* Regression test for vfscanf %Nmc out-of-bound write (BZ #34008)
++   Copyright (C) 2026 The GNU Toolchain Authors.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include "malloc/mcheck.h"
++#include <stddef.h>
++#include <stdio.h>
++#include <string.h>
++#include <wchar.h>
++#include <stdlib.h>
++#include <malloc.h>
++#include <support/check.h>
++
++#define WIDTH 0x410
++#define SCANFSTR "%1040mc"
++static int
++do_test (void)
++{
++  mcheck_pedantic (NULL);
++  char *input = malloc (WIDTH + 1);
++  TEST_VERIFY (input != NULL);
++  memset (input, 'A', WIDTH);
++  input[WIDTH] = '\0';
++
++  char *buf = NULL;
++  TEST_VERIFY (sscanf (input, SCANFSTR, &buf) != -1);
++  TEST_VERIFY (buf != NULL);
++
++  free (buf);
++  free (input);
++  return 0;
++}
++
++#include <support/test-driver.c>
+diff --git a/stdio-common/vfscanf-internal.c b/stdio-common/vfscanf-internal.c
+index 63b9246e..8687150d 100644
+--- a/stdio-common/vfscanf-internal.c
++++ b/stdio-common/vfscanf-internal.c
+@@ -862,8 +862,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 			{
+ 			  /* Enlarge the buffer.  */
+ 			  size_t newsize
+-			    = strsize
+-			      + (strsize >= width ? width - 1 : strsize);
++			    = strsize + (strsize >= width ? width : strsize);
+ 
+ 			  str = (char *) realloc (*strptr, newsize);
+ 			  if (str == NULL)
+@@ -936,7 +935,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 		      && wstr == (wchar_t *) *strptr + strsize)
+ 		    {
+ 		      size_t newsize
+-			= strsize + (strsize > width ? width - 1 : strsize);
++			= strsize + (strsize >= width ? width : strsize);
+ 		      /* Enlarge the buffer.  */
+ 		      wstr = (wchar_t *) realloc (*strptr,
+ 						  newsize * sizeof (wchar_t));
+@@ -991,7 +990,7 @@ __vfscanf_internal (FILE *s, const char *format, va_list argptr,
+ 		    && wstr == (wchar_t *) *strptr + strsize)
+ 		  {
+ 		    size_t newsize
+-		      = strsize + (strsize > width ? width - 1 : strsize);
++		      = strsize + (strsize >= width ? width : strsize);
+ 		    /* Enlarge the buffer.  */
+ 		    wstr = (wchar_t *) realloc (*strptr,
+ 						newsize * sizeof (wchar_t));
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.43.bb b/meta/recipes-core/glibc/glibc_2.43.bb
index b84c55ca17..a52dcfd364 100644
--- a/meta/recipes-core/glibc/glibc_2.43.bb
+++ b/meta/recipes-core/glibc/glibc_2.43.bb
@@ -54,6 +54,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0020-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0021-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0022-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
+           file://0023-CVE-2026-5450.patch \
 "
 B = "${WORKDIR}/build-${TARGET_SYS}"
 
-- 
2.49.0


