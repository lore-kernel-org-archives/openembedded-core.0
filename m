Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E8FD41C35
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 12:59:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8598.1765457977798218611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 04:59:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=exfqDOJt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=444065b617=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB5IiJJ037101
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 04:59:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=BLQLTijgi6Ih5NhOTLVi8L
	eRByyNFCyFAFtoZcOpewc=; b=exfqDOJtUHMkFi0HXld+y41J6dAU2zYyEo18uW
	AxzkntOSoJ45M1Lvn6yHiHyjJjimx2rTYkgAI4zpBPFBbAHBPJ/4+aL0v44aqXQz
	2dghGMgSYCMQDxg5egnGHU8LuiGQgvIKDrR3hcS+DVvjW4lFUOKxuD63UULaBHev
	XTgU1BSTXLsqaSY6aka6m9MXrA59mBt/gSeLKRNgi9xx82Y8tWFyURy4W3FMnMdy
	mCr++mF/5+hXGVJdrlw1QTpu6xO3JKepIYUCKYdPc61RuObfR6WROHDLhbySxz66
	lHy7LEVRdvTG08EFQt1eOs44yfM5jU+ssLzeJb4AP/Be/PoQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013012.outbound.protection.outlook.com [40.93.196.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay022t2ya-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 04:59:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUNb5UtXf6UP81BTUO9K89OiL/lcmTWHhrLvp4UbhEexAIoH7l/DDB7hDplJwF/2Y9FcP449byA0xee6UfkFP8tokQxb1K7zGBByY/zAJrl/NEhc47LUOIk76T+o3kgQxdRPlOZgytrAYcv7rCdzHjfIkhC7De0OQ9yuzf829NuJ8OEkA7paQAhmt31lqcGS+Bbj/82RGx9AYBarGhRS054uBiINDgSyITh/k+A1PjUx/KDRD/6UBLIsTpLWpMf2RuTMWubtsduFTRL2L3vZ+KpER6eqi/b1gmUMwZd4/zFhjDp+/eusXbQ12CfdHjygeGb9RcFYYwUoZ5JpxPEsJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BLQLTijgi6Ih5NhOTLVi8LeRByyNFCyFAFtoZcOpewc=;
 b=yCG/g6rUzcjvigHQ0zNbAPpHcuuMIHtiKTB3rLBuzJytJGpofMJqYqYqD0JfACOuNNOi0qeLIDyan8YQ933MOQ0WeGvqCJ4WAtiuoj1zZMBJqGV0Ozfia1w2OPiJ1Rv1W+2VPvckaKIBkl3zQIJSoI629mfZQ7FzRtWyfZvixAFiY7VMEQAvCYq/iPVx+GIf9rpcX880n7CIqIfo+/nmJpvitHE6QgJVTircm6wexRu3pEXZu6DE2yu3hH//x+uQkXV/z9ug/2kFSzq6m5TvbQCOGA3hx+OqtN7RCpprIkEVZ+fvSgfzvd+pGnjf5lh+R+vKvEWZTbF+dViL700kDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 by MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Thu, 11 Dec
 2025 12:59:33 +0000
Received: from LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf]) by LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf%6]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 12:59:33 +0000
Content-Type: multipart/alternative;
 boundary="------------NoEzZriwy6bXYNPo4uekTWuG"
Message-ID: <df51a41b-7725-48dd-84f5-e69cf5902b72@windriver.com>
Date: Thu, 11 Dec 2025 07:59:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] rust: add missing zlib and zstd dependencies
To: Yash Shinde <Yash.Shinde@windriver.com>,
        openembedded-core@lists.openembedded.org,
        Khem Raj <raj.khem@gmail.com>, peter.tatrai.ext@siemens.com
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
 <818e8b90-9aa1-45e4-aa1d-6a903676408e@windriver.com>
 <a94bfb6f-657b-444f-80c0-ffcbfd105305@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <a94bfb6f-657b-444f-80c0-ffcbfd105305@windriver.com>
X-ClientProxiedBy: SJ2PR07CA0014.namprd07.prod.outlook.com
 (2603:10b6:a03:505::7) To LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8505:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d090a45-99a3-4e07-7457-08de38b52187
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MkhkQ0xCM1lMUnBsSjBaM3hYU0FnNjN1Vnk1VWJFeFFxem9GeHNmQUpQRHh4?=
 =?utf-8?B?dDVmK1NTVCsxRjVKYVFHa09XWFB3Sy95djVRdlhwRGJadTAxRGR2RmZKa1VQ?=
 =?utf-8?B?YVhSdWxVTFdvRVRDYjNDS0UwR1RNWU44RFRlZUhpa2NLQWpESmQvQkJXOC90?=
 =?utf-8?B?UTlLcnEvQ09kbVpvd0x2RWpkOFI0Rlp0cjNxUC8rQ0QxT2lCeXBXWWhwU25u?=
 =?utf-8?B?KzN2bVVtYVhkMk1FWjRXZFFHTW5ESkpDekZ1blFDb0FoeUhvcjZpdFJPMkxk?=
 =?utf-8?B?Rm40RmNwUE43Ty9UZkJXdmZFODZIOWR1T0FoNE4waGVRa0FId2Z4bE9DaUE0?=
 =?utf-8?B?blJaK3VTZGtOT0VqUUp2UUdnYUtVWGZzdkVwNUc4SU5JYzQyd2hHTDBZRXpD?=
 =?utf-8?B?Q2RKc3NuWDZzeU5yNmlrQ1pmb1JoTHhvYUd3MGNKMjVyb2RVRW15alkrcHR0?=
 =?utf-8?B?Ym1DTWplNGVyMjY0WkVTVHZKOFZ1Uk1qbGpBK3YzZTBOSFA0NW5Oa2ltMHNE?=
 =?utf-8?B?R2VvZndOWTU5VWYwdEFpNEJmMDhjeHdnNm1rdVlNTDZaZGJoR3c5REk3OWdK?=
 =?utf-8?B?T1JiL3hrbFRKbkZJUmxGa0hPRWUzUHpLZkVsUkI2S1NRdmhPdFVjbkhQbkFY?=
 =?utf-8?B?OFEvamEwRVJZLzlNRmMzU29NNGFubTlRUy9EcXQ4ZDRLVmVYSU1pVHEyQ3VJ?=
 =?utf-8?B?VHRsTHg3cEdsOWxKdnNZejd6WnNBbDd4SzhwaUwzLzdhWTJXZktVRmZHVzJS?=
 =?utf-8?B?a3BmNzY1eW0yWHAxTFlsYnMyNE5PRVdIU0EwVy9iMVNzd29SbmZhUEQ4c0tl?=
 =?utf-8?B?VnVUR21oeHJLcUxOeXZZUjRzaDAwZ2dBbnoxTk5Iam9KTC9jeDVPQjZjUllI?=
 =?utf-8?B?WVVoWVN4WXpMeVVGbDF1MmU4aGczNzBWUkxWSzNQUloyUyt6Q09WMjhKd0NE?=
 =?utf-8?B?SXdxZm4xQnorR21Uc1ZMVXNGcnR4ZHdZWkU0aHBDeXkrK0NRN0lZRUdHekUr?=
 =?utf-8?B?b21IU2hkVk54VDBiazF3MXRpQTNxcDMzQVNRM0tWVGJIN1ZCdzgzVXRrM2p4?=
 =?utf-8?B?czhIZEdWbWtSMGllOG4rN2xsbVRobWxUUHVZMTNTQkFzbUNpWEdjMFFBcjV5?=
 =?utf-8?B?N0JIZHM2eXdJekVsUERERyt2bnI0RWFRWWh3MjBHazBqNzlobThRZHhWOTZL?=
 =?utf-8?B?ZVR1UnRZN1RndE1CZVA4REMzYldSalZielRyWG1vbC9hZlZBSzJPcmNZaitP?=
 =?utf-8?B?bzZPdTAyNThESzViYTFyTFBweUtuZ2lPdmlkV3FCQkhZQlBMSVdPL1BGdDRl?=
 =?utf-8?B?Mk5nUmRjMDE0YmpzRGRJV21TWENlbENKSDdyMUpvOEtxUmNvM1BqQW5ZQldS?=
 =?utf-8?B?RVBqUGVTR2hSZlFORnhtdXdSQmRqMDc0T3NWQUNiTlV0ZnFsK0o5VVRnYWwz?=
 =?utf-8?B?QWNOd0FaNDByQitIT2xHN3p1UEZSMkdqVmtwbGRiOEtETFZpdFh2OXd2MDZZ?=
 =?utf-8?B?S0w0Wmh2b0ZpM0tYVmJWZUROcDhPTVk5eXhidlphUjR1Yk1lZUFreW1KTk04?=
 =?utf-8?B?VHR1MlRaVCs5RStnQVZsTkJUcDloaUJUWDlZMVh1QnAyMDZzUlRlY3d6K0Qv?=
 =?utf-8?B?aTMzZ2YzNGQvUEFzc3FteWRWQkxpdjloa1lwekJ2bnNIa1J2TjVsd0ltMG8v?=
 =?utf-8?B?MUVQbTllWWtqcGZvZUU2Y0QwSGFyOU9HUC9GVTJUdWVXMTlHUysvQzNHOG5B?=
 =?utf-8?B?T3lYQmt2eGkwWjRJQVd2SXZLbHVwb2dndFFxcW94SDk5VXJmbG1uMFBDQXY4?=
 =?utf-8?B?TklLcGhUb1dZTnlhZ05KVEIyUHZQenlPeWNNOFFoTENDZkJwVE94VmhZdm1E?=
 =?utf-8?B?UnROM0Z1QWdiN0ZMK2ZER2tLSE5oZWtJMXhubXE1NlRCNjBhQ0R4NlZteENy?=
 =?utf-8?B?emkzT0NtK0FzWXNoRWFCU3QwVGplampxeDFBcXpnWFR0R2kxejJWdW82YXVB?=
 =?utf-8?B?QUwrcWRmUlFnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8505.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aWJSU01UT2FzUU93bVlpdE1IQTdONHBtb1FTNlZibHIyL290QVYzWFN1YU1m?=
 =?utf-8?B?cEVweVV3anp5bk1sN2ZYOXo0VGZtK2VRTFh4RkwxQlFhYk9KVFFQZWx0RWQx?=
 =?utf-8?B?T0hHRGxreHZmUFhFb2REaFBqWlN5TlpwdXhoL2d6Y3d0ME5wNmZ2TGROQisr?=
 =?utf-8?B?OHhscVBGeU9vb3NkckN0SmE0MzVHN21QUUU1OHF6UXk0cEgvUHlKbFMzdFR1?=
 =?utf-8?B?ekRDUW9xQWpCQ2grVjdaSHgvSmdPUEJUd0g2VENROFhoS3NVbC9FQlB0VGJT?=
 =?utf-8?B?bkhDVUVFdk55T0I3eWJnMmRxbGhncDBUd3o4RDJVTG83SmFNYyt5N1VCcFRX?=
 =?utf-8?B?c1FUVkdXU2JvU1cwV3FGUEJhb1ZOeTJSN3R5MEJVNEg3R2w2aElPa0FDVGtM?=
 =?utf-8?B?OHdaRWN3M1kvN2p6K2k3VEd4ZTdRaHp2WHlmNFpEdnJwWFhTZGgwdlNYV0dn?=
 =?utf-8?B?NzBBY0dUVHBRUS9SMVNtMSswRHFaMmsvWXpkSDdDR2pyN1hQVmlvYUVxMlRZ?=
 =?utf-8?B?NG01RktDOTdaM0thVHdsb2xCNm1HSWxRaGU2bmFZMHVmZ1dCenYzUzdKYWlu?=
 =?utf-8?B?VWo3eHNvQ0IxZXBVUW5Dd2x6NkljQm5pWGtsU09ac0RJQUNLd0JRUkdGa2pV?=
 =?utf-8?B?dFRIeE16ZTNDeGw1emNXNzlpaWdsRDRiZWxQanZjTmxrMlMrL2pNMDRPYjdF?=
 =?utf-8?B?WUZQQ1FTbnRXcnZoaGhPdnloa3RRaTA3dktTcUpjQzFyMElSRndiRUxXQTRh?=
 =?utf-8?B?OGtpcDYwRmtXREQ0ZGIrcXdaaWV1THpDWHdMcExUdVpKaHRDWWtOT1I1dXdB?=
 =?utf-8?B?cWQrMCsyYlhWcHlMMzFTdTNlK1MwMHMzdW9KT3RuZnJLQzhKZUkvcUVoM2lj?=
 =?utf-8?B?bkExazZ5MVk5SDdpV0YrZ08veTFSb2VyWG13R1FmQ2Q2eWs4T25BdjliaXc2?=
 =?utf-8?B?Z2dYMW1OSDBZRytHVCthVnVmSU9DMFhVWGpLcXNrRzFNUkhvY1hCRlRTSU40?=
 =?utf-8?B?UXdqdnNkS1lzT2RCbmYwR3QrRXBtUlU2OTlmQmt0YlIxTEp5VmVVS1NIKzdt?=
 =?utf-8?B?STFsYVZqdWwzbllyamZQMW1uOFJuWFE1YkYyZkR6UXpJT0gyb05BS0IrQjFh?=
 =?utf-8?B?Z0VjYUVWY2VhVSswMHMvS2VaQ0EzRitCTlRLVE42MkgrNTVpRTVQR1k3ODNN?=
 =?utf-8?B?ZU0wdHpxTG0wR29CbFlBVWEveWVmVWhWYTZuS2o5QjdYTFZNTmVCVE1md1Ru?=
 =?utf-8?B?SGgrQVRrTisreWRSa1pvaDEvWjVjYnhVQ2tOWDZUa1ZNRUVnbWtCenpwNzd5?=
 =?utf-8?B?L1U2blllK2FjTmoxTmpLNzUyZGMxT1U3QVo2SGVzNVdVelVYczZNN0czd0U4?=
 =?utf-8?B?aXJaVUtvVU1xU0JCei9QblpSTENJMFlhZWVBS1FTTXptR0lKc2gzWTJxTDBu?=
 =?utf-8?B?SHMzbllCY3BYUVk5bDlqMkFBNTVXZEY0QmdkcEF6ZUZXcnF0ZVhwbzlrWGhj?=
 =?utf-8?B?T0diSVYrVUpqaktCckRYb3RHdWMvMjI2Uk1VQXU1U2Nja3NYS1BJdmdLQjZu?=
 =?utf-8?B?RGl0UkVCTkdRVEtOYjJuVVVXaDh2OUVvRWRjZi9KeVdmZDFqdTRFdUt3dThj?=
 =?utf-8?B?OVJTZWNpcVgzSE4rd3MyMUJTMEtXbXdTSEt6YmJaTHQ5UFRWQjQyZDJHa0ZG?=
 =?utf-8?B?dmZtQjJBZ1Mrd1lGOWNGRVRhaS9NSG50dnJWL21BMlVIMGVpWXZXUGg2Qkxp?=
 =?utf-8?B?SEVXaHUxNEFZYnVjL1FrcElQVUdtRkowdWNOWllRcDkzTUFQUmxCY3JJZVJj?=
 =?utf-8?B?K01OZjlqbXVPTElSSldxckkxWlJsZ1hnQU0xbXlEYWpjMnB2MkwraFZnTmtW?=
 =?utf-8?B?QkZneHFRMkpBbDR4N1NGaUpoSVB4QjFidmVRREtFU0ZUak1ReHFTRDZXZTFR?=
 =?utf-8?B?THRKTjd2Z2NYQWJZNW8zNmZqcmgxbWdQcHlwYTJkWGRJTC8yV1FESHJqWlNP?=
 =?utf-8?B?ZytMVjhaMDVOM0NtSnNHejJieThUdStVQzRuMFc5bjFGMGQ4cnpWa2NuR0Nt?=
 =?utf-8?B?SkRxYnZZOFNTa0VybC84OWljS29BUGw2MFZyejhNSFBRQ0xybmc4c2dkdVFp?=
 =?utf-8?B?aGdyQnQrWEQzQzg4Y2x3OXdFME9vcHVjOXZCb3hlc2crRmV4TlBNMUJQU2pH?=
 =?utf-8?B?Vmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d090a45-99a3-4e07-7457-08de38b52187
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8505.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 12:59:33.7606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hWVXefZJvDleAgnYsFQYeUhwv8BPZCC4JriB0zTq0TPPZTyDuFzONsc1vWV91cfq07Dqv6CRCvXspUJQ0lXgJLEY9PapbXxhmx9C66qMaGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=bf1mkePB c=1 sm=1 tr=0 ts=693ac039 cx=c_pps
 a=ck9HhUZGATh9INII0mabYg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=danhDmx_AAAA:8 a=Twlkf-z8AAAA:8
 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8 a=pGLkceISAAAA:8 a=6WRdJMKRq3fSzsxWugQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=yF1ei_Cxrn0YWHVXm3sA:9
 a=X1XM3rZlyMaIuYdU:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=-74SuR6ZdpOK_LpdRCUo:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: me2ePQSchVvWDQ7j19nHwUXippPgYZRf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDEwMSBTYWx0ZWRfX+BRXo6zEeA8d
 7/DSnNOKWuL9KPlEQ7mBIA51k076b6BpAeCBZD4M+kiKUwfNiVoeK+UNDi5l8JLPOk2Oms3Rmk9
 395KY+EZsNY7+4qAFvXhiruVgbW5sTwZNPm/fQ3U909XfHK3k1fm81uo8t0QpO6mqBrICBS9hgb
 a2Tzz4w8Jas5gDKMLfPLIGOhIY9Ztc+A88Wb18BUniMEf2YSALe6YY4TAZh1JVny+P5i0bm7odj
 ImHIGPEaKV/MpC593JLvZqYwawFZIgBHuV1zoitGQjlnZDRfNsUQ6HwShBr1pLs4gldqPesubBa
 xfwQstqTzd7zwFFISrpv7eGPB+poGWdWNI/7KYSzEk01v4n5vjp2DhBRWX1oru4LNam081IDWYk
 040N5SJmWcdqvkizhtrQyDArxk7uIg==
X-Proofpoint-GUID: SzhUrHb_VHtnDXWADFPsrglXfOzpIFSc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 12:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227527

--------------NoEzZriwy6bXYNPo4uekTWuG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BB5IiJJ037101

On 2025-12-11 3:10 a.m., Yash Shinde wrote:
>
>
> On 10-12-2025 23:06, Randy MacLeod wrote:
>> Add Peter since this is/was his patch and you have his SOB line.
>> Please do that in the future.
>>
>> I have some comments and questions that could go contribute to a v2
>> but so far, I don't object, too strongly, to merging patch 1/5 at leas=
t!
>>
>>
>> On 2025-12-10 5:17 a.m., Yash.Shinde@windriver.com wrote:
>>> From: Peter Tatrai<peter.tatrai.ext@siemens.com>
>>>
>>> Rust's internal LLVM
>> Is this an old comment? llvm is now an oe-core=C2=A0 recipe and we don=
't=20
>> use rust's internal llvm
>> as far as I know (which isn't very far!).
>
> I kept the message from Peter's patch unchanged which was submitted=20
> around the same time when
> =C2=A0rust-llvm was dropped. I will reword the commit message in v2, if=
=20
> required.
>
> For more details:=20
> https://lists.openembedded.org/g/openembedded-core/message/225636


Good.


>
>>
>>> requires zlib and zstd compression libraries when
>> Yes, we have a patch for clang for this:
>> meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-=
detect-libzstd.patch
>> adding in meta-clang in 2022:
>> https://github.com/kraj/meta-clang/commit/0f38186ae93400b870f7f92938bb=
f8643e7da958
>> and the llvm-project commit is (1).
>
> The selftest execution environment requires the zlib and zstd features
> as llvm enables them unless explicitly disabled.
>
> The rust recipe level RUSTFLAGS aren't propagated to qemu image for=20
> testing.
> This requires explicit passing of the flags for zstd lib.
> (zlib is already available by default in core-image-minimal)
>
> The following error confirms that rust via llvm expects these libs to=20
> be available in the image for testing.
>

Okay.


>> Anyway, Khem,
>>
>> What are your thoughts about this patch and about using cmake for llvm=
?
>>
>>> building rustc_codegen_llvm and other compiler components.
>>> Without these dependencies, building Rust for target fails
>>> with linker errors:
>>>
>>>    error: linking with `target-rust-ccld` failed: exit status: 1
>>>    =3D note: undefined reference to `compress2'
>>>    =3D note: undefined reference to `uncompress'
>>>    =3D note: undefined reference to `ZSTD_decompress'
>>>    =3D note: undefined reference to `ZSTD_isError'
>>>    =3D note: undefined reference to `ZSTD_compress2'
>>>    =3D note: undefined reference to `crc32'
>>>
>>> This manifested in oe-selftest failure on qemuppc:
>>>    oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust
>>>
>>> Additionally, this was observed while testing with other targets as w=
ell.
>> If you have a list on hand of which targets had this problem,
>> that might be useful to include in the log. It might help
>> us understand why the problem seems to be arch-specific.
>
> Peter reported it for ppc target but eventually it was observed on all=20
> targets in our testings,
> i.e arm32, arm64, riscv-64, x86-32 and x86-64.
> So, this is a generic requirement rather than arch-specific.
>
Good so please revise your v2 commit log to indicate exactly what you=20
observed.


../Randy

>
>>> Signed-off-by: Peter Tatrai<peter.tatrai.ext@siemens.com>
>>> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
>>> ---
>>>   meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/sel=
ftest/cases/rust.py
>>> index 31222e2456..01a98339a6 100644
>>> --- a/meta/lib/oeqa/selftest/cases/rust.py
>>> +++ b/meta/lib/oeqa/selftest/cases/rust.py
>>> @@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase=
, OEPTestResultTestCase):
>>>           bitbake("{} -c test_compile".format(recipe))
>>>           builddir =3D get_bb_var("RUSTSRC", "rust")
>>>           # build core-image-minimal with required packages
>>> -        default_installed_packages =3D ["libgcc", "libstdc++", "liba=
tomic", "libgomp"]
>>> +        default_installed_packages =3D ["libgcc", "libstdc++", "liba=
tomic", "libgomp", "libzstd"]
>>>
>> This has been present since the original rust.py selftest was added.
>> It seems like a hack in that things are added to (blindly?) fix=20
>> linking errors
>> rather than getting to the root cause of the problem.
>>
>> That may be acceptable in the short run but shouldn't the list should =
be
>> just what rustc/cargo from rustup depend on:
>> =E2=9D=AF which rustc
>> /home/rmacleod/.cargo/bin/rustc
>> =E2=9D=AF ldd `which rustc`
>> =C2=A0=C2=A0=C2=A0 linux-vdso.so.1 (0x00007a636834b000)
>> =C2=A0=C2=A0=C2=A0 libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.s=
o.1=20
>> (0x00007a636830b000)
>> =C2=A0=C2=A0=C2=A0 librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1 (0=
x00007a6368306000)
>> =C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthre=
ad.so.0=20
>> (0x00007a6368301000)
>> =C2=A0=C2=A0=C2=A0 libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x0=
0007a636821a000)
>> =C2=A0=C2=A0=C2=A0 libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0=
x00007a6368215000)
>> =C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x0=
0007a6366a00000)
>> =C2=A0=C2=A0=C2=A0 /lib64/ld-linux-x86-64.so.2 (0x00007a636834d000)
>>
>> =E2=9D=AF cargo --version
>> cargo 1.91.1 (ea2d97820 2025-10-10)
>> =E2=9D=AF which cargo
>> /home/rmacleod/.cargo/bin/cargo
>> =E2=9D=AF ldd `which cargo`
>> =C2=A0=C2=A0=C2=A0 linux-vdso.so.1 (0x0000789ffe470000)
>> =C2=A0=C2=A0=C2=A0 libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/libgcc_s.s=
o.1=20
>> (0x0000789ffe430000)
>> =C2=A0=C2=A0=C2=A0 librt.so.1 =3D> /lib/x86_64-linux-gnu/librt.so.1 (0=
x0000789ffe42b000)
>> =C2=A0=C2=A0=C2=A0 libpthread.so.0 =3D> /lib/x86_64-linux-gnu/libpthre=
ad.so.0=20
>> (0x0000789ffe426000)
>> =C2=A0=C2=A0=C2=A0 libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so.6 (0x0=
000789ffcf19000)
>> =C2=A0=C2=A0=C2=A0 libdl.so.2 =3D> /lib/x86_64-linux-gnu/libdl.so.2 (0=
x0000789ffe421000)
>> =C2=A0=C2=A0=C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so.6 (0x0=
000789ffcc00000)
>> =C2=A0=C2=A0=C2=A0 /lib64/ld-linux-x86-64.so.2 (0x0000789ffe472000)
>>
>> perhaps with the exception of libatomic and libgomp which seem like=20
>> valid requirements.
>> I guess I'm really wondering if libzstd even libatomic and libgomp,=20
>> should be RDEPENDs for some recipe.
>
> The list of packages in "default_installed_packages" is needed to=20
> include additional selftest requirements apart from the default ones=20
> used in core-image-minimal. These are actual requirements rather than=20
> hack. Adding them in DEPENDS/RDEPENDS do not propagate the=20
> dependencies in selftest qemu image.
>
>
>>
>>>           features =3D []
>>>           features.append('IMAGE_FEATURES +=3D "ssh-server-dropbear"'=
)
>>>           features.append('CORE_IMAGE_EXTRA_INSTALL +=3D "{0}"'.forma=
t(" ".join(default_installed_packages)))
>>> @@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCa=
se, OEPTestResultTestCase):
>>>               cmd =3D cmd + " export RUST_TARGET_PATH=3D%s/rust-targe=
ts;" % rustlibpath
>>>               # Strip debug symbols from test binaries to reduce size=
 (300+ MB -> ~140 MB)
>>>               # PowerPC mac99 QEMU has 768MB RAM limit, so we need to=
 minimize test binary sizes
>>> -            cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo=
';"
>>> +            cmd =3D cmd + " export RUSTFLAGS=3D'-C strip=3Ddebuginfo=
 -Clink-arg=3D-lz -Clink-arg=3D-lzstd';"
>>>               # Trigger testing.
>>>               cmd =3D cmd + " export TEST_DEVICE_ADDR=3D\"%s:12345\";=
" % qemu.ip
>>>               cmd =3D cmd + " cd %s; python3 src/bootstrap/bootstrap.=
py test %s --target %s" % (builddir, testargs, targetsys)
>>
>> ../Randy
>>
>>
>> 1)=20
>> https://github.com/llvm/llvm-project/commit/e939bf67e34037970192fa90ad=
22ab7628f5de33
>>
>> commit e939bf67e34037970192fa90ad22ab7628f5de33
>> Author: Cole Kissane <cole.kissane@gmail.com>
>> Date:=C2=A0=C2=A0 Tue Jul 19 13:54:35 2022
>>
>> =C2=A0=C2=A0=C2=A0 [llvm] add zstd to `llvm::compression` namespace
>>
>> =C2=A0=C2=A0=C2=A0 - add zstd to `llvm::compression` namespace
>> =C2=A0=C2=A0=C2=A0 - add a CMake option `LLVM_ENABLE_ZSTD` with behavi=
or mirroring=20
>> that of `LLVM_ENABLE_ZLIB`
>> =C2=A0=C2=A0=C2=A0 - add tests for zstd to `llvm/unittests/Support/Com=
pressionTest.cpp`
>> =C2=A0=C2=A0=C2=A0 - debian users should install libzstd when using=20
>> `LLVM_ENABLE_ZSTD=3DFORCE_ON` from source due to this bug=20
>> https://bugs.launchpad.net/ubuntu/+source/libzstd/+bug/1941956
>>
>> =C2=A0=C2=A0=C2=A0 Reviewed By: leonardchan, MaskRay
>>
>> =C2=A0=C2=A0=C2=A0 Differential Revision: https://reviews.llvm.org/D12=
8465
>>
>>
>>
>>
>> --=20
>> # Randy MacLeod
>> # Wind River Linux


--=20
# Randy MacLeod
# Wind River Linux

--------------NoEzZriwy6bXYNPo4uekTWuG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BB5IiJJ037101

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-12-11 3:10 a.m., Yash Shinde
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:a94bfb6f-657b-444f-80c0-ffcbfd1=
05305@windriver.com">
     =20
      <p><br>
      </p>
      <div class=3D"moz-cite-prefix">On 10-12-2025 23:06, Randy MacLeod
        wrote:<br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a903=
676408e@windriver.com">
        <div class=3D"moz-cite-prefix">Add Peter since this is/was his
          patch and you have his SOB line. <br>
          Please do that in the future.</div>
        <div class=3D"moz-cite-prefix"><br>
        </div>
        <div class=3D"moz-cite-prefix">I have some comments and questions
          that could go contribute to a v2<br>
          but so far, I don't object, too strongly, to merging patch 1/5
          at least! <br>
          <br>
        </div>
        <br>
        <div class=3D"moz-cite-prefix">On 2025-12-10 5:17 a.m., <a class=3D=
"moz-txt-link-abbreviated moz-txt-link-freetext" href=3D"mailto:Yash.Shin=
de@windriver.com" moz-do-not-send=3D"true">Yash.Shinde@windriver.com</a> =
wrote:<br>
        </div>
        <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Ya=
sh.Shinde@windriver.com">
          <pre wrap=3D"" class=3D"moz-quote-pre">From: Peter Tatrai <a cl=
ass=3D"moz-txt-link-rfc2396E" href=3D"mailto:peter.tatrai.ext@siemens.com=
">&lt;peter.tatrai.ext@siemens.com&gt;</a>

Rust's internal LLVM </pre>
        </blockquote>
        Is this an old comment? llvm is now an oe-core&nbsp; recipe and w=
e
        don't use rust's internal llvm <br>
        as far as I know (which isn't very far!).<br>
      </blockquote>
      <br>
      I kept the message from Peter's patch unchanged which was
      submitted around the same time when<br>
      &nbsp;rust-llvm was dropped. I will reword the commit message in v2=
, if
      required.<br>
      <br>
      For more details: <a class=3D"moz-txt-link-freetext" href=3D"https:=
//lists.openembedded.org/g/openembedded-core/message/225636" moz-do-not-s=
end=3D"true">https://lists.openembedded.org/g/openembedded-core/message/2=
25636</a><br>
    </blockquote>
    <p><br>
    </p>
    <p>Good.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:a94bfb6f-657b-444f-80c0-ffcbfd1=
05305@windriver.com"> <br>
      <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a903=
676408e@windriver.com"><br>
        <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Ya=
sh.Shinde@windriver.com">
          <pre wrap=3D"" class=3D"moz-quote-pre">requires zlib and zstd c=
ompression libraries when</pre>
        </blockquote>
        Yes, we have a patch for clang for this:<br>
        &nbsp;&nbsp;
meta/recipes-devtools/clang/clang/0024-llvm-Do-not-use-cmake-infra-to-det=
ect-libzstd.patch<br>
        adding in meta-clang in 2022:<br>
        &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://g=
ithub.com/kraj/meta-clang/commit/0f38186ae93400b870f7f92938bbf8643e7da958=
" moz-do-not-send=3D"true">https://github.com/kraj/meta-clang/commit/0f38=
186ae93400b870f7f92938bbf8643e7da958</a><br>
        and the llvm-project commit is (1).<br>
      </blockquote>
      <br>
      The selftest execution environment requires the zlib and zstd
      features<br>
      as llvm enables them unless explicitly disabled.<br>
      <p>The rust recipe level RUSTFLAGS aren't propagated to qemu image
        for testing.<br>
        This requires explicit passing of the flags for zstd lib.&nbsp;<b=
r>
        (zlib is already available by default in core-image-minimal)<br>
        <br>
        The following error confirms that rust via llvm expects these
        libs to be available in the image for testing.</p>
    </blockquote>
    <p><br>
    </p>
    <p>Okay.</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:a94bfb6f-657b-444f-80c0-ffcbfd1=
05305@windriver.com">
      <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a903=
676408e@windriver.com">
        <p>Anyway, Khem,<br>
          <br>
          What are your thoughts about this patch and about using cmake
          for llvm?</p>
        <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Ya=
sh.Shinde@windriver.com">
          <pre wrap=3D"" class=3D"moz-quote-pre">building rustc_codegen_l=
lvm and other compiler components.
Without these dependencies, building Rust for target fails
with linker errors:

  error: linking with `target-rust-ccld` failed: exit status: 1
  =3D note: undefined reference to `compress2'
  =3D note: undefined reference to `uncompress'
  =3D note: undefined reference to `ZSTD_decompress'
  =3D note: undefined reference to `ZSTD_isError'
  =3D note: undefined reference to `ZSTD_compress2'
  =3D note: undefined reference to `crc32'

This manifested in oe-selftest failure on qemuppc:
  oe-selftest -r rust.RustSelfTestSystemEmulated.test_rust

Additionally, this was observed while testing with other targets as well.=
</pre>
        </blockquote>
        If you have a list on hand of which targets had this problem,<br>
        that might be useful to include in the log. It might help<br>
        us understand why the problem seems to be arch-specific.<br>
      </blockquote>
      <p>Peter reported it for ppc target but eventually it was observed
        on all targets in our testings,&nbsp;&nbsp;<br>
        i.e arm32, arm64, riscv-64, x86-32 and x86-64.<br>
        So, this is a generic requirement rather than arch-specific.<br>
      </p>
    </blockquote>
    Good so please revise your v2 commit log to indicate exactly what
    you observed.<br>
    <p><br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:a94bfb6f-657b-444f-80c0-ffcbfd1=
05305@windriver.com">
      <p> <br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a903=
676408e@windriver.com">
        <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Ya=
sh.Shinde@windriver.com">
          <pre wrap=3D"" class=3D"moz-quote-pre">Signed-off-by: Peter Tat=
rai <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:peter.tatrai.ext@si=
emens.com">&lt;peter.tatrai.ext@siemens.com&gt;</a>
Signed-off-by: Yash Shinde <a class=3D"moz-txt-link-rfc2396E" href=3D"mai=
lto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/rust.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftes=
t/cases/rust.py
index 31222e2456..01a98339a6 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OE=
PTestResultTestCase):
         bitbake(&quot;{} -c test_compile&quot;.format(recipe))
         builddir =3D get_bb_var(&quot;RUSTSRC&quot;, &quot;rust&quot;)
         # build core-image-minimal with required packages
-        default_installed_packages =3D [&quot;libgcc&quot;, &quot;libstd=
c++&quot;, &quot;libatomic&quot;, &quot;libgomp&quot;]
+        default_installed_packages =3D [&quot;libgcc&quot;, &quot;libstd=
c++&quot;, &quot;libatomic&quot;, &quot;libgomp&quot;, &quot;libzstd&quot=
;]

</pre>
        </blockquote>
        This has been present since the original rust.py selftest was
        added.<br>
        It seems like a hack in that things are added to (blindly?) fix
        linking errors<br>
        rather than getting to the root cause of the problem.<br>
        <br>
        That may be acceptable in the short run but shouldn't the list
        should be<br>
        just what rustc/cargo from rustup depend on:<br>
        =E2=9D=AF which rustc<br>
        /home/rmacleod/.cargo/bin/rustc<br>
        =E2=9D=AF ldd `which rustc`<br>
        &nbsp;&nbsp;&nbsp; linux-vdso.so.1 (0x00007a636834b000)<br>
        &nbsp;&nbsp;&nbsp; libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/li=
bgcc_s.so.1
        (0x00007a636830b000)<br>
        &nbsp;&nbsp;&nbsp; librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt=
.so.1
        (0x00007a6368306000)<br>
        &nbsp;&nbsp;&nbsp; libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/=
libpthread.so.0
        (0x00007a6368301000)<br>
        &nbsp;&nbsp;&nbsp; libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.s=
o.6
        (0x00007a636821a000)<br>
        &nbsp;&nbsp;&nbsp; libdl.so.2 =3D&gt; /lib/x86_64-linux-gnu/libdl=
.so.2
        (0x00007a6368215000)<br>
        &nbsp;&nbsp;&nbsp; libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.s=
o.6
        (0x00007a6366a00000)<br>
        &nbsp;&nbsp;&nbsp; /lib64/ld-linux-x86-64.so.2 (0x00007a636834d00=
0)<br>
        <br>
        =E2=9D=AF cargo --version<br>
        cargo 1.91.1 (ea2d97820 2025-10-10)<br>
        =E2=9D=AF which cargo<br>
        /home/rmacleod/.cargo/bin/cargo<br>
        =E2=9D=AF ldd `which cargo`<br>
        &nbsp;&nbsp;&nbsp; linux-vdso.so.1 (0x0000789ffe470000)<br>
        &nbsp;&nbsp;&nbsp; libgcc_s.so.1 =3D&gt; /lib/x86_64-linux-gnu/li=
bgcc_s.so.1
        (0x0000789ffe430000)<br>
        &nbsp;&nbsp;&nbsp; librt.so.1 =3D&gt; /lib/x86_64-linux-gnu/librt=
.so.1
        (0x0000789ffe42b000)<br>
        &nbsp;&nbsp;&nbsp; libpthread.so.0 =3D&gt; /lib/x86_64-linux-gnu/=
libpthread.so.0
        (0x0000789ffe426000)<br>
        &nbsp;&nbsp;&nbsp; libm.so.6 =3D&gt; /lib/x86_64-linux-gnu/libm.s=
o.6
        (0x0000789ffcf19000)<br>
        &nbsp;&nbsp;&nbsp; libdl.so.2 =3D&gt; /lib/x86_64-linux-gnu/libdl=
.so.2
        (0x0000789ffe421000)<br>
        &nbsp;&nbsp;&nbsp; libc.so.6 =3D&gt; /lib/x86_64-linux-gnu/libc.s=
o.6
        (0x0000789ffcc00000)<br>
        &nbsp;&nbsp;&nbsp; /lib64/ld-linux-x86-64.so.2 (0x0000789ffe47200=
0)<br>
        <br>
        perhaps with the exception of <span style=3D"white-space: pre-wra=
p">libatomic and libgomp</span> which
        seem like valid requirements.<br>
        I guess I'm really wondering if libzstd even libatomic and
        libgomp, should be RDEPENDs for some recipe.<br>
      </blockquote>
      <p>The list of packages in &quot;<span style=3D"white-space: pre-wr=
ap">default_installed_packages&quot; is needed to include additional self=
test requirements=20
apart from the default ones used in core-image-minimal. These are actual =
requirements rather than hack.

Adding them in DEPENDS/RDEPENDS do not propagate the dependencies in self=
test qemu image.</span></p>
      <p><br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:818e8b90-9aa1-45e4-aa1d-6a903=
676408e@windriver.com"><br>
        <blockquote type=3D"cite" cite=3D"mid:20251210101803.1120711-1-Ya=
sh.Shinde@windriver.com">
          <pre wrap=3D"" class=3D"moz-quote-pre">         features =3D []
         features.append('IMAGE_FEATURES +=3D &quot;ssh-server-dropbear&q=
uot;')
         features.append('CORE_IMAGE_EXTRA_INSTALL +=3D &quot;{0}&quot;'.=
format(&quot; &quot;.join(default_installed_packages)))
@@ -124,7 +124,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, =
OEPTestResultTestCase):
             cmd =3D cmd + &quot; export RUST_TARGET_PATH=3D%s/rust-targe=
ts;&quot; % rustlibpath
             # Strip debug symbols from test binaries to reduce size (300=
+ MB -&gt; ~140 MB)
             # PowerPC mac99 QEMU has 768MB RAM limit, so we need to mini=
mize test binary sizes
-            cmd =3D cmd + &quot; export RUSTFLAGS=3D'-C strip=3Ddebuginf=
o';&quot;
+            cmd =3D cmd + &quot; export RUSTFLAGS=3D'-C strip=3Ddebuginf=
o -Clink-arg=3D-lz -Clink-arg=3D-lzstd';&quot;
             # Trigger testing.
             cmd =3D cmd + &quot; export TEST_DEVICE_ADDR=3D\&quot;%s:123=
45\&quot;;&quot; % qemu.ip
             cmd =3D cmd + &quot; cd %s; python3 src/bootstrap/bootstrap.=
py test %s --target %s&quot; % (builddir, testargs, targetsys)
</pre>
        </blockquote>
        <p>../Randy</p>
        <p><br>
        </p>
        <p>1) <a class=3D"moz-txt-link-freetext" href=3D"https://github.c=
om/llvm/llvm-project/commit/e939bf67e34037970192fa90ad22ab7628f5de33" moz=
-do-not-send=3D"true">https://github.com/llvm/llvm-project/commit/e939bf6=
7e34037970192fa90ad22ab7628f5de33</a><br>
        </p>
        <p>commit e939bf67e34037970192fa90ad22ab7628f5de33<br>
          Author: Cole Kissane <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:cole.kissane@gmail.com" moz-do-not-send=3D"true">&lt;cole.kissane=
@gmail.com&gt;</a><br>
          Date:&nbsp;&nbsp; Tue Jul 19 13:54:35 2022<br>
          <br>
          &nbsp;&nbsp;&nbsp; [llvm] add zstd to `llvm::compression` names=
pace<br>
          &nbsp;&nbsp; &nbsp;<br>
          &nbsp;&nbsp;&nbsp; - add zstd to `llvm::compression` namespace<=
br>
          &nbsp;&nbsp;&nbsp; - add a CMake option `LLVM_ENABLE_ZSTD` with=
 behavior
          mirroring that of `LLVM_ENABLE_ZLIB`<br>
          &nbsp;&nbsp;&nbsp; - add tests for zstd to
          `llvm/unittests/Support/CompressionTest.cpp`<br>
          &nbsp;&nbsp;&nbsp; - debian users should install libzstd when u=
sing
          `LLVM_ENABLE_ZSTD=3DFORCE_ON` from source due to this bug <a cl=
ass=3D"moz-txt-link-freetext" href=3D"https://bugs.launchpad.net/ubuntu/+=
source/libzstd/+bug/1941956" moz-do-not-send=3D"true">https://bugs.launch=
pad.net/ubuntu/+source/libzstd/+bug/1941956</a><br>
          &nbsp;&nbsp; &nbsp;<br>
          &nbsp;&nbsp;&nbsp; Reviewed By: leonardchan, MaskRay<br>
          &nbsp;&nbsp; &nbsp;<br>
          &nbsp;&nbsp;&nbsp; Differential Revision: <a class=3D"moz-txt-l=
ink-freetext" href=3D"https://reviews.llvm.org/D128465" moz-do-not-send=3D=
"true">https://reviews.llvm.org/D128465</a><br>
          <br>
        </p>
        <p><br>
        </p>
        <p><br>
        </p>
        <p><br>
        </p>
        <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------NoEzZriwy6bXYNPo4uekTWuG--

