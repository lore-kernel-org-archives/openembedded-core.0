Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26555D74970
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 09:28:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13544.1766136532897491393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 01:28:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jaMJvzWX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4448c0fa6c=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ69oMW2591427
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 01:28:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=iz2N0G1dS0UPe5mKiBP7NLQYm8fKPWY/6Mv+h7wCG2I=; b=
	jaMJvzWXCJ8j4C/NmPKLnvFrWjgM7JbNLY0DIWay8tjx3mIP+JsxwTw53UzWbiSe
	46l6XhSd2DN55sNuEy8TPLhxRBoFFA21cD6rHK3hMGTmFqgvYlOBOEDK7Qv8Mc9j
	9j7ahtfvRRdm2gRWrtbYtLiCtFVB/ZUNMMZPgvyymvyhbLvNdX8fv/mwIpeTSEy6
	qDM0vGpk7IUTQBRbXljqnXXtZoyNs/oI+Bcbe1y3NRlSfP0ooL54nNuSstW2AFk6
	T/ye9kjHbBuzB6zdoXCRQx1gcN0H097IDSYp8NaoQKtG3pUV21y6Koq7yVqS+5mF
	ZuBr+rvPO1eMe+e2AHBILA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b4r2urnp2-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 01:28:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5JvA8Pu1qWxT+6wa4PTsXuXeIQXchvxZNHv/T3Xvqju6nfUkbOkBbleZ2GN7e15mL5P/ADNZap5/SOdwG8fJlEpceG73PbXpx/7N0WYsQe3YrD2uVF/b2HLo4WAzvkMy3dvrD6I3ZYPqjC9QJacCypCBy+BQTL7PmLQdsjFf0cZb1/h/inq0EQhB1whGiA9WBg1Ypf8za3ehsM46Ezmd+Br61Hytgpu3rzykweVLZ02RmIRV8CY1VKHg4druJDgaDKtctAVzJLIye1EQs+aY0z4lHskFcynuTSWD5xIJU/Pi1bwd+yYbU9RnwI4j5Pii6iNAO4OAQPu9mOCKzKSiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iz2N0G1dS0UPe5mKiBP7NLQYm8fKPWY/6Mv+h7wCG2I=;
 b=pDJSK9G5KUG5BkluHfvZAcq0C4Bkt4cN1UFyyOiQPRBHtZpSK3gqVG/MG+O9BEgftufkHIRc+ISbaiACWprjdWPFXE7eQ5+xk3eit5oH5X2pdr9g266/gSGRGbfGFouWI62Bvo7qBD3q9l1ZE17N98HfEWKkAtGp3mPeNSxhkB5phyNjlCIjLXhVVJYyy0DweKzh2S0VGad6EbiYDjPu0WrLm7HQdWbOoc9dYi9OlVzZKdlh0Z7+8vjsWKUa3zAx4k3KNy16Uvr8sTNW+D1mu7FG1z5CpsrCMexcO3rTBsB4lGuQYnVcrG/UXrY8hgDUDnJJYYnHOUUIyrrVU+Aztg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS7PR11MB6040.namprd11.prod.outlook.com (2603:10b6:8:77::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Fri, 19 Dec 2025 09:28:50 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 09:28:50 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 2/2] binutils: fix CVE-2025-11840
Date: Fri, 19 Dec 2025 01:27:54 -0800
Message-ID: <20251219092754.90100-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251219092754.90100-1-Yash.Shinde@windriver.com>
References: <20251219092754.90100-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0259.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::9) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS7PR11MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: d91846bd-de58-4f09-6bdd-08de3ee1047b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jUKJXz7kol3XFNNkIO2KXsg0gekqfoKTrHIxYZjRq663gJTB4ODHwb3VeVya?=
 =?us-ascii?Q?zuImGR4D9aWhT+U/Sbr1e4i3EpQaShC26DGhUw8THjwOuqVvo6h+IF/8oZ9Z?=
 =?us-ascii?Q?6bun0beaKe0gTL2/oJ7dJWFIa/44G/H0ENrEG0nfyTXM3NdJz5j2BfKqb08f?=
 =?us-ascii?Q?W8OklEamMVyibTNPtXdcPManV/EVGOC0Jpe3CktHNSZNVPxz3UEMKE1S5Gkn?=
 =?us-ascii?Q?PGeERrWggWK5TZrtpd41iVOy6cldzPRYZbYYRjiljs77hTyZqgMBV+EmkaNv?=
 =?us-ascii?Q?ZgWgRvtfM9V1GKS3PB6zBpb5r71+V8/8wyYXkr0zG0pcSoqqgbG1b5mK1gC/?=
 =?us-ascii?Q?u1TkaHw9ZdyNS/hJvYN/VmexHXQfmbk0zgWvciOuFZIJfsITmwKQ5D3SkT5X?=
 =?us-ascii?Q?86jpmDCO8Cp3bp5S4b/4A/ByL5jJaUmWH3ZdT/k87ODrWsL2RvlpeyUVVK1s?=
 =?us-ascii?Q?L2/avqJno2IIPmMifDWSSiAc6lXB8BQpCnB4KkUmlRmBu9HbEEO4/oEZlKTF?=
 =?us-ascii?Q?aVptuqV3KQy/ejDAUxp7Us0Kk8zKgdIHKdR4XDj27u4DgSVcST0Gi1j827el?=
 =?us-ascii?Q?vPlbCJxyPoJRZM7lZxApz7Ky2wPxBV2mmnP/CcSOb/JapD9eVj2w5tCB/neX?=
 =?us-ascii?Q?dI22zsr0pm0LAEguFh4Ceeyrng8UDIZ0XRCQmQ67Xr1jeOl5McgIYvOnElbm?=
 =?us-ascii?Q?QHzbYazCKxTDpo2B6b+wRw2kInFCXs/VCKaY4GWLLvN+Cu305zD78lYSpM98?=
 =?us-ascii?Q?OHODlWIfh/Fbgywxa6h+TVoRujYnh1f7lA0W5mq+qQ+BBsAGMFoYESmdA3ml?=
 =?us-ascii?Q?ky84H4GjQV84Ij/ZYnNGMayAMorZtiIf3mnkLNjGWMmS4CVbL7tNiPJ1dNjW?=
 =?us-ascii?Q?8aljrbezVncKy+QCgKGHQ+yDAkIBtXdQ90W/rwrdFWsDqKXJQIezlLWTHE/g?=
 =?us-ascii?Q?j15OI04gElxpzUMNUGMkR60UKa5Iipm9Z2V1puyw7e5+h5Oyg5Rq0k2IsSVb?=
 =?us-ascii?Q?eC/qyBB7aY16Gfj4bgIALFrIxlv3nDS02IXRmMcDxhw3dcomOz0UEA57Hnkx?=
 =?us-ascii?Q?32DoZ1U6f3ptfV92Ombrso+5j4/h37UlgPBNnD5W6zrpBLSV4Y8bJq1eX1oo?=
 =?us-ascii?Q?+qDWWeOV5E2/o+ydx1b2dmlV7/TkZNlRzmtgSQXkXw0ULv6X1Iy6ogKCknCZ?=
 =?us-ascii?Q?+9NiFtoYGHlyixM8WsVNtahCXT/XcPdE81SbktNMG/w9nJln9nUUPiYWjWPT?=
 =?us-ascii?Q?R17yeZ2FqJ7A/ROCgOpymqPLQn7vYlwDAbnxY1n4GqYaXhAU6utjwQ1Pvu04?=
 =?us-ascii?Q?pKx6Xday+ImK3E16LRpi6kNG+1l+XJuGERF328wDLZdRW55O7MEG/Lwk1t+M?=
 =?us-ascii?Q?OMUW6aQZ7lBZzj5b+NGCzRuuC7Q3YIrbEX8kYqSBB62zsWRjJqO8bNcXcNdu?=
 =?us-ascii?Q?Qqo7zh6KYdSqAolOVQbIjW8nhmIAUZEA1F3AHICvEJu0SzjYoUchqw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H7XE/zQYhMnKx8rAHhrVt4b0w2LWdo0G6VZpypd6tY22EkeHOYpMnQu5uOE1?=
 =?us-ascii?Q?LapLAczXjd+rOjzXK1PPY7LWVqbxaRbh3VL3L8VoYJOE2bFqAyp67jhf/RuY?=
 =?us-ascii?Q?EXPMBoZ4ROGoshYZCmKptuhT3gtSGcg+PCBY0sXmYk7xnEEIECWf2eFtzVLT?=
 =?us-ascii?Q?U4pmnVlQPqT0rqGRGrYgYRNe2Uwu/pCR6KX+643kI2VmmVVhlWNee7PiI6CS?=
 =?us-ascii?Q?BBytlhAPwysrzMrizwm1xuv+/17PfeTb7WUjyG79kfrPKer6/gwa6aShNHr1?=
 =?us-ascii?Q?lFsnb5zmYrRIYtLubuV8NjXn1e+IQaMzFzvqtUXpqQHToGqmj3BD1dw0EqEp?=
 =?us-ascii?Q?GI+vdeHIB4bGtakqBJJLqrVsr677wYK/Dn9jxVcR+o/gS7FSOnT2PLIEwbqv?=
 =?us-ascii?Q?c3TnbvTgCVA79ZX/RN1vRoi0r1xxnBKXN3N3S1cBFYPxYb1n4KRoOz55V7IV?=
 =?us-ascii?Q?r87h9gekmz0CuSdZbaOT7TdJYQAZaKrj4qdCxeZspyQg272BsemiKR3Bj+5G?=
 =?us-ascii?Q?jGfq9j/Jx9SvQpkqlQ+RZUQOkQ4ellctGN8u3TtPGyDiEEj2wWZosAb4xh+n?=
 =?us-ascii?Q?tZDUTrn+DIZkrv6oUEw6P8tZCIhKjk2JrQZw+DcPgcP4Z1uZYnJOXXOOJsI6?=
 =?us-ascii?Q?KmiZwzBVT5QPr3GGYT69c/eIooehHt6v+6PCbFVwdrCFtL5KB2Xead8SdY6W?=
 =?us-ascii?Q?Q9+SWrQg+v1QDrOxv7B4XiRHCBY3yQP0oVysQ9xpD8ZWHEpoR7TnRmEcsnM8?=
 =?us-ascii?Q?j9Xc/g5q8irHyBAJdTaDULdN0fdilbzNOnPv4/LXG2mUSvugd3I/RpZ3pQ2h?=
 =?us-ascii?Q?zCGGO7yFtCMzasEkYpJbMancVlNmXaRv0uzauDFzKMorDrSIYk5+8a2A6MTP?=
 =?us-ascii?Q?d9aI3IBqA0PInT+x7ayMYSUH8Zr2DQCANJvwmwWEC6fSC1ODFHkkWP/iOPjj?=
 =?us-ascii?Q?7/EG4jj62cbIPP5Ulfb1KL5ihEIyk9XJ5uVvfLtVDWJ2MjBqJo0FnVI3KHFW?=
 =?us-ascii?Q?0kKs3IznWcnouEWGhQqFLTqbTWZoivuIY2PhYDV0APdBCCmimsSXm+FxCkIy?=
 =?us-ascii?Q?ZZP1GpDJQHLW4ld7rKKOLFCkJrO51z0rpwCf4395srMW7bbX8YEEQpjuXhTj?=
 =?us-ascii?Q?6IsfVprcB7O0H2dxjRL9sLsP6JKQQJyo1crehc3zL2Tw5n/2TdJ5jt+wTvUV?=
 =?us-ascii?Q?ZPl+Eu17LFK+nhQOmY1lJWGVUCHJuPXs7RsRpyIjaD/21mHdYyX8isFwfolW?=
 =?us-ascii?Q?2m7htUUGJ2IYa/mR44z3KIddpRXI1l2rglsBSVD3Yjnu9Z1WkSfgB5Z/n0kQ?=
 =?us-ascii?Q?C4jA1d5VZ8TuDSv//83RADPexH68wbSf64f3E1Y9xipo5AmswCMIxeyogZb7?=
 =?us-ascii?Q?4DWSkBygIpFG9Td9fQjzzLgqtEsNL6+mcy77gSE5f3jSW6/L39HRJwowvmuU?=
 =?us-ascii?Q?F/VolB2S/NfAS5lmKMxeIEtlI+92+Y5mIPy8Td43SakgQTqqOH6xoVxTgvI5?=
 =?us-ascii?Q?s7CesTpk42FlHyoRmRafwVzwRnwgc5zdFWPOZk/s1IT6SScWN7/kX2yzBr3W?=
 =?us-ascii?Q?I4YLIVJ/7B5PWSQOBj7eg3iCqZf2f06C8tk4nGP2wlCPAmI5Y0yLefMJ65f2?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d91846bd-de58-4f09-6bdd-08de3ee1047b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 09:28:49.9285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EArG0Tg65SiT8zBa82DgSWAlHal9pFWJz/JrXMaHHz0hm8vBrjsPfdTYyN9fWspy50F9uPM1gVoZloBnJi4vC+GuW4Go5y2w+4olE5UaUwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6040
X-Proofpoint-ORIG-GUID: sgrzcPByLExGL7dZ9iCYcmLAsybl2nXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA3NyBTYWx0ZWRfX7sNJfYcsR5T0
 g7Wk62ZSvMbbJRbyBE84z5jc/ta/M2F9emQvrXeR6f4ZSbS7ZhyWyDXqbZjGxF/pA6UGGp+e4CC
 QSrgnw3eOsrwuYWN315NhxZdOp/U0pwuF2Cpat3FIW4wrp1GFmHs7P1ObXdm6Jd5z/L6mZ+mpJM
 wleVn/qhku8HOh74fYV0wI8Wgx5Rk0EbZkU7r57md2pb+bJ3eiAG2bSKoDALuIFBEa0tKIeFmAt
 /DORG6VGSEcQzXCSbY2jMriFmIWFLtcChNFxo90pwQswFBBLS2U2uDPQG6xoUmoH1lgaRNUOk3b
 2+hvAF3kQ5lSfWWgb3n3Pdh03EhcNnhM8lX/b+tn7JV5w9sO4GO5xVml3d4clvKUt9bxyViYkw1
 NF85cZVGe4q+gKWX50ZFDzUzGCJk+rG61a+B1soPae9jA1lcvelxaNzq4Y1Y3CFUTmZgPVuW3V2
 I1avRWbe7kq/OOgGHxg==
X-Authority-Analysis: v=2.4 cv=H43WAuYi c=1 sm=1 tr=0 ts=69451ad4 cx=c_pps
 a=QW6cWtaKxEx5aDBFEJsq+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=cGBbg9qyOBkjoRYc1MYA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: sgrzcPByLExGL7dZ9iCYcmLAsybl2nXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 09:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228202

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11840

PR 33455
[BUG] A SEGV in vfinfo at ldmisc.c:527
A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
place emitting diagnostics assumes a reloc howto won't have a NULL
name.

https://sourceware.org/bugzilla/show_bug.cgi?id=33455

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0020-CVE-2025-11840.patch        | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 4d3390cf66..827fce0499 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -46,4 +46,5 @@ SRC_URI = "\
      file://CVE-2025-11495.patch \
      file://0018-CVE-2025-11494.patch \
      file://0019-CVE-2025-11839.patch \
+     file://0020-CVE-2025-11840.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
new file mode 100644
index 0000000000..3fb4db880e
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0020-CVE-2025-11840.patch
@@ -0,0 +1,37 @@
+From f6b0f53a36820da91eadfa9f466c22f92e4256e0 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Mon, 3 Nov 2025 09:03:37 +1030
+Subject: [PATCH] PR 33455 SEGV in vfinfo at ldmisc.c:527
+
+A reloc howto set up with EMPTY_HOWTO has a NULL name.  More than one
+place emitting diagnostics assumes a reloc howto won't have a NULL
+name.
+
+	PR 33455
+	* coffcode.h (coff_slurp_reloc_table): Don't allow a howto with
+	a NULL name.
+---
+ bfd/coffcode.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=f6b0f53a36820da91eadfa9f466c22f92e4256e0]
+CVE: CVE-2025-11840
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index 1e5acc0032c..ce1e39131b4 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -5345,7 +5345,7 @@ coff_slurp_reloc_table (bfd * abfd, sec_ptr asect, asymbol ** symbols)
+       RTYPE2HOWTO (cache_ptr, &dst);
+ #endif	/* RELOC_PROCESSING */
+ 
+-      if (cache_ptr->howto == NULL)
++      if (cache_ptr->howto == NULL || cache_ptr->howto->name == NULL)
+ 	{
+ 	  _bfd_error_handler
+ 	    /* xgettext:c-format */
+-- 
+2.43.7
+
-- 
2.49.0


