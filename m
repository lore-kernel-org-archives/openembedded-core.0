Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF418CD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 17:08:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17647.1779296916935900827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 10:08:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Kwjm6fzz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=96001520eb=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KFG54K2488354
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 17:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=HhTjmbtPx
	CrZHFEMWYDJb7C3bNSqWTZAlfv/dFspmY0=; b=Kwjm6fzzvFBJXCwpW2hqZTwDj
	BLOa2Hy/XUQZvj4AUdLxAcC8a6K+p4+9Ua135c7PKsNtj+cyVyfabHcOv2hsgzqp
	6vPgoTrK+wPmGFXMnyvVnU8fzPeIJhatEvbWM8Jz+J6BUIg1AU/UXqpUjzjvrF0N
	byMVDSedY5wAXakB0hvldcJ961QKdF7W7WejPwwavZ6CG4tUKOIfvLVqcSt0Qrmn
	vsdSZtn46ndjCYW8vl2st2iHDlpTEVKV97JXWI5IkuEZIfXxvm9YgURPgbQ9z1/C
	w6TOFbxS/FK1lf6PowGMpINYV+3DTyDp1B+T5VmSeRkPDw7irfqbABxRsN33Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf5rme-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 17:08:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/eGYjY67VF5FzCYofjneEEAKN1HgFC/YAqNQX2UAY5nhZ+b+YU28wCtpl/j/VcuDjfBtn16j7iSxYcpm+VPGHdKNgdOtoRirtvCoyfuB6JNPiyfNodxkquAqamR05MOyfFNdD0/LtIPe34Sd5//FgW+6OkFwuHZWspwmjSN96xPGULz5Bf3qWkBIzpwRgvKceX9dc+Hc3tdVbSrFGhlU+I3V42I9SxQZzZEpGaAb6s7iKRxNts1GRvUJs260vMz5ZxwR/KVEV0ojE3Z/Q16mMQa3C4AIJ4pTByvXE3Lvamx96rs9ITsb993Is0ls/E4LoWfVy9J9eo32GP2Bqup8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhTjmbtPxCrZHFEMWYDJb7C3bNSqWTZAlfv/dFspmY0=;
 b=Q3GJ0I+Bpg4MeJlLh1GQQwode7Rzr1C3/JCUaoTRlLT6zE91ZcZg5VarUt2dUnP92wYDEJ/jLc/EdB0tdmflQDE0fDu2u2zq2Z633Mco1L/6O1iVJLHWiEt25AR1MuKTCNBoZix92dqPFdRgrSga/4zjFwFpg6Wm8vfBHM/MFrNIfyY8J8K7Mqmbi6p7tqBjJimbJ9BMpZT7JCBQpOfUM3zi33NZt7h2oLHg3sja8Ag99s6cwCLLzK4bme+b1q/G01NVk9uILhYKwRgqQiX44GhIIfrgoSIgAAeI2tqmA3Lm3VfAp1fMMwiOdcEvcHc9KHxkJp6Kbs3930gG4F5W9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 IA1PR11MB7366.namprd11.prod.outlook.com (2603:10b6:208:422::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.14; Wed, 20 May 2026 17:08:31 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 17:08:31 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com, Sundeep.Kokkonda@windriver.com,
        SunilKumar.Dora@windriver.com
Subject: [PATCH] clang/llvm: Upgrade to 22.1.5 release
Date: Wed, 20 May 2026 10:08:14 -0700
Message-ID: <20260520170814.931201-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|IA1PR11MB7366:EE_
X-MS-Office365-Filtering-Correlation-Id: efdec1b0-de8a-4886-8544-08deb6926af3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|18002099003|56012099003|3023799007|11063799006|38350700014|6133799003;
X-Microsoft-Antispam-Message-Info: 
	XF3LesMBgdmeHtdTxB15HaLRmdf7wJQWdJHQTaTkpWICMEO/fmEEh1EW7V8JwZha9cDxPec07aj3bj1WEP5xAk/Ll9M1MKZEvOn+CTAWBT4pmuKTUHSCFH6eukxKOFoh55rb8jZlE2FjeViz+7uCyO8hnSgAVEDKukIX3WiX0ckPhyy95oFlL6u3WgDXzvtD5R8CjyRoBoy3c8X2UQ8vXo5F4Ca7paENZx9F/hxTuUhoeoTA8W9j2U6iHTG4E6XzNzr+8Db/TSkHpCAqFplF66zZxZ4JiZzWRwPGiun43GiPu5+Afw6yJtIC1zeeWIiy1duLtFDdtXRGNtQwM+/T3RV4DQBd1JANTn6rk8NWIuYrQzK8/px3obLHjxAY5QmcufRMHeatterIBRVf8u6itu6xKL8r3EqNaaMxNAfQBV4C/CPnQRsYg1OD//KNGkuixfzDm74MdT8BG/8IUADRFT88/hRjjv6BaXG7MsSQLIxEQC2atg828A0aZMgH3bAxH/b4M68eBns0h67nKEgFfhlKhWjyuBsGIL4KciIwoww+qXnLg8zbnGnVJ9BuMMysULXU53x3uwtAMZW4HL8R+ljCYDEAjIFOl4jstrGf0yEJFPt0A/SFE/cRviAQbcwfER+KL4CS7Chc7yGab34uHQtVVbihhl74ukiTX4TKbxMQn9Krj0MgTH3JtR0ZVOqZXM9xk/5HHRph0iApB0iZn9ptHiZ0IZyRUn2AZymql5FFy+XpbMFxGn0u5v15+sxE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(18002099003)(56012099003)(3023799007)(11063799006)(38350700014)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gVofjg1NHVf/8FOFf1hULdB+JO5L8MSvE+uIW285kNf2ir130DG9T4eQk6Cv?=
 =?us-ascii?Q?tLIGOSkGhlye9uL3tkAptwQVHt/nFfKQMLBkLPSGEm2HiUCFMNwooF3DuylX?=
 =?us-ascii?Q?jEJP2gdhh3b3NDN5JGOmwSZvhe8M39MRYEcTiWfktcflcjgi1QVhAInswWXE?=
 =?us-ascii?Q?O9BMU9tho/F5c8Ev6C99MTJVQtypeqbFdcVg2xucDJbWdO5CzlcYAGO+fBOX?=
 =?us-ascii?Q?OqjOkk1bclUIDsJWNVI+vUKsjBHaf+M7B1tr2HgG60FhfnoPxZEqjj1T1ywz?=
 =?us-ascii?Q?4YOsGnDZxaF4WtykHq+maTRdLxna1L9qMiy0jiEQetB+wQ5NOrRViTFALoK7?=
 =?us-ascii?Q?CMFiuRzDfEYZej9I9TzhYFY7OJHFfxdJJd0nMm3Phs0XjWdBhujhEFBNbi9z?=
 =?us-ascii?Q?28q9fpCxTDBLl4Kxt6Opv4wCiW2oBD+M5XmhCCTHE79zrr6mtyP/Iy/z1FWy?=
 =?us-ascii?Q?pCUwGV/pNzW/zgivuzgG0dw1KIAfmEPSdteT6goEoi47aSP4JdaO4woZn6+o?=
 =?us-ascii?Q?cS1pNBoawEBICrsuWgcFN2fECNkEEVTPpBFuwi5/yr2QERl2q0QQuky00YRP?=
 =?us-ascii?Q?9Hxtm9rDW8a6kLut1pNC0u4e5Bpy3MMAkaaSRDDyBTqzR5EUWMe+R8WigPCx?=
 =?us-ascii?Q?mHIxbhfXyJPHIznIWldmuBrbgFxMEeafrHLqhH+qBPgwb6YqDw1+B/FLG/zc?=
 =?us-ascii?Q?A2YqQW2/XKohNfvcwnXbmFPJX7kDLp1H1MWxIiC7bUliuYkoyCEQ4v8+IRum?=
 =?us-ascii?Q?jBjF/WcuMx2c8OxM8PPgch76CE3HPO9pEhymYRA59fSk6wI6EkQpbm40BUq5?=
 =?us-ascii?Q?fr593p+ECszgMOo5idzXyQeBLcKJVTNeiMm3l2GB1k16zVTUo+xpOqcvyq2/?=
 =?us-ascii?Q?U0ZFoT3Av0aLd8dzEjK4zhbQQo7QtYDeodXcY1kwwXDjtVMUo224WtLKSMcP?=
 =?us-ascii?Q?K0LgHN4aaH2V0wLbhnlCmtfupoYf7O34QaEdLOhxj7bf4dBmkwusRAyj+Typ?=
 =?us-ascii?Q?BVSjEUFx2TXO+vNPx6H1lufsxxplYcGFczaZ6wW0qKRNj/N1kmSnac6OAoPp?=
 =?us-ascii?Q?6ctixULb2dyrD2NIXkqMzfpjX1DBHcIaMkQVNiwAptyZrSoo7XkmpEWrowjZ?=
 =?us-ascii?Q?uWLCx8MsgGyQ2DH8oGBeeTb0+XO2xQKR3GF+L30lZGpWgjX29yta3JS/hU8Z?=
 =?us-ascii?Q?8o8rxW79owW8I/V89sHLIcqmmgNbGMrkgBD0U5nTHphlqBbYtnMHGtdNsIwJ?=
 =?us-ascii?Q?6geXDYWSjMAEn4oCsrNmgNYcHApT9mMRg7Z/kGI0C/J8DiTNSJ8ugE+RWJAX?=
 =?us-ascii?Q?BGgfrRUuFjWovAolULW21XejSe4Ly/3X6TaeB+th91GOwf+cFsiECmpLeNwf?=
 =?us-ascii?Q?iQf7Zxotbg1jLMQTXP1C6jYF9DnAqZFlmndl9JtkgvtoN71q+yIiJbeFKe9W?=
 =?us-ascii?Q?rcO77fxTvaRXB6O8//SBxJTFWXp0Jg0W8TIxso20zLUfxl3HXMChK7n4LPXy?=
 =?us-ascii?Q?N7UM9fcl8+EOPBOkS8xKL5ej/kmmdo6gvflsn0BX23YE47cD9RxeezhEPqr7?=
 =?us-ascii?Q?pXdRpYXAoUz+YnRmxRarL829nBPf6AnKj6cZQm1HxqtGRUB4+uBYEGRFuG96?=
 =?us-ascii?Q?6vmbumTIla/R6LW/Q4nNRl8VgxXZa0gpkzZsfAn+ismb22gFTkj1A9Q+m0uL?=
 =?us-ascii?Q?R+b2D8ttJixBAv2J0CbiARq9eOGjDHjdvG8g1NJvtOAShoTlElOPJMOv5oMg?=
 =?us-ascii?Q?yn19zkkoO3byNZfplzoUq1wcJOWqwC0=3D?=
X-Exchange-RoutingPolicyChecked: 
	e1Xk/6F3CXICM7rEPK8ffqzD0Jgyp2tC629fhe4ZX8eqGvTuyNJuTthdjEAZk2aLbivB0W1jxMUdiwzvFKBUDgYuBbl53+fAE3THEeSWLYhcwBiUoetojv+5Xik7xbnmWSt7N+Irp2N+MPGHf8c5DptsNdDJzYVvYzaMAxe29VYeivz0UU/t5zdDSvw7CJU5ePZCVqHRwhFJhLLGhnbgZ6uryMvSE855PXlxhzYxYaNpJ07Wlx6k0zjeSlrjkKaGFnR+yurTVsP8a0D58O56n/lVZ8TFTGvP+EsFAAdiVtNNB2DP9zKJh+BhZQz9UpkBeohN0GmGts3Tp+IGZy6oIg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efdec1b0-de8a-4886-8544-08deb6926af3
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:08:31.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hR14X/MM1jhm8SU/Qh+q/3t/EJcDxXJKOlZX+T0Kovgb7qe2lAsd0SYfimA3CtgMcT10jKx7g/CdC2qxQ4ZBGpFzk5ylR4Nfes3QVjhaoyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7366
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: NgZQQ98lSGLmxfPzGIRa6olJ1Vn9UDD2
X-Proofpoint-GUID: c_rp5HYjmgs6fUHDmHZc_38aCu6LV0Eh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2NiBTYWx0ZWRfX0IB0gqrbOUSD
 IWmilB+V7O9+ZKR9xXfRHfWGbmOOnUoIr/bmEhz8jAesGpJgauA3STXnn30xTJBBUw/AIfpXNwV
 vgxySx4Nh+3wmOSPJkzzPjC1ilksd0xUlkL+PsM3b1yjm2VZC/gJ3/Ji4xhU3EV9EfITaqDZnR1
 u8Vl61j4qHKiA5UiM4BEt9CMsEZ/xkPQ7SalNL3DVtEeVtx2L6z0iFNCEqDxy+02raAt5uwF4sc
 NKo2KlQqp00w+bgbf46o1QYhok8We5j7qF1oGC4WpLUCLzkDhM0iyGjIdt9RiEFAnhScu9Pb1fs
 sBRb5fCQra1fZRFG83iBpx0oJwYc3WjBOxAs/b3M6Hzz7BNgqnHt/oGawROMdG05K/FGoRrGUZ6
 U3tpzv1HO8fQt25s0ne2ZwVZLmXB+w71hMkWjqdpmoH2UWlOUn6+wceM2gpeLSxzM1YUU1A3e7A
 aMdedLgbePhlVUqmrtQ==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0dea93 cx=c_pps
 a=jCxDXDPT0EaKR6BOOOS6sQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Rjc4s_XRAYi9L5s2a_EA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 17:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237457

From: Sunil Dora <sunilkumar.dora@windriver.com>

Brings following fixes:

  * 5ea218a153f4 [CMake] Add multi-target cross to ARM/AArch64 Linux toolchain CMake cache file. (#179598)
  * 7237429c2edc [AArch64] Fix `shufflevector` miscompilation on `aarch64_be` (#193076)
  * 5e29d8aa0481 Prevent undefined behavior caused by combination of branch and load delay slots on MIPS1 (#185427)
  * c61be37fe844 [clang][CodeView] Prevent the input name from appearing in LF_BUILDINFO (#194140)
  * a4aca5a91cc3 [libunwind] fix build errors on x32 and mips n32 (#194310)
  * 57370e18b8a9 [Coverage] Fix quadratic propagation in RawCoverageMappingReader (#194996)
  * 932756ad6c64 [X86][FastISel] Restore support for struct returns (#194586)
  * 19f65f31105c [LLD][ELF] Fix performance regression when using linker scripts (#194668)
  * 5c9647b8e680 release/22.x: [WebAssembly] Fix EHPadStack calculation in fixCallUnwindMismatches (#194184)
  * f3ce7a7db0dc [clang] fix crash with c-style casts involving dependent member-pointer types (#194696)
  * 692d49bdb7ad [clang-tidy] Add note about removal of `hicpp` module
  * ca0698598261 [SystemZ] Enable -fpatchable-function-entry=M,N (#178191)
  * 0d37e79da8db [X86] lowerV4F32Shuffle - don't use INSERTPS if SHUFPS will suffice (#186468)
  * 9b722024f1be [compiler-rt][sanitizer] Remove linux/scc.h (#194116)
  * 7bf7d99b794d [NFC][AArch64] Allocate AArch64Subtarget on the heap instead of stack (#176488)
  * 98348c38cf17 [C++20] [Modules] Add VisiblePromoted module ownership kind (#189903)
  * a9fb4799dcad [clang] NFC: Add test case for #178324 and mark it as fixed (#190490)
  * f131d162201b [clang] fix error: cannot compile this l-value expression yet (#187755)
  * 20fd94cf9314 [SLP] Fix a very long loads offset, being stored in DenseMap
  * 267ce6017a57 [lldb] Add EXPORT to lldb-tblgen (#192610)
  * c4b74e87ca35 Bump version to 22.1.5
  * 35990504507d [Hexagon] Add missing MIRParser link dependency (#191010)
  * 22ad4d688a72 [Hexagon][MIR] Serialize HexagonMachineFunctionInfo::StackAlignBaseReg to MIR (#190003)
  * a1a9924414aa [Hexagon] Add AP register to liveins when used for frame index access (#188942)
  * 7eb182991920 [Hexagon] Fix use-before-def of AP register in prologue CSR spills (#188504)
  * 74049f6e3a70 [VectorCombine] Fix transitive Uses in foldShuffleToIdentity (#188989)
  * a01a45066dae [NFC][test] Precommit test for pr188989 (#188667)
  * 9f29c1e3fd8a [X86] Fix missing ByValTemporaries update in CopyViaTemp path for musttail calls (#190540)
  * d46116b2e464 Suppress octal literal diagnostics from system macros (#192481)
  * a5564a033004 [OpenMP][OMPT] Revert `control_tool.c` changes from #191429 (#192069)
  * 3f9b9936be95 [OpenMP][OMPT] Fix `omp_control_tool` before any directive (#191429)
  * d1c9116f8442 [clang-format] Correctly annotate binary stars in braced init lists (#186732)
  * 99031a474bb1 release/22.x: [Clang] Track constraint's SubstIndex only if it contains outer parameter packs
  * 5a1590c14433 [ClangLinkerWrapper] Fix `-v` for newer CMake passing it directly (#188883)
  * c8e984d27b27 [X86] Fix VPMOVPattern folding for extended registers (#191760)
  * 07c19c303387 [compiler-rt] [Darwin] Move macOS ASAN reservation above 512G (#191039)
  * fa56327584fe [22.x][LoongArch] Revert musttail/byval/sret Changes
  * 10be0a255205 [clang] Allow -Wno-error=X to downgrade -pedantic-errors diagnostics to warnings (#184756)
  * c2aea991dba1 [Hexagon]  Fix O(N^2) compile-time regression in HexagonOptAddrMode (#189531)
  * f444cca96bd5 [AArch64][SME] Preserve ZA in agnostic ZA functions without +sme (#190141)
  * 5d161731998c MIPS/expandAtomicBinOp: Remove tailing kill dead register operands (#186055)
  * def143a6c624 [clang] fix getReplacedTemplateParameter for function template specializations (#189559)
  * 5b4dd04594bd [pdb] Fix public symbol hashing in GSIHashStreamBuilder::finalizeBuckets (#190133)
  * f42d371a5d72 [WebAssembly] Fix: fixCallUnwindMismatches after fixCatchUnwindMismatches (#187484)
  * e9a36c0cca40 [CodeGen] Preserve big-endian trunc in concat_vectors (#190701)
  * 53c41b3a599f [PowerPC] Optimize bitcast(truncate) patterns using vbpermq (#181233)
  * ab2f55b13bcb [LLD] [COFF] Fix crashes for conflicting exports with -export-all-symbols (#190492)
  * f0593ab291c7 Bump version to 22.1.4

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 1b8909eeb5..d6ad546c59 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "3"
+PATCH_VER = "5"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 9d45898c68..9c700eb5fb 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd"
+SRC_URI[sha256sum] = "7972b87b705a003ce70ab55f9f0fb495d156887cba0eb296d284731139118e2c"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


