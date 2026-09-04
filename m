Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1955C624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 06:50:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8326.1788504624778317918
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 23:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A0omdM9n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=37074d364f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68465GHr576096
	for <openembedded-core@lists.openembedded.org>; Thu, 3 Sep 2026 23:50:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=rQf+wQWX0
	8cbnQnevz0Ov0tX/KU2sIuqxo2jy+JsASg=; b=A0omdM9n8+qGfZOoOCFadvcrI
	sIeZBFR6bd5h3ZdKpNK+hw35lbqXUW42mQ5B2nloPwg6iTlGJBGvFHkddl07nWnt
	caOwLUHDXZqUCu6akTrvl+LIGsVTEV4471GisSuN0hwpQbe8DIht1/duewrnwHY/
	7cE+LXANRt9Md2jkGW6TjLpOIcbme+SGT7QG9eNIDlqVijr0K2+L85XOJY3ageVH
	PoqauteyiPGgpACshS6YaE3K9JOjtlTjBM1Jx45irQLUzoraqLSSjFUx2591A87w
	rrHo7BGAYxO1rJdkX5vF72/+wMBQeSb+XUvZzfTTomWTxK4ARluNmM73qTk+A==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022095.outbound.protection.outlook.com [40.93.195.95])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gf5qshxqa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 23:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ed2q8wldSp7LACR3Fq8EPB49SmKozUYR07MIv7WaMdNkGhH24QXCWGRK9KgcS0ZfE4nnOCYcro0Mi0SwZe3SxqMA7TdEy45rmPBxgR3u/r5lnOewKWZOgPeaRn85POB2eoE/W3eKBH0YiycVniS/+v1Q857kjmevQ/sxphIms+/xET+g+senlDTL4xlhcJVoenkM0gRRHcvORNtPpn9bnZ3kprgnT71HprLEEDN8SvhnE7hOfWS/yt833U653/i5LElocTu8SXgZLxrYICGOGnL9szJvZpWwByE46ZhI4REQ4dMoYTAs9DzOwiZb2LIXUzbnZS1xmjZ2GgQmeyc11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rQf+wQWX08cbnQnevz0Ov0tX/KU2sIuqxo2jy+JsASg=;
 b=B44tWQVDIsAsHA1SZ6ivtsbsvAukFcMzvvOsOThJSROCcSAoQLaLWFPikQZN5c7x4JAx4syrqZRhGpbCVlnuUPbjG4ql8sUUhuQi7ZYARzirBBG8jWS9gJQXnm8URFRdUmYWbbAa9q4XM5WOa1KNlq/vSdWtgaKrl+cdXmuquBzfZ455y3Dp/7v1uMdxYZ6zwf0bpjJ7b5u7UedNF8+gu75OCm9ebHOBE9yBnZti/v6wdmyMt93gCedDyN2LZimYD108Z+y5PTg0rjA3kklk1KbUKkKQYW/473kFhDmBUgbCzApWuAQntBlFUmM/sVi4A1OebBGQ/tzIaF1fx22XEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 CH3PR11MB343702.namprd11.prod.outlook.com (2603:10b6:610:366::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 06:50:20 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:50:20 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com
Subject: [wrynose][PATCH] glibc: stable 2.43 branch updates
Date: Thu,  3 Sep 2026 23:50:00 -0700
Message-ID: <20260904065001.674758-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|CH3PR11MB343702:EE_
X-MS-Office365-Filtering-Correlation-Id: 82150bdf-7694-4027-dc03-08df0a50c950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|23010399003|38350700014|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SyXw7U0I7k/BqatdSC3uUqHFaHaixR/caJx9WeLpvxaF/QqbFgfdnesNqVsriv+UKdcVr6stqAC7JtKMu/afT2BLGtlMfyFRlmmJluqGoF8tmldG4H33jlgrbMNQG/PN2L95ngvUNs9+Wgn0AK+IFMfrYiVl0cA2QBfYdWwSrnvlEWPbibu13F4PAHF/W7+dQp+wHUd0qf/VocpDugg+fdS40k9mFfvSEKh+M/HxcKMliqVJyc8qaf9x18AOhNYewLqvRI6p63YLMq63kVjNqpgB13wpbNllJJVXgQ+mDDt+7tz8rJuXaxTVeePpkVJETHxaHEbGJ5zff/FNLOfOvP+zm+TGoFvwDG3ZYXkQFcesQZ+O99fGEpJkc9rM507gKToq8uwzeGK+KLTZrOXkF+3TXGUlvmhOCB/KEbRk6Onk3I39/m3etPa6ukwp9ObrFSlvrmlecDexwuf0dGcKCoXV0DmQFrlA/cA5qOoTa+NKVAbxZ/VzKvj/WYndsZlU1aZ3MBWTmi84yhp1OaxRH/6ClsdiiRK6g4cF8Ezl3YGalfLIuajBXneu8DojJyd3KoRzpEqP3vwjCo8/rgE+GWg/4t9K0RyVaVJtmY9Xj7qs0S60/sxr4B2kLMwTTZxWE88zNwBK1Cssru39h4P4bYY1s4fnyLcqHLOXHT078q1LsacaFEFr1YSP1hV1llmS7Q3UsK2lWNk6BlsyV5coB848YYii9an+ZKgo9nBGPZU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(23010399003)(38350700014)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MA4YfQ52aLSPM4ig9WongAc+AQUIZ0eNJ8Yq5k03i+B+HkvKDd33im0oFuOA?=
 =?us-ascii?Q?pO7wsE3cF425ohFlRDStEEEANdqKkWqZRvTbf2zpjmuro8fdkfybdB73v7v7?=
 =?us-ascii?Q?v0AgY07wmtjsYGOuiToKm2D/z110rgZHdHa5xfSysTVOlWdXnDh5AxIswfCy?=
 =?us-ascii?Q?O/ccceW6AR7h/eazFVrpEMZ2sB5Hu8t+Dh0o33W5+CeZ9UXKhrbqPXKmEgkv?=
 =?us-ascii?Q?1B8PzoCxq3iLqWSGOHAVzaNUaQZdBize5sd9Px36YrGjz3uN3umXIXPYMIyE?=
 =?us-ascii?Q?Tc59AUh8zr667pRHFPIupNy6jgpxRsnd3TTDZDhfr1LBos1z+odzqQXhiTL/?=
 =?us-ascii?Q?YXTn7jUXbbUh374qwkubxlgIXmLdNaHQH232KF0dghnPgKeAzgGbAinLwIyp?=
 =?us-ascii?Q?7HdMDIqwD8ZVW/+gSRQFsOBB8Q4SYVF+Mn7bGnOnwRW+ZNiKh03ckIM+0G58?=
 =?us-ascii?Q?Cg+k2C3pSXvOrkbfvcWvKh9JaJL+57VkpUlCUkeKljVkIprnvcEm8x/VS3ad?=
 =?us-ascii?Q?dNGnucmmHJpHozNMCqfpqFN19hv5jR1BMetkusxoGJaZkDgFdmBpNLFkDmDu?=
 =?us-ascii?Q?1H/lyl+TdavwdncDq7YMVtfVNKObJv57NiwFwkRTQUR4loCtkUXdITVdGHU4?=
 =?us-ascii?Q?nrZHs0pTu6/2Tfx+No0yACEZxEWY5W99LKXzhn2K35Xp4ZmeN8tCmfNSV660?=
 =?us-ascii?Q?wt7+q/OoHa+PlvmSxyvRNNy6kCjs2o7uOof52x6paYBx4Xs6/E6PNerHBXOk?=
 =?us-ascii?Q?gr+2ztobfublz2EaxH2k7rd2GxNo67pUoJxCTsQXNy+7Pk3r/f5X2N1ckw7a?=
 =?us-ascii?Q?ogC4rN17Y/mHfVD0dg++J6zJRMOu3aAS3Kc4Zwi/hia4+Hi6/Q22oi1Vckqd?=
 =?us-ascii?Q?vS4e1pQOCYocDCYLA8oCvJP6opMBD2RlctPIo+ZymjisnoFHfrTtjVrf2Ncw?=
 =?us-ascii?Q?ltjj/kWQDFTKGvgNA07LcztOnRcAUyfAOXoXz6n3yKng/qCMdM5/y3tlMSwK?=
 =?us-ascii?Q?dxBSr+u8q+ZZRHQVOOBFwXEb/nM0C7jO09waE3ILwbX4n6lVtDUxqn0sfdmH?=
 =?us-ascii?Q?tvLfemOe0sWKsYM2hB29pJjn/rJTBhZetVBT/DsvjU5kiCcLfJbILHjDtkB9?=
 =?us-ascii?Q?5aV0Y3zsUcpdFLWiSW2K3rW5NR/XWeh7vpWfnsXYzP7Ck93pRwb/k/4QSUHX?=
 =?us-ascii?Q?H6pD6ONpA2fs4y3p+KBR0WVFC3208aRCHiO2Z88FJBLtG7GYEiMGjpHH7t2j?=
 =?us-ascii?Q?0urW/7deNNFLBDftYC7QrmpMdaoWRtsvYAfDuy7CyEH6uPQcLcmLP8MSFYDg?=
 =?us-ascii?Q?E/UB0AT1h9MxSe/qCvmIJ2YgpKFbkEUcf+cfqBp9jFSi0vyR67KGtd6Wk0XU?=
 =?us-ascii?Q?O7epxaKCdPQFwcdTj1N1Fad5A+85FSWxhYH4wM5fqZBtRUDmc1Vi+gPjFmdn?=
 =?us-ascii?Q?lyDZnW9fZmsI0XlbOm5sUO7HQQpJ/SfmraEgHBjHk0YKTdhYuOo041usaep8?=
 =?us-ascii?Q?jusy6/55yYFd+lo7xEwHHSsIGZmRA/6HkzCld53Mff/Hg1nMUFKSnKwMwa+7?=
 =?us-ascii?Q?3p7FjpYfJAdT0g5eZPU5W6n67yhqg+N3J3RFjkeSY1wfXVzCZBd7oXOvUJi4?=
 =?us-ascii?Q?GLrVCYoQ6PTxG4VViTaYNkI6TWESSqSjlY+zMPNVLAWqC78z2GLtHRDwA5b4?=
 =?us-ascii?Q?r3GawCamnXmAaiYzj1gZrChtHiwbdKl0OcoQmfiAtPD0kAcj6CcNuoYCgchW?=
 =?us-ascii?Q?ILnMLXcB2FVKva6iK+K9+V9RiNV0Swk=3D?=
X-Exchange-RoutingPolicyChecked: 
	OoN70xy6WyKPXYa92Lk8YCWRDF8M0v5iDaKdNL3TK/+UMqdUTASe86NZjULD5XCgUzsQ8vwUIFoagdyF5UyEz1O7/JF349hA7qf1vP9wznkNCqiUjDEcScv2LfjSXVIf7YSU7flRvgaqnU7SqfvFMvua8VIIvhVH/Rg1rrVkvSGAgoLrSmAaIJIcHkvL+QOBpIT0jGU1dvFTt0l1NYESHczWxcDTAXjEj9gB8zcw53Ikv9zVDMaA+B3U+LTzMsteHmLzOtu00ohAIqDYyk12ioPe8nltE3oTAM738JrLCEflUjN4FjsHV9c+9afGKpz5Gq1xv9Bl+BrCQG83wQFe2g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82150bdf-7694-4027-dc03-08df0a50c950
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:50:20.2319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p0yMbppBGSAQaBh+SlcIDcmRFnWtQ5E878kAhLgY7SiauuGZUDlPycIL0bavcPCbWc3sxcsBX1j5G39aCdsr3O0oFNQ5GiK8fkvKJfz3Ajo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB343702
X-Proofpoint-ORIG-GUID: i7-P--e_O2hWMnqAGWJWaZmVatfbNGA-
X-Authority-Analysis: v=2.4 cv=AMY1HWas c=1 sm=1 tr=0 ts=6a9a6a30 cx=c_pps
 a=ZO9zLbrfvwitr87ojz3Jng==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=CCpqsmhAAAAA:8 a=3fvyemLPPgf0_nW2UJEA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: i7-P--e_O2hWMnqAGWJWaZmVatfbNGA-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA2MSBTYWx0ZWRfX7B4cxzvWxNIR
 0KdSbxA/RRcbke0vxutm4S9NOs/FGdTHEd2GxZUoGHtc1eCuwc+zjLDHEdE0ZbES8MALCkJ48MG
 e0j8568UgaKqbmR3SePW3z89d3kaZZ95XJttiw213fQZ10x+G6813pqkqNiJzX+3yc1G2YIDzw3
 tro5SjYpslq3dL/49flW19EdABFSY9OOZJfsjkUAezHEnoVkokMCOqPSAKRRpTHFdwIkE0Qm1bY
 HNRjToC/TVGqDu75QowRzlwvdm9zsVAlkhHmqJQWtac9g2wgKIWmQuvyChrhQxFIxBy/JdJhKK2
 kyKvLicumovTgrTHK+UALE59vEuCx9CyGJlI82kOgzaz5zLj3l9hqB7xthExoPFKc19J/hG6dEJ
 F1us2WzXZy8SLr+H+yW9v4FdelFhZNDWeyf+8pcnqn2DN6m7coDN4OxzF92Q0SZCS/ShslG3yC3
 lcUJBPgXpwIBwlLaLcQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA2MSBTYWx0ZWRfX1dGonuR8PIww
 A0cMMEIeR5/uQN21x51utAD13fDX6/u0u4Xkgx58ybbyyAfV1PrREjb1Tu4pat9xS6wawZj8Uvc
 iKnH8RdcSQy5L8YLMbjhIaa6aW4lGSglCJbJZ5hPNVJ90PRbCblY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 06:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245064

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

$ git log --oneline 1c9988e52540c844928c6d93ff45305adc2c24a0..8dad0ee453a9bd9d24e55daba85e70915b29e19d
8dad0ee453 alpha: expect test-float32x-float64-div to fail
f024355965 alpha: add the denormal trap enable bit to FE_NOMASK_ENV
c4dac931ab alpha: Fix stack alignment in makecontext
76115597fe alpha: fix setrlimit compat symbol for negative rlim values besides -1
c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
3ad1bbd8f9 iconvdata: EUC_JISX0213 decoding lacks pending character reset (CVE-2026-80489)
138c43f018 iconvdata: SHIFT_JISX0213 decoding lacks pending character reset (CVE-2026-77117)
713998bf00 stdlib: Fix right-justification in strfmon (bug 34510, CVE-2026-19499)
2a35bab35b posix: Remove unnecessary overflow check in wordexp (BZ 34090)
4964178b4d m68k: remove sysdeps/m68k/m680x0/fpu/w_fmod_compat.c (bug 34559)
0afa34adb0 misc: Fix out-of-bounds array write in tdelete (bug 34506)
7d26579873 malloc: Show hugetlb tunable default in --list-tunables
8017bcfc4d m68k: Fix fmod/fmodf infinite recursion (BZ 34508)
a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state on non-NOSPACE errors (BZ 34090, CVE-2026-6368)
bc95068f5f ppc64le: Restore optimized memchr for power10 [BZ #34300]

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 5818   | 5821   | +3   |
| XPASS        | 4      | 4      | 0    |
| FAIL         | 1071   | 1071   | 0    |
| XFAIL        | 16     | 16     | 0    |
| UNSUPPORTED  | 402    | 402    | 0    |
| UNRESOLVED   | 7      | 7      | 0    |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------+--------+--------+
| Testcase                           | Before | After  |
+------------------------------------+--------+--------+
| iconvdata/tst-jisx0213-progress    | N/A    | PASS   |
| posix/tst-wordexp-append           | N/A    | PASS   |
| stdlib/tst-strfmon-bug34510        | N/A    | PASS   |
+------------------------------------+--------+--------+

Justification:

commit - c29ca5d216 iconvdata: Test case for bug 34556, bug 34568
Adds the regression test for the EUC_JISX0213 / SHIFT_JISX0213 pending
character reset fixes (CVE-2026-80489, CVE-2026-77117).
+PASS: iconvdata/tst-jisx0213-progress

commit - a388c4002d posix: Fix wordexp WRDE_APPEND to preserve state
on non-NOSPACE errors (BZ 34090, CVE-2026-6368)
Fixes WRDE_APPEND state preservation and adds a regression test.
+PASS: posix/tst-wordexp-append

commit - 713998bf00 stdlib: Fix right-justification in strfmon
Fixes right-justification in strfmon and adds a regression test.
+PASS: stdlib/tst-strfmon-bug34510

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index cf5a444095..6d667ac95c 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.43/master"
 PV = "2.43+git"
-SRCREV_glibc ?= "1c9988e52540c844928c6d93ff45305adc2c24a0"
+SRCREV_glibc ?= "8dad0ee453a9bd9d24e55daba85e70915b29e19d"
 SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https"
-- 
2.49.0


