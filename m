Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517BDC71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 02:09:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.455.1749780579418810168
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 19:09:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=825912110e=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D1n3bO003390
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:09:38 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd969gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:09:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L0XIoxC/WTbwQJ9TMUjXMHpJd562yUS+qIAGV3Osc97+f8PxgZnc6fNz69WsboPyXKTUF8p9atuls16ptK1mScEusmq3MKjSHPIe4kzoGjvPwbaXTcEn6S4o0fM6m++U7w/BNLiHuqaCqIZdElwx7eNVMJF1JOICXJ8S4T9wHOEVUEWdWqpo6i45uyqDZtDcD6T1pOnY6hAd1IxvNDTWVbGusiQYwv8HUn7mxFzxFkrqMSD9DNYSErH0EkVS/7BC+LMOEOmvpNwlwgXxoh/l4A23X2ODxm2j/RSb22kyw/pwOsleoWC9t8nu5FgpZOBXL9Ibpe2/tMt91HKHq1VxuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wEHOkX3nigMsdisch2uWS9otPO5NZ9+1UOJ1TxTn7ho=;
 b=ZebQOAzX8uBurlGDw2vRh6ANnJO3IbCfwOMWutQqBZ2JHgGTFeRu0nla1jcwEfIv1ub+4wDqPRvOKGOfrHbSdeulM9GppF6MNrZnfb84RV4jh21TJ8Njzti3C98JDf1I0I9KOzodjGe5waAnUxm1RT6LxzcL1CVr33pF0vrepT3qQ+SJsA5aUQbkMcLgCe6ZGR0cx3uiGH5rO6ujw/5p8AJHAU4fJSTUXAC4eucyQpNt2GLjBypLePD9O/p2ZGu4Hviwy5BiFnR7iydUJpKMAl0wn31UKxCOS0uWrEXe3+Q57ziuE38xiJyfeXzN4MKyrC0KKhPhmCkuCjI3+0UXPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.35; Fri, 13 Jun
 2025 02:09:34 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%6]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 02:09:34 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH 1/1] babeltrace/libatomic-ops: correct the SRC_URI
Date: Fri, 13 Jun 2025 10:09:08 +0800
Message-Id: <20250613020908.2880888-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGAP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::14)
 To CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: c01221d3-6e78-4bdc-e5aa-08ddaa1f5713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?q7rOCi8u7jww+TiuXIkyDBWJAO3siRK5613aSgK/DLGGHGfD0nh4vsR3jWnN?=
 =?us-ascii?Q?p8V9SnXzXWCj8CPR2ykxBvkOh2KfXGI9s+aqWlRk43h5auVopNrnt2nTv9cH?=
 =?us-ascii?Q?fLF8XzPbaS2Ev19l20yudpT58M71W9ppghqaopjduT4W4x1EIPiCIcM6g8dK?=
 =?us-ascii?Q?NS+jOmzpjqGJp3PeTJze/TO3INfivxnWwBrMeKaTBowR9n9pLeU1kpiEjW4I?=
 =?us-ascii?Q?dbNw4inhcAvKGtWnNjdxsyAYn0syZxfv0g3GfoCwmERpsenITs2aOG/l0WNX?=
 =?us-ascii?Q?jGmSgrb+rIgm2BXiPONMqa1F3jiXIpBaSxGx4Zhf6rqtaKPJy6KfxbLTc1ni?=
 =?us-ascii?Q?MQS1ThHoJES5K4wyhClnro0S1k6LJn3dUTuNf/CvsoRZGkXNApNrCTBTTPjV?=
 =?us-ascii?Q?MGb5nM88Bm/nnc3qnsq2r6Q8nyLmK8o0VuHZ2nllZwBTSYPJJ3Dq1Ef7Pt2x?=
 =?us-ascii?Q?nufOKlG1WquUFobKVViFscmj4f/ZZE0TXaCnDEQHofygjY0bdojMYluNs2In?=
 =?us-ascii?Q?56MLPijyVvnmTkQ+xL2xKmrcSHA1CBLm/HNFaGn71s9wZw0q+0FCowc2j1Qj?=
 =?us-ascii?Q?5xkB/pQiQDOdrv6byCRLFtfeDFLgLmrky0ZroVxsJ0Hl4B/Bz7jP1z3VQZW3?=
 =?us-ascii?Q?4E4wjxci1TuWmg27GL283ewjTeJWT4sLor+pmRv/JFV7ijgwhMqejQC7OxNx?=
 =?us-ascii?Q?mB/lTCwm97xAhqacMAfnuk/vRjMdvxhUkswmgWJrkn5P36tDWOZZ50FBHcpx?=
 =?us-ascii?Q?2sp9kpYuL6r/7iPWMMdzt37Mdhw17XplB71iGjx4/efa++k/cyDE1SmTRwY3?=
 =?us-ascii?Q?1hAwzhM4PNkaPJDfbxVGGoi/CtgqNI7eRJs1pMHhY+roKmb6MjYaTPFuWj4k?=
 =?us-ascii?Q?euir5TGGhkDeBTHgA7InbbWRUB+mi1mBrJ1CAEwmvtbGm3qhpcHjLMcarQ5c?=
 =?us-ascii?Q?nlJYDcBayuZ9Mg8yeLvYVwFnWgMV6Aj/4Lcrnhy/m8AHro7cYsllJRsCMlL9?=
 =?us-ascii?Q?/gsy3KdCI5oEJSYug9touVTzkVuP1L0a64WdeTS5UzWNtXP96KodIPWw/JAb?=
 =?us-ascii?Q?WQh8vOelFp3liR2eU0Opv2GO94UkFV+T403hBrRv8Gjb+RK9JX8GYkfV8EzE?=
 =?us-ascii?Q?XPr6/RYaZdbmLPYOrs35qhoNbSXyv/Mw9uz54ijKFkXZ6p6cSb2hOmgsHNkf?=
 =?us-ascii?Q?UBTxbPnq0AAB6DXMOKdfgRZUtaumAhyF7KLjYoC5HD9rxt3lHIPTav76/QFC?=
 =?us-ascii?Q?CJuA7Y9K2qgHP6N4/ssNSdW9NbAQr5VLllr14bq2DgqaCAJNou/NXDpD00is?=
 =?us-ascii?Q?+kslUiouKHR6mBAiFzo9w1w757p2WI4Iv9jfe5mwHPcjIDB6o6S//UIc+3RW?=
 =?us-ascii?Q?68323hnBlvBxzHiriSHyaEJyDG21TJqdMfcBDXIxAwyPDQtmF+E9IEkg9v1K?=
 =?us-ascii?Q?2LteDNOCKKbBHwYHvhr1BQL0a0xxitLI0m9q14uGTZVWim8wb+nGeJVmUxN/?=
 =?us-ascii?Q?K04kO4d5G26cVGw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ft0knbCOEwlr6Ne3F9jjEm3CZzhS/99PjXD+UgGBwP4lLV/rp/oY+EQBzxnO?=
 =?us-ascii?Q?mSqMxhLhNFIf+yoSzhQeXb0VFAr5rtiHK7uxZsQyEN8uDLvjqw99/G0O4uHb?=
 =?us-ascii?Q?YJownTvHWqlgTZtPiYenhI2rkSxYXYDceHu3YPBVWllT6UBWiPrBla0AfxVg?=
 =?us-ascii?Q?mzMiZD528FqBE8zyrlRUslApuwBHXyV2+78xW9rzVXf/+tCef8YYM3rxBRqc?=
 =?us-ascii?Q?2tPAjfsdtUpr3Rgk3H/8MYOnr+ixSDSNvrOsDFZRxhclPNHYNFsFEi8PSJ0X?=
 =?us-ascii?Q?MqMTWVRkHo9I5IttqqWrqzU2I/0n4o1D0oM38+QhDi9ykCKgphDkpT8OXqDz?=
 =?us-ascii?Q?ABr0/ruLcuxJ69203L/tw+wqAX+c+c8IkUoNZX7qLES2F+a4KRbxVA+Ogq3O?=
 =?us-ascii?Q?XNed4mav6o5iSCGlAh2ViX5yLecTSioLecQDhFctE7ssKf0bAAb+FF9UqhZQ?=
 =?us-ascii?Q?dJkV/wHdokZBbCu8hcKhUa0vyITTu4Cn0ebLtVDxkIr333xrFm3InFiuppIq?=
 =?us-ascii?Q?I5Wbq87CEWCOylKZUjbUFlv6VszNer887HLVPdoXUDJNsBYMrS3314JOYwYN?=
 =?us-ascii?Q?uhA+W9nm4s6bGjJsn5FMt7wfJ04Mb+A3sf1M1sqCzMSx7mAqX3vZUFzduDXz?=
 =?us-ascii?Q?5Un61f3MSywVqSBrdW/V33eU2U9kwg5AABbNojaOtfOQJehqzDf6XMeUDJlK?=
 =?us-ascii?Q?UIbZpi2QjGYZrhyqpcZuTa2PlctwS7AiNEWAwW3qxe2k+a4JS/U4WtlEHYe5?=
 =?us-ascii?Q?iwuYTlLjdm2jZlvaw567ETEB2RoFbPZZZynPFe+KGJhkRbYH6I+iTZlfaJHo?=
 =?us-ascii?Q?SAZWlUJhWlSQQ2CK+R574VSHbfEj13oEyxtiB+H3lkOIY5KbAZBLMOmlR3Td?=
 =?us-ascii?Q?M1uISYOn/On7DS1ZfhK80JNUhbsrxLu0bZmL+J8Z9qD0sKh55lvDWyRMPpzY?=
 =?us-ascii?Q?pwVcOSGeda/EscT2IacCXNvhlNvru3X7Up0Z/jiBjDyBMGQxXyF9rGZZqm6Z?=
 =?us-ascii?Q?zTXcshrjSnzuZFX6K7jKTqVRqUaWVImPK0Z4Rm1ZUClFHaU4GjWxEUDwnMTP?=
 =?us-ascii?Q?8K0E66/MXLY7AiakoZ2lAp4xj9ySz7R+YZ37Hwpim/UTyCloEJ/fce0noZB3?=
 =?us-ascii?Q?HkjO0rA8bUsKniwlfP6QuF9CbBHW0WswlZHfZ4ec2yXwbYvyRwW6JWaePJle?=
 =?us-ascii?Q?XU1lQGBhz/UGivKp/rUiUk5sBoYbP4rMgPA+UDMQmc4tRE3AUe+LcN2OpeV1?=
 =?us-ascii?Q?sRIheeJNIrMqzo7OexRLpied7KrcinWJI/7XSgeg6UEQQ1i6tb7jXR8WZ4HN?=
 =?us-ascii?Q?1UAqE8gzmZubuAYERIzmRqts9BuFVraExi1jnaFxLVEj3N+DZV//DK55fBRU?=
 =?us-ascii?Q?YmOwngyzw3Zry8GV8lDREewRhi4hrhwODxR7glzpBB4BHsr8LCBXLPdng/0E?=
 =?us-ascii?Q?Qv4crzhhKXzyFZy7b4OpYhLigIxSYmqroTg/TEGmvNKEUWBzGQ2/vL8gzmVS?=
 =?us-ascii?Q?OhhMnYUgS0Orq6TDc2b4Zo8i+79BQxjje5bQBzA2BlcF0InFnmVqiccBlqtW?=
 =?us-ascii?Q?CIfSHrkaJmRcjZAWnB+RBCgbBsq6Ky52cul5ApmVpCzsX3c9+GdVkoyr2xAK?=
 =?us-ascii?Q?vw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c01221d3-6e78-4bdc-e5aa-08ddaa1f5713
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 02:09:34.0548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q35mo+soRnujJf2W16hzaH/D7f5C2cU5vzyViNyPL4o5CimiOa/tmig4RWFKeAqMgH7SN4QGMQ9KrpSZizP3HRJuXRQAWVByOrMJ3bvoluU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684b8862 cx=c_pps a=/jMH4tigRTm8KUq8TyAgLg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=y0pV00hJC3AnXCk3bAQA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=jhqOcbufqs7Y1TYCrUUU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDAxNSBTYWx0ZWRfX2fF7EvAMcZeZ 3wOs6uPn94cxHAAJWrxp3LYtSyjJklYZ9lJDvkAUk0IQeLnGtSTMQTm0F+z3adxbmPa8G1oGJ28 yPK3uzcnq2t3XBhvTY2C8s0nmHi5D/QVqOoR3p3s8PJXxuGCbLMn4TaRS095SS6ktK9RwR4LAqD
 YuyYQJbeN3t4fzKoJvb9us2BXbiQxOvpoQi2oTJHg/rS28RQuc51Zf66o3HFZTi6fRMnwCPR1Gj cqCWzjbEnjIqu5px1McWDXXD1tm9h4TJzQndmNy9hNqSuClw2grnmchhJ3GzlHl199Nwkcs6yqT iEI0SiI96ytaXzkjzV93XoZj7brUF/JqWyHElccDl95T0R7OxUtfPPxB5r3p+JHOWJNfj62Ltcs
 V9YRYimhoUrmd+OVPQFDKsqnUXlkP1wCzbDi5ni8GwgB5yWobZrIhdrEKWzWJ/sNtpKKd/xI
X-Proofpoint-ORIG-GUID: G6dIZhQBxBeVDKf7Z8-RPKTw0DovMsqL
X-Proofpoint-GUID: G6dIZhQBxBeVDKf7Z8-RPKTw0DovMsqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506130015
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 02:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218547

From: Guocai He <guocai.he.cn@windriver.com>

The old SRC_URIs are not available and need to update.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-kernel/lttng/babeltrace_1.5.11.bb             | 2 +-
 meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
index fb62937819..d9c56d038b 100644
--- a/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
+++ b/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=76ba15dd76a248e1dd526bca0e2125fa"
 
 DEPENDS = "glib-2.0 util-linux popt bison-native flex-native"
 
-SRC_URI = "git://git.efficios.com/babeltrace.git;branch=stable-1.5 \
+SRC_URI = "git://git.efficios.com/babeltrace.git;protocol=https;branch=stable-1.5 \
 	   file://run-ptest \
 	   file://0001-Handle-negative-time-and-offset-from-Epoch.patch \
 	   file://0002-babeltrace-fix-bug-in-stream-intersection-option.patch \
diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
index fad92df507..69d8a266f6 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.14.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/LICENSING.txt;md5=dfc50c7cea7b66935844587a0f7389e7 \
                     "
 
-SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
-UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
+SRC_URI = "https://github.com/bdwgc/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
+UPSTREAM_CHECK_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
 SRC_URI[sha256sum] = "390f244d424714735b7050d056567615b3b8f29008a663c262fb548f1802d292"
 
-- 
2.34.1


