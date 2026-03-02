Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC58D58E67
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 06:50:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154917.1772434199045927683
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 22:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WUs80xla;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=752162eecc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226OK6D3429163
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Mar 2026 06:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=GFZVKf00p
	NPlg80fVO7CfjYWIghzeDAuuzgHjBWQrbI=; b=WUs80xla9tDx8QfXMEC7FAFJs
	DfhMA87mf8TXVEAnBMAcKt8eern4jBQVTkUZZgNcoAmUQGEWD3W9RW/uz3Zpvs/A
	wIO/jiFcuMVg8Eklgg3sRXacAV7jOtA1MdlM55SJ3oCfaQt5DLXcqNIb1ZeOp+CF
	dER+ySmD4Qe3FWzW01ZT76MubnArVyRJ+SYbphY7JRTgh3YDsdTJ1DDv/qqfCGDw
	HFUSnomt68wLX1lRwMYMVA/ZU879qojcZU4rxb4K9cgdO5N3q0BMUh1ESbSShnTl
	EMjygktoY9E+Wpl+I6GvQ2qn+h7Cna4i+Z4eO8cr5/+rCFZFbUpYLf/grHFAg==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010020.outbound.protection.outlook.com [52.101.193.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4hyv4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:49:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F1YlHwdyszW5jxnCj5iYcBUzVVDNDiq1uLy5AdeuVL0C4b5xHV7XOTGNI4r2j1tMuuzjH0Usw+VquWi2ybwp7eada6ADB9DONbTv5veyLZbfzCM448N2cgkQM0Qy9q+7HlGy311NdtdP0RCjpfjNJHI2wVZhqWG/2QSpmyO0RBzxc/gnkCfTGOxXPaTeiggGM9bY/cYnr+EXvJPCK+u+i1GTzlFbi2CwZ1j7x2j8F7gIHt50jnEJTfiS84IEAVadcHLTb3pXa03J9SG4YuAvcH2cUNTFGPYpb8K4sKaNqsqgu2Ik6iTgWsp/m8QSJWVs3xNpTIQvwF2p5RQpJSz9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GFZVKf00pNPlg80fVO7CfjYWIghzeDAuuzgHjBWQrbI=;
 b=r3Hg+dDJP/8vuxJcumXNZTLQs6Uf0aZWYnb/OeDH0fVIHEpgUrh+zXkeeC5WvdjQkoFly+KWZ/rxZbGu40hg+d5A2JdijHfleuVLiElqSKvi9UU641lceVpTyBixg85nBBJXWHOoeIFfHSArolmb8nU8HIz5nYR+QKCE/abPtbdn9fDV+Csx28q0Z8dBMvkXitc5r+iszkMInSxJJYS7iHM+bA/glt83bUA6dtC8fSi1jxaIbrKBBCCUDfzeT896ChbFt5GRir6VtFLU7QkQpnsOYW6tLP/s6nbL+PLtf/5gmFpxrtB3YMAP6tPdf0685mrj/uDStx+JFjrgAhru7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6682.namprd11.prod.outlook.com (2603:10b6:510:1c5::7)
 by CO1PR11MB4900.namprd11.prod.outlook.com (2603:10b6:303:9e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 06:49:53 +0000
Received: from PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de]) by PH8PR11MB6682.namprd11.prod.outlook.com
 ([fe80::cc94:c7d0:93c5:b6de%5]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 06:49:53 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.Macleod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH 0/4 V2] Oe-selftest for Clang, LLVM, LLD
Date: Sun,  1 Mar 2026 22:49:34 -0800
Message-ID: <20260302064938.2052450-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:254::31) To PH8PR11MB6682.namprd11.prod.outlook.com
 (2603:10b6:510:1c5::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6682:EE_|CO1PR11MB4900:EE_
X-MS-Office365-Filtering-Correlation-Id: bda9295d-279f-4011-1f40-08de7827e8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	b26IPr0lMb7so72YHQnpIFvqfRrKe8er1gUlLBn1iMBJzDuj9imS9Mw6fUrv3Bxas4KgB4rR09MfeGk3ZjyTA8SMdvVwsnAvfqgjQ/dlifFnI3ooYEzmWSdo3Y1Sw+Ubr3euDKR47po5MhZII+onJcO784zUUaC5+44hX55Ax1cgyRFVwT029n0dKkv5YJ0VZmV5PXUOmP6cjKwpebsk6jtuC0ahbNwb6kE6V7EYuIuS11PKfDjNEF4VsaMXomfkmHZkQ4AyjPtHgTPcKwr1fX/R0Bk5olpEfIINF3p11zQKULQZtJHrD7F+/igetf/4UV/LlLF+o9dcV8fOX+jb10CrDcPR+9aEDyTDdLy3Kke/vLxOnvCEV05DLjnGSNHnAj3Z1jEYOXz/J26u74P5XkuYvcawySMCq2mc2Ke91mUT4H4pONPfvcNeQ+vq8w7V+i6qOMA2PSXk27AzXEgYPxjDGfid1dsTmzlSp+mWuHSCe/Vpo+LJHXWzwsbQnU22beE9nVtfkv3RfuNjflCm93d0y+G+FOa83UcapKmY/u9dd+RFGyfppm6vvzH5y4Fut5XGsynpRQ2Kia9WjmKL4TKPuO+Ddoy9+SoKK5ASsJ4T5Pp+TSJKCkFWDO2ftJLSV7/tq4iAj1Q7iVKTkYlUzND21wb01Sb81mV9Z1sV/c2N+yJ1cLAPd7SFc31WTHZmkf9tfQxk2ND3KhTC1zxrlyL+2K77FJmjPxZPxITT4f9XHs7quycIeVndCQs0d2SO7e1/Nqj/8MLRdpXjp2Gitf5LIwB0logmhvfAIgpuURY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6682.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7wODTK87GxAKNZjodc5A6p2M7AYv9pXQ/3EV0d7PvbR//VkeP87YjFLN8WTl?=
 =?us-ascii?Q?hC7czmGkVo7T//BUMYUQPcBjIkbWiv0o9AiDeZ9myR/jDaqVo15MTGcWuezs?=
 =?us-ascii?Q?ubeT9jsh8no8/btpgCrFL9pIL3nAPAgTP1Vk4LsaiMgHxaJTKbsCYNCtwIL9?=
 =?us-ascii?Q?kQiOJhRXnjntdOe6BivvsNp3zS4Flep6aS8cGIUTWHOv3wVjBQIt54iRla6N?=
 =?us-ascii?Q?lcDrzrkjoq1Ccv1gJJPMJ8D59JwZ7i/0Jgg+zxBl3ZUVW1x5ZffmCYoVmNhE?=
 =?us-ascii?Q?vcHBK7kc46jX4Dz3j17RLH5Lckj29uGqWY53iHrOcZCGv7+n4iTlu6vB5eYA?=
 =?us-ascii?Q?2ZgQh0EGDPHxbGnb6kipLEfHPSMxLRH/yYuxSnsfPhq2Er6nWKUm/wAqeXSP?=
 =?us-ascii?Q?qy++VMd3Wh189oFQ2eJPkU8tdTZhE+9tIxsrko99Ha3+ataAF7bJxtwkrfzW?=
 =?us-ascii?Q?JbevEnA0p6hC0kvjNorzdLrEbww/13q5H/ja4mbliXbp/d+zL78+lv7fxMGr?=
 =?us-ascii?Q?SmzeOQVqsyMpBn3FMcuIk9pZkjvnkctNU4btpra0ZW/9RJ7XAMFCWE5GNN0w?=
 =?us-ascii?Q?BByDr6XfW8CWRsX6k4O3/i9wQaEWpeeoJuPoOCvDaJZNu3TiF8b8gYxhwH8V?=
 =?us-ascii?Q?51t7ZKaf40UitH5PQ4uD1cViyPK2OjvAF5vExTno9b9pMEXkLoTbEvQpM+eB?=
 =?us-ascii?Q?xXdQivgM5+3DF7SKcMWYZp7wikPRL8yUT+Isb+z9cXMVf0brW9DmFJh4b4dg?=
 =?us-ascii?Q?ONEjrB3xPcyoZ9eJAdRUJUXlmoOycziXbwRtBKv8zcOgITYBUfZncDX8usSW?=
 =?us-ascii?Q?MEG/4iZbtZM0v9eEXS/cL09h2FYr1MY0nx2Y5Z1ltolMGRSAEfPOyLwOhV0N?=
 =?us-ascii?Q?Rgch0vezoN/iPVOYEWXsHe4ZuBTKPRb5Ko1/uYkQCVFzRCuaylastl6eosBz?=
 =?us-ascii?Q?05gX6ze1LWF9PuOBz1+9LIgbIKvqZJ3u37tRy4MgRnOfT7mFslpRbug18GeS?=
 =?us-ascii?Q?tvlc6BLTO3dziUnmFKXV7rbKYL45XrttbgRg94K08Sbbct/Vjsi7Y/dQdhOO?=
 =?us-ascii?Q?gDNPXGSibzrQ1wTn+eMREEMNwte6jZNmkCcKPNuGG+49X79oxBxT6QWrUdT0?=
 =?us-ascii?Q?TlY0v6Aru6X+XYYSWp/RYG9hMK037WHeHe7beKL8Z6u1fxJGdxklOFDIbVEq?=
 =?us-ascii?Q?EmEtDSTiaynIAWZD9ibUKnqcpGWRZAjP52ubP4aIhEvlKgz1/pWWJr8vbtOW?=
 =?us-ascii?Q?NLW5OGlShBJRiNnPcWXAZPpmdtuuZmt9A3ADbKPCH1dILwByWUTiuV0ezIcK?=
 =?us-ascii?Q?dFm4Knqp16/H1f9QwXSgZPkxSVr3HxoDqbG+s+evztx7PnTt13ejWJk1IMjm?=
 =?us-ascii?Q?iH6Axk0hnTpzJsfXkTAX2KOYJAkdMfyDhFj531oiAHOQaRerd6P1VNW5ZDlP?=
 =?us-ascii?Q?MmxRKmdsVTJ7rqirUDg8Eg7U3ZtOB3afNS9v2HLtNjzETpVEEJ6fTMeSGah/?=
 =?us-ascii?Q?kuMyD5sAraueHr2mfmCA1xnVst2fkVrAEw+YZ99UGiRLtyTAK0T9CAIigVfR?=
 =?us-ascii?Q?8skkacgvzyUW/N8OvW1tG7XKBgYpJpd/YFK69CplB+Iq4v1uTPdq4Jgkg23u?=
 =?us-ascii?Q?dDF/jFAnLpHxeFmgqxNnmYkOmWA2pH5wJzd3JPQYJYDg49waIGd7BKOIMc5l?=
 =?us-ascii?Q?mCzcV1/VDvMqLcs/b5E4KDDgjtPjDcyAY4XDPOdh1yZUF7ckovQo8nHpY4O0?=
 =?us-ascii?Q?U8vc/iQN9GaQOOqjTD1jBpp8Tj504Hsm4zwjlteQeXnJmjyR2Tlf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bda9295d-279f-4011-1f40-08de7827e8ab
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6682.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:49:53.6618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bP5L2GRs/XsJ/8MXNlI0Wjh6VL60mxSzGafoJf/XA0Jah7wWt/cxSheMrpcf5E6g4eY/uqmQV4AMrLMFpBdeUQUHwRHMVpu1zwvKIAyf+iX66VP+yLWdpy1zWq4PiVTp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4900
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a53315 cx=c_pps
 a=Qq37X6yQjtlUzqIQK1H1Rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=_R6S0MtfepaP2ItYXYkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -h5WfQEHwS2qiYQ2XjjnTQKhK1y77nnT
X-Proofpoint-ORIG-GUID: -h5WfQEHwS2qiYQ2XjjnTQKhK1y77nnT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA1OCBTYWx0ZWRfXyo4BFxuh8210
 8QdtFF1A0zMsv+AN/j52TMrJ9v7/ovB+0I/aNz3VlnCPqW1rW6RuLfcw1yWO7YcAyp+yiqVVcZp
 mXYqQEqCFkXUSyky46Pcw692d/CyWSmNCbkK0/nx4NageYhh3p7JxxZv+L7Gh+CIaqK/vD/Zaz2
 g1I4+hyfddPO5mxrCFz3DHf8LVmgNrQ/Dv53bGDS617Ox8eRJCDn4yj68+sh1cAVgmEn6iZ8OAu
 2lkuWP8Y3u+mDDeZxmHY5ZBMJAAjuoGUjZtmQ7eIukuXqeuomUra2pX6Tp2NvVY19ZEQTIa2YL2
 AAASh+phO+qoMV0twj5PaZKlstWLWamplrHCvsP0PuhSDUMGeK6GWUP3ORWcwDrvwBUc4EwTiqK
 u2RF+wlAbvdTcU5pqqRxCIo+OFwCvcXTMiBHAjPLc5ihSdhfckLyilj7bUWz870wh3vsCMzZtHT
 qJUnf4YdJfynbdvaPxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 06:50:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232173

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

This patch series introduces a test framework to run selftests for
target builds of Clang, LLVM, and LLD.

v2 changes:
- Enable required CMake flags only when running the testsuite.
- Ensure default build time and package sizes remain unaffected.

Summary of changes:
-Patch 1: Disable clang-tools-extra tests, as Clang's CMake cannot
          detect the llvm-bcanalyzer target.
-Patch 2: Enabled the necessary CMake flags for clang, llvm & lld tests
          when CLANG_ENABLE_TESTSUITE is set to "1".
-Patch 3: Selftest script for Clang, LLVM, and LLD including exclude list
-Patch 4: Fix rust build failure by replacing target llvm-config with native

Testing:
1. The test suite has been successfully validated on x86-64, arm64, riscv64
and arm32 for all Clang, LLD & LLVM components.
2. Clang and LLD tests passed successfully on x86. LLVM tests are skipped
on x86 since it's broken. A follow-up bug will be filed and addressed.
3. Clang, LLVM & LLD all together ~80K tests are there and we currently
~250 tests to exclude list which are failing (0.32%).

Impact on build time:
These builds were executed in a controlled environment without poky-sstate
enabled.

Default(without changes):
+-----------+------------+------------+------------+----------------+
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 22m18.441s | 22m31.905s | 22m23.718s |   22m24.688s   |
|   clang   | 30m09.774s | 30m22.680s | 30m15.312s |   30m15.922s   |
|   lld     | 1m26.994s  | 1m30.415s  | 1m29.006s  |   1m28.805s    |
+-----------+------------+------------+------------+----------------+

With the testsuite changes applied:
+-----------+------------+------------+------------+----------------+
|  Target   | Run 1      | Run 2      | Run 3      |    Average     |
| --------- | ---------- | ---------- | ---------- | -------------- |
|   llvm    | 23m32.104s | 23m45.887s | 23m38.157s |   23m38.716s   |
|   clang   | 30m31.402s | 30m46.198s | 30m39.445s |   30m39.015s   |
|   lld     | 1m29.845s  | 1m34.212s  | 1m31.925s  |   1m31.994s    |
+-----------+------------+------------+------------+----------------+

Comparison:
The additional overhead is minimal and primarily due to enabling
test-related build configurations.
+-----------+-------------+------------------+------------------+
|  Target   | Default Avg | With Changes Avg |     **Diff**     |
| --------- | ----------- | ---------------- | ---------------- |
|   llvm    | 22m24.688s  | 23m38.716s       |   +1m14.028s     |
|   clang   | 30m15.922s  | 30m39.015s       |   +0m23.093s     |
|   lld     | 1m28.805s   | 1m31.994s        |   +0m3.189s      |
+-----------+-------------+------------------+------------------+

Impact on package size and Fix:
The testsuite changes has a negative impact on certain package sizes,
as below:
+---------------------+----------+----------+-----------+------------+
| Package             | Old (MB) | New (MB) | Diff (MB) | Change (%) |
+=====================+==========+==========+===========+============+
| clang/clang-dbg     |    44.99 |    59.79 |    +14.81 |    +32.92% |
| clang/clang-dev     |    30.22 |    30.22 |     -0.00 |     -0.00% |
| clang/clang-tools   |     5.05 |    29.58 |    +24.53 |   +485.87% |
| llvm/llvm-bin       |    16.40 |    71.77 |    +55.36 |   +337.50% |
| llvm/llvm-dbg       |   386.79 |   646.12 |   +259.33 |    +67.05% |
| llvm/llvm-dev       |    32.67 |    33.67 |     +1.00 |     +3.05% |
| llvm/llvm-src       |   387.54 |   389.44 |     +1.90 |     +0.49% |
| llvm/llvm-staticdev |   609.68 |   616.80 |     +7.12 |     +1.17% |
+---------------------+----------+----------+-----------+------------+

FIX:
All testsuite-related changes are now gated by the CLANG_ENABLE_TESTSUITE
variable (default "0"), ensuring:
- Test-specific CMake flags are applied only during test execution.
- Standard builds remain fully unaffected in both build time and package size.

Deepesh Varatharajan (4):
  clang-tools-extra: disable tests
  clang: Use CLANG_ENABLE_TESTSUITE to enable LLVM, Clang, and LLD tests
  oeqa/selftest/clang: Add oe-seltests for Clang/LLVM/LLD
  rust: Fix rust build failure

 meta/lib/oeqa/selftest/cases/clang.py         | 299 ++++++++++++++++++
 .../0042-guard-clang-tools-extra-test.patch   |  74 +++++
 meta/recipes-devtools/clang/clang_git.bb      |   8 +
 meta/recipes-devtools/clang/common.inc        |   1 +
 meta/recipes-devtools/clang/lld_git.bb        |   5 +
 meta/recipes-devtools/clang/llvm_git.bb       |  18 +-
 meta/recipes-devtools/rust/rust_1.93.0.bb     |   5 +-
 7 files changed, 407 insertions(+), 3 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/clang.py
 create mode 100644 meta/recipes-devtools/clang/clang/0042-guard-clang-tools-extra-test.patch

-- 
2.49.0


