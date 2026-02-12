Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A65E1EE36BE
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 18:11:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.51743.1770919862968216202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Feb 2026 10:11:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Hzn7fk6Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6503562417=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C7LA162401724
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=siQyC0Uwk
	aQjRSw4a786w80d5C5GzzdzVmulZ1gM61Q=; b=Hzn7fk6ZomC1BseCzhDMswCu2
	N/0uTkNhjPWtIlMrVOVvMxQ2+XG4UkLQdZ7jiSMYvLjG8NRm/ViFNnWwj1ZBipsi
	boNedYNSzhwhwgu+ze6m1N1ApDRMhZIpy3PI9yucfFvWEABlfYZcKTH017pmJlPU
	KflPyuvvwZ0JierOjnaII52tNV7GNMnx/buuMUrtblufMuwpUWcy+3qd2Ere/QoL
	+f9xL4lzl/bAhsBhtlc6H/TD2g0dheTG/jzey/8IVVRsVaNHTUYG3abLQVzH8j7b
	MJNLufaVKMytIaGSsLDu5HzVRQFJ/ZaK9ZVXc3lCvSLZN6DSRKpxmsn3nzh0w==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012021.outbound.protection.outlook.com [40.107.209.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5tkwphfu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 18:11:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qosxT/Ae/dxvDfQpKPWrtP4RahW69nlHvyjDuyVdowmdx7tZ1JvRmjsMUMOwvrXuz18U2IUFRB90PZibSmGXgPSJg14qUmwpoV7qysvqQUkBmX9YyTmMStzfSEZ2h0pe/ZLf6VDVrn8gVFwXDw176g4/a3pPCWbySeDyzVfIwn8+SHS8UPiyzL2rsK8y/zmXlQaBGdEx8f+JhuN24vGkCpdN6bPwFhnfGgrkEO5OPTYg4pPTSzijK+rGxV3BWnjcwbeFxa018J5n/dYko9Pv+KJFNgXc+gNRqzV8MJLbMpGPdAn4meYnH1oZYBvITs9f9S3FmTVOSQCEg2WPBJmUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siQyC0UwkaQjRSw4a786w80d5C5GzzdzVmulZ1gM61Q=;
 b=A4j7qVHkGC2dPJhaSD8lsycna4aGHgWDEIV6yAckrEHUnM1tF3YCzzVDR7YWCwoeVclJ4d4KYy3cMPuOZVDDjof38jG/c3lJvD8R8rQJb297ijFylKeHUh/Rs7AP3wSOI/6WRtHirj7ycO6d2K6cBKBnohETfUsDqiirxnVr5NLd03uaDmcJ7RwpLivvZ8u2ze1v4SBqc+WJTrXN24traRuoHyHL1cDstDjd1Zwp5Gyceo1k+par3aGy9MS0UlP5HwzarlUuTqT9IXnCH+l5eM3x3xAhUh4ZLT+balBErqEwUcu3daRorm+zUcTaRIoPNp0pUk05C5kLVxQPEB0A6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 18:10:58 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Thu, 12 Feb 2026
 18:10:58 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, paul@pbarker.dev, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v6 05/14] kernel-yocto-rust: Fix for buildpaths errors when rust is enabled for kernel
Date: Thu, 12 Feb 2026 10:10:30 -0800
Message-ID: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:a03:114::27) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB6928:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c54e1fc-dd37-4a73-9617-08de6a621258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i17U5EB9zy9g7rqD4HSYLHJeHHZVDiBrthbDhxBLDtg9kQvNEdV0qB8jnGNo?=
 =?us-ascii?Q?txVYGSksPDe2KD5iY+UfAoSANTfmQT2hzQpeSx2xkKtHIr2Vodw3kQTIH+jw?=
 =?us-ascii?Q?BeqhCVVi3hfrGX/y/j015C8ESQkFhN6ENfW5I2+c2mmFjWhBjKAOm0qBk7y8?=
 =?us-ascii?Q?pWJM6hTayzQuy/RZz7bhuo6IH21IEJkUX5o3nz26u2se/9vqJEv8G6blFeUw?=
 =?us-ascii?Q?cZiUuR/AGk9HMbsfflpn9MWC6TGoBsUTVogSJ234RGOZRkQjcwHAfFOGt+oV?=
 =?us-ascii?Q?mturMIq7HBXOASsmOXOkgVjrblA/zZVgHlTKzJUxfxshs7oUK4a5SYDKvQuY?=
 =?us-ascii?Q?gyA2WfsNQIRp/nG4qGrjYnIieZb5KC4xO13XQ4+lMW9yP/dk+woKh53cfnvj?=
 =?us-ascii?Q?nd02fZ72FjNZ5gafN4/mb309nQDxddcQyifH2xe2SdCbLa3hZtWmnplL/Vgo?=
 =?us-ascii?Q?F7q/bmpcKEuF47tI0IZZvL2PZSPQGKi1TAKwbCQNdukaNLOrJeb4EHtbKOM2?=
 =?us-ascii?Q?4YlAVEyfYBBRq8yWFkU4z2gLig1uxbDvpnOyTXV4N/EYzUmzycdcINqJHIkA?=
 =?us-ascii?Q?5gkoMkLRWTaKKczJjMqKPebLOaBGBX9hw6TCw44WKbJSAI0dfxi45drK5T3d?=
 =?us-ascii?Q?c8vwZVNBiC87S2QrI/jxzCEnxeS7BAXNxuccOAbb0EmjO9hzwx6efqn6KnmQ?=
 =?us-ascii?Q?zIqw7V8wiq3L+OeGeOKX5w2vDRuxaOeDvYafcDCyXmouXw2so9wlV0D+qUx+?=
 =?us-ascii?Q?KNgvimRhX28sumtIC0OaDXiEOpzNDQ94z7hwN78sGzes8IRz3T8bINbIC6fi?=
 =?us-ascii?Q?7x+Q7bprC+SUndMnedTWC+SMCrtDwZYBJzQiL+3WwyxsN0G5CgIMcoykgvjT?=
 =?us-ascii?Q?sg3orX7yiBFNjd0EXMOjDAIoVHMIR79bUnBjPGKcK+7XoZaXI6k4LlfWNAtZ?=
 =?us-ascii?Q?QBIu0Ii+4amGgl1QQD9wU2NHdF2XpHRVo/ceBgIPahqaegjah9jEBAnkhyfX?=
 =?us-ascii?Q?/X+1eMqPvDRfL9tJno3+MzDPCtxQT5yv+R45g5ZvVihT24d9GBcls5kYrPpk?=
 =?us-ascii?Q?E/3fjdTf3SmqLmwZkt33nBP7bVmnLQ1qyroKgBFNjgjRR/SHllslj9fB7+ZP?=
 =?us-ascii?Q?fNcnyUCUzyYpLoZd4FiijuGKaeYWZWHnC+hJ/ozZrv32YCL5STi+Vwjj2p41?=
 =?us-ascii?Q?685UyHgvKzM/3qMPBBmpAWW9t5U1QkhyAvlZGX9wf3bXEsq2YLpRCJpoLBSC?=
 =?us-ascii?Q?8RhYvZSsoVBclg6bingVXq4Rbkl+mHFwXSrttccWCIsJd1LDK3upZ/PzkEXL?=
 =?us-ascii?Q?EhPHooEpnw0jBuFNsn1+42Ja64jza6lPI9tbR78y/NjY5Apr4/hkyJJtxvYh?=
 =?us-ascii?Q?Yi84iR0Mrmlr0DpwU+KqoXj0FxCH7FOuxJRSLJCm/tMa5mSObt9EvcEnzGER?=
 =?us-ascii?Q?OWmI56ZX2UcspHlR0GFrR7OxDpJp3wBlSp2hhzKkGC1HBt6K3FDoPbAaFMcN?=
 =?us-ascii?Q?lJ/4P45ZVrKNh2qdp/JnHeuqLM8D6tEs4tvu0x/tZfayP/68qc09gxFI783/?=
 =?us-ascii?Q?LkEoy1L+cLaoS1Ovm/U+tjAXawZCal6i/DWeHwswu52uwBwXpCjZwa/htRDQ?=
 =?us-ascii?Q?OJVkPuR2DqinTyYSBRGnI2A=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2H/sp2DQBuQk4nLxonU64kldoWz4SqLRuMNZkMDWHfv33sFzrv0qlLZBz9hQ?=
 =?us-ascii?Q?9OTpA+1NAypUfV3yhb+q8/83X90ZrPGY64rua5kO0z4dusn/0bZE8ImpRspt?=
 =?us-ascii?Q?wxoQCSuV/fvN9lJfrnij1YUxulO4L2u/lHqzXouWODAiP1u3Hc1Mr3VCM/6E?=
 =?us-ascii?Q?tub/vjNp7L0pimROj7+KauCHqFFu80NdHsuBDxt7HME/25cAOl/3t+ISqtmG?=
 =?us-ascii?Q?exaidNDdFZRLPvevv7f7+WRjo6tU46yBFpUCTIvk0Smi3JM17XIpuS0T4xCv?=
 =?us-ascii?Q?mCuxHC6js0SsvF5F9+ooUm5mKEkwyv6WYlFiqokUYcotb0OqiXm1YvP5ot0S?=
 =?us-ascii?Q?BX6Smscc/Xh443EQYe3tX6kSu7mPZcKgvMeoinZIZGVi+0umc3GqBSqBjfv7?=
 =?us-ascii?Q?nT0o/A1kh8mcSAJNDynTAfs2Ce5iGs7RiQjmWA0ClECFhqV5AYT3DFSjvIqT?=
 =?us-ascii?Q?b2sHTJcXyjI6GDlMU/iqx9naSXd4lzi0jCoYeRuaM3uo4Mcr3QIWrZNfKRH2?=
 =?us-ascii?Q?jqvI851JSWc+5ycUv10MIuBIzvik2vEk/waZd0w0G+nj/qPQY33CLzFgEqH5?=
 =?us-ascii?Q?JrJluHKpROzLUNdwbljvgYoEYen/tsyijfFagQTztF+zXrEoTZ74sHW1/j/k?=
 =?us-ascii?Q?TwNz62OEI7Cz9VJGLUgQayWjUvQvNU71DL+arEIjg8qFOA2k4Vl+HNUYspjz?=
 =?us-ascii?Q?EdEbgQ3XFkoVj7sVNlPNUpVWOQHdnvR3hxovYhX49Bgeq8fnp9hde2GRMu0S?=
 =?us-ascii?Q?LTDClrD68mKJZLd7dHEIlpHJ1PwMsh9PE2p60HoEydEs/+dxZZqMgvKxRgEt?=
 =?us-ascii?Q?oYlA776DPSxtbml23y7YZNLOM02sdNwb51Kx5Mcfy4la5Lb7ivt1+FjQ7yuj?=
 =?us-ascii?Q?cKJS3XPSFkKy4+JSk2x4/9zbydrBJxgfsmo4DJD8ZBIhZHlp2Rq2kQWDPkxk?=
 =?us-ascii?Q?h68baenr+VJpFqZGTzF40LwrNl7s3fz/0PYJPMTy0lD/cWCWgGdvwqBChUZZ?=
 =?us-ascii?Q?bnHYHnnr/348SBILvb50mJLAg9ycHg0JlJme9hsRCf6j1GG1fYr56ymjghy0?=
 =?us-ascii?Q?L5RtkI18hMQhOpjako2FPLNfD5KRAqnrFK8puPShIhYAb4OoBO0kBMH7D84e?=
 =?us-ascii?Q?FSquED8ZutEfdHTeifn0TpZ0ExqMmeAZEmf2SiLEYlgwcpVlBtE/MWLba82M?=
 =?us-ascii?Q?mUZYAnkSCRsz8DIKp07KiTzCKzGd6Tg0eRt5oHGaIklEooUjaN+ThW/qpQfR?=
 =?us-ascii?Q?+m8tTEb2G02RzDjoi94DAkfVJ+O6Mcc34q4kzanxHJ301hRx64IS+5j1RpLg?=
 =?us-ascii?Q?+to538bdu7yh2vh2qJu57lLFj8Wwb3Gl3H4cEBO5HT+i836+Us5KSgRc2X54?=
 =?us-ascii?Q?cTvuuFodRmwwQ8G4FGk9+c5uA78daq/du0UFL9GW1cxhnhcqqkA+Hw6j2mBs?=
 =?us-ascii?Q?UraLYe16u2yFsnQ/SYbXvjdbtpoMjDSXdqFW/ZsYPiMxAoqjSINZwmlOX6gw?=
 =?us-ascii?Q?VrceJ5hrRfKG4vyMHOKeU/rLj2O6GXm+Be6jPQsD20TDhUZfvcH4DvKiplRy?=
 =?us-ascii?Q?aAtQUppdTwrfMmnhBTfhM+ih8TAojWRp9NMmDDdp6DWRgKDAFzpQD6sksIJk?=
 =?us-ascii?Q?IWjLcRoahcZ0vgy3XyDEOt5PgwOf6Cwdlg3NH9VzPvcuseCAiPie9vZaCmKA?=
 =?us-ascii?Q?2jClRDLFKP0snz0abW0KruTYoK+4jpGnNSTJpCBIN8wRdF1jEzXJYQ4PHJ0P?=
 =?us-ascii?Q?wJWWYzGdFOt4riXi4WXNSdO/XWfYKKg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c54e1fc-dd37-4a73-9617-08de6a621258
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 18:10:58.1970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jh07LYtXC3WGv1+rQzMfnGxmyNF4P0VEoNZwrPDhdLz7+U+DYjZmUj3S2e15wGgmo3jADFrw746tDe5EBD+6/Z2JwlG/z6awPwV9h/0qEdw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6928
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bvBBxUai c=1 sm=1 tr=0 ts=698e17b5 cx=c_pps
 a=oJa8ZcSO0M6ZbQlUw3N+2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=t7CeM3EgAAAA:8
 a=JTVBbxAFR3XZCbc8QrEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Us_EFjoIaEcB8C8MHE-x2S0nZwpbzmnc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDE0MCBTYWx0ZWRfXzPaQvbZpyrWM
 M6Z7leG4c8C1j1bvv7RgzOY0G+Qj2+JA7njFp3EbL3vFRT4q7mMxBEiXAwK67iVe0Pldo0isD6m
 Et1mcPULC5BhImWlpEiVhmly1cJls8KBokOGzhEGIsnJI0rlXCXTFY8JwlZzLDSlhsW4Y5h3GdZ
 UEOmb2YmW9arRVlorFPRJ/FOeoPZ5Z0rlIEWAbdm30qdess7rzRUC9WumvC/eeV5PAk5+k1qxBG
 n1Le9shEInOHxB2gj3DGTeGjErHUDmW0a+YrHeBNbE4LbkVj3dHay55Wk5Q4UGC3EkI9MZmhhi8
 E7neM9SirGEkGFHtkNZgFioCoiZFVcFJqfxQMNdMEWcBYI1z65qJJqG23cpLcQaGpnXSFIDo7P/
 aNjdgJ8FokUj8iwA6sz9EDHffHzQ+iAtzun1ONLIr9CKbo8WN9aC6OvJdthyFSyJRlflspWfNmh
 gXNjOV3Z0Qpv3Yg3zRQ==
X-Proofpoint-ORIG-GUID: jQBAZRj3rQh9VWrZEneZvTbIshULt13v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_05,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Feb 2026 18:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231061

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after enabling rust for linux-kernel

-Introduced KRUSTFLAGS to pass `--remap-path-prefix` to rustc while
 building kernel with rust support.

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 7acc81764f..fd9ee91c79 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -4,6 +4,12 @@
 # SPDX-License-Identifier: MIT
 #
 
+RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                    --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
+
 RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
 do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 
-- 
2.49.0


