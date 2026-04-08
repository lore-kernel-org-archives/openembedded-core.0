Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C87FD5F7D
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 06:03:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.99880.1775628173965736790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 23:02:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aYrpuRxE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=85585f6e9f=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385Prx73511063
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2026 06:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Ad2bmr5km
	qxpG98Uewgn/TJ4/uW+rNJ8AFAgMpEubto=; b=aYrpuRxE2+bq+Vq52EbzgEBxb
	A7MxrNVSQOkjb1p1IrKx+bz3eyXZz1UMdnqGbtnSim+VR0SGj3/bVBkTjCvsT1rG
	78DE3/ziD5zEKuYsnWTC+kfwe4XXEtno6YJhPGtO+lMSQss5TckqfNdYQsJ0xFta
	MHqcqLbfs+bRDtZoFS9cl4KQ/yBTetyjyMH+HrBN79l8FDctOstIb1hJbcbbO8pr
	XLKwX6Cd0ZyXszQqQ6IeZBPcbXSMEF4v2aSDWgOz/UA7ccr7ym5L/vUTYR0wDw49
	mPA22re0bbZHhZAv6jEqQEkS4Q16W4u3SLitwKsp9UeFspzGS4O5KmiZCUm9Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrya283-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 06:02:52 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2Cu0IuT6prGlqLIjiP1Gh6yvAD19roW1liX30BonMPS3ljbD4SieJYwl1+u0Mspnx9qgMuaM21YJxARY9CMfjiIXoTJZ1DVETZCzS+kc0/974qIh1OCFh3TIGb35jjsGBNd/hNlr9salDTEiotX4ajOsLOn8nvlfEabyW885OsMhPq+1JhZoB2FUBssiY0geeXdZ0zFrtsAtyzNuX9kHE+fHUq7eT6BQGaElZlY2CX1ctFH6Vgf0b+KM0nJ+YzbZHA+WISiHFDzWp6LRq8FWQsbw46Qo+TbyPNVQGfwnveXu7FAUerDsO8vpWMe6hf7dr3xG30veh7VCrUJ3KLtRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ad2bmr5kmqxpG98Uewgn/TJ4/uW+rNJ8AFAgMpEubto=;
 b=i7XvRgyqDFzrNiH0dhOkl3R+zftODG9tF5KqMqSOHUM9G4xN4V5noGxdunjRzioesl2mBvQq4ZcXgsABJtORyahDvmMnJKAtpyNe5as5aNNQBNECSi0qbKY8X+kIHeTlrjfZshcYkzpTxgftM3t01HLh8OhZtvyIthtfNwrTrR9cwwf/VDtLYPlYto1H+EzPC42o8oMbTBBWL61EYkPyVKWUKHKvbSzmi2RmAWnVcTirzKDLHRC4JPTEPZwA6fENwvvZ3woH9snJP7OW3qC70vRy9+mXGbfvKnh4Dbu34F/JEMZZHiFf7mJoQSlr3V/QJN4Uj6hrKw42Ym104/Uz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Wed, 8 Apr
 2026 06:02:49 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9769.016; Wed, 8 Apr 2026
 06:02:49 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] clang/llvm: Upgrade to 22.1.3 release
Date: Tue,  7 Apr 2026 23:02:32 -0700
Message-ID: <20260408060232.1346811-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::35) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: d2794d9b-93e6-44c2-74d0-08de9534763e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	i0OpMmz7oDO3Zsvyfym1DkRRpbH2qC+TUi7m4E19AZDogAGu4ZqBvBLqwP39dGftQ/jGLx6dUihicrlVrLG9eShTW4QC2GcRZ1tRXvvogtdN9/zuoK4dNod3z8P7ueH6vKyw5g7UC5VyYJwKDaOZtiuMEMsGAyasQ1AHfEPqG4m0fb93mZpnF9Ddm5YlNtMzhHtKhj3rv4mPG7Ip3oitzOJ+cgGHKsAPP7CqgT8LlYlFN5Oi/kah1DSp3oC/k9/O2q12WsYanR7CTGHvegfYDkfGvWevbrr8Qj/i1M9Sv6klHEZBXiEWpUCGCiITnC4H5r92YIAqIc18443UMLn7hlpYBLsOxSFZ+ZmCOpJzaxjKybAqPrQD4VwiyW8ywsCKjyniaJ/rMWw45+a6eFioYRQ+Zhk+/ZzwCIg5Z99epKs2d7kPN43QWCNGEMi3NpDu3eFuiDrSf2cTVs7ECQMkVUfC2mQZON2ryq51iZU0eD1V9QyTElrI4Jc5L++GNxYsO2HFrY+Ur8WVqtmb9pWovUPiIgDsSOpwuCyzYkWlwntnOgrXDFRjWl7VT+7BD1IVI30uXtq8tHgwjY3/3co1dJNaqiJeXBS69rnSqMs0hzEaEjFBfJOl2/R7oXKDNJu6IIFMJCTnjo46uyqNahZbFjymxCh5TejPzSENlfPkV6dyMZ8R4wv9ltUhCJ8deZ+l7QlIngLy2ry8w6iX1kTzNoFHdunoQcENz9NHsb4bw3+pAO+4ZRgko9bNpEQKZADg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r3EfIURnEOmHH7Vwp01W/xpLsFYsINLI3mQNNbCsmQn39GgC2rRDEkbxCbwB?=
 =?us-ascii?Q?DLtYWxFkSYcJjwhcldKwjQ1DK4GY8FKzLSdfAWi4Ohg77C1EVVmJlEm84Mcw?=
 =?us-ascii?Q?mO04hLjltE8Ci4i3SQmKpypWBKl2DrQHo+iHs1EI5FLtLerdi99aoLHuxwY1?=
 =?us-ascii?Q?Wjpy1HsEA7spCG8hi/I0v0q1t5S3t1o8+intwjR96bjQv395hupn5jjbzBZj?=
 =?us-ascii?Q?6Ko1m3UZjrDFsMTGiJoHU7MYN1GwDT/Izg2i+VNwMhAyLjTWLZyzHxv6mac0?=
 =?us-ascii?Q?LpNUyvK9SmP+qv9b+LESv7OyrvrGn+VyFTvHiJ3g4ADvf0H8k5LnKIqhgl4p?=
 =?us-ascii?Q?403yOpDhbC6nvittUV6+z9c9Fx40AKwvHsShds1BX6ggKOK/9K2iV4KQGIrc?=
 =?us-ascii?Q?XM+31CRtKEhZ3pbLn2Abz66h9nw3CEhlKFy9ZUvscfcpX5g67e4MiGkcM/Q1?=
 =?us-ascii?Q?Km9XAP3Sao/z6TMrCtEjTCkT6MnL53KJVuNeOHLM9lRp5YaZRczTMHrjQqEk?=
 =?us-ascii?Q?DW598flC7ytnOIOIfyRe1EQS7qyduHPeniDuOS8Pf8AvymoQy4ewS2fKZn9H?=
 =?us-ascii?Q?q5SCbI4exLCbp/fl3soC+lcJ3hK0J8BNmGXCP61KtFFN5slelZQ8dQEdvS8a?=
 =?us-ascii?Q?J61a8MnbqPMF+/hzp38kDWgVWc7i3NqNO+0YNLgvHsYPHlZSGxfhnoT0CNwk?=
 =?us-ascii?Q?2m57cqrxWu1yZn7YVrNkC3O/8EKOAfFJsJGFBOo3oe5LvYWcPQoqP4YwKZ2M?=
 =?us-ascii?Q?91BChrrTgUJkT62H2kLzQHRzxOwcFS3gGAsg42VnEPuGKDRFCdJL3ref8oid?=
 =?us-ascii?Q?ce7Wgj1E0eBlmHgV3os1Mxq1vEJRMsRYjbEENo/UYV99rVA9kiKe0hD5S4BB?=
 =?us-ascii?Q?nnNMgdMI9pd7MPfvmLFwLgP+cdchLFiUUQvc3cVChrAsY8v7NRxHEaNPPdru?=
 =?us-ascii?Q?s0amq4ScOwOXgLLpvu/gj7uXdZbHVilNGAV4ScU+MmFA19ewwWTE8VjGmPhV?=
 =?us-ascii?Q?sHcHMb6z6V2w03fBEVT4V9yOW/CXW2Ed4N6jIao/q5Kewlte9dUe8bmiZ2wJ?=
 =?us-ascii?Q?QDIouVHbVG0+q1vMmU9EmTVwMCcD0cQmyBKg/OOlMoaQyhCfxmHRDwcguGSw?=
 =?us-ascii?Q?I7rv2SJ+omKsqzgr6Q7HLzN0FkKFnVVsxQhvIUUphf5Hif7QK29uhIoL6jnK?=
 =?us-ascii?Q?HOvEEe+FsgmxDfO8kPrjT3BnMfqMNVS7DiYGRSjAKDvESHE0HmMB/OOEX+iG?=
 =?us-ascii?Q?rlASrZjlqAlEHA8fvCYI84hPtz5k3mpZrBdXufxg8+9EI2id8OyOVAWqSJ0u?=
 =?us-ascii?Q?0YYnDz7Ie5H9Pkn5hhgUuHelMCOs/36q1Rj68Vzuu8EMD/OZL76XeG9bKlms?=
 =?us-ascii?Q?kwRTYlf7+6UZrKlxpnCRzHv4/QPVrhRUbwsay8JrIOgdYU/7KcNc52bjnouv?=
 =?us-ascii?Q?Hi7WIw2OkAg16xH9FHgcWXyj0lxVkKcLMvXSEzPhs/IbupMP4/Vb/krtCD5g?=
 =?us-ascii?Q?xHyfBDQEgJq0VkYj5y8aFEHHLanRjkjekqcABNQ8Xty8uix+DN1hWIiUiQzV?=
 =?us-ascii?Q?tRFeJX3V5BVR+bWjnB5KKwFXtmRaTcZ6z7I6i3V93JOhADn8pBDfrBFY15Oq?=
 =?us-ascii?Q?qpo+GgaBzhR6VGbltt8E603jQoMF8iHp4Qhu0oGZT0r9WjcXvdZZ35ao75lP?=
 =?us-ascii?Q?N/z9zO+0n9pPKmX0FVhxCWPhaQrZ1B8/XsQfCAXyuGYZEpYCXs9a/cSfZyK7?=
 =?us-ascii?Q?2xmK4eOjPfB/EEDiMst+WMaWpjR8bo3KzNqMa+gCdLoNSlNk07UI?=
X-Exchange-RoutingPolicyChecked: 
	TPjQUgUnTJiH5ljFoCAodgLyAhdXA4a0bchr7SddzWLe/X6qkDN+4hpbcywqI3Uhg3KBmLz09Y/a/s1QGOcTYC51sA8TiCKAeiieeGk1uWYEPYWFo1CbnusxPd0rsdemGDdiRo8BFUC0l2GdHhxNf27v79E1JE37X1FdmF6ZcFrwZv2Fo1uXJRKlJF0ip3MDgY2pOb2U0os1Jr4qllWAe89Chz+eZC3qBtT7XI1Jpdw/vx33P+CtWs1UyA0FAFZ6luwv5L3iav4/PsmLH0++lK7KBrSGFvoYEQRyNpliNKiiuiLqGpOmZ8vM5oNJniU/afvf6Q848XW0R+mFf2WPRw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2794d9b-93e6-44c2-74d0-08de9534763e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 06:02:48.9759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VICAiq/vDiPjFnZw9EEIrcv5cPezQEaF43SqkS1iHhLkGmpTJQ8b+YUNOiEPuYuE7/kI9+tXzKmy3yPwV0Jc6Vt3DZzEVVTlp7AFSwoAAlkueCKmHIwt3tBc5BMcNP5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d5ef8c cx=c_pps
 a=kBTuJkHEWKOaoYTOH1TR3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=iGHA9ds3AAAA:8 a=Z8KlNeqy_QKFUTZKGEoA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: c2yrN4Y3Oe9kEOkfeFK1-NGE0Qav3-_-
X-Proofpoint-ORIG-GUID: c2yrN4Y3Oe9kEOkfeFK1-NGE0Qav3-_-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA1MiBTYWx0ZWRfX1/prgiHM+h8i
 sXO4fdzoo0JiAToyXGEOLdGBKj/4rva98pkNr4KSL38/T2cERbUOIrkJ1R0UXmATMCWfqUmPxo7
 znBgwBs2NR5U0U+k5k0wbHHx+osyEE8CMjUIE4d14aMC/JX3MkxY+DHlppjZznQftVwVrbuhVES
 oeSopZ5hsfETbqL8EpcwxKesQK2slDYVZhUzWbTS+7Qb8QnWeDsC26afEFrwRmrkD11zFYfrn8Y
 FaLIN+GZmvrwgomSiZLaqwO7ZwRL9OyOvmIl1nKmBO0iiAA/K8guH0Gh366gPoRfq89VDRBmspj
 6jCcW6APay964wvwufN4wTmW5XzHxdItfo1G/zNFzqHahxsq78gPLtWxMYUWj+TLePQU/wAgRK4
 RCQTU0reRaDxRDPcxU73omuwDdX6940PUbzJmSFedzMBM1umvGwYriafLHqpVK7Zl9xA3sLvIKX
 sm+D2UxzPDI7Y3f5URQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_02,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 06:03:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234810

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following fixes

e9846648fd61 [RISCV] Use a vector MemVT when converting store+extractelt into a vector store. (#190107)
c55c1c1140e1 [TargetLowering] Speculative fix for a non-determinism issue between different compilers. (#190219)
151b4a3bafdd [clang-repl] Use canonical types in QualTypeToString (#190528)
0fecbff69a53 [clang] Fix issues with const/pure on varargs function. (#190252)
ae980d3b4df7 [lldb] Iterate over a copy of the ModuleList in SearchFilter (#189009)
307a11d7aa62 [Flang] Fix lowering failure for some constructs inside a CHANGE TEAM (#184342)
cd7f7379a016 [AArch64][llvm] Fix encoding for `stshh` instruction (#189588)
4250a0fc5de9 [RISCV] Fix stackmap shadow trimming NOP size for compressed targets (#189774)
da8a5b950c7d [flang] Update Flang Extension doc to reflect previous change (#188088)
0626016c5b90 [LoongArch] Implement canMergeStoresTo to avoid crash while NoImplicitFloat attribute is set (#188005)
bc44e9b80349 [Hexagon] Use __HVX_IEEE_FP__ to guard protos that need -mhvx-ieee-fp (#184422)
e6e59749af18 [Hexagon] Define __HVX_IEEE_FP__ when -mhvx-ieee-fp is enabled (#183829)
dc9d64aad7a9 [lld][COFF] Restore `lto-embed-bitcode` and `-fembed-bitcode` Bitcode Embedding Features (#188398)
8fef0fb1a2de [clang-repl] Fix C89 incompatible keywords (#189432)
7b6514cd3089 [sanitizer_common] [Darwin] Adopt _dyld_get_dyld_header (#182943)
24b53fbc67d9 [X86] Improve illegal return type handling in FastISel (#186723)
cc87fcfeef54 [AccelTable] Pre-compute entry pool offsets for DW_IDX_parent. NFC (#188915)
561944ebcbd1 [lit] Explicitly unset timer to free thread stack (#188717)
58468775a5e2 [lit] dealloc ApplyResult objects as they're waited on (#188642)
719a040bf13f [lit] Stop holding subprocess objects open in TimeoutHelper (#186712)
b8918e6248a8 [LoongArch] Fix incorrect reciprocal sqrt estimate semantics (#187621)
62b14a88906d [MC,clang] Fix -Wa,--noexecstack not emitting .note.GNU-stack (#187880)
4bae0d33b2a4 [ARM] Fix incorrect post increment from Or (#188036)
d033ffe4eeb4 [ARM] Regenerate vld2.ll test. NFC
5f04300518b5 [AArch64] Use an unknown size for memcpy ops with non-constant sizes. (#187445)
f6198f61b2bd [Hexagon] Fix truncation to boolean vector that need widening (#182528)
240f42d95f51 [Hexagon] Fix 64-bit funnel shift miscompilation with register shift amounts (#183669)
a6cd46b239c7 [Hexagon] Fix B0 macro conflict between hexagon_types.h and termios.h (#184539)
4592b0b6388d [libunwind] Fix building on OpenBSD / FreeBSD aarch64 (#188397)
cf542a3d9c00 [lldb] use the Py_REFCNT() macro instead of directly accessing member (#188161)
d40e60759077 [LoongArch] Fix incorrect indexing of incoming byval arguments in tail call eligibility check (#188006)
b68aafeb0dc1 [clang][AST] Preserve qualifiers in getFullyQualifiedType for AutoType (#187717)
55b442495879 [Clang] Fix a concept subsumption bug when template depths are adjusted (#186735)
7b593cd6c0df Bump version to 22.1.3

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 1bd43211e2..cc6bbf2340 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -484,7 +484,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.co
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-22.1.2 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-22.1.3 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index 013a7f059d..1b8909eeb5 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "22"
 MINOR_VER = "1"
-PATCH_VER = "2"
+PATCH_VER = "3"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 3b1070ef93..82e6430a49 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "62f2f13ff25b1bb28ea507888e858212d19aafb65e8e72b4a65ee0629ec4ae0c"
+SRC_URI[sha256sum] = "2488c33a959eafba1c44f253e5bbe7ac958eb53fa626298a3a5f4b87373767cd"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


