Return-Path: <Josiah.Metz@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969C6C98302
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 21:55:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.507.1790114101711048497
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 14:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=p57To88t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=372570324f=josiah.metz@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MLZtAe1025828
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 21:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XLsn0pvfVehqnFZ8VL9h
	yVAa3S97Q7NhucswhYnhIV8=; b=p57To88txJOD8k/k9lYvZKcdWlAtMb6iXTId
	3hG5IhJP4JnYG5dbIDgz/O5QjwqLbHyeM3wUbg8irx4jrmD04udUt5TvDNdS69zU
	y13b2dG+jDiLY7IjsEg987xbmsyuTjiXpNgBT4zOtB4GWUD3xgKsIEBFK7vC6wc1
	MPR5rvw6VfrXikhloXFL9KjnON0RM8ZxbaSqs53dpyPvDbxlY8lLdbPZHlch+wSp
	NLay9Vi9A0RhZLvu+Ozn4Ppq//Dd6nM6k0javrOcucILQaf+o2t6rHcEwxBM+Ldz
	KHool10bUurQFRmFoJBujfg4ODTNwE2xudrtZCAFt3s03xKSyQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023107.outbound.protection.outlook.com [40.93.201.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gup35hbtp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 21:55:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzBKFihKXxzPTC3FX6zT6Bym1i/Cg7rjcZ0GB0PQGOHc87XJswvsZWJ01yQN5YcfCSYasGtG6NYplHnnJcyDQRJimzrip1glNE9KMgir7OTHiTt40YFVFIrhUcowKOQjZnWix9yuEb6tvutxGm2ivLKsdpIlbkIrkAEDvVnhPZPsk3mdG9xXnWhTChiuKbL4x9q/wWUnChRThWK522+vvemAuNjUHT7vtnX3Dwp5zhC3cLOOPaYDkmgyUg7xlb53o6bsNeGq8PrAq77NJlpBVyWTnicoAsEftLhICPRP0wi8x+a8IUALMZbAyR8N64Qr2rrz9Vvw1yQJYJh6LKcZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLsn0pvfVehqnFZ8VL9hyVAa3S97Q7NhucswhYnhIV8=;
 b=C485igTr4aJRop3xFSx0m2kg/81jS07eWjyvOWCdpi+2vUzOz1HngMHDrj+jDdnd+A4YBqNkrK3vhrkUr+eAvN1fctmFXg3ELXbSmgnh01ekD59O0r5dpkRAG6bDTiNNMIDK7YW3ILPYWej+5GIGruPl8Tvsaj6NK9dvSGa7Mzw4JHUgkUtKossMKmvVoYhYtbKdjuXUe5pT+wLEjqYBMIseF569eoTQBLgWd+EaX86j6XMEmUFWZbUqD855KpUb8eO3j4PErBhjOXPGOFV03hve5nTU71NrXsSj0NBM75fKRScn69zOoQeBsXB1UcvUbVap0DMh2ZUtsVzZjfqJrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB7771.namprd11.prod.outlook.com (2603:10b6:610:125::6)
 by CO1PR11MB4804.namprd11.prod.outlook.com (2603:10b6:303:6f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Tue, 22 Sep
 2026 21:54:57 +0000
Received: from CH3PR11MB7771.namprd11.prod.outlook.com
 ([fe80::13f7:db4e:55fc:489e]) by CH3PR11MB7771.namprd11.prod.outlook.com
 ([fe80::13f7:db4e:55fc:489e%3]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 21:54:57 +0000
From: Josiah Metz <Josiah.Metz@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: Update maintainer for bash and libxml2
Date: Tue, 22 Sep 2026 14:54:38 -0700
Message-ID: <20260922215439.3402-1-Josiah.Metz@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: MW4PR04CA0284.namprd04.prod.outlook.com
 (2603:10b6:303:89::19) To CH3PR11MB7771.namprd11.prod.outlook.com
 (2603:10b6:610:125::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB7771:EE_|CO1PR11MB4804:EE_
X-MS-Office365-Filtering-Correlation-Id: 051aaa4e-9f7f-4f00-1074-08df18f4249c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|23010399003|1800799024|366016|38350700014|56012099006|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	rrLjoRfEUC0pTJkL/XDWTb02WpVwFY1/8m1yor4TA95XDOP+lxDfIxZl1bgSsOXeIOlZlCBOrvJBdBCJJPAVrmMh8bxpZJoCwtIz0eblFT3fJX3WZptdgmaYTljk1u97JYBUjRWiHVYCZ0fAJF7hT6YpP3D88fRw4q/Q76id3ivPsGe5MhZeToTBV0sm60NJjO288bdCtWZ88pedponG+Yo38Yhs0VQmDJbkAyHMxaCDNIcvuNUi3UU7CuYTJ1dcGiiCxSW/UVYVvV6nvOJCgVctpoUM3Of472+sFJB5xZOduSEo/vDJCH/yl7x2qeLfMrdd5jPdGZdIA6CNHMDpfmtRF+rYXkOqw+zN9nf6p78egDkFeGYjg0ZJSOMcYmu4bg04x19lGeTBjfL1imMsH0gS3rX/KZ/x8CHu7sz51PScbrZYyrgTEvMrghBCZHZcxQCLLNIB1jy+RjoWoUGYWQ8nVAsrbjb7JQXjSo5M8BhaHRGS5sFoFgIyS2P6wt7B/muj16E3nacwJ9yrxt+pLeWSrGzyPhX75o2fd2RibudHysu60skFWoUz3KYHqrGtmjG4frSa28pRJZyzxWo6RkAJ9lBvH/TgAFcWurS2/jbC/l1mki7MT1kSFx+YKZmcPFEO9RWMej0bhUINnp43IsV7jAtHgceq8zyFzU1MMJxGCXTVy/K1R9voOw66AE5cJqzP+hrFebZIcIVI0a9Eiz9kuqzjPa53OEwnvkdPkXE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(23010399003)(1800799024)(366016)(38350700014)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTV6NXBTS1RRNmtMeE5sRUR2NC9vZElLTmdFQlBPY1Bza0Z4ZmFoOFhFeTFi?=
 =?utf-8?B?NXNVNExNOEtyZndUeTlHbmhFZU14aGxLdm5tTnBXa096VEh5TzlZLzc5WEc5?=
 =?utf-8?B?ckFhVm80YXIxdW9Tc3dDZUxVNEcxL0YwL3hPL0NsbStMVFdSeUJFT2tCc1Qy?=
 =?utf-8?B?bHpsRExKc1krSHc2bXpKRWJUbDFjU3J5VDR2LzVzenUzUU9iSERCanQzKzNN?=
 =?utf-8?B?U1MxalRORFJtMDczN3c3d3ZYQzUzOWI1NWxiMWZ3UlNZY0s3dFpycDBkaUhr?=
 =?utf-8?B?RUJaOHhuQ3RjczNnN0laUGdtZjMrYSs4dEM0YWtqcllmTG5IQzkzNkl3d2px?=
 =?utf-8?B?K0JpSkF2S3lrM1pLUmtPTVgrM25ZUVgvNmhsd1lhNmhOSUF4allXS3prNUR3?=
 =?utf-8?B?SVFUcXJjb3VRVllTMjFkd1FMbmR2aFFFZWZCeXh2TC9NZ0VoQkFHT211aHVa?=
 =?utf-8?B?NUE0SnVyb0JLVytmaVJBSEFsR3pIcERjc2ZrTUlYb3RaU0ZtSjNQV3FDU29n?=
 =?utf-8?B?anNXcnAzc251NWJ2TkVWelhOWEVZdWJZWmxIRjNUbWgzZERzYU9WTDVjaUpX?=
 =?utf-8?B?K2NCeWZxaGZsSkovK1VTTGZFN0xJRWhyNE5RNThuZjJhTlo5NW1vaXBsYVZZ?=
 =?utf-8?B?YTJGZHI5ZzEwSzltbDVHbThhaVEzcjE5bkxMbWNLdmxlWVdWRFBsbE96c1c3?=
 =?utf-8?B?My9PRC9wV3hrRjJZS0dIVW1XdzFSdHZBM1BXUU02bVI5WlRhalZLZ2dhazJ0?=
 =?utf-8?B?Q1lPb252TGpDbjNMTk02UHpDMXExTjdER2Q0SVRxcitMSXBhK1ZOWTdyZ1h0?=
 =?utf-8?B?dHZ1RUcxS1l5Z0M5YW5zVE9Xb3ZIdE11amZlSUhXYmw4SFRhMlptaGZBOUNx?=
 =?utf-8?B?bGVvcjB6UVRHN0hPMjRmZEo3RllxS2xEZjRBVHVzRVloYWlhS1ptUzJJOUZw?=
 =?utf-8?B?MjBlNUYwYWFRMHdObFFTS3l4MnY3RlYxQjQxNWtqU1p4OWRqUU8vRml0ZUdo?=
 =?utf-8?B?bzJaK3F3M1QvbHIzTXgzV3BtSmYxT2VpUS94cUE3dVFEUVVOZVpKWGI4UFNE?=
 =?utf-8?B?Z0NBaHZpK1JCSm1peGNVNHU2QlBBYlJ2Rk1NNVBONlFoNmpnZHZSNkdoMG9n?=
 =?utf-8?B?YnRRMHpOTmFvcDVHTUhkTnNqcWs4TnlUcUhBVTA4ZndtcVVNUGFqbzM3aGo5?=
 =?utf-8?B?ck5ndys0T2xuOWZrb0lLakxqT0F0SUFJdmJWWHJjSkRvR1AyY21xYS9helA2?=
 =?utf-8?B?SWZ5cDh0MWlZcnQvSXQ0ZldiQW9YSEFlWjNuVlgxelNVdzhqaThWaFZ3VUJJ?=
 =?utf-8?B?YndVczV1SDZGNVRKNWZOK01DYzdKcjV4a0d1Zi9Wd2pSZVo0c0wrODg1dnV1?=
 =?utf-8?B?TGJwTnA5SFNCWks5aVJRU1REMGRqY2pXWTR6NXJIN2Iwc2hKOWYwZEpoTDJZ?=
 =?utf-8?B?LzF0U3dXYU5pcHoxMTBxL2tIM3prb05OTHdtSUEyMWZrUFZHTmQ5cWlNSThC?=
 =?utf-8?B?aFowbENqblMwdmhENzhxNlFBMHJJTFNsaUxOdkNCMlg0NklsS2RmeG0yN3NG?=
 =?utf-8?B?K24xS3lHTlN4dGtxamI0YlY4WkkvUzhsSmxFd1dDN0pHMHFjdWo5bWpyYWhp?=
 =?utf-8?B?WU92cUl4TmtocVBmbVdTVThRZldMS01keDhhNUxIbnlGUXBocDBwT2dvRW51?=
 =?utf-8?B?dnhhbHlkRzkyQkNaV1FrZXl0TGRGekdRZ09nOUk2MzdTOUkxVHIxNjRLSnN6?=
 =?utf-8?B?SWREWmZTOE9SZWQxN0NxMFYyZG1IdzJvc3REZCtJSFozRUlDTEdxcC9rVnFu?=
 =?utf-8?B?MGpjUTFyeG1WNzNwWGl5R2d5QndRV1QzNExZcUNtRlIzQTNFWDJqcEQ5Zm1r?=
 =?utf-8?B?RzJjZnlCNWlsSHpYdy9uQ1htWUFORzlXNlJ5cmFOSUNsSS9NdEtZdUJMOHJM?=
 =?utf-8?B?Tmc0dEl2TWc0MmQrcVpTQmkxdi90b1ZoRGdmV1dmTjR6TXlERHpiTFg2YjZI?=
 =?utf-8?B?QzMzd0grZEpJdWdsWFNieHJoNHd4a1JxamhTVVIrYkRuR25ZQjNpaXNCWldS?=
 =?utf-8?B?a3FVVHp5M1p4VzVlN0p5eTIyY2I4VERBaGY4cnBzWTN1UFJIbE4vL3ltV011?=
 =?utf-8?B?L2FrZ0dZRW8vSytGdjBGbmZtL1JLbDR6V1BLcDNwWlAyVmtybXZOTmFEa25m?=
 =?utf-8?B?QmdldHRCUzFqcmhhSnJqU2JmM1hxbWZXWTEvWVpaWVNHdytldC9Dc1RpcHY2?=
 =?utf-8?B?OUgvd24xdy9VR2VGVWxuQWZjWXZUUVlmTTkzcmJRaVVUZ1oyY3FkNEtUMVZr?=
 =?utf-8?B?NVFWZW4va0V4YXZFOElPMG4xSkZTbDZrTkxLR1o0S2FiR1QzTVFWYzVUeEFB?=
 =?utf-8?Q?gQY/kHTebz0ueIQs=3D?=
X-Exchange-RoutingPolicyChecked: 
	b7/F0xokH2pcctVDR6PBPQHUemhV/qii/i6w6WzmaKxAViQMK8KJnhCoc/NSSXwA+05DZASKbqW9S55myM7nnaLLGFwsHed2f07u9TkhgldlT7buH18ktjIAThzKtxl9NoqEJen5qLXClqAeKuuOj0NWd72sULTjxtHthW27rc1JtqJL1Rkak5t4piTtLDtqdirBIqZSwMRkon+0fsBnVEAGcY2OleiFbLDVDbwYO668S5nwNKOvwbMpd3nrX6HSdTwBRZqNlOdCfcskRpT2Q3wHafgiAloUZbAwofVCfO1d5OFhuNsO/b5cAHSMUGciUelDZyxn81qff2DPoBNZgQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051aaa4e-9f7f-4f00-1074-08df18f4249c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 21:54:57.6673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XdwPsuGy4sifzXGDJcNhyOGMFyuHSnEb0sXaaSLVaHb/FxuVsoETKLw5ZgUT1ofDIk5Hz5lAUCacUrxdDQ5SKN2azeq//5sU4DA5ZN9Q4v0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4804
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwMCBTYWx0ZWRfX/WNnCA6oJvLe
 /PtN7CRUMBTKM7X/e2hn//ggnbIe54XSe8E5sImSKV3IQrnekLIgDh40sQORLrTDxlXPiKf/bRH
 W7Sa4/0y3w/QqsSXB7SOlw/9tgJ56lbexFkd1kF7lwgihoJzUQQv
X-Proofpoint-ORIG-GUID: _YGxaRLjjvR-4wwS3bY117EsL86weJHt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwMCBTYWx0ZWRfX+gMudHdQm05n
 Xt6dR7s8prDwc7QllDYMsqpyIlXh/lKd5wIT8XZ8zwdVN2FFkt+Q3wR7x137KFw+IG4xJvssDXE
 vTiypcriG5hFkzPM6OB027LtB45jZExNknIrpMKAAFKfGlV8Y6K+mSCE0kL7FjBmb7JNkxbgkQo
 Dygin3DlcaqkbzQRB17XojnK3bRPcK7rWor/bkjPkPRf2/xsUcfhejofNF03VzVYoE+JzMmOcXA
 wKWEALenZ1FrkKzTQaOH7X+TyraWCMBMMpiMBksw4ZEgmjov167QJs1XXVB97stoYf4kFmqNfv3
 TX2vj/QfAFDcCyq9EwOQHda7j0NJUC7dSkr0bsPqBwP0SSC7rX5kJYq6k0beri+TrIBJmdsp1gu
 w/UOLX6vgHBL7wuKLSvqK4zSHH7seSkhk+1eIiqGc0bIXj7UVorSi2Cfbf9BB+Z4Lkh8AeabHf5
 D7OyUubrfswknT5cROQ==
X-Proofpoint-GUID: _YGxaRLjjvR-4wwS3bY117EsL86weJHt
X-Authority-Analysis: v=2.4 cv=DKMacCNb c=1 sm=1 tr=0 ts=6ab2f934 cx=c_pps
 a=hPX4sJ9ttNblXMIvR1KFjw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=zjtiufAZAAAA:8 a=iGHA9ds3AAAA:8 a=k-42gJp3AAAA:8
 a=4bgQfJ5CML_7YrMEUFIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22 a=2tRhtM0yMehlNRDZlsEQ:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220300
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 68MLZtAe1025828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 21:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246429

Volunteer to maintain the following packages:
- bash
- libxml2

Signed-off-by: Josiah Metz <Josiah.Metz@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index c273d2d754..da39bccc60 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -60,7 +60,7 @@ RECIPE_MAINTAINER:pn-barebox-tools =3D "Enrico J=C3=B6r=
ns <yocto@pengutronix.de>"
 RECIPE_MAINTAINER:pn-baremetal-helloworld =3D "Alejandro Hernandez <alej=
andro@enedino.org>"
 RECIPE_MAINTAINER:pn-base-files =3D "Unassigned <unassigned@yoctoproject=
.org>"
 RECIPE_MAINTAINER:pn-base-passwd =3D "Unassigned <unassigned@yoctoprojec=
t.org>"
-RECIPE_MAINTAINER:pn-bash =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-bash =3D "Josiah Metz <josiah.metz@windriver.com>"
 RECIPE_MAINTAINER:pn-bash-completion =3D "Unassigned <unassigned@yoctopr=
oject.org>"
 RECIPE_MAINTAINER:pn-bc =3D "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-bind =3D "Unassigned <unassigned@yoctoproject.org>"
@@ -454,7 +454,7 @@ RECIPE_MAINTAINER:pn-libxml-perl =3D "Tim Orling <tim=
.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libxml-sax-base-perl =3D "Tim Orling <tim.orling@ko=
nsulko.com>"
 RECIPE_MAINTAINER:pn-libxml-sax-perl =3D "Tim Orling <tim.orling@konsulk=
o.com>"
 RECIPE_MAINTAINER:pn-libxml-simple-perl =3D "Tim Orling <tim.orling@kons=
ulko.com>"
-RECIPE_MAINTAINER:pn-libxml2 =3D "Hongxu Jia <hongxu.jia@windriver.com>"
+RECIPE_MAINTAINER:pn-libxml2 =3D "Josiah Metz <josiah.metz@windriver.com=
>"
 RECIPE_MAINTAINER:pn-libxmlb =3D "Markus Volk <f_l_k@t-online.de>"
 RECIPE_MAINTAINER:pn-libxmu =3D "Unassigned <unassigned@yoctoproject.org=
>"
 RECIPE_MAINTAINER:pn-libxpm =3D "Unassigned <unassigned@yoctoproject.org=
>"
--=20
2.43.0


