Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FB8C71157
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 03:01:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5906.1750302087546519873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 20:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82653190cd=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J2cb4R024007
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 20:01:27 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c872831a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 20:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+qQ7WQl+JBmftvy8j9GptoL8BdGFEOARwGdhYttvn5JZPhS1VZJh3lIUXuzFLs1DKDtfy7y/Ov/zx2+h44ZC7jixqxF2WHqa6MOrKF3aQ2+mqwXnXhDgOfDBU3fnYzCFmN6CbswwuDZnp7OfJ7/DFu9XnIQ6DHdDf9olW90w7ZS1gV7Qgdb+fRO0XZMOVQMjApxxGpH+8iGPrKsncINI4f2uW2N6RMWCICfpNbulrajV/pZCcVV3NR8kMBuiFgaT2VIRCAbhw8PpxXfU7Y40QUAbQ9kzA8SvaFKSElpfRuDdnZibEyDDW8rbTglrEeGzTlPVprFyG5f5X8wWsbSSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF66FYGPkPuN41aWnrRI6JEbG6Rq+eVq9VIioICREq8=;
 b=xk8CuL5NFdlTaZDF3GW9gaBARumzpercdperpqaEK1sIZFRwR9B/AJiCO3shmD2RVPb7AHHCXOGU0svATTyY8Trvj1B+ri8YnbYI09oeJ4oUlk+LDV7pWC5kAJ6Ui3VA2J9fhHOHaPKQR2opXB4IsH2WWEk+nIVojZpLOccZ1T86WDCBpzI+gOKKOf46Lb0EzcRvErztUm79OW8WG5ZDnvcZxAxounfCUN9GcLjLRhbp2jy/q4OHAz5WcLHrAQX7jDpRZPMdIwkHv6UGtML4S+eQugkynxIWcYADiJ9LFjMGIaC5OYltBHk45Xyityqs6BkRC2Tt6tXSI4Mu1/jtzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7050.namprd11.prod.outlook.com (2603:10b6:510:20d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 03:01:23 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 03:01:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH V2] coreutils: fix CVE-2025-5278
Date: Thu, 19 Jun 2025 11:01:05 +0800
Message-Id: <20250619030105.2301365-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KL1PR01CA0127.apcprd01.prod.exchangelabs.com
 (2603:1096:820:4::19) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7050:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b93ef62-33a6-4494-125d-08ddaedd92d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?AgkuGMJCin1V8UHcIzaONDrP6rJhXDBwgkVNeYlVzw4TMV/F3QeJxsF+2gnS?=
 =?us-ascii?Q?CNe7VGyPz0/Y7934NWkLEvl2RFFmYQhKjNwbkVXUBlQ+U44cqbNBMwZOpoC5?=
 =?us-ascii?Q?jwED+er7fpyeF9LAULYnoRYps5dvugffuy6dZi123SbVZdJ5x6DWzKXtbXdl?=
 =?us-ascii?Q?nTrV+pRYraxDyPjVH7wvZEVzqVAP/SIzW2wcZERQOj6hwxmROfY05FNsXXG0?=
 =?us-ascii?Q?y2bS9KGUCni8Y6Gao3Gp77sKlAtGouz0Cm+4U96fnZpngO8dp8Ywun62k+rV?=
 =?us-ascii?Q?TkPJQGEHxci9fE4tm5+6cKsCclalowI/2G5QRx54+E4T8C7GyTgh+W901mmE?=
 =?us-ascii?Q?BditgjQxKlmE7lmDbr6b4N+Jji9iexznIqOSdgdGomgbjnn7HbUIB2UKDKDk?=
 =?us-ascii?Q?VIyEGssEAyYgB+XhYPTM6K4qlQQJQv0ULnwDiMGJDSP8emYtaAmSso5DOYgt?=
 =?us-ascii?Q?K3BdaXi8OTGIZ4JR/4Oho+OEY/VWMQV7viNDDDpSl9YMMMTNvEpPFHu46htl?=
 =?us-ascii?Q?Atf1WBTZILtd9N//PPMvJjpD4fNZhMeJltxht0kxsDqWxVRgJZeQGKLKIRtn?=
 =?us-ascii?Q?gynHALkfWS6tBMrTeFR7Tu8iUm78Mq7JJe83ua/aOfJhwupI2Ds9BZSDdAsD?=
 =?us-ascii?Q?eW0jQDBuoQza1eJ38GxlYgPzEAFylgHnblPd3tBtP3TrnYFNVJaRpuqfTMyd?=
 =?us-ascii?Q?1bTWmIADWBlu28lnXUgEEaxZYfk7Ae2+SlueF+YzyKgS4DCxBvQ8cDnT2CtI?=
 =?us-ascii?Q?ykDRHZ5y+fLROGF0hI6opl+qQAYAvQeeOKOc57QjkoWeBK72QsTOY4Fhi8u2?=
 =?us-ascii?Q?5P4/SSh9F7rbmCyekgMLpOHezYCun3yB+21jjfmM0MsIZ+be/Wdm28mknhOl?=
 =?us-ascii?Q?Pn1rqZlMPJv6aRfEdoikaQVW/bg4z/+y6kAO853j0nmFYYAjFt3J2J3k1oU5?=
 =?us-ascii?Q?1XiyQ1329AjK603lPSjNMLpkkB+UC6vzh0dT2yBxCAYyx+GFqTAZ2R9Rphqa?=
 =?us-ascii?Q?Qt9VGOg5Sc2eLMXmH/O0R+3Lr2wyfM0QNgLuk+iIK3MyI8GUwJIvPD4M1Qfz?=
 =?us-ascii?Q?8T2qgUyy4oeJdP5pBecAKwHHmbsTxS49bm/qM5vCVjkQHOnzd6g9SBAQwkXb?=
 =?us-ascii?Q?0DVZ1D6ohcs5IybjpIhO3n1cSzEGoFKqsheho2l0/UXx5x/2PL/9GYCHGczs?=
 =?us-ascii?Q?V8Bml9p9chBmgdYlQoSGlJgCiobnFgKyLsn5FszEHXXfgV330vCUCq1WEbo8?=
 =?us-ascii?Q?AYVLl6Yi6xNLtlmEIbiKxt+HTJworRHNc+Xtz4kon65/pJqwk+e/dfeynwoF?=
 =?us-ascii?Q?YFIznbhwqrf0rOeM+EeVD8TKpozqv6ZsLJT4Q4HBnSq42qVgNdFxzRxsyZ9a?=
 =?us-ascii?Q?bNA1ffb+7pUw7qbBy+gBzEo2crxUi320+o9HwxQGAjhhNpD5Y8erCgsb+xEm?=
 =?us-ascii?Q?AdmRsHdNh1v7jDxrbJKoUVhIDfmBhCk1j50yO56GEvClTVs6SE89szBRTFXW?=
 =?us-ascii?Q?fIrM2WqvudrpupA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?F0Wq9SkKK5QuHr7DeHxi1DATW+Xye8HP5/wSkio98nZcHocjy3cSeSS92971?=
 =?us-ascii?Q?Bmb+QJuY44JnCAy4wZjyE0xW88fx8rE9spfhPbdTicou2mhQAr6wezAIRPiS?=
 =?us-ascii?Q?4TOlB1loRi6Zs61X4G1YTaHGPebgXUThap4Yc7jq95jk5BPuqAYYyCSNpGMw?=
 =?us-ascii?Q?O3O0pdkcoeUVaJHzXrXi8dnvSm4vuzMc7fWSKOQdgLRDyhuIywpEFN5eHnuy?=
 =?us-ascii?Q?S6KuTvEs811KYHH8pjizElxHRGtXD4I8cRewbpy55gN8QozYxL0JbFZVf0ah?=
 =?us-ascii?Q?2O3OkZZRuVhCFVDaWVoCh1Uk1Kl2bgXfGCwEE5Wn0TEUUEvYKz0Ea5Zqxlf0?=
 =?us-ascii?Q?HizV6rH1LwXpuG/l2ZZIVy8uxofFrHMTO5tZ7NrE3Xa8463lwatHBa5fZKl5?=
 =?us-ascii?Q?0YwC5xJlIYz8zbnN8kk37lGMktMZKZEJ4HZDR2VqBLXtK67/Uzw6jUbjva6O?=
 =?us-ascii?Q?F54UjhLUy13g40xvQYnmeuRSrx/RKzpgEQBvvo5iOTO4mRa/suzZM+fYUd2c?=
 =?us-ascii?Q?/jY0iblDCsFl/jJV6LmHwde8r9Y0UqNFQF2gX4y0AgeSjXzBcFla9FV8N1a3?=
 =?us-ascii?Q?9vXboXP6IawrkfUbH/LFnTq0JI0AVTGF1faXnseF77REo7mZXiJ4ZIX9pMQm?=
 =?us-ascii?Q?MMSxuPRGhbMhyV0eV7Fm59pCHwjBooLabst/F8e72bmOw2U19pbDjGYj+76t?=
 =?us-ascii?Q?jKmxaOmdCGyRV5C3THRBP+vD3g9EXh+Z3r+omKIngaLqDzZU5nbk9Pet3E4V?=
 =?us-ascii?Q?3ASrq0DXkk+SfHTrVP8M1Wl8qcLm5VcsNu6dhGSXLf3VOBJ/i333XwnzLOvG?=
 =?us-ascii?Q?okq3p5TUg9cWV62BvYF+MIrHtxpPZnZB4nnVMxcfsgairVjS5kFitQwIw/0i?=
 =?us-ascii?Q?nxmvMEUyeFos4LPejtlMiOvKONcnxA7JnTFFyx4LwjkGERpYH+V/ZrWfLNc8?=
 =?us-ascii?Q?tW8QLjLiitpA/ptWkmii+ZOrNQrr0ZzjNugOpEshnkoEkvMyHM9xN7GQx42z?=
 =?us-ascii?Q?or/RN/zyiE1sa3yXmZJABzG4i+Eb/2lUpS8DiflxCV0h3NbyxQ5omxORSafa?=
 =?us-ascii?Q?82Pm41FuI6r6hy40qTZF3+meM1Jnt8xme9l+0X6fvsNkZPHp8HQOWJlwHsUY?=
 =?us-ascii?Q?Bcw/zMPHO0cwWudHWpDta7Z98gNWHinA6vopJ+2YUZtS38dy7o3c1+RISfCj?=
 =?us-ascii?Q?IK6WOxayoWGggBXl6jluxRzFvAQAZuH09FnQUm9P1tWez8rr5SxdBgEd8ufy?=
 =?us-ascii?Q?MOLfKY8sQP/kPcsLiU3c5CnOu27OmJP+G+USv6M7CS2SsgJYbWOARu01myii?=
 =?us-ascii?Q?rkP04xi4ir0DKn2AS7exLMEW79mTmBec0LgcH7szFjMtOifeWVQfKp16s9pV?=
 =?us-ascii?Q?m87Uhq3WZLq8VEZtxoNofNjXhENt4QkOsQ1zhMAmZ5AQVj3eeEKI3aVaF8aX?=
 =?us-ascii?Q?pBb3xCcP/dh4Vd9DaQY68bj0XTNjyVjqAWVKdmj4OoJ/HG8uLEgTjhMtGYd5?=
 =?us-ascii?Q?yfcJe7hIFiZDJxqgciSQFoo/2bWV0nP0tu//n+vuejT1On5xDAmw7mf4qR8L?=
 =?us-ascii?Q?D2EWPBH9Clebsrg3wKEjcxf5IMcwTx5Iw6o9X5eS?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b93ef62-33a6-4494-125d-08ddaedd92d7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 03:01:23.3266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zT1HJQzN7yu5kezxz+NO4Uib+zyUvopaZQRDmMKT/s4mALoO7CPAnMQzGjR5rj9JvgmOElOE8iSrmP8lVcyMgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7050
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDAyNSBTYWx0ZWRfXwxDMT/Nu+CHA bohae3QzhfQJ8XS6Q6yPj1pa/2BZbpDSEeE1TECgUgJRx+C/sJOPvtwdoh2Xm2OXjvjjzqPnlmO FqoIz9knsbOISFDjNgYi95RsEqw4Oys1Oc6xqxMQkkSaNa+ESU0/ojgxKMIwrsNHt3u9tBfSqjx
 oUz44RdEQN0KYE7jD0hw1PdGULLHCvdsul1xwVm0uM4b4ktP/g017qzk3+UEQsuZswZVsS6QqjW gE1oDreGGNJhjq7XMsk4tb19z6Poq6dLfXf+K7OQQ7SFY4ZSz8eQlgjZ3KNVr3KYNs/6E/ujFEY AnhjuToH1Hf2johgRJSYg0f0cJ0pNNy3VksESKZgAvx1X8nAeJX17m+VvvyAXlUurGW+aWIxpKW
 dwA57fsaCX5LauK3ngldf7QEPBND3p8fp7AHqz0lz+kLUZ8+PMrgS2tYVok0RyXV4ieZVvI2
X-Proofpoint-GUID: N-hNqFa_8jb70VIJf__32etGocv7Cl8F
X-Proofpoint-ORIG-GUID: N-hNqFa_8jb70VIJf__32etGocv7Cl8F
X-Authority-Analysis: v=2.4 cv=RpXFLDmK c=1 sm=1 tr=0 ts=68537d86 cx=c_pps a=uYorgdaDNNJ2ET2hsYDthg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=rcHQxUATEmcyXpDv5zwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506190025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 03:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219046

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 112 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.4.bb  |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
new file mode 100644
index 0000000000..41be1635b5
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
@@ -0,0 +1,112 @@
+From 8763c305c29d0abb7e2be4695212b42917d054b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 20 May 2025 16:03:44 +0100
+Subject: [PATCH] sort: fix buffer under-read (CWE-127)
+
+* src/sort.c (begfield): Check pointer adjustment
+to avoid Out-of-range pointer offset (CWE-823).
+(limfield): Likewise.
+* tests/sort/sort-field-limit.sh: Add a new test,
+which triggers with ASAN or Valgrind.
+* tests/local.mk: Reference the new test.
+* NEWS: Mention bug fix introduced in v7.2 (2009).
+Fixes https://bugs.gnu.org/78507
+
+CVE: CVE-2025-5278
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sort.c                     | 12 ++++++++++--
+ tests/local.mk                 |  1 +
+ tests/sort/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+), 2 deletions(-)
+ create mode 100755 tests/sort/sort-field-limit.sh
+
+diff --git a/src/sort.c b/src/sort.c
+index b10183b6f..7af1a2512 100644
+--- a/src/sort.c
++++ b/src/sort.c
+@@ -1644,7 +1644,11 @@ begfield (struct line const *line, struct keyfield const *key)
+       ++ptr;
+ 
+   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
+-  ptr = MIN (lim, ptr + schar);
++  size_t remaining_bytes = lim - ptr;
++  if (schar < remaining_bytes)
++    ptr += schar;
++  else
++    ptr = lim;
+ 
+   return ptr;
+ }
+@@ -1746,7 +1750,11 @@ limfield (struct line const *line, struct keyfield const *key)
+           ++ptr;
+ 
+       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
+-      ptr = MIN (lim, ptr + echar);
++      size_t remaining_bytes = lim - ptr;
++      if (echar < remaining_bytes)
++        ptr += echar;
++      else
++        ptr = lim;
+     }
+ 
+   return ptr;
+diff --git a/tests/local.mk b/tests/local.mk
+index 4da6756ac..642d225fa 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -388,6 +388,7 @@ all_tests =					\
+   tests/sort/sort-debug-keys.sh			\
+   tests/sort/sort-debug-warn.sh			\
+   tests/sort/sort-discrim.sh			\
++  tests/sort/sort-field-limit.sh		\
+   tests/sort/sort-files0-from.pl		\
+   tests/sort/sort-float.sh			\
+   tests/sort/sort-h-thousands-sep.sh		\
+diff --git a/tests/sort/sort-field-limit.sh b/tests/sort/sort-field-limit.sh
+new file mode 100755
+index 000000000..52d8e1d17
+--- /dev/null
++++ b/tests/sort/sort-field-limit.sh
+@@ -0,0 +1,35 @@
++#!/bin/sh
++# From 7.2-9.7, this would trigger an out of bounds mem read
++
++# Copyright (C) 2025 Free Software Foundation, Inc.
++
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 3 of the License, or
++# (at your option) any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
++
++. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
++print_ver_ sort
++getlimits_
++
++# This issue triggers with valgrind or ASAN
++valgrind --error-exitcode=1 sort --version 2>/dev/null &&
++  VALGRIND='valgrind --error-exitcode=1'
++
++{ printf '%s\n' aa bb; } > in || framework_failure_
++
++_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index 62ecdea6ec..caed1f8c49 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://0001-posixtm-pacify-clang-18.patch \
            file://CVE-2024-0684.patch \
+           file://CVE-2025-5278.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
-- 
2.34.1


