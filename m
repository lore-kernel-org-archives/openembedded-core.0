Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18483C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 11:39:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.46358.1737027544309122829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 03:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311185faaa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G8SG48021560
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 03:39:04 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pn5f2-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 03:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wa1l99Wm3NRdMs9szDP3nW8eJspwNvd/08NpkrreBrR87k0NskeZyfgPmDIcNb9lOf31uhsjBiOvMA0bn/IX1r+s0fjyLPYGKkTIXy2Y1rVu9Xt9q6RqWkJUcQpM+JCTKTY0xBq3eeq6CEc+MGbSOBj0KI2/QjqvZZv2lFejqJJ4xLOXpJ4NY9wdqw+uLDG1NVJL64FUQhxPf6B+eR+73GS4YMzjldBVa0+Rbb8odHpr8W3ZeRt+oRQIAousS3xNUxl3ZB9RR+pMuk8jdjOs6OBnqMotBWlGxZnMTIwdm6cUkRdZwuAsKuVRr3vZ2pCUIUZWPUIDnt3XfSosmvZZZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfrNexBnwo3KfamhR1JYabxj7KFILkxK5u+5JWsNt/Y=;
 b=NPAoGZeMNJ6U4yMGnYYen+yOaRhx4eafQ13niiYXHRRgZusjRpoVkhOB/8PwgfmtAbW46iJBsxp5gHuGLnV7qojlgpb++qv5b5+QZzSGVgzXLysAspBCGPSAUeydrBfX3411qCyzFvO7DkxiaYAyZOApiNsrOfdec8Tv8n7DZjOsNY9vhZ4ZuaIiz9b9f7gQ5b8GguqmkItogp3Cn07+zzw6oDFV3clV98huobHT1Yoyjh3fHCrgYOUWykGrOY9J0VmcrGFHZmMVaEt4rm8RmLSPglCWlMcbSKfEOj5UzQLTm0X/M88j0oCCzrnPqLeE2CGXxLUtcrgrSuLReAkLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYXPR11MB8711.namprd11.prod.outlook.com (2603:10b6:930:d7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 11:39:02 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 11:39:02 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com
Subject: [PATCH 2/2] oeqa/sdk/context: fix for gtk3 test failure during do_testsdk
Date: Thu, 16 Jan 2025 03:38:43 -0800
Message-ID: <20250116113843.1817918-2-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116113843.1817918-1-Harish.Sadineni@windriver.com>
References: <20250116113843.1817918-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0210.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::35) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYXPR11MB8711:EE_
X-MS-Office365-Filtering-Correlation-Id: c871d10c-8b53-45b2-fb37-08dd36226023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uaWwBCWA++SGi8ejPF3HvTwD4r3VDEYmTKxgOpEfcfXuJFFHxah0JhK+3P0s?=
 =?us-ascii?Q?6B/UOmnfYoQIqkuvyEQctWLryynA+zNxuf4RJTLdwN+rr54CPugZZobVT7GT?=
 =?us-ascii?Q?NPPDXhslRvxzwcS8vftLbI0aywm6oGB4/NrVYnFTeQO8DngWnZ92IGn9OEXs?=
 =?us-ascii?Q?0igRpdPms9y7RFgnCc76CRUL0sQg3LfGOBT0WhBUcMJBHhgZdiSxG0pT3WpF?=
 =?us-ascii?Q?15bNjSOG1t2eOTJecm+kDfUw8TFxTL8N5TLzQLCghnmwQ1Z3lSqr4HazYILL?=
 =?us-ascii?Q?eNgiDPZk0RzuxTYmwWh2kq9yNzd0nBVDkaTizGobMwC61bPc/hssUxf56kQB?=
 =?us-ascii?Q?ugYKmdFRqqt2hxKxz8+Gmmc9hEQCjyxNGw0mPFXwXNCBDtg2GWXLzcwaKwLy?=
 =?us-ascii?Q?Yk9AnfxbGaeZpQY/XK5RZ6MKaPRVSqsDMFfEPE1eeGRxJbwlximNbUpSHUWp?=
 =?us-ascii?Q?AQpGCPz03RGa5vOwPpg21WwfGbZ5NxqwN+mYqB2oMR4qausXQJESehNQUINS?=
 =?us-ascii?Q?1C3Rb5aN0o42bUaJJh9e2RrzP3Whm6E4LwtnaL6BA4h8T427TkpU2KahFyUn?=
 =?us-ascii?Q?9WA+D7iREnRPIf4jiyukqHBYMAZrz5rT1+qhzYAr4gZFDkrcW4F4ljB3K9B8?=
 =?us-ascii?Q?6H9JKa6rRySRkZAN9iQdMiK9k1Ootih0Gxb7gpXq3tS5Qt1TJ2tdMlsQiwgE?=
 =?us-ascii?Q?e9DBQRlnbTzFG+la8tRTYEVRFKgksGFOyDCgbHkUeSr69ei+VFZypV4CaLZp?=
 =?us-ascii?Q?li2VWx71BvBhYLkV6eK/m4ktih/VCnR4iPeyj1jebkRlG8ecrZXShK5ENVPj?=
 =?us-ascii?Q?USNGxXIIGwuzsdj69tfhYh4RcOyiLgm/LJ20t1P+NGeshI6VrLoKGLmGqDaY?=
 =?us-ascii?Q?kTnkxw/tnWHiL9dKsKecLDa6XHB/svFRFDwqG1kQJYHI4nxsPZM8LRRnuFws?=
 =?us-ascii?Q?/PKy0cGbRMsnmNyOTeTlaWWPmWKmPd/yYbuRWcBpBsAGwEimPTSOSgzEix/Y?=
 =?us-ascii?Q?a+MwmWR4xa5ZrADdNRB/+BfAs5s1huLwZJJ144DFXogRgnNY2lhXC2/3abZL?=
 =?us-ascii?Q?FrPTXigJZf5vh4cWLBVXjieYSnhBld+wq4wQaNqFVLw2om/K/T9818jh22Is?=
 =?us-ascii?Q?sspp/arpNl+3OJ4j962yFviDYeU4Peac6JVt+SF+YST9eCStM1uJYuPFpaA5?=
 =?us-ascii?Q?qnPYbfmCzRuaLdFtsCgCFv3Ln4WZx0vlgV9SrcvT0HryigAu8PncKNvFrNT0?=
 =?us-ascii?Q?deO2dfqtkhe6VDqx5bQLWuEVCXezmqbBn8pFLOOz1Xv600Jke9AE0Ro17a9K?=
 =?us-ascii?Q?pnx7QuPxG0DGyTalN0vW0EM58qsJ3jXa/H7y4eG5yu5UBMNNuuObdF/EXGKY?=
 =?us-ascii?Q?LVKbTZqa3frIAdZhO4NDZzBcA9lCC5knwudLcchz11CPImFvvqxq8pngHytn?=
 =?us-ascii?Q?2WXrAv6/40O/OyCgLnifU5QNxiLgrFWV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PJlUH362/q/cN/4KJ7GTyXRsaeZHc2d4bE9z75tZe0gkaRG70MW5LTWvQ+IZ?=
 =?us-ascii?Q?dqotNGxwfnOaljMP1UmsWHaRKgsYZrjDIiM7YwtNsz7RAbWa5ih127AhJRe1?=
 =?us-ascii?Q?pwhlKZLjIhlB5NuObNYBb/+31gtQvkq9snNxclUcHSdxJE/sQGi/Xxi4+X+I?=
 =?us-ascii?Q?QV7SFNd5w42+qG6sFI2Si9UsqLB2StSWcj+8CY1UEj+2jw3xg3LQiilxyAvx?=
 =?us-ascii?Q?bCPqXSFVGxVM/se6Jm6zhMrz1buTunPFbsRW9QwsDSZbLrSp7+arF1vXF0Ci?=
 =?us-ascii?Q?pFwe/47FXU9gC36Dq7pu00BrOGa4F1b9bTRL/hZwJjqUzGjEzkMRvGWDPz+x?=
 =?us-ascii?Q?Q9uVC+iAKfbjctRKnLcQv7t7W0A6aA7SklcdaGxy/8UopildCMSyRLycqo39?=
 =?us-ascii?Q?3js68Luv83NosTk6jGHV1lMXlI37brdMwWfBjzEN/ISQ8uTPZ234OhQzI7l/?=
 =?us-ascii?Q?yw+JZPOXR2xIv1jPB5f+fyLY09lcGy75GcmEdOTrFalL3EIdfognvYB7KNoy?=
 =?us-ascii?Q?eFMlNV7VNzX/MkV5/GLzAMdbvPrMxD1MjmHixeFWMMB2G/QEvTTIHRF9dMtj?=
 =?us-ascii?Q?841NT2SdUW95ktzyBi9irKxcg9QLh/LrbQn5YFrFaoF0XI5836maIlYPD2RR?=
 =?us-ascii?Q?8vRvjfioEA6b8TGdowTmzNVlShin/FK3AQThHPipUKHcR9dpP8JQT1KY5QQE?=
 =?us-ascii?Q?pzZAiqox1ii+DdaeQmEyY9C17DMRUTffKhbuYbWxQy73e88pN/7Yz+2PhkTq?=
 =?us-ascii?Q?vCWwwbLYXf3iEvwHFDjPhsNIJ96zRubs6i0E16gRZPgCsqUMuBPCMOUwKFtx?=
 =?us-ascii?Q?NDSWejyaX5myiJLOp2vS/ZiM1ci3gNtAEbQR/WUCPKcENeeQtNVKlwomTvQN?=
 =?us-ascii?Q?TDmbV450ZQAWAsZRp6TPDMou/nzo5CIDdRV+WrTVb0gDz6fIQZGmT8WZ2fvC?=
 =?us-ascii?Q?xyUbL+RA7itcG2mJdCaZd3xY20VHyGnF19ObuqDee/2pIk8x6Yw/LRdyYAd8?=
 =?us-ascii?Q?FJ3UXz3AdAbEy5gw9UDocG3zW3PaIDWh++ZEB2G9r0qegWa+9HT57GHKSKd/?=
 =?us-ascii?Q?qaviTRdazkD0iNYZt1ueZG77GzW/cxjbnEz1d77mQLfMF8I4ioMUS+c4wp1w?=
 =?us-ascii?Q?hcoiUn5TVK6xjCOuFXvlQ+2ER+L1/NLHwjMWbOfdwcnPHS2CYgGteCIEh9pB?=
 =?us-ascii?Q?di+Dar1unEiUA7KQMocOpL2pGLoNLTo1xCK/Jh9GNb8j3vIN+aiJrpEGM2Nx?=
 =?us-ascii?Q?d0iIkXFkiFoK+UmjcWiPHUzgCdTK0zBDP1G/Q/Df0hRl+Vb8KZcdx98vLzS8?=
 =?us-ascii?Q?araztfBm9BK6+lBmPGyXq9AaH+ul2hA+XkPhll2kZgugjGnuzrVnSTiPdIdI?=
 =?us-ascii?Q?2bTxxQs4JrJb6h8mNij5HkMA+/1sHprliuKREyopyruMu1yyDqpGg7ibh3U+?=
 =?us-ascii?Q?BFgmEn/3+glkSr/Aqv6+lxsOAU5MTFXHUqJFra2NYYYy7XG013mRvKmKopni?=
 =?us-ascii?Q?/cUKNpJmPK64HdU+fGkZiLodQwMAHRhM/PqjWLPqq+6z2BMn1e8arYCOhmbv?=
 =?us-ascii?Q?+yHFG3+Xloa327iDUfJr33JwY3xEF6Q4FbY9RuECOnzjvF3fd+Ww9vHWH68b?=
 =?us-ascii?Q?JQ3zzPjm2K5aF3h7ZSrMyOg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c871d10c-8b53-45b2-fb37-08dd36226023
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 11:39:02.7135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gX/52ZFNaAGfO30SQVpVo0x5nIX8zvARFlN9f9HItXReEyHyobokG+hMuD1Ljw12+G+pQF4M8Hwo5ij1f/LmpJ0vki5iXp22llEsCUixnNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8711
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=6788efd7 cx=c_pps a=kSx+wkOqrR7DBdLtetN7AQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=XWm-v3C9gP5u2F3pDpUA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: D0-D43NWOyKSZ3zG52F0MZ3dtAe0NRCz
X-Proofpoint-ORIG-GUID: D0-D43NWOyKSZ3zG52F0MZ3dtAe0NRCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501160087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 11:39:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209943

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The do_testsdk for lib32-core-image-sato aborts with below error:
configure: error: Package requirements (gtk+-3.0) were not met:
No package 'gtk+-3.0' found
Consider adjusting the PKG_CONFIG_PATH environment variable if you installed software in a non-standard prefix.

This cuases due to an absolute path name in 'sdk_env', which is now stripped to have only the environment name.

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


