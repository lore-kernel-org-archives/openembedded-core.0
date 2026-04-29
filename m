Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CB4ACCF9E3
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 06:16:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5564.1777443358990050586
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 23:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rswFwngJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9579970def=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T4hm0I3687161
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 23:15:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=rjdqrDYps8BZCSodUG8X6QJQZL8SQPStB+JXNj0U7UY=; b=rswFwngJ35CV
	VYBuGRFu+bcuSnJBBOlkzaqAeU+4Rq83eoqeO7fQ9kL/+b5kLBdBn/wFE6oR/LV7
	Mznlwqlj823n0x8YMWTK1ROo5ausRLQZCbp4msSkWQdfUpgrpjWtK1Id8DmTZdNa
	FpT/Htm32zZsxWn8S0svizjBqPRHfiRt1WTUWk0WP/BC3YZAkwKA1RNem3X9QW3P
	sPk6bk5F8nJj9lxaqR/5tNhQfohRxs5xgKpqbY+J1PdiEUNlChtppTe8h/KZIKCw
	e1KWNxBTEMGOm8kfPvFnSC3oTfVqlvU/shxSEoyqo0xR8u1pxI6NXdDkFGN+AKwH
	lhMjW9P/gw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drrw2vaqr-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 23:15:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hmQ08bMMSBeGPcR+gcrq7UtHkc2tSYHWACO9aGjJHOZwQj5pi3PBsLLdsKx73TDnYXQqjnzet0/PSgnUfiAGhXpxPeMlfjZAlFlogo5VnLrHqMsM5AmjtdcVxxpoe8gtlM+ddaIhUJstc/R94rNdh/4l4xKXp77wKLXPMKMSV3JQqUMl5rlV4fo5NeDCuQzNMTlfTAv/NvFAp5wZ9uGLSGL5q4NtDxBQuu1MAfr3TyDgv6nnJILyypfLWAsDfBLHd8WxIqnXq0C68wWk/gcXSl5QQoKBungSsahgSb8jRoXUeESOWkQwiC9/hLVToSFPJ6Z3yZwWWMYgtZkOeV7Nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rjdqrDYps8BZCSodUG8X6QJQZL8SQPStB+JXNj0U7UY=;
 b=OLEflxk+9IAfxzQagVMNmAhOWAuUOGkFk8nr/MlTCbcNKdkN7H4Xpm8rMcze0B/t6E0XbGF+NOK/NIiSV/yZ4vfsbu1zFETAHZRF1X8Bui9GkJY0VSBbR5oHrmmCHpqUQ8fjsUH8h16sjKZ1QXQLxjT/Vvc1OSdslFIZJAfUimHS4CfgTq0Wr4AE0h2GDxRlxmn8aY3ue/cE36EhSGBY6+h3vK04pA9qbV5dpkC0o6Fy9Noe9m3pm9qlSsZqOH8ZATeBwqYlPybivy5A+UGK9yCGUibOB3iREiA0BYCfXO8oePZewNBvag4nI70uA2X8BqnMO17Sn+TxJPm26xP2fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by LV8PR11MB8535.namprd11.prod.outlook.com (2603:10b6:408:1ed::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.16; Wed, 29 Apr
 2026 06:15:54 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 06:15:54 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH 4/4] libsoup-2.4: fix CVE-2025-32049
Date: Wed, 29 Apr 2026 14:15:33 +0800
Message-Id: <20260429061533.858115-4-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260429061533.858115-1-changqing.li@windriver.com>
References: <20260429061533.858115-1-changqing.li@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:196::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|LV8PR11MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 527b892f-68ec-495c-b3fc-08dea5b6c4c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	/wi6ti7vJz5OHnh3dyxqR9xSZIFbEoxtW33+/Qf2na9ajb49kSJCgP4zYdpMo1gqQOx3kQLdIFpCe9jqlngw8YpD5YtWYx3K2k09ywK2KHcLta1IspgGRot05alFqEYV150HUmwqiI4OmfdbNGvdu579idusRxzwt1iXeWmKlcAfkuQnoaLFrjFA3oCFuFJZAanM1knIrB/H9f4t+ei83ZDjHdoIgHAnEnar1NZk5LfGDMPnD6pStrTFcX2mD8ecoMPADsh+BQIVQhn3eTvIXfLxaCmrp/lCaodkKfnI/GwpdCJsFFVD2qYJEnerpnNLrKefaoCl3niSwRxQVvrQW8N9Sj8C/IaO2zXit//43JZbll9OGxGVnjHl5yo2Fk2kQmprmXea50E75sHhrPjqDyZOS069nxtZpupO2NKWk0bro6WBncVR7EY9fojy7rWQOjSU5SdKy4EU6g3UveCdt5mpv3pq1P55ajizW857SDawvD1ZfQH2EulO7tlBHStULL3mY9VW/LXoT6ShG8QNy1k5F0l1DAsQh1A8xfk8nW6ZBFoKI6ODIyKSQYkPncRGKfHFsxaZ8jtUQCnpQy+BPm8wMPoUo/IxVl/ZG1sCZhccBAj3tskCEg1QvbGrbpGptheXblXSYNUeXoeXQeEdXtQ5HrYjgZ4smc7/AX214I7Jq+nvzltb83t7Z6BtyKuruM2mHkQY8MFhS1VsiisuJnzbRi51LGtpRc/My1UNbs5TC3/Lh5pYwGcYr2iLtzV5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5nVzS/7/yddFbAy3hfAgT59CVPHHZ5+jr+NFhcFHG+3iDJ9PjJRLUTnfKWjT?=
 =?us-ascii?Q?RgGDMhYBnDfjbmEj3WP6WcvBrC6837HKP7yaBJXIkflRnkzphaP1tiBMijx5?=
 =?us-ascii?Q?6CW7dqi0wdq0J1HwyWJZITk89DyZ20Ur1n3CcSL9lhz1tenrP8CQDoSRB94Z?=
 =?us-ascii?Q?8RKFXnvcZfp0Q5Ne5TcrB+9qor6a1vLW/CXCdXt3m+m/Z3P1DRZD/xBI9E38?=
 =?us-ascii?Q?iRKROoSH38gdVm2Pz9tRje3uzvXIhOJPYGMfn+cZsjsI1LqVQZXYBkyNg9nd?=
 =?us-ascii?Q?jYXr8a+ect0YashHClIkXbblox2vF/fafdKq2Bgjw5P8t8SspY/6ElySGf/G?=
 =?us-ascii?Q?eaIw5/wzKJcUH9mqPL+wfQIFZ2AN+ZdR2APCUTytnk5nttGSrhFNfL2t2L8J?=
 =?us-ascii?Q?08z4PaS9O+Dsz6oTh5xoCeJdDISzxXkcr7qO0DNpZL6s8v23LxtxSVr43w3k?=
 =?us-ascii?Q?4GJepcbq88bWuraZIfDWAzLDEDL2UaATzOL7k6GEGAMVS6UkFizLK4KjhO0M?=
 =?us-ascii?Q?BEWIPIlqnxJ3jCcDP3Y+9ius7Kh+EPkPJb3xvyAh1RQ21b6NI2OeoremUHEl?=
 =?us-ascii?Q?r6eW+kSUGNEUGV7D3ABvQ8jLzlBERYrawzM8ugZgwOMSTh0T2hKLVi8gug3C?=
 =?us-ascii?Q?C/RM8er/4qZJccgxCizfFICKdxcCV+k8H2jQ3BPlkynWnihCY6UQYyUPBYOO?=
 =?us-ascii?Q?37WFxkhHSRyZio79Tx6l6puvh6k5JrsSqppIWahEQ2WnT5GkGP65rbpG3ocH?=
 =?us-ascii?Q?kxlhTmbog1/mNa1rpSyEfuDh4T7eK/v0mKiZ/eYwTI35Ra7Qd1IXTRA9Ltf7?=
 =?us-ascii?Q?vz2dClaDZv0dQqM7VgocxwW0ao6oXASpo/D1k5iA63Gh/UUvJLEjTqsx/Pc+?=
 =?us-ascii?Q?DbtDA0dE/Nm3ro7e12OcfJhHXUvmUeNj7UhE+ulOvKuC1TjXSYWX9iHVkCQi?=
 =?us-ascii?Q?HuExkbJIPR+7cfoEdlEq4w5oI4th0/8MhgHnL/HRn8atmvYEiJxHmHYYFjAb?=
 =?us-ascii?Q?E31FRc9WACbyvcpLpOGeohqvV1YOe8GLTDTkPP9alUQoWK883Ptu8PNiPAk1?=
 =?us-ascii?Q?+fq4uIkVqtatCb93M0A7O9qpuOqYKIwARRAH1mcW9CeAPHYBv84xiELNeXPF?=
 =?us-ascii?Q?c+K9S5Dm9mj2S08szNrh7ec+8p5eEU/7QEd6QAZ6xZ94g/Lic6oSwh5atKIK?=
 =?us-ascii?Q?FmMwg/CBzr/tOrPtjoyGyfNiXGZ3jUrrlRNIKMaZMuTw6BJ3xxASdJJK1DNL?=
 =?us-ascii?Q?zOy+TaRYPqnQBzYIsI4ceGLfsd+LcwXMGY4GsatVQS+HzYTuuX+mduSxKG4L?=
 =?us-ascii?Q?SvdTgwO8GkxKGCAG0kBAkHkpSsbahnts69+xfjUf9GQixfdO00CTofwEpa7D?=
 =?us-ascii?Q?aAZwfgRNfQkdcgL01VvLLwtwjEqaZhuWO6L0pJstHShABqnjNhIYEOEFyoZq?=
 =?us-ascii?Q?BrTRZCxTn47nzYa7plQb8mkgQETZbhxPN6Vp29uSnFE6mx7bi681TNFCI9Xe?=
 =?us-ascii?Q?2rz50kdDs9htrDPqBu/4NlzNVk77kfuJ4uFIPHyURIsvaowwJbeii1ECI9Kv?=
 =?us-ascii?Q?5ryV4pK9gaNLXjkb/QkDLsCwMSxGUFrPnOUxkkahomnRB7vz6wygq1yfcDoK?=
 =?us-ascii?Q?chwPsnUhIUA3TDXGu8BZVdF830QnXs8y15mtPrluhChmGC+eEqIaJv4l5Owm?=
 =?us-ascii?Q?REpAhoPRUTheIkk5xUX4Iq5j+dyEdyc4bxL09Rpxw7r8PnTjgBws58Uqv+k+?=
 =?us-ascii?Q?AEHhmLthnYWeJdeQ5LopLAW909uKL3o=3D?=
X-Exchange-RoutingPolicyChecked: 
	nt0xYnLxrXQs6nWV3Ofip0VrNbzYdDSy8t8LwRUTBp7Niz3imMf+8VEEnP6mXQVk3eCt/Bp1JU/GUbINh1HexVFERNcXQ+9SWQDAxABmiFyuMAucynCkpSV02Eg3+U4nGW6lTPzep3/apkEDEeJk3Y4yzZ2CoRxbE+xQBMXtDAx1PKDMNwr9ytUzPc+PBTvr+7MTlvjT5sMsFv3VN9t5kmDoWUDSVX5W0/gvQQFzlG1vQVTilU3s6IS0tJq2S0ltRBJNUYaLJWitYGBsyl3EUrWBHnu96cIsIooiTyj/KK7qY+mQ9Qa+cav2cvYlII9JxoR7ibbKJGvVY4ikgbRvKw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 527b892f-68ec-495c-b3fc-08dea5b6c4c1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 06:15:54.0350
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DT96fzSY6z6DOk/wNzzMtDQcYYwcTG2AWIhKiHI9aQUSKdo5NUiV3+XX/nbcDQr6ElNZZQzW7NnvUuVRPdvfX8755V5xFOmLJk6b4tjIjk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8535
X-Proofpoint-GUID: pA_smLotniiKTqAnsVd_Myc7duWeJQ34
X-Proofpoint-ORIG-GUID: pA_smLotniiKTqAnsVd_Myc7duWeJQ34
X-Authority-Analysis: v=2.4 cv=Pu+jqQM3 c=1 sm=1 tr=0 ts=69f1a21e cx=c_pps
 a=+9lCAQqCkh6G/pz+5LnHJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=GHR8O2WEAAAA:20
 a=t7CeM3EgAAAA:8 a=u9qaAUzl2SAL_BSk4EAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA1OCBTYWx0ZWRfX3Uie8Z8kQil9
 GKRFKneHcu0R+bV8dHNUbDfICAqsfuZK+OtfFrQ4cQIxJraJCgWQDeXy2+W5WIqLHtUigQGtIW2
 VH+tn9NE1HhuuSkDe9TRLc0f6mTAhOpOSadpDe9Je0zlrNEwzznXoz2usxFUPeIan9542f2Htoi
 pC3Z46bSDLp0tFnTLRPlOue0LsI60I3jDv9rr/RO4lhlSLb2XPhNQvgph0l3yVZL0rJz1266iyx
 9U+1bSmzcZQur/eRLI0jG1DyDGenAxjVey4SNZHVW6vY0w715o45+If43sVJnF3tW4rTPIOkd4i
 lQ+L11ROCODwTV8Ga6uwawJouGQmXU/r6jyGj+Vavy8OVp7J4TmhrikQZqc87bSeBcQiVUOz7l+
 KmFYmZcR3b4p2WzpTgckeK48htplqG4uP8top+7fEzMh6HyfuFKnSmLblxkvyZemV6MhvweWMrn
 TpqT2vGtSuMJzgEm4ZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 06:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236080

Refer:
https://gitlab.gnome.org/GNOME/libsoup/-/issues/390

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsoup-2.4/CVE-2025-32049-1.patch        | 229 ++++++++++++++++++
 .../libsoup-2.4/CVE-2025-32049-2.patch        | 131 ++++++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |   2 +
 3 files changed, 362 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
new file mode 100644
index 0000000000..64e87cb1ec
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
@@ -0,0 +1,229 @@
+From c574e659c41c18fad3973bbaa3b3ec75664b3137 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Feb 2026 16:20:02 +0800
+Subject: [PATCH 1/2] websocket: add a way to restrict the total message size
+
+Otherwise a client could send small packages smaller than
+total-incoming-payload-size but still to break the server
+with a big allocation
+
+Fixes: #390
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/db87805ab565d67533dfed2cb409dbfd63c7fdce]
+CVE: CVE-2025-32049
+
+libsoup2 is not maintained, the patch is backported from libsoup3, and
+change accordingly
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-websocket-connection.c | 104 ++++++++++++++++++++++++++--
+ libsoup/soup-websocket-connection.h |   7 ++
+ 2 files changed, 107 insertions(+), 4 deletions(-)
+
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index 9d5f4f8..3dad477 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -85,7 +85,8 @@ enum {
+ 	PROP_STATE,
+ 	PROP_MAX_INCOMING_PAYLOAD_SIZE,
+ 	PROP_KEEPALIVE_INTERVAL,
+-	PROP_EXTENSIONS
++	PROP_EXTENSIONS,
++	PROP_MAX_TOTAL_MESSAGE_SIZE,
+ };
+ 
+ enum {
+@@ -120,6 +121,7 @@ struct _SoupWebsocketConnectionPrivate {
+ 	char *origin;
+ 	char *protocol;
+ 	guint64 max_incoming_payload_size;
++	guint64 max_total_message_size;
+ 	guint keepalive_interval;
+ 
+ 	gushort peer_close_code;
+@@ -152,6 +154,7 @@ struct _SoupWebsocketConnectionPrivate {
+ };
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -664,7 +667,7 @@ bad_data_error_and_close (SoupWebsocketConnection *self)
+ }
+ 
+ static void
+-too_big_error_and_close (SoupWebsocketConnection *self,
++too_big_incoming_payload_error_and_close (SoupWebsocketConnection *self,
+                          guint64 payload_len)
+ {
+ 	GError *error;
+@@ -680,6 +683,23 @@ too_big_error_and_close (SoupWebsocketConnection *self,
+ 	emit_error_and_close (self, error, TRUE);
+ }
+ 
++static void
++too_big_message_error_and_close (SoupWebsocketConnection *self,
++                                 guint64 len)
++{
++	GError *error;
++
++	error = g_error_new_literal (SOUP_WEBSOCKET_ERROR,
++				     SOUP_WEBSOCKET_CLOSE_TOO_BIG,
++				     self->pv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ?
++				     "Received WebSocket payload from the client larger than configured max-total-message-size" :
++				     "Received WebSocket payload from the server larger than configured max-total-message-size");
++	g_debug ("%s received message of size %" G_GUINT64_FORMAT " or greater, but max supported size is %" G_GUINT64_FORMAT,
++	         self->pv->connection_type == SOUP_WEBSOCKET_CONNECTION_SERVER ? "server" : "client",
++	         len, self->pv->max_total_message_size);
++	emit_error_and_close (self, error, TRUE);
++}
++
+ static void
+ close_connection (SoupWebsocketConnection *self,
+                   gushort                  code,
+@@ -913,6 +933,12 @@ process_contents (SoupWebsocketConnection *self,
+ 		switch (pv->message_opcode) {
+ 		case 0x01:
+ 		case 0x02:
++			/* Safety valve */
++			if (pv->max_total_message_size > 0 &&
++			    (pv->message_data->len + payload_len) > pv->max_total_message_size) {
++				too_big_message_error_and_close (self, (pv->message_data->len + payload_len));
++				return;
++			}
+ 			g_byte_array_append (pv->message_data, payload, payload_len);
+ 			break;
+ 		default:
+@@ -1050,7 +1076,7 @@ process_frame (SoupWebsocketConnection *self)
+ 	/* Safety valve */
+ 	if (self->pv->max_incoming_payload_size > 0 &&
+ 	    payload_len >= self->pv->max_incoming_payload_size) {
+-		too_big_error_and_close (self, payload_len);
++		too_big_incoming_payload_error_and_close (self, payload_len);
+ 		return FALSE;
+ 	}
+ 
+@@ -1357,6 +1383,10 @@ soup_websocket_connection_get_property (GObject *object,
+ 		g_value_set_pointer (value, pv->extensions);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		g_value_set_uint64 (value, pv->max_total_message_size);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1410,6 +1440,10 @@ soup_websocket_connection_set_property (GObject *object,
+ 		pv->extensions = g_value_get_pointer (value);
+ 		break;
+ 
++	case PROP_MAX_TOTAL_MESSAGE_SIZE:
++		pv->max_total_message_size = g_value_get_uint64 (value);
++		break;
++
+ 	default:
+ 		G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+ 		break;
+@@ -1631,7 +1665,24 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+                                                                G_PARAM_READWRITE |
+                                                                G_PARAM_CONSTRUCT_ONLY |
+                                                                G_PARAM_STATIC_STRINGS));
+-
++	/**
++	 * SoupWebsocketConnection:max-total-message-size:
++	 *
++	 * The total message size for incoming packets.
++	 *
++	 * The protocol expects or 0 to not limit it.
++	 *
++	 */
++	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE_SIZE,
++					g_param_spec_uint64 ("max-total-message-size",
++					                     "Max total message size",
++					                     "Max total message size ",
++					                     0,
++					                     G_MAXUINT64,
++					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					                     G_PARAM_READWRITE |
++					                     G_PARAM_CONSTRUCT |
++					                     G_PARAM_STATIC_STRINGS));
+ 	/**
+ 	 * SoupWebsocketConnection::message:
+ 	 * @self: the WebSocket
+@@ -2145,6 +2196,51 @@ soup_websocket_connection_set_max_incoming_payload_size (SoupWebsocketConnection
+ 	}
+ }
+ 
++/**
++ * soup_websocket_connection_get_max_total_message_size:
++ * @self: the WebSocket
++ *
++ * Gets the maximum total message size allowed for packets.
++ *
++ * Returns: the maximum total message size.
++ *
++ */
++guint64
++soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *self)
++{
++   SoupWebsocketConnectionPrivate *pv;
++
++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++   pv = self->pv;
++
++   return pv->max_total_message_size;
++}
++
++/**
++ * soup_websocket_connection_set_max_total_message_size:
++ * @self: the WebSocket
++ * @max_total_message_size: the maximum total message size
++ *
++ * Sets the maximum total message size allowed for packets.
++ *
++ * It does not limit the outgoing packet size.
++ *
++ */
++void
++soup_websocket_connection_set_max_total_message_size (SoupWebsocketConnection *self,
++                                                      guint64                  max_total_message_size)
++{
++   SoupWebsocketConnectionPrivate *pv;
++
++   g_return_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self));
++   pv = self->pv;
++
++   if (pv->max_total_message_size != max_total_message_size) {
++       pv->max_total_message_size = max_total_message_size;
++       g_object_notify (G_OBJECT (self), "max-total-message-size");
++   }
++}
++
+ /**
+  * soup_websocket_connection_get_keepalive_interval:
+  * @self: the WebSocket
+diff --git a/libsoup/soup-websocket-connection.h b/libsoup/soup-websocket-connection.h
+index f82d723..d2a60e9 100644
+--- a/libsoup/soup-websocket-connection.h
++++ b/libsoup/soup-websocket-connection.h
+@@ -136,6 +136,13 @@ SOUP_AVAILABLE_IN_2_58
+ void                soup_websocket_connection_set_keepalive_interval (SoupWebsocketConnection *self,
+                                                                       guint                    interval);
+ 
++SOUP_AVAILABLE_IN_2_72
++guint64             soup_websocket_connection_get_max_total_message_size    (SoupWebsocketConnection *self);
++
++SOUP_AVAILABLE_IN_2_72
++void                soup_websocket_connection_set_max_total_message_size    (SoupWebsocketConnection *self,
++                                                                             guint64                  max_total_message_size);
++
+ G_END_DECLS
+ 
+ #endif /* __SOUP_WEBSOCKET_CONNECTION_H__ */
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
new file mode 100644
index 0000000000..f9c894aaec
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
@@ -0,0 +1,131 @@
+From 0bfc66f1082f5d47df99b6fc03f742ef7fa1051e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 5 Feb 2026 17:19:51 +0800
+Subject: [PATCH] Set message size limit in SoupServer rather than 
+ SoupWebsocketConnection
+
+We're not sure about the compatibility implications of having a default
+size limit for clients.
+
+Also not sure whether the server limit is actually set appropriately,
+but there is probably very little server usage of
+SoupWebsocketConnection in the wild, so it's not so likely to break
+things.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/2df34d9544cabdbfdedd3b36f098cf69233b1df7]
+CVE: CVE-2025-32049
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libsoup/soup-server.c               | 24 +++++++++++++++++++-----
+ libsoup/soup-websocket-connection.c | 23 ++++++++++++++++-------
+ 2 files changed, 35 insertions(+), 12 deletions(-)
+
+diff --git a/libsoup/soup-server.c b/libsoup/soup-server.c
+index 63875f3..a3f8597 100644
+--- a/libsoup/soup-server.c
++++ b/libsoup/soup-server.c
+@@ -216,6 +216,16 @@ enum {
+ 
+ G_DEFINE_TYPE_WITH_PRIVATE (SoupServer, soup_server, G_TYPE_OBJECT)
+ 
++/* SoupWebsocketConnection by default limits only maximum packet size. But a
++ * message may consist of multiple packets, so SoupServer additionally restricts
++ * total message size to mitigate denial of service attacks on the server.
++ * SoupWebsocketConnection does not do this by default because I don't know
++ * whether that would or would not cause compatibility problems for websites.
++ *
++ * This size is in bytes and it is arbitrary.
++ */
++#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
++
+ static SoupClientContext *soup_client_context_ref (SoupClientContext *client);
+ static void soup_client_context_unref (SoupClientContext *client);
+ 
+@@ -1445,11 +1455,15 @@ complete_websocket_upgrade (SoupMessage *msg, gpointer user_data)
+ 
+ 	soup_client_context_ref (client);
+ 	stream = soup_client_context_steal_connection (client);
+-	conn = soup_websocket_connection_new_with_extensions (stream, uri,
+-							      SOUP_WEBSOCKET_CONNECTION_SERVER,
+-							      soup_message_headers_get_one (msg->request_headers, "Origin"),
+-							      soup_message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
+-							      handler->websocket_extensions);
++	conn = SOUP_WEBSOCKET_CONNECTION (g_object_new (SOUP_TYPE_WEBSOCKET_CONNECTION,
++						          "io-stream", stream,
++						          "uri", uri,
++						          "connection-type", SOUP_WEBSOCKET_CONNECTION_SERVER,
++						          "origin", soup_message_headers_get_one (msg->request_headers, "Origin"),
++						          "protocol", soup_message_headers_get_one (msg->response_headers, "Sec-WebSocket-Protocol"),
++						          "extensions", handler->websocket_extensions,
++						          "max-total-message-size", (guint64)MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++                                 NULL));
+ 	handler->websocket_extensions = NULL;
+ 	g_object_unref (stream);
+ 	soup_client_context_unref (client);
+diff --git a/libsoup/soup-websocket-connection.c b/libsoup/soup-websocket-connection.c
+index 3dad477..e7fa9b7 100644
+--- a/libsoup/soup-websocket-connection.c
++++ b/libsoup/soup-websocket-connection.c
+@@ -154,7 +154,6 @@ struct _SoupWebsocketConnectionPrivate {
+ };
+ 
+ #define MAX_INCOMING_PAYLOAD_SIZE_DEFAULT   128 * 1024
+-#define MAX_TOTAL_MESSAGE_SIZE_DEFAULT   128 * 1024
+ #define READ_BUFFER_SIZE 1024
+ #define MASK_LENGTH 4
+ 
+@@ -1615,8 +1614,9 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-incoming-payload-size:
+ 	 *
+-	 * The maximum payload size for incoming packets the protocol expects
+-	 * or 0 to not limit it.
++	 * The maximum payload size for incoming packets, or 0 to not limit it.
++	 * Each message may consist of multiple packets, so also refer to
++	 * [property@WebSocketConnection:max-total-message-size].
+ 	 *
+ 	 * Since: 2.56
+ 	 */
+@@ -1668,9 +1668,18 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 	/**
+ 	 * SoupWebsocketConnection:max-total-message-size:
+ 	 *
+-	 * The total message size for incoming packets.
++	 * The maximum size for incoming messages.
++	 * Set to a value to limit the total message size, or 0 to not
++	 * limit it.
+ 	 *
+-	 * The protocol expects or 0 to not limit it.
++	 * [method@Server.add_websocket_handler] will set this to a nonzero
++	 * default value to mitigate denial of service attacks. Clients must
++	 * choose their own default if they need to mitigate denial of service
++	 * attacks. You also need to set your own default if creating your own
++	 * server SoupWebsocketConnection without using SoupServer.
++	 *
++	 * Each message may consist of multiple packets, so also refer to
++	 *[property@WebSocketConnection:max-incoming-payload-size].
+ 	 *
+ 	 */
+ 	g_object_class_install_property (gobject_class, PROP_MAX_TOTAL_MESSAGE_SIZE,
+@@ -1679,7 +1688,7 @@ soup_websocket_connection_class_init (SoupWebsocketConnectionClass *klass)
+ 					                     "Max total message size ",
+ 					                     0,
+ 					                     G_MAXUINT64,
+-					                     MAX_TOTAL_MESSAGE_SIZE_DEFAULT,
++					                     0,
+ 					                     G_PARAM_READWRITE |
+ 					                     G_PARAM_CONSTRUCT |
+ 					                     G_PARAM_STATIC_STRINGS));
+@@ -2210,7 +2219,7 @@ soup_websocket_connection_get_max_total_message_size (SoupWebsocketConnection *s
+ {
+    SoupWebsocketConnectionPrivate *pv;
+ 
+-   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), MAX_TOTAL_MESSAGE_SIZE_DEFAULT);
++   g_return_val_if_fail (SOUP_IS_WEBSOCKET_CONNECTION (self), 0);
+    pv = self->pv;
+ 
+    return pv->max_total_message_size;
+-- 
+2.34.1
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
index 253a389e21..915d735da3 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
@@ -42,6 +42,8 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784.patch \
            file://CVE-2025-4945.patch \
            file://CVE-2025-14523.patch \
+           file://CVE-2025-32049-1.patch \
+           file://CVE-2025-32049-2.patch \
 "
 SRC_URI[sha256sum] = "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a034153df1413fa1d92f13"
 
-- 
2.34.1


