Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813AAC25B79
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 16:17:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.86.1715962654215412022
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 May 2024 09:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=586761ae34=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H6nrSm028905
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:17:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yc4ehuk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:17:33 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 44HGCCms015505
	for <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:17:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yc4ehuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 16:17:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsVCs+lZPgyRi6y8O2kaFQAbd0q+8UarDORxsDzL8HTjyruQEuy1Pu+IRNANnHNuiNyfelpCIl+LwAdD+4qgxpHpvBIn+HiaVC+0RbETE0vTvn6QONdSTH6vkL5vNJS18YR+QHDLxL/g94uyxneZvApDBoW+pImkaltxVIsH19PHEkUvF6pUXlpNMzxbs7cWSoR1hUec1uYU2i9d/gJNcwu5KhxSWc6t5eWdtmPr8eKoU4XrjLv6appxYW/7BCU8CmIucpq9tyHu/6ghwwESpPFWeFEJbgP0vkzjk2+4NM25AGjccbZeYD9tTqZ4h5hcCzy0/GkE3gT5b7rAQ4wsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kWsWY6yBoxBWdbsNBNfoOO4pj6UYEAdpDUg04BOUz4s=;
 b=fC1QPmpJK/CYZkeq0XQogOOzn9WOY8VNq+dE0X7UOFGHh44cvkTMzUM5dTFIHHpMPgC6HpHQlotcuTQcKN1WPHkupgN27CuSThr+NozX6thva2kdaa54kGj885+pXslLZWfyIHt2+1OnSqIlhnku74X6EBs9jT61SC1gKYKYyTNXlQV4YUbhHtKuvASclbjKiYRRs6iGDtSfK+Z5HN9Q0wKCTthyjh/0xiQ48nbePM0IFTIdOLr7CG/xQj8KKH9Lb/4tYyxyw5wRg5Ij8HdfZwabRg8MQ3cIWe8gUoxe/KVcFaFYCdmixyub3mRMcCR2l81fK/H3Kh/+hG05uK+T6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3063.namprd11.prod.outlook.com (2603:10b6:a03:89::11)
 by CO1PR11MB5140.namprd11.prod.outlook.com (2603:10b6:303:9e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.29; Fri, 17 May
 2024 16:17:31 +0000
Received: from BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99]) by BYAPR11MB3063.namprd11.prod.outlook.com
 ([fe80::25e9:e6a:756e:dc99%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 16:17:31 +0000
From: sundeep.kokkonda@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, naveen.gowda@windriver.com,
        shivaprasad.moodalappa@windriver.com, yash.shinde@windriver.com,
        deepthi.hemraj@windriver.com, harish.sadineni@windriver.com,
        umesh.kallapa@windriver.com, steve@sakoman.com
Subject: [PATCH] glibc: stable 2.39 branch updates.
Date: Fri, 17 May 2024 09:17:00 -0700
Message-ID: <20240517161700.3933511-1-sundeep.kokkonda@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::26) To BYAPR11MB3063.namprd11.prod.outlook.com
 (2603:10b6:a03:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3063:EE_|CO1PR11MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: f907839f-fdfd-4e5f-9ff4-08dc768cda34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|1800799015|376005|366007|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mgy96YSaZ6Q+Jjx98Xd8xZKX686UJprub8VtqdvzrDWP8E9OzQCG0k72hhc0?=
 =?us-ascii?Q?DzrU0qPrB2pFq8/S16xQa8mJ0ruPfp5gm11jP45NfINmJhfLmnamdKb5c77j?=
 =?us-ascii?Q?nO/DRtKbxDAOJUjiWIFCjeg2/Gmz1ahQWBylP37fgV2XMUd+/k2P791G4pda?=
 =?us-ascii?Q?fmgX4qhDRo1Z8sAmASfcUoOWitHwGy3QhY7ttvF2uj75Zxe0MGmBwDSWrOwZ?=
 =?us-ascii?Q?HPopHgYPAkBSMm9HatFCwBdoeDc0G7Bsn6wBMvVO92qCsZkKWIb/YPaFrkzH?=
 =?us-ascii?Q?0QDI3+eokZiToQZPjbao7GbBqpJDknL5AnqSaG1OS2/1O5vjeKasiiLyptr3?=
 =?us-ascii?Q?VwFL8LCM/Gb1xjjauBJnCI39+atrPfJYIQWhA0V7BB6cOnDUtAJWFq5l1qZ8?=
 =?us-ascii?Q?BpuZ0501JeKfG51t/uhh4OVvUK1UHOceMiiMWNVqe4MC+2rMiaNOJN1dEL+3?=
 =?us-ascii?Q?b5+QS8lJlIXYAwxT7XZF48kwuVX4LhslMJtFrqN19J80s9vrYEXqjIfeWtNC?=
 =?us-ascii?Q?KcjS6ENF8LqQ98nAa0iDI4+dLMll4M2os8XwegHxTdsQV9hROaShwiyIg4Em?=
 =?us-ascii?Q?E5VWXUY/t4A4DSZkMkdzMhBGHj2T5XoQVdNtLeuHK08/pFO8EWXvBodIJrK3?=
 =?us-ascii?Q?Q5NY1USLEC3hdX7XNCDfxKlGTl5diNkV5s4JMUL1VY6B+rDILjQjqlrzDPfy?=
 =?us-ascii?Q?/mROEt4tBpesdQIxnnjinbEbU+RoyxIdz0kBevv2xlL/+FOSuyX5gveURqaS?=
 =?us-ascii?Q?4aZheP29203OS4h4FbnTmyqPS28wLuyI/r3O6sMjxstEex09pLIMdBZep4UW?=
 =?us-ascii?Q?Op1fnDjUIFrf89cKV7ryNRHLMdnq+GLAlmDTPumdnEZPcd4LOG1fNGrJxKv0?=
 =?us-ascii?Q?oFXMFOs4Bfs61n4MkZYU8gaSkoJK4vIEGPDzG9GrfyrVoqXS3gIdh7gyqcER?=
 =?us-ascii?Q?Sz/G38ydV8brN+LI4hEHZdgj7vSxrzcTcDjQcKwBJRiIA4Gax9yL1PXPubGK?=
 =?us-ascii?Q?lqRAWlYgtKZ8beVLkhEuSwA6CLBAEeB16oWwGPBRUqMvx/kaUm9FYlL6LdGR?=
 =?us-ascii?Q?2nKxvLP4YcnbEmqf7Mt74nD6BWc9TQNoVtten+OhdiGuODXASM2AzoAXLTw+?=
 =?us-ascii?Q?soNhTZeW+sTvv3i9jahvaXSDdnQ0rsG9RBhappxso9aMCmTRXciNBZclcS2B?=
 =?us-ascii?Q?JMqDz75XKVtOTIySohFcldP6nTIOs42XaMXyQn7/9Z5fUc1rKMTPTWufeUqN?=
 =?us-ascii?Q?mjgfsKhiuSUSxVy8yuw2qUQM6UzIZmy25RDy8/YQF4hhuIpsCPuBBOW31bjX?=
 =?us-ascii?Q?FotpfqlnFUPDsFvxHiCxqvmzasgYJxQM8o5QzC7dT6Dtzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3063.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?M2Ts/Tb1/wjtrxoAN6Uy/JB5NhsUB1ldoGNm13kp420ErboErnYZ1DOsvqUc?=
 =?us-ascii?Q?OULD2MfYicimq24/04A8i3eODf3JNBIKEwq+TVoyfp97q44gcHKBpTNqmHp6?=
 =?us-ascii?Q?DuK1IYKCzo24BeQDczgF+QccMd/fz11B9zoDNMwCsLRc7ghnZTrZI10AIDay?=
 =?us-ascii?Q?99HRVsOq5C1JOGPhCiIaeOY4bzL9avKLy2uATjw68lXrFe6FtljHQD4uu7LR?=
 =?us-ascii?Q?37/i6JipAlb0RlpJb41QFfiMA9SkX4T9jy2Lcf80gMpqLHHTXizsz9L2b+Tu?=
 =?us-ascii?Q?HxK68rfiqAVzTL+URwcHblzFVsnnVmFzmwwTruhHrM5KTB1oVvsOvmgkWW7z?=
 =?us-ascii?Q?LPT0cfz53pKsV7iqAdhc/eGnAfgw4WQYigd5S/j89Vtoe3C3WqbpKU/nwoI5?=
 =?us-ascii?Q?gv2K3JUutneYBCXvtJQFN4awUSCJhBw2noYidWLBYMd4YJ4PVN3PLODJbU0D?=
 =?us-ascii?Q?pi2IL9+HdncRr3ZwKTmIf4H7T7Gdl1ss/3n+UrPYGO4XGaay9dkIlxP/ks+8?=
 =?us-ascii?Q?gjcRfn5Dv0fSBNzPdBMIztwjfm/UoSddnKzRKjs0hRotw5ID5Nw9+bEPRzXy?=
 =?us-ascii?Q?KeAz49Yz5CUXlwXh3dGYgSD/JcrO/x2H0PzzonuVbQvB/MpZ2+Shi4wtrwrh?=
 =?us-ascii?Q?E7Zf5ju/Etb3Si7zvlQCwYJeuxsP2705krNu9JJvyub1sQGp5pN46fOX5eu9?=
 =?us-ascii?Q?ht1VDOx1R5ojkbru/AKHIIp7KNkeOtj2o2FsMmCVmoV7MUvdWDzb8DYdYTrh?=
 =?us-ascii?Q?qfbPEmo1KPm6kADAWXHrs8zvtDc6WQ6luXQlkficvcX25rOJ0YVCIOziIWL1?=
 =?us-ascii?Q?CMhEz+/gPGZqPBtT5do2SV73QMkVg91MlLOXmTvzB+jXTEFhyXNloBKannH5?=
 =?us-ascii?Q?x5YvrvCFXrGFIBk1+ICIWe/WFQcDSaojPuGzW0RO7XomPv3RkucChRVoC3Lt?=
 =?us-ascii?Q?1i3RN5/y11yenrvY37Cvgp0nbMNz9kD4GQ+ARZOGMwxtVyqytKvj3QiZN2lu?=
 =?us-ascii?Q?Knrl84mV/BWKnX3zvTIhunZnefxsLzXVfM/cXDJSMPMiUEKDNg3FhlY/PQng?=
 =?us-ascii?Q?6lfJgEkprBvZpxGVF//bli67Im11ljJHhRRyHc6w2MHkF4aPKeQaV/xaazNW?=
 =?us-ascii?Q?Hxcbl8BzhferotlkOIgOlk2Rq1chF40wsqLOEgu2Om559S2fVAcswv/8DgMe?=
 =?us-ascii?Q?Na2qqMldTnCpAYVgJrM02Gukdaq4v6zCPTIM/8QDqCVvMG7AinlbDea4yMZO?=
 =?us-ascii?Q?2AIYZ5WiuQ7kXAH3NkAzuB+6kK5FnvX2VBuXqmamxvFO0SdzcAsMdSpYXVG4?=
 =?us-ascii?Q?KWJVrgNTwuOQVEpu7FlSbnFmBN+D1VUQ2fNDSVjzn9OUpDGl3bAQY86zlUeh?=
 =?us-ascii?Q?EEa/1iWwWKVUcYtufTNanm6lZD2AzGOuOLyLp45++LlpgzHH4FjISQ1CSagE?=
 =?us-ascii?Q?o0BCXZZIlAnIXamPdS6Sj0zfK9+fKuZMgFKHJ4zio7OouIpbolptqzOxKZPN?=
 =?us-ascii?Q?o6C0yjxLrkzraRcaqQc2ztXpWbYcFzOfggvXxwNgqsy0zxTpWfyiVI9UWSQO?=
 =?us-ascii?Q?U1P6+pY/mxa7MVqSKbfab459wseUVvCxzZkgzHEg+YOicE96ZL/zdNuDwT1x?=
 =?us-ascii?Q?+m9N0MNdkd7VdXSTYgVNwvs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f907839f-fdfd-4e5f-9ff4-08dc768cda34
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3063.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 16:17:30.9189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Y7tTZrjnFfJdbQ/xMVR4V6kaHtLv+/hncxAdVQO85Rwh6CDVc4zRBFtUpy/+GHn/pSQG+lEXiBlgBQtIPFmPLtj+QXm6cszoCh6s3ak6CY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5140
X-Proofpoint-GUID: l5bniOgevIBbi8ReHzov-k3i57e2EkLo
X-Proofpoint-ORIG-GUID: dIwpwxBp1I--MfVz82iyqrG_1XmvnBcv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-17_07,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=867
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405170128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 May 2024 16:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199516

From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>

Below commits on glibc-2.39 stable branch are updated.
c7c3f5bf80 LoongArch: Fix undefined `__memset_aligned` reference in ld.so linking.
32969a2b36 socket: Add new test for connect
2db79c96ba libsupport: Add xgetpeername
ab4ef4421f x86_64: Fix missing wcsncat function definition without multiarch (x86-64-v4)
97bb89668d Force DT_RPATH for --enable-hardcoded-path-in-tests
71149c2a2e elf: Only process multiple tunable once (BZ 31686)
f8e4623421 Add a test to check for duplicate definitions in the static library
8b005d7869 i686: Fix multiple definitions of __memmove_chk and __memset_chk
8323a83abd i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk
5141d4d83c Revert "i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk"
c16871e662 Revert "i686: Fix multiple definitions of __memmove_chk and __memset_chk"
fa616ea373 Revert "Add a test to check for duplicate definitions in the static library"
ff110b2591 Add a test to check for duplicate definitions in the static library
ad92c483a4 i686: Fix multiple definitions of __memmove_chk and __memset_chk
3148714ab6 i586: Fix multiple definitions of __memcpy_chk and __mempcpy_chk

Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1e4a323d64..20125e4339 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.39/master"
 PV = "2.39+git"
-SRCREV_glibc ?= "273a835fe7c685cc54266bb8b502787bad5e9bae"
+SRCREV_glibc ?= "c7c3f5bf80ae86b34501f473f1a9fc545c911b7f"
 SRCREV_localedef ?= "fab74f31b3811df543e24b6de47efdf45b538abc"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.43.0


