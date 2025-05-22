Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8773AC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 08:15:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19254.1747901742507458989
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 01:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7237718411=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M6o2bD008750
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 01:15:42 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfsa9v4-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 01:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVPjgJpsSeq+JpfiOkqpvG6+dR2owIvvO/8Wg2JpB6JJGMSDhcXXGRqi21l0nAjdXJvnka6wAqYgEtWIc01f9cKbHrh/wBe+tGoe3IX0Cmue+/Pe5/VoKen93397guBNUWz/z32Lonk3ABrZ5AQum0vnk2XefWNMdaeOa2cI6uqOU7qljc009E1mHyWPMJrh2altx+YYUmoLBnGSPDe60m6ITJ6fDWYbIj0arBp1rCs5C9wWNVEsFJZ0SWA/uLAgizMXf9uoGd6Idl17vGvjEBh8+NnfAH8Xm7LQIP+WOnaqGqliVVuYkNDD9Z2ltZAKWibAVHW1PYL/8L8bvG415w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9Z0Xnhwhyw8DiI2i7BJKg9CHktPsVCzAkXKiEDMmUs=;
 b=WD8lg+hRTfSqzZ9fiCyKTYNZ+OEMMpRtmB//UsJqOYlqnbIC4g3lmlObiN/0aPRuXVczHMWEkgmB/5/9avNB8SIgQlQsuUJ9TVmVCXltySqfyqug9x4y3K1FIw8u+A+zqoLAubUbxbvBce4AQPsoVjPVcRhiU75lCzjydOHIV82jzeJyR4VMPt4PVBmvyYfYpahArVmdPHInClkG0opB/jN6JandjlOm4bY5z+ErHtrFclsyIHfX7QYqryt1HE71hn/Kbpd0NCYv0ALmoBm5QCBKc2cEWLk1Wgxo0GyzeqCbTPRWa33ZWZ69iAlmU5hEW7kAOPqQ+cqTqpszuRbZ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPF2720D4410.namprd11.prod.outlook.com (2603:10b6:f:fc02::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 08:15:40 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 08:15:40 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] less: upgrade 668 -> 678
Date: Thu, 22 May 2025 16:15:12 +0800
Message-ID: <20250522081514.552836-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522081514.552836-1-yi.zhao@windriver.com>
References: <20250522081514.552836-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPF2720D4410:EE_
X-MS-Office365-Filtering-Correlation-Id: f2d2c932-bc24-46be-c580-08dd9908d713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EtFm3vrZ0jnasgMrEqvhGmEeFr7qeVFTZqFv1oG2BhUybO7YlNTcP0ExejVD?=
 =?us-ascii?Q?L7xopntelvw/feTUIc6qxZjb7oYeaqXJ/0/ov6eJEFjmdf9+Ceq7mXOHRz0j?=
 =?us-ascii?Q?u6FMuVIjHQBOY23vZNUtwEKG1126x+ivS8YOsIFPgqwQiRpHUEkyornlEqX4?=
 =?us-ascii?Q?F8wafoIzmyglGQTDWeGC4dTQzb5ZTwc0gUSKy4B9JhhhB6n+tG0ZVOLNvGD8?=
 =?us-ascii?Q?wD/sPZXUrgD1gLgZ5yjvwK2S70sJdL3jq9mXqc9UKrhmcw1A4gMWA6RidRih?=
 =?us-ascii?Q?NocMA5CUo5II/y3BHvSm77BcvMoVoQGbczaEnELynb2x12fdcShoR1f/TIHg?=
 =?us-ascii?Q?2qZQWvqzcV5Dp9t/CQiKrtXZjf7ReX1JDJQkn1u4DNsslg9bQtFzfpohCjDE?=
 =?us-ascii?Q?MqklXVOw21CclizswzJI27UCRwjupyi95JfQgbU71QzylQgYU4KMbJl2eQm3?=
 =?us-ascii?Q?gnU6QXlylKnjAJ85cJFTZLqDZIR3q2t2sn+MvrpGxB95DU2dL9+ZdyUwvIIW?=
 =?us-ascii?Q?JuKqMwRcMeCl2nijdWF3Q6p65B3UeESDB1a9R4wuuhZzvQcPMqaC2oVvPG29?=
 =?us-ascii?Q?pHFeEowlMUbXus+lZ+z+gOeEbfJB4HOJy3PWQAO+jOa/xAR5fACE3LjT9ROp?=
 =?us-ascii?Q?sCiQNiLizEFcuRu/tGGbXyBvNnLnArNpW7grvowgrG06WLFx8+pxgtz7g8gR?=
 =?us-ascii?Q?pYMVZm18/MbXNL9vacrc33HsHw0Z0FVu8H0ZTeyrzeBATy+4ofMQw/dhiKnd?=
 =?us-ascii?Q?ltMVbfye4/b0Ilu+GVecWPP/Vdc1J91MRu6Nk++hdgV50nHDkWtB9lBv9H+Z?=
 =?us-ascii?Q?TynG8xTUumLCgMBflUrD/7tz1Yr39h8YZmQGyezRzMv2aXGwhD4n+1lNPdTZ?=
 =?us-ascii?Q?joh2E9oC3CF04nuozgUOG5Sak1zVBXJ8aILEJExo649I+8KOtJcfKvDoyTKo?=
 =?us-ascii?Q?zqDzUBRE7JKTSRblks9H2XxxQ3fs9iqW5FBYjef4V5diuQzB0LODVkiUGQgx?=
 =?us-ascii?Q?3JSAKMQrVl0sEL7Y9oyn+iWacxCfnSda/JNRl0UtuDD3OlX4x1KdE7JzIFAf?=
 =?us-ascii?Q?yhvt8iLpDB5TfIQAAlu0RWEddEyCxKusoSE6/qLZpgwIwIAvpC3ZG7Hpti6n?=
 =?us-ascii?Q?A80HJ7NaGydt1uKDNs8z/JzXDp7Kee5Ady0zhfqYq60JPCZdHpokno7zya3A?=
 =?us-ascii?Q?xzP6ydCKR6sC3Lv+2qrOM0acDuODXmjrycklwYH6+Rar6/R5wwCeyF6B9Qar?=
 =?us-ascii?Q?k8/dqwfJlM7S+LgbtSgptMsuu2RWHCrYmBLeZ+sO5aT82B/sT/1SjYaaq9O8?=
 =?us-ascii?Q?3uh8SvzLwQGxkdrcazZTDdbSFlTk2kL/hTjYhRlh9ftUGbB2QIIAm3ILsVD1?=
 =?us-ascii?Q?ghesYdKUtBnGtOTa+WOQ2X07kKSxs8wR4sfSxHTedq6yTnjBSynU+MNQItDH?=
 =?us-ascii?Q?3eWH1LzOROE=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+kBQ23ef8d5c/NGQU6I3FNkz7uGonputAt8wD5gl0nJLZ+8AuJYAfib0zIxv?=
 =?us-ascii?Q?eUGjbuVqkwBKYPBCM9DVinxnfBB7duunFU9CwxR0yHeAW/K3N7FjtWzWq84C?=
 =?us-ascii?Q?1E09BGMx4nqR2e+4adjffb6v8QEwM7BsJPspXHNJP5bZnXNoeCyklTeH0uNi?=
 =?us-ascii?Q?ghZmrtGHuKTg1oODEw7YqtG9U4QN1BSCl/bq8XZ9/dHGpeV72L+kPj7g85Rt?=
 =?us-ascii?Q?n2VvsbBNOa2O/TsOOjsoQ4UHBI+Mh4Zdj+SgUQf/V5wZSXwuwlgJVu4Mc5w8?=
 =?us-ascii?Q?2kCAy/1Ru7qbQB9FQ8WF+ck1YzgwHH9O4HypIPC8bKvGVwH0TV+/C/bqJ/1n?=
 =?us-ascii?Q?iq/I9Z/ubvPTutXwR2oMLq7CEIIFq35Kk42P9Rwp7DYVOtn5Q4j+2DST2Nly?=
 =?us-ascii?Q?ysgnKNUySOi0HHxqexTVuRi8sENkc3hpMyoSwV+ZhDDSxRff4q6ZjcU42/7m?=
 =?us-ascii?Q?KFmk3SNBERa7sJ4tVzeQZF6iFxnGjmyQ+z96lWr6qvNjsHBDcGvzpHIkkOWY?=
 =?us-ascii?Q?Wwfo/5JlIaJZ0VTAdQe+ZnFxWNalkq4cK8KTrAETCalxdkrn7wS+Qd3vG3vJ?=
 =?us-ascii?Q?SLTaIGryH8x4G90XaQDkqQ+wEKI4gRHPmbCNvxkFopNiE1BI5MdmL5I2284E?=
 =?us-ascii?Q?4XZC52pbapo0B0IWpnTKUTWL3EjNxt19LAAkyoqAGhznNEbaQ0K3qICO/6vH?=
 =?us-ascii?Q?FiiVGQZK4ehkNya7HuQWvedRKedjmiR7eze5ZNdaemJPQ0Q60dckJ7YgYDXk?=
 =?us-ascii?Q?MZsM2H8ecuitw3iPR8yNnOMbVEEJYKcU6CmzLVHsDsMvon5QMNgHZ/O6tpaf?=
 =?us-ascii?Q?sGDgiN6yJgpFYGQBg2F1z3ySrh+tijxRPgg6pVB7yA/J1J2OOcUxtquXbP73?=
 =?us-ascii?Q?oaCEmxZWXabGNgsGb1hHRv037bVKjHKMkc6zCHDryy5UfFuiRLL4yhFzqmMy?=
 =?us-ascii?Q?Ifb3eWDxZPxeVKh+CuZ2I147fD+oCbqNFgmn5uHY3uoPo0sfG6jQSrl74me8?=
 =?us-ascii?Q?jJMTyUwPv9UpuhCi4j9Xjzs6RN8OnwQpu4naTAZ5Y5gJOYlNrByw0/qz5peo?=
 =?us-ascii?Q?hxdtaCnh89KZxDuy82TMxo0HhD7UFmfTSEtYptSMmfOAui/HjRC2p5/15TlU?=
 =?us-ascii?Q?Hm7W+S69M5Lc2TupJ3O1oGwRiCAVSM4hkCW/+E3l9HHvaoVsUM0g9mV74rJL?=
 =?us-ascii?Q?Y+cDgRo6PbSN+cXmS3us0NQ1uWUKBXKAD9LZ5WDABMTJOp6CPs8AaL/WrNuL?=
 =?us-ascii?Q?yvrhu6o8rSxEMGVCXN4o//lmL1DXl+ldnM4TG+IRkyReyvffl6k7XOLoP+sj?=
 =?us-ascii?Q?c/sPIGZy1O9mbk2LRMR2/7xcnlJA0y9nKAlvA3O5uzPmGknRhR/P7nT/Q8Ic?=
 =?us-ascii?Q?QtW0X/xOecD3tSsIOngAOYw+L6f3DaVwE/Fme8geBauk5f6IJczqj61hLK7D?=
 =?us-ascii?Q?/BQ7JoBhj6OH8MEHwjXgpfRbK1rlrjvC2T3BgS6w7I9DoaepByo+JHKDfKwE?=
 =?us-ascii?Q?vsQBWmtZVFFkgZ8mnPtOdxI2/NGSudphxaAopfwYSAYAHbTnLcaKt0HgkXXq?=
 =?us-ascii?Q?L+SUV1MagYR7kezHp+jJkWuTKLTTDAcOV9qI3d6T?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2d2c932-bc24-46be-c580-08dd9908d713
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:15:40.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h1Ij+f43cI/uvNP/ol1ZrPHWbw/qXJrNfkmJ5Vl1b0VsmgkAbsG7OtGJt4oiP9FRoM50Dw1fbC59nXvbX3tOjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2720D4410
X-Proofpoint-GUID: IIq6K2JW8xadVTYjFMWuAh4I6KnyqIC8
X-Proofpoint-ORIG-GUID: IIq6K2JW8xadVTYjFMWuAh4I6KnyqIC8
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682edd2e cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=4avBbA3pAAAA:8 a=t7CeM3EgAAAA:8 a=toEAUzofyjoFc4gy_ScA:9 a=ylZeaN-1UXQA:10 a=b1bfMB4-q2gA:10 a=FNuvnhAvCZ4ZEIA-sn9Q:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4MiBTYWx0ZWRfX0eMIXs7dkNZj sW9wheFomDvJPv+zHKYUpyFArVpm6ZNr596rDAcOjnP8J4XQcVKerL2r/4fZhXe9b17HBv+n1BH rtW5okUCK31mWQbq9QNot/aaeWpgw32yVGGT8w4OT5rOA6ajAz/MUliXrvsdFXplZ3nESiyYi5q
 UzBzs7GPAw9s6Mz1kD2CrsZT7v09xMWZO2AbwrQ4EwvKC3vaEaDEYgWjbcN17KMwrfSoO8MoE9k U1BrSOOcdYWlDlmtnYI+jaHqYmz7EINC0kw1jlo06uajF2YSMTX1gejZMSEMK1jcil5p4NRpBsG isgaZwcAFx3m+9uMZdPw2qJvSKYIYP5nPq3kevXvqsTm9BXCQgrO2HX0HUTxJndhYO+6V7kq1Bs
 AbtIFqT14gaTDN0J7ot0HYUeI9fDrH8iNty9tF2RXuY8EEG7wJ6Fu6HfQFrQwNxK8E5zy1j+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=812 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505220082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217068

ChangeLog:
https://greenwoodsoftware.com/less/news.678.html

License-Update: Copyright year updated to 2025

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/less/{less_668.bb => less_678.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/less/{less_668.bb => less_678.bb} (91%)

diff --git a/meta/recipes-extended/less/less_668.bb b/meta/recipes-extended/less/less_678.bb
similarity index 91%
rename from meta/recipes-extended/less/less_668.bb
rename to meta/recipes-extended/less/less_678.bb
index 63fc367e33..87ec6c92ca 100644
--- a/meta/recipes-extended/less/less_668.bb
+++ b/meta/recipes-extended/less/less_678.bb
@@ -21,7 +21,7 @@ SECTION = "console/utils"
 
 LICENSE = "GPL-3.0-or-later | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://LICENSE;md5=ea7ea443692720f3015859945c0fb65d \
+                    file://LICENSE;md5=8051a271adb36d1462531a3b40c22878 \
                     "
 DEPENDS = "ncurses"
 
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2819f55564d86d542abbecafd82ff61e819a3eec967faa36cd3e68f1596a44b8"
+SRC_URI[sha256sum] = "4c085364f3028290d34647df27f56018c365dc4c0092ab7de74ed8fe89014fe7"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.48.1


