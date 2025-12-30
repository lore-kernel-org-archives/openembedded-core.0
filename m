Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08203E95A9B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:02:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64541.1767103317421033784
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:01:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=E7b4Tp4X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDAvXO882207
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=; b=
	E7b4Tp4XFRKrefCa/uLbWOSJ8VwLE4if2o5UW5oOewGztc92kBATRrQnyAc3sd3Z
	y+DB+Ij4JcCEZSe0ChzrGOCCBonv5JB+ge15hVJOZ5DRfAm4PBKhrNRfMrlAEPtU
	U7LF8INS6JNHGkr0skAELdcUXrMilncaym+LviAIynCYIV/CbfRN1FIw1+mE+liz
	R/DILsrWMEbZg/0y3424VCTe9w7A8WjdUfDNGebKf3F3rwQGGfdrW9iVnVE4bNhx
	AIvA1HrmXGOJPsG/q/F4exeHPaOJ5x7r56HsboC4fhuG095myJtvYRETpNhBIQnq
	RYi5/D9jJAv2i6Q9e+0Zsg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012056.outbound.protection.outlook.com [40.107.209.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4tu81-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:01:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBmW6xJwvMhpcY50qi51wM2BI1vYAVykJ8MrSiaUPxjJDZ035criO2ZG7Izc7l0iKkZHkKhZRB2m2bUmDr8wpKitvedesrNEPaH/io2Wsmk9cMdhY+wHyx7a5B6l9QIaYn3mCGiCSeAIUN8UlvS47LPYQL8V7ERDThRlupD3lYUsIbC+BZ22tHZ0BxNfrOhzl8K4jMRo3LCC3w1e2MoN9TciFy4WedjwmFvKif6ChW6cIJdIp08xItgUKv5hlsbFHBr+pUHs8vz+4qY5GhjECRQKq1KkP1ktqBMzDc0Q8xnyX2oS/xFvgn6MLnhEdKA0AcB9NL7/er2nSPrvGEig9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFFrZm01wqxVjPezwt63WNk14vc+a6cLbjRlFUrBU18=;
 b=Jym6XaLNPUjZRGtRLDM4ZM23hlJAnHg7+AmO9qyS6h4IjGPriSazbiQQMljVs4CTQaDztL+FlWEwJ1Zer5kzxySNlkFv+RaVlrsQzgoBlvCG+2kVVAmdmc74IpijpFGBuc7o+X21R4yYFoRunxd4Ukx6MOMv+3+dz24pY6rKB/HUEfmGs2ZP90vtJ//31BzrE92Hi9wLQwRXw68rXgyWIz3n9hyK/Wzy7USpH/5psX2+FIZniWIkt6FrJpkEs7COcza7TiWeanApW7qo9ixAEyC885sdhregz/wyi4bNjiwl2K2HkFftbflECd2kYDo/8L3FBKw8wTPKZLkfTMdERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 14:01:54 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:01:54 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 02/15] linux-yocto: conditionally add clang/rust/bindgen-cli-native to DEPENDS
Date: Tue, 30 Dec 2025 05:57:21 -0800
Message-ID: <20251230135734.1973083-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
References: <20251230135734.1973083-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:a03:333::31) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 602c8dc7-524a-4de0-c732-08de47abfcba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?47dyOIk0bOn/1ajDdH3XBNuW0vD1E8RGzwzC40mDultrIwW0ifLItijtPfOW?=
 =?us-ascii?Q?TQH+1l2TMTTYlzO3ESmpEfBIFBC/0o4ewa+xoK6ZkejVsyvqRxW60k1R8Po6?=
 =?us-ascii?Q?acF0Ype+WmT46sArz7hwFi0dgAFo6wCxxqivqTp+2Bi96ujUjmI7zzS1vCNa?=
 =?us-ascii?Q?ctbLjgZk0jX6/kdoSkak2Wvy0rjFdW6wBcKJ5DTu+tQ7wz2DAXFbeK5tpsTh?=
 =?us-ascii?Q?KZkSAHdgkAheL4cDZ/RNqv5KnW4mh3nSqBKENg+7Rj0mKdXmA5QfFsFLSzgM?=
 =?us-ascii?Q?jUxjNeISRzOnMStzjzEnRLEm50Eyt2HdLZbm1/RMDGASjyGomMG9oBzp9C/T?=
 =?us-ascii?Q?jPCZZiArfHM6rXnDFo+gM4cD4a9ukm3NI1xp7yMv+BTiSXoMYg7bqEgWNr6Q?=
 =?us-ascii?Q?zZE17Qhhcv61Blg6kL3mcf0V3StiP+e1cWIBtCp5V8IQ7gq2RNjwWEj9wrgG?=
 =?us-ascii?Q?8jLEvyf/AWNPzZWP246u2Lcqgw9Itfu4rn9b2c7sYywFu1KwRpvQSj42RnVX?=
 =?us-ascii?Q?MEdIKCvqm54FoNuwwblkjIriPcCTDKTfEp2NwZoErd0PzdM2fdMUCbGaIr9t?=
 =?us-ascii?Q?3DLaPQE6N075UWom56Gqys1uvHLVeec5OyKpJlud0QSYzK4S6QRcpkgoKOso?=
 =?us-ascii?Q?cPg9nAOBTTS984bqV9CNP244VSPhUy8+Sx/K9W4iUsPSWlGGudPdvdwx/s8+?=
 =?us-ascii?Q?rIS2FCw0L/SGLwfs6TXhntC0w4T6lWv8BClS4bAQHdyBvgCO4wHoMTi0Qg+w?=
 =?us-ascii?Q?/0YSY4yGxu1UsKWgtI2EnJMhuOT+g1LraqJzVshdQtp3gmFuaqVLGvN9Mbtv?=
 =?us-ascii?Q?IFQrony8Dy9JRlO48ySDtbfNs6P5jCrmGJH4mKwYOVn1tnJTZjiKU6sdVL0F?=
 =?us-ascii?Q?SNLdyMEVZKr1Ftk4PH2imdLhZocXxStCCMQpgcefo3kHJhuiEXvScEKR/b4W?=
 =?us-ascii?Q?yjrSXD2MJYyCULZTW1Am3gnMwSfYpBnOnagmIA6z70oWVGDTWzm/43LB5HIP?=
 =?us-ascii?Q?87z8hihgN1kmn2zeiCfLeBkRM91Oc4/jUbDNQxUfD/Yqfd6K/iBT8qnZxuNg?=
 =?us-ascii?Q?uvNHTQHFU0mZibgE4XBjI2Hoj3OtzLzF+/5rlCOPM2PfMl55idn9Tui5qXe0?=
 =?us-ascii?Q?x7O6zDhn7EA4Di7s/G7Vx1TuXZOy/hSGh3sPgydiQaoPzuRRN0x+8opigMPY?=
 =?us-ascii?Q?FVauD8ia2mXFcv1VUs85ASkGeq1M5hbSfaghZKQ+cv2wpzMH0CHE4YH+42XG?=
 =?us-ascii?Q?vQ2Y8gcBRRtp5cBAGcFlfxthpJ6iOBedyOTqyU3pyKD9iWQcDxlfoa+oybQV?=
 =?us-ascii?Q?ZOm7uCwOts/3WvArrXrSzm8MFG3YsJjo7Vk5nlhSvpaZRHGevsDcBLp0wff5?=
 =?us-ascii?Q?GnIwC1poiiTqNNjXX4WZEI9siGVVRHAVZeM9P63gpww6HGumu8+ixEJ/mIxq?=
 =?us-ascii?Q?VOLS/otp32cZiNYzcfw+6d/li4zXPu7qWW/vicyWQQ7TN23weXk6H4dUpc6S?=
 =?us-ascii?Q?iKsh/vGU36Q7Q7rggUQWhMsO8MkkO7jONEdk?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oAXY9+pYyWh81N8grhAYt8vc2Q8o6RoDksjEIz5OSr4uqyyMX1uM4tzH724I?=
 =?us-ascii?Q?dd+IjZLb4qp7W10IowLODPq61mAaqgz2S6nicOdjo/yd2M4gbNF+f4joVxhw?=
 =?us-ascii?Q?JTOAVrkB+kAuXqMVfDxET1x7YDvIyBfkI4TohVLKN6S+Zxrdoq48cmKyIpcH?=
 =?us-ascii?Q?Hz4mi5fXPTaBSUGD2c1EL2r8mKDb3FZvV8LvfQoaWzUdJRBTsMZv5kTD8eQQ?=
 =?us-ascii?Q?Gp9+qLEFG9Gv0ZLhSo4ZnNpkbuLAFoZmyVZ58f7CkCnISGYt/a8y6/NwOWnS?=
 =?us-ascii?Q?8T8g7V5uCtt1gdJwPtn66OKq2R0nNUr3ZW6x7TtKtjvK+rpDwy1tOeUj40cR?=
 =?us-ascii?Q?2cF40+phKospC5+2YqMZifo20/0E2SfPR+Jfhllj2ZaK8VTdjxjtkGS5SaMy?=
 =?us-ascii?Q?HhtmrUIucfrP9czaixvFTzNWx4/russqkl1rQNRT5XyMQQuqjytObpztHt6d?=
 =?us-ascii?Q?4ZZOoIdpyySIE5ofMAIFnD9NmNww+PjUN6VM9FaHGJfngKarSyBqL3NHiq/Y?=
 =?us-ascii?Q?HSWhaaP5fuYBeNYfuLpkiinWVS2bYD/Yp0Xf0UjOjRrLgG8rsPZXDQKrcLUq?=
 =?us-ascii?Q?bnVHOgtsflvbEir9PyC0u408L377HaLDx8cPzzzxeCKhsq6JMamuDqO+6PbN?=
 =?us-ascii?Q?9+xTj6C+pxoHMrNl+4M7CgjJ3xFXz7U7ucZs3bAqGtEbW8zH4xl/QPSOSutI?=
 =?us-ascii?Q?w5KGMlqMwwagW9cfx34bdg3EQktkCvXrOetYbbUPkFUnbtLCRvjBGk0HQIFZ?=
 =?us-ascii?Q?ol1LGh6xtst+yPmETPKh9zwF399Rv6EcmpFrBmizuyXDeVZ20auASI9MoBbq?=
 =?us-ascii?Q?Jrxh16ZB6sh58FfrqhA9tDZq0N5Kpv+70MyVR7H8oYHXR+qf929iJz8rU+fm?=
 =?us-ascii?Q?7VaynUBaI+4pI7AHq6qIAx3j6ftdmIeblrHPMosE6yvZAsrA8/hZN1+5Veb3?=
 =?us-ascii?Q?KuYc8Eu6cASkCVqQitYCX5DjaV5BXi7cr2bpXo6ff18g1lRmO+KJgwlvEfbI?=
 =?us-ascii?Q?IGPsvVo1+BfaApcG3mFovotUsjVgEbW7smWy4kCnlMohS7Dp1kr2mDGQS3Cx?=
 =?us-ascii?Q?Ri403wF76U2C5molGJYTwsmAIOQYNjMc1B60xWZVx8K7KN9MO6MEb+XHeBdq?=
 =?us-ascii?Q?R+9dA8T/yYW/Pwm3MbzeNbxdSDyQaAb+3phUlZmoN4/6+n6OefAV8vN907SA?=
 =?us-ascii?Q?TniUny2nyUmKHnH6+ZkZ374HZKcmFKXG8pGPYxHXYKmRmdwBkZkHURxFxQZk?=
 =?us-ascii?Q?USY8ToE1q7d0Im3fvkHRHNDEuSIpWlDqhLXqXs0uMsR7QnQW97/iJPizBlPn?=
 =?us-ascii?Q?1W8b9udypWAxiwMiX1039ETPfZ9IWDSnuZ7yytBWCWclWYn2UBKmIdy7d9l5?=
 =?us-ascii?Q?jTzC8FBWtx6mGOoZNwlqJF1+JdBulNcaxyFXYduXL/epq/FpTWPKtdA1enCT?=
 =?us-ascii?Q?9bMvzH0SLGwq7guEkp/rk10Y/CJX9oCsAda3ONt9k4kZvZhnN4SLBowGn7ge?=
 =?us-ascii?Q?hKoy9qPQNLfDlcay1ofaOcF8pDKreZtw+bE+BeRhG6vgOJgoA1linJ5lP4Om?=
 =?us-ascii?Q?Yq78Ru2v11lXQxi2tF/3lm6CUH1XAqAiRsgEV08dBFv748p4SQ3lj+l9UBEg?=
 =?us-ascii?Q?r9oAwg39DrpxEAHDVVkgpxPvETSO0xa7xJ9U8iItv63mWs9b7nSxqdF5ZPxJ?=
 =?us-ascii?Q?dhAsAXk4I99aPaf/V6zEm7xYsV6WfvHVZ2Ffg48/JE6az8O3Ls8bkv3jYUGX?=
 =?us-ascii?Q?8PUX1jn3O/W9iyghaMph1hKMYOFEuP8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 602c8dc7-524a-4de0-c732-08de47abfcba
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:01:53.9577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +GP0MTEJMlehrv0APPf9n070W0t2b5FrBKAxSH1N75SNT3LbIgpqA6GztisPyOheolpDbTMO/OTE7dOR+ZbP5CKeSM+2dQUxzUUZOTS0KCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: nvK_XlZIR9UaCkCTkAPHqnxPJCtledZO
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6953db54 cx=c_pps
 a=jAY+Yiv4fe/m5iF0AiXt4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Rfw2oJpr3f21ZIbSA5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 00daFFYj-dQF1TdAAoBMEA0BbbWu3hkL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyNiBTYWx0ZWRfXyr9pblQfpLEe
 UFOO6LbNzbAbLYDALY+CIfRsk6AkmAMOgFdcR5K/rqYdZa8SNu8MHqJ1164DDGvTIFYIpTfdXu7
 uDQNODbvfMLZY76bEIRgIJWOQwxXS7sQLO1vkQEcxPUhdxtKVNDJ05kJ388TSAtdoI9s/z8jDup
 wbv3H6Bsdzx1jkJh0PyDEm1kpkHFHyuQjViDEMQr0IutS4mr4BikdgmFit4JsoT9xBq0d69SzMF
 /BnN1o3VopA1lW54b06ReZW13lq3LVjHzplXwgi+WAa+PUWtUbRV2Jzl7hxxk32m15wecEGLvf7
 1Dv5vwVI1WBjZ7O6t9/pPMk3Aw3pSZ8KsYnxOqYk0ikSRJiE4BaKx9eDnovUbwc3gkkb0HLa6QI
 wKjrYt81Cl3oUErJk1/nACQ3+QjsLsRj7QQS0ySwD1bRXWB70Y8uSEPa3qZ+PKe13TjPxsttrK6
 b/Feaiqrdv8eLUyRPkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300126
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228662

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' to 'DEPENDS'
when rust-kernel distro feature is enabled to support Rust-based kernel modules or
features that require generating Rust FFI bindings using bindgen during the kernel
build process.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 4d0a726bb6..41b12b6f14 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -81,6 +81,8 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
+RUST_KERNEL_DEPENDS ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'clang-native rust-native bindgen-cli-native', '', d)}"
+DEPENDS += "${RUST_KERNEL_DEPENDS}"
 
 # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
 do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
-- 
2.49.0


