Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8039CA6017
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 19:59:37 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3384.1791489566310501056
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2026 12:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=aRR6M+Sn;
 spf=pass (domain: est.tech, ip: 40.107.159.57, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGoYIHnKMtUgU+9b82PUMA3xmEuETBpqo4KGyWtOkvFk3dY91gjZ8CxvtLbA3Ci7cpXVWkQrJrV1yN2W5S2jR14FfkFr0qnsvRdagfBUtR6IT4EP9GmEaDtF1LiKLcCdxxU5/Dxv8fB7EDlJS1GU4ciamNQRuoPDCsKh7mDRB9YC0aESV592mOTluw6N5Kqc2zRTUw+vdSH3Flx2jHkOFkYqtQ7CPmQKD4SfKTu6fC6RCJO+hEFtWVMqPq8gssupw7uhWiu0VCi60rvj+n3zWsVvo8x2zS82P8ygp8e4wdT9s6v/sAswx2I1dmr1rkGUPJDN6kXQDeM8cQ7R/nmnsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC1T3Jwdzq53JbTXRVr6DNLLQFfeX9FdsPMHoHgZEnA=;
 b=e4WpHj7Lai9jzh+UqTihhrDQkTvB2GJzmFa47d11EG6IlsznyPjzENT6hWo2hh9apT+Nhwbj4SQ8dUG6TucZGFr9v8bPol1K44jZKQK79RrWruZf9IrGiKjb/7xMWd4Lp11Jv9yb+jFmbAtEgUsiRI8HpK6ycLYpEbWopeg6gZn5XX8n5oAiLW7g9bqbzULgM2EJOHrjBUMVRc/Aw0mrzOL8G1dYwjMfPr56dy+OjZWXPs3GC4sFhdDwcP/hyQSf8W/9PKdwQvXn08j/rYtbIspSrtUbtU3OWGRjYqZ04KF1Lh5DtJr4LJcRWkhsiFC3k2cpkwtFaVy4+jsXWCw4qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC1T3Jwdzq53JbTXRVr6DNLLQFfeX9FdsPMHoHgZEnA=;
 b=aRR6M+SnWv+n+q+q3bmv2JMdzolw4DAZx4pgDgy7CzG3vv38Rp/klSF0AExuZYb++AUvjEyiR8Mm6ajGyJxN/2thdaGCtfphoYNYu3cBfnMAG/SyBmJywZtF+0o6aHSUlp3VINb4kGrgejFlgeHWhJXbjnUT5aOzAkna/DV8wx72R3f+7d+VS9kmy7Cly+zM89d2oMm2UU+zQvsUatfIDVMKn6ZAiBvFBDmGX39IjRGYDHO7QQW/qeJz/8cy5E1BMjmk5Mx4RAqpHbHBfC/QLbZPtcyoqBDNuT4gpKnk2fVeCuuS66lM9xuIXy61JPox+szVmNwF2P6Ygc6s+MEADA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by DB4P189MB3118.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 19:59:22 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 19:59:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] libzip: upgrade 1.11.4 -> 1.12
Date: Thu,  8 Oct 2026 21:59:13 +0200
Message-ID: <20261008195917.22382-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
References: <20261008195917.22382-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0068.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::18) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|DB4P189MB3118:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ad5d593-d666-4367-0a1b-08df2576a486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|11063799006|10067099003|18002099003|12006099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	u0u5bs6GnOCfI4VhgIgt3krfTfz44Cz4ahlwlWkgfyK8WL0iHRpwzndHLqmDx7wfWwpqzT2B2sI+zFEATMpsPhtRTatHc2yGkaYN8hn9Q6qPPdGOYI4uc14dgY9BzIKGpRc6H8gwiTAFEobn0a70R2qfQjlqMyvkwJL/hktMUMGv9wyjtc9xxGapXeFuLPmyA835BXXlJ4P703Xn58Muk6xphZnjMHwbr55k213NZ1tVmfY1fnGrkVB8tiHg0kS123GG+CIGoBQmuX3wFrb83+7lh48gFvgG+Se7p38Q4P3zs59qM3Rhx7uZxxPJ/BqfOfOzaHshORsG4er+FQAt/16P7Xp3Do5TvjyeR5mJs0qihkU0DNtz/rE/0u9fsTeL+iM//V/UbRn3zyEq5Z3rusvHJmNRdLwc/twV0YTfibZbgaRTHJ+IjPRlo1XzzHW5SNa9ri1BVjeYvgINkrOXXBOcxr7Wz6p/Ix461N2TTtoE9LQUqfymrD/MewA4uJJ+zLfS/ecNcr6PhR1caLc3R8WabWQxvUPyZetV9G3J6cMVQ7uhpxPz5lLMzJRXB5fccLwHxk76MtNs8oLuNFlwbmAXdb0JyDeJc+KYH8z5xxU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(12006099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QFDsMhp0fkTt+ftYOGcEkDSufk5ZEW/8IWl4jTHb/s9chLHY3zoKpkxROch9?=
 =?us-ascii?Q?cloz5pRY9BjwVCayxhDVI1bcwnhhuYPnXPqY4Ceo+x7zgAeI8HjbqPsPetRX?=
 =?us-ascii?Q?dh/5J2XiqMoTbzQau49xTLyiIf4ZFruB1NXDJes0HV5w54lXelVqyxa18oA+?=
 =?us-ascii?Q?vnoFqtIYNamYxvvGbzbob1YgdSo+hO7t9ADriWIPfjwZcHOOF0m1Jg+lShHk?=
 =?us-ascii?Q?R/NXgF6fxUFag2L5h9dl7QPQpFCR6JGtodReWA31EQSJ+neKiAr3IAbl+PJq?=
 =?us-ascii?Q?woKiEF3Af+euyZ2z7/5HRDOJJfwzsQNhaTF8H6aQVJN740cRmIou9OKAwJ9G?=
 =?us-ascii?Q?2EzwhAgDH6dHtmRO58YXU7tXzvUfQGwm7O2WVHFJz8E3xGVuypkSQtEoY0U8?=
 =?us-ascii?Q?yeloK1DqIPeZXUjmd4m/hTHSCqG8C2Vx84+5Jgc3UkJ3/DBp9ey5+j2jm382?=
 =?us-ascii?Q?ejpFJ/NT3JcgMzhirH4PekBSRRq5t2dNLSDmL3rod5bw7HWDIQ6rOBboDRTv?=
 =?us-ascii?Q?o3bUZxDm+LshtLv7yj4GY9oOT9+ZTHzAguU/f5sVoNzvZ2JVnAEd1r0QYH56?=
 =?us-ascii?Q?ZDlTM95W+W9jHdJAuc4IsFovQnTUIaN56LM3/zz+Vw/e99pQwWvzsmawJSx4?=
 =?us-ascii?Q?UzoEJUm2oufu2/04dl4N3DZLslwXRNPBXJWH0IalyMxg3Al1ZFqQd19joZQY?=
 =?us-ascii?Q?UGphYjMJSihWRUa43NOiAwvsonODYMQWJJK42fLCqTM4g7Y5JXmBlDlKbn+6?=
 =?us-ascii?Q?9gJnGUne2yhLofxx91kP6ZkgKFwVbSNSJZn4ZebEWnYet3a5bOhjV7bkkcsL?=
 =?us-ascii?Q?twX9jG7l9QGsREBfiI/XNHWlf5fGFTCUAvLTDjJ1meADvVuSb4rUvon2+5AL?=
 =?us-ascii?Q?UH7/A2MCJUn/aZ4q5WmrcQlNEVvGm0fux6Gp6mBcw9hd0mxZZNT0D7hT74W/?=
 =?us-ascii?Q?/1Ugb6Nk8iFS3LG+/8SNnBd6STIFuSFuUAdsNoBoIbhSpNsGlM9L9v6hgvBX?=
 =?us-ascii?Q?Yi1W16nAghtzBcbbGj9DlOXliTiEi5HC2cyVb+R9R6wm7uKhthhKIFU8EPS4?=
 =?us-ascii?Q?/tnWCuPHwwcSlN4Znb5RHBzdeqY13CYYwg2SrR5MkE+mAIzXTpNKfZTiica7?=
 =?us-ascii?Q?u66v2tHEl2frgHnf8QlegZHUWmlMKTMl8dDi1lwaUKpYearrPIx/ftRseTsf?=
 =?us-ascii?Q?cTao2YESHDZjqVd4yjjNwuGDHZ87ulMFEhTY5WedTgVJvFlY7BOizBt4t5BO?=
 =?us-ascii?Q?kR/cQIps2JGv3th0Rj7ZoHVL0YlYltdmavrY24oiyJy+hcrvF0RkZBFXXeEl?=
 =?us-ascii?Q?1+qfW/ZZc3s9bGSVX2Z+T3Ync4Yia6ccO/Rf9AiyJURpELLWrARFden7qJub?=
 =?us-ascii?Q?2AdNNkxa3k3ruFsV5VEPBDhdqt9HbqE5T4wxTOyiqWJzrmTzYIYJtZXwfhJd?=
 =?us-ascii?Q?a9FWgaFseCfuNWddXdoF5oK/nk4PLfrlCTv3X3EnnvunH3fJUqJpzigF/qqP?=
 =?us-ascii?Q?4wH6p6zT1J4k+f+P9lPPx0OtX0e8HXf2z1KUUJfucQeddMdYH/MM7FezciSW?=
 =?us-ascii?Q?+tpS4HDTOyvdIG36Y51fCIrhsPoRu1xoe2i3oCCZuQCCUgLhom7GrqL1PtuF?=
 =?us-ascii?Q?RQ2w2NwkSKJp8tR6A0mdtJj7JmUhJ936DaCqR/6QkDILoRvh3zvjbbrqm2vV?=
 =?us-ascii?Q?RJ0+pV6kNyiIfrLfKvfA06K3XZw4RNJqVcYg6EjNHncX/slgL3ZMzXo/H7eS?=
 =?us-ascii?Q?u/RAeJMm4CsDXrmTpueSQuSVfLgG3SI=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad5d593-d666-4367-0a1b-08df2576a486
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 19:59:20.7794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGUBCgx2QlB4Bt6z6j09IrNNXgsXyBwjAOpHPeomJCo66TQ6DzS04QPVDGGPUlWXai3/A8hkOJmQ2NNT4lowAV+asiCI42uxJIWd+o0wALk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB3118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2026 19:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247443

NEWS: https://github.com/nih-at/libzip/blob/v1.12/NEWS.md

License-Update: copyright years updated.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../libzip/{libzip_1.11.4.bb =3D> libzip_1.12.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/libzip/{libzip_1.11.4.bb =3D> libzip_1.12.bb}=
 (87%)

diff --git a/meta/recipes-extended/libzip/libzip_1.11.4.bb b/meta/recipes-e=
xtended/libzip/libzip_1.12.bb
similarity index 87%
rename from meta/recipes-extended/libzip/libzip_1.11.4.bb
rename to meta/recipes-extended/libzip/libzip_1.12.bb
index 36f7d1faf5..37071592b7 100644
--- a/meta/recipes-extended/libzip/libzip_1.11.4.bb
+++ b/meta/recipes-extended/libzip/libzip_1.12.bb
@@ -8,12 +8,12 @@ BUGTRACKER =3D "https://github.com/nih-at/libzip/issues"
 SECTION =3D "libs"
=20
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd8a9d2078f35e61cf1122ccd440687c=
f"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De6fcea978dc627f41e0bada0de889ec=
4"
=20
 DEPENDS =3D "zlib bzip2"
=20
 SRC_URI =3D "https://libzip.org/download/libzip-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608=
d893180ed7097b"
+SRC_URI[sha256sum] =3D "376908d0f0fda13180a19fdc4f7062a1abfb59e09ca07a392d=
361253b8e60c2b"
=20
 inherit cmake
=20

