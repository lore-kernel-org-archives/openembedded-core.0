Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DABC71159
	for <webhook@archiver.kernel.org>; Thu, 19 Jun 2025 07:34:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9088.1750318471949537767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jun 2025 00:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8265c94ba1=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J4MMlw006840
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 07:34:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47c83x09w8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 07:34:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WIWbfP/A+n+Hb+tEiHLtpM6mPIUCqnHpZdkMjz6orqv5pzLnyeu7pxPT6zqWGjGBcY+SwFAe/cr0sOFdSM0FRBiG7A2KNP8EKlXq+kQP+zjs5U4KhxbHZNL6F+Oflu9kg8nSY2mb9Wz31Mlb3KZB+VYuaKFOQ/0WpbdV2hxETsKxm4Z0uRc2fYCipYr8UCmAzlc2L6gHuEALQLetnmA3E1pMaCYwE5cmX9IZIgoVPhrWFfBdQzoVw+FofFFr8Y3uyPS59ufJnZk7auoXUJXoaXDzzqbld9HOU232v65LO2D2dGOOBdiwaJSsU+QGFdJF17V1qyYSTY3p4oQlZFGdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhLfm1S3z0VqWk0RxX0IcLd+6Qfs4ky30icPhkFIzuU=;
 b=v6Vup1NHpYzTnozM7rCsbL+Sf49WuLceDOhZwxHXii+1Bd+J8zvySzrUyGL/eWJ0qIlIZ89G+360NOUKv2hXzMnXZUQxsMIU1T/cMkEUvld6gEaashWh5rmgOqr7VUufUwwJ+lxeJCT/MLSuwRdLHo0sIVFHehEAkTTnpW7wJC+uaORyr55tPDw+nf1xlCvjPNLOGQ/9cUgqvgxr1z884fBxC93Qw5+yWZK+Ws9tJXnUiFZpRgH5+0H5Ax0I+vxpKh6offdtq9IEGDIrBK2t41INhaqOv0F2j9kI5+ikOHb+tIPT1rqF5JUnUhKyTbJ5M7eojY4++/K2aR8GDmM6xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7623.namprd11.prod.outlook.com (2603:10b6:8:142::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 07:34:27 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 07:34:26 +0000
Message-ID: <9453b61f-4e0c-4736-81da-157c82d45051@windriver.com>
Date: Thu, 19 Jun 2025 13:04:20 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
Cc: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>,
        Randy MacLeod <randy.macleod@windriver.com>
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
Subject: rust: Enable Nightly Builds
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: PN4P287CA0106.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::6) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7623:EE_
X-MS-Office365-Filtering-Correlation-Id: eb646ab1-eb4a-430e-d1ff-08ddaf03b7a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q1BVWnVydzVYbUg4dlBoMWFRSEVOeEoxUCsvbnRNMEJXdTl6YVVKOStTclB3?=
 =?utf-8?B?Q2o0RmZibm5CYmFEdU5ZVU9pUlBrRzZjQ1RMRGpYSFo3K3NLemZEemVqQk80?=
 =?utf-8?B?R085WlVzUFFhMFhxK0tiRjVHZTRBclAxT3ZIS2xqMkVXKzd2Y3RCQ2c1endL?=
 =?utf-8?B?MGlOY2ZjTzJaWldKRlc1S0pPeUZHcUovdEk2Y3JjQmJlc3MraE5ZeUYzb3Qv?=
 =?utf-8?B?QldSckxQVkphbEZyMmlYdmgzdkM5OUxRcHEwZU1QejBwVmY3MTN0TXhqRU5k?=
 =?utf-8?B?NXRqTitXMlk4UXBYNWZ5N1YvK05CWFJlMmJqMXYyYndaUm5Uck1GaE1VaDFw?=
 =?utf-8?B?NjArUWRSRGI2TVIrYjl1SGNOZDJtbmx5Y3JPaTdsT0pmUTdzbTV1QkZWbzA4?=
 =?utf-8?B?dEw4TUF0RWZ6UjFGVU1XQVJNMjU2dm9Qc3ZhT2FDQUkzWDdHRkJEakVhbHJQ?=
 =?utf-8?B?V2Y0bE9hQ3JYQ3QxSjgyMk9UelpFQkZwVjNlUnFJN0VZOFprVGpoK2o5Uy96?=
 =?utf-8?B?QWZIUGdKcS9ER2VvZXRGSnFqdm4wQllQMWwyZ3FRUVNwbzQxQzE1YVE5SHZF?=
 =?utf-8?B?V3VKUisvMzd0cjlaa0NWUnQyMG01U1hzMXFzenllSlZwUGVuTnhFUlR0UVRJ?=
 =?utf-8?B?WFMwVUx4MVA0bEt3Mis5KzRZdkJxQnIwSHdIVFoxY0VQNVBNKzFTOEpoODRL?=
 =?utf-8?B?SmNVTUNMNnVTeHNuUmViQms3SmxHRE5KSmVzS0swVlZYMkNrbTBvbXl0dkd5?=
 =?utf-8?B?S0JmVUdTM3RSVXhZaER0WldWUEswRjViQmpFcTh3TklrMW1mbmkyYW9wMC9r?=
 =?utf-8?B?cDV1SjFMRFpJaHRRVldFZ2RkREFUTk1nZ0lxSGRHSFJ5Tk9Pem1CMlU0ckZu?=
 =?utf-8?B?elVSOXZOVXNFc1hWTHh4WFNMampCdFloV1BSa2IxRFlHclB3TWRVSGtXa1NJ?=
 =?utf-8?B?eFU1MHZ6WUVCMlZqcXpBYmJyeDZWSmNsNkl3NW5Ha1lzWE5hSHRZU1dqZFU0?=
 =?utf-8?B?SXVOQWZQa1BuR0xQL0pES1BpNXdBOFFtRk15eW9pbm0vMGRsQjFlM3Y1WXRB?=
 =?utf-8?B?NVlTWUNGaVFlNmdYaG9GdlNjcVk1Nzg5NzlxY2k0NTkxdHlraWxGT3BJR2xu?=
 =?utf-8?B?SFNYU1dvWlR6RWk4T2djQ1c2d3BtU0VoS3RnaHRWb3VUZEJqQmZFU0ZDb2o4?=
 =?utf-8?B?V1h0VTB4VXIwVlRqRVRQOEZlUFBFTmpRWTFESGRpcW5XdEtRU1F0Z3ZXVHZJ?=
 =?utf-8?B?MWIzWWsrdGQ4bWl3eGdnVG5LRmlsZjZSemxHZ2RoeXp2UmphY1duSWJKenpa?=
 =?utf-8?B?RUJBdm84RktscmdLRE8rcUVmSnp0VGhNbnVDTHkzV2VtbWxIemVSL09KcW5J?=
 =?utf-8?B?QVBvSndXK0lwOENNQkhDRmVrVWUyZitmU0twMG9uNVBhQ0kvTnlrVEk1S1Uz?=
 =?utf-8?B?SDRaTHltOEQxVkcxYXQyMkNkVXdKSlI3aU1pN1ZlSDFVY0srOThxN3NRMU5J?=
 =?utf-8?B?SklVc2dmUGtWOEdlMUxvL3Bzc3FWRXBnaWorMDhXNWlNdHYvVkcvYjYzWjky?=
 =?utf-8?B?TkFWdnYyaDk3SHd1NGI3Ymt1RGJMOUZSTXpiZjRZcGF5b1BSZS83ckFValQ3?=
 =?utf-8?B?cVdieU81SmNPSVlHTTdVeDNMakQ0RlZKR3pwY25QSTZpQWJ1ZXFKcXBNZWgy?=
 =?utf-8?B?KzhXY2E0VzZWTXBaS1RMREZlVFJCbDhnVVhQWHZOQWx3ZjJDUDNCQ3BSTHJv?=
 =?utf-8?B?djVFRmxQQlJYb3FCUllSMjRNdTY1dVZkTWVUSWZOOVJxNXYzY0dmY2hwdUdK?=
 =?utf-8?Q?xgS8QC2CtQGdaRQ7YTK5Vtalb1iDyFASshHL8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WnpvY3ArREdVZ2VYTFNhYVIzM1dRSjBWMFBRZHJ5WmdjNWIvUkppbW5zamV3?=
 =?utf-8?B?TDFqNVQrTXhCUXlGVkkrTnZzc1ZsaE9EZFNwa0tORFIrVnRvRTlIQllMenp6?=
 =?utf-8?B?bUdJblVzRHBGK0N5YXNHckRGS3BhSDdpR0cyakhEcWtoZkJBVW5LVXdIVFow?=
 =?utf-8?B?eThaejdDenIwSSt4ODQvVGdLVFlhTVZXS1pIVGZscFF5VlQveEVvZ216OEdR?=
 =?utf-8?B?dmFLTDIvTWV1R0VpWm96bVBBMkxoMGZxcVQzVlFUQTVKTUduMHdjYTBVV05n?=
 =?utf-8?B?NGpKT0Y4cndjK25KOCs4T2JTdkpKcytsUVppSFlzSi9Od0dmdDJDUGVObHl4?=
 =?utf-8?B?eVdVOXhobk0yd1I2ei9kZTNaZWIyeituNXlGejBFN2Y0dm1peWJpQm9UUGdh?=
 =?utf-8?B?ZktjR3pkMWozR1JXUDhweFk4MnljdEErYU9KTUVpc2E4TS8xWkdPckM4WlEv?=
 =?utf-8?B?dHpxVnF0UFl4YU1CNllZWUlkb3VyNmxYVzZPdjJVcmgxNU9CMlBIdXgvaEpy?=
 =?utf-8?B?MmN6Vm5CU052ZXNDeWlJMUtEdTZMWTE5aXhKWkhwYzNMQWMxRHVFNGwvUVZ0?=
 =?utf-8?B?SjJibHlqZ0JCQTNZY1VxNVJ6dzdrYUo3QURKaXJ2dTU4RFZwZE1EemdPbTc0?=
 =?utf-8?B?RERFQmJvNC9ERXhYMTdLdWpOZjdjSHRFalBxQzhCNnM4SGwvZzc0WTVjbGpy?=
 =?utf-8?B?YnJ2K3k2dG9YNHB4dEZmZS90cmZPWklCdENGd2U5ZmVEejBXTm9ibjVKc2V1?=
 =?utf-8?B?bE9kYUNtc0Rsa0Y0eW9lVXlzVzUxSGxZdnFFTFV4ejNFS0gzR2VGVDNVNDN2?=
 =?utf-8?B?VldnNVc3L2ZWVHgvS2tsWk9HeXZWVHZMU2NmMkl0aVErVjFvM2FkVStPSG5O?=
 =?utf-8?B?Q043Tks1RHhhUjB0YkVXdHNjUjBCQWV1VHZVV2V1MFB1MkdCNkVzOTh1Qm9C?=
 =?utf-8?B?U1ZqR2RQTGlsR0p5NFNidkR0ZXYwM3AxU0gwSnNlT292UGlMd0gxRUd2cVRC?=
 =?utf-8?B?N2s5aFhObmg0VFlmMmN3OUkrYUxucFJKT0gyN2lMQURhQzc4Tkk4amFOeWh5?=
 =?utf-8?B?SFF2VXVpK01YazRuUUVLTXgrdmJKNHdmKzJ1YlFpa2dkZmxmbUZRQkFYOGVl?=
 =?utf-8?B?MEg5OWUrbS8ydllPQWUrTjY3Y2FBbno5NE5pcUQ1VVhtVDBTaVA1Qm81WlNz?=
 =?utf-8?B?TWxEQUl0VENwaG9hdWJQYlNmaTF0L1VrcFFlc3lrTE01d3Z1bnRFWFJSQ0E1?=
 =?utf-8?B?OUFtM3JnVklObjVoaXdHNnNEcmxvcWMxZGZ2M3FPcUUzY24vaHhQazVCc3Nt?=
 =?utf-8?B?bkVmN0NTa2UrSWxGYk9mTmlmL0pFZXIyeVBqYzFaY2FYb1ZhTGltNTExZ2JK?=
 =?utf-8?B?aVNKT3dMREljMXZ5NGVWT3NPN1BQQnhhMHlJb1ljNWd5V1FCRVFuTTZ5M0hU?=
 =?utf-8?B?azVBQjhtNFFNMFpGZCtkM0pOQUc2bTRUUnZWalluTWFMRUViQ3hzSUsyZmYy?=
 =?utf-8?B?cGFkRW5DVVVuOWQ2L0FNRkVWVDFmbFFXeHZIb29TcERiQ0pGbUNHeHBqckNx?=
 =?utf-8?B?QzhnYTIvZlBQSFlxa0JiTHZ0c04yNW9Hd21aMkM4S0ROZ0lCQks0ZHdMclla?=
 =?utf-8?B?eXRwQnA1NnpDWG1YT3BZZ1RjaHhINjRXZjdEMlM5SXpNZDVMeEh4dmZRUGpC?=
 =?utf-8?B?ZmJOUDVxSFZ6VFdEZlZLRFdZVlgvNlBRcnBWT0RQUWc3VkcvcyszenAvK2xK?=
 =?utf-8?B?WmxpbFM4M003UnRIRm5QeFpkNFFoZnlKektXQzZCc2I0WWUyT2NEc09OQXRJ?=
 =?utf-8?B?WVNRU3BXUXQwS01wZm5oT25sNkRRS1dQL1JIUitCa3FWK1NJL3c1QllpRlI3?=
 =?utf-8?B?dGtuK256bXlia0Y1WFlIVDliQS9YTjFwVXdEamI0Z2lROGRaVUhEblBFYXdK?=
 =?utf-8?B?bUd3NDlDSHBCSU1KYzBDdDI0Y01Md2hmU1Y4R1pSeWtXaU9EcFJuRmtSVXU4?=
 =?utf-8?B?TytUTWdXcThsTEVvaFV0bHFQbHA3amx5ZW0zUFJLb0xXa0UzWDI4V1lEd3Rs?=
 =?utf-8?B?cTNIUDEzMW1Ja2pGbVVqZGp3SWVDUDhqRFQzMnhQelNERCtWV0Q1aUlmNmRj?=
 =?utf-8?B?WkEwVmVyWDhnV3JQaEZYTG1EZ3h1bnlIMXc2b2c2bXNUMDlSdnM0Tjk0d2hS?=
 =?utf-8?Q?TPu33AQu4D+43EHoCPlnm/k=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb646ab1-eb4a-430e-d1ff-08ddaf03b7a8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:34:26.1867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sB2X+t+F2P0E2raopty7ZQHJXn853ufSv06tKCD+Klt2m5xqawGhclvo5sWQQX09nAAlbEYUkc6q2hcWULd63VWAB4HXdNSH0i4b9DCAUca/G6tgLP4rP7IBY+AtjURF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7623
X-Proofpoint-GUID: lplpicnLeiXo8dHNQMJjPXi2-s8_dvf0
X-Authority-Analysis: v=2.4 cv=cuabk04i c=1 sm=1 tr=0 ts=6853bd86 cx=c_pps a=boViWsNs8mS/nAkvq5xF9g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=iGHA9ds3AAAA:8 a=y-3cmMlGHaL58pbegXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: lplpicnLeiXo8dHNQMJjPXi2-s8_dvf0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA2MiBTYWx0ZWRfX1QtkB4aCILrM gxh/mSE5ZomptD468EAzCaRytNOJ1q61XOdF75HftyydlpEebtjfRXD+uHw3j/ukilMaDeUo0Ig fD8SZZI079XlPzgmf6N28UM3g+R8x29lwZo+cHlOl1I1cFW9pKqHVdE/V1bunH1bNZ4lXS2+YTJ
 3y6PrPKMN9RI1y0gVlj1Yfv6WPtbPvrionsg9V4/xtlqCIxpPZsxST+WRIQ9mCr4jeWVBiTzJSn Jw5vlHzhy1BXG//J1iuBlsa1GjTgG6j88MJNCqyttoEUX4AMMj1sYn2GOeP9Bx42Ya7EMRfPFdj 0Z3om35tWMTlSmlC8n9DAe7KeaOcFZNXkW0YLgwQivdlgFy5dyfpX709uqDRitUTbFXdCXyJQvf
 cfSpq2xLCASxyuEQPbd2TNHfJngB5urOE6fhwiaymJ2juFjHSvTcRNqS1dnuALcLz7HjnhS1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxlogscore=737 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506190062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 55J4MMlw006840
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jun 2025 07:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219053

Hi All,

We=E2=80=99ve successfully integrated and built the Rust nightly toolchai=
n=20
within Yocto environment.
The rust, cargo, and nativesdk-rust builds are verified with latest=20
available nightly tarball (2025-06-16), and are working fine.

Changes/Patches:
1. disable-rustfmt-check.patch (skip the rustfmt check during builds)
- This check is mainly useful for upstream nightly contributions and=20
isn=E2=80=99t necessary for our use case. It also tries to fetch a rustfm=
t=20
tarball, which was breaking the build =E2=80=94 so we=E2=80=99ve disabled=
 it for now.

2. The rust_1.86.0.bb recipe is updated with stage1-tools copy to image=20
(as from 1.87 onwards the stage2-tools are no longer built as part of=20
the standard build process). This change can be merged with upcoming=20
1.87 upgrade.

3. The stage0 compiler used in the upstream Rust toolchain updates=20
roughly every 15=E2=80=9320 days.
- Current build is with 2025-05-26 stage0 compiler.
- Once a newer one is released, we=E2=80=99ll revalidate the build proces=
s with it.

TBD:
- Local patches haven=E2=80=99t been rebased yet
- Oe-selftest/repro is not yet tested
- Automation of build process (stage0 compiler updates and nightly tar=20
ball fetch)
These will be updated soon.

https://git.yoctoproject.org/poky-contrib/log/?h=3Dharish/rust-nightly

Regards,
Deepesh


