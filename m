Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3BCDC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:49:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13942.1737647380528091436
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 07:49:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=31187efd39=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N9vhQd026689
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:39 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44aqfw1upc-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5Wk6HRQ4bfynR/fv5QBWs0gxEW9PxMSOBXVqraJS+A7VIwSRswSOpKR4Tn3KQj8oosWhIBrXDAWCR1Y2+iCVlj+6xtNEiLfFIBw8JcMWOiipcMAf1wMSX8rcji6R7hP71fvSmTNBG7LFFkwLKPng5AnM0bE19rtED7+0BbgkfiXgzIHsumxqE5Mbxtqbcg9quEjhR60UhPupza9lA6I+0AUqz55MmMOiKBbr8RGznDzbFkwVgDdDuNDAjKOMFLUsXj8vjblqD4yBNaDUD6l0lg8o2fkSqMWhTO/JY/9Dm6M48e/lovgJGoZA7rrxzfg8oVo9WVZvqTpuo2XaS8+hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jqkh//Sqd5j3nIuKPUtSppQpWFOorXmHFcywnT+PQE=;
 b=h6pzX6maeOEwwZMZjsXteBeeprnLWulvuRJ+415vSMLtCGlmnwOGXh/ed1pb/mP8OXYdT41i3FZuaQ+53GRQWPtdlTKlRFAmILTg3g8iOvqtTbpAz+/DaDruvWIG2sw100j1hMZBMd7SX8GHYrwHQ07EeVZELmSqAC3yNPgKHifldruhDdnCvtN9sjDlidNrcsAajLC55F+Blq3sEL/9OlmLH5ty2TSqNxv80JCZ+VPe8L01nLyOF8YSJVcREcJ/7Ir56QxYFF2Lb9uD1uwR82qra7eS5jfjnw1d/SaX0DnXNSSOg/pUzeWCklaY+QYD7YEsEa+HQfnixAIjZNPXZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB5255.namprd11.prod.outlook.com (2603:10b6:208:31a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Thu, 23 Jan
 2025 15:49:37 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8356.020; Thu, 23 Jan 2025
 15:49:37 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH V3 3/3] oeqa/sdk/context: fix for gtk3 test failure during do_testsdk
Date: Thu, 23 Jan 2025 07:47:55 -0800
Message-ID: <20250123154755.3579988-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123154755.3579988-1-Harish.Sadineni@windriver.com>
References: <20250123154755.3579988-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB5255:EE_
X-MS-Office365-Filtering-Correlation-Id: 961749b5-acea-46fc-6db8-08dd3bc58a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?by6Ph4HGTJFEbQJxNiEzABXcNthiAQpMmbGvg/e8i7kBufKSiKMD7sqxLjlA?=
 =?us-ascii?Q?Kp1eNbH69f3SAeAHk0v7PSSfHvRSa0m6C/GikKAkgAt+3H59Z/ud8ScUWat4?=
 =?us-ascii?Q?bCv7zMZ1HTtZzWWzUQ65NZqdoPfWIliXoZ7MCfmH6IkZ359SSUTRQRPbWQwS?=
 =?us-ascii?Q?SpO3zatSCXBrJ0FrN6jmgjtFdvEqqLE2PB5b+yB69D8+23iMKBhLY6F5KBa0?=
 =?us-ascii?Q?ZjnLpTS5RRPiJomcOhWNO7lKGhvOwlkQy7J4oAiBFGjKXKzrh8fHNTL29iX9?=
 =?us-ascii?Q?HgcgLhB9chB/34+Q88ZV1v3m8QxmyzFAdzx94CyHDh8y2SCyyO+rQ12tleX5?=
 =?us-ascii?Q?QyHjVJM6mIVwJJj+Jc/mfA/VGQPhqKnuuwHigrlykRaHkYOQ3MRQwSb5CeVa?=
 =?us-ascii?Q?8FFWoEM4h7gFhN/IvSQTJjezkPENpH3rNp0vmUqxIwNGWOAIA2LkKKXnnjbq?=
 =?us-ascii?Q?VQsiHqzCTVKsD2jB7HkkA3FLADGQYtwawi3EaxcTq+Av4fBj6Rk1QWOPBBsX?=
 =?us-ascii?Q?qG7i/Dh76vCHlNmg/bG4SWYhLQlCOD5LrnOGol9Y4JYL6Acu77j3NzmvcK73?=
 =?us-ascii?Q?fXiqCPhGH10yJ3fF7DPdPEemgtLtPgj65WmmGAxq4SgaJ6AxjO8n0yubdvZP?=
 =?us-ascii?Q?noly3hqJUEJke+NU1VTzO3GhO+5cG0sfnN+59SxjiSSw37PjlEqYgH12YXfY?=
 =?us-ascii?Q?quPeRD+VjhSNo2M+OlVjzINlK1gm+NNuIjnBZyZCiBJSok/fMMYX/O/NfMdC?=
 =?us-ascii?Q?CkMl5A9mf5G9MldQJBZYjIpfVDdNyrSZgav8O4b+9pSk8YR80E81Yy249Fgz?=
 =?us-ascii?Q?8tPHz8frkqAQY0jCIUdv5CcjyQYSbmwtS2Hm7vcOW8NiDRUw8T5x7SaeNx7e?=
 =?us-ascii?Q?yKBFHQZRZdFEL40x6/LPhVI0++DjpCSni9wecoaKKWtnr4WgTIPy9rm2qDmy?=
 =?us-ascii?Q?Mtm93l0uWa6ujhorbIL53xllJpy4xrl34unDt53kB59+1cdGw7R9CORdKDBp?=
 =?us-ascii?Q?LhjAauZr1Ghx4kq25HekIK+rvYBhbiFzabXpW766R96G5XlePEPC6xODcDnI?=
 =?us-ascii?Q?f0Uh3zDHd2vr0QLL4Tkdq4NkRWNF1INt2AyOb0zKo1Q9oY/pBg7sMI2Nv4WY?=
 =?us-ascii?Q?FhXdWPvD3PpUDxY1WvT7F1eR26dD8OuZ3mK9rkP1Ny1gyi8FOGv/EERAH6gH?=
 =?us-ascii?Q?4NWeO3f4qorWbU8aS8YAVIkg4M0A8KaSpNEfjoJ0kFZKVTQntg75+4NabuZk?=
 =?us-ascii?Q?aKfIQMA75GmMz+uuFpuTp6kE7eToOy78RAWGRLXdFOaOygAEP5sccUEHGsIT?=
 =?us-ascii?Q?zzxC0bbqE9lcYmuSfVA/hmRhzdpne56KpLw49DJl39fMATrd362DzcjCDhTy?=
 =?us-ascii?Q?TiayfWSQOEo2bmb8hyTLfCP0UMnfj6hdtBVUyoLU3/XoDQMNztfDw/nyvj7G?=
 =?us-ascii?Q?gJIYQAzPMPCMWzSZeSNjHVPztJAT28of?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?69KRCd4hvb7srEe6L2jgjE9kHSszLf2ycRu5B/a4U/qmFLNKp8hhBAUWPWjc?=
 =?us-ascii?Q?Vy0tkTPquJVBs8JCTp3ZpFpuf53yvNlg4Qf0T/R6m9AnsbYzQYvHrJsfsx0U?=
 =?us-ascii?Q?EVDQfgTEusks2ws8OndPdCO8nQCI36zY+QctdVpYoxBcAEdot2qs03d4fY5K?=
 =?us-ascii?Q?bBvlKuDM3no+iamBY9B129gtOGk7xekGRgETi7EKjuleGa/0n6BbuvDOtJe+?=
 =?us-ascii?Q?KYbjBDYkdcJmxy5lREm3sKbhcklHB/AfDZ6O739LJbH+ws0RxQiR+97L49Uh?=
 =?us-ascii?Q?rjGMDPLPcovGp75mz8x0iErm95zKtungEUvbCdKjBfM6/2BiP5jR98rWiXkC?=
 =?us-ascii?Q?1hMfMiTG+yejrjWxvOl/z/DqCIRl74d4d8n52WH+h5AvFXJJvCeN3cgGJzuO?=
 =?us-ascii?Q?mck2Gfk/MB0rG1lcadgbirycdL4SWRFdHIVCJurQPq0QUwSc1cPKNY5gVgKc?=
 =?us-ascii?Q?iUXeYufKmNjIxSqA1Da3JVLXf+1XtRZAsm1NpTsxkblR+/zIqQ3OV6v4CLmV?=
 =?us-ascii?Q?mgOeDZTbns36OC8mymP2uEI8uP9cFgBGjmhiVzlLDQVKe+O08TduoGGKpglm?=
 =?us-ascii?Q?0OXcp6QYwt8ZNKSBb2Dp1ITI+UafX1I8lHiuoRA3TTUsJ8MTil6I3l0kMima?=
 =?us-ascii?Q?p1RgOyiUZ/oA/vYBjZ5tCvdF4JDlDCLGQELf9vXP0S2rvCPsg7Wc6F9nLa7a?=
 =?us-ascii?Q?mhZ4RRPC03oM/g3iftlDPejtEemDvn8cKNBCnH7wH8YhlmbxE0xhXWA7N8OY?=
 =?us-ascii?Q?8ZG+BlZwoE4V13+6zuW0mDiO3qt6f0792zf0QVI9Yv89PZ7/jsfbhS55xsc2?=
 =?us-ascii?Q?pW1EBhurNb+sLQ9f78maSTntjE7laGa5CvaGP3sTdDqqKmOmlHuBMDCyu/A6?=
 =?us-ascii?Q?UyWC9Ng7vLI8GPOmtMCWwAYXDghsb/Ud2sTKdwdhRl3JuSELGhsCC0kqKNqR?=
 =?us-ascii?Q?PvRHmQgOO8GdZjeZV3FLfb1ZgrP4zwMUmxKLJLlZfxU9MqhmQ7NCV4Bn4DqY?=
 =?us-ascii?Q?qwUEPIUuP3lHnDl6f/DlmMxQ9duSQ7LyaD1ViKtpYDgN5zgZgnHaFYQUfB/k?=
 =?us-ascii?Q?KVDlQqlYEF7WJH2yg4TvVSvqqaFKpjxrLiLf5JFApGb6/KOSZsbpBa97HXRQ?=
 =?us-ascii?Q?d16lG/lNuy1CdBBMh3bwJaQhVvG0ulwcEOm3DwQhl9LFW+PXvTaT7Gqv0N+d?=
 =?us-ascii?Q?/sjFPXlhukD2aYTVpd3cK9EE4zey+MeEDhsYAJrf5ccJEdPGl95HlfZh6OlH?=
 =?us-ascii?Q?l1abJpFUvx044TtnWNxmmzKU5Hyt/SFmkvIdZVBIc3XllDCsdYz30DySSFPA?=
 =?us-ascii?Q?AJMtMD5rK+4WRdi8Z6vQF20udwIhARBptezcADiUEAmACZuAgVbZw7Hl8PPo?=
 =?us-ascii?Q?z+MBfCc6AmDhprWOa9bjF3gwcvDLyIP9gv3ARqmvCsuWROjkRQ03My3eoZv8?=
 =?us-ascii?Q?SOE4+a+73zV+/mmUc5x3Sq9COmHIw1cW2GiCitfvjEpeaQF+7mFH+utdmafv?=
 =?us-ascii?Q?t1pxHY+EQMIeHvgU/ti/l41l1+q21qFeWHWOkCC3BwBPLWQTluJmsC8+I4rV?=
 =?us-ascii?Q?c7s42L9uWjMewi8Vr/6e0GwsbZ/g+ZlMCKyv5mFa/IYPI251XyiYAAbcRcfZ?=
 =?us-ascii?Q?zBz62m9BqVbiok02Epf6L/Q=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 961749b5-acea-46fc-6db8-08dd3bc58a23
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 15:49:37.0412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vZx9cWUPKvl22Y6eeH8Lty1VmYn71RuJJWpMz8dWEdB7Iq9mXheSMfq2uyMLdmPLkuBJkA2xtHzQX8EanT2StpWbMIa0xEAtyIe/E1gA9/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255
X-Authority-Analysis: v=2.4 cv=b/xI4sGx c=1 sm=1 tr=0 ts=67926513 cx=c_pps a=VzeH2YOhhDlPZ0WtbyP6yA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=6Vxr1PFL7nVDcE-punIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 0FcaIJJOZI2ufrZKJo1HBBbZwUbqaGYg
X-Proofpoint-ORIG-GUID: 0FcaIJJOZI2ufrZKJo1HBBbZwUbqaGYg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_06,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501230117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 15:49:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210198

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The do_testsdk for lib32-core-image-sato aborts with below error:
configure: error: Package requirements (gtk+-3.0) were not met:
No package 'gtk+-3.0' found
Consider adjusting the PKG_CONFIG_PATH environment variable if you installed software in a non-standard prefix.

This causes due to an absolute path name in 'sdk_env', which is now stripped to have only the environment name.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/lib/oeqa/sdk/context.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 01c38c24e6..77e6a98f39 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -41,11 +41,13 @@ class OESDKTestContext(OETestContext):
 
     def hasTargetPackage(self, pkg, multilib=False, regex=False):
         if multilib:
-            # match multilib according to sdk_env
-            mls = self.td.get('MULTILIB_VARIANTS', '').split()
-            for ml in mls:
-                if ('ml'+ml) in self.sdk_env:
-                    pkg = ml + '-' + pkg
+            stripped_sdk_env = os.path.basename(self.sdk_env)
+            if stripped_sdk_env.startswith('environment-setup-'):
+                # match multilib according to sdk_env
+                mls = self.td.get('MULTILIB_VARIANTS', '').split()
+                for ml in mls:
+                    if ('ml'+ml) in stripped_sdk_env:
+                        pkg = ml + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg, regex=regex)
 
 class OESDKTestContextExecutor(OETestContextExecutor):
-- 
2.43.0


