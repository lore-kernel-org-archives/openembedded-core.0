Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FDEC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 06:29:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.53261.1751869738420726104
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 23:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=928339c54a=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5675slMO009288
	for <openembedded-core@lists.openembedded.org>; Mon, 7 Jul 2025 06:28:57 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19hb2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 06:28:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vserjSfCQBwVy2Uk2MDJjQSzshetBnj0ict+Cm4qVnWz2q54rcoRhMEA2nOfMesKAam+6S4WTcZWmBdzUHSrY9nNKh0QnoEHXUbsJWK0qSXxU6yN8fgY7QTOE9JPs+uKu3V3kpReC2A2934JMRUto/iK7Hb2TZUQ+CEiOErdc2W4riyH6ImQJOmXo84U59spUhYW6GyFIPVKjX2pdBiVDUtqEATOOobG9zBRzvT/tW8bXQo5GRqahNQPHrga4L2H3LkARmpbXbA/Ac5aqnwm/26zAVn/q6ouFKEfL+YhxWoO6PXhKdY/0xQTluck8c+u1fIN4CKZ3Gw1xIAur1+dZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P8ftzOzVZzu7Gif5tIvDJBf8BtR1pkCx0YMIEkNVs54=;
 b=HQa9UnGpAYgzd8UBkbSuv4ddXOQL/lwpjeS55+vp5bglQyPIkSNcyCxvhOuG+tM+QoGUums3OmZ7AuTknLO1YnyMyepSY3jUwNyrYYiEcLFWkhQxkU9HsHd3I2oRJaeeGk9sA4GVCD18joUV97TjahDdcZiMfNH55Sh15qYH65BjedYVBxDkwnZ/CyRbBo6t1uy+cgc8NcCEf5VVOjAA8AfHWrrMR4FZdvSUuwYkCBGXpXn90wlOk8LPssER7AMFXAGc8tZjJ5xyV86Vex1ib42eoccq9pCn9/CniOniyL3uNUXgysWRT+BJvQWoGWJP4TkbdBY/4jPGfM8H3cO40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.37; Mon, 7 Jul 2025 06:28:53 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 06:28:52 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][master][PATCH] wayland: correct the SRC_URIs
Date: Mon,  7 Jul 2025 14:28:38 +0800
Message-Id: <20250707062838.2764845-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0120.KORP216.PROD.OUTLOOK.COM (2603:1096:101::17)
 To CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc2eb1a-b2ff-47ba-704c-08ddbd1f8a74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X1UlVqr0yLpYTwvoRWAXqpnHI58VcHzdX86XypECi0ty+gr/Y7IuZNS2u85N?=
 =?us-ascii?Q?46YI3GiTk3fUxesRJxqCUQ7dUAtDWf9W/kApiiL6HDYP1A/iRLyQF9uVSHNc?=
 =?us-ascii?Q?M6y+mbvtg2H09mb7OmsRZVYZIWqd2Shxidl3hMwWFd6Gh60ho7ndLO921lHq?=
 =?us-ascii?Q?pc+iy3O93zmByMV+ElF+PN5BcTzAAOP0gywDrxb70Guz0cQXNy1lQyWPhWNz?=
 =?us-ascii?Q?QdWltg4IHDWDjMqJmYeQOAD8jms6AUMfewdqyTJTJ+A40/jq846j+FgkQHcc?=
 =?us-ascii?Q?s24PGKPNU07SZlWCFWN2oUkYH9dhfT1blyV7NBMrfwLKdxEZQd2vJYew3jGd?=
 =?us-ascii?Q?AQAlNemyzn5AWDK6eMaVEZpUQ52gmjskBnCP9vBG3VKA2Km3fFzrnrtua1cP?=
 =?us-ascii?Q?EzvXdfPAhEKCnkKnVsHgsikjeiuf8E9zY9tKmTG+WGr+AUr8Od8q76ACxCPx?=
 =?us-ascii?Q?cE6AKryeqPnowf/20YnUTfCL0zIkdNLYP+lUo/70J5rQ96On+GwLjw26Vf8I?=
 =?us-ascii?Q?WdtmU844IjDbyPcnU3O+0i+UWnP839Uq/ZLmbUeZ/aAYnAyVZ2Cp2FBW+Vt8?=
 =?us-ascii?Q?cIsFrONRih6ia2rpGtEgxm9Xsy54TAd5DxWWMDksqAA8D+rAlrt7/+YGAf+5?=
 =?us-ascii?Q?OBIGzNlfhAhWZDvsW/L8L18CKn4DdIADzBh3yYFR/+sB9HoOZSaFFGpCwrc0?=
 =?us-ascii?Q?PHu8PFsVKxZHlX6M1KfDGL/KXp84oWwEZdgMSrYJKsrbE/q2FlPkdsusBYM2?=
 =?us-ascii?Q?5DBxZKCKMIaGG1hMZuadqGiRJhj21AibDzZZEzlnCHRflpYZwYfr61LtMnLT?=
 =?us-ascii?Q?ll61FkkAssSkrDed/g/caxXQrtgMMVnHcjWJk3NbckhuuQPDdXbYnrmrtkhV?=
 =?us-ascii?Q?4kKvS2mimZoL100hRHUUvEV2jfEBNd2ozswKv4EHKYmrvfhjfMPWvCn0QmOG?=
 =?us-ascii?Q?F/63eBL8IotJaqRPAWkh0EoWVX7rBqoR3ewGPriwKfrAAH50wu5OoxZuZnjM?=
 =?us-ascii?Q?1IcQuYlUzN15L4DFqjH3eVv/CP7uc8A31NFG0giwGFKShMzmmjtdtPth7wu+?=
 =?us-ascii?Q?vH7yx9JEX0H95xeTVVITtCg85w32QxoOwJ1lKaI/gDolPjT7aowv8tSWOY28?=
 =?us-ascii?Q?SVCzkR71YmL7CbSGSC0pj29IseJpRZtyaYdWHkjKPCGDR3br7AvlONiym1C1?=
 =?us-ascii?Q?MP2v1fscE34Ux1ev5wXppM6xC2epKOj4oIHpN6aSoXhnQrP3DNpHM0RYX94a?=
 =?us-ascii?Q?2TpEmUnToZA0T9p5rxNWc8bbA1VZP48IGzWEg06HDOhtGt2rjfZkngUER4D+?=
 =?us-ascii?Q?4hfdGr5D3Fn2kAOmw2T8xz1daW68QE80lZ4tKG2mg0f+IFNRkP4rwJWg9U2X?=
 =?us-ascii?Q?tBlAqfFwLDHo6o0fMuGJkOm1sWFjZw4CL3Pokd43fqKzo1H2WjFfgZz/rKbf?=
 =?us-ascii?Q?RcpgT8JFDl8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M76lYEShjCMpO5zkeSaW/63PhgGluECf290U3ejqI5krzViPHepjOW5Ohvbg?=
 =?us-ascii?Q?8ybfTG7dDISQ8Nj7t/qvPfzj9k6T1Gx0uUZnT+qZb+JO7o7+Bgv2ELDnXuYj?=
 =?us-ascii?Q?x2u3uhv8zqNNCH5sYewyARjVwIvIPHEoLOeP0pexEqxREHwOEX8LIs7zj4wr?=
 =?us-ascii?Q?TU3Ib/GEL2hS3N/J8RqNpmZBoYuVr/VAJlbAqVySoYz55QApy84brVCv71jh?=
 =?us-ascii?Q?SjtNm9QOtpO0FwEvnG68JvvGqhZcn2qXYMNKC4uYfFU/3ZXnxh/06JH/UjHl?=
 =?us-ascii?Q?YADQqhNBYzx2zQeU5t/Trmck0ypyJn82KepdR6DAwlxnrz5F6NI5bLIZU/A3?=
 =?us-ascii?Q?CJyEPZIQVSA9HqRhPLef3xRKOfp6j83xJLGXmFJGnAd11Yhi4d5o87rz12Tl?=
 =?us-ascii?Q?PhtfY8UuC5nclXTPYq7bMsRWw8sMZNVDYZxNG1GeZIRMffrjWyKpSaqyClIF?=
 =?us-ascii?Q?f2s9Cy2CokZOa8ZUFofTe0BtG+pE08uwAIcm6HIEGCwGnf37FYawQV1IfT76?=
 =?us-ascii?Q?kmMZvHpxCZWrMNPd+hzD18QCda1CQM3qqlBvFXEmo2jpEKAsRy91pFKGDEQH?=
 =?us-ascii?Q?mzeeb82Rubh6eXND7thZYZ2Z/Zef57TFj3S/fLs2Wud5mgZdAGm/wAnnwl16?=
 =?us-ascii?Q?wP7rnhz7Iz1A6aG4tkPJ7E1fYiyZ9yPWCZjIwVl+xWbzGGtX1Yxb5Iql3lks?=
 =?us-ascii?Q?ynfJ+pUb4nI6hLf5PZzi9bt3mcGYWwcwP9TClUhTsSDtSBeDuc96+pg7ScFe?=
 =?us-ascii?Q?+XMBqRbg7EGjnxuqPm/bmOFKXcSvsLskbVkdp2uMA+mxqEIP7VLh1D6OOCI/?=
 =?us-ascii?Q?8hn1dbWaezBRgtxYj67BffPPN/DPu3hZy5fsL6WnP4AM3oDy0vZVYiF/F683?=
 =?us-ascii?Q?AMR1pT0ciCzCNQOthFUQU/fklTWmNST6EpAxjjI8wc+t3LjCiLPyCocFjT7A?=
 =?us-ascii?Q?cuT1yT9FBO7Qpduz9g16zgyU1zb1z6H3/nkHA25wFnKfLKWnKesQb09Il8pj?=
 =?us-ascii?Q?BJ5NVjQwhgIz6itBVhf0Yx16C+iOXJtPpzcwRfINm9Ewbmwjk/jJAARyfqp2?=
 =?us-ascii?Q?NdWzQRggetW7cebJvl0/ZGB3OIQws5Sp5ohhvCQXi/biGAv8dAzIYfqkIn3P?=
 =?us-ascii?Q?c+o4CFQDJFiW/SrLTo/bclCyFPkZ7sd8rgH0N+WOd6xx5T+l+Cww9CVBZy0H?=
 =?us-ascii?Q?sSr1hiHE4GD1RD7PAubU2sX3zskTc0DLKKbY/Vwygpi6oflOrVShNxNS1HiD?=
 =?us-ascii?Q?Gh7MOTaW6/q4TOCCUTcgmZlcGYxpTFXWGz0z+XfHuLs9WHvqJsV4kElXcirs?=
 =?us-ascii?Q?ZT4SBVEIVcVjw/Do8SFfmx3WkszRvU1iOlPu4zg5iFEgrY6BgP5wQRSWPixu?=
 =?us-ascii?Q?QBcj2SfGyTF/ySOLpGGluLcKxfHP1d2ibp5osKo9OK9d5cHrBQFS7R8VGeiv?=
 =?us-ascii?Q?JrGd5yL5gfReB58CXcUkTHYnp0Ul5xaCYzJq8hPX0/IYOBB/SHZcwAZQzQLI?=
 =?us-ascii?Q?96FUdMrLkh4b3scukKtIJmRtAe8vi1SER7Yg4Zr2gVOMAJbQ1s50KTntpjy6?=
 =?us-ascii?Q?aZ0F94pfd+EfgqEWYn4s1SdHN6DMZib3gxPfF7KizcAN/48Mh4oPmD/nCe45?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc2eb1a-b2ff-47ba-704c-08ddbd1f8a74
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:28:52.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kn37smmOVxTb1eMMW5uWcsZ9iSTqnrQnmNXyf5zPJgH17SV6wkjdqJWsBAW/Wt8MLXT9meyh9wgL0FWvo5RKicDn4C0416pNR8WqlhiEGwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
X-Proofpoint-ORIG-GUID: fJBq-NI0OdBZBvSWHIWl4zmi_uLrFiyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAzNSBTYWx0ZWRfX39PsPX3jX308 o2/l4stc2pG/ZDyCOM5yEZUpnJwc+eNsnwOzy2bfBflJrmXqqMO+auXhQHP190Be/vUU0aYLerb lAnJ6UVY02dC/PuWi5fjNB6MwRieHa5+lwYymwIup4nzZPAt3xvbuoZZ/OnlBj7oh11PsGBtkRj
 K0vqUL94TY3eS73s4YgF2mQoLjNEzFYUK6oRvUMIe6R9fwxjfKwUhP5eYHwd2IQDBSwHpGL8ZfO RPS7/J4wb2vE4Ko4OrwAI7bDXpg3aCiWCeK1e2F5nIbXSU5VtGxOS5DFmLn65aIzxH2MIHOO3FT eiqN24hqdyVrUZ7x2+HVTyMusHM6mXmhHLicU2KNaHtFXZWTjRXOMDzxO/RZ5/kwSEGuXzgQiOl
 1O0TXV9msc+ZbSK3oFoBjD+SAH9r+Vi01DM2vJqB1iH7foDrthiwy9GlcVLoWCd57lFixsOQ
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=686b6929 cx=c_pps a=2YSX14ZrjOSyU1cAXfcFLw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=t7CeM3EgAAAA:8 a=EKA4iIvevUf9UMjeEasA:9 a=Vxmtnl_E_bksehYqCbjh:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fJBq-NI0OdBZBvSWHIWl4zmi_uLrFiyU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 06:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219975

From: Guocai He <guocai.he.cn@windriver.com>

For wayland, wayland-utils and wayland-protocals, not only
the SRC_URIs are updated, but also the tar.xz are no longer
available. We have replaced them with the tar.bz2 barballs.
---
 meta/recipes-graphics/wayland/wayland-protocols_1.45.bb | 4 ++--
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
 meta/recipes-graphics/wayland/wayland_1.23.1.bb         | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
index d98ccf964f..31b7de3a1f 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
                     file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4d2b2a9e3e099d017dc8107bf1c334d27bb87d9e4aff19a0c8d856d17cd41ef0"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/archive/${PV}/wayland-protocols-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "b73315c26d6c3374c19c2dff7e491f019d8597dc4dcd4473d9181f676f15f48f"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
index 59d414a0a6..8e4b92969c 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=548a66038a77415e1df51118625e832f \
                    "
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "d9278c22554586881802540751bcc42569262bf80cd9ac9b0fd12ff4bd09a9e4"
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] = "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7bb2da7d16335d18"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland-utils/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>.+)"
diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
index 3a5d91be04..1b29f7762e 100644
--- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
 
 DEPENDS = "expat libffi wayland-native"
 
-SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \
+SRC_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] = "864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81f441929a81e5ed"
+SRC_URI[sha256sum] = "4afcf2942a39d8276d06dcefc89dfaf029222994778fd4c49aa68a702ebf698f"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/wayland/wayland/-/tags"
 UPSTREAM_CHECK_REGEX = "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
-- 
2.34.1


