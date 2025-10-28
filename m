Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68DBECCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 10:28:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5041.1761647320611102549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 03:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=huS2WAsD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=33963afc6a=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA2Bd23680251
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 03:28:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Apy0cI1D2kyUimaFQJOKvvIbMHIwSGrMKM649yWN7Ps=; b=
	huS2WAsDYr9vwq5om+LkAEqyuj1y5/XI9vk6snSZYeNo0GvwYZFn3AVWGoMCEWH6
	NNFCPTnD3nTVT7zHIBmLkYiVgWzsQgZiXnT28AJxKhb3rtTXQ4KSflDnf5E4/INu
	eoQ2ZBEQdvYhMoAM1Qwzv+UQYw+/+48Mj+i+bLAzjheOi+9jBvhGX5TH1QgoUD1+
	R6tQM2MVlfDlP2LGAatpkEozu2ijdb66RXfbG47oHLa2znPvhqMm1ALFI+ADSkW6
	Y/LN8A3J0JaExdi+iW0b5xZbyXpPUd4fFPHNXZ1m6Exqo5Jho3sv2lHqf7RQDgfe
	NEA8EtMFHWRH6pX5xJi91A==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0su1jwdk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 03:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uxtc95zUCbdlh8mKlyY9x5XmrCzok5uEx7TsGT53aMOxKUi9PEi8QFUurvHUpXoUS7zFv9NrTxfYsfG+rKR/xePsKBvhkOaaXX5IuHs7AjtHMxN+0lbOZfET2rTlXFenIihcI605Vod00jE9k+sgofE0gsH/4Hpje7QVgNan4ycBpzTpe0WVSTFQBuyjmS87W0tauNqDj1yQIM5zZuoPF88Zemqzx87Kl9XkJb43bSsmK90yfHJkby6KW514GpaF306kqu5be7L9osj6ynjwwWzCSbnXH1qYCCEzyw3qa/ZVxGJv5/qwBmIGtWTi4C+918nFnZeOwQdiM/N7sV2/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Apy0cI1D2kyUimaFQJOKvvIbMHIwSGrMKM649yWN7Ps=;
 b=yRGnssAfW7Vm8jB14fUkp/pzJeA9Wt/v1rkchJqlo4rX0fELlNOlkZtMriWcN1rzuL+x+Ma73naljgilpFdMiqx+HI6SzZAK+V8ei8nwhFxiywhtxJD7rPeLJP+XGtdXuDmJcig0x782JtCr6xNdhrlWF0h+54yASuM91zoS8XDFEq1W5UDc1EqEpRG37PRfZjTwaw1fFrZ5wBr1mEpa/rnn8QbPFsbaSxdi35YDw51T7oCOe4zrYkhR55IuKnoRU8l3HPgMDm5zV/g8FjXskN0LI7Q7Ctt+Mhi2MCi9fUQtcWcT6pkyk/KQOYBu+e8oum37ejtXWmqCa9NQWQgIMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA4PR11MB8916.namprd11.prod.outlook.com (2603:10b6:208:55e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 10:28:37 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9228.016; Tue, 28 Oct 2025
 10:28:37 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [scarthgap][PATCH 2/2] binutils: fix CVE-2025-8225
Date: Tue, 28 Oct 2025 03:28:02 -0700
Message-ID: <20251028102802.370840-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251028102802.370840-1-Yash.Shinde@windriver.com>
References: <20251028102802.370840-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0048.namprd02.prod.outlook.com
 (2603:10b6:a03:54::25) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA4PR11MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c4eae1-bc41-4981-1def-08de160cc165
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LnFSrNAFQJfX/XBSc9YaR4AheMcIJ1/Tud3Xak5JoA5Cs1R2IkAwC7HP6zxG?=
 =?us-ascii?Q?sGYsRphRxB3ko4IFLkIintD9DfN7LYb/ty5kosHgN1516BkiMswmbivEDxP9?=
 =?us-ascii?Q?R0rjajOOPDaVgwTM9ejwOTPN/shVIe6fxCMUziHd+aGg/QhFduCxLIqZ5zaE?=
 =?us-ascii?Q?qYsnnqGaQ2JrC0L/j+rfRXQV/fxKbS+fhPGuqkjAel2JgbHmjSdNZvQO+Vz0?=
 =?us-ascii?Q?Oxp+qg6mxU6s8nPYj3vfbxdFl3ZT67JWnXYgW6WUDRR768gTRzHd7Y6y6b7q?=
 =?us-ascii?Q?hgPHUYdAetRGPfm/XWlzaKCgT7AaWLexgWN8m6djdvhTo2fbw1V0fOQfZUn5?=
 =?us-ascii?Q?ivzS2ziqFal8mjf/8xiYtFiQEMDwP40EZrj2FxEdBvsfkDAakp3vPSxLJWUu?=
 =?us-ascii?Q?SiyVS0l5Cnm9YCFer8Cr7Dp2jxdqt18Nw4gM0kpFMl0HiBazBuiRxuayxZyM?=
 =?us-ascii?Q?mpqjDdcYPk1bszu7QlZICyVA92GyExpE3zRC/qFOn6VxgP5yCpmC7V2nOLSd?=
 =?us-ascii?Q?achZ5DxQlUI7cGd/D0uBArZS/bnQlZa5YE2bIv+LaXr6Gk1Yd+WW0y3XKcNe?=
 =?us-ascii?Q?NF8+yXzEl39CgFc7nAgW/a7OACGvcvT4RtxSiNyWv/sdNK3+O4EhynNw7xVn?=
 =?us-ascii?Q?pzJ2Y58D33vgsLYi8/6VpoH6f7/HUUKritM0Dgpaz3F8F4KLZMe1Ram5au8r?=
 =?us-ascii?Q?c8nsP+JqrdjwKHmQiMTUbQSe+RGPqomUqP2HnO+XltytE+OZQ4CaEJX2kQVO?=
 =?us-ascii?Q?TpJEVxkB+JMFmZHqbaaoYs0WhmDgTBePpyI7BUOluiNNy28FLAAoHK7zHd38?=
 =?us-ascii?Q?FSec6rK4tL46v0PMegpDaFfs2ADF4AhKrWoqBOEvZU60ULhrOiQ99Oxzw5kR?=
 =?us-ascii?Q?hmHw6F7NBIQ0OKbjHv9eeUPh7qBnCMhyQhn/TvV8yLktsTgoISi9OzZlNvq9?=
 =?us-ascii?Q?2Wdj9xJ85NAo/jWK1jOZl92Sh5WQT0KHRh1Fw2fQvLUxQC1yhTyzZIXcZbyJ?=
 =?us-ascii?Q?pRYKWHKvmuIKng5sCZpaMo/68Gir2H7rb6pP8jQ18Xir+X/N/ap6Rz2YsKZD?=
 =?us-ascii?Q?dCyMCGPHbSQjNeHdM9+83xT6RATX4fF6BUhBaA+Qqtrco2kTxCzlh75ZasbJ?=
 =?us-ascii?Q?uLpOY9iegR4hc3tw4veAYmj5/uyD8fOtqtvZKsekitgWlzJeWGdNy+NNfXoP?=
 =?us-ascii?Q?2QFrS+0kN5CbE3w7ojQ1/pFeMEYKOJcbRE291jdLrQsdU3/TmPGPEk1uzdLS?=
 =?us-ascii?Q?OC6SnNboxXrj1j5HzOCfGm4Zw5dIVXWEnF7pjjtpmDx70cyWPKX5D2fBV1uO?=
 =?us-ascii?Q?A2PAk9G+Ty8vpWsHLLKYOQlCOcV9hZzVdYyzjHPIUNG7YDvNSBqC5rKsio98?=
 =?us-ascii?Q?E9l7nz5BVkgyo2VFIlyYjoK1Jenjof2jJimMBi1V8SGhETTeXiOjo59X8atU?=
 =?us-ascii?Q?Ag2Agqh87+Na7b5Ddovx67IXF69SuxSmDhTj8J2Iud+wffJXcZSZUw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r/1IKM+UPlHnnm+UbpRfMVoGpmnFhpuUwhV+KXtS3oMc9mkVeCaqXSAHmEuy?=
 =?us-ascii?Q?pZpinfyWSbw4+/Nki1d20pOFTb4xpEjMf08gLi9SZQz+pSel9bzecvwOyNYc?=
 =?us-ascii?Q?mjWXD/7QFrAGFCBcQbR6EfAaeBbHeTKC8DpbGMB4/PyFOTSW4jtCTmGWD0rL?=
 =?us-ascii?Q?U+c1PissZq6qwGXaVSM5eNOE/NCRC3FEqMiJ15hYu/EdQzpWOK3keMjFLO/n?=
 =?us-ascii?Q?sHyHyWNeFWZPm5ND4OUzaFihQtaG+8QtoT+6vRLprBWHY3lEkLrpYWPcZ7jU?=
 =?us-ascii?Q?1kXaCCew/28Xo/kgEK4Z3CQQ6tD/3vgBVtJlGZWE/HSFMhvFEVEo6IUr58j2?=
 =?us-ascii?Q?f/Fg8dvpTaccH/f07068TSrTWQKGbIbHeS83H05KToK48ZxCxBUfkfN09Lxu?=
 =?us-ascii?Q?2UunaFX/UPlX80vwdYbfxfEwbwrPUYpSS7LWxtSpJAiKoRcPdXIP2v2PrHEc?=
 =?us-ascii?Q?fWzLrzcJcB8fhCUstUM7Lwr/941huyYm8oYXt4TS5jz437UXl/pn95JJURQN?=
 =?us-ascii?Q?yROg3l4q5feY0K6qO+CW1J+vJjYb8gVG9ssMZjhbZ9hr7gDgfZMYYeyyZsSD?=
 =?us-ascii?Q?fK/c2esGV5xHlLarOE1+7oIvAG2aG3U0qxBjL7Y0mDcFDmK923uPfQgFbIhJ?=
 =?us-ascii?Q?mwb68camfYn+rIKiEO4RBHKUReiWD3D3/zcw1UUJ2FXPS5+df16KLivXLvAo?=
 =?us-ascii?Q?biX02vbQPPQ4CwLc0SS9nOhii6lveZsN6fXxX/fItsuoHPqtRYwm/pzvbqiF?=
 =?us-ascii?Q?KTPSR9E7sca3jm00gsZntCptEv3jq0FCaEDwSNynQFrqh3qcZLY6raDkiJQj?=
 =?us-ascii?Q?oQFyjqREMugcaZAQ7HfS2/NBIbIBV0rycA0Wem1ZBlUXKXopr7nBLB4j4WQv?=
 =?us-ascii?Q?hMvpAo3SLBFIXXWxzYjp4os6H1ykeqKgXuwQFZadKAVQ/ZYz2C+UVAMVnRlc?=
 =?us-ascii?Q?nVrRy6oXH4LYSMN5Q7Ea0S1tSv2+0IOkVcejOt+KmQ3xSVHdEgzb+MFJCG08?=
 =?us-ascii?Q?n3W780KSKp+rDvX1m1NkSrz3f2LPLA1Xm2UAZCtmteRBjR4vVmz3y14eqCbd?=
 =?us-ascii?Q?M0Og2/jhtHsRoiVmtrWlFphBb7Tf4PlRw0HSo0v0u7BLRLFtWUrqALMYKGrC?=
 =?us-ascii?Q?iQ8dpbr4PEXQopwp+1fLuIjBKPZkD0sCumvbc7BHyzsDMst2njLpF+j+UmjZ?=
 =?us-ascii?Q?E1mdA+4q4hBqg0VMvY1yCjNZa9I8aF2UR8Qsu/tN9IIY6dnQmcAZxICcdtp4?=
 =?us-ascii?Q?QRXQ/IjAGcM7VihHglPkHyPCehoVNmh/eEj75JgE3H1h9WSLSQ8tQKp6QBlK?=
 =?us-ascii?Q?qpLhFmF+TLSsx5yrfEwMRzKeltDEs7Rpp45Ib0dVIsKPEs2lQiqSN4/cuVWb?=
 =?us-ascii?Q?GGStopSBUXi9KKY/m+NkWTXQhgffO9siUPknL0/omcHZkOHMYwLQg7JNjonM?=
 =?us-ascii?Q?r+HUU04lmB4bcW5vwf611Zd6NoV9BQHJHOi2dYOhTYwIuqCDmGZk86hxhA9g?=
 =?us-ascii?Q?vXgrYl05piucTmmNncu8+tSAwJazSh6Z8GNhjU4wlN8qJ/DRjKE7UW7xfhOG?=
 =?us-ascii?Q?TotlhpFf2Jyip+TMNJQ3JkCpVE12F302szzE20nnr/ON2uLKtwrg4A/eZOt3?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c4eae1-bc41-4981-1def-08de160cc165
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 10:28:37.4179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IknZzoa8+7dR1yn1yfdTSwz61kRqMwQ7+jRVQ6TunM70pYAU0FXq3ktQIObm28SJ2kX/vHaTgu4P7O+F6gMyO59OStsMUYSb0q0DhG0MW84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8916
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=SuadKfO0 c=1 sm=1 tr=0 ts=69009ad8 cx=c_pps
 a=H9d2Io+6O/etw3jU54J+0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=i8IGbyu1qK8S-DYGAGwA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA4OCBTYWx0ZWRfXzyOv6mSl9CZH
 pxp9alSw2kM3i+G/aU8znOSDC9j6lQCpwZ6EfEeEh09UgwjlWonOwKaKdSZ2/iOQ6oeH5z/9R92
 kPUmC44WlMtM58v/2R/6XEwjjn4xRiamf986TsEKFBgUyRT/fJo16ZP9E/rvQdLdh/gNDIby/Do
 9DPDdh/vXUJSBoYCfLz1yoZ6aD7bHF3zd/S14mIXtkPBB9ofY5WZ8ZrAWG6wnjhPcUWKbCv4RJH
 ca/hdwjVHCf/LfIK7GcVV6WcW57AyXkS1L9lnmi5HE7TEKL7z0amRQvvmW2V2f7iYWDcVAT36VK
 7KelnfcVsI6qW97Es5eO26yNjgj+Wabal46/3CsdAA3htHTf0FqSHcdR7Go+gXl3+NMrmiA/cS4
 QoMomkvVqtsb98oTbp6k+fgpSHjLSg==
X-Proofpoint-GUID: 2S0ie0u4JUrlNsPtnPjOek8PEZISKoYE
X-Proofpoint-ORIG-GUID: 2zssL5rBS3p_tbUfRJtB4ZGHN1cAvKsD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 10:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225392

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE: CVE-2025-8225

It is possible with fuzzed files to have num_debug_info_entries zero
after allocating space for debug_information, leading to multiple
allocations.

* dwarf.c (process_debug_info): Don't test num_debug_info_entries
to determine whether debug_information has been allocated,
test alloc_num_debug_info_entries.

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0027-CVE-2025-8225.patch         | 47 +++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 5447ab0da4..dcd3325ecc 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -62,5 +62,6 @@ SRC_URI = "\
      file://0024-CVE-2025-11082.patch \
      file://0025-CVE-2025-11083.patch \
      file://0026-CVE-2025-11081.patch \
+     file://0027-CVE-2025-8225.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch b/meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch
new file mode 100644
index 0000000000..410ba64143
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0027-CVE-2025-8225.patch
@@ -0,0 +1,47 @@
+From e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 19 Feb 2025 22:45:29 +1030
+Subject: [PATCH] binutils/dwarf.c debug_information leak
+
+It is possible with fuzzed files to have num_debug_info_entries zero
+after allocating space for debug_information, leading to multiple
+allocations.
+
+	* dwarf.c (process_debug_info): Don't test num_debug_info_entries
+	to determine whether debug_information has been allocated,
+	test alloc_num_debug_info_entries.
+---
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=e51fdff7d2e538c0e5accdd65649ac68e6e0ddd4]
+CVE: CVE-2025-8225
+
+ binutils/dwarf.c | 8 +++-----
+ 1 file changed, 3 insertions(+), 5 deletions(-)
+
+Signed-off-by: Alan Modra <amodra@gmail.com>
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/dwarf.c b/binutils/dwarf.c
+index 8e004cea839..bfbf83ec9f4 100644
+--- a/binutils/dwarf.c
++++ b/binutils/dwarf.c
+@@ -3807,13 +3807,11 @@ process_debug_info (struct dwarf_section * section,
+     }
+ 
+   if ((do_loc || do_debug_loc || do_debug_ranges || do_debug_info)
+-      && num_debug_info_entries == 0
+-      && ! do_types)
++      && alloc_num_debug_info_entries == 0
++      && !do_types)
+     {
+-
+       /* Then allocate an array to hold the information.  */
+-      debug_information = (debug_info *) cmalloc (num_units,
+-						  sizeof (* debug_information));
++      debug_information = cmalloc (num_units, sizeof (*debug_information));
+       if (debug_information == NULL)
+ 	{
+ 	  error (_("Not enough memory for a debug info array of %u entries\n"),
+-- 
+2.43.7
+
-- 
2.49.0


