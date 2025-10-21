Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B97CCD184
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 13:59:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.47])
 by mx.groups.io with SMTP id smtpd.web10.12614.1761055157856689592
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Oct 2025 06:59:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=G8CN5XCH;
 spf=pass (domain: est.tech, ip: 52.101.66.47, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aaan+bDY7cnKQyMZMQZd0Scqz7o9ILibUQSJEpO73HEjhuGhfRyDmaEW/NA5om5hAtpa51Elt+mljRY2Cxh6y+QhJ0YZ2MK0LInsAvNBJ5d+KzVEEyPHGAYefwX1krNUuiAY0aSn8SdPHH8vxrjLUIl1Y1RObrdcg827M/DZbOGgNkJQTfWV85VjM4Rc15vwNsnPsx4SauzcEumPsgalP2f2OVvSRPO2kGqYoVJxvswLIvqbS+uhKBGHuruO/A4w+F11rE0vdNs0Bo6MECJxTNNtEpDwVFNaaX4bwXcvQQb2qAhcYvh5qByVktx9CYzTXVKWd1UNeJTAvDR9EahZ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8k/v0n2PA7IFZSAoomQw28eZhF7i9xNRvLny3fectZU=;
 b=xc3U/1DQobRX1UoVE6qvY/HitJ5pHXv9gUDBw7UKXeBg/b23hmGdKWy+GYNkqox85owNnr9tg5PzUC+vKSBEuIkcbdXyhzCDLhDi9M0obo+CQO/OIKfRsU+eXW2kr6skiEJA4wRvgX5itXokeMprrWmekTAGmWOEWtyPiGmZEippr5WBMDgsQINi0id0EWiaNtu85DPbcAkhFiX2lJJk1p90YHJx2cn5M9iH/wKXXo36xvEoTc6txrtIwIj0WnKToF5c6vKl0e/UA+/KlhmutaDapNejSMAo2zuqerYLVPaPAS9ktGCdKGk4MJCgypRrMTQuQdgoUm24aEpQvlzK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8k/v0n2PA7IFZSAoomQw28eZhF7i9xNRvLny3fectZU=;
 b=G8CN5XCHw1o+LQnjEnwd0S0tFg5ku4aC0ZSM3CRGTKhBDjE1+e+oiaIgvlo8LXy0GlZXK6qE71lU7ojwu6ojvo2DgkG5LOiI7dxCGhjVvVeZI1Oava3A/9WcibK1QZqnER2ROflk8mYvpz8l3+z1o5YfmLwgvzvNxkytLGI4Iv9Yc9tbmhLxinWvjVqPP8+ZSskzGrW7JYQTJ45luGQp77gm85/W5FEljHdZlA+HAYWi5eqtR2FpaqfNZMAjGAfpS+b6X5tk8Z96wBAZHU4PNy/OOd0VPuq1dFs5hosRnnEtQC+SOzuaOnCT+FIdVU1b5aNvMEJ2JRf/FiYem21rcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DU4P189MB3470.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5f4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.17; Tue, 21 Oct 2025 13:59:11 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::4255:282:3810:7c8a]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::4255:282:3810:7c8a%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 13:59:10 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>
Subject: [OE-core][PATCH] libpam: mark CVE-2025-6018 as not applicable
Date: Tue, 21 Oct 2025 15:59:07 +0200
Message-ID: <20251021135907.17684-1-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0114.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::32) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DU4P189MB3470:EE_
X-MS-Office365-Filtering-Correlation-Id: c342ec40-1e84-47b8-a6ea-08de10aa0262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kd+/tFMJyHb4gzDDvIrYYfP/vro8o4NClvsbaELNCsFP0Ov6fQrn3Bxpf/Yq?=
 =?us-ascii?Q?RNEaUXXx/PFpW2p2iH5G/rDejxXGK7HCWKHpl9O2+w2GeTr8+fhMFesAIq5F?=
 =?us-ascii?Q?JfZ38mfhPfie1C4PXIZk1VNbASAeUHVzyOlZt7YaLfPSFiVYqc6kmefhK2AT?=
 =?us-ascii?Q?CUoat79myvbKgCXa2lhs9MiiFCQKspremlGpbwFqaklyxWR9GYjyQRds/ZdB?=
 =?us-ascii?Q?chZ1gxHGW1e0WJgeKvUGG0J7MJ7IpvNwY/SMBIsW7fv/8wXD8eu8xjLRBs6K?=
 =?us-ascii?Q?kZObnDakk7AG7ATqTPSuvVHNlPxYZvtzPrjBYgrbLw552IVhKxTkk6iLJNwh?=
 =?us-ascii?Q?PUiFWwWwWhfPki0QsIkbrUnIfSkUQXprSVLtkrbLW0L2/ev8cINqaXYYGRIr?=
 =?us-ascii?Q?fFvfbwpuwrg3WUEf8tI82P/5QfOVL0f3FbYhwq+ZGL8OPHWrDUF6L7zWIF7M?=
 =?us-ascii?Q?4ODzC8fUtD7nrjMm7OIdeMixK+m8uFA28Z3VuyfySh+K1QBDW8dMQoU5yZu0?=
 =?us-ascii?Q?1yv68xfquTKFuGJGDmvTyZOYZaYI9lhGpMY7wqyK5aYZ17HIXiBib8J+PJMU?=
 =?us-ascii?Q?PHFAxHRZj6Kmb7jVP/ktzu3Vlx6VJ33UlV9DwFFQUWb1dxjbBGnMQaF5iCCk?=
 =?us-ascii?Q?AfhZVjF2CqEg5x1DSXfJYnvBVZwr65zDqlAnNLzMRtVy6GB3ICGBNQpX5ySE?=
 =?us-ascii?Q?JFhmAgztWQ2NGt84AwllOcltlI89dw92K5M6n7VrmL9zDsm7hq24lUMX9UUH?=
 =?us-ascii?Q?eaWoiBVESIq49RSKy5frk8DeGUNoCtp3ZJGbR36OVJjF7W1z0l8TxprRdnoY?=
 =?us-ascii?Q?OHn39Nqhuf4ghf69RFCjPOiyS+VIdTz+13BsPYrh/W3Pn1ZyA1n6Op/rOyRR?=
 =?us-ascii?Q?IEdErfnv6rjtbzCtPZkDbi0gJ/WqzIZEkgLz+q3hPA35Ffnz672SROPgo8UA?=
 =?us-ascii?Q?8iOCSv6tAM0Af2U6/ooLoYIb240htUgBG9UHd7vl73UUKa8+PNtTgZhRbJg2?=
 =?us-ascii?Q?F/pKY/axVw96ICMV4/V/JtJwf4cxtabRB3PVZM30O2nd6nvrH8w0AvsumXwc?=
 =?us-ascii?Q?QmkfBEWzKvoNWkdHnPstaBsatOKGzARmOSaEGg3H5VgRDHx+MYnJUamlH2G6?=
 =?us-ascii?Q?PWS1GZHOJeWAoaStI79d5A+WDaIFh3Wz2/kl5Pl6GOsBhoHKXFA9QDXImFnL?=
 =?us-ascii?Q?wYLvYgSVT0NE1OfwcAhioAYc3AWy9sEHzMP/be+nSqm8V5QEhIZVYj8aMs7q?=
 =?us-ascii?Q?e3HsDG0KPUbSW/It3aN4nMkqxMziSMvnjjcbKvcK+c77RKwqm2DVWlfMLOsc?=
 =?us-ascii?Q?sbbTWJqQUoJ4PNzsXCsokEt9ZwI/PN0S0zPDi1SCmc49SlnD3HwRCuGetKIr?=
 =?us-ascii?Q?yd6HPvNJ63UxaeQainE8Locxs6EvG0cBCyLZI5rkQmdLzCHbCOK0CdWqarqs?=
 =?us-ascii?Q?rSEu2pQAWoOuFeSs8fA38vA8hhiP+CZv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?53dLxGFCPghKYuNFtbs5Vm6Qvlpcj1CxcfLzuJvSr+iQhGa4E0C5KVCaXBfD?=
 =?us-ascii?Q?euRx05Jl5b+hSLC7TS3Bc+NvzO2YS8mcvh4sxIpLeUQk21LdUoyp+KY32tjI?=
 =?us-ascii?Q?deX2IGobpfHSsHPKWH4435PbWAtUhTfhRhd1F/0yCivJjfL1blIdJVEIXDM3?=
 =?us-ascii?Q?QD4K5uzZO8q3zjTEuQjyFb6L4imkdsh+q7T3+M0nSuuYjOzbVvJ5K27WRsUF?=
 =?us-ascii?Q?P6LOKpMhA3bLd8FR6g5ZboOFVfw5uJ1jxBxzm3g0h40bVTlBXds1bg4BOJEF?=
 =?us-ascii?Q?qWZTO2g0l75X/fVEeQRQzanoOyFCU9VIDiFlHCrxAB+Jop5x1leX+sB2YIfO?=
 =?us-ascii?Q?S3C7NxE8TXoZP98Y62K+Uzf9fJlI7jHIVmaOros6vxCKbQngYZ8YTo3/JQMM?=
 =?us-ascii?Q?zdylxvddv8KSxqZ3XTIw6RYiSvfLGAkZMpSwdNsJxZ/C7cWGHxOl7ueDzCDy?=
 =?us-ascii?Q?gEjdYUYZhYymNOH/0CTcpIO+P6ya07etDuhMhPOgwnvV5R7WSQ78CPa6ENUh?=
 =?us-ascii?Q?jSefpB/d+49xBBkbY/yPkBHfHL301ITPLyqQsrRvs/zTt5jZNLAa57RdAOe7?=
 =?us-ascii?Q?5zySfPVM2dFh3ysIoO1S5c/kiRARFAGWL86TXShX05GXPB17qyJdk709bfMH?=
 =?us-ascii?Q?yiZxbftsSVYPd0tSCgpDsy0mPLw+mDZbKuvsBZaXmjhjMBBntUnres11cnzQ?=
 =?us-ascii?Q?XPhUnaleuQQZ6krbunsU4uguo4K17N7rdIw8QRQQScwPX/6k37zNPFEjTQ/e?=
 =?us-ascii?Q?hqw97cdLxXaS3TxmX17Kqm7b9+DmNn6+sU80R5mIbZpGZv02RsniLWOlyYcA?=
 =?us-ascii?Q?Sbkl006IYz10Hflv8sogKY8QO/EzM1sOabyPXCtnTwQxtQjx92RMlimG/hxL?=
 =?us-ascii?Q?pgDXUYqzP5LPZle26cPYiWPkWPvHoqgp47BWLjzKWFucGTsm0/6EqLLyQTLI?=
 =?us-ascii?Q?29ToS9XN7A4KjboqCHg9Yk6kSHbRpn3QBtUFFaOrm5fhTWDvy4LP10ajyLPZ?=
 =?us-ascii?Q?KjYo4yf3hP1txtu1VEa4YFfJrGgNzzS+uzBVqcCggnEtxf7zwjr0Dfg74qWg?=
 =?us-ascii?Q?EhQ4D/BvzFbLG2HyldGF8tACfgZia2kqdRPQhtShivXSCaZNsPt+zZWUpATW?=
 =?us-ascii?Q?JdWSJAeI0O9EItemPmJOn8PJJ/ApQWZ9A4AEFshHSoN5tZeGKJJyNwpf0gWe?=
 =?us-ascii?Q?8i3jvNQSUpX0muJeaDUmLjBkLsHb6rYDgpA/hEq0+5bsVUSA27KMP0WIEs7P?=
 =?us-ascii?Q?WS7sveDYOCYVVkv0vFCF9uuhlGeF+c5wZWhKQj5q68ZWL7JHWWHOhgOybrQ9?=
 =?us-ascii?Q?QQcbSH7A9bVkLlkTVPXHwXlI1Vux0IZKgglepwGSntgysFjlnGCFtYQqTAiH?=
 =?us-ascii?Q?ckNMpO6dctAxmwND+ZQ/1/2M6IdXgYVpHHKHvSrDbiEkHEVBxsRIUOepQz3U?=
 =?us-ascii?Q?iU0J6QeG8AVpVE4ePBwRNpe27fKMJXyJkozMIMbH/d1IyvBRBPODuKMdsozk?=
 =?us-ascii?Q?b5Rm4gvrqEwlweBFr4pLnGulssVDlFlMLaUwkpgG5QgePXzHfmjYRVK+l25R?=
 =?us-ascii?Q?M6YI6YlGfIpzzNFyseajPpO0Kj74M6leSfctm1X1Xw4L+B4EvUjvbOTW/a8w?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c342ec40-1e84-47b8-a6ea-08de10aa0262
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 13:59:10.4713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJYoaXlyv7S7UXod87enHmiIazRylu48bESP4iHcvA2XrS/09cfheevHFcYt6+rN+5MysrgBSmzYIioX+VwsdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB3470
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 13:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225149

CVE-2025-6018 is a local privilege escalation in PAM that requires
`user_readenv=3D1` to be enabled in the PAM configuration. The default
configuration does not enable reading user environment files (user_readenv
is 0 by default). Hence this vulnerability cannot be exploited using the
default configuration.

Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-exten=
ded/pam/libpam_1.7.1.bb
index 8d9ea27028..42b50a8c22 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -26,6 +26,8 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM=
-${PV}.tar.xz \
=20
 SRC_URI[sha256sum] =3D "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b=
28c232eeb26ab0"
=20
+CVE_STATUS[CVE-2025-6018] =3D "not-applicable-config: Default PAM config d=
oes not use user_readenv=3D1"
+
 DEPENDS =3D "bison-native flex-native libxml2-native virtual/crypt"
=20
 EXTRA_OEMESON =3D "-Ddocs=3Ddisabled -Dsecuredir=3D${base_libdir}/security=
"

base-commit: 416731b8756cd2689055ada2deaff48c7751d3b9
--=20
2.34.1


