Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA985D2594F
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:16:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13699.1769526951921677413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 07:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=L8eTPOUz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5487761cdf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R8t0PQ576539
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 07:15:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=; b=
	L8eTPOUzmp2rVrWsOKbrXB2QG9VQQUH8s6GLDsUdmiI0EPD7xALAi6sXS2jdUEhh
	xuR9ArZ64ACjnN6k21q1ogdYrzVZY9VA7CpT68xj3q1/7Y60/KoNY0BxiaexTywA
	XIMrwiYw/y/2R++1MwRhACVF2bp6UtOg3Ach8dX0/+m0HkE06ONQds74/XgETffX
	fh9kCrxLaMu5XJ39cx1RjFYvSeWdoMrGQAeDwAfJSgfkyMzB0/t3nms7eUB08Qhw
	vNDV/2GMnFFiCiQBfD0yOqy7JGZepslrvmLLuKPA0lHngEl48JvY7I1saibVL4pJ
	T5gsCd/ruAx7r7Z8rMf7gg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012016.outbound.protection.outlook.com [40.107.209.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvxfm31sb-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 07:15:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rToh3j2vcnFr39AOuROIBhI9zHm57w0OWou+oV2zwhzd8qULEUIuB3FcvGJoywrGfQIGq0vYp74lLFDEVbMUpZZfh+z/Ilm1oLAa1xdIJ2SZBWxusiEDZ0UhLrbg0+ELYcKvBORHTiVxGtOQzVqnvzs2HXod/P26ALiHBLtM5yMpyGdZXXwa8qGCw6gFVCAdf/FaQNjkL+21dySaDvad7qsIX/PcfH4fk1vWJ5D1Zd+9aLGbfVZfvpMcVSJncWjftBc2Uul30SsipdPmS2m5Lt/tFyS3qP+ja9Bnq7L2WeNw1U4tb+y7YszoN7jw6rFjqSBpuvuxQAXmEv62L9Ttug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8LwVRYORFJqsTWxyKljWwCHMEz1OWOW2utRN9AHe/s=;
 b=FgI+64OrOjJkjLw6AA/8HVGER2/+wwKpnihJMIPNBq8wKSeqmcC6P+KpFBe13BlxXyQ2TtCJt8YpKb4GN6OGSzMz+TVNJauPK4DThX5vaN1OToWOsilNMTXfrAYRqx4o+8BlE38ru1P3AGT/a5lqFpTQ0RtTCxT4yj/+SbyDB3k+BHdLhVvOb1UAJyjyYmWbKa4zIHUsTRQq51NAkZdVRRJJ8EZLY3W/m+q8hLCG9gO9pLRKwE9dUJpjtAlAO9D+ZD9+SaDInOYdPGpKuHw2KO0obNQjELnTCPy1rAsFpWwqvruZ1ixNPUuEny5qYvOqVwaKxIlaAJnJHj+qGgB61w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Tue, 27 Jan 2026 15:15:44 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:15:44 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: liuyd.fnst@fujitsu.com
Subject: [PATCH 2/2 v4] epiphany: upgrade 48.5 -> 49.2
Date: Tue, 27 Jan 2026 23:15:26 +0800
Message-Id: <20260127151526.788157-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260127151526.788157-1-yi.zhao@windriver.com>
References: <20260127151526.788157-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:1::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: 56945f07-9404-4a29-9710-08de5db6ef3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18082099003;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Rw51D1Ot7aCfpw2+3YDE2YvtgHbftb097fgS3ppah3p62+X4eiCdeFSxG84a?=
 =?us-ascii?Q?nylboH3a3HcOQLYQm55dInKmd28VG656wnF6Md9rjbJlgc40zVOrN6Uq3qNf?=
 =?us-ascii?Q?abK8ok3DMURrAOpafwW3Uxoj/ZI6GjHKMaxP/xdrZVYFiLJsQ2pdNxBrlCNq?=
 =?us-ascii?Q?n1VDHLXS4JvsO2gGT6P1vsa/ULm8cmjK26PMtnd1/i0nEWgUnzTqbOTHHs1E?=
 =?us-ascii?Q?m0gOD18SSmsne16j5om4Xvlh44chJqe0JVb7LLRafw7ZEdOJ17pHhKLMIcgR?=
 =?us-ascii?Q?+E7dhQS6hE2CNrNCk/jeUvi0W6yN9C/CC6HUnxmMWMHPXzd4McNVEov0T8av?=
 =?us-ascii?Q?wYG6F/VUSVvH5s7YflA/Fl/9bGOkSe85lMgat6HGXbDobU//ZCb8Hk4U9Y8K?=
 =?us-ascii?Q?ilJTLnUvxM/ODx4MIn7hIPDqCXxrTOe00nqWq8a9ChVLrepqEolA6mDqgSSN?=
 =?us-ascii?Q?c1Wf2isRWW2EzkbBKVZCaU9cdsJkOCUXnQdd8omuGFQCoyGPTEtdkVePuegN?=
 =?us-ascii?Q?gZVBPzEn7P2ePmHydztYuxAJYBgwGrrVcTISNSpsleFIXOqIMCZsBKrglod0?=
 =?us-ascii?Q?+P6o6QmG3q2WNPqqD9iMDOzYF+u4LetdVoB1kUKw9NE8w+wrUg4z49re/463?=
 =?us-ascii?Q?54QndkzAX3L8gRrtwQ1sTRrdSkJsgCDT8VNL/0BEuFEas6CnruKybH1m4CI4?=
 =?us-ascii?Q?5vh2Vk9Tl0PNsZ1NfRUPUu0ejkFgq2K2GgpDtUqCGlbbxZd0W2jWT+S1Ad8a?=
 =?us-ascii?Q?vyVmrha2PjuuVRt14cOC8kw8YtbnjfH5qsrC6/ZfXTqKR9ntslYJtN9GmahC?=
 =?us-ascii?Q?LlWGfPDyB7npa6lQJ0JEpspoTXV4PD+ahMM2zPzt379mi3WtDIv7P4yKxqZf?=
 =?us-ascii?Q?ykAmZ+qPDlLq75l6lSk+Lwi+VJ92lMuaodTwWMWKGel8QEtQtKS7xorCiT5C?=
 =?us-ascii?Q?bGVUQoeq9aAofd7tcB8XmkCO6l5n2pVCHSYAzd/r0J2dJ6qu6DO3qbMEu3Ar?=
 =?us-ascii?Q?7Ztb31bU6jj6zAMvVCCTQx9fTuaTpuMnOvHCgJEM/u39x6+b+CX+GSR6lWT4?=
 =?us-ascii?Q?EacNw8BM1uCEoFu4bjoLWgARyIiuWi2+OfUcEAT/m90DcBQJM/8LZZ9KR93y?=
 =?us-ascii?Q?VmDNTqcI0Tdfy5HqEcRXVpcqPGTAhE17Ps+r8FNt5LEIXFdBhocOzBqSxNTN?=
 =?us-ascii?Q?/QKbx+POs9eP0ak0P3EPAHr/dxFE9llU7uFkKWrTE7YbbuAEQskb4xJLj2JX?=
 =?us-ascii?Q?kYJCI2b2HoO3IXRAdMXEbbbgqNfM2dltKDsSpwKPmZuKdwvkCTbIN8veMxc7?=
 =?us-ascii?Q?GgetkeDvt+M9HBzmztDI5bhlHmZBUwOEuhpyArExfx+MBuR75BqDXJ4gmdmn?=
 =?us-ascii?Q?HImlQWmnU+w1VUMlGAllJhEbPsIdXCSHlKpB9Pk1WXJKHEoIONIz1YkEpU8s?=
 =?us-ascii?Q?GlhKHA0T2OGPmOTjkB42f+sCBuv4SMXoaHdeGal1GJM7oJ2o5wzdSUSlfuVL?=
 =?us-ascii?Q?dW2Q6MBYy+wEzEVoKG7pBrbo6B4NKSWPqR+E6Ue7SEZha0bakEfXZ67g2nHY?=
 =?us-ascii?Q?RcukzFgveSHbjEtnCiBoOcIVftZeeAtjlpUSe92r4dwOYqdctQgUNe6DVr7a?=
 =?us-ascii?Q?mEEpWSTzUTZmm4vgtJP7+k4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y1RYrq6Qa+r7o/mAW6xixn1VUSvEDjEHJCJSSpv0LxuaEH4UGa9Bj4ybIxv0?=
 =?us-ascii?Q?FnmUvhHdkoM2fYR1BIXooYJd5YUrhDohu0ggxdWJEu5qmn1l5Rtt0R4B6p93?=
 =?us-ascii?Q?7mwT7aHWB2rGuzTEw0CR9+QKyecEviaeoV8NmbWACHQKk3CJ88YmhMpvW6OY?=
 =?us-ascii?Q?I+MXjm88LmiG1yo9kTQNSVr5IDK81q7rM6p4RKwep5y97IsoDvtwzyrQ5yXJ?=
 =?us-ascii?Q?30carq5NU1wgqA3q7o+eeBaiavqeGTtntEcT3X5VhltuYAmQlTt/rT2OxtFT?=
 =?us-ascii?Q?LVs4J4AlnhtpDZzho68VRaiGiZG5GVOyG56hV1DTYT8rlbtp9saSGK/qBX87?=
 =?us-ascii?Q?E9v9XwYHdYhFx9wr6VxJLlF9QS9E85dlUlG/wqYlN3uN1yNWFOp/C4jDIBPL?=
 =?us-ascii?Q?NAYRY9z+SQndIr6+DCX8fh0BMUFMqIk8wWPOaIY1v8CW383w3jr06vgpg8Bp?=
 =?us-ascii?Q?5k2Bw04vni+S0nsFgi/M5K3J3Iq+mYSklQoyXhaI84BPDoRz03x0gPTo8yRu?=
 =?us-ascii?Q?cQlu4wvnlG8Gt+NdI+8M7UY6dQ0nW8RRggmF+BtTZS+aEoNQs/hM7x8KatzI?=
 =?us-ascii?Q?mCoIxTI6g5oqNtC7fIjwucb0OmStGlh6YOgTqhsmsUT/QqO1eA6xgv74S5zZ?=
 =?us-ascii?Q?rAScDblZZ9QP9o0fgvpU0trJEP1fv3smQhiGxs0NNOgujeYrVCshGigQTJ3N?=
 =?us-ascii?Q?HHeEMvwH6zn9BTv1RpU6iLhftPl9OJiU4UCiGn8KIvF9VKr79yDPkNGnN1P5?=
 =?us-ascii?Q?8d6ZZYv34WWZLhpffTAV3K8U0a4wMuXpCF6DhmId7NSs+zF3gEfFTP5i1oOk?=
 =?us-ascii?Q?SKEJbLjvE8DZu8mXV0D1RWHQ4O0RIV6OSXGti8ZgoqBHq8cdGUdRL7NBjURu?=
 =?us-ascii?Q?0EjWa5iC4NJMucjAi5W3gvRJYJSYXiJGbPi2Lo8gkap48P05Ay8XvtA2kdfH?=
 =?us-ascii?Q?Jhugp6r6XGJ8kXje4bj68t1yQw9MBEGPH7unnwNdp1Mdc4TxWblpjSVab80M?=
 =?us-ascii?Q?fHebJ9HgAovDodmcLoNQoI1LU3DWbiqzphWED66MN9jE/p8E3u5qca/wlxrM?=
 =?us-ascii?Q?doQIiUwZund0Ro2pog3sY0lzwd7mtZMrJ+7Vr7pKPFE6En/DMDWzaGvxolRX?=
 =?us-ascii?Q?oL23FJGeXEUU/z1mrf2T5ojQ3ZsbCur1LMfW+PLPnI20orzAOwYBdGGklZeY?=
 =?us-ascii?Q?5NN+r3V7rzn7YtuuAh6DycazofegMpuTinGaLhGMpM+rZ2uZAI/AkotrujVX?=
 =?us-ascii?Q?uqIzDHAD7aJFg8Mt2nhCq7yPWmmYmxF7d+RsEHrLm+0R0yFSy8JzszWiXRDa?=
 =?us-ascii?Q?WKw/4sO2a9IzGCxH9XudvWawPxNPlDBTKNdydJPpklrP0+NQjDFnT0HTrLnI?=
 =?us-ascii?Q?g5reufp4h4hy3Q1B5ZT9C9qXZ0KVwlp+Mul41uGwB52jFp1+4MrK/QSmXxip?=
 =?us-ascii?Q?dJ71xky/sPlFyxiew074uWUkrvNaOOj/nZ9hyMR8Wo2C0Nr2PK60EM76rPNO?=
 =?us-ascii?Q?Pe0UkvnZ2JAKhxnm8b2OPS141v7pwTCPvd1kuaTjDwCmfkA2I+ypITsfnHWi?=
 =?us-ascii?Q?IHI/AhT0stJlYgThvpqqoMNeHfmzNua7gFTKnn3ORQq3bM9lXfINuyOjyN/Z?=
 =?us-ascii?Q?971eT8p1P14Qkv1OT9gwWdVHhP+NogLg3ZJg/gtpSg0apbLpqW/7RaG9burK?=
 =?us-ascii?Q?IIaB4NT6YeAUCF/702PFmZ0aRSFqPl069dA4Uh9h9WH6zzx5VKQizgzZmT+E?=
 =?us-ascii?Q?nmoSgUvM/Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56945f07-9404-4a29-9710-08de5db6ef3a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:15:41.4412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UTD5mto6cD9qKrQNszHWPvygwzBd4aty+1QT5qMDepCo+/dTDEIPzg0vHJXPMPryvTnjIdsCju+AcPVx00lYeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: jkNduB4Y3cmDMPB3GjoMBOpML6pE66G-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyNSBTYWx0ZWRfXzerwU9hzOWUu
 EkbsUcdeR631KjkeTbcB5/ngTy8eY8KjShFCL71GEJlExE4dZuQRaLB3uSdvwjjd/YRtuDzYzgB
 MV1kOMpCcLo38BM+CsCBvlIigfUYS+ocn+QgqAK5MILPAYDGx+hj+bq3xBjIzgBFmEMps01VZLN
 CgJG41tGRpXbVpu/Ja7WPlKS4OQYmSPp9TNdqym5D7wO97Auyl97ZYWznZSjf08HDToA9fSU06v
 nf/KwFmAWuA2lc0f35fBk5L+L/s91ijCtPFwQUbB5t0JNXyUqrYAnACO+1IZQvK0kfdpl1xvCkZ
 HSTfdef6n3pTtJUJ4HyofJdXttH86+UdFxrzpTezTrbbX6ploiPoAhCEECrMp1lnp2GJq590lBA
 vLPfZ8qS6canh8Pl1AXzN47ylNdtv+Z0tv/TuWlLHsoQsIRlk5RCLKyYH8xl7jQ0wNVm6RB+SgF
 dCjZGMSpuFmcXx2vNkA==
X-Authority-Analysis: v=2.4 cv=Lo+fC3dc c=1 sm=1 tr=0 ts=6978d6a7 cx=c_pps
 a=lV9semjb6HF4qJ8WeHToSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=ACvvd1FpC_yVDdpOqSUA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: J9UuYKdoWPqMJ8cwFVWL9JhHm1TxNfKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 15:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230052

ChangeLog:
https://gitlab.gnome.org/GNOME/epiphany/-/blob/49.2/NEWS

Add a dependency on blueprint-compiler-native.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../epiphany/{epiphany_48.5.bb => epiphany_49.2.bb}          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.5.bb => epiphany_49.2.bb} (88%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
similarity index 88%
rename from meta/recipes-gnome/epiphany/epiphany_48.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.2.bb
index 6a1abdc553..4c27a6b6c7 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
@@ -21,6 +21,7 @@ DEPENDS = " \
           glib-2.0-native \
           coreutils-native \
           desktop-file-utils-native \
+          blueprint-compiler-native \
           "
 
 inherit gnomebase gsettings features_check gettext mime-xdg gtk-icon-cache
@@ -31,7 +32,9 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
+SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
+
+export GI_TYPELIB_PATH = "${STAGING_LIBDIR}/girepository-1.0/"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.34.1


