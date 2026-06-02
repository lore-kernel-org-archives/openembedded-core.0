Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AE2CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 07:04:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19210.1780383840125712849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 00:04:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=pwAd+bXn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061343ab17=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6524Af5k851747
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 00:03:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=hbR+j+jPlA+fJh3oC6T2
	psQ9UWDLdgIDD/hznGTSRJw=; b=pwAd+bXnvMZpsy01wabjYyxdRKc7XLMldizc
	tWQA7BNRlVrwIEMHnO9eghMrxmVFJf9O/30S/41SF9fkeL8cFeOrHrhtbMJyBmIk
	XDiKTRJ7gOVSW4dKSl6wbnOQnAKMkC0PSqxceVYuu7ex+Kp0GXHYvImzijChYRtr
	YVdvxnn51t6qiKohzjXOr+UKL53JQgNBbImC5hznxmBY3GdCC/h748U1D+IlVOCj
	gh0QlfMpJAnaL2glE5LQ07fHpZbAfnjv0BTK6XHyVPQMMk6HAVTJC+jiupx8FHec
	zSi6zxEDFnpbFffcUf7UKxWeV6KKIHuZBYqCFTjK5Q3XkRMzBw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012071.outbound.protection.outlook.com [40.107.200.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efydebv8t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 00:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkAwUz4a75s2nWnqNYHFBjBh+/6sZa/Oe3Xk1tW8SWX0i3RweyRH6o9ILxTXzwWUG21ymxKWq/tbIijaFMnkYxzzCQIl2lDhRBknIKLKaeLdBeWF2rwFyqxFOLbcfytkgtmsJ5Pf72uh9prtkXabDcN5P5EkMpVfFjrVG4SZryx4JqvIFsweUuTk3v0aAZZzGx+lzfwi+LB6mjKrwht5ENfV+srfd/Ho83wlHmPfSp0yXkxrGzi04AZILnRt7ozfrrJ7HdeQrJbr5Tbjj0GkFf9Zap9Yzv3E5SuZkzM9yylXE0S1W8bZf8X0KVUirLUZUlrpGFgaUh4GEnuQpbmF5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbR+j+jPlA+fJh3oC6T2psQ9UWDLdgIDD/hznGTSRJw=;
 b=cuKOl194lYpGiRAKwlWFNlCT2FLxV9zSye8KNl9yDiy+8U0PQ6I3xhu9LNY7Gno54ke3gH14MxUHOHYJIv3OnL4ZT+xrlmxQt2tYuQ4BU9XEJCBmNOGItMNuTcnJiRrGhG0MUimmYHe/ZDChmPvL6xBN+sxeFF8jwbVW8qWH4EL2OrI7tt1xE6deeBCRaqQiGqpr6wubfWeg/Q1pO6+57MGbps62rjcWTLJi76Q0roVdg6GekmCWsmBcLNsXlwUAWO69FH+b6DQEj0Tr12J6K7dRyD82B71eEqSIdJVd1nhFJaIbxs6Tw76QSb4O4AaeY6cj2F2Uswasv5oJt3j3Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10)
 by SJ0PR11MB4846.namprd11.prod.outlook.com (2603:10b6:a03:2d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 07:03:57 +0000
Received: from LV8PR11MB8680.namprd11.prod.outlook.com
 ([fe80::9d0b:997d:b1ef:d000]) by LV8PR11MB8680.namprd11.prod.outlook.com
 ([fe80::9d0b:997d:b1ef:d000%5]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 07:03:57 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][wrynose][PATCH] ppp: upgrade 2.5.2 -> 2.5.3
Date: Tue,  2 Jun 2026 15:03:43 +0800
Message-ID: <20260602070344.1163210-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TPYP295CA0018.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::19) To LV8PR11MB8680.namprd11.prod.outlook.com
 (2603:10b6:408:208::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8680:EE_|SJ0PR11MB4846:EE_
X-MS-Office365-Filtering-Correlation-Id: 15ee7da8-fbeb-4af7-605d-08dec0751d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|12006099003|25016099003|29003799003|6133799003|18002099003|11063799006|56012099006|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	uEmyLKgqtybbLAJm+cjaWJd4VBmbZR5SOPMbHcfJekMdkbx82rv9iD93Ug0LsaaP/MzU1C1VpMY1y20enDzTaET9gfBWoiVRvU9l5vNfCttfcj4oLN9V3HXtV61k5kRlsPUIAtjTM3IB1KDZEmNC+h0k63sX/xNziH5xCwpLrI6tGQxRn7Hod/75vDI+J4/jxFpmM8xb9sDf+/KdhJFw8m2YghL5mCsATSDMgqYY/bGu8FV5bdLKxP1zQG0svHibc1r5OAcZBFeTiY1I+ZlyJeYL7PQBkzpJNTG4n0KXleORVbMHj6BkzQ7JylT/zYgxlIuo2w1T9CGhZ3k4lvMuOoQk/lIg1pPj6IH0GBM9yRrwmnl0N4/nTxeSnNSOrKJdr+Jw3P0kxs96KPTI9M84DawdmOqIv/NHSLofjFXazyFFAWH4F3zPt7J3O3wVP/3YdpSMoCirUjHJeDHH+xZ+B+xb05hW3hRjJvbGu/s97guWmPorM8/pXLyjNGyC8Ve9lQixkvBBPxTug3VE2etTX9ewoiuC68ZKIgmbLDzBjrgmpc7taqbvUpWllXyv0AnBMNdIvnc9rooITHb+vLQbORExXk5wzSDwPRxq/2iRQ1Uaj24V2FiTQL4bj+mHatbPIuZURtwcXqzM+2Pd+pO1IyAznOI6U0Q+toDK3mcxlvIiP23WmD4jm09RCpG+wJJSGFoswTO0ZeNjw4ODzhg/3A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8680.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(12006099003)(25016099003)(29003799003)(6133799003)(18002099003)(11063799006)(56012099006)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UnFmUmZ1eS9LZDliVExHS0dkbjBzRnVJZDNqcEZGYzRjZVY0TENLT29CQ1h4?=
 =?utf-8?B?RVdsWlQ1NzRIOUYxNjBrZjFZOGF0dzlrM290eC9mM0pMRmo2aDNiYWdWNWNv?=
 =?utf-8?B?MlBOa3Ird0xRRkJZUzFadlJhcmlab2JqM2JkdUtqTXRpTEpMUmlaelBOeGVX?=
 =?utf-8?B?K3d3bDZiR254ME9xd2hieE5vNWN4cEpEMlR0dWhoUDlLQXJrMnlhalh0TTZr?=
 =?utf-8?B?SmdING9Nc0lkK3p4ZlFBVWFCa2p6WitTd1NJZFVsUEg3MXA5c09aZDFtbmp3?=
 =?utf-8?B?UVVaK1ZPNFMwWjdXYTcyVEk1K1BNcFl3SldRTW9Lb1ZkbWkrbGJ2eU1yWEhO?=
 =?utf-8?B?WnpST1A1TzgrbDJaQlJqZVVtbkxKL0oraERHQXhIVllGVlB3bHA4S09tdjU0?=
 =?utf-8?B?aitQeGJUaWtBNUFkWm1ta2JWeUlIVmxpS1pRbGVWd0Q5Z3FUNzdUb0FqRFhh?=
 =?utf-8?B?ZDdLdk03T01oa1dib3lUTnJ3N2Q4Vy93MjJ3enVrc2tvM1ZENGlkVTNESHBk?=
 =?utf-8?B?QmhOUXdaRjUybkNFMkN2eTNKbGFjT2hrWUtaQTg5T3k1eTRuR1M0QzdDRWZi?=
 =?utf-8?B?eVB1OEF5MG5vcklhQWZvTTVCa3Zxc0hYYWZMTERqMGpzSWVyNTE4Rm5pemVk?=
 =?utf-8?B?YXdDeHBMV09XTFF5ejBjblF5NDh4SUpYNEdrYXZSRVZQNHFEQndlVnlzaTFy?=
 =?utf-8?B?TmhGd1Vac0JpdmVvQjZNZEYwQlNQTXlmQmpKKzV5ejMvK1Z2dzY1bksreUpG?=
 =?utf-8?B?eStEVmYwbGp1UmUwSkpHOE9jWUxoblRjclF2S21FWDVQY0Z5bm9qRTRiSENG?=
 =?utf-8?B?NWc2NGJxYUQxeVhFWUd0aXV0cklzRFArU09jZmFYOEM4MU9KejNXRDBWZXR5?=
 =?utf-8?B?WFlRekswK2J1U0pYT0tnbWNGbXVRbkVpUVdGVk5yQVduYlR2L2w3MUdQd2Qv?=
 =?utf-8?B?RWM5RytiSFFFNGFtaTVVVERTalNHOGZDazlmUnlDVEQzTXExdWJRdE00dVk4?=
 =?utf-8?B?anF6cnMwWElHWlZaQkJyM0VERHRaaW1OTFhYNWYrMUJYT1Q1TkxjaXcxdGNR?=
 =?utf-8?B?UjA3UVBtNDkxTU9mWTNGb1JmUlA2eW40Y01rQVlTTEtuall4dVlZczFYZEhX?=
 =?utf-8?B?SFdxTzh2dVh0dzFFRkEyUno2S09vcXpPNnlzNmpHMmdlbVBsZ3NwSUpVaHlX?=
 =?utf-8?B?T3dSYmc0ZmJKM0pCeG5Qby9qbTllRE50dDBYMUNFNVFjVm5haVVWcytUY2o3?=
 =?utf-8?B?aUVNMnJrYU9iaGdyN3J2THljVitZczVTUzZMNE84OWJHenB6TXJ2aEhRNVM5?=
 =?utf-8?B?WjBLOXY0S1dzTFdWOU9xaXI1bDM0TE02WGF5OXd6dHBhaG5wVXNGZWpHSlh6?=
 =?utf-8?B?aUNwVlRaY3FOQUVpY085am5vaXJuZnd0Q0Q1SngrdUtGTmxCdUZjZjRtRENo?=
 =?utf-8?B?NHlDRG5UTnhNQnNMODdSUTdMVUI1S1JjbHc1YnIrTVVDNFVyNVFTVVFlbjFl?=
 =?utf-8?B?WkRCenB0WTBhdGl5SGNUaGhrUW51L0VFY0pOQWsyUnNYeGNKdEo2bjk3VkNu?=
 =?utf-8?B?YTl2SmMyWkc5TVVDNGtHYnBaWGRoS21PeHhqejYxRitkeXh3RnhvamdlVjZa?=
 =?utf-8?B?cGs5ODkzRGZ5OWEzZ0RUbVp3MjJEWlFFOXdsMnhwaHJpMGhJNGxBSk1JbHpR?=
 =?utf-8?B?c2VYNUQ1NmlBRlRzdHZlSng0ZDE0d1U5OTJPc0VQdWJrZ3l1WlQ5OStGWk51?=
 =?utf-8?B?RjliNFFiVWxvdFZoVTJYY0xqazhzbjdUVEJhT21KcUI3b1hoRGVtL253aUh4?=
 =?utf-8?B?djB6N29ZNjZPVHN2dmtjYUhCZktzc2xuQytVSTczc3hCdXhYamhrVU43Vm9y?=
 =?utf-8?B?NnRUUDdqZktrMjdmZS95MlFrU2prMC9pZ0ZaTjA3K1ArTEhPTzB3cG9tVjN2?=
 =?utf-8?B?N0ZYeEwzbEVTYTl0YU5IWC9qRStkck9DRDluUUlVVjlxdUJ1QXhza1FaYlIw?=
 =?utf-8?B?T3lkYVZvOG5oUEQyOWRFdEJVaVpCM3Q5YUVLZllEdVYrRzg2Q0ozTGhoazRF?=
 =?utf-8?B?dXMyU3M5OHkvU0ZCalIrTWdJV0wyN1B5OXUybGFJV1dHVEJ2YW9kaVNScFZI?=
 =?utf-8?B?SkpQemRGdGllMHpUWWNoN080MkwxM3JJUnA0MmF1QTRSVjlyUjJkMVM4eHBa?=
 =?utf-8?B?WVlNKzMza1JNdFFEOGlUanFCcWo1Nis0Nk1teUpsMlpxZHpjRUNySEdjcDh0?=
 =?utf-8?B?TGh4S3prTHhqR0UyMmVtTFJoNEpIdlIwWTNRc2dMSG5qcDU3QUVTanZGUnZQ?=
 =?utf-8?B?eklzbjA3QXlROW9hMjRERmd2eXRjWEUxWkdRd0lFMk9WSHgxWjlSM0swdG5P?=
 =?utf-8?Q?0TPdNU/K3SddxSRk=3D?=
X-Exchange-RoutingPolicyChecked: 
	rd5riSI35ZYYfFV5uMyMCkEiAGDK7jd+iGQC/Jqpbg2c4LvPvJgILRs/SgInrvwq6L66XBJzypT6QURcf13yFGbEaEGX0uNNmFgHpVnU7vxVPGPxC4J0QFY5twup9viRCCEFXGlyD0w1+/OD9aiOeVo82PJFKonb0x5bpLURbVHb9UH9VxL8DWkvQAVYR08J/rFCWjktiRRYfRQy90n3TEX9aOdlkefXoeyuYAW7K6AahZ3idtKJJp8a5nRuxBVdTl5ozUsXD7KEQlYXNBYNarqSMxJ7kzYn0LepU7BnICv96ejOTY/IJgUNOymVN2xW158UsbxWVuWNqup8XZC5qA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15ee7da8-fbeb-4af7-605d-08dec0751d5b
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8680.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 07:03:57.1274
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmcHsUePGRFCh213GeDHTd42i/K3CO7Fcc0uzWhATRj1CPEIeXCnYXA18CeFNE/oLI/55uqHbbWrqtUCnNZH64csuASPfQk+JQu3oAJpRhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4846
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA2MiBTYWx0ZWRfX+JQRaHw3273M
 ovBGyB3TewMgn4pGXeTd6BEPm1/skrBcPQBiw+TSwOjZloUx5acRIVwwtg2tD3GvuPvL7C8TfAQ
 NKVX0fLAPSgouY+QMXTIWvyBe22UinFLrRHNlcgPRy/Ummvhx1rnnDKENwme+S5QVaJ47UNgxzN
 KqzfdKQXEQ3bJKZ/mu4kEHuSPhWjs+T93OZLUwDoIRVAjbO5GCFEyrGs1rFJa/B1V6xysgaz47B
 u+Phl4FxHO3XlC4uwtmI1+OxkAVbksPFQINW/FqIiOV/NjGKChtjm3Ij5wzVeHzXvyYKN0tinHY
 24nGhPCCVlbAMB0FFJjinSY1xtNdKC9FMD/i5nwDoUAWGrZsgWBg+iwNKoLMMoVy2+38W2a1tRQ
 lcAvZ7gfxluJxZrDZI4npupTrfu2erX+P7rKqgxuqrUPcmgVBqwzZJI6PEWPakBBCiVrNvsEqx6
 lakBGmpKqgF53+vecbw==
X-Proofpoint-GUID: uGJvBCIACP029XiJCgfRSUu7b15IS0SO
X-Authority-Analysis: v=2.4 cv=Iq0utr/g c=1 sm=1 tr=0 ts=6a1e805f cx=c_pps
 a=il/B+BFNnLmOqkoxAJ/ciQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=MufGLDliAAAA:20 a=NEAV23lmAAAA:8 a=vTr9H3xdAAAA:8 a=hGzw-44bAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=1Snxrl4dP2cwfw3ak-cA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=HvKuF1_PTVFglORKqfwH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: uGJvBCIACP029XiJCgfRSUu7b15IS0SO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6524Af5k851747
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 07:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238010

From: Zhang Peng <peng.zhang1.cn@windriver.com>

ChangeLog:
https://github.com/ppp-project/ppp/releases/tag/v2.5.3

Drop backported patches:
- 0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch
- 0001-pppdump-Fixed-building-with-GCC-15-548.patch
- 0001-pppd-session-Fixed-building-with-GCC-15.patch

Add ppp-dhcpv6relay package for newly added dhcpv6relay plugin.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ....h-remove-erroneous-generated-header.patch | 98 -------------------
 ...d-session-Fixed-building-with-GCC-15.patch | 33 -------
 ...pdump-Fixed-building-with-GCC-15-548.patch | 75 --------------
 .../ppp/{ppp_2.5.2.bb =3D> ppp_2.5.3.bb}        |  9 +-
 4 files changed, 4 insertions(+), 211 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.=
h-remove-erroneous-generated-header.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-F=
ixed-building-with-GCC-15.patch
 delete mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-=
building-with-GCC-15-548.patch
 rename meta/recipes-connectivity/ppp/{ppp_2.5.2.bb =3D> ppp_2.5.3.bb} (9=
1%)

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remov=
e-erroneous-generated-header.patch b/meta/recipes-connectivity/ppp/ppp/00=
01-pppd-pppdconf.h-remove-erroneous-generated-header.patch
deleted file mode 100644
index a00706c184..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-pppdconf.h-remove-erron=
eous-generated-header.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From a6eb65162db5bcc5ec26cff7361885c0a44cbbfa Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Mon, 17 Mar 2025 11:12:07 +0100
-Subject: [PATCH] pppd/pppdconf.h: remove erroneous generated header
-
-Upstream-Status: Inappropriate [tarball generation issue tracked at http=
s://github.com/ppp-project/ppp/issues/541]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- pppd/pppdconf.h | 80 -------------------------------------------------
- 1 file changed, 80 deletions(-)
- delete mode 100644 pppd/pppdconf.h
-
-diff --git a/pppd/pppdconf.h b/pppd/pppdconf.h
-deleted file mode 100644
-index 51a8f02..0000000
---- a/pppd/pppdconf.h
-+++ /dev/null
-@@ -1,80 +0,0 @@
--/* pppd/pppdconf.h.  Generated from pppdconf.h.in by configure.  */
--/*=20
-- * Copyright (c) 2022 Eivind N=C3=A6ss. All rights reserved.
-- *
-- * Redistribution and use in source and binary forms, with or without
-- * modification, are permitted provided that the following conditions
-- * are met:
-- *
-- * 1. Redistributions of source code must retain the above copyright
-- *    notice, this list of conditions and the following disclaimer.
-- *
-- * 2. Redistributions in binary form must reproduce the above copyright
-- *    notice, this list of conditions and the following disclaimer in
-- *    the documentation and/or other materials provided with the
-- *    distribution.
-- *
-- * 3. The name(s) of the authors of this software must not be used to
-- *    endorse or promote products derived from this software without
-- *    prior written permission.
-- *
-- * THE AUTHORS OF THIS SOFTWARE DISCLAIM ALL WARRANTIES WITH REGARD TO
-- * THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
-- * AND FITNESS, IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
-- * SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
-- * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN
-- * AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING
-- * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
-- */
--
--/*
-- * This file is generated by configure and sets the features enabled
-- *   in pppd when configured.
-- */
--
--#ifndef PPP_PPPDCONF_H
--#define PPP_PPPDCONF_H
--
--/* Have Microsoft CHAP support */
--#define PPP_WITH_CHAPMS 1
--
--/* Have Microsoft LAN Manager support */
--/* #undef PPP_WITH_MSLANMAN */
--
--/* Have Microsoft MPPE support */
--#define PPP_WITH_MPPE 1
--
--/* Have multilink support */
--#define PPP_WITH_MULTILINK 1
--
--/* Have packet activity filter support */
--#define PPP_WITH_FILTER 1
--
--/* Have support for loadable plugins */
--#define PPP_WITH_PLUGINS 1
--
--/* Have Callback Protocol support */
--/* #undef PPP_WITH_CBCP */
--
--/* Include TDB support */
--#define PPP_WITH_TDB 1
--
--/* Have IPv6 Control Protocol */
--#define PPP_WITH_IPV6CP 1
--
--/* Support for Pluggable Authentication Modules */
--/* #undef PPP_WITH_PAM */
--
--/* Have EAP-SRP authentication support */
--/* #undef PPP_WITH_SRP */
--
--/* Have EAP-TLS authentication support */
--#define PPP_WITH_EAPTLS 1
--
--/* Have PEAP authentication support */
--#define PPP_WITH_PEAP 1
--
--/* The pppd version */
--#define PPPD_VERSION "2.5.2"
--
--#endif
diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-bu=
ilding-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-se=
ssion-Fixed-building-with-GCC-15.patch
deleted file mode 100644
index d95c72e96b..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-=
with-GCC-15.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Mar 2025 14:38:26 -0700
-Subject: [PATCH] pppd/session: Fixed building with GCC 15
-
-Fixed building with GCC 15 which defaults to C23
-and find conflicting declration of getspnam() here
-with the one provided by shadow.h (extern struct spwd *getspnam (const c=
har *__name);)
-
-Fixes
-../../ppp-2.5.2/pppd/session.c: In function 'session_start':
-../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'get=
spnam'; have 'struct spwd *(void)'
-  185 |     struct spwd *getspnam();
-      |                  ^~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pppd/session.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/pppd/session.c b/pppd/session.c
-index f08d8e1..9cc7538 100644
---- a/pppd/session.c
-+++ b/pppd/session.c
-@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, con=
st char *passwd, const char
-     char *cbuf;
- #ifdef HAVE_SHADOW_H
-     struct spwd *spwd;
--    struct spwd *getspnam();
-     long now =3D 0;
- #endif /* #ifdef HAVE_SHADOW_H */
- #endif /* #ifdef PPP_WITH_PAM */
diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-buildin=
g-with-GCC-15-548.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppdump-=
Fixed-building-with-GCC-15-548.patch
deleted file mode 100644
index 2a3b3cc84a..0000000000
--- a/meta/recipes-connectivity/ppp/ppp/0001-pppdump-Fixed-building-with-=
GCC-15-548.patch
+++ /dev/null
@@ -1,75 +0,0 @@
-From 44a766a3d086f10cb584a0c423e5bed6af2e3615 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Jaroslav=3D20=3DC5=3DA0karvada?=3D <jskarvad@redhat.co=
m>
-Date: Thu, 27 Feb 2025 23:00:16 +0100
-Subject: [PATCH] pppdump: Fixed building with GCC 15 (#548)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-GCC 15 defaults to C23 which does not allow K&R declarations.
-
-Credit Yaakov Selkowitz in:
-https://src.fedoraproject.org/rpms/ppp/pull-request/12
-
-Upstream-Status: Backport [https://github.com/ppp-project/ppp/pull/548]
-
-Signed-off-by: Jaroslav =C5=A0karvada <jskarvad@redhat.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- pppdump/pppdump.c | 20 +++++++-------------
- 1 file changed, 7 insertions(+), 13 deletions(-)
-
-diff --git a/pppdump/pppdump.c b/pppdump/pppdump.c
-index c24208a..1534036 100644
---- a/pppdump/pppdump.c
-+++ b/pppdump/pppdump.c
-@@ -42,14 +42,12 @@ int tot_sent, tot_rcvd;
- extern int optind;
- extern char *optarg;
-=20
--void dumplog();
--void dumpppp();
--void show_time();
-+void dumplog(FILE *);
-+void dumpppp(FILE *);
-+void show_time(FILE *, int);
-=20
- int
--main(ac, av)
--    int ac;
--    char **av;
-+main(int ac, char **av)
- {
-     int i;
-     char *p;
-@@ -97,8 +95,7 @@ main(ac, av)
- }
-=20
- void
--dumplog(f)
--    FILE *f;
-+dumplog(FILE *f)
- {
-     int c, n, k, col;
-     int nb, c2;
-@@ -241,8 +238,7 @@ struct pkt {
- unsigned char dbuf[8192];
-=20
- void
--dumpppp(f)
--    FILE *f;
-+dumpppp(FILE *f)
- {
-     int c, n, k;
-     int nb, nl, dn, proto, rv;
-@@ -375,9 +371,7 @@ dumpppp(f)
- }
-=20
- void
--show_time(f, c)
--    FILE *f;
--    int c;
-+show_time(FILE *f, int c)
- {
-     time_t t;
-     int n;
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.5.3.bb
similarity index 91%
rename from meta/recipes-connectivity/ppp/ppp_2.5.2.bb
rename to meta/recipes-connectivity/ppp/ppp_2.5.3.bb
index 607678db8b..435559a815 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.3.bb
@@ -23,12 +23,9 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/${B=
P}.tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
-           file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
-           file://0001-pppd-pppdconf.h-remove-erroneous-generated-header=
.patch \
-           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
            "
=20
-SRC_URI[sha256sum] =3D "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e=
8f701b8e55733cb2"
+SRC_URI[sha256sum] =3D "ddda28dec8aca99a403ab6070d94ffd2b17d63e9a4c55091=
58e99e148f572d4f"
=20
 inherit autotools pkgconfig systemd
=20
@@ -60,7 +57,7 @@ do_install:append () {
 }
=20
 CONFFILES:${PN} =3D "${sysconfdir}/ppp/pap-secrets ${sysconfdir}/ppp/cha=
p-secrets ${sysconfdir}/ppp/options"
-PACKAGES =3D+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-mincon=
n ${PN}-password ${PN}-l2tp ${PN}-tools"
+PACKAGES =3D+ "${PN}-oa ${PN}-oe ${PN}-radius ${PN}-winbind ${PN}-mincon=
n ${PN}-password ${PN}-l2tp ${PN}-tools ${PN}-dhcpv6relay"
 FILES:${PN}        =3D "${sysconfdir} ${bindir} ${sbindir}/chat ${sbindi=
r}/pppd ${systemd_system_unitdir}/ppp@.service"
 FILES:${PN}-oa       =3D "${libdir}/pppd/${PV}/pppoatm.so"
 FILES:${PN}-oe       =3D "${sbindir}/pppoe-discovery ${libdir}/pppd/${PV=
}/*pppoe.so"
@@ -70,6 +67,7 @@ FILES:${PN}-minconn  =3D "${libdir}/pppd/${PV}/minconn.=
so"
 FILES:${PN}-password =3D "${libdir}/pppd/${PV}/pass*.so"
 FILES:${PN}-l2tp     =3D "${libdir}/pppd/${PV}/*l2tp.so"
 FILES:${PN}-tools    =3D "${sbindir}/pppstats ${sbindir}/pppdump"
+FILES:${PN}-dhcpv6relay =3D "${libdir}/pppd/${PV}/dhcpv6relay.so"
 SUMMARY:${PN}-oa       =3D "Plugin for PPP for PPP-over-ATM support"
 SUMMARY:${PN}-oe       =3D "Plugin for PPP for PPP-over-Ethernet support=
"
 SUMMARY:${PN}-radius   =3D "Plugin for PPP for RADIUS support"
@@ -78,4 +76,5 @@ SUMMARY:${PN}-minconn  =3D "Plugin for PPP to set a del=
ay before the idle timeout
 SUMMARY:${PN}-password =3D "Plugin for PPP to get passwords via a pipe"
 SUMMARY:${PN}-l2tp     =3D "Plugin for PPP for l2tp support"
 SUMMARY:${PN}-tools    =3D "Additional tools for the PPP package"
+SUMMARY:${PN}-dhcpv6relay =3D "Plugin for PPP for DHCPv6 relay agent sup=
port"
=20
--=20
2.50.0


