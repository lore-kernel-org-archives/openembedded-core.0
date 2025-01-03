Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7FF0E7718F
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 08:53:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26618.1735894426866268339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jan 2025 00:53:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3098435690=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5037QZhT020173
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 00:53:46 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43thqq4qk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 00:53:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aObJBoHlj+xSv9ccv6TotUI3DV3+AuA2UcFCjy9rDocWXSvTzfgBDk140EbNad5L5OEiUoLFMCrLcvBH2pKTmZbuNVeDd+vS00rRgzFFkdHDYbXwLRfsgoPFa6l8E50agytyouk/7695+lqeJwtJhqKPkKd44rOoWnhGZXOGy5N9typvjOVnhrY4OOWbNCPzntNHOyZY8RgG1e9y7OIh3ygYMd8KOyjjrisMsPyqrgeQQJVFHZkEqsX0J9wAFEEKtgwzjFUu40OJ1L14zxl4px++9gXIluGCEpa9PfW2Yno9aneBJIkb3fcWUeNbSx+Z7m48DVeVfSvH2N4R6eIhog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJ16Nwn370oJ4FZWF/4Butrxci7OTgN87p4QQ1B14IQ=;
 b=hTB27fOhtUYQDUZl7MfDDoC8yhxJrZmLrCu4+pNyAOp4hxeU1NaK/Yu29rzhu1/gszJklBbpII+B4O8Tb7uHm4JX3M7cXYJItC/t9HPInmbLHiXuL0lTIIOo/ZJgt9ruo1B73CfM0Pqm7lMunXBaRhBYnqjRapf+VKAFZhlgR8XJFHsezGjlSO/w0HCqTMDzjR33l+Hf+Jn5cnfFIk+wDHyhT+eERfESu/hJUyyr2Q5PLaXSaAeHMSeuuTHUGa8suVGEnK60yUaaOHNWYioldqWEkKWOpXt8B6SWgOOc0hh9/PL+/0TwvZQt1KcDuLo0jr3kXVHUwmhjA5w4N3IEgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by SN7PR11MB6603.namprd11.prod.outlook.com (2603:10b6:806:271::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.11; Fri, 3 Jan
 2025 08:53:39 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%4]) with mapi id 15.20.8293.000; Fri, 3 Jan 2025
 08:53:39 +0000
From: Bin Lan <bin.lan.cn@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] package_rpm: set a timestamp handling policy with the new macro %build_mtime_policy
Date: Fri,  3 Jan 2025 16:53:24 +0800
Message-Id: <20250103085324.3171320-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::16) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|SN7PR11MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 60a481d3-4848-45e3-aac7-08dd2bd41da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0WDcb+9+Jn61/3JruMCMqJQ/KinVjE9LwqFZTpQ6dNtUVqvbfjSfIPAlASiU?=
 =?us-ascii?Q?u0I1sex2eTRZ3Gp+K0QG8BPyOoRwowmS8m9y0OQ6zzu8e29g7GFXRdxlYh7O?=
 =?us-ascii?Q?DabZ7w9K7PAkrV3Bz4y/JBbqcFM1KGuj4XxfISyBNUwuoJwsNYEiumBOl07+?=
 =?us-ascii?Q?NndkuZa9T/zlmLtJ18QA6RU/wWpAUTfsRT+K4IgUk0IFytDtBfGKHcKs5xRv?=
 =?us-ascii?Q?fD/l1ue13aDAAc2qFK5faq9xWm8vOELUp4NSqOhYWspRJoxfl4sTP+GmBjlA?=
 =?us-ascii?Q?UnfNPIQ/sDZPsTXWBsqAwY5LUmRIvBBhwj9YFX+crm3Oqx2v35tnpDaN3fYH?=
 =?us-ascii?Q?/mYHcK27MwcA0Y3VSLCfwUzAfoQjJqqsarqrrGEmcmyqcc+Kc1hiVUFtVcW6?=
 =?us-ascii?Q?fEksaj9Atgci2+vW4GsjjcuUIx0XM/oPPYGssITi5nPZBpjtDJ5lvT3YinpF?=
 =?us-ascii?Q?0QdfQR1zw+0pg//jwRd9iPjTTHZs8Ed68/oiAGvJBHG1wIDgficXbKLGlpBl?=
 =?us-ascii?Q?LVLVekFn6wENzy7Dru16YrfFf2n+ELJcECAi0W5QMZ0DLjqqsqdemUrYr72l?=
 =?us-ascii?Q?vkXLsfe1vp4me1SMEExbh7CJkoBAkYAz2dOoOSRCMr1fri6AK2O4uD7SOTDc?=
 =?us-ascii?Q?Q2TuABUdNsaK73TcrUwHOjksgAMREx43eoLEKBFA1kZUyZ6G2J8xq276JNCR?=
 =?us-ascii?Q?yTMwnGsuAODwKVyWKyzzZBcbhPcqGzCGyWemogfc6phsYODxX4ps0mZbGYaA?=
 =?us-ascii?Q?abtlZSuFYhTG9C2d5tJXRJtPc/P9obws6d8o1Z+q97c083BuNZAJ/0xr+UKt?=
 =?us-ascii?Q?bODO90pSCD9NZ8hR/f3zho0mY8aPSMWZbl4dcxbuF5VTaCWF8mjInyaAUvFw?=
 =?us-ascii?Q?EKK9dqZpspaJtZIbJiV3wnVXv4z128r0VaQfmVqVICcKidosJUPr1WXM9AbA?=
 =?us-ascii?Q?D8Y0nSczzcw8ourcsGbDc7EMx1lHLD21UgGQJRmbwP+3G8Lvljr8zp0Z+UC1?=
 =?us-ascii?Q?bj8ic5j+8RdvVEOnKbsniaX6IykFc+psQBWnDFkTwnVWGUoXpzOpNqBrFs4/?=
 =?us-ascii?Q?jn2PMvOixYK5+6TdE0Ru7upulcxRN6HDYfyuGLSt/r3ylJF7C5dn+c5Lb680?=
 =?us-ascii?Q?m66N6E+v3GIEkvcSpwXRnol3LQyMBEYCUqk+mzDlfESbYe6gl2O0geEtQr8N?=
 =?us-ascii?Q?tGqkXRdUHaGX/vchiW15H379nUDHe9AeJdz3767KeEnitXRF3ulnPlI4sve3?=
 =?us-ascii?Q?IZT06aw9LT2ZGQHC0SQGNyExm/G4PkauaczrlMkxCaKwdurh5pnUrwvGDzEb?=
 =?us-ascii?Q?OVlD3u28TLv6OHwiDD8pPby6hGgPGTFxAfu6ASpNzm4bl8o9De9Gc8yIu0GJ?=
 =?us-ascii?Q?WXUpErgWxh4UPGl+is7IZDR6q+Ntsm6SCRBM/+3eeOeSJ7pyhCt7SHpdm6BH?=
 =?us-ascii?Q?JLIoX+5EOAfwA/VHEioG8LidIvkNX5b0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D1Lx1IVwVoWZU2MzMBXTehh3TucAXV2y9k/QF8J6rlKk0Ft6Z+MjpzeBVwOm?=
 =?us-ascii?Q?qKPiNrucoPwSBDZu+s9RxbQJAcCtEHtIjuhge9mjjt01ZW+a4qDHfCAjK5gh?=
 =?us-ascii?Q?KcgE90b1RW0ykXA1/l775bcATLJIZeNM+kRLc3bm4yc4Ha1xqJ3wDYbmRGHx?=
 =?us-ascii?Q?DO/h5nJpajjV+6UyFDMIp+LyEzHB+7GpZOlpj3F9RKNbtD9l8D6h7uchI+2v?=
 =?us-ascii?Q?Ov5BuYE/VNc61TsmLfnZHoJlQSb4rTHnm3+D+HlYi3HdROxnw9wtrqVVzxNU?=
 =?us-ascii?Q?5RCOZXaAAZQBgUHyRYiwK6eod/Tv06fwxmagYZWGEFeVT2JWRPkzDLPtgDmH?=
 =?us-ascii?Q?rmosKFogpp7+XcsZ8RG7WaiakpE74bGFNMrQBC36NtruKb9EX090cdLyj0uH?=
 =?us-ascii?Q?0PF3qTKFpPG4/XTJL46f7A6cFhNLVlFmHd5KR5Ck7IyVPj0gjMKo1MHoIWEr?=
 =?us-ascii?Q?cU6WXzXAPyQPT+JCOpQqkc75pf/d+YG/gR1gTso41bajA9AXcXiyICHaJR3G?=
 =?us-ascii?Q?6nEdVRv1fxGOJXNFpamm7XIJCLmfbj9pUykorSg6cQcjo8CxqhGzumPs+18q?=
 =?us-ascii?Q?l9N/enrO6XyeRoh4TSsCmunJS9Pd4LglPzwqEM3t5alKIkxNGf+uFqLkKbDG?=
 =?us-ascii?Q?WjNSoGxUft2ZoorTBMiX7m2KnNitjDjKZHy/vSyLYTNPjb/Is5kkOQoCFj5C?=
 =?us-ascii?Q?KZ7KRqTLTMbtjhPAdMNbHyeYfxNcMV6a0mairq1V6nM/1uPZu4/izAHY9WvU?=
 =?us-ascii?Q?ktpH5Tn105aAKuaQgRB7VkBBsNxVFcZFqcOl3eHOxlYyyQ3Bz7WIWTIptdz9?=
 =?us-ascii?Q?zg189GsQ6k8sb8gamS+5uwTTn0m+dz1E7+5ZS8kQORty58toXDVqQdL5oa2+?=
 =?us-ascii?Q?sexeDrRY+gVgs0+BcPtb8zEKh0HCwvcMwh/4TU7NfYBaeFbH68Ece+LgqiWj?=
 =?us-ascii?Q?CRUASNEeXgZRWdYb3MiT0ijXfTHpasXzKPUsCH0ZCz6uMxHFmNlevh7uRF1s?=
 =?us-ascii?Q?p/ohEDgeOqvCi6FYAdJ5Rrj+z/VkubBJoWI8E07nMAHDrzIoVLrB1cljh7eQ?=
 =?us-ascii?Q?F7V/Vq03N2urtZ4/wcSOD+clEbWh41mAFTRj7G1h63s1iYUyRXxzfntd3eJV?=
 =?us-ascii?Q?A8RblDfoB9bZ6eW41ONi+RCOQjW6GEuO9KxYIIiR6c2UyRm0+NpYAxcYuDNS?=
 =?us-ascii?Q?j2aGCEhSt58M9RPHCqu8Ix0wryPnnz0Te69uCSuSPcuDG+PLH43RgGmRI3kj?=
 =?us-ascii?Q?3YsVC0torqMOUfRaNgG6V+UFGvymhHyULisWwkWBB6ksnWtWb1WN6hIAAiwk?=
 =?us-ascii?Q?8uBMHc7WOsll6KZZQ/TCXrcZtjmYsURxlYETOY8EVK9QpszEzcMysLHBucsh?=
 =?us-ascii?Q?NzCuQ2D0L+dDiCZxzUXMewTVKpjcyAWCyx/d6+1mrFconvXUDgZJZ58yMQgP?=
 =?us-ascii?Q?1a7qyEZrbc8U5nzV60NdMvt1bZPuHpT/cSgqcXHT9GUOKB7IsBNPDEE8xGg4?=
 =?us-ascii?Q?lSTKd8/gDfgDGRL3IJWX+hwQLD1pa1jJx1PUSc1faftQ9EnRLAcZIxWJO5k9?=
 =?us-ascii?Q?5R2yRrm4G6Px1fFCsdK5CE50smjwo4z8JVqttDZDwVuu5nFSRHbkwoNBGk4x?=
 =?us-ascii?Q?Aw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60a481d3-4848-45e3-aac7-08dd2bd41da8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:53:39.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EpYnZUSaJGM1FebeI11+l1pJwPRgySHG1HSLsZPjpQFNImOCuofbRksw1loZZ9z62puB3Y5mU3DU/2rnQUB+xocnLLL4j7VMsYk9vXM9jv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6603
X-Authority-Analysis: v=2.4 cv=RoI/LDmK c=1 sm=1 tr=0 ts=6777a59a cx=c_pps a=hHPfuxNGWHHq0fQgDGst2w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=SmRunaB5Z5MXHyxKQDUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: OTidsUaHpiiDoyROK2k1Xmw88Lwi1kJd
X-Proofpoint-ORIG-GUID: OTidsUaHpiiDoyROK2k1Xmw88Lwi1kJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=805 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501030077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 08:53:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209326

There is the following warning when the do_package_write_rpm task is executed
when bitbake linux-yocto:
  warning: %clamp_mtime_to_source_date_epoch is deprecated, please use %build_mtime_policy

After RPM is upgraded to 4.20.0, the %clamp_mtime_to_source_date_epoch macro is
now deprecated in favor of %build_mtime_policy set to clamp_to_source_date_epoch.

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 3579d0d695..f383ed140e 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -699,7 +699,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_smp_ncpus_max 4'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
-    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
+    cmd = cmd + " --define 'build_mtime_policy clamp_to_source_date_epoch'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-- 
2.34.1


