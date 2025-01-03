Return-Path: <bin.lan.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E79EE77188
	for <webhook@archiver.kernel.org>; Fri,  3 Jan 2025 06:32:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.25657.1735885970931332305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 22:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3098435690=bin.lan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036WfJW002651
	for <openembedded-core@lists.openembedded.org>; Fri, 3 Jan 2025 06:32:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43t6j0mwcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:32:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8Ear3PjA4Bs31sD9griXgprdTJQIuttRlRuzSN4wkSznyoNusUrVOWlVcyn2j+MQ8dKYotuR+UWf13wkwzweFR5KhoMoH71vek/XzPhtUFig7abAEpdzlUfb44Ql5VW7twqM+uTkjfa2yUDijdWw8XJ1qKrweymyrQeBrWNvQLRIcD1FtxOrbiA3XxBDzrsuk+yUw5tj9lGZpiKSlgmMXGjm+PtxQCqHd6mrYyOqfNuqwpkR1AB/1Lp2rk0od2f5bSCWWLsNrDIU4kb48tRt7ZWiy8UVTA9v+LgPsBziutBV0+oFMd951q+QCnl2Fmevz6PWxxv1UfhLkFDY4ny7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0XcuOSVRNipKP7aTRDWBjGbt8G4pON3a11OeNrubFAg=;
 b=KzCHXPeuTXllTU2sKTrEFlds6WNWfpaVCChv/8jTA9FC8/CctN06odcdw8dqloEP4dMoElt0yqv6xXHFRe7wadpOMsAP5rYz/kzV4IQZFWX/BLoHTHgpL1ea5O+QilhUUsI5zcfm1FuoSZHSvbWkFGC7OUeS4PIf85s6CiCZkNFaIdiOe57/1Yp0u1EnhfeS7iffT1+Yia/IAQutiDErstPf7YS83TLN4Mlz21rOAD3yRWKCt2kznxhnT9ytFZJsEH27foTWwlzkWg2v78GPcDLa4kYtL/dzqHv+kLWy+sjFYFCKToix5C9YHUmWGxy8Us8/xO4pZwm33fnqJLR7DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8701.namprd11.prod.outlook.com (2603:10b6:610:1c8::10)
 by MN2PR11MB4664.namprd11.prod.outlook.com (2603:10b6:208:26e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Fri, 3 Jan
 2025 06:32:41 +0000
Received: from CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0]) by CH3PR11MB8701.namprd11.prod.outlook.com
 ([fe80::5727:1867:fb60:69d0%4]) with mapi id 15.20.8293.000; Fri, 3 Jan 2025
 06:32:41 +0000
From: Bin Lan <bin.lan.cn@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] package_rpm: set clamp_mtime_to_source_date_epoch to 0
Date: Fri,  3 Jan 2025 14:32:24 +0800
Message-Id: <20250103063224.1988264-1-bin.lan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::20) To CH3PR11MB8701.namprd11.prod.outlook.com
 (2603:10b6:610:1c8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8701:EE_|MN2PR11MB4664:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e584fe4-8013-4e62-6c10-08dd2bc06c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vujJvxhZ4gda/Wumx/jJaISPJaWpO07PWZpd3Rp+Fw/6o0BINR3p1z90EMcx?=
 =?us-ascii?Q?sc3j1SB0uFRpvQbVgzwSW8bTHSyUofwNimZdxV1zQOzUTtDN0k6YUBj96u27?=
 =?us-ascii?Q?W2TScSyLhKmQDpoPu3Guir0GNvMbonZCSp+SIOcLFmyvjpiVCl3q3IM7GGOz?=
 =?us-ascii?Q?OuxwCh/3GvInXB9LaDtp3Dr9x7hhpyKkF/z5jN7TSw79leq3TNNifED8VRj+?=
 =?us-ascii?Q?SbC5hRkEYo6E3YuKcS6Dz1NRRH/EvnwqN6DAsXEj6EVT0LULjXVpDOHxiTyl?=
 =?us-ascii?Q?libAZm3AdjPGhmyYj1DErPKQzlrdm8IjgWlXGFzS/K+Zefggs+l77KT4OzKY?=
 =?us-ascii?Q?nvphl6CaPMAYEBvdLKTNytN7D28CW4v3Fsko/uRPxHp6sNZq0RENNcMr9mhD?=
 =?us-ascii?Q?Jh3tWZXMi3GFL7PZYzW26SBIIXyNriKH8VvF7J8Wi/fjCHd7A+2zi0HhUGKW?=
 =?us-ascii?Q?fr7K8i0orYoK5+MPQVeCLWxMYxohizUEq9nZyKSM+xmZ5deQZOQAwkL/x28Z?=
 =?us-ascii?Q?g1LN5v5FQH1TtZiLzrabKFGlM/eecsj6FjprJov9VJ4VbsmXWQg7berS/6cu?=
 =?us-ascii?Q?4HWccajKdXT1BsN00aj+8//FDCt5tR9XmnrtZcS/z+OOe1S6U/3HOz5MrR4t?=
 =?us-ascii?Q?JW+WoF9NBaYOUdDAQcAdtH5Rg69SEdCrK58Z/+8ouFDsktsCFv4CEQzkT45r?=
 =?us-ascii?Q?gGZiQEbuLaQ2Gg7ZXMmGfUF8Yu9FP/3SQ5kXYmbZuLSHxjgJPEhU+wYYDIPl?=
 =?us-ascii?Q?1KTZ8Rs9L/Pg/gnnqtKv34d8berBotjAQzocaFgkdQonmZOIWm+hwT0OIHWe?=
 =?us-ascii?Q?FcEcOziks0csClVWg6mVJubAIqkR/x58de0PL6diy5g8WEielXubWnGK5+lR?=
 =?us-ascii?Q?xT3V+KMH0y5lbE4G/Im+2aCDB64xJ5Zz9j0obhQvw3MnAPmuSOzceNAFpzDy?=
 =?us-ascii?Q?xmpcveUqzE9xBfHisQgXMR8c67BfhGP4SPX6AwzvNUMCmayD1ptXLoCjf0h/?=
 =?us-ascii?Q?8MlTgssJqTRMv8S1Wbg+FNSjUHJXhjp/U38+IOU7YtEKZMYhNYMG8U3IhlUl?=
 =?us-ascii?Q?zdIlX8v29w1WiSP6w3ek8Xfv58FUoUI9COY9fFoamOKSIP54rfarFcdwPU8Y?=
 =?us-ascii?Q?VupfGsuaEaDBdx40A3xmDqokTL2e8/upSAhFHU3VRDP4UyFflq1zTmIIIrIL?=
 =?us-ascii?Q?dHQZ8uzbHG71k/hXiE+UPMAtJky6MqyyQ9QqQ/0I9h1VXlM6+Fp3bTksjU4W?=
 =?us-ascii?Q?8Lr3fSA3EmIabKYC5Ti27eq0lKpPjXfXn5zTqmvg3iH+kgM8Rmr/lM5D7rAD?=
 =?us-ascii?Q?I1ee8ETAkjaWF0pTASoWmfgzXYJdK/DuUPf1xNrZAzZ4M2ZOki5eeQffsZwD?=
 =?us-ascii?Q?zRgtm9edlmZkpx589NmM2Gkj/xlU4Qr+O4SDlC8tc008J8FvwU81AqOpcrU6?=
 =?us-ascii?Q?XJAE4TUObiIaZTwlqza5pUh7hIkrzI5y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8701.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FwijsrsyU9hrBS0WC8S9V2gi9ik7fM94ZCfgNFivoiWO0OxlmOaE0wpGGeEF?=
 =?us-ascii?Q?wBEbYQ2hQoFEI5GFE7TlOZlVU1UudgiIUx0l0rc1TUFkI+XU+tG9no5gs++I?=
 =?us-ascii?Q?R/pC9cwrGiKnNbZwgmouSVsi7KTv9DsZlSHfm99BWm7WoYt+pvGVDvyKajYj?=
 =?us-ascii?Q?GqnLtGxQBmCheS2HtoATiX5+sfYx70CzyJhDKsOCnVenbsmX05eu0ZCdViI9?=
 =?us-ascii?Q?fWUwP2uYaYE05lQum9V9LkYBgCsS1Ske8KPwmaiGdRxteWkCYr8nDf1fgy3z?=
 =?us-ascii?Q?QCpwjy4zxMW2Q1dp8ccskBk9Yjt+xXaiJtlExFZ3imMStaYyR4iyGsWBB9r5?=
 =?us-ascii?Q?CjqYh7dhbHhB+odTFin1jT1uDeOI3oUSY6tfHMpCr/XJ/0RD7ZJLFzdonSTD?=
 =?us-ascii?Q?NwNebhSgNKNsMatC2qbhwl5UNntddptxU/G0T3QwmW7iDAhqE8cPxfcYqOWR?=
 =?us-ascii?Q?ZEjfzF7lsQAbeWNNV4Yt/rssjqg0cB8GLbLiY0Q98PwYnjohg7C8Glkoxtis?=
 =?us-ascii?Q?OxrXWcSVCikEoDX7ES65eVcJ9XhPQqH+jwwu+En5O6BiXtHVNpLelpeJJj+w?=
 =?us-ascii?Q?9tHe0V1RacNCQFIEchrKdSSeBs9VB/2kRju3yyRQs5UUCgGrltbGlLZVE/2V?=
 =?us-ascii?Q?q/cVNFNVRCR9vXYDlYClo5BbywPjTx8iIYbC8WfyVB01v+p4zI3znRnI5Yo4?=
 =?us-ascii?Q?x8ODaX4O0xr8OusvOyCTVAX10K/t4qaYuZmryGzbQnzKvdlnfhR7PDDT3HiE?=
 =?us-ascii?Q?Tv5M4U150Do2gxQ81BuI3luE94xgRrdtIhLp/iSRszq4Eqh5y7K9yuOc5fU7?=
 =?us-ascii?Q?5wbWKCVgtqNnIV61h3VJjGknyCBbEklr1x1WpW4QxxjsnCkI5rdtlP+e0fF9?=
 =?us-ascii?Q?bjHiHJ1rjG8PdfQSBjdEfiYA5+zSIGJS6S+34quPRjoGLypGmWfMgAMnqDDA?=
 =?us-ascii?Q?Ljpol8xOb6sJH41Mi8ReciQyPRlpHxfNzBgsrCzecmNG9JG0prJ4xPZ1JIIx?=
 =?us-ascii?Q?7BXrYLQZAr0gJVIWxbcKrF/M0iJ356ee1WEf0p9tWtFt3l90AJV8Li5Tqcoh?=
 =?us-ascii?Q?SyAn/uYLNvCoyb5Dcgif5UAaGVAD0T6Dslm8x1RXzAW4tnMaQAUPf4ZaNXgk?=
 =?us-ascii?Q?zWWdSUayDW8J7o+M29ZYcL5T/0Cos7zKinDjLERVv4VvGr51h6RLkt28OStV?=
 =?us-ascii?Q?VbsfWALhgO/vUIhOyXpItQ9DVgAr7YTEabieGFvza0Y6JG1gHFCUZy1Wq4oh?=
 =?us-ascii?Q?j8aHVlVY7fmcwWpyuOXtl96JxOvoTPxx38L6w4pQHFfV2cJHPIal5jEKS9cR?=
 =?us-ascii?Q?voJcTAHguaE7v6BlXNqfONM9C2XBrZXcXonhagaGuNldETlfpro6LAo+Jf5/?=
 =?us-ascii?Q?uvROIFGv/s3Znt3JzNoZN9Lbhgwrklytm4LrfBCov+YUOVLdaK0JBYPzq2cv?=
 =?us-ascii?Q?JaPIf/QbG6IveWsiyIOuWePGtGkM9MURCOsQoO4sCPTcnsGMtgBv3DR2+76M?=
 =?us-ascii?Q?kZ8GGrW8Sy0kO+f/1fjpZn/BYw7IQp8ahnaA0AAeHqmJl02/sAzhBDlSwqNC?=
 =?us-ascii?Q?mrVnWd8y8H6zPcE9YGjSaXbWV41zWjG5rvD9w8U5HvUGt0dYk813ifXQ1DP4?=
 =?us-ascii?Q?HA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e584fe4-8013-4e62-6c10-08dd2bc06c74
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8701.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 06:32:41.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cd/cjG4fkDmJ1klzcwxScGBesonyctRHE6YjnsN2ajq+BFfUQxTVVinCk3N1/gByHWoZL3ltf3OrNZ/NRCc2wDAKwlO0z0RgWk5PGseBJJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4664
X-Authority-Analysis: v=2.4 cv=V7KH0fni c=1 sm=1 tr=0 ts=67778491 cx=c_pps a=SXeWyiAXBtEG6vW+ku2Kqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=cFxEUADGMF_buo_b710A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ycW6GpkJai8LXFnqRASpAAV9sZ4PG0a9
X-Proofpoint-GUID: ycW6GpkJai8LXFnqRASpAAV9sZ4PG0a9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=497 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501030055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jan 2025 06:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209319

There is the following warning when the do_package_write_rpm task is executed
when bitbake linux-yocto:
  warning: %clamp_mtime_to_source_date_epoch is deprecated, please use %build_mtime_policy

This change sets clamp_mtime_to_source_date_epoch to 0 in do_package_rpm() to remove the warning.

Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
---
 meta/classes-global/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 3579d0d695..d7b57e301b 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -699,7 +699,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_smp_ncpus_max 4'"
     cmd = cmd + " --define '_source_payload %s'" % rpmbuild_compmode
     cmd = cmd + " --define '_binary_payload %s'" % rpmbuild_compmode
-    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 1'"
+    cmd = cmd + " --define 'clamp_mtime_to_source_date_epoch 0'"
     cmd = cmd + " --define 'use_source_date_epoch_as_buildtime 1'"
     cmd = cmd + " --define '_buildhost reproducible'"
     cmd = cmd + " --define '__font_provides %{nil}'"
-- 
2.34.1


