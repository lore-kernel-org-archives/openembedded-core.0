Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A29AECA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 08:36:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8922.1791794205803148067
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 01:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y5zs+pjS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47453a78d5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8MuKh2390754
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 01:36:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=YI16lZYuz
	b3X+n3vu1Gge1pICzquoDz0s/TjP2byzTQ=; b=Y5zs+pjS+7wD8sXHO7jEW8a6S
	HppUJ6onVgSLSL0WdvKiZEqbCDho6NAdO8BafBKD5j+19vsuFdTU+O/Oy4TuZLXc
	QDkahmVAkR/KdlGaVjSPC1w31l2W1yfMYoJRwU8VnLI84a775pF+HQBAODbZG/xi
	+25lXNKoBB42gmEteNyLpHHrhPWv12g+YTL8i0Bif3SiIxZDr3qGX1zrYWbx1KEb
	k9T0u3Q02F+EtoE+qsDeK/HIuZrKGwC8BUFhMZNdrH9IkBw4SCV9uJPBe+zXUkha
	P1pBfo+k1jWD4RcstRCNczAKOZpu5xFkeLWRyx55LGu+G4F15fkHp6/MLCq0A==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020106.outbound.protection.outlook.com [52.101.61.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h7gn19shc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 01:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkIXman+dspfyiEHCCIzqQEM3jqMxi5knIs2eDMNoNAbYKSxk571TFJ0n/kGt1Jpq2/rz0+O6LD32euZabFl8tWdiUzOsG2pEUjJv26UjUVOG6oeIaV3BIhpwWVEggYz6xPPjaNcaQyaaFTbxQWjXG7ltNZ4GlKWiKwYdatHjZDb7y93xG8ClXZjFO2kBzHntLxuDRZQ5404hNt9zNhr6atNMnYq/qikQsMPzeOBz4Of0dNYUHCqmG4MW90k8vDmVYvp7ewPO0ARQltjv85C+dU0zHNHuiXudCKmj2RGHkleWMsZ80+z245oILdao0JScS+xTbq9yjqp7uZZONdc4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YI16lZYuzb3X+n3vu1Gge1pICzquoDz0s/TjP2byzTQ=;
 b=YzxyjXgiuWAlqgI0sKcvFHN0y+vPBGnwAItbfSXMNB8nf9/FzJ21EAlLMXXjodq8uxnLDsPBGuq0c7ZMbTFibrH9tUz4S3SdBQYN1KRAEdXUEHOfW852PB9M5bXV5jxVeG45wQyc99pGlavbA4NVPVzWTevl1NPjDj8AkEapcAM7ajTLWRYPHL9e+kxIMG8YXCHcKtuqhPGgY0EKWRQxnHzxnbLE6sjQN8yMcHqmriV3xGjAjszrP8iQYQL9mceahRtPxPi9R9lXVVMvRDoQZTLMJeqzMG/3ykPQiK5ai7aCgEnJFHa/TArj/wb18pAHy+NTSXeBRQyHWx++GKDMow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Mon, 12 Oct
 2026 08:34:24 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Mon, 12 Oct 2026
 08:34:23 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] clang/llvm: Upgrade to 23.1.3 release
Date: Mon, 12 Oct 2026 01:33:51 -0700
Message-ID: <20261012083351.659848-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0178.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::33) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|SN7PR11MB6897:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e81270-4e3c-497c-93e3-08df283b9e67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|23010399003|1800799024|11063799006|38350700014|56012099006|18002099003|6133799003|260925022911599003|260925021311599003|260925021911599003|261009223027099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	/IF0S/BDLvNOtF1UeL7Q/SJMCoQ6sNUCCWNo1BW9C3fxpTuzROY2x8yIAAcwt6AYWS1k72C40uDK2ev/tnTKncVWe4X6bM7eK1SHExmhL6SRTjqeae95VaQXhBVNxOoNDPZxx7fyqm/O6BTrN/fYCGtKEWzB+4ITzT+xJLSUlJ4ORsOYyWnZ3WZ9wtd39I73O8bKc8QwbngagrfzjmJcaQaZ5h6i2kXTNvgZXZS42c6E5Fq1hfBTN8+UFPNp0NjbTWzkyJ0Jl4iuAHKtxbweP5dg4ejlpsv3dEmpYl3F3MA9iuwOCIwHfC7xLvklZy4g0CVu06FmYWWDStMB9v+MbEuYjBL6EO7RHOOYfUQQYvPXYWeyFuE8jxmqnJgn4Oj3T4N2GAAMy9glyxN9LLwGm6Fs/4uQ6CPsUqiWARGCcEZ32xIpFZyPSDQNuvyjXfSfRpO6UVinhk5pDm8ApcNsxNruJjRqdKKInncDzTWZJb/NMVJOUrYHRw8PakmVAV6GlTF1sqkMnqUGQZyemM/h38vGP3MQDulb7bwIz8CQdqFcGklTeemAukJOe59q+0K1StKfnKFVZN3vmb6LTzSQK7UbY0HQFbl65Wz6URGMi7Fn2R5BsRNoeS6fhuCUeGaoXl78Zv3jNWQMvEta0ZCne6TdMed3mPULhn2pzcf7kt3BgQkgdzq9No0trhIQWtZD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(23010399003)(1800799024)(11063799006)(38350700014)(56012099006)(18002099003)(6133799003)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(3023799007)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZRg8gwuUM1WHlsoRSRNi+f4R+fzrN/pA3aDxVFje8YEDMvzB4ChBbiKg88V6?=
 =?us-ascii?Q?LTBHM15/PnnfnKD1Y7IYPe1GgU7YgnoZR53EBWonz66mLdlLmII6+Rptimwc?=
 =?us-ascii?Q?MxaDwEPR7wuXOK/aYlAJm2NLXFG1VuXNXfhsLCM95lshZfMXwKiwtKL62Mla?=
 =?us-ascii?Q?KXFrtrc3feerHqNyywxUZA0YWPk2X0Bp7bGrNurQUNg1S1fBLX+2TyaIKreU?=
 =?us-ascii?Q?b84cgJ6Lf8ao9ClT62X8u5eFqlf+D5CeRoJSRD3BN0UApKYz1qKXSgvwybY5?=
 =?us-ascii?Q?T4hwfPizmhM6XREk1JBdWRzMshmGoWkOjA+Sw2ir8RE43qHlfZsFowIabADS?=
 =?us-ascii?Q?CrjAYx2+8bCFd9X+SRvtxdJlRluVSWfChBcL5hHlltfwtKgRr1jA2YYL3eDz?=
 =?us-ascii?Q?ZHrZ9kIKxdRBxFEaWWeM4c3c7rarFRPARBMZ/fWiQw1xCZMAQl+pnzoSGvs7?=
 =?us-ascii?Q?JNyfL2ZQJD1Is84AM6xYvHXMMtue6T5F+RfIFA/+Eq52tU+AdElvIcuXN3Q0?=
 =?us-ascii?Q?XluGENIz3v/LIZGoMkD6CcWfymcbDhGO1xLaBlkX3EnCNPB6QWAzKV81KkB8?=
 =?us-ascii?Q?gPjsbCp2yAghiKWaYVaOMDiGavjZW2jXgy1YtVdO6MpOhbuzxYy/YMTAxhxw?=
 =?us-ascii?Q?V+n7G4xiaI0m4oCZr3N8ZMuFnI3dl1V4B4dmhvUxV4Zqf+BBnMSP0FQOPPcG?=
 =?us-ascii?Q?UirEgwUPrEcC+JhDH1v1p9Bdt8QXARqca365uYNh2nWtyF9wELOVEW7S4Yzp?=
 =?us-ascii?Q?zXzrY0jxaxoou3SYVtWgw1dOq90M4595j4hKEQg6JaoaFsF82Fe7q3veXgLM?=
 =?us-ascii?Q?vihNDbX3Bi/9RkMHcoFK892SVQ+FzxSm+XTZh/g4wPfRCa4dgLkMvOQMu3ro?=
 =?us-ascii?Q?VF/x1HXmOwOH0uBHlD0UuNcnNs+qg/pIcyPFWdbSMx6Bw+F8ReiTvl9Sst0B?=
 =?us-ascii?Q?TeWIMBagJf74iKR3r/TW52H8829hmt43AlzhBOGoh567hTuGJtIQvK6l3yjk?=
 =?us-ascii?Q?OD4lLTcuaY/Pp0qkDaxHLWLskO6xblICHtLpj4dn/va9BAvZ/Q/vso6FOakR?=
 =?us-ascii?Q?1uJLDMTWa7K7E8FSXRog0ryk39RbSbp3a/rq+7QvtU8m8mTFyn8hGrWCcyUh?=
 =?us-ascii?Q?cCiqtRA2dIF7ft77NYqOVamedvnNBDG8nhWlZvm8ckCkzZaFwIccY7L8/fWI?=
 =?us-ascii?Q?MCcO9OgA++9q8wkPjFuK0JSViYyfCiARAwzCq1bY5P954PFSM/jOg2ajl0KH?=
 =?us-ascii?Q?+lq8DFcJkHQaM62/cIGO9L54wxXy9VuOXqMFciOvIe76wzhVnnB85UkE6p+5?=
 =?us-ascii?Q?AY0k+12AC1u6HkmTlFUgQs9F1xa5aBxWCG3FEkLgl3Iz1B7SvdLJFV0FXzP3?=
 =?us-ascii?Q?rP54Bi+9x2urDiTDUA2W07PzYARaz8fDe8nlw423OvM/q0weYKs9XUWhThV1?=
 =?us-ascii?Q?8oA/ESxwJh0Fa4hKfhuWTgtytr5pf+3QpHnBL+YADlRqGQm3xEz6szGMkMgj?=
 =?us-ascii?Q?Ie9X8gtBjRGzj4yqp51GioybgXaa20PysSANOTgShcMr6NVLEr/tye1tM2K6?=
 =?us-ascii?Q?NwfIoP9LUE4E+EcBR9ofyVtbht9Nk5+/f/AltTitbY3X3oylu2KbkPamKabv?=
 =?us-ascii?Q?9dVQqZXf0FS9n7lJWyVmKN9h2mNZE5QNnao02sUrvGYQgSoF1oBIXMEuyJNc?=
 =?us-ascii?Q?Vm6xarZB5Mi9NY8VtnA/DgQAntw5jo4jS8JLUnX571v5cRvAkcAbcIlJ2SQx?=
 =?us-ascii?Q?UND0zwHoG19ER2J23phgVXMYOML/0H+VaM9tGXzuK87O7ge2dSKH?=
X-Exchange-RoutingPolicyChecked: 
	W6IELdPP8bwn/lJqzo6ouCcdZ3GqeCnVcHk+pRHFPihylx9pxQdalZuKKMIIE5V5WX9b24WD4DV9oNLLBzzbL6RkXvL64toXuGrA4m0cvZJboruRptSszmQpU+lRz4oQ6o9qg1HnZhOREUfxbQBSV+9TT9rg939XWV3Z0bdvaz0OavXsjDqKfhm3GdneYmVmW03HiYMWYMUanBcUw8adwiV78WrMLWWHQZ0Z3n6jUtoKgd61YRPdWeobHbzHRgPNGnc4Rl6G+Y4NLoDKLxJno7n0QlemCOlUCG6T40tKV6TA5NtU9ZxZ4flOLBs7PaYr0ngPJ+YpZPspD1CXxzEJYQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e81270-4e3c-497c-93e3-08df283b9e67
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 08:34:23.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VviVxMRUNmqCAGeSOQEhpLcuvC1xbWxaGR7GP7hFzvgm9eg9Bvv+JOTNX3WZPlb8vrm/VRdETx64/m5F8Q2wMTy027i5c5NqjhWgwd1c2SouLDcCKDx2KohCWXDT1ELN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6897
X-Authority-Analysis: v=2.4 cv=KcNHIgYD c=1 sm=1 tr=0 ts=6acc9c1d cx=c_pps
 a=X0tkg3G9SmSAvlwNIS9bXQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Twlkf-z8AAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8
 a=_N5UKeOgqk9vG6_m1YsA:9 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: rC192FBy02f4Qzzpv5b66mywzxsKoojF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX+isUsydpw7F2
 jwcMmV1gsVXPRDNGrjZI3aOS4Ucqmr+gSEg7CxiYILCj6d8+xI1x4KiFbmjmiCmIA96hWJssNhg
 bw3lmAlmsw/HdagwXHvcZASIdvIS31w8BNScM0xgHXc6wPIm3TqZ
X-Proofpoint-GUID: rC192FBy02f4Qzzpv5b66mywzxsKoojF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX1D5n7+07Zmf6
 mmmlXf7xNmTShSb+qHEu2123a9csCODUGMPdrkiF9MI35lBmHbgUdBIgHWpYqf+2RL2pobwYdyE
 ny5YrQqkIXwzYYcoc1cCfG/1bKstnvAK18a8omDdRx0UEbkso6ztEEdbB+KStfdmFGRGT7d/nZX
 VxYvDrjLUf8TgPwYfj1BvfTEd9UVLRnXzseO+mH5/PA9aC0lvkcq4a/atKO0kM/1OiJti3nhsmE
 ga4He+qq/r6y1eYSDn+3V/y323nPYTgzYjQzRk81ok5bfB3ISlmdEsolzA7dC4UgQ7PeoEHQWCC
 LtpjCEZ/CnGA5FtaTQQ+TPPD1hlW1vSz0INGtTwMDfsFzDoTpKfW6Ojq1Yu0IPUY+aiItiofhCN
 J11iMF+dJnRILZqHe1auIJ//XoT56MH8gMuZvyow9gFdwbrZuvGvKmJ7BkG8BIJf8/DEgA79h79
 u/JSCAjwoo5sCP83WOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 08:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247615

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://discourse.llvm.org/t/llvm-23-1-3-released/92432

Brings following fixes:
0d261d1ca552 [NFC][clang][Serialization] Fix std::set_difference sorting mismatch in ASTReader (#219053)
65d339f61025 [ARM] fix `r14` aliasing `lr` on `thumb-1` (#225746)
c23967f24eeb [Mips][MSA] Fix commutability of unordered comparisons (#228567)
c06551266dbf [X86] combineConcatVectorOps - ensure all suboperand concatenation types are simple (#228522)
31c414240aa7 [libc++][format] Don't leave the output buffer full after a bulk write (#226791)
2bf6af3d8c93 [AVR] Implement selection of 'ISD::RETURNADDR' and 'ISD::FRAMEADDR' (#222909)
76a44e46d47b [cmake] Build libxml from source in release (#221365)
c2cf51f7320a [X86] Don't skip frame setup/destroy on SEH pseudos and regenerate tests (#225445)
d54ecc1aecae [lld][LoongArch] Prevent relaxation oscillation for LA.PCRel and CALL (#226713)
6459dc471c97 [Loongarch] fix int to float conversion on non-MVT vector types (#228896)
fb050e696e7c [Mips][MSA] Lower vector fabs to BCLRI (#228532)
fb2a21b4f875 [llvm-objcopy][MachO] Fix use-after-free when stripping (#228607)
d9eddcfb4748 [clangd] Fix header-name completion replace ranges (#225473)
0da1d6ee125d [RISCV] Consider truncate semantics in performINSERT_VECTOR_ELTCombine (#228243)
6e2bb08c5682 [InstCombine] Fix miscompilation in sinkNotIntoOtherHandOfLogicalOp (#226783)
d8965120316b [clang][AArch64] Fix range check for _Read/_WriteStatusReg (#227052)
21ef2ddb8060 [KnownFPClass] Do not propagate non-NaN through `asin` and `acos` (#213812)
1f2d65a9e7d7 [AArch64] Fix accumulator chain opcode for SABAv2i32 (#226062)
9669f0a31161 [Mips] Restrict rdhwr+synci to Linux on MIPS R6 (#222566)
d3b23d8b0c19 [libc][math] Fix fast path with small inputs for double precision sin/cos. (#221012)
dfb1297f7c3f [C++20] [Modules] Load friends for classes in ADL (#219094)
6abb6e738b33 [clang-repl] Keep earlier declarations alive when an input fails (#218149)
ee66426152f9 Avoid abi break
8f747d63ffb2 [lldb] Attempt to unbreak building lldb with the 27 SDK (#223090)
532fa5afbe2b [ld64.lld, llvm-otool] Minimal arm64e.x1 support (#222721)
9efc50ac8a20 [Windows] Don't export clang::interp symbols for plugins (#221295)
c0f43c82604c [SelectionDAG] Fix result index and vector width in unrollExpandedOp (#225886)
b3aebbf2de7b [CI] Bump python dependencies
c9376624635f [RISC-V] Fix assert after 255162a (#212791)
4db63eeac73f [RISC-V] Do not emit cm.popret[z] with zicfiss (#196267)
6b34061eb9d4 [AArch64] Don't emit stack restore for SME ZA non-sibling tail calls (#224721)
3273cdaa5ea1 [GlobalISel][AArch64] Do not remove dst type predicates from pattern children nodes. (#221576)
5f2881edaf60 [lldb][Windows] Remove use of unstable ABI and fix SB API visibility (#222665)
28a01b03e11f [lldb][Windows] Translate file descriptors between CRT instances (#217126)
e24fcb694410 [AArch64] Guard against large types in performOrXorChainCombine (#222146)
ff3d38593e6d [Mips] Strip \x01 no-mangle prefix from R_MIPS_JALR symbol name (#219427)
5d31c0334b03 [lldb] Fix switch case for i386 in COFF GetModuleSpecifications (#222030)
898bafa6c855 [AArch64][GISel][FastISel] Fix Windows "sret inreg". (#225190)
8646466e3a4f [DAGCombiner] Restrict combineOrOfSetCCToUSUBOCarry to ZeroOrOneBooleanContent. (#224759)
557e1d658863 [DAGCombiner] Require a 0/1 carry-in when rebuilding a borrow chain (#223396)
615ef6c76842 github-upload-release: Create draft releases (#209876)
243739128971 [lld] Don't drop RELR relocations for late-added GOT entries (#211911)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 94ab0ccace..4446732e9f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -484,7 +484,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-23.1.2 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-23.1.3 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index d34858d8a2..cf93fd0f62 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "23"
 MINOR_VER = "1"
-PATCH_VER = "2"
+PATCH_VER = "3"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 0bcd259047..6465fe3399 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "c98bbef08a2b4c2613cd50e9aa9ae7b69b1fe6c16b2c40373bc0ab6116fdf78a"
+SRC_URI[sha256sum] = "c44186a7762ed28954be72e5ff6df9808e0779d4f1bf014ecc4e7e211d31ee34"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


