Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73180C021BE
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 01:53:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1717.1740534833410645000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 17:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4152f675bd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1aN3c024897
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 17:53:53 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmg63f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 17:53:52 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q1rqgv016621;
	Tue, 25 Feb 2025 17:53:52 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2046.outbound.protection.outlook.com [104.47.51.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 451ptmg63e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 17:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ih6gofNpaHE3C8f95SIC8oUCgBuO9g/veS1kBxNdK4v5iTK7UYV/fyjkvTZ08+GRUxRuKoHiUHP1I9mhjyy9tLhmxPUGc971H5TJNLjXUsqTKRIDHV8/LNpaYq3Sa4OnLMvjsG5a+skOqUiCmlu0ddTj98tT1NztFEAI+Myb/mX4PWDrGvYYdbh6ZkV1LEhrks/O3JNJNSekRQUUYEkajMoNPhuK2H51MPBnR/0VHHdkA3aMkSjEmLzpF87xjDFwc62CoD2Sk82vTk52bHztcyniNSGcqGn/Q1yKxn2FMLBixr1rn3c3VMguzC4jRyJ9MwGq4p0bVcj9/nH/nMxK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uBm9wN9G813sBtiMS0xOl+i5Xh/xGuqElm+Zs/vRng=;
 b=UIOLPNRNl2XMV93LAM0RfrFif9AecQlo7nPS2Otjc9H6YAPOwkd5OktNTddztunIFwPHIoF+e9lhFsTqGXht+B9/McWRKK0eMywesSPY2LdnaXqvamIu6qodmJ57q0o2SIIYFDOMJ7UFjnxF7pC08GRXMcQThyycKdARVE5p4vrvkxa0pFP0Rk+t03IGWLc5FEAtR14BbmEHVe+NVlscemPTRUiNqE58d54m/w9k9ILQNmeh/wcpt6P37N50OrHadN8PyGaTtFIkYO39WXwKP2+YzU9g1OfNQIi8Tv8zLPICvjFrm1hKjLn2tQOdHB7f4lTOEz0cRTp5zSPdgwwqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:53:47 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 01:53:47 +0000
Content-Type: multipart/alternative;
 boundary="------------WIb6hfUw4O3ClFn35FV3E5jI"
Message-ID: <d575af06-e1c6-4f3b-9490-0ae39460826a@windriver.com>
Date: Wed, 26 Feb 2025 09:53:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] nfs-utils: fix rpc.statd path in initscript
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250225070341.2349532-1-yi.zhao@windriver.com>
 <CAMKF1srHd0gM2ewCUaRm-LS54kxWyyFS9B9yTVPvok-NM=n1eA@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CAMKF1srHd0gM2ewCUaRm-LS54kxWyyFS9B9yTVPvok-NM=n1eA@mail.gmail.com>
X-ClientProxiedBy: TYAPR03CA0021.apcprd03.prod.outlook.com
 (2603:1096:404:14::33) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ce9e772-7037-4416-9443-08dd560868c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ODZwTmFuSkFLRmc2TFRuWHMzejVNdEJTYkZGUVRpWVVNc2hCdEtjSSswK2Nn?=
 =?utf-8?B?cHRCVTFjd0l3VEwyeHdVcVpKV0JaaC84bC92THJBTWFjNWFYd3NUYUE0dGRl?=
 =?utf-8?B?UkFGcVQ5aFNtSFp1cVF5V0pCV3dhaW9ITVE0eXNPNXhsM1J4Mmc2OHVPREY2?=
 =?utf-8?B?NmVwNmIvdkVuSGdZeVdVQ1RidkdtZWlBaS9aVTZCdUErSGo0SEw0UDJ3Mm5V?=
 =?utf-8?B?UHZZVFNHaVlTNHljR3VPdmtodWN1ejhxMENhdDk2Y29TTTFSKy93SE9NRXBD?=
 =?utf-8?B?S2o3eFZHWTltVC9sR29NVnBIM2FhU0hlRW8yaU1XN0NwQjMvM2w4ZEZlN3FF?=
 =?utf-8?B?akl0dFZtT2FlTTV6ck5ZWmt0UWFNWEZoekdXOWtBdG9wUzJlS3cwalA2aUIw?=
 =?utf-8?B?Mlc0SEs3MUR5eE5ZMThZSnhzQjlmUTFUMVhJMm4vWEhXTmNicUVSdW94WHVq?=
 =?utf-8?B?anBSVUdmZWdzT1ovVmVYbjhsV2JmWjFUK0ZBMFlrdmZmejVrL2hOcTdCNTN2?=
 =?utf-8?B?VlQrUFdkRldVSmhzallpYVBweWRJUm1QSjh0c2RmSzJqcFI2ZE51emVSS2c3?=
 =?utf-8?B?dTFhQlcrQ0lNK1VkVkE5NjZiZU9reXVFN29naGQ0Z0krZWF1Mllud2g5RjVl?=
 =?utf-8?B?NXByRnlDWUZyZkVzbzY2TzlWTWVKajJYaWk5Z0FKbjFrVXVaZzg4U2tib3dv?=
 =?utf-8?B?RjdteXI2ektqcU5ZS1ltQjUvNEw5NzJzZjkzT29VUzQ0SlZOMkdRTkFLcVFK?=
 =?utf-8?B?TUN2RFFsdGxRL29SWnYxN3NseXlSRGJKY0VTVmhyNEJ3SGhRNUFYcTUycjNG?=
 =?utf-8?B?blBJK3ZmdFR0am84clBtd1hNeVpVc202Mm54QjUwbG53TDV0cDFONGxxcVBu?=
 =?utf-8?B?cFQyR0tSUDFaSS95dHFaTXZHTmpTcStjcVVwUTl2ejZTZnBPTkZWSTNuS0du?=
 =?utf-8?B?UERKZk03Tm5XYkY5aklpQ0JHUFhxS1lqeVRwR1dxV1JLRzA4dDJrdW9PeHBj?=
 =?utf-8?B?VURZVnBRL0NLQXdMeDRBVkkvQlhkbTNTS3Jzc3ROUjJ3WThGN0RTWGdoNG4v?=
 =?utf-8?B?b1RBVWo5aDk5ZmlCTS9STHdoRkZqV0pNLzhBMmJpN2lJQ0lZdUFSdzBUYkRt?=
 =?utf-8?B?Nlh0dzFZQ0R3Y1NXMmU3eFVtRVN2RHA3OWZYZThSUzV5M0JTdjJXY3ZCYlpu?=
 =?utf-8?B?dDB5ZUcxQldhdFh0bHFTLzhlenJiTHI0NUc5ZmRMOEtibklzTXcvRnk1YXo3?=
 =?utf-8?B?VXYwWmFlQi9GNFRBdXhyMDZoVis3eFZVdEx2SjJyamlka2NUL05GTGdzYllC?=
 =?utf-8?B?OXhna3FrVDF1cnJLZllKVGVvbEMrRGU0NG9iUkdac3BYdlo2TnVmUGNWQVJJ?=
 =?utf-8?B?ZHJsWENieFVwcGZJMXdQcDVjRUNObXE1bWYremNBSEdkMGQwMlZlU1pGb2tl?=
 =?utf-8?B?aTVDNGk4L2J2OVVaU0JmRVozWUNMeC9xTzJZQ2tIY1VlWlY4QmFTd05jMzdw?=
 =?utf-8?B?RFEzOC9FU0IwenVoSjhUN3RCcGtwWFNmd0ZiL09jbTJDcnJyaWg0QlZ2Z3lS?=
 =?utf-8?B?NDNqRGgzbytwRFVrMEJhYzNPUmh4L01FanlJZnRxN1hqc052N3dVT0p3TnNO?=
 =?utf-8?B?VXdLTUtWRUdCMjcwb1JLK0syYnRrVGdSOFhHR0V2SHNySW9HK0h2TUtHdEZE?=
 =?utf-8?B?Wks3OVlPSzhqRHNNOU9SVTc5eWJxTExwQjltdUpMQVNsL1lrMkpPam53Y0RD?=
 =?utf-8?B?YmFjUndpeUFBYTZUN08raTFJY1E2VFBpUW9HNkpUMFhPNjBMZ3ErMkxpU01V?=
 =?utf-8?B?NmhSR3pYbnFZVUVKUEhtdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eVk0aGxZVFJjRFl5VUNsQXk4QlRmUC8vSkFsMFNHWURrNlVwR2J6WnQ1Mk1V?=
 =?utf-8?B?aUZvOUw1STZUaVpTNXZGcDBIdFZucWFPOWVqd09MREkzWFUveGNNcHIzVjl2?=
 =?utf-8?B?eFF3MnpoeHJPVHlWbW9naU5iaWpHbHpMcFpNSHo4ckIrYVc5WEE0QStoUVJQ?=
 =?utf-8?B?RExIVWI0WC9La0p3aVRmK2NBRXRNcGNEL0c3aWFwWUx4Z0NnUzV6N2dNZFJs?=
 =?utf-8?B?YVhvdmVDcDY0WVRpRHd6dG1aWXV5Rlk2WU9YZDdidmg3dTRxWW5IbkYxR1Vj?=
 =?utf-8?B?bEtrajBka2dBVW9EbHVZdU1yQjlIYjVHYlB6U1VJb00wR0hhdnZObURxM2tT?=
 =?utf-8?B?RERjWUpRZ051VG5Za0t0TG1mNU01QU5EYnp4VGJDdnpnVllER2N1V2srM3cy?=
 =?utf-8?B?MmRUT0dXZmdLWk40RDk4MmRKbHM4UEVGQXhuMlkxaVo0S2ZDN25CNVFUc240?=
 =?utf-8?B?UEFrQzRoeHVydmZ2aHkzRmJRTG9jZ2hsak5ZME5OeUF3VXR3RUEwNkN2bGx6?=
 =?utf-8?B?UWhmUXlRb041WURqMkNIbHljV2pSS0RKRHJOVE14YXZlblFETjV0UWJmYlJl?=
 =?utf-8?B?dlBDTlZ2VGlwZEo2Y0YwRmZYeG9jTGkvY1VtM0Q0N3QrRUtabU9XMHNnR1VZ?=
 =?utf-8?B?dk1nZDI1M29ta1djUTFoT1Z6SWFxcU9iYmJQaXFGckZHbjR3bUNXYWhqTFVE?=
 =?utf-8?B?SmhGZURDdzFSZzZLeUhLRmVXSFo0SmN0OE9WaEt1RWlMcXRHRzRRaDZXNUk1?=
 =?utf-8?B?WGYvZ3dSd2tHaVRHNERvTmxSVWlnVWZFMFRDYmRTZE5CWnluWThPcU5JVkpM?=
 =?utf-8?B?WW94TWdCTTRkd0VnS2tiejBKTTlLYUFIZlg3dW9RN1RLQnBLSjFRVC9hNER0?=
 =?utf-8?B?cW1MNEhNSGwxeUV4NE14SEZLcnR6Qzh4NVFVVkloa1ZHSTZCTklvSkRJb094?=
 =?utf-8?B?M2NFZzZVeXN0dERwdmZLY1Rab2lEa0Mxb0dPMFBQSzFNbnVnY0NZS0ZzR3FN?=
 =?utf-8?B?eHdWY2ZiRU05cEFZeHhiWFFTUFkrQjhsbThnaGhKaUo1dXo0RWJVWGxNMjE2?=
 =?utf-8?B?MWJPdkk4M3VlRFRuSC9STWd5ZlNZVmVQYUhYc01aSGZ4TFJhb3I5WmRKZm9C?=
 =?utf-8?B?M0RFQVJjY2xONG1mNUZ2eUVGTy9IVTBhdGN2bUxyM0pzM1c0TUFuSC9wczFW?=
 =?utf-8?B?UHJjTUdNSHczeHBtVjdXZHkvbWYrNElRbUZ4aEZiNUhnVVpxNTZNUHFER2NR?=
 =?utf-8?B?Q0tlTmFReXc0N2paT0JmMk1LVFFtNUNHVW03WVIvVmJNVXdiZE1WMHFBQ05k?=
 =?utf-8?B?dk8xN2NqK1psT0s1SEJ2Uk1Ya0ptWFlnNEZxamVudENxalcrMjc4aHBTMUha?=
 =?utf-8?B?Q3VZZEJVbVRqcGEvaXZyWHR5NU9jSkJPOG9ZMFIyNmFSeWQvbGdlU3Z5THZF?=
 =?utf-8?B?a20yU0xaZTdaK1NJcmZ5UlBUdUJUYUxmQ21JWCtZaVhLRkNQOWM1aU41Wi9X?=
 =?utf-8?B?TlVRTStXMFplS1J1VVFRc3Z5UTFjYlExajRmWE9UZWNzbmYwNUtaTXZNYzZu?=
 =?utf-8?B?RkRmRGR6VDhaeW9DY3ByVWxJbnliRWg4d0FUdGUrNEhzbFhJa1FIT1V6RVVO?=
 =?utf-8?B?ZjdNcjFVaUV5VU9LTlByTGxKT1JuU2lCZkRRcisxZzE2K2ZrTzJ0d0paSXBn?=
 =?utf-8?B?dEloN1UyQWdNS0JUOFBmbmJaRFlkcVUwQlhqSXE2SVdCcm56SlhCY1lZSUZR?=
 =?utf-8?B?R1Rqakc1M1NJd29hRnA1bjVreGVKcmUxYkx4RDQyTlpnMUxTSSt6K0VZOU4v?=
 =?utf-8?B?azA3NnNpQWduYVhlUlBBYkFEQTAyYlllOXdLU1FxL05mcktobmZSQUs1TFBt?=
 =?utf-8?B?dEZiOU1QL0pDakxNR0lJa0RLZk1YQjZ6b2l1NzUvcW01QUtyZkxmN0NQN0Ey?=
 =?utf-8?B?dVZsWEFuTm5EOTFiTFdsTFBmSjhKS0l6QTZZTm9VWEQ1UEcrWHlrdkxiNE1h?=
 =?utf-8?B?Unc3YjJIWnZySnJuRWlvQWVkbVQvYndKTDNlZTZPcjhaa1J3c0lOMTZoQmFj?=
 =?utf-8?B?R1BSZ1YzUmhwZkFGSUwrZzRkcmU0MEM1SVhUNXNZdTBVd3Qva2NWUTB3UFhu?=
 =?utf-8?Q?eSm5oGHG87zkZFbgeBxmQB0IT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce9e772-7037-4416-9443-08dd560868c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:53:47.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cch637JG7uTIseiGrnPke6NOApNleQ3faS4j4GPq0ThFYpBWkieBIEOAACPnYsuvIe/RIOu8+SiCQZ5PSCMnPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
X-Proofpoint-GUID: SD-kHR8dhOTDNf0U9d9AlWL-bMA6ZS51
X-Authority-Analysis: v=2.4 cv=TuEchCXh c=1 sm=1 tr=0 ts=67be7430 cx=c_pps a=yfraj20uO1EtZH+TM7jpHA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8 a=dC85szaLAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=q1JUjiKevGDtpQ-QFD0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1I-ZrYB1lfJ3fBJlN3cA:9 a=FnZP6ZAWNyNUoX9U:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=JrEX2m5K7q955dSQjKLa:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KkYVlDtGcdbpSm4akfm5IUROQUXwW-sF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_07,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502260012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 01:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211938

--------------WIb6hfUw4O3ClFn35FV3E5jI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51Q1aN3c024897


On 2/26/25 01:19, Khem Raj wrote:
>
>
> On Mon, Feb 24, 2025 at 11:04=E2=80=AFPM Yi Zhao via lists.openembedded=
.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!YQpIhAuDuk9NODS4b584fgo2EjPOozFOsEHYqDnGZgh-d00DSYJWaXxc7JWZbumpVZQ2D=
10tDepFo3CAt-Y50g$>=20
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>
>     The location of rpc.statd is /usr/sbin instead of /sbin.
>
>     Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>     ---
>     =C2=A0meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon | 2 +=
-
>     =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git
>     a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
>     b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
>     index 6c7b92bdb1..9b7fd17b41 100644
>     --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
>     +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
>     @@ -137,7 +137,7 @@ case "$1" in
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start-stop-daemon --start=
 --oknodo --quiet \
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --pidfile /=
run/rpc.statd.pid
>     <https://urldefense.com/v3/__http://rpc.statd.pid__;!!AjveYdw8EvQ!Y=
QpIhAuDuk9NODS4b584fgo2EjPOozFOsEHYqDnGZgh-d00DSYJWaXxc7JWZbumpVZQ2D10tDe=
pFo3AoB5EA6A$>
>     \
>     -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--exec /sbi=
n/rpc.statd
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--exec /usr=
/sbin/rpc.statd
>
>
> Is this always the case or depends upon usrmerge distro feature


This is always the case, because even without usrmerge feature, the=20
default location for rpc.statd is in /usr/sbin.


//Yi


>
>
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RET=3D$?
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ $RET !=3D 0 ]; then
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo " fail=
ed" $RET
>     --=20
>     2.25.1
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#211865):
>     https://lists.openembedded.org/g/openembedded-core/message/211865
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/211865__;!!AjveYdw8EvQ!YQpIhAuDuk9NODS4b584fgo2EjPOo=
zFOsEHYqDnGZgh-d00DSYJWaXxc7JWZbumpVZQ2D10tDepFo3DaAZ3vDg$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/111373723/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1113=
73723/1997914__;!!AjveYdw8EvQ!YQpIhAuDuk9NODS4b584fgo2EjPOozFOsEHYqDnGZgh=
-d00DSYJWaXxc7JWZbumpVZQ2D10tDepFo3Brq87FwA$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!YQpIhAuDuk9NODS4b584fgo2EjPOozFOsEHYqD=
nGZgh-d00DSYJWaXxc7JWZbumpVZQ2D10tDepFo3BUHuBdgg$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------WIb6hfUw4O3ClFn35FV3E5jI
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51Q1aN3c024897

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/26/25 01:19, Khem Raj wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srHd0gM2ewCUaRm-LS54kxWyy=
FS9B9yTVPvok-NM=3Dn1eA@mail.gmail.com">
     =20
      <div><br>
      </div>
      <div><br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 24, 2025 at
            11:04=E2=80=AFPM Yi Zhao via <a href=3D"https://urldefense.co=
m/v3/__http://lists.openembedded.org__;!!AjveYdw8EvQ!YQpIhAuDuk9NODS4b584=
fgo2EjPOozFOsEHYqDnGZgh-d00DSYJWaXxc7JWZbumpVZQ2D10tDepFo3CAt-Y50g$" moz-=
do-not-send=3D"true">lists.openembedded.org</a>
            &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lists.opene=
mbedded.org" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">eng=
.windriver.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">The
            location of rpc.statd is /usr/sbin instead of /sbin.<br>
            <br>
            Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windrive=
r.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">yi.zhao@windriver.com</a>&gt;<br>
            ---<br>
            &nbsp;meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon=
 | 2
            +-<br>
            &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
            <br>
            diff --git
            a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon
            b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
            index 6c7b92bdb1..9b7fd17b41 100644<br>
            ---
            a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
            +++
            b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfscommon<br>
            @@ -137,7 +137,7 @@ case &quot;$1&quot; in<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fi<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; start-stop-daemon -=
-start --oknodo --quiet \<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; --pid=
file /run/<a href=3D"https://urldefense.com/v3/__http://rpc.statd.pid__;!=
!AjveYdw8EvQ!YQpIhAuDuk9NODS4b584fgo2EjPOozFOsEHYqDnGZgh-d00DSYJWaXxc7JWZ=
bumpVZQ2D10tDepFo3AoB5EA6A$" moz-do-not-send=3D"true">rpc.statd.pid</a> \=
<br>
            -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--exe=
c /sbin/rpc.statd<br>
            +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;--exe=
c /usr/sbin/rpc.statd</blockquote>
          <div dir=3D"auto"><br>
          </div>
          <div dir=3D"auto">Is this always the case or depends upon
            usrmerge distro feature <br>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>This is always the case, because even without usrmerge feature,
      the default location for rpc.statd is in /usr/sbin.</p>
    <p><br>
    </p>
    <p>//Yi<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srHd0gM2ewCUaRm-LS54kxWyy=
FS9B9yTVPvok-NM=3Dn1eA@mail.gmail.com">
      <div>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"auto"><br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RET=3D$?<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if [ $RET !=3D 0 ];=
 then<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; echo =
&quot; failed&quot; $RET<br>
            -- <br>
            2.25.1<br>
            <br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#211865): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-core/message/211865_=
_;!!AjveYdw8EvQ!YQpIhAuDuk9NODS4b584fgo2EjPOozFOsEHYqDnGZgh-d00DSYJWaXxc7=
JWZbumpVZQ2D10tDepFo3DaAZ3vDg$" rel=3D"noreferrer" target=3D"_blank" moz-=
do-not-send=3D"true">https://lists.openembedded.org/g/openembedded-core/m=
essage/211865</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/111373723/1997914__;!!AjveYdw8EvQ!YQpIhAuDuk=
9NODS4b584fgo2EjPOozFOsEHYqDnGZgh-d00DSYJWaXxc7JWZbumpVZQ2D10tDepFo3Brq87=
FwA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https=
://lists.openembedded.org/mt/111373723/1997914</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">openembedd=
ed-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!YQpIhAuDu=
k9NODS4b584fgo2EjPOozFOsEHYqDnGZgh-d00DSYJWaXxc7JWZbumpVZQ2D10tDepFo3BUHu=
Bdgg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">http=
s://lists.openembedded.org/g/openembedded-core/unsub</a>
            [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" moz-=
do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com</=
a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------WIb6hfUw4O3ClFn35FV3E5jI--

