Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42659CD5BA3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16409.1779175557824147148
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=lE7j547c;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F40H3123077
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=; b=
	lE7j547cSwQ+UaICP5xyUDRT5bUuUsVf1Sj2VnlQN48HnyGV8fc73SLHpevDWHiH
	nG1EBOnbkt/bwls1nKooey79y/lN+u7vTQIE8PdGHfB9MecfhAel3UjHdZ1GSjOt
	g4y7iLysz+o21KbYr8FXTdtDwZ3J4vTxkKjHAb3zWHJ+46kXm68ZcS8NKSr4lzGq
	ogbzvkp12y8z55j0C/b/N8Fna+eyqs5LVDLBrVrCz5QhzEycbm+0+nzuEr/ZSjRj
	VlgXXKDhpHaB8xIK0d8RL4tg1Pq4RWxenloBc17oH4wd0/bNqreEsQrzKVHjKxOV
	WxVCl6UnhXsrz/hHegEiUA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf37vq-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=id2RHqdidMwgsBft+c3BPMd6wdOCaX33dGNFhAOQ8/BJvEoeSgFQtr5PtCrXewY5R3+6zgro4uw719OkupeD74Jf86djzPv1C8A/x5VfIrEM0186BIpwozlh622wjQabdM4j5U2S8k5OV3uopQANI9qXqsXZAV0i6KFqv2uf7+ryxITPeantp+DACglmGXPZQMRhUTsqekA8CDTcEz4tShe61d4Q/QntKTjcwnw4SDC7ps2LNJboc4PpKJvizye8XiEzMN/QWeH4/610fReGID2U+Femp7QRjJwerCI7vxqj7uQxURA/OTompTCSn8T77xD1uOdVQFde25q9KnS1Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=;
 b=HBW3mTHKmcxXCTWkW79KEXZeRjVOdiABfsoN57cJ7NSTkgCxI70xnvBt9XUgXIb4iN5Mz0MZi+r+3nkwQVD8Sq8HRmO3i4J9UY3A5G38DgbquPu+FQTxPyKW8Bwwag4RH8lFWgS2/1LvPk/jigAN8QbShNOWyTthGrvntVY41l8zXu/yK46hVY82eZ4AnHQo9UduPajWSBuDEqmYk0DQ2AZd/TKNJXVWwrju9Y7bz1tP88ToyBq4CzrP1rCGlqJhCM2uVtt1eiCfblEuQ/yICcb3soiNUbKxnwGArzyt8Jtkeui/rGTCuNabbf+u56JRIbPvRjKmRWhb1D0ikecdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 07:25:51 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:51 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 05/12] gcc-runtime: disable automatic libatomic linking during build
Date: Tue, 19 May 2026 00:25:27 -0700
Message-ID: <20260519072534.24588-6-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: 110f80bb-1631-44b6-2239-08deb577db08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|38350700014|22082099003|11063799003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	zaf+0PXVhhxPFWqwOdyXPwgD///bfkbPaSwCp64bdqycPObuH1CSl5e7NohEzCrkD5jGGy/G/9yvKZHLHidCnOI1+bGoloZrPHdaB9KwuQnvA/6vNRDrPfx5zgUtQxYvszF+4yGSANKq42LxwcmVy1A9EAkUynDHa5SFBTM1IFD7d1xkBIv59/XLmLLRVe2PJwrgutgo3Od+fFtmBDxmxbULRtB0RHXthU7Z+zbsROHO7+HWlLnHlLAjCa0y0sTMVrItqfzub2rOwE1U2cdmLQC8eLPoQgbILYjMwMjiCTmosmtfjLvI1dxtdWSUwpOFAyN38shSyzuxCMBdLdPe2mE9bqbVbEpXhgQF/FB7LpJ4P9hN/M4+qdUgTxHPboLRn4brbp10SCW9ThwxqjdSAIb2B/v1zCwCFrO2fLddrTwBZae2MXVlxbv4cpXQ/5q3uIUURfEAwGmHDdptn5Gm52A3qvXnWnMQDK+4HvybKzz4o0OePXoDNu/xjurfzOaG7lz1Zqu1aK97VdDymGXa3e8iJmK6y4+fj9N3xFvi0h0OtdT4/lXZquOW/n75OP3HGqkDIBrGvWGXd05MCG0gGCQPW1onB2mSnwfNdh1wemy7qUy9qVMzYZGWjQUNqGEr1/aWR6GOM5uwI3msIyuBuul0HJNRCcLklXGLROAnFLVqqeusrhna+7zzHcQ+BiCnPycgrHUQH+Qjt+bQDo0YiwkxRlVRXvQF1lxNTFaIHV7vlXIB7jCU80VNQUlk7JmH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(38350700014)(22082099003)(11063799003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HPSbxb9DkAQZqThXauacsRIb2PhuDosB+taPTJM2yxtGkW9HFrYGLiKFY4nF?=
 =?us-ascii?Q?wpYWCABq9UXxUq0oWZ7ChaV9pvUUBKUalpZqFr+gfqjKAHNHqH93C45QQiab?=
 =?us-ascii?Q?w1xG53E6WkxlFZxpxTiQLUugvRttwFi9I7sH/ZdVaStk2PwJwTj7u980F6xk?=
 =?us-ascii?Q?J7Imp/JRAVdgia6ML42cbYlLrcnPXaG2gm+MvwjV2glUK6zsTcH1vOc25SCl?=
 =?us-ascii?Q?FY6VzbqcGTtla9YwQ3L0f+pvJQxEswMUNdvq6CKQe8FcLa8/7vADVEMO02jK?=
 =?us-ascii?Q?I2hVQpPIyH5R7E2OTipo7lsrSITUNjORcYhz2YLwjNQRwY3+DtnVco8g6Tjt?=
 =?us-ascii?Q?3cCgAJYi6/dcQ1asvPuYUccIEJLJfzhXOS+ww+/HH11JPAexa2EVygG+sr56?=
 =?us-ascii?Q?zoWxvEKAPBja/BkFLHNJ3jID6ok4AXTrVXhxxuFXXsT6xTeFkLI9EFMbdwJi?=
 =?us-ascii?Q?cE4QpppjnZqMsYSvmEGN556bm/OVrZupOIsCj4IQxlfYqzpXZTUvcHROyTcr?=
 =?us-ascii?Q?U3PrwiQ5TqpmtwtmiGB/Jf6zk50qegr8PEeCNISivJSjgzY4wm+/tHlH8ci3?=
 =?us-ascii?Q?HiG3rsFNUaBnZuNnRhDIjxXHLlwRnzIfxgWbSyHYdD2v8Q0PLRJvqK0Jgh2e?=
 =?us-ascii?Q?IkeX33Pey6XM0xkdvQAC6NkanbBEqy7ULdvbUC/ck0Bo79lyAB0IUGPj2fUP?=
 =?us-ascii?Q?EIo04DLb8V2vlkAxsz4zlj544aPN/H+fwLdT90sFrP00JHk5vMYXCxMayYJc?=
 =?us-ascii?Q?m6XB0/rn79YZVNlGpDu9znumE4jUrSMsKRwh/mUr8rWuRofJ8xq7DevWoPbi?=
 =?us-ascii?Q?thG77lE0CtSSPvj2JxTGZzcrEBhHqkAKRHnIZCvpMhgw5LUds64OFS3sKnrG?=
 =?us-ascii?Q?33o4+x3jeAwItULoa9+q98zdPe7h44HyyzcTrja4GQMF9DTZu21qOBzapUbe?=
 =?us-ascii?Q?Rga22tA+onlJXC+5GrAYN3gzHpk1ay5GbMVuVp8MkruPGvhuKe9f9C1RW+/8?=
 =?us-ascii?Q?KeQBp6dSVxOJqN3LHSV3kbLNHMkKu90X+9aj1qQ6a9LwFjW7s2UOWuCcl6ci?=
 =?us-ascii?Q?U95SSEutScAWaRwLA50L9t/tUPmMq91JmVYBOgwIsJiiVFN9mnA2542rOVDa?=
 =?us-ascii?Q?HFhkKRw2E8aOEniVdRSnynzTi0lQ2rm3xZ2Vpdr+9Wb5HZbB5HFQrS0o6HyW?=
 =?us-ascii?Q?Cj1BIPROFSHG8fUn3+gVTwt/8aINisYo+E2UGH1GyTIBVqONIh5Rc2lhfFY2?=
 =?us-ascii?Q?whBshIJKkC7M121vmL7aMu577GArFWkqz8rl9wWgmRYtaOoJ5pCrcU78tRWi?=
 =?us-ascii?Q?NojDd6tza5iJHSJRTYH3xlplaLy7Oh8OFaB8HroMwHz/kckEcTci2JeTYu6V?=
 =?us-ascii?Q?ezIvcdvKAOdfAnvjchpV82wjv1iUWJY5wkQ2G0Kej0FYZPfp1+/nfFRAXBOy?=
 =?us-ascii?Q?AsUKFUQs5+VKSDBM115k1zpn9lHDBzOjsSEoifdWahas6/Aykk/nSgbMwbw6?=
 =?us-ascii?Q?j0IsjbgboobbxDffepiMwZ+kYZGylqce5fM7pngAonygbg7yrDNb5maj3rMH?=
 =?us-ascii?Q?U0I3caqqPmO+VTOYgUL6wyWRwhZbxSIAzqSbOwFzqwev4uZz32e1V0zGlJgQ?=
 =?us-ascii?Q?DEs9VXL0suOgRRKGY8W5HpZc6VUHP5FnyCF+FytoSOP4o+nVdOkeGJrUcvuR?=
 =?us-ascii?Q?Xl94HLqfiGDbnEPIRJFud+pGu36kYqDfDMF7wMz0ak5SJF65bbUBsy+if4gv?=
 =?us-ascii?Q?D2dBITQn6q980wKtI8GRshYjYT/mKoo=3D?=
X-Exchange-RoutingPolicyChecked: 
	K1YESWZUxf97iHgHSQFRfpyBM14lJAp2Fuz199ZLFNR/km/D232/0C9G+i7oer74fDNnsOYnNwHk1XolIznzLjwzerEI1ItYg864mGYSh8G3+WR3DHUdqnk1RvLYsc9bfvwuwU9aZ42DKu9uu8tO4jQcVE3eQBy8VuRgWby2Fimqz8lbvmJ1Suv0kdVxLtgWuXYw/ByNf0uiInCiAt5GB3WknzgeT9RTEx7BFfbAg4v9i0rGFfuM4KyG5CIFwv+Tq0kC2vdD2jqpal5s8lpuHDH8rajUmoSAxY3OInRGrWcnn1lCTS/Gq+33YlKAUFWi16x0Lq6exMOKO1S5vL8nMA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 110f80bb-1631-44b6-2239-08deb577db08
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:51.5009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LVm6Zu1VRhPZbYKD4ASUB5drAH8A4bjpg/mZBJU1qBK2QpLSyH3zwodM1kaREbX0H9mre+HDUrezL2fRFQBoZDhPc0MkjA+GP5SNN2t2vas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
X-Proofpoint-ORIG-GUID: DfIeR9fiN72THRmyTkUqdBGo1UzuBgUK
X-Proofpoint-GUID: DfIeR9fiN72THRmyTkUqdBGo1UzuBgUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX1HKqPYen1ZAD
 53gzKJ9o/BzLgiiKWBXGFltBgvV9eIEkU/n/CpsC99LlxGIBtyhevADxpiu9j9pY8ISJHVYNLK/
 xkIGeoEIx8WDUbNCNM8GJRFiM2CGmFEDIKY8clTSB7c1F0MUteFvuac7GR0amvikwjihGxnblGT
 2Qd79Hh3MkvJqo4OkkaPq3o6FTE7Q/ovMBZ8hODl14Rr6ZxeG9laLNcGgIdLJNuZoKnY79teZXw
 BnKTx7PFF0s1AtBBMe2y7zlzMFon4faofq+uybvssYJ/A8fF5cFzzYf0kblgPy7TqNSB4djl/i4
 38ggGNFPP9y4FK4CiLHvrnt8HJ73Csfy/J6V7E8/s/bnVeWf23gvbpQ+dqTnsKav6pnvbTylkqh
 bGlbRMZv9l2cx0AEq/GUbTifmifb1ajgXe9dW7uD7oUOw7TRbknz0MkwL8CP0YGMeyWoNTTNJY+
 59dFviTl6aSXxwxUGkg==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0c1081 cx=c_pps
 a=Qv0FdJiMAyQkWbHkl99ofg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=0SpPGjiuViyywlX_MzsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237283

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
During gcc-runtime do_compile, OE uses a pre-built GCC 16
cross-compiler to build target runtime libraries before libatomic
itself is ready.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ef38cff58a..d975153bc2 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -15,6 +15,9 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+TARGET_CC_ARCH += "-fno-link-libatomic"
+SDK_CC_ARCH += "-fno-link-libatomic"
+
 EXTRA_OECONF:append:linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF:append = " --cache-file=${B}/config.cache"
 EXTRA_OECONF:append:libc-newlib = " --with-newlib --with-target-subdir"
-- 
2.49.0


