Return-Path: <Ghanshyam.BanaitSanjay@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4B5CA5FED
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 08:21:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3136.1791534069477692561
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 01:21:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=eoz+C9oM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4742cbd0fc=ghanshyam.banaitsanjay@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998Hjru4058061
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Oct 2026 08:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=TdIGD0q7dXTaKBJsPkDO
	rI6IKIXnWyCJRNg6dMujRrk=; b=eoz+C9oMxaeLJQ6rRF+ayhTG+k9IyttjwltX
	Hczm+bFT7nXPt0Gm7CyGmuHoE3duHxQALx1Nh36EPUIZ7nFvi7kpUsta/nVFpEcl
	RbdQn4yEH5rJqFHUGNSPwfiTZYv37Req0TurdbU5UkzXpChWP72t2Om5Va2EDkZr
	1nbKIIPECl7TobpMAnAi5WS5MqH4AHGhLG1U7lPXdh4FJTZCuZg+1vFtlV1sWZbn
	Dt5utfkrrdxlOlqhj4nsKeQF1kU8ErwecRpuL/utdGVvSIS4/Vk65TN8/ICAwuHh
	opceHNutEh9czY72/lmIFsn9v9erA07zohp2mlY2fPRtS6+4pA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021088.outbound.protection.outlook.com [40.107.208.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h5xep234f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 08:21:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OMfjOU63jifqUuuE4eKEMhngdcGLKFEIyvQD89plHfKvtM8ePC33K8DbY1vXEbXCYmSeD0f4lqUu/43OxrvXbbqM0L1bEESvHc2Bsw+G8rKF3zsCoT6h/Z52uxP9mU2CK9e+Mt0rNXCBVbQhYnIhG+I2RXu2EkVYGkXXOs0ndzb2hQ9xwL9NyFJqsPzxLycLjQRO97A7CW9rdmYV5D9/T44N5fWO4hficrBHlO2EEqKMoz948zP54UbAEZjzuOFyoZMxfc12GLv/4mVfjnIpj7TU97ZMDVjzWv36UNNlXXUtSd5zSVw4sZSZv0OGLMBqeqRLgx4pDCZochrBdndyAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TdIGD0q7dXTaKBJsPkDOrI6IKIXnWyCJRNg6dMujRrk=;
 b=cj70EUjih6dnGD7KubS7vfCQ8yRl/1YxG8Af9u9F01f+BUer7fv8yzYx51aGPJr+3oEGIe7/7qEE/hyhTaFYYqX2IipPTwScTb/8TpLMHuY5jhTvxQgdAG34kYmBBF0G+5RrUg0ogkAxSqzg4Jy+sDzxQZ3+zWqG0f5RFIx8eltNZVLGb+Kn3Ijv7YtQnumW2rLlqRMiYaNv8uO7njrvCn1AYKZpzjlnzyuvTpIzFxrZtTyCdoKvTbIRTH8Bp1JeUqVkJjlnLba8WkWGmOPBZ7oEbU/jsx71vEsyKYD584xOfVh6K/TK1CkDRpYvsv0WAFb2rixLSRx9KOl1WesxoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b) by DM3PR11MB8670.namprd11.prod.outlook.com
 (2603:10b6:0:3d::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 08:21:03 +0000
Received: from SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02]) by SJ5PPF57F27BA08.namprd11.prod.outlook.com
 ([fe80::68e:cafc:75a:3e02%8]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 08:21:02 +0000
From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] wget: fix CVE-2026-15146
Date: Fri,  9 Oct 2026 13:50:42 +0530
Message-Id: <20261009082042.3148796-1-Ghanshyam.BanaitSanjay@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SL2P216CA0166.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b::17) To SJ5PPF57F27BA08.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::82b)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF57F27BA08:EE_|DM3PR11MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cd4c6ef-2e20-4730-7a10-08df25de41c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|23010399003|18002099003|10067099003|13003099007|11063799006|38350700014|260925021311599003|260925021911599003|260925022911599003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	0ddOg11NwWu6wgI04NVRTiswXB/4J6x1+HIg3rhF0kWo0iDDYA3/T2PeFCSXDxvHX+f/KHQXrlRq2Ppix9Q6h8/19JccRiXDd33XM46ikk9c1fuWtuNUNjZz4D4NyC+iAEzZODKfCr/nGmWBhGaIEsswZYoUWzyuxMxgHBlYkrozd1qpct4cQGDHjWz2+wKqalgnTi3aWQj26DQtp2FL7w11Tr0OffO9eH7uHyPXqDiODFMQJ0SFaKdD/BDDwDzCBTzD2w534ED9weN+WsfVsjKLpgf0Pzo7ir/jfeveZHZZyflTYOsXSwbZ3FpTQdGzZNrXBYT/DMlVRUAEBgv00/gNfrC1pGqNZzQmxouqzyd4cI7Wv197UWXQog1ycA23CAq8cZKYQ5qKyfeRGcjtZy9LPluUJbDsRh2XZJ2YUr8+AlT+8Q1bUL2hOgZqJDqKOkXD5wxqHntj2WSRPCoguhq6KaYMoDIjgifzv9Qkvnxygb1yGELYxn4bIGG9HJ6zNOXUKHZ3E1jH2DOYj9cXxR719rUjweNIV0FVj46UPDQSzvSlzH+wE0KkuVGTA5psPNQjXZDwghn/iqiT4f/kYPk2iSrfP+t8D4a18slibrFbB+Y3R2O7GDy8KTNQXvDLbCiqpsisEIew0YoMNPCP6Rse+JYu7mEFcAhdCbfmO3E=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPF57F27BA08.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(23010399003)(18002099003)(10067099003)(13003099007)(11063799006)(38350700014)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MG5qRk44VjNvY0l0OXNNZjRyYnQ0eHV1TXJuSWROTEFMc3FFVXVEMEpRV2cw?=
 =?utf-8?B?UFAreURJUURFOTZWSTI2TW9MN1hZblJVaDNvYkFVV1RZSUlpNnBGNW1GU3Nn?=
 =?utf-8?B?eERLYWQ0bFJwWThUT2FLcjZVa1lPTmlnVFRXeE94STEvZ1JRZXZLYUJTOWY1?=
 =?utf-8?B?ZERoaEtZbnBKWkpQczV4aXpMcUpKclQxaTU2UGpsRlpZNkUxNVQ5aDFIM0w4?=
 =?utf-8?B?eWdpRVJ5UVMzOVVZVjlNMitZbWJvdTNjNDRUdFNoMi8rbXU5S2lFYm9DT3RQ?=
 =?utf-8?B?V3ZBR3Z4VTBPU2RRbnVQWG1ncVhXQ3BSZi8wQmlubUVwbTIwM1J6azJMOGE4?=
 =?utf-8?B?VnJWTmVjS3NyRkRPSUFUcCtNN3ZVdVE0djNPalJyUHlEY0ZGT01DUTlIMTRS?=
 =?utf-8?B?emRYRlRDZUZmY3dGWFBMaS80bzdVUU9zbkl4QVdqTmlzaHBCQ3JtcFV1ZlRJ?=
 =?utf-8?B?RnpzUDZtVTk0RVRFUHlqTVFSWWxEN0xwVlIrcmcyNWs0M2F5YWxlZGhsNE52?=
 =?utf-8?B?cHFPRXpuMFBZV0M3SllGalREcURVQ2I2US8zNnMzeEVubU9mekNERktNQVpo?=
 =?utf-8?B?ejNMMjdBNHNhNDk5YXp0YTE3RDFxclhtOVVCVnhaZGcvVmpNcnZ6N1FvMldH?=
 =?utf-8?B?djk5aTcwVlhIT2w2czhxOUxYQWk1dENWVlNCOXBpdkdTeXJiUXlzSVBWZ01S?=
 =?utf-8?B?VTNaOW5DN0p4K3hMOGtKaFQwU0FMQnBEQndkYzBCd2x0d2VmaHNWMTFsOGtv?=
 =?utf-8?B?YVF3SE1reWRHRzlEOTRrMmZLaFRCeFViOG83dENyUXgvQmN1Y2tWbVBSWERu?=
 =?utf-8?B?WEFldFJ5bG1MZUU5bkJOQ2hValZEVVBRdUxyejRselZ5RS9mNHVmSEZnR0xy?=
 =?utf-8?B?Y3lRRkd6RWhVcXcrQnRENCtma0tTdFVkaEhZVndkcEFnSy92YzI2MFBuSERv?=
 =?utf-8?B?b2hoVURVeXkrbGNxOU52ZHR6THJTZ2ZXQlFGZGZTTy9YaTdPb1pEbXQyOHl4?=
 =?utf-8?B?cHNMNmlRTFFoM3h1TUV1MndTNUgrTDBiMmZZampYakVYUE4yRnZpZkpyQXZC?=
 =?utf-8?B?bnNmUm9KQnIrbEwxVUhDT25yRHNBTVZ2UStUanZUZWdoZ1ZWUW5ZUkFPZGVS?=
 =?utf-8?B?Vyt6Q2JwdFVvUVhPWWptYTlxdm1QTW1meVVML0JPOUJkeHVnV2FaalRnQ25D?=
 =?utf-8?B?NUZQTld2V1pCd1FuS0p0S1NyWUNoQlQwcFB5T3lTdDJlbk9hQm9EZ0ovMUND?=
 =?utf-8?B?bWxGNnc3WXUrbGVIS0srMWVJaXU2U2g0L3U2YU9Td0NFQ0hKc0lBVUlsTFpS?=
 =?utf-8?B?NnVNZWRQRS9PTEx1UlExN29YZ1U2RTNOU1I4Slp2Q1kyMjZRVlNXSTJoNHhT?=
 =?utf-8?B?aFRuMTBpQVh0RE81MjQ4WnZXTVB1Y1pBcCtyZGN0YytwdFFlNTJJaG4ydGF0?=
 =?utf-8?B?cXZhRytCTThUUG9WUGw4RnFUdkp6R1dCcTVCRm1KOHB3eWpFTDVjcnpwYTF2?=
 =?utf-8?B?TG9BSmt4YmFKQ09abmhLZHNnaUFYcU43SzhDbExKbGRxNXJUOWZ3WHlTMjNB?=
 =?utf-8?B?RGloK0NZZGFOQko1R0J5djFBbFpJazdPcFJkK1ptNzl0UXVGdE1mcHdzY1N1?=
 =?utf-8?B?U1Fyd2RwN1ByQThid21QNlQyNWpreGNDTmRmY1AzVzBodHU0WEROem1YQXVs?=
 =?utf-8?B?dVBYNmNUazg0ZTN6MHVTUmdIc3hpL0JuaUtjd3FmeTBxRDVCQVo4bmNNMERO?=
 =?utf-8?B?dGZxWmxwcnhVcU5EaHVnS2U2QmtPMXA3QnZxYkdqcURnZVFGb3FvRmJPcWJQ?=
 =?utf-8?B?U1pwMXNsMlkwQUZWaURvMEh6R0dwVnY4NjM3SUlyaEJpbmx5dUZQd3VUaG55?=
 =?utf-8?B?S3JreVp2c0FMRm9yeWp6UlBCVWVDREFoV2ROSVJnRzdUUnFpQmRybm42cDJF?=
 =?utf-8?B?Q0NwOWJ1S0d5L1E2WlpjUUljTEJSMDVTTjRhNmhwQlNleE5CT2ZsbkdyOUhr?=
 =?utf-8?B?am1UMzJwMWw4dmh2N1dHOENuQzh4dTFMa0VKVWhxVUJ5aVd5OUxlNVB3S0l6?=
 =?utf-8?B?Y0JSQ2xDTytJUG5CYitZMUhOQStocXBMOS9NYjRGbFpEUlhyT3FrK1U0UC91?=
 =?utf-8?B?WUYrRkpvY0huL3k1dlFYOEVUMkIrL2E4cVRLd0QvTGRHVEhTMU5pd04zdkE3?=
 =?utf-8?B?SkJTaDZ2VnpiWWYrSWhmZXlEbVFXWUF0UVFvOWwxK3pjTE1UMktCOG4zb1Jo?=
 =?utf-8?B?My9JM1ZIWkF0V3pFOGRQbVIvRXVWdHo1RkNTVG12UzBHU3V2Q1VYWEtBU09G?=
 =?utf-8?B?WGlWelI0K2M4RlRhcHM4dlFjbFRTRVl5RVBtblo1a1ZTUFYvV21aSi9Bdi9D?=
 =?utf-8?Q?FpGMhWgVExCo45ENoKVMkLJi1LaWXOtvA0Mj4?=
X-Exchange-RoutingPolicyChecked: 
	sA5HiE9jWxsCON5NUnwv4ml0XrenQW1dQRz3I6s1x7Hfb9WGa8fUiy35nnQZReFjl7RTM9uJxIH+bItRjx79xJwzERXV7LjSJL0TTt9RagVmr2Kj8FD2KEwJIqpmZigjGcbQAnBuXYfZW/I/joUCxr4Cc1QawYWwS+PNcvd1UuK49OjEc62Nk/nhZXtgR1V5/fz3uIVSE/w8iu0wc5V4p9QNX/IB+Eh+aDxUZpVcMY0lEC/MTGzCpYxpXZiAQcxUF6KMMcVsTHWP82Zy84u0oGdOp5aSIc4KJV/UPNJEVsodg/V44OlY5X/yD8DKvWr7fzCnWHOynLy/cxn7LU7UAA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cd4c6ef-2e20-4730-7a10-08df25de41c1
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF57F27BA08.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 08:21:02.8718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R4zfB5fpA2tc/7edjtjt9cLerSDCBf+3p513emEafFFZo+hfwPTksIG0WXoRus1c2dBG4udPOOSAZUr2mvi84ai97aJTOQLAvLoAtva7qPTEZ51fFwIHeN15l5siCZHW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
X-Proofpoint-ORIG-GUID: NXqRDq-gL6QgNAAoy7UNR9sZeaEd3IQ_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMyBTYWx0ZWRfXzXofaSQDawc1
 8INaw0wIzO6py50EB2A0opTglv9VdLW/fcEs1xcXYLVOpcqf85nHw7BFK+Tx0X4oI7+ubGG07cb
 NraHqqV2LYs/r4S85KJtpL/fAIkcKjJx59eTKLeirPIMmGZEvXJJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMyBTYWx0ZWRfX7qZfiQoLtcZ5
 aF6Zq/Gg2cXRc7ccAOuwBwLg+kPYG0J15AQIMzSR+tu0I11gsEESVNBL+tanN2cPOm9ctsfpQqY
 W0yKDUUq21e+dEmnIJZ7QMAiAD3/hkW8NP4ASow9nbzfLEyzLsWn3fsVuAlYmM6DmVrPu6MeDjO
 6ZO7CKMhfaGFAvrwbQR6IPi52/gC4uQtbmm0Mj32UxVIs3lz4n0jmZJUEgaMJr4yzKGgbtwVFpi
 VYq9TxQGLz2+8DejtAlkgygc+6LzlgGMTEcXYmX6kvYKSvQoQueTlq6DRgV0OxOQwVuCnmo3eQj
 3GkhvryUI/fpHc4hRRT+n+VrWc+MO0EN49+HzSOoqIfSozCt7loBjCKXirWeX9HouY9yIlFH5Mv
 gPLPpQFmdQX2BNaMsNPlvW5ZAwfMLGH+CUWHsXxNkrLyio0C77nhMm9nfVjuGxG1OCXNcfNHv9l
 rr71gz4XcZ3NKYmpF0g==
X-Proofpoint-GUID: NXqRDq-gL6QgNAAoy7UNR9sZeaEd3IQ_
X-Authority-Analysis: v=2.4 cv=G6uJgNk5 c=1 sm=1 tr=0 ts=6ac8a3f4 cx=c_pps
 a=bSkFQXo9YJPfdG4GsN7qoA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=mDV3o1hIAAAA:8 a=PYnjg3YJAAAA:8 a=8r2qhXULAAAA:8 a=xNf9USuDAAAA:8
 a=fxJcL_dCAAAA:8 a=t7CeM3EgAAAA:8 a=koS_CkKyrU6iBq9c7OQA:9
 a=7jqKeCjk4K9AMwHj:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=8gvLZcY7Nlvl4CGD_6nf:22 a=FdTzh2GWekK77mhwV6Dw:22 a=ObmvtD6WMDJ6O4cpRQe4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6998Hjru4058061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 08:21:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247469

GNU Wget does not validate the IP address provided by an FTP PASV respons=
e while operating in FTP passive mode.
A malicious FTP server, or an HTTP server that redirects to an FTP URL, c=
an exploit this behavior to redirect
Wget=E2=80=99s data connection to an arbitrary IP address and port.This a=
llows an attacker to forge server-side requests
(SSRF) from the machine running Wget, potentially accessing localhost ser=
vices or internal network resources.

Backport patch to fix CVE-2026-15146.
https://cgit.git.savannah.gnu.org/cgit/wget.git/commit/?id=3D4f85853f6418=
63d5915786a8413e1a213726a62b

Ptest Result
DURATION: 18
END: /usr/lib/wget/ptest
2026-10-09T11:05
STOP: ptest-runner
TOTAL: 1 FAIL: 0

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-15146
  https://www.cve.org/CVERecord?id=3DCVE-2026-15146
  https://security-tracker.debian.org/tracker/CVE-2026-15146
  https://ubuntu.com/security/CVE-2026-15146

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
---
 .../wget/wget/CVE-2026-15146.patch            | 126 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-15146.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-15146.patch b/meta/=
recipes-extended/wget/wget/CVE-2026-15146.patch
new file mode 100644
index 0000000000..5d8d1a898e
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-15146.patch
@@ -0,0 +1,126 @@
+From 4f85853f641863d5915786a8413e1a213726a62b Mon Sep 17 00:00:00 2001
+From: Acts1631 <acts1631kjv@proton.me>
+Date: Sun, 5 Jul 2026 17:22:55 -0400
+Subject: ftp: validate PASV/LPSV response address against control connec=
tion
+ peer
+
+* src/ftp-basic.c (ftp_pasv): Reject if peer address doesn't match adver=
tised
+  address,
+  (ftp_lpsv): Likewise.
+
+ftp_pasv() and ftp_lpsv() copied the IP address and port advertised in
+the server's 227 response without checking that it matched the peer
+of the control connection.  A malicious or compromised FTP server
+could therefore direct wget's data connection to an arbitrary host and
+port of its choosing (e.g. an internal service unreachable from the
+attacker directly), which is a server-side request forgery.
+
+ftp_epsv() was already safe since it only extracts a port and reuses
+the pre-filled control-connection address.
+
+Fix ftp_pasv() and ftp_lpsv() the same way: capture the control
+connection's peer address via socket_ip_address() before parsing the
+response, and reject the response (FTPINVPASV) if the parsed address
+does not match.
+
+Verified with a fake FTP server that returns a PASV response pointing
+at a different loopback address (127.0.0.2 instead of the real peer
+127.0.0.1): before the fix wget connects to the spoofed address, after
+the fix it rejects the response with "Cannot parse PASV response."
+Legitimate transfers using a correctly-addressed PASV response
+continue to work.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-15146
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/wget.g=
it/commit/?id=3D4f85853f641863d5915786a8413e1a213726a62b]
+
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/ftp-basic.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/src/ftp-basic.c b/src/ftp-basic.c
+index 4870256a..0f4bb821 100644
+--- a/src/ftp-basic.c
++++ b/src/ftp-basic.c
+@@ -623,10 +623,19 @@ ftp_pasv (int csock, ip_address *addr, int *port)
+   int nwritten, i;
+   uerr_t err;
+   unsigned char tmp[6];
++  ip_address peer_addr;
+=20
+   assert (addr !=3D NULL);
+   assert (port !=3D NULL);
+=20
++  /* Remember who we are talking to on the control connection, so that
++     the address returned in the PASV response can be checked below.
++     Accepting an arbitrary server-supplied address would let a
++     malicious FTP server redirect our data connection to any host of
++     its choosing (SSRF).  */
++  if (!socket_ip_address (csock, &peer_addr, ENDPOINT_PEER))
++    return FTPINVPASV;
++
+   xzero (*addr);
+=20
+   /* Form the request.  */
+@@ -677,6 +686,16 @@ ftp_pasv (int csock, ip_address *addr, int *port)
+   memcpy (IP_INADDR_DATA (addr), tmp, 4);
+   *port =3D ((tmp[4] << 8) & 0xff00) + tmp[5];
+=20
++  /* Reject the response if the advertised address does not match the
++     control connection's peer.  */
++  if (peer_addr.family !=3D AF_INET
++      || memcmp (IP_INADDR_DATA (addr), IP_INADDR_DATA (&peer_addr), 4)=
 !=3D 0)
++    {
++      xzero (*addr);
++      *port =3D 0;
++      return FTPINVPASV;
++    }
++
+   return FTPOK;
+ }
+=20
+@@ -692,10 +711,19 @@ ftp_lpsv (int csock, ip_address *addr, int *port)
+   uerr_t err;
+   unsigned char tmp[16];
+   unsigned char tmpprt[2];
++  ip_address peer_addr;
+=20
+   assert (addr !=3D NULL);
+   assert (port !=3D NULL);
+=20
++  /* Remember who we are talking to on the control connection, so that
++     the address returned in the LPSV response can be checked below.
++     Accepting an arbitrary server-supplied address would let a
++     malicious FTP server redirect our data connection to any host of
++     its choosing (SSRF).  */
++  if (!socket_ip_address (csock, &peer_addr, ENDPOINT_PEER))
++    return FTPINVPASV;
++
+   xzero (*addr);
+=20
+   /* Form the request.  */
+@@ -842,6 +870,18 @@ ftp_lpsv (int csock, ip_address *addr, int *port)
+       DEBUGP (("*port is: %d\n", *port));
+     }
+=20
++  /* Reject the response if the advertised address does not match the
++     control connection's peer.  */
++  if (peer_addr.family !=3D addr->family
++      || memcmp (IP_INADDR_DATA (addr), IP_INADDR_DATA (&peer_addr),
++                 af =3D=3D 4 ? 4 : 16) !=3D 0)
++    {
++      xzero (*addr);
++      *port =3D 0;
++      xfree (respline);
++      return FTPINVPASV;
++    }
++
+   xfree (respline);
+   return FTPOK;
+ }
+--=20
+cgit v1.3
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-ext=
ended/wget/wget_1.25.0.bb
index 26f5c84e5a..b8c803aae1 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-16599.patch \
            file://CVE-2026-58470.patch \
            file://CVE-2026-58470-regression.patch \
+           file://CVE-2026-15146.patch \
            "
=20
 SRC_URI[sha256sum] =3D "766e48423e79359ea31e41db9e5c289675947a7fcf2efdce=
db726ac9d0da3784"
--=20
2.40.0


