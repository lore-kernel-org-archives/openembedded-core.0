Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 153F3E87835
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 14:04:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17167.1770127449780832939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 06:04:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=V7ACnadL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6494b3a7c5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6139nX7h1016330
	for <openembedded-core@lists.openembedded.org>; Tue, 3 Feb 2026 14:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RHHFTO2L74k8lunmP19TbpyYDYoXlLYi/nN+CEQS6xg=; b=
	V7ACnadLkZ1ndiOXVmXgGR4ZIPy9eenQ2wqlDjP3OTmD8gm4Z5o/9jRpNUlqAFlI
	NpyzCNoeF+tBpQRryrOI9tpFTFwvC09eYbkalXODaeeT9Qv1urpMPxEgkUG+lN0J
	dPvQmR7LC8HmHGR+1LB89lD6dTo/DQocKsg3qNtVKLn8d+8hYmMhKYTy+WaCYDoL
	XG3ACphcV7BqT6bsuL07vqfNJi5XXY8EWbryYFH4N/NkPiZvqXuC6kTqPJGAaBah
	YkSFt2yefcc/s4M+2ssTXCIqNdUWXmQGqNIlAC0Sr6Fc56vzQIsb9N2rpvXdgclu
	3+kXwX5DkRVmEkOWDAfHOQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013010.outbound.protection.outlook.com [40.93.201.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c188juas0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 14:04:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QsLPwJcy/EZ/iiLwxYuZqiinW2hCaWvEH0ZXpwU5KTNMZWgadEBmcr8KiAtNVDrwD54QjTRScHl4fOaq380tnOe2HNi/wra8mLUK54FU9fcJSIx+8ySfqMm3D+2y6TNfE1Sje5HM/lL1FejhoNUvSmZi35o4rc9GGGUSwTUVLLytiaXAr7mJFyB3o6cdxifCsR02Itq864rJVjmffvAUvkhRUFm83sMkV8BlGU8rNfPeX7mYOuFg8OCcPKuMCkrNEJJezrXWzzuofN2EVKbmmgcHsF7gdjiRE7JQEc0fllM7wIhHCYMKWQr1C29fUD/9rARCWlkePkCOizA44PUe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RHHFTO2L74k8lunmP19TbpyYDYoXlLYi/nN+CEQS6xg=;
 b=PVSDFEKY0yA2sgZAON7KDVGmd7ipQRPhZct0/BpjLznkemJBT+i96G7VfaSgm4Q2vk2zh/41/I+qb4zcsBDUbRE1fNwofOFMTIVN0WPQG1jw7IZj2aG6GRE2OEYVXiwhnWmTsyELYTqjAK41ZCq18DdYkBO04YNslF5Hfa4Dxv47V0g2NuudgyYVVQQG40iD82v5Xb+jucyWC2L28tjYAFeJhenHggNIMOqOdgzPjR6EFG8L6aWz/IDnwX4TxBNAd6uaYwKtgmzlJSeMe0t9focgsdfVKNeFP5MkQ35Uc2a0tWnVHPG0ytceJb5pSqLIAZUzSoBx43PKArXJC92OUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH3PPF1618AF7BB.namprd11.prod.outlook.com (2603:10b6:518:1::d0a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:03:59 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9564.010; Tue, 3 Feb 2026
 14:03:59 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [RFC 2/4] clang: Enable tests for llvm, clang, lld
Date: Tue,  3 Feb 2026 06:03:26 -0800
Message-ID: <20260203140337.1971735-3-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0014.namprd04.prod.outlook.com
 (2603:10b6:a03:217::19) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH3PPF1618AF7BB:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a30a4ad-f644-4b1d-3b32-08de632d1425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KDzJdnRJk+I4oV1xvxxhiwmv+RgxlLWSXH5TkRAS/kAIHMyAZpODGgoFhk5x?=
 =?us-ascii?Q?EIfoRRNR7CShIG4WzbX1AJsjC8UMstafYPmuCpiIiGdpswUGIpGRMsSjZbVz?=
 =?us-ascii?Q?0+WEDw7BsoXiaAWPbvqvAshPDFNK+sByEOd1oYWmD9Oc4vKExU886gzpEDbG?=
 =?us-ascii?Q?MJxMhyZimua7D5CSuy/CzcflTOCHsOoJAYS10oNaKRvYcnU7/rxe94i+xjhA?=
 =?us-ascii?Q?EOwOtpZ6BUbTjfealUGOBIoTRABvzMxf64dVQ3/NFYA5Cca1BVHnYbejkhnG?=
 =?us-ascii?Q?bXbR7cqHu1uh8jZZe1IcQFpvRjrYqMSg00OAU6JOXhG2SDGAVqLZSgN9LnYe?=
 =?us-ascii?Q?P+8bK3yN+iBQAuRR3KkH68f8q8XtXqlmo9sOycpFwhVfseWAJmSS08aArUgN?=
 =?us-ascii?Q?quALN4w4YinlzKoOFQivlwfD74pvafTSnc+wU+PNd0S/uFLdiQDdcPD9N280?=
 =?us-ascii?Q?E64asWfue1cQYTQCSwFPZOXyiPl0lRivxUDJo7VPpB1p8n6SiI3Dun5Qx0J0?=
 =?us-ascii?Q?O7ihxG0u9NGNJVFWYB6/fXXmgiMzJut4JhuuX+H4bZfvSyLmd+zoCiRC3LVi?=
 =?us-ascii?Q?vT3hRl2i1iq7D1GIuV24YliDQzvC8VALaglDn11unjqjoPX5g5Jn0xzKnbYU?=
 =?us-ascii?Q?yziU+R8PNl+ZSnCMg1f6mSB5aMqx1nXe0x3qHRIZkOuB2atD6BScWkYeFsuZ?=
 =?us-ascii?Q?zf07N+Nd1yoe6u2DJD2FRZ7uyiTVYDRoeiEim1WluwVI++XuqrZNfGBASiGC?=
 =?us-ascii?Q?/J5A1sZjXZgLbkS24xwyZ1NitcOse+ic0srnN0xO5vUrqxMS167Z2VkrUjcR?=
 =?us-ascii?Q?tc9QQ+NzwBWKtiLZ7f6qhlOdPGlXMfkl0CU15vVILxQ5YZevu16UJRYEJID+?=
 =?us-ascii?Q?2h/1sg7l5TYcp80eZBO3sH8tZSeYXjrEj9/Scd3caZY6z8mroMDKGEwgITDZ?=
 =?us-ascii?Q?OZ2olBs/HHmb7W760eHu/RTCmM8p1EZer8cvR6Ce6yaafGmI/2VqaRPCA/38?=
 =?us-ascii?Q?Qee4pebeQmaf0wkm9ICD7G9OqMyQa4jISrHhkppoKAXhUY2rgvQNOtDCqkBb?=
 =?us-ascii?Q?0U4Ng9B2PhtWlwakmDYRps7gm8n7T5duAiGFdoD02cWrwsWsL3QHvV3DWfUs?=
 =?us-ascii?Q?E30Z18vsa1cwCVFRKkokuTpxkEZDfBpLhXdlsX3tVCwTlbrn+nLmy7sDUaS9?=
 =?us-ascii?Q?KUZorkQuHVTgU0X68FCHDFs3639KFopRdC0cL4zqLJWlh9A3ro40GsfQzcK1?=
 =?us-ascii?Q?QoHW54wl+fQ3wv2qWvX0QiTT2zxiMD3bq1W9Yejk2wHNJZvQHtd+1XY7DSEI?=
 =?us-ascii?Q?5y7QjSEPT89Qdu8aaW2R580CN8g2080SlEdavyptR4/P0SM4+Bf6AXUtndnt?=
 =?us-ascii?Q?SqSJMmtfHt2Sr+g5SEr23FtkDkhI64d9HwVAXPkmWrkDzqbzMtdPqOFY9FOe?=
 =?us-ascii?Q?/IOHBUPI4jJ5LRK6mwklIuP3j3+G5+gnQRp1y0b0SJmwbETzhFOhmPtpjg7x?=
 =?us-ascii?Q?IOAVMqz+URhZLcbBdrNuqRReoxpJHLfRMtykQEl+YxLMmtHvgruBTh6rVcGN?=
 =?us-ascii?Q?/UkxlMziNrQZvBKf7XU1DKtWEGUkPr83R2yfGKd1bLRb22XVtYXTCj6Da/4E?=
 =?us-ascii?Q?KgEk2PL3fk5mWfPSqujkn4c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jGJyEYzd/9/E983pOd8zVJfQMSFp2A5hi5uunDXgxAmIiFLj1Di0HySzTUsV?=
 =?us-ascii?Q?gI0ow/N2ar4WXfPRaERnzwDF7UQ6cjJI+oIT0oAFmfmq1gS9xfCrQQALgFPa?=
 =?us-ascii?Q?/KaX8ftxpZGcQvDrR4nx9thz3PZaerm2diazlJIzkoYYggrbHiK13DZB4KY+?=
 =?us-ascii?Q?hC2j8S+yL3xxg1NLcVR5MOU+9qVbXhqIffwvWcVQ3KyOg3l/ENxMpnm/Zo+e?=
 =?us-ascii?Q?rZvlVkI2VRilKJAni9aVO/W5GKSQISedLpD44SlKGRHT/XSdTiS6TDCuThGA?=
 =?us-ascii?Q?LM3VLQqOjacJotYbXrT8V1F1FoK/kzRmNs2RlnKRuah4KiFCmUyIwUmIaKvA?=
 =?us-ascii?Q?Hnbrt39dSMH5/vU2G3MAceeQeYrdVLNkUO3P5H3DI3TcHi+V1dDEdYLQNV3u?=
 =?us-ascii?Q?FKdwc0/EMNboj3978AmATqS6/zVAzYz2orXSXozMq6JX6t8IvSh2P5xGDC1R?=
 =?us-ascii?Q?+5AnkAiS/syZ/xc6aF7D/CKPBe0ix/MB2Icx0nlx+EJsKoibO/0yyYgw8Ue1?=
 =?us-ascii?Q?Xnt5pXJEwMylXd/2XSiFAo67Vq96Ysioyr4IFF7mHf7FifViY8H7lzpBWvCu?=
 =?us-ascii?Q?YnD5NaEuB8V+toF3k0oeHnnmbXyFfjjF/dmDFNGmSBmKdmRSa7lKllnIq1Vl?=
 =?us-ascii?Q?DxAeYQGEdt5yPp/0nnmchdbYZgV0Tspi057h0+lhcDMMEsODCEUHqb91iq+5?=
 =?us-ascii?Q?fvV479qAqN0ZdNLnwpGmkFd0q08e79DTrdjOOqdyiep+s5+CnZHLQ0693Byo?=
 =?us-ascii?Q?zi3OWzN9u0r/CiH39ialahD4xuHG1R8ih6dDvOrpaZXwHL4j3NwUrYYXSqxY?=
 =?us-ascii?Q?nx8eTX9JTGujXnSJ+59ThB13VOdjsr4cvk197McZb06lqGXBBYP/XESwfrSk?=
 =?us-ascii?Q?hJE2B3JKLllUFvCKkxCHXb/MK+vEJhRNLngdpUilBTiTTwxVm//UbIqPBopt?=
 =?us-ascii?Q?b/ZCHuMUcJ1K8+Z09MNaLx8Hx85p7keLYoilPsHnf24G3+os95iYcYSfg0GX?=
 =?us-ascii?Q?xyBgoAupzJslMdsBHBfufUB45efZUHpFADTNNadpfExWvVQ915RdM8vRfSuS?=
 =?us-ascii?Q?mxHwHI2brj7uvvWcOZnieCkAqOwxGJiizQV/CQyXV5dERnivn0rEUMk3ZY8M?=
 =?us-ascii?Q?QL1tMq3fIoXDA/jSnmaTePPe60RfGk34I/V5nVb+dMqXwsOSkzJAzPU7ZPm6?=
 =?us-ascii?Q?Rzt3XBdfjsPPnYHi2aSiB5hWjZb4LNnxH7wVQ+dYV/Zh5H4MlM2Q1vLtMxb1?=
 =?us-ascii?Q?CC6y1bKHxKa4AT9MdMwMCWRTOTKxJljgSlpiLi9q7+WiCyCJuEPDSlwDWODZ?=
 =?us-ascii?Q?g+4TSsxxoh4XSLD8qN7f7b21KffUim/OE9q/TxB6gxImcPgbqeixObFuvOTV?=
 =?us-ascii?Q?D1V6lWtHmuzC+4bbQBPDzkudUXvmXinBnkUE5XNTbS46tnyv6GihPMJcOaCR?=
 =?us-ascii?Q?4MplDUGP29UF6XS1pkozhmArFGyWfYDDV82aihGRnW/aIqKtrIHLTbSUZb2O?=
 =?us-ascii?Q?d7JMpW928pmch3+JtOUlfmjxPKojlxlI2jzmai4xzHVdJifO7PZ+2WEOkAQw?=
 =?us-ascii?Q?Al8XRTgdJu3Qiu5rJT4fEvoeElWnMDzz4f5yhGUNaeuN2dVdyTaYhPpc4tX4?=
 =?us-ascii?Q?ig9QSBG1B1a/E4RX/E/DJmETdPAyJX3bcvBArLqN3sSQyfZZalAbzJMuD5S2?=
 =?us-ascii?Q?u59Qa9UryIySyDrpRN9J6qj/VAt8zz0gqKq4WyxxCbe2VJe6wHHSWo9NOXiN?=
 =?us-ascii?Q?w7QSB2WqoVOC36iYDEWPTFEYdaV4rgNWEkpqS8NqqfqlycT/GYhm?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a30a4ad-f644-4b1d-3b32-08de632d1425
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:03:59.6933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoMviKKCt5Sj3dGLRN9BsmM/tjmeLXUWYGujCeMNtxrpeSY//TAcSZXwMUlKKSs1d/C0Lp/srE4tCrZdF88LHRh18rbgnZ6Fp09c7fPhkXrOpbuETjjRGWGRSuTfqSVL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF1618AF7BB
X-Proofpoint-GUID: jDlHeRZ-klBxKpbLwxqTD8y0XA5gTVEQ
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69820058 cx=c_pps
 a=dDG42FMqTjgm/c7QxIpGBg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=OGoHJ3GZglc69ZdDNFIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDExMiBTYWx0ZWRfXy/sU0pRNwRWO
 l6O7qI+vZlF6y5lVLacsXjpaBmSlBK6NFRm4P55pEbE8FGiXN2gFu6ZyEus++AtfBPZ58D3a63r
 4W9ginFEmFVJZqE7F+XpnufJb6sxBVSMElRpGpnu5DyRMLsphyZ2NGpsmowxZyWAqSm8GgK0VAz
 2+HQUGbZjvC/93uM+PgVn+vu/XcNwGqkiC+QZPGJUoCjgWw4lASWoCFks+KSPnZZ6+ABwGLTvtr
 tHRcLYGpUEv6ikHR2riI7rQ4FHRtiYLpCbMpPHUWbpkTJkll463izbPuYL1f8CJMEi2p78RQkXv
 jEWOpK1vvCYQZBOqCm4iTeMGyvAIogyadQMDLhkn45sL5e0J6jt5T7KUzr+hvoaqixOXcUmaO/u
 Eq8orJgB7OHa3OO7vjdwCK3HF2sTDLesaODYKSuqTVMMuvbGDimQIm6hkY6OdsUMFpesA+b0CHB
 xImtMV+qI6neQVSrlXQ==
X-Proofpoint-ORIG-GUID: jDlHeRZ-klBxKpbLwxqTD8y0XA5gTVEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030112
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 14:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230455

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Enable the required LLVM, Clang, and LLD test build flags for both native
and target builds, and install the LLVM target tools needed to run tests
via llvm-lit.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/clang_git.bb |  3 ++-
 meta/recipes-devtools/clang/lld_git.bb   |  2 +-
 meta/recipes-devtools/clang/llvm_git.bb  | 11 +++++++----
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index e10c327a2a..a1ff25f863 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -68,7 +68,8 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                   -DCLANG_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/clang-tblgen \
-                  -DLLVM_INCLUDE_TESTS=OFF \
+                  -DCLANG_INCLUDE_TESTS=ON \
+                  -DLLVM_INCLUDE_TESTS=ON \
                   -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DCMAKE_AR=${STAGING_BINDIR_NATIVE}/llvm-ar \
diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-devtools/clang/lld_git.bb
index ba36942790..1d3d80e117 100644
--- a/meta/recipes-devtools/clang/lld_git.bb
+++ b/meta/recipes-devtools/clang/lld_git.bb
@@ -16,7 +16,7 @@ OECMAKE_SOURCEPATH = "${S}/lld"
 
 # Explicitly enable symlinks as the lld build doesn't call into the llvm setup
 # and turn that on.
-EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=OFF -DLLVM_USE_SYMLINKS=ON \
+EXTRA_OECMAKE += "-DLLVM_INCLUDE_TESTS=ON -DLLVM_USE_SYMLINKS=ON \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index 96ea383731..6fed382d69 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -44,10 +44,13 @@ EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=MinSizeRel \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DLLVM_VERSION_SUFFIX='${VER_SUFFIX}' \
                   -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=ON \
-                  -DLLVM_INCLUDE_TESTS=OFF \
+                  -DLLVM_INCLUDE_TESTS=ON \
+                  -DLLVM_BUILD_TESTS=ON \
+                  -DLLVM_INSTALL_GTEST=ON \
                   -DLLVM_INCLUDE_EXAMPLES=OFF \
-                  -DLLVM_TOOL_OBJ2YAML_BUILD=OFF \
-                  -DLLVM_TOOL_YAML2OBJ_BUILD=OFF \
+                  -DLLVM_TOOL_OBJ2YAML_BUILD=ON \
+                  -DLLVM_TOOL_YAML2OBJ_BUILD=ON \
+                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON \
                   -DLLVM_NATIVE_TOOL_DIR=${STAGING_BINDIR_NATIVE} \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                   -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
@@ -69,7 +72,6 @@ PACKAGECONFIG ??= "eh rtti shared-libs ${@bb.utils.filter('DISTRO_FEATURES', 'lt
 PACKAGECONFIG:remove:class-native = "lto thin-lto"
 
 PACKAGECONFIG[eh] = "-DLLVM_ENABLE_EH=ON,-DLLVM_ENABLE_EH=OFF"
-PACKAGECONFIG[exegesis] = "-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=ON,-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=OFF"
 PACKAGECONFIG[libedit] = "-DLLVM_ENABLE_LIBEDIT=ON,-DLLVM_ENABLE_LIBEDIT=OFF,libedit"
 PACKAGECONFIG[rtti] = "-DLLVM_ENABLE_RTTI=ON,-DLLVM_ENABLE_RTTI=OFF"
 PACKAGECONFIG[shared-libs] = "-DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_LINK_LLVM_DYLIB=ON,-DLLVM_BUILD_LLVM_DYLIB=OFF -DLLVM_LINK_LLVM_DYLIB=OFF"
@@ -124,6 +126,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " llvm_sysroot_preprocess"
 llvm_sysroot_preprocess() {
         install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
         install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
 }
 
 FILES:${PN}-dev += "${libdir}/llvm-config"
-- 
2.49.0


