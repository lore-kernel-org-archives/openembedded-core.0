Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B66CF3095C
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 13:16:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43845.1772716603488091491
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 05:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=GsETUKIj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7524e93aa8=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62567LG42369690
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Mar 2026 13:16:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=tNhB3l3bB
	mzjhHHv0T2p+MDL4ASSq1+vFh3wImiPI7A=; b=GsETUKIjh5f4aCWjmoymhqnmI
	cSmDvmfcWUGzWUHrQJq8Dpq12fv7kVMQhOHtzEJ5Nntw3X4tVGNzVm3V1bQkUocq
	YTEI1SKGWKBasB1eP8+YXihOQir1AVh4El1D7Z/khFgs7pXi7aCxkSbGlvGWxh39
	LK4ubrSu9Mvs8IwgwcPxCflzFSNQGIx7B0jXd+xvKRI4lcmGHNDkyTK3j1xDOB0V
	/vg9ce0A5h748llJYjinGqsn1FhJvtaxK/CfTqsF2J7Btgu0YKZHtaxZzUen2wni
	OaPfR+vO8Clq8++FudNsdOsvKWyIvPUqJGMYvG6Xi+Thu/4g/yQhYzrO2utzg==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010058.outbound.protection.outlook.com [52.101.201.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4pd6e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 13:16:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/TdSogTl9akeeZG7C3NiJ9tIjRut9cLdgLr/MEbX6cSvGOZQ1SPQMKk5dECjOFYSiu0QgwBcwQTAccM3FjP6OCZmu/MnVODYEuiayVIAtaYS7nQoUuoy/aghPWD2FjU0ZMEYIYIpJkZeaNdPTXauLCS58OlKU50s9QboJQ7U6Ihk0i3+REAeRVtGvGY+0ZUMbi6XifS3s/6+aG7rY6ti1Hj2rk/cMYqdfDQtLsAoH5PiVDWf3W8vs+Y7xq2438KAnMcw6k+FSLRkxTZzAKWPvBiJCWifFK89gHOV4bHsDaI60Y7djxXIJYgc+ST+aCMpnhFTC2kSyqeWYK9rRtSaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNhB3l3bBmzjhHHv0T2p+MDL4ASSq1+vFh3wImiPI7A=;
 b=MCqaJ+Yww2Z2Ic4N8ozbj0SMpErhW3zWvp8xzbdI+OfJyV4zTm0+kJuopziKRfOfn4/Fc6oh9FSisa8A4QG5UH09lJdEoGoVmwQnVHI/WUqjzu7luj3Y9StVvyjXxdvKc1a2993kU2DP8lbK07iZl5TLAH5CP/xnleCTKQ8mmHzkJYL4GtjVWbM/MFc1TCEX8LeIoNozbG/2oLlmIgJLuOS8K9p8bObczahbzKOB8cY68LJjG7tNZF9IVisr0ZODZzMG14e0NUUY42ozYbFrKYIFfJjQ3z9/6lqV6fuUuh8+/RsuSwZSSalz3M2LQON6DUbqtSRbct2HP1TNhfMogA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 13:16:39 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 13:16:39 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc: Fix gcc-libitm false positives in regression report
Date: Thu,  5 Mar 2026 05:16:22 -0800
Message-ID: <20260305131622.1145822-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: BY1P220CA0015.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::10) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BN9PR11MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1509af-32da-4ab0-44e1-08de7ab96f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	irUjAhDTecHabx1fU+fow2GuLTwf9iKaMEYFILL/hm/8JdR8Ghh32+lf4zQryHbgS0qVUqZKfois7ntznG7S9CPbskYWxFDJvT7voi2S3B9fqF8/kcQMqPFEjCtiKHEllNlxxNYsrggNTbRTRmCCFgd4xUyw2yzvABtGS0beOHrWw+ZzPex+JbYYoyA+fxlneXSs+QqctotbQ+PcdNL2W4NuOK7id4Bo09kp4HkmBtw9IvgT9D2k39mm5AdjzLqtLIC3JDbIYVIvkum08xufEoKKvuBFffDznoSg/OQNvH+Gux+EpaBjfunQbeW7YtgR+FGOrESv/U3I0GsLJl8hnGeTHuBUCenyAy8sIOqUcsa0Gegnlcoux+ByuF4JUpS9UnJEMf5RUjUyFhmVWA3n9ea5QZNTMbaxOUWsJnb3X1OL9Y2aLTYtm5DV2XfI43aVTyUDvC28UEeD+FhOiczPxB8E04kNd3iP+z76wXFwQAjV32lFl44RZfKo0cd0gi/sNjks5DRA2oqEItRkn9wzX4BEXJYgGZWLfqFqOLV9Y+C1ZWHrxSc7oFzpKaMn2qxwaUnK6q2TBBTA0svZ8ZnrSy5npGuKw4Bd/pXTzA3tG3POv/KSnb2+o981aQ2OknTahQyA9o11iPX5Zt9lJioNQvxCIwKgWvqaom2+HIgPELBoF6zF1Or4zVCxOUpD4h0K752F+YkvijlAMTV0OG5aGSloNjc2Y8XrhsohZJ4bn0oIiYYsq3BBYjw0FuFpRnES2Ug4NqDFY60cmbC4oA3ZA2wEzRSCqRmsMS4dFv9suVA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OSttUDdZTk5hS3JCNmZkQVZCTDNmWlZreXRtdkZkb2xNNjBrY0hDakdhS21R?=
 =?utf-8?B?MTZoRDJ4Y1ppWHdYWVNENFptc2thOXFjSEV5dnFJTXYxeFZDZHRDWStHMnI0?=
 =?utf-8?B?OW5neDlhNDY1a2lvU0Z5TFpmOG1ROTdLU2lYQjBRVVVrQkdIZGdHdEFieGdp?=
 =?utf-8?B?QTkvczREdGIzeHJ4MWRaNUVFRVlKR05nc1FPTFdlaUhWT3N3bnBpWFBOYUpK?=
 =?utf-8?B?NjYveWtKSk44eXMvR1dCRjZ5VThyTi93UkVRZWZGNlZybjI0MTNOTlR6SW9H?=
 =?utf-8?B?NUxLVkE2Z3phUExDYjNqdVU2TkhnVyttMXFSRlV4Z0Rja2czWXpLZm9uVVkx?=
 =?utf-8?B?eUx3V0pQSktpZjdEeGNxSkR5dVBobCtBYVNXaGgyd0J0dDRwL0lEQzlDd3gr?=
 =?utf-8?B?aW9UTnlheWZhbUFmTGZwYmVRRkNMaEJwOEtibjFqZ1BLSXNhcUVIWVlCVGFN?=
 =?utf-8?B?bTk4aW9uK3F2eElqY1pMU0FtZWNERUpqM2EycDFGR095NFo1Uk5YbkErV1Fs?=
 =?utf-8?B?VERyNFAvZnliZHFQU1QwMWhqK2xhck40RnBxQWllL2ZPLzU5UzhTRkY4TUhZ?=
 =?utf-8?B?SmE1QmFPWUJjbHlEMU5PMTF2K1JPOEZWNUovS0R3NGxqb1l1QnBiMlNzMWV0?=
 =?utf-8?B?WGtKUjBsdEh3T3VJdzVNSUpVTmwwd2FQWGhmZkpOZkg2ekxwM0xpYk15dE9o?=
 =?utf-8?B?RGNiT0dzNjl2emdFS0lzYlozcjBwbGJJaWpiRGE1MUZVbThXWmk2UEZ5b29T?=
 =?utf-8?B?aXZWc29XZnJlakJ3Mm1ocDBYQlJveUJZTFg2ZDlOKzNLc2pzSzlOaHBtVkJ2?=
 =?utf-8?B?aTBXOExJZVBYeThPdWpLbjVTZlVibUlDbWM1UDk2RzFoa1Y4MVdVRFk5dHNs?=
 =?utf-8?B?YXhlRFlXalJiQ3NKeGVEVFc4QmNBL21vdVZCTldiWERyVmtaOFk2dm5xYU92?=
 =?utf-8?B?S3BnaG91Y3AyUHFzU1JwTVVFWlhQYWViWFp3cmptK0FYdmxEL3NhbVhIc1NB?=
 =?utf-8?B?VkRTVWFNSUxBdlp0SjBqOTVlSHA1a1RabGpDVmxLbXROMzE3TVl5YzBGeXZP?=
 =?utf-8?B?TUdJWnNzK3orYkNQMm1hQWh5V1Zja3kxcHExWWhYRmNNVHhzSnhOa1o0aEtF?=
 =?utf-8?B?L0E4dldHK1B6eU1mbElhbFF4VWxkQlQvb2xpOEJGRzhhbFV0eHB3ZWNxUmx5?=
 =?utf-8?B?K2pNbDkrMCtIbWw1TGxESVlHdVg0d20vRGRhT3ZyRnJ2Vng3ZTN2YmpsMkJo?=
 =?utf-8?B?blMxa3JYN0xGazg1cmpCNWhtWDhBOHB1NmIvSmpFZWdmTTFpekdxMnVyQVJQ?=
 =?utf-8?B?TnBrUVFxOS96Y3FDTVdJWTdTUmJQdlR1aXByck1ZMEtjUUFhRFhUUnRsZWtC?=
 =?utf-8?B?cTJYN1EwTXB1MkZiRktzWmdUdlBVZGNiaHR3N3k4L3l6V1dmN09YWG5NTCtI?=
 =?utf-8?B?cTIvS3BQeUM5QktnYUNKdkVQbTEyM0EyREpvYWpJS0xKUmlrYU9CQVdvK2g2?=
 =?utf-8?B?TTBJaXFzcEJ5UUM4N3ZUYmY2UUFMeVQ2M0lZWlY5SUR0VEd3dEVSZEo3T3Aw?=
 =?utf-8?B?a3lRWEpuQkN5S1BySVJDZ2RlSDFzZ0c2SDNnOHJ3MnNkcHpmZFEycXRXdURU?=
 =?utf-8?B?NHBtbXFYY0JsSzdOOEpwY0FCalJUQ0I1QTRPdXE3MkMwaWFyc21Mc0JtZlVS?=
 =?utf-8?B?K1hRMlpzT2w3ekY0SWVWbkJLbDFOczc0VTY4V2VDUlpjd3FVUU5jUmFlcElj?=
 =?utf-8?B?cGovd2dtMmYwTWVCbXlDc01oV2pZbHZpaHRvRldxZXVGZGxkWUFaSm1ObUxQ?=
 =?utf-8?B?S3pvaW5KcElXVzg4ODF0MEJsaW00b21vSVMvcFVpeXJuL1BMRkMxOFdYdmRu?=
 =?utf-8?B?ZTNJa3lzZ2xQN1paTmZoaGxReW4wR2dCWWhUck54RjB5Tm84VFZSOEplNnRE?=
 =?utf-8?B?Yjl0RjR5dnhFM1RKc09EcThqVG9lRFpqaExCZnRXT3JxSWRXV3NMRXlRamtt?=
 =?utf-8?B?WEdCa3ZPSXdXOG8zdk1yYU1wRzZUY0xQVElVNjJvRFpqL09hOGtMSnFTelI4?=
 =?utf-8?B?TUhiS2U3RmFjeThlc1lhVXpVSkFWSWRiWitUVU94MmptWklHYzM2WTMvV0hz?=
 =?utf-8?B?a1crY25hQXU4VFV3TGZvaXFSTTY2c0lPOEE0cUlkNUhOLzZRTDVIcDYzckk0?=
 =?utf-8?B?RlpSQnpuME9MUUgwa2FoTDhyOW5sbTR1UFRTc3pxVkdRSGd2WkZSUkk1Z1NT?=
 =?utf-8?B?NW93YXZBMnhPQ1lBbDZjdVg0NTZDTk5wR0lpUEtHUWZlamVsNjEyblpWTmxY?=
 =?utf-8?B?N1ZuNkdlNFZNWElHL2xRbVBSOHgyK0J1YXZRNmxpeG02NGhBQ3hYS0xJUTNh?=
 =?utf-8?Q?bCncc8YXisiBJtUc=3D?=
X-Exchange-RoutingPolicyChecked: 
	deWnp2tkKa1FDJj9YBSaz2vFvyuDNp1MfyTX7oteoyYutOA8h+ER+P5ylEkYPRhts63zrSHxRLMpcZM7LrzR/gmC6/mYSMxHcebsGMNZhR4Li0BO65srpKImCNPiF4zvmo5lKqlPTSH2MFowhJwAjpDyq4LSO5uceUjL4dVkfVDh82bCB1fhdxmQg+omIra6SpNNFfDzt9fip67WlDmri5FaEH6n0eRbgStHHbW9u6BcCg8qLNvrjvvnYefft3ptG0EoxTTTxGyvqbInlSAyMWHFMviW30ThqipSDt9T1bFegMTzsc/zMA9JQjuRMnJjJQV5cKEYbCwMKF+E91XAEg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1509af-32da-4ab0-44e1-08de7ab96f83
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:16:39.4596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILbEkBE3pIeCLQnJd0DXjHPlMMxwn81Tjb40qU+UGdY4cn4rGfB3G9SkuWY0m4OJ/fc+prjIlmK82tCy4OBgcPxWOPi/qMdag90Vqyz4tqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a9823a cx=c_pps
 a=jKN40M1qUjEArv1iOeQWeA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=9VPlPrzCAAAA:8 a=20KFwNOVAAAA:8
 a=GjTQCA7N_HrbmuxK7fMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=aK1hd8Lu7Q_i5nYwpAI3:22
X-Proofpoint-GUID: B4ifSTkoT5GzedxCN6_9_gEXV5M5peqf
X-Proofpoint-ORIG-GUID: B4ifSTkoT5GzedxCN6_9_gEXV5M5peqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEwNSBTYWx0ZWRfX+UZwtJImFRx7
 RDUWkMVnxiQcPuUisIsgy2HqG5qgTdEXbsR1fT8Di42tD3qv5FQpA4oCy4YtXEBUWaZDmmc3Yu3
 rnK6LOXbRlpWlzn6Jwkfwcq4N8rOTvJ9S78CJ7YsEA+G9dIy/3xV2PkGU50VEiUr7SUjNqJ433z
 UxvHTgR31QnHxMomLz1w+2aZW2RdJrgs2fn2SWQyGopRkLefgzoniiNtvBhSMfwV9CBvYaQKDoX
 GdUuobXqO+LnXshuWMgUWRsx3NhSk3S6AprTrdx51NqJNG70znhUEbZTqGLbD+BepB6l1SYW6zD
 9dbokGAxN4ck2UWsrixjQnjsUeqvj8BkK43nwpxA2yHkZVEWJOzeiRDvzlS1Cx8aGLYU18AGXXL
 nPRvsodZZ7MwdFQzu5wD8HQDVAQrQKGPBz6dJ4WubDLJH/e+1tArZRAONhoWrXH24aevuoN0kHn
 9ZiPV+TziUOTWKOQOuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050105
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62567LG42369690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 13:16:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232490

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Some of the gcc-libitm test cases include build paths (e.g. [1]) in their=
 results.
When comparing two build outputs, these embedded paths cause resulttool t=
o incorrectly report regressions.

[1] ptestresult.gcc-libitm-user.libitm.c++/dropref.C -B /srv/pokybuild/yo=
cto-worker/qemuarm64-tc/build/build-st-64312/
    ..../libitm/../libstdc++-v3/src/.libs (test for excess errors): PASS

This leads to a false regression such as:
PASS =E2=86=92 No matching test result

Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3Db129f=
f0880c6d10e0379b46889d01255ee8d1f82,
                           https://gcc.gnu.org/cgit/gcc/patch/?id=3D66ce3=
17036f2eb5aeb96d5e4b9e468799d7566b]

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-15.2.inc        |   2 +
 ...028-fix-gcc-libitm-false-postives-01.patch | 187 +++++++++++++++
 ...028-fix-gcc-libitm-false-postives-02.patch | 220 ++++++++++++++++++
 3 files changed, 409 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-fal=
se-postives-01.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-fal=
se-postives-02.patch

diff --git a/meta/recipes-devtools/gcc/gcc-15.2.inc b/meta/recipes-devtoo=
ls/gcc/gcc-15.2.inc
index b02cc4fcb9..1508031424 100644
--- a/meta/recipes-devtools/gcc/gcc-15.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-15.2.inc
@@ -74,6 +74,8 @@ SRC_URI =3D "${BASEURI} \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
            file://0026-fix-pr90579-testcases.patch \
            file://0027-gcc15-pr122394.patch \
+	   file://0028-fix-gcc-libitm-false-postives-01.patch \
+	   file://0028-fix-gcc-libitm-false-postives-02.patch \
            file://0001-mapper-localhost-might-not-be-known.patch \
 "
=20
diff --git a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-post=
ives-01.patch b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-p=
ostives-01.patch
new file mode 100644
index 0000000000..d8ed99adb5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-01=
.patch
@@ -0,0 +1,187 @@
+From b129ff0880c6d10e0379b46889d01255ee8d1f82 Mon Sep 17 00:00:00 2001
+From: Pietro Monteiro <pietro@sociotechnical.xyz>
+Date: Fri, 30 Jan 2026 20:22:49 -0500
+Subject: libitm: testsuite: don't include libstdc++ paths in test names
+ [PR69018]
+
+Libitm C++ tests pass -B/full/path/to/build/libstc++/src/.libs on the
+options argument to dg-runtest and the libstdc++ include paths as
+the default-extra-options.  This causes 2 problems:
+
+1) If a test uses `dg-options' then the libstdc++ include paths are
+not passed to the compiler.
+
+2) The `-B/full/path/to/build/libstc++/src/.libs' gets added to the
+test name.  This makes comparing build done in different directories
+harder because the hardcoded full path.
+
+Stop passing options and default-extra-options to dg-runtest and move
+dealing with the path-releated flags to libitm_target_compile in
+libitm.exp, where they are added to additional_flags.
+
+Also change the FSF address to the website in the license text.
+
+libitm/ChangeLog:
+	PR libitm/69018
+	* testsuite/lib/libitm.exp (libitm_target_compile): Add
+	lang_include_flags and `-B${blddir}/${lang_library_paths}' to
+	additional_flags.
+	* testsuite/libitm.c++/c++.exp: Set lang_library_paths and lang_include=
_flags.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3Db129=
ff0880c6d10e0379b46889d01255ee8d1f82]
+
+Signed-off-by: Pietro Monteiro <pietro@sociotechnical.xyz>
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ libitm/testsuite/lib/libitm.exp     | 25 ++++++++++----
+ libitm/testsuite/libitm.c++/c++.exp | 67 +++++++++++++++++-------------=
-------
+ 2 files changed, 48 insertions(+), 44 deletions(-)
+
+diff --git a/libitm/testsuite/lib/libitm.exp b/libitm/testsuite/lib/libi=
tm.exp
+index 0b3301537cee..69a49906d338 100644
+--- a/libitm/testsuite/lib/libitm.exp
++++ b/libitm/testsuite/lib/libitm.exp
+@@ -9,8 +9,7 @@
+ # GNU General Public License for more details.
+ #
+ # You should have received a copy of the GNU General Public License
+-# along with this program; if not, write to the Free Software
+-# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1=
301, USA.
++# along with this program; if not, see <http://www.gnu.org/licenses/>.
+=20
+ # Damn dejagnu for not having proper library search paths for load_lib.
+ # We have to explicitly load everything that gcc-dg.exp wants to load.
+@@ -193,14 +192,24 @@ proc libitm_target_compile { source dest type opti=
ons } {
+     global gluefile wrap_flags
+     global ALWAYS_CFLAGS
+     global GCC_UNDER_TEST
+-    global lang_test_file
+-    global lang_library_path
++    global lang_library_paths
+     global lang_link_flags
++    global lang_include_flags
+=20
+-    if { [info exists lang_test_file] } {
+-	if { $blddir !=3D "" } {
++    if { [info exists lang_include_flags] } {
++	lappend options "additional_flags=3D${lang_include_flags}"
++    }
++
++    if { [info exists lang_library_paths] } {
++	foreach lang_library_path $lang_library_paths {
++	    # targets that use lib[...].a%s in their specs need a -B option
++	    # for uninstalled testing.
++	    lappend options "additional_flags=3D-B${blddir}/${lang_library_pat=
h}"
+ 	    lappend options "ldflags=3D-L${blddir}/${lang_library_path}"
+ 	}
++    }
++
++    if { [info exists lang_link_flags] } {
+ 	lappend options "ldflags=3D${lang_link_flags}"
+     }
+=20
+@@ -219,7 +228,9 @@ proc libitm_target_compile { source dest type option=
s } {
+ 	set options [concat "$ALWAYS_CFLAGS" $options]
+     }
+=20
+-    set options [dg-additional-files-options $options $source $dest $ty=
pe]
++    if { $source !=3D "" } {
++        set options [dg-additional-files-options $options $source $dest=
 $type]
++    }
+=20
+     set result [target_compile $source $dest $type $options]
+=20
+diff --git a/libitm/testsuite/libitm.c++/c++.exp b/libitm/testsuite/libi=
tm.c++/c++.exp
+index a1ce7ce4062e..90f3058e7249 100644
+--- a/libitm/testsuite/libitm.c++/c++.exp
++++ b/libitm/testsuite/libitm.c++/c++.exp
+@@ -11,8 +11,7 @@
+ # GNU General Public License for more details.
+ #
+ # You should have received a copy of the GNU General Public License
+-# along with this program; if not, write to the Free Software
+-# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1=
301, USA.
++# along with this program; if not, see <http://www.gnu.org/licenses/>.
+=20
+ load_lib libitm-dg.exp
+ load_gcc_lib gcc-dg.exp
+@@ -33,48 +32,42 @@ set blddir [lookfor_file [get_multilibs] libitm]
+=20
+=20
+ if { $blddir !=3D "" } {
+-    # Look for a static libstdc++ first.
+-    if [file exists "${blddir}/${lang_library_path}/libstdc++.a"] {
+-	set lang_test_file "${lang_library_path}/libstdc++.a"
+-	set lang_test_file_found 1
+-	# We may have a shared only build, so look for a shared libstdc++.
+-    } elseif [file exists "${blddir}/${lang_library_path}/libstdc++.${s=
hlib_ext}"] {
+-	set lang_test_file "${lang_library_path}/libstdc++.${shlib_ext}"
+-	set lang_test_file_found 1
+-    } else {
+-	puts "No libstdc++ library found, will not execute c++ tests"
++    if { ![file exists "${blddir}/${lang_library_path}/libstdc++.a"]
++	 && ![file exists "${blddir}/${lang_library_path}/libstdc++.${shlib_ex=
t}"] } {
++	verbose -log "No libstdc++ library found, will not execute c++ tests"
++	unset lang_library_path
++	return
+     }
+-} elseif { [info exists GXX_UNDER_TEST] } {
+-    set lang_test_file_found 1
+-    # Needs to exist for libitm.exp.
+-    set lang_test_file ""
++    lappend lang_library_paths ${lang_library_path}
++} elseif { ![info exists GXX_UNDER_TEST] } {
++    verbose -log "GXX_UNDER_TEST not defined, will not execute c++ test=
s"
++    return
++}
++
++# Gather a list of all tests.
++set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
++
++if { $blddir !=3D "" } {
++    set ld_library_path "$always_ld_library_path:${blddir}/${lang_libra=
ry_path}"
+ } else {
+-    puts "GXX_UNDER_TEST not defined, will not execute c++ tests"
++    set ld_library_path "$always_ld_library_path"
+ }
+=20
+-if { $lang_test_file_found } {
+-    # Gather a list of all tests.
+-    set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
++append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TEST]
++set_ld_library_path_env_vars
+=20
+-    set stdcxxadder ""
+-    if { $blddir !=3D "" } {
+-	set ld_library_path "$always_ld_library_path:${blddir}/${lang_library_=
path}"
+-	set stdcxxadder "-B ${blddir}/${lang_library_path}"
+-    } else {
+-	set ld_library_path "$always_ld_library_path"
+-    }
+-    append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TE=
ST]
+-    set_ld_library_path_env_vars
++set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
++if { [file exists $flags_file] } {
++    set lang_include_flags [exec sh $flags_file --build-includes]
++}
+=20
+-    set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
+-    if { [file exists $flags_file] } {
+-	set libstdcxx_includes [exec sh $flags_file --build-includes]
+-    } else {
+-	set libstdcxx_includes ""
+-    }
++# Main loop.
++dg-runtest $tests "" ""
+=20
+-    # Main loop.
+-    dg-runtest $tests $stdcxxadder $libstdcxx_includes
++if { $blddir !=3D "" } {
++    unset lang_include_flags
++    unset lang_library_path
++    unset lang_library_paths
+ }
+=20
+ # All done.
+--=20
+cgit=20
diff --git a/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-post=
ives-02.patch b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-p=
ostives-02.patch
new file mode 100644
index 0000000000..67ed47ff51
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0028-fix-gcc-libitm-false-postives-02=
.patch
@@ -0,0 +1,220 @@
+From 66ce317036f2eb5aeb96d5e4b9e468799d7566b6 Mon Sep 17 00:00:00 2001
+From: Pietro Monteiro <pietro@sociotechnical.xyz>
+Date: Wed, 11 Feb 2026 11:55:13 -0500
+Subject: libitm: Fix recent libitm testsuite regression [PR69018]
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The commit r16-7202-gb129ff0880c6d1 broke running libitm=E2=80=99s tests=
uite
+using combinations of options because it didn=E2=80=99t clean up all the
+global variables set in c++.exp.  Fix the regression by using g++ for
+the C++ tests and cleaning up the variables shared between C and C++
+tests.
+
+libitm/ChangeLog:
+	PR libitm/69018
+	* testsuite/lib/libitm.exp (libitm_init): Check
+	GXX_UNDER_TEST.  Add "${blddir}/.libs" to
+	always_ld_library_path if blddir is not empty.  Use
+	"-fdiagnostics-plain-output".  Don't set compiler to GCC_UNDER_TEST.
+	* testsuite/libitm.c++/c++.exp: If $blddir is not empty set
+	libstdc++_library_path, shlib_ext, lang_include_flags, add
+	"${blddir}/${lang_library_paths}" to ld_library_path.
+	Unset libstdc++_library_path and shlib_ext if we skip C++
+	tests and at the end of the test run.
+	* testsuite/libitm.c/c.exp: Update the FSF address to the
+	website in the license text. Unset lang_library_paths and
+	lang_include_flags.  Set the compiler to $GCC_UNDER_TEST.
+
+Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/patch/?id=3D66ce=
317036f2eb5aeb96d5e4b9e468799d7566b6]
+
+Co-authored-by: Jakub Jelinek  <jakub@redhat.com>
+Signed-off-by: Pietro Monteiro <pietro@sociotechnical.xyz>
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+---
+ libitm/testsuite/lib/libitm.exp     | 21 +++++++++++++++----
+ libitm/testsuite/libitm.c++/c++.exp | 42 ++++++++++++++----------------=
-------
+ libitm/testsuite/libitm.c/c.exp     | 14 ++++++-------
+ 3 files changed, 40 insertions(+), 37 deletions(-)
+
+diff --git a/libitm/testsuite/lib/libitm.exp b/libitm/testsuite/lib/libi=
tm.exp
+index 69a49906d338..2de0f6cbf158 100644
+--- a/libitm/testsuite/lib/libitm.exp
++++ b/libitm/testsuite/lib/libitm.exp
+@@ -79,7 +79,7 @@ proc libitm_init { args } {
+     global ALWAYS_CFLAGS
+     global CFLAGS
+     global TOOL_EXECUTABLE TOOL_OPTIONS
+-    global GCC_UNDER_TEST
++    global GCC_UNDER_TEST GXX_UNDER_TEST
+     global TESTING_IN_BUILD_TREE
+     global target_triplet
+     global always_ld_library_path
+@@ -97,6 +97,17 @@ proc libitm_init { args } {
+ 	} else {
+ 	    set GCC_UNDER_TEST "[find_gcc]"
+ 	}
++	# Only if we're guessing 'GCC_UNDER_TEST', we're also going to guess
++	# 'GXX_UNDER_TEST'
++	if ![info exists GXX_UNDER_TEST] then {
++	    if [info exists TOOL_EXECUTABLE] {
++		set GXX_UNDER_TEST $TOOL_EXECUTABLE
++	    } else {
++		set GXX_UNDER_TEST "[find_g++]"
++	    }
++	} else {
++	    error "GXX_UNDER_TEST set but not GCC_UNDER_TEST"
++	}
+     }
+=20
+     if ![info exists tmpdir] {
+@@ -119,7 +130,7 @@ proc libitm_init { args } {
+     }
+=20
+     # Compute what needs to be put into LD_LIBRARY_PATH
+-    set always_ld_library_path ".:${blddir}/.libs"
++    set always_ld_library_path "."
+=20
+     # Compute what needs to be added to the existing LD_LIBRARY_PATH.
+     if {$gccdir !=3D ""} {
+@@ -150,6 +161,8 @@ proc libitm_init { args } {
+ 	lappend ALWAYS_CFLAGS "additional_flags=3D-B${blddir}/"
+ 	lappend ALWAYS_CFLAGS "additional_flags=3D-I${blddir}"
+ 	lappend ALWAYS_CFLAGS "ldflags=3D-L${blddir}/.libs"
++
++	append always_ld_library_path ":${blddir}/.libs"
+     }
+     lappend ALWAYS_CFLAGS "additional_flags=3D-I${srcdir}/.."
+=20
+@@ -179,7 +192,8 @@ proc libitm_init { args } {
+     # Turn on transactional memory support.
+     lappend ALWAYS_CFLAGS "additional_flags=3D-fgnu-tm"
+=20
+-    lappend ALWAYS_CFLAGS "additional_flags=3D-fdiagnostics-color=3Dnev=
er"
++    # Disable caret, color, URL diagnostics
++    lappend ALWAYS_CFLAGS "additional_flags=3D-fdiagnostics-plain-outpu=
t"
+ }
+=20
+ #
+@@ -220,7 +234,6 @@ proc libitm_target_compile { source dest type option=
s } {
+=20
+     lappend options "additional_flags=3D[libio_include_flags]"
+     lappend options "timeout=3D[timeout_value]"
+-    lappend options "compiler=3D$GCC_UNDER_TEST"
+=20
+     set options [concat $libitm_compile_options $options]
+=20
+diff --git a/libitm/testsuite/libitm.c++/c++.exp b/libitm/testsuite/libi=
tm.c++/c++.exp
+index 90f3058e7249..c24dc830bcc5 100644
+--- a/libitm/testsuite/libitm.c++/c++.exp
++++ b/libitm/testsuite/libitm.c++/c++.exp
+@@ -16,39 +16,33 @@
+ load_lib libitm-dg.exp
+ load_gcc_lib gcc-dg.exp
+=20
+-global shlib_ext
+-
+-set shlib_ext [get_shlib_extension]
+-# The C++ tests should be linked with g++, which defaults to -shared-li=
bgcc.
+-# Doing that is currently too intrusive, so hardcode here.
+-set lang_link_flags "-shared-libgcc -lstdc++"
+-set lang_test_file_found 0
+-set lang_library_path "../libstdc++-v3/src/.libs"
+-
+-# Initialize dg.
+-dg-init
+-
+-set blddir [lookfor_file [get_multilibs] libitm]
+-
+-
+ if { $blddir !=3D "" } {
+-    if { ![file exists "${blddir}/${lang_library_path}/libstdc++.a"]
+-	 && ![file exists "${blddir}/${lang_library_path}/libstdc++.${shlib_ex=
t}"] } {
++    set libstdc++_library_path "../libstdc++-v3/src/.libs"
++    set shlib_ext [get_shlib_extension]
++    if { ![file exists "${blddir}/${libstdc++_library_path}/libstdc++.a=
"]
++	 && ![file exists "${blddir}/${libstdc++_library_path}/libstdc++.${shl=
ib_ext}"] } {
+ 	verbose -log "No libstdc++ library found, will not execute c++ tests"
+-	unset lang_library_path
++	unset libstdc++_library_path
++	unset shlib_ext
+ 	return
+     }
+-    lappend lang_library_paths ${lang_library_path}
++    lappend lang_library_paths ${libstdc++_library_path}
+ } elseif { ![info exists GXX_UNDER_TEST] } {
+     verbose -log "GXX_UNDER_TEST not defined, will not execute c++ test=
s"
+     return
+ }
+=20
++lappend ALWAYS_CFLAGS "compiler=3D$GXX_UNDER_TEST"
++
++# Initialize dg.
++dg-init
++
+ # Gather a list of all tests.
+ set tests [lsort [glob -nocomplain $srcdir/$subdir/*.C]]
+=20
+ if { $blddir !=3D "" } {
+-    set ld_library_path "$always_ld_library_path:${blddir}/${lang_libra=
ry_path}"
++    set lang_include_flags [exec sh ${blddir}/../libstdc++-v3/scripts/t=
estsuite_flags --build-includes]
++    set ld_library_path "$always_ld_library_path:${blddir}/${lang_libra=
ry_paths}"
+ } else {
+     set ld_library_path "$always_ld_library_path"
+ }
+@@ -56,18 +50,14 @@ if { $blddir !=3D "" } {
+ append ld_library_path [gcc-set-multilib-library-path $GCC_UNDER_TEST]
+ set_ld_library_path_env_vars
+=20
+-set flags_file "${blddir}/../libstdc++-v3/scripts/testsuite_flags"
+-if { [file exists $flags_file] } {
+-    set lang_include_flags [exec sh $flags_file --build-includes]
+-}
+-
+ # Main loop.
+ dg-runtest $tests "" ""
+=20
+ if { $blddir !=3D "" } {
+     unset lang_include_flags
+-    unset lang_library_path
++    unset libstdc++_library_path
+     unset lang_library_paths
++    unset shlib_ext
+ }
+=20
+ # All done.
+diff --git a/libitm/testsuite/libitm.c/c.exp b/libitm/testsuite/libitm.c=
/c.exp
+index daa71427d64c..7a697b870932 100644
+--- a/libitm/testsuite/libitm.c/c.exp
++++ b/libitm/testsuite/libitm.c/c.exp
+@@ -9,20 +9,20 @@
+ # GNU General Public License for more details.
+ #
+ # You should have received a copy of the GNU General Public License
+-# along with this program; if not, write to the Free Software
+-# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1=
301, USA.
++# along with this program; if not, see <http://www.gnu.org/licenses/>.
+=20
+-if [info exists lang_library_path] then {
+-    unset lang_library_path
+-    unset lang_link_flags
++if [info exists lang_library_paths] then {
++    unset lang_library_paths
+ }
+-if [info exists lang_test_file] then {
+-    unset lang_test_file
++if [info exists lang_include_flags] then {
++    unset lang_include_flags
+ }
+=20
+ load_lib libitm-dg.exp
+ load_gcc_lib gcc-dg.exp
+=20
++lappend ALWAYS_CFLAGS "compiler=3D$GCC_UNDER_TEST"
++
+ # If a testcase doesn't have special options, use these.
+ if ![info exists DEFAULT_CFLAGS] then {
+     set DEFAULT_CFLAGS "-O2"
+--=20
+cgit=20
--=20
2.49.0


