Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B79FCC6B00
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 06:47:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10046.1775112461942813317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 23:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Iodq49i1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=855281fcfd=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326PhFe3916485
	for <openembedded-core@lists.openembedded.org>; Wed, 1 Apr 2026 23:47:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Lv+7gnuM/
	sDtzZ8z04el65nbvUHfSIgAzF27GqIj4dk=; b=Iodq49i1M3csApzrCradDCf3Q
	nrGgNk2rs7RGzynrLPlV5qsvVGKFs1t3pCMOZqLeCM0yfPHFftYq7gQhR3Y0GUv5
	bE4sTirjw9Gqw4HhtrirFwOGQvKKxb4MPSwE1nRoqSs6Lz6U+oRzJ/VMNcr8g3ZW
	QH1aAlW1thgDeFiwdlD0ThhiPSChJ5fd+56tOQ/n1zALwZnuvIGe2ImwJorOhms0
	R4pxrr/8Iz+t23AEeGrNF4GLraN0xHlYt/MMfR7LD71UciBanAuxAettyvFLYtwc
	kjCCKlFvtXN0sgcu0Ja2hFK33k6lpz5nbr5m6Ss1N/nX863x3yzRRI16cMAgg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012004.outbound.protection.outlook.com [52.101.48.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6a8vf4p3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 23:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvDq+aGyS9I4dxXoTWJGPKszWXqfbZGVjFg28X0eUBFNJadyiVmwhhH10K69OS8LCuOazRAh2A4lBihalPgqYuGpIU4GFrLJqFa3hFBsfs4qYj7t+8VoKiR2832OlRtDECFC9lVQ7xfsc1a8dCt3XTZfgf4ndOrO4H6sS3H4ixkB9HxbwZ+4EAhICPb6oZUUqm0i57MoJUs7pkar/q0QWQ2qx6h5hAV3vAGvl48/Q8X0bVHdq2qWPW2M0PcueApJyALO4/mR4jeMPs5DZELOYrsLEjQlNXTN/Cjw4vQhTtDLVVACCmUCqDId/ccVFn/shPMYJsyZB9XMliG05Y7hsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lv+7gnuM/sDtzZ8z04el65nbvUHfSIgAzF27GqIj4dk=;
 b=U9I3bMvaW3Rf7UW0qreT+byUP8xj0QXINuXibJLsIByjlasXd7KE8xzTTC6rMutULCD7lNgjhXnzxhf/QFj7rO3AJDia61jRN0GNEODS9WFA0zWTIMjwwJJf7a1b2fPS/byvaAb7bOPlLMAGlJOZTT77a19VFM7psjxIpz12Jret8ZVKt/JJ1XqxLm8cnBCxgB3YpFXtU1GvbamoE2gtgvajMeWKL0PjcgQmcVawsrAQHbCcvmmp5TXom3yZI79f25W/5x4vijjBxwaZsrBGrLxF3Kz80o3hvxctG4YpipTj/Vs+FaMVatVIMvJiR1OpmlQEyCClx9yc9TG+oRO32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA3PR11MB8939.namprd11.prod.outlook.com (2603:10b6:208:580::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Thu, 2 Apr 2026 06:47:37 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 06:47:37 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.kumarMD@windriver.com
Subject: [scarthgap][PATCH] unfs3: Fix race issue causing a glibc test hang
Date: Wed,  1 Apr 2026 23:44:43 -0700
Message-ID: <20260402064443.1506368-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0206.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::13) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA3PR11MB8939:EE_
X-MS-Office365-Filtering-Correlation-Id: 05d9d03b-d7bd-471c-fab3-08de9083ba2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	3kcHjkt1agxu5FvICtDoWFFBxzyjFd88l0yObpmnEclRdZNznJZsL18B4FxxJUw4WkbX4jUm3s6Nc3dsolmV+h6eLHkSU+gPUqSBfAMCLjzi49wugct3kOyvS7bEwZHuZX3JlPl8oW1vVMyZU9036Yn5Cvir1tYRrw/4GC/vU5EDHyNO9qOIpdj8XcFGDNGyvn0ufCfoOfnQnJrzuf2HDVpXvRnaZ7gCPTWkCP8/pU9gM7mwoDiA2rVm6NGWeS6zlgHTU82ivPtuQUmJkoyrtKnp9wXILCogJ/ZXJF0SCVzlkWWnY0sp2Ivcqv2wweWc2v311t6MsNfns55m0HJHCX90h1s7Tpp+gqeAYDhtqdbkk3p81l4JkaCBW2VVqN65KC4Xk+Yd0CfJAxePtAafdtBeHo/iiKhgry+MTvrBWDd9OaWbZx0I2Ahj1wtoeOe2tp+8XiOwNNOLK+rhToND770gEBsmAkwbfRcGNdnrSqIQMwu7O5izXOnXwT1jdklrDgmr1/sik1iZWsS0JSaJLveHxPnkHIlcvqB2u2P20S2AnBoOegqxwO51ZMXXE1SLrsvxph7L8cCgpqrFTyYjIFNJnTsm1LTZrTEaqoSniN9DtafY8Z5eI0zo+RsQaBDCLRICci2bJh72iVUN8yQhGMgsU49yF7d6iGpJDaIy4eubCTHsYQ8fNWlns7E6q6ggXunlcODHTbkJoWD4YWsRah4aOwTpdr2tbhkZ+qJM+Kxfb5VfW0WXLYobcOuNmwNwwJ/AWQLfqBmSfv4a3kQa1ma0XLGG/0WD+R2rTuJC0vw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Pta5PHvFfSCIBkXRw/HWqWgYzgvlOFlHV05OE/+vQFZS7W0IIN7nkwly+Gg?=
 =?us-ascii?Q?OpFcoLHC1dKgS4HE1FwzdaSIJeKtzcCuRl7xJ82Coc+/ziXdBYoWcuxH0TeX?=
 =?us-ascii?Q?EBAKNLys1r7mGDt8vl7uPlVw7h/Bs1u5FdHHxGsHyJfkvq4gnNyzpW8fMNum?=
 =?us-ascii?Q?vTUFISpnPA5LVzHy//BNYBSaRekj22CQv2bv+YpH4Cjy9DX4B6E44wNQVDEV?=
 =?us-ascii?Q?/F3j6yu1bU2gklYvBdvQZdL2qnN7Nbnre5KPUcLrx33W/g7n7YgnWlMyrD8O?=
 =?us-ascii?Q?Ty5eoJH93ntAwfJ1Z56TRtOi//SRY016csx7Ig5wzCW6FETKeRdTR6t+epO6?=
 =?us-ascii?Q?O29YfCKJWKkTyG0EzTQek56h6IQrdTAUDhOe9rPXlisG2MlaMe2YXKT6O50h?=
 =?us-ascii?Q?6+La2fukV7v4U9uzMV2+rlitiow8kpWxETsm2G2NsQGj/dQFnS5I+jAc6n/q?=
 =?us-ascii?Q?jZXpQYv6CR8cy+Aay2MdqFZ3SC6pgV2mPaHWecNK/k7Mw8NGyP8fSNMEJuBI?=
 =?us-ascii?Q?2Be7bqnZTZSwRMq90YZQ8BgPU5UUxnzFJsObEu49s9l/ga/Hl+sPNxguD0Ty?=
 =?us-ascii?Q?YFOekmZD58RixXH1QzqymCEA5ZtVcAjWZrkyhZQv+jPLzugT1Tr1MF6ysYmE?=
 =?us-ascii?Q?5DUD6hklg4nQUKpi7oJ8mKvSQpKVz2Bq3h4ACSNrIp7l9yFBCpa9CfQRKpYu?=
 =?us-ascii?Q?B1ovk1vcSqhh/WVyVA0Gj3unkKLLBRTsThX3UKn7dJtbtCnwUFurk0oPUATP?=
 =?us-ascii?Q?yo+iJ1YuXLG7OJMP7QkDb/ThRnXF0oWDuzovwJ8QZBMAzCbz9Pqk0EagNmnH?=
 =?us-ascii?Q?YEDhCwgyKAQ4vxv2fZzz+2xIRq5+/DOPugNsgv640fM1tFiIB92tQ4u7MkB8?=
 =?us-ascii?Q?lnLy4D1ZlFjswAU+twb9jS9MXfiNAjW1rl/gWe/TLyJ/sisp2E2i2dGoGvzZ?=
 =?us-ascii?Q?iC847QihW3JPNfelA1MmK1RNkMzzXrw4BEhrbrN63udgTXjssuriZOE/V6FF?=
 =?us-ascii?Q?LIX++vWYz4bQYW9HGOXaBe6DALRKt4ddr/Hy1DeOgLkhV/rSvp5wA9KdEfuD?=
 =?us-ascii?Q?DhGyPCoHt3iwpVcOBcxLtbygq09IVjRGAszTQem6JrlRHEts9tbnGN2HTPwP?=
 =?us-ascii?Q?TLnrNDC9kaRKnaKaQfJrrEW+JqaAcQ1RmDG1SS67BMxyy1HANVBzWbp6QoGx?=
 =?us-ascii?Q?vE0W3blxW9c6EEqLFAkDLnbzkQmduFF5ku2nfHAwaogIdZ7Bdc25fS+pg8Ca?=
 =?us-ascii?Q?Ci+gehhsKiHXmagiWBoUcCJcyXR+OT/9Sn0Lx20pvZrR+OMVBf81CgiNljcx?=
 =?us-ascii?Q?moGDtQ4+NzzsEVCSiEJtvX4KkplWhzRXpHSyytmLywARbhFrxePQ7NspTK/O?=
 =?us-ascii?Q?DWl+FytYSRaiF7Dje+d0pT7U086ExVEtXm+0xBFhYhgNwQnMUG2/0Shfh7fn?=
 =?us-ascii?Q?pe5rG1v9su/vIHDAaw/g8j8hQCMXhFrr0a7nSYPZKS8ogKge3KHGUPc+YU+Q?=
 =?us-ascii?Q?/DLldSh/H5/IT+l+BktNQSZWPo5z/ZVuK3+Lk1pAkFMFrUV7qsx6iYgKd89B?=
 =?us-ascii?Q?nzW28ZZF34DL+ZM61eVNkBSVbROre1UybEmPKwz7jbQ83Uy9fnJZ2naoROBv?=
 =?us-ascii?Q?sV9xTuXr5MFM8jy6hCgIMtVfeDDyipYc+i77bDCQtPi9xrrZOSnFGa+pWXzV?=
 =?us-ascii?Q?fJmsjQTd3Cml1mc1CN/FhhJD2m5/FWJURMJVwQDWXCzsekeVrZ9i4tjWo90K?=
 =?us-ascii?Q?qvQK2y5Dueww5aH5SUpCjExtnmVZ6cQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	EQlnGXseqD7pUChXX369Ey1MtEArseCsIXdbEU/1Wv05akh05VUW7J8rpk0xpfdPBQ1DSj6RArNT4pzQGqK/yKo7sciRMjLfvSVGX/ibw6+fXtKPx/HcMyukna3GM4y4tMEyekB2luWiNh9SLKx9UsGnixIwPThVzigB37NizEnBk3wP2ooF5nw1NS4MUxGpYUr7h3Q9TsfmPu23uYuIyOdOMpU1GDkr6RzDCTN0yIBGfLTXGsNYB4rSZjB8SuyF+ookQH2NFAy4v3lq0a76gcV2bQbhs89M22pOv+A65L5IUmGGpPSgHau6NDWHJnbeuvf/YCsdUU26NIpIz3PHKQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05d9d03b-d7bd-471c-fab3-08de9083ba2d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 06:47:37.5277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IepZ8NhlgUqiUuuEKAaLLmYjQUzxyoT1kZthRzrvqajRLDT5t/PXAofoG8ROvejppLyirugLWzfTHclWX7zW3LL7qH4Rty8Rqayze5tidbA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8939
X-Proofpoint-GUID: mVcuru3_ykNVyBxcmifKndXxMivySaWD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1OCBTYWx0ZWRfXyMu9J2wGhAHz
 tMe9W/LGKDg0ccVTseztqk/1niFmAGz2k2b1+wmEEGO9IcNAFHMHWjKwM+2pUL4iRO1RCuQ9ob9
 TpjlDx4mPEHDDT6+TCGvR1OYc5Trjubj0V0MpBSmsx0LJbGvYJAKWlzS+ISqLuWZp21xk+0p7Q9
 z+lPSwHdQ1zrRYJh1+6i1Su10J/X32YGFLJ3AioMBqSidZTLmNKBRJzGFpXu9Ol9XApuRXQryMy
 KoK+24nWGj96refZqkxOxoQtvqoivZsl+YH8pBz5I+f4euUxW+ijwp78DueP7KYehwltEH6lrXj
 Xm+JdbzKqKE2izuL5XFcZf3PDGU62o8g64p4jyQEOMxx50Ez7oQQU0oj5sNjpSG7lUcF2uqbBcB
 AcrHfId07L5eua9zAJV0+yS/3F2aecJ5/G7WIbtNDmWyI3XZzUqUNJWfzh6+snSdPB7mCxLLvoR
 kM0cG2RoU0NTOE0deYQ==
X-Proofpoint-ORIG-GUID: mVcuru3_ykNVyBxcmifKndXxMivySaWD
X-Authority-Analysis: v=2.4 cv=ZKHaWH7b c=1 sm=1 tr=0 ts=69ce110d cx=c_pps
 a=2pTyoxkMaluYXS6DGsynPQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=ag1SF4gXAAAA:8 a=NEAV23lmAAAA:8 a=oNTXYZ8t8MtPCu0ktUMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 06:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234489

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

When running glibc tests under user mode NFS, tst-syslog was causing a hang. The
hang was traced to unfsd exitting with a buffer overflow being detected.

This was traced down to mksocket() where we'd see:

socket path '/media/build/poky/build/build-st-2118464/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/build-x86_64-poky-linux/testroot.root/dev/log' is too long at 141 vs 108

There is a length check in mknod_args() but obj may not be setup at this point by
cat_name() since the functions can be executed out of order according to C.

To avoid this, make the order explict. This means the length is checked and we
avoid the buffer overflow. This will likely cause the glibc test to fail however
it won't hang, which is a win.

[YOCTO #16113]

(From OE-Core rev: e51d5e19cb1ba1d5ad7442064b64821d178bc9ca)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 .../unfs3/unfs3/fixrace.patch                 | 35 +++++++++++++++++++
 meta/recipes-devtools/unfs3/unfs3_git.bb      |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/unfs3/unfs3/fixrace.patch

diff --git a/meta/recipes-devtools/unfs3/unfs3/fixrace.patch b/meta/recipes-devtools/unfs3/unfs3/fixrace.patch
new file mode 100644
index 0000000000..2a659f5bc6
--- /dev/null
+++ b/meta/recipes-devtools/unfs3/unfs3/fixrace.patch
@@ -0,0 +1,35 @@
+When running glibc tests under user mode NFS, tst-syslog was causing a hang. The
+hang was traced to unfsd exitting with a buffer overflow being detected.
+
+This was traced down to mksocket() where we'd see:
+
+socket path '/media/build/poky/build/build-st-2118464/tmp/work/x86-64-v3-poky-linux/glibc-testsuite/2.42+git/build-x86_64-poky-linux/testroot.root/dev/log' is too long at 141 vs 108
+
+There is a length check in mknod_args() but obj may not be setup at this point by
+cat_name() since the functions can be executed out of order according to C.
+
+To avoid this, make the order explict. This means the length is checked and we
+avoid the buffer overflow. This will likely cause the glibc test to fail however
+it won't hang, which is a win.
+
+Upstream-Status: Pending
+
+diff --git a/nfs.c b/nfs.c
+index 3e92f87..784089a 100644
+--- a/nfs.c
++++ b/nfs.c
+@@ -776,9 +776,11 @@ MKNOD3res *nfsproc3_mknod_3_svc(MKNOD3args * argp, struct svc_req * rqstp)
+ 
+     PREP(path, argp->where.dir);
+     pre = get_pre_cached();
+-    result.status =
+-	join3(cat_name(path, argp->where.name, obj),
+-	      mknod_args(argp->what, obj, &new_mode, &dev), exports_rw());
++    result.status = cat_name(path, argp->where.name, obj);
++    if (result.status == NFS3_OK)
++        result.status = mknod_args(argp->what, obj, &new_mode, &dev);
++    if (result.status == NFS3_OK)
++        result.status = exports_rw();
+ 
+     cluster_create(obj, rqstp, &result.status);
+ 
diff --git a/meta/recipes-devtools/unfs3/unfs3_git.bb b/meta/recipes-devtools/unfs3/unfs3_git.bb
index c5b7898b3c..50d5cd272f 100644
--- a/meta/recipes-devtools/unfs3/unfs3_git.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_git.bb
@@ -18,6 +18,7 @@ SRC_URI = "git://github.com/unfs3/unfs3.git;protocol=https;branch=master \
            file://0001-locate.c-Include-attr.h.patch \
            file://0001-fix-building-on-macOS.patch \
            file://0001-attr-fix-utime-for-symlink.patch \
+           file://fixrace.patch \
            "
 SRCREV = "c8f2d2cd4529955419bad0e163f88d47ff176b8d"
 UPSTREAM_CHECK_GITTAGREGEX = "unfs3\-(?P<pver>\d+(\.\d+)+)"
-- 
2.49.0


