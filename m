Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713CAEE01F8
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64806.1767104202748700363
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XyW+TDr1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDKBlc895664
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=; b=
	XyW+TDr1kXPwAdNvFLjupHZ8fYV2W6Ij6/KmqQZGWo7wXhgMPqlzkZrS95U3+uHg
	NVx2kP11EGOJj/4Ndba+SpAVEGGQ2b/l4TL/ueMGAdNASSbnplRIuIF9PQCrExUJ
	5N4cUn5cPZOXda/suBFMCx4bAlSkfG7FudT07NRMLDMxG5H7EkAfQ2NyBsuv+deK
	hcJL8ewLWiM0VRZroUmPIE5Vcb6DPbz3FPltXzq9BfGmsSn7fZRzmfSsGCwIfMZs
	5GwTEuKJSJva+wJ0iGGoApsNTrxv7i7+bNb/cLqwiDfrXeNClK2YtdTe8LwguKN+
	OaCffy2lW9k3F0Hommxi7w==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010006.outbound.protection.outlook.com [52.101.85.6])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4tut3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bo+/ypy1qLhKHEt7qQoSOoMELfEk5Muj35yQJyww0JNgohPWsw7e9ZSaW8M46hPK0gNfhopilz9qxdXqpNClhyS6UqIFB5A5m5GdSAAhTCh+Bmo2rYpgLfvXbAYQaN4vIx/oBCKuqkBY6nHpLY4Bt075RyQ1kctIXt9SMWyXA7aMpiTch4cjpeivVBXsCHhZoFY4Ri5ZOgWjF6r4TnS1SGVTH0pWUal5G2xbtDRRBJd7iFqA3EWdL3knlwwBao1ysymzhW7/dwjCCDcIjT+xFUg3+jAvdq6QxoU8TQdNZCogo1UCiJV/rAnMS2XbhwtYhinL8XTnsUnumbKwtXdHNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aP3o11PQx6ZniR2FJ5U/IO/w6RahnFHYk61cZ8mU8T0=;
 b=way7A5XFp8hK2L2hzBgiXQun3sCUvelvKbgZvEmNASGxblomLX0Ye9J8NXtjzqIblDPzpUDkR3cXraDBPQW7vh77vsVs+yAnldRChX2p32yI7lVnOkel3I17icSP7ftpVqk4f7kANhRxXZYuLP5qI2IlQikAuDOWNyi2jBWnLVMf0z1cVKDPWUzr5BL1hl078MgDqDaEBZecin5Sdbz0Ikf4DE0XfhDoU8WFhNtDleEVB67+au1gjU4hP3F5KK/ag7bNfa516UyFd7G3YEkxrjKtM1jC9QVlzA/ZmoTEvAQuIS6F/qFLFowyec52LaS4tg//UwbdDPAzwln2st1mHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:39 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 11/15] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Tue, 30 Dec 2025 06:15:36 -0800
Message-ID: <20251230141540.1974380-12-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d45acbd-8a87-4ee6-cc58-08de47ae0c43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/mIB3sP8jp2j6w4rRPplQW6RRVQd+OBrH+2/Imyg+xqL2n0bJFuWoGBkMRcV?=
 =?us-ascii?Q?wZ4qZSS2QKr4TBxmrbOqhocmFWlwDOzctRP92DgMps7ohn77Ze/Ijz5E+xa9?=
 =?us-ascii?Q?SEcr2feZzflgjPVWkWbKOAQAlrt4UDDIDHdl7+2DaJB4cAnOZ6+ZaVcGSXhl?=
 =?us-ascii?Q?1W/Dc8aFjd0FhB3GnLiXtS5hOKGYnzl/MZpfft2l1nP3gIOtsGw2PsbcPyo0?=
 =?us-ascii?Q?RabkZrkhf9NksZqRgJ9WTBS0DSr927Ef0TVMPDDTa27zN4VdU/7Aze51eoh2?=
 =?us-ascii?Q?1yYz+J9lsadGtM02Iqu5S9OoaajvaaoEiSFu4bg8Q/IlBTwjAlxiCIGOVKOD?=
 =?us-ascii?Q?l4HTXqyywkdrrN1VruIPbB4ZluyKL+cH0lgDYtJw8oG4ihpcCWNknaWQ9mKD?=
 =?us-ascii?Q?1E5rziulex/wAEMYYw2/KeMJJecVVWzQAh7RudEh1OzISHFvJMRXtkbvGCG5?=
 =?us-ascii?Q?WqsFAYggvnJslow1bp3nD5NpfiCXK4wfZiNfXjRwGN6byqohYOVlwvvag2c1?=
 =?us-ascii?Q?w60LDZrOjmrj06UMDdd7kVtA2cQAfdw+evL4MzD/84ZWaL9Jkh/L0O/I1NIT?=
 =?us-ascii?Q?gTMjBtxex7+LML9CMX16CPmSw2/qzHd89NljipNCkyWcFpRp5Pqsj8729Pzi?=
 =?us-ascii?Q?fXc9AE6PnvpyKBWkrs0D3rL8HGzMmz7+tSseLHoHrURjeyJF1DB3GaIch0yV?=
 =?us-ascii?Q?iZ1uYLGox/VR2puTv7q4Uh7KLYDMtCjlClSvW1iEn+YzzgI3p3W/gCsEt3rN?=
 =?us-ascii?Q?lebPAW9ALxYg/KFM1bvQRbQ1Woy6B8BKzUTJcaIDZSdtVR6XvEykMdxiJt1u?=
 =?us-ascii?Q?ufCt7ej6Y+2Lu2eOIw9z9nldrjkHnTU6RaWu2aevVegzUGIFU7tr0YoeMPQb?=
 =?us-ascii?Q?1vCBzmnZGGckfGHaievXkhMthx7kBXGb8a0Js+pvt31h2zhCUt3F7i/67ii5?=
 =?us-ascii?Q?gWOtP5dM9D2xbb7bFzGs+jyFfjoUVNBr+dBVrwN2QMUQBXcgw8qKEMBN+U+o?=
 =?us-ascii?Q?wiQLwsVh/GVr52CZBe+rJ+enhkttYp7pGke5VufdziJEhB25kIK9+97VvpCn?=
 =?us-ascii?Q?9zzv4vaAfKhWdYX7LAJCV07sNbQN5FFaXlfsROydzg4/9Jb5hM9pdVbe6KhG?=
 =?us-ascii?Q?zvnEatt6eGHE4oTdpYKknBwlmFVqXrJ5Sq7M062dgQwIyIpQT3X289SXSXkn?=
 =?us-ascii?Q?2wvBBCYIUSMieXlQs2qd8GcMo9ufWHru2C8nfw6YMpLL19QHzU/3UpOmUgH2?=
 =?us-ascii?Q?Gznr9nFOCOwbayb1+Z2FLrAlgbPzPcgBuvJJydQ5lbEF7nG/4rbRLJEc+GJG?=
 =?us-ascii?Q?MXPFV4X4X9f6OejfgjxIyDjlZcop6veU01xjOemwbxKDoI11bXUsTF5EVT3f?=
 =?us-ascii?Q?1MM4aIRNZ4V69hQMi4/H6d6eYVR6/XSnSR6QXkHdDK5cTQ3SKDBN6yHksFh9?=
 =?us-ascii?Q?RkCAfmhLXitoo4DRZIQqYF1cc54xsV3VY2YxaFHyMv36wZL6cf+B6pVeEvGg?=
 =?us-ascii?Q?8trlSwBE2iIY60rpzd3Y4/Zq9fuOPoOwVARj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?s7Z8K6vwy/45lmTa70fXeqsjovkWgO0bNzeudeFNw2Fj/VtEJoi9p7+Y8p76?=
 =?us-ascii?Q?An/0abNi9A7j1f660ZN1VI66IuT3Q5eoD6JWaR2j5SUZS3RWgYUImeDJBniB?=
 =?us-ascii?Q?rpXRlL0gDEUBnMAUt6a9mlnZZlAYQyMTdKjmI9sIFeRULNEXKd0bRAtw1sNE?=
 =?us-ascii?Q?U/CJ39v3Ny4q4z8y5d0hrVPyHfm0j47KQDR9hhzncnENadd28EEQlDCUV7Ps?=
 =?us-ascii?Q?S7wItl9nxJwnXnjmsE1Zi9aTBeAp0bKGngAipYExl2ojUAgkxLmQVfyec1xw?=
 =?us-ascii?Q?UEmabz30bVt3Qwo4psUM/OSgbo+bGTsgnaIayOHH4fxN9WfaxMHzjBRg8Uwe?=
 =?us-ascii?Q?LECk1X8Mds2djx9Ff8/FnZrH7dvZEgiE+k+NPeoVBRQbvvDX4xC6uFlwWHjB?=
 =?us-ascii?Q?WCgmoBoSu9WVJxiVPOYG7Qnxiuzf3PTp19bXzjmm7a5v/QQ6LoVYCeIii85D?=
 =?us-ascii?Q?8FN81sVxwRr+TP9mp2EWklDq+ML5Yq5VZfF8NF89kYOEREKTdvkiPHdp15uS?=
 =?us-ascii?Q?T1WdcgitMDq6Z5uCOvB4VsLwq7EfdEmid4aoVH2vnASGOFNIWxfiu6lKWdMX?=
 =?us-ascii?Q?slKIiVVy5RPcQVmLcWqhccvZFcv1sMluW0F+n1lzSX+st71XbajCilLUPgZU?=
 =?us-ascii?Q?V2052bu+GgMdVciBQ0Z3FilK6fOWWxYsgcTgH1Qdsad0BWrRIGUcXpIpeSwo?=
 =?us-ascii?Q?/aXziISomv+S4/ZIsf7Ac7uwDMuOXb7wtanBzJz0ZKrHQps5HnY3dip45ouP?=
 =?us-ascii?Q?Ykd9aAGf/38y59v0EnR6m9u4Zpv26Z0XNB//Uxs3iub98b4JwbONXfSt5oo/?=
 =?us-ascii?Q?++n83LkbLadeebJdiZKV4weqrwN4G+XSG8GCDoJoDHgspNamiQwmR0+I3DzW?=
 =?us-ascii?Q?C2ilPZeVCsuWs4fCrs1TRYEcXC60vJr47dl1WeWKtuHc4Kdv3L9iRpKSHrVS?=
 =?us-ascii?Q?sq3KCcBJ2DQ1lt9S01oKbGLxEv4mGacUl/RrgySgpVVho7IPe6S1123NpNS1?=
 =?us-ascii?Q?XdiuayN1bEvRntEtJqcj5JHBsrMtRJxa5pLEwMcU/2g6QUyKf9fLQsKImU7p?=
 =?us-ascii?Q?sfI7JlvalMfunCEmR/V7hk9fBs0C968o1eQQOv6HZ/S/tl6+N1v2OSlGzbkY?=
 =?us-ascii?Q?NS5tIMvUskmZZZqtVZGysI2qWsm3oxRk4TDwsWGTzimphy8UlyPLkIfO2puf?=
 =?us-ascii?Q?anGzROpL/9L28gUdMzSWz5RH3vQAV1U8xlX+CjBmACJu4+neyiRwHtcu4Y3M?=
 =?us-ascii?Q?xIZ493D6hiygkr6bmtDO5ikOuV38PlpJjdw/u9xC6QX+1Cn+BamQ4UysGiX6?=
 =?us-ascii?Q?7HwnZc/YPRS7iXxPifFF0B8ARb3VLapjj1qFqqZ8JLue1C3Vr9PIxDcHDtKR?=
 =?us-ascii?Q?Qht2cFFHQgGj4qYZeua2u4OesHgOhfNmk82pqSpQe8oeH+gc7oG7OP+n2il2?=
 =?us-ascii?Q?MeUJ7+mjMyYHL25jNuee3jw0Sl6gIrotMlucLBrvh126k0m585h01VE96zR1?=
 =?us-ascii?Q?kZm5YrndnaJ3spZouuNky4nKNq41HGPXgy1IledTBu48uUJNpcM9lYaPiswi?=
 =?us-ascii?Q?yLiT8Qz22bYoplXqY/h9dKjvli0Js4xtAJn3zEKU9ihwrWHuzqlOFmBw5/Ag?=
 =?us-ascii?Q?phJPzN1kSeRTOpoMuSaFBNCxViU1wLZ3nyLgD430whguFbnOWhVzWzWtTRW6?=
 =?us-ascii?Q?ptCGJSN/BZHSndR0bL02StEqeI9hnotpYFYr1g4hb+yv/+CTIKy1y24+bL5h?=
 =?us-ascii?Q?F7G3vS2Bkk1Ys9tzVLOmc/ydf5XkAFU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d45acbd-8a87-4ee6-cc58-08de47ae0c43
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:39.0089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xDYorQJfbTDYlMn7Ws4X6hsujkOrhiK+pLAOmMTYiYmRmfN5gY1xnOWDaErbixEF7MQGGovLpjaAecxkKnU6hZ5R3bY3oYuPuTZqKMxD2Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: TRRKtIDRfC7uxXPXaDF0bIkt0ty3N7cZ
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6953dec9 cx=c_pps
 a=gOINuM4uNKhgYw9Qn2OeKg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6PUWIKKbP41UBv70GfXi2k8HMV-kAhRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX5GqSnmVfkaYV
 xWKKMkARkW8Es7LT0KV9tER4BIftb4YcWZGcWYB+uKQ9goQhe6/1uxKTLY/25mmteIgV6IYnLqp
 LQDgd8Km4eVgwOxt2P3Vi3LrOuS59Uenap1mmmPGci1SzuMDy9zl1uzBfEWfvPvPx9wxuNnd1lv
 zREUA1cxYmFBjW2iwiwEP15OY8C06I1Ek2sXou6bJgV6NAjMNNgxBMb/4vUloJflAEec21VXBmf
 cpzdwh+7TXxS/SYq1wUv4f9ATbocimYImSQViL4JO0o5193GcRSa6M8SUnoq0W7VMKieL+HtLDE
 DI6l3haZN2RDmBDGHyTZ4F+MrSTsWPySYwe4Fm6SCyhZ47gXt32fr4E1xZtIvX1RTbnUfO/gDgb
 GV8rIZ0QI9mchjOCbgR7vcNgABb14TjhXgozyVoYSdJ2o8GO+VVEcHL6Cn0wIWIVBXGMrKGmDSb
 OMUYqTqSRb7qb4h7XkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228677

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index f989b31c47..30a10b0801 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -570,6 +570,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


