Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8750C71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9247.1749722242088031295
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3Yba6027382
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:21 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd95bnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:20 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GaMo3hfVWYuobd5ftBC+5qMEMclY+MfKiF9qu21cZIErSJn2OIse5gpSRxQZTCAxCLaaV5nZpWVZphxTmdNOkoJluAG3RcNDxuyw9WBqVFGoJSj2uXZUO2mKRxT09G7A86zNtu4RQ+/dbub4JHrshUO8Qat3qWhHhWEOiXTg/OS1t9VwLBCN64wKhjTyoypMhVPBjKOkP6KnzwKCsgU1ryDb9i/GIQGz9DbBH54JNj8qZxBaZPtw+EMlOJvePXuRhhBeeZY3ke+F5T/uA2j6lxVIjsWbL1VW6d/DhmUqf2pilLll8evPokoMB5FaaI1Vz1hWxqyEUTdhXINfQ9Jdpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCv61G1SZ7xdpXQnP4cG+SdnI7pJv09C3Rf2iaNyQsE=;
 b=ms9groryzBXG7AiVVzbvif6/8muSLbZKjLGoLO50VUXiTDXXH3mdYeGDiYszApf7O15/Jpsdb0hmqEI86eIozh2r+LN7YhprkaP6uiq7QJVl3yzwnjgxf6vNpn4VvxbiutLVHdL5Nwf4sDXmKjqQlJtkQb2pjCxS9w6iUEPraGUQH+z9xgpIlgPJzNgwecKgKWv/Zf26F3KBsDag4w8vBj2haCWwNEjunmMX1oZKbAX1PbTME5fE5paWaJ9wkZ+ZqqVWvKMH1gHmPPWvAuBHaQAOHnjILBUy9qC/ssQI7dvU5rBwA8qSx/oFWRrQCKrcErR9j9gkIQLOLWK+SzyoVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:19 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:18 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 2/8] nptl: Update comments and indentation for new condvar implementation
Date: Thu, 12 Jun 2025 02:56:33 -0700
Message-ID: <20250612095639.3630518-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: c858aa9c-c376-482d-b3fa-08dda99784a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VLaC1Ttm2uRWndFhWv8UYxMzFgWhUMDCa2JOmemNICQnRU895G46UjrAqbQx?=
 =?us-ascii?Q?bTphJR5v/Ze2Cfoz45e/YPHid48Tub8WOKROlkEVf3wX9XobHsEGm15AXtJW?=
 =?us-ascii?Q?fn6gl8cyInCz/qIOoPL1p74g0Plkxi7e0MIZTbFUVaDZ62FeV2epnHXEQKM7?=
 =?us-ascii?Q?3bLWiRR3+gg1+GEkmt7GLRa7X2BSv0ctM5YvBySyOKbJZxjwrvF7oG5tIQJ3?=
 =?us-ascii?Q?uPdHKqTJy2SM8UYtumFXNLldgnTbBcdhLrQgUPqDMtvVhSlWLV5coL/nTou6?=
 =?us-ascii?Q?h2jh9VJ7dZsnSyPWafD+Ws/imLQQ+Mj/+v2n0qRkmvnQRWn6VwJAkaB1k/lX?=
 =?us-ascii?Q?HSq9pE8rXQ5QC3Dt7cobJrSnUN6KpuAlynnM2c7cX1/aW8ZI0ZUvv2lKscOS?=
 =?us-ascii?Q?VQQq91teUUG+XHLDRsJpXP8v1F7w+23+rzN5nGA7d686iZ7MviJo9K6VvwsY?=
 =?us-ascii?Q?TFimEYhHF/vajvb3Td8kcFJVB+Q7kwEjfEj1WGPZYp2h16CPsW094JwL527a?=
 =?us-ascii?Q?X0KOAxyb4DJcwUvRjbFXPAbooVpHNrv/BWXfHyeFEWbQJl44H2xBUjA3CI6K?=
 =?us-ascii?Q?7GB8CO6szKWBwvVWMvqsjEZPNS3v9ydgpb/zmWURMNgmctEXD9eqrNyeNhbN?=
 =?us-ascii?Q?ERWjnsEC89hsDlAP8TYOvOh3SSgxDs3Muwi3y+MeuVwp0y+1iZRbq5Fiv/lz?=
 =?us-ascii?Q?oSjYGA8KIWViyBc5Q1gTlFgZFfpFT1HjQkOJeiPHVxkw5VbPCXMDWP8DuHE+?=
 =?us-ascii?Q?5e97nCmEEfkb+lwWxvjZtYFMtLy/e0Yi7cosYHm1qCI+tYwCndWr6v+zYgDR?=
 =?us-ascii?Q?HuN/+P3XyLH2QcMDQt4hZ181Hzskl5rBm7Zq3POo4AE1vYtt7qcTL810n7Hz?=
 =?us-ascii?Q?73lnvmt1V8TC2lxhVe9O+sqcbcaWQqSPvJz/JIUK0NvENw+wHa3xXMRGw1d5?=
 =?us-ascii?Q?Xyeu9FUfQe6zNTUUe+lLLGftOZrqRe71Ycu0YJgZkHZNpvT6vLnLm4P7fglw?=
 =?us-ascii?Q?2izGnWkycf0EAeWmvDuU4tMo0LSigk6oGycxIlxol+cy60c2W8B620J7beRA?=
 =?us-ascii?Q?m0T+QoINl0TVoGemNwSVw3FsL+XdrWIpyKTTKk5i2btTe9HceSEVcUEJnCPx?=
 =?us-ascii?Q?dUPJo1JLsLoMnNolg2goZpe6II9rUPB7uEQQZhnVUhYuSMMUVKOtfkbXypN3?=
 =?us-ascii?Q?n1k0Cq3caTCutCp4AaGRQTPkCtYJzKuEu7Z08Xd4J1ixnPLfkzI1VJV9xFI7?=
 =?us-ascii?Q?RA/EARPytKfV1ANwmZifYYprtYylma+NAyzst7KunSrNJbCUpxiWHowzd3Dv?=
 =?us-ascii?Q?do4nAosHpaBB3Yp05ujbGC3tySaDEGdO/ZOs1Zn0iTn419ui4zK5tB3+0yE/?=
 =?us-ascii?Q?5qB2uVhFUImLbw1zSADv/kama7z8uP2ECPTSTbEttIn3TFIfj2Zs6QCJDkyb?=
 =?us-ascii?Q?utdvWQ+HMuRjEHF0KGqvgfLZhmBq0YFqfD6NtmgYCBdrf5j9ZWmfpWGCk6ZB?=
 =?us-ascii?Q?+G5itSfFlZCWMwo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1irmqbI7aR800O5/zV8eSnSsj9fisXFceKcpvEBAXaNrJz3SrZD1h7prnyKJ?=
 =?us-ascii?Q?o0/aBdqu4LKSTnIdJ25JVaNwnMIOWrvi7EMxa5wqzAJa5g05nCn3aqUbt3qm?=
 =?us-ascii?Q?3iKlCF0uG7lvUe7x+U2HBz1vd6uCHn9QZkxg5t4l83qf62YubELLBMW5E7AI?=
 =?us-ascii?Q?LcSmKOCvchYocO5jEKExeeEXqwN8ue7JRP5WvLaLmYmPEU9ZLS82zjOJyEHG?=
 =?us-ascii?Q?2GtuCSkRf+GJR/N9nQ4fEokJ9Y+ZyO1ZtMRxhclzc8mJEnJp5f1NvnMT0yUO?=
 =?us-ascii?Q?dk9yuFuKW4KqxTimPK/VAz7lcRwUD8elAET8ictoIK9Pvl36pt/iF0G/+nQT?=
 =?us-ascii?Q?ZnqX7EaLHCtIhbZ+JSojkHP25DDLW/1SBfDp7oGmWceeuOeQIjeJuAaH3Qjq?=
 =?us-ascii?Q?reGEZHUtQYge5FJL19bbWiVZa+mXUJFlUcdNZw7RFlR36oKJanQVi/5NHfIU?=
 =?us-ascii?Q?dDJD9+GVWNr2x2wkrq+7WYxMJZlNQR5RoMc8o+NOwiqoVEt/ebN2xGSNQcNM?=
 =?us-ascii?Q?caNHBiHogBf3DdnHQB6wZohlpLym4WAqQvgrLBRDlQLkKEhE+rtYDyMUNec8?=
 =?us-ascii?Q?LMfi8xX6xT4Iwd91dUbOL/98qNsUzE7lFnwfyI6P1zD8udFj1igjL94md/UE?=
 =?us-ascii?Q?X1yhbww9A79z2zXJp735fW/GK+s8xba3jmK1DP5kmWRdbmaRzM8Mte30wI1d?=
 =?us-ascii?Q?eypYkeYgV2aFENBGYX5KpCkC1fTRWyZBPkzhBhl3NdXuNwbn4ESBRxOzW2C2?=
 =?us-ascii?Q?XJ5fj9C54mkqv41o/09IRfYbu2z2qTurFeJSWADDbFGzYdHU3SMzVRJ3G4hR?=
 =?us-ascii?Q?v5xI80sQ6oGH+zeywnmaTnyMax4YCHu+OkCrQUGRD7hzFMvgILpOf105NAHi?=
 =?us-ascii?Q?elKyoxAVql8n8Kb/9IW52n7yA2kFX6yIC5yoiGs/oVc+lTq6S57pVTcHYolf?=
 =?us-ascii?Q?SfuG2s2ZhRHc53l25baZKU9j2tgz+fEiiJn2LuF3ZAYDcjpYe0FheH5kTl/U?=
 =?us-ascii?Q?lELHBrXmJkAQNh4taY8zyMFeI83xS4VUNIsCxcSwbRSQEASsVwZ0AQpffHQ2?=
 =?us-ascii?Q?hEtTkQhZzhWRGRdFenYZrCzJzP6betyWYy8wWqfycJQfiJqa+JZG6i/PRr8i?=
 =?us-ascii?Q?zEmHbkOShwbwo1pqybuakUz3UZbgHYxZNiu615fCQG/rNkzl77A7ZQIbPPv6?=
 =?us-ascii?Q?n4EoKwrWwd1fENDVLTPby6v98HZfI25aMfCCOH6RngOvj4hQVn9nsAY2mP4f?=
 =?us-ascii?Q?Blg35ljLBzEAiYejkAEUizwemRqfPT7Zi6802CPBpNP41xf8F7WyYJyhh2Lj?=
 =?us-ascii?Q?R1YNkv69doXJgDh7aJgit+FCS7o+ZoKx2XU1hwjWV2jkwcD6od6rtmPjgDdA?=
 =?us-ascii?Q?7Gz1n1ax8PDe6W35LpleWxFa9npTYmWnV0Pp9r2QNEt5ac2LcyBbH5XAPLJE?=
 =?us-ascii?Q?nvKyph9O95yvGXozEWG192zTeDxVPPOjoNrxb2pn5GCwLgEkQhmNJfFeG28t?=
 =?us-ascii?Q?6vEIBePZI0fvfJUdeP8HgnXen5GKIx6vWH+juGiL8VdpNqXpBOKEHGMtdLXN?=
 =?us-ascii?Q?GFRDXktDzShvxZI8n8TwIAzZUf+Rn352lfr9OVi9HJwJ9+a0TaCBXADCiByo?=
 =?us-ascii?Q?gQi2nbJt5jzBk7uGsWkxA/M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c858aa9c-c376-482d-b3fa-08dda99784a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:18.8971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pycI4Re0ATujlIn7IeZVr/gEHsTWenqpT814RJXJXUA3etPS7u6UW3dmaTGuGiwSvTApud/EYbzmQNq/rizlXhfx+WpQaZFyt8Rt+K9Or0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684aa480 cx=c_pps a=oHfdRNjjH91Dx1UII95wnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=uzjaQC1v_Til1Q9DAxIA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX+HpI4wrgfDHB spfWwibp60B8JTH1voGn7PyOzpMbnsq6nyNlnPhfQdV9zSc/HLZPP2EzPPGUefnE7R0HbokYOCg XKSYPFCcxngU6pKJQv0Mc+kx/mcOir8x8GHkJeZExhMi7TnCdIzolRJchnw8LXVEBYQ1R5FCoHU
 nAm6QC5vsjCEXGmu6qUFA4HgVMbCOv0yj5JZ2cct0zaH+q5SsbhcGwfIztm/G1U2evBnqzLy49n zo3uNAXb/GiOSIbCF9uklslBue5Y8G2VO+KL32NtFjGefbNCKFKoTwybmD1CmHmBuo6z7SZz8af BfXsBA2/YsHcw3sPwTQgakx+vYkb+EEcFIpJA0IKCoheNT/7SNIJpa19jMnXKJb7XeeaftbP0Kc
 e5vRIIuHTPkE8DCnTsercWyHAaQrfJtRL73ko8qK+x198njGGqC4egP3x5HbIiYXl6p7OV9m
X-Proofpoint-ORIG-GUID: tIvcl1a-HWPFOfZSqf5_oEXz0CuDQqSg
X-Proofpoint-GUID: tIvcl1a-HWPFOfZSqf5_oEXz0CuDQqSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218494

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from the master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport [0cc973160c23bb67f895bc887dd6942d29f8fee3]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-2.patch          | 143 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 144 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-2.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
new file mode 100644
index 0000000000..02f41bf3f3
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-2.patch
@@ -0,0 +1,143 @@
+From c257ad8c6d1bb4e0e28a5b41035ee9c4e0286ed3 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 9 Jun 2025 02:58:25 -0700
+Subject: [PATCH] nptl: Update comments and indentation for new condvar
+ implementation
+
+Some comments were wrong after the most recent commit. This fixes that.
+Also fixing indentation where it was using spaces instead of tabs.
+
+The following commits have been cherry-picked from the master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [0cc973160c23bb67f895bc887dd6942d29f8fee3]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c |  5 +++--
+ nptl/pthread_cond_wait.c   | 39 +++++++++++++++++++-------------------
+ 2 files changed, 22 insertions(+), 22 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index a55eee3e..350a16fa 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -221,8 +221,9 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 will be closed out immediately by the advancing of
+-       __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
++     * Waiters in G1 have already received a signal and been woken. If they
++       haven't woken yet, they will be closed out immediately by the advancing
++       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
+        which will prevent waiters from blocking using a futex on
+        __g_signals since it provides enough signals for all possible
+        remaining waiters.  As a result, they can each consume a signal
+diff --git a/nptl/pthread_cond_wait.c b/nptl/pthread_cond_wait.c
+index 1cb3dbf7..cee19687 100644
+--- a/nptl/pthread_cond_wait.c
++++ b/nptl/pthread_cond_wait.c
+@@ -249,7 +249,7 @@ __condvar_cleanup_waiting (void *arg)
+    figure out whether they are in a group that has already been completely
+    signaled (i.e., if the current G1 starts at a later position that the
+    waiter's position).  Waiters cannot determine whether they are currently
+-   in G2 or G1 -- but they do not have too because all they are interested in
++   in G2 or G1 -- but they do not have to because all they are interested in
+    is whether there are available signals, and they always start in G2 (whose
+    group slot they know because of the bit in the waiter sequence.  Signalers
+    will simply fill the right group until it is completely signaled and can
+@@ -412,7 +412,7 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     }
+ 
+   /* Now wait until a signal is available in our group or it is closed.
+-     Acquire MO so that if we observe a value of zero written after group
++     Acquire MO so that if we observe (signals == lowseq) after group
+      switching in __condvar_quiesce_and_switch_g1, we synchronize with that
+      store and will see the prior update of __g1_start done while switching
+      groups too.  */
+@@ -422,8 +422,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+     {
+       while (1)
+ 	{
+-          uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
+-          unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	  uint64_t g1_start = __condvar_load_g1_start_relaxed (cond);
++	  unsigned int lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+ 	  /* Spin-wait first.
+ 	     Note that spinning first without checking whether a timeout
+@@ -447,21 +447,21 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 
+ 	      /* Reload signals.  See above for MO.  */
+ 	      signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-              g1_start = __condvar_load_g1_start_relaxed (cond);
+-              lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	      g1_start = __condvar_load_g1_start_relaxed (cond);
++	      lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 	      spin--;
+ 	    }
+ 
+-          if (seq < (g1_start >> 1))
++	  if (seq < (g1_start >> 1))
+ 	    {
+-              /* If the group is closed already,
++	      /* If the group is closed already,
+ 	         then this waiter originally had enough extra signals to
+ 	         consume, up until the time its group was closed.  */
+ 	       goto done;
+-            }
++	    }
+ 
+ 	  /* If there is an available signal, don't block.
+-             If __g1_start has advanced at all, then we must be in G1
++	     If __g1_start has advanced at all, then we must be in G1
+ 	     by now, perhaps in the process of switching back to an older
+ 	     G2, but in either case we're allowed to consume the available
+ 	     signal and should not block anymore.  */
+@@ -483,22 +483,23 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+ 	     sequence.  */
+ 	  atomic_fetch_add_acquire (cond->__data.__g_refs + g, 2);
+ 	  signals = atomic_load_acquire (cond->__data.__g_signals + g);
+-          g1_start = __condvar_load_g1_start_relaxed (cond);
+-          lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
++	  g1_start = __condvar_load_g1_start_relaxed (cond);
++	  lowseq = (g1_start & 1) == g ? signals : g1_start & ~1U;
+ 
+-          if (seq < (g1_start >> 1))
++	  if (seq < (g1_start >> 1))
+ 	    {
+-              /* group is closed already, so don't block */
++	      /* group is closed already, so don't block */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      goto done;
+ 	    }
+ 
+ 	  if ((int)(signals - lowseq) >= 2)
+ 	    {
+-	      /* a signal showed up or G1/G2 switched after we grabbed the refcount */
++	      /* a signal showed up or G1/G2 switched after we grabbed the
++	         refcount */
+ 	      __condvar_dec_grefs (cond, g, private);
+ 	      break;
+-            }
++	    }
+ 
+ 	  // Now block.
+ 	  struct _pthread_cleanup_buffer buffer;
+@@ -536,10 +537,8 @@ __pthread_cond_wait_common (pthread_cond_t *cond, pthread_mutex_t *mutex,
+        if (seq < (__condvar_load_g1_start_relaxed (cond) >> 1))
+ 	 goto done;
+     }
+-  /* Try to grab a signal.  Use acquire MO so that we see an up-to-date value
+-     of __g1_start below (see spinning above for a similar case).  In
+-     particular, if we steal from a more recent group, we will also see a
+-     more recent __g1_start below.  */
++  /* Try to grab a signal.  See above for MO.  (if we do another loop
++     iteration we need to see the correct value of g1_start)  */
+   while (!atomic_compare_exchange_weak_acquire (cond->__data.__g_signals + g,
+ 						&signals, signals - 2));
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 2d23c17a48..b7a9a2e0e3 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -62,6 +62,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0026-PR25847-1.patch \
+           file://0026-PR25847-2.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


