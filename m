Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E36D7C021B8
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 12:07:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.20327.1741090068797401721
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Mar 2025 04:07:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=515852bd04=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524Bj2VH028636
	for <openembedded-core@lists.openembedded.org>; Tue, 4 Mar 2025 04:07:48 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4542mqk6dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 04:07:48 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 524C7lUv029801;
	Tue, 4 Mar 2025 04:07:47 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4542mqk6dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 04:07:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wLsPM6pLSh0rXmMuV0FAqqb/WH+FWCG928arOyW0ntF+dx4Fu1x6cmozcrYFGf70lelrg0BjqKgOSwHG11Ofchft+L4bQQCMqzhmymmxhQBfSr1TpHE4MimEWhmqxmtHmsiEM5fICxjBLxBnEsc31JOFJD8BDyRvMXrIxzPDHn0k8VzVSX/HtpMUnTYkw4jncFQ23WYurAAcRboDPkgUXlPV1NtQEdQNLVjcYnDj7lW9omsqUW1ynKmLTYoPkG70TnR+L2vgFFEE1sOyU5kC4RvUlYJvXXZBAjDohrLq1Oxga58P5Z5wHRloqpU3S27+pIJkfAkn3H3uur6OpFRQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJM97FNEgVojCYXYH4l2sSbOCJzodX10/dqTCQNb9xM=;
 b=l9FUlaORkfeFNi+UzlfJSwFWKy1b7kvTFL6JA1wxc/k3BPx5nYRZNIRc8kxn0tXAFIGXLU5kw5mn5m7VuVRQN1HV7tvjXrsUkyzPvbsqiCAg7sos+5NNTS1kp9JqoNo2iKA1eWeDTIQ+PiArqXZ9z0lbWkUYvl6XX8fjpWkQ2Lipi8lxrbnmGgJ1t37naTlC4v9FJXf6OQOLPg/xhnhkkceHKiFJLN7vDqsrJ55Kiqkva4tv1GT75g7xIbiLQkDUaLmmAev+x2h8SvhTuTpURkCqA+YZolvXE0PeGPIbDXjjLCOXQRNkb7e/6dxe81K7Jm0lzzljwblMgvKMvpEcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW3PR11MB4699.namprd11.prod.outlook.com (2603:10b6:303:54::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Tue, 4 Mar
 2025 12:07:43 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 12:07:43 +0000
Message-ID: <ff091d63-58e6-4f5c-91fc-645e6fa800f7@windriver.com>
Date: Tue, 4 Mar 2025 17:37:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V2 2/3] rust: Fix build break because of
 download-ci-llvm
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
References: <20250303153458.2879205-1-Deepesh.Varatharajan@windriver.com>
 <20250303153458.2879205-2-Deepesh.Varatharajan@windriver.com>
 <4ab6c642-5574-4243-89a1-a4c06997cfb3@windriver.com>
 <1446ceab21e01caf44a92b0e6b327a862a85d5c4.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <1446ceab21e01caf44a92b0e6b327a862a85d5c4.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::7) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW3PR11MB4699:EE_
X-MS-Office365-Filtering-Correlation-Id: 303062c5-3014-4161-2196-08dd5b152b03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VVh0bUxQTURDQTJWS0gvZU0reG50VStJRG5Ta1VOTER4aGdNOUZJVWhYdEZh?=
 =?utf-8?B?QjgvTGtGZE9jUGowOWx2d0dEa2tTa21qbkFBRDVyZXZ3YnFQa1dRZVRPZEFk?=
 =?utf-8?B?SzVHVk5yQmlkRHlGYzc5MEVWYkYreFhnOW41SmFkQllHbkhKcWVwZVF0aGQx?=
 =?utf-8?B?VDh2dEhtWW5WQTVWSG1Cd3BiUnFQTHlOeDM1TUtMU1V5aHVIRjlLRm1vZkpj?=
 =?utf-8?B?UmM3VkNOelpMRkMyK1NsYjNlK0JhcmRSZzZBNGxRYUFSQXBBeWxFRFd3S1BO?=
 =?utf-8?B?WjJrM3NtN2VyMmlFZlhFOVVNbDhacTQ5U0xpdXpyN2ZWSncyMXZaMHNkT1VQ?=
 =?utf-8?B?a29PRHhPdE1Pb3YvRW4vOGZrcGVwWTBjcUZWVlBpWWk2SHpXZW1sRjllNktB?=
 =?utf-8?B?clM3UVJuRlVLdkFZSFBjN3J4b3VZdHY4dlFVQTc3dmxYeGZjMFNvYm95Q1FU?=
 =?utf-8?B?THRnUkFVVnVIT1R2TDZ4U3Q2UktGZ2RSZDRnS1RiaWtWeVU0ZjB1MGdqeVly?=
 =?utf-8?B?Z1AzcnlIZHIwUXFjOTV3eHE0VFU1dFFXUjdqTXJHejZqK3BVUkp3TThHNStY?=
 =?utf-8?B?Q1ZnanBYK0prbFJuN0p3NWgvMWcycVE1OEwrR0tWa2pxMzlzWVR1bTJwK2tk?=
 =?utf-8?B?T1RWT3ZWcm95TmZadUlobW4zQ0VlMnA5TUNpcVNjM1ZhWFBEeWplb0JOSnAr?=
 =?utf-8?B?SFB6eERBWUhkdmhxc3VHY0Z5TTF6RTR1TnpVWkZFd2RDRU8yTGtiWXU4RW5i?=
 =?utf-8?B?QUJDZFlqQUhiRVFUZHE5Nm9pWUk4YlpHMTQ3NjlLTW9lRXZXMXg3MXZkQkV0?=
 =?utf-8?B?eTIvZ1VKcmM0L2QvVjlNblo2KzBtMThabUJFM056RjFhVUpUUDk2TUdyYjlq?=
 =?utf-8?B?MXU3RFJlL0NkbkdPOGp5NlB3WEVCZXRvdzZGdVNiSWpQanBDeHYxc2FrS000?=
 =?utf-8?B?MlF4dEE3YTRpdmRUaldLaFZRUmFzaVQySXhSamFjS2xxTVZzSU5xN21RVkMz?=
 =?utf-8?B?a011NmkrSGFwMEdWclpUVWwvekJYSWFKc25HcElCWHJ4NnRwZ0RIZWRKVHZY?=
 =?utf-8?B?eTkzeU5OQlhaeDdnaFN1QWltMGh4L0J4TE91ZzZuVEpGQ1hZZWp6WTNiWHls?=
 =?utf-8?B?ck84d1Yxd1R3NzI1aDJVc2lVWjZvSmRaS0EzZkMzSjdNSjJKSnk5KzRpZC9a?=
 =?utf-8?B?dy9Zcy9zWXdIcEJwRzBTakdEZ0Rpc0swZkZZS250R3JNeHFvSDJPSjNaRDVt?=
 =?utf-8?B?NVZLUjQ5QWFURDRoTlJtQzFORkxzME1taWkvM1RkOTVDQWRVTkpJQ1FyREhL?=
 =?utf-8?B?WTh4M2Nidm1PREp0dDdpYTRsa1JveitPZUl5ZUpvQnA3aS9HREtESlhkYnBr?=
 =?utf-8?B?QTd4dDV4Zll0VXRieXk5RTJUU3F0Nk5KU3dvQmhxSFM4L3JxVUpvc0ZtNTht?=
 =?utf-8?B?N2MyM09zWmV5NXNtQWVYbmpWQUM2ZHJJUmhrODZLU1l4ZW9Od3pYRnk4UzJC?=
 =?utf-8?B?aEFoUlAycnRJY0twKzZrRWxzN3lWTG9KejRCU0lSTy9vVEJ3V2NWS3VRU0d3?=
 =?utf-8?B?R2hzTHJzemdNY1ZLNHRNUmN3dXdUMDJLMkJab04yd2gvVUYyYkpydFd2OUFS?=
 =?utf-8?B?cCt6c0x0aTR0U3ptdzEra0ZCQnNYcmJ2NFFJYWl1aTJYT25aOTgrL2tnNFNx?=
 =?utf-8?B?cjZIQ1FNZ3lnR0FUTlpMbWZCbzFOYm5UaHB3Q3pSeWpGdStCeUN4RmZzUlNC?=
 =?utf-8?B?OEt1RHkrZ1RuQWNNNFMrdUFVWTZnNVpWRkVGNGpNWnpMVkRFOG96bVNLa1lo?=
 =?utf-8?B?MjVCWUZtR1cxYnFFQlRSek5VdmIzZTFiK3kvSjYvWUViUnNITHF5MGhlZUpn?=
 =?utf-8?B?bGZIK0hVZkIwWW0vaDltejZhNUpPeWdGL0k4c2twVE02bGc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ck5uZW1lVy9ROHVGSWpHUzlmZkZsNEV4MUdJRS9YNnJtVU50ejNRVU9FZDNN?=
 =?utf-8?B?QTBtRENOejEzWGZFcmh5R0lhUlAwb1l1dkF6RzFBd3RTR1haMW5yenBoSXFV?=
 =?utf-8?B?NXd1S1E2MFM2OFlMOEpkUHJ4OGd5d2FGeG8reDJzbFFDVkxsMzdZemdNZWcw?=
 =?utf-8?B?SjhUSlhjMVFhdXdWUThOM3VOWHlzSlZ2bVhKb1V0WlFYZUkzeW1CMUIrRzk5?=
 =?utf-8?B?ckhMc3RQVm43NTBCdkxVdURCWlFkMDhnZG80OUxOaU9Yb0pBdDdhWHBjQWZu?=
 =?utf-8?B?WElpSnFnY2ZPU0VqTVBES011L0Vrc0Jla1hTeDMzdkxrMjZYQ3g0WVRmaWZ0?=
 =?utf-8?B?UkFlck1xbzVpc2VrRFdwcHhnUnFiRkY3WlZrbklqeCt0b3VNOFROTXRTRnpy?=
 =?utf-8?B?SjN2am9BbDl0ZTBRQzhDWWk1Zm1LTzl3RUlDNXpQdnRDN3J1eUNBK1dSNUM3?=
 =?utf-8?B?cW1rcGhjTWNTeDF4K0JINmdNZ2RpNDJOS1c4bHh5YXB4MU9vRXF0cEt4Qkh0?=
 =?utf-8?B?V1dXTkNxbUplSjZ2VGFwUnhnOGpxM0FQUVpubVg1cTZSVGQxandqcVk4ak5X?=
 =?utf-8?B?SlVOK1pZUU16UzhjVzQyV1FZUlgxNk1XY1hRWDYxellvVnVhbWl3WVZFa01o?=
 =?utf-8?B?NEhaWmlzTUZYclFyTjNkZU9SeFdUNTRKS1k3Mi9qVGFqRkM3SkJmdHBWZktH?=
 =?utf-8?B?OHdtOWsyNzJmdmEzR0tHSFdZWXVhMVJzdG5JQWpsVFg1YWxkNTI5UitTSnZw?=
 =?utf-8?B?R0ZKUGF6QzZFKzVVTWFvT2tndlFDeFlJWEtMRTJjb0FCV2UxNzNDMEtybWRD?=
 =?utf-8?B?MlhPNFZXTjhReFVpanh5YzRVYUxFRmJJVXR0OUh1a0tmdmNweTliTGI1c1pG?=
 =?utf-8?B?eGZ4L2RnSHFzWHFYdFpyalJrK0FXRDBGVnlJdWZTTklQckFCc05GcjJUcmRn?=
 =?utf-8?B?WC85REZpMzZ1LzcyOS9vWkx4aDNGSVhwYzBTbFc4bWl5UDhvdy9xY2xha0NZ?=
 =?utf-8?B?QXJEOFNpWGNpd3V1WTZMY3IrY0FSWnVFS0x2ZmlOZTRoM045eG44aVBKa1oy?=
 =?utf-8?B?MzJHS1Rrck9oZVBvc1NzVXZUZS9mUmlma1hQOXRqQzhkVzd2c1ljc1R3cDZ1?=
 =?utf-8?B?Q0l3b1o5UUhwYjRvMVpXc1YxNlYyTm1nbERYeUwxQ1dIVmJWSzVqbWg1YUp3?=
 =?utf-8?B?bWdhNlhWNWdWM0N6TEp2Y2dLb1NDT21IV2hMdlhudWRWaXpURitGQVoyeVFT?=
 =?utf-8?B?UFVBaEZucWpCNWN4MzArUTBLbWk2dnhMVTdUaFU3MWJmYW15YWJJK0ZWRkZ0?=
 =?utf-8?B?UHRzd0JOb1RjM0poaTNuNDZjYy9yMjdrQnNLNjBLMUtLLzQ1SExYdVIrMjVD?=
 =?utf-8?B?eFlZWnlIL21wNjMyNHBWQ1JFMVJUYXN5cXJ1UDc1b0U2WlVHalZRdDVjdmdB?=
 =?utf-8?B?S1hhWnJCeG14NXZRM0ZEWU9XMmRTTktKQjNGOEExQXhOWTl3Y0p4bUdCZUZV?=
 =?utf-8?B?SUhET0NOaXlzWFlBRVZSS2NzMTZPeDZoU3lEdndRdDRoUFBzYldDYU0rT2wx?=
 =?utf-8?B?QUxXM1BtN1hqVFpFckdQV08wU293WXYzdXpTbzNEWmJmTUZhUkRNTXBrYnNI?=
 =?utf-8?B?ZzU4RTlsWnlIOVh2NHQ0WlhOKzhjS0xxc1FTSmlScGdib3luZXp4ZEZWSE5k?=
 =?utf-8?B?MDA0QXphdFEvTXpWd1Z3YmRETytUTHVsR210YUpUdSt0QWZQWmhaZ1c1QU5F?=
 =?utf-8?B?b3ROd1hMNzVDQndnWFdLRFp5VVJWMmhITTVJd0U1RWRvNGxVaTlqNEsxVEtS?=
 =?utf-8?B?NExzeHRvczdBamxUTEtLbm1oTDVoZGpWRWZFU0V4VHE3c0xrVTRxQjJQVW00?=
 =?utf-8?B?dXNNdjdFcFlialdjN3A1R1dNTW5RNjVsNGpFY01xSnVGMWtCSjd4Y0xvWDFK?=
 =?utf-8?B?QkI4eWRmZURKT25SQTRKcjdvSTA2U1ZmNmVyRENEV1UydzdObzV4bWlFN2tz?=
 =?utf-8?B?aHJVQ3BCbkFJRW0xek05ajRTSEVKMGxsTk9rL1VWYWs2eDZJOElpc3pQVDhm?=
 =?utf-8?B?Qm03cU9Cc2ZLV1pvTG9BdEVZSk9XT0IxSkhaazVOODJSa3JtbUZyNFdidlpT?=
 =?utf-8?B?UGd3Wm1HbThrelhGaFdJZUkwbVpKLytDOXJpQ3Z4Uy9SK0I5QlBJSkV5VFpM?=
 =?utf-8?Q?UXXCkZeVegkbUZ+3vxd8y/w=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303062c5-3014-4161-2196-08dd5b152b03
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 12:07:43.3870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uJL4BL/zvoh22LQng3sL/rYa8h5UxwcZne8V06BnroFPcRdsr2ItqkjOKCCuOSHwrPN8dHJd+SY9uySkwEoL/DuZoIX4xiMlQq+l3EuI7DRSGM5Cp0mhsxPzc3C2624Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4699
X-Authority-Analysis: v=2.4 cv=F6qtdrhN c=1 sm=1 tr=0 ts=67c6ed14 cx=c_pps a=1mby/iHf9ieL9308fKykyA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=RWHzBMP3nxXN3IsB6V8A:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: GoPoyzwuL7FtP518oIa7BNh09kfx8EJ_
X-Proofpoint-GUID: DLhfbRRu2Bhb-sELg0vvhQ4SeC8se08n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_05,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503040099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Mar 2025 12:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212264


On 04-03-2025 16:37, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 2025-03-04 at 16:04 +0530, Varatharajan, Deepesh via lists.openembedded.org wrote:
>> On 03-03-2025 21:04, Deepesh.Varatharajan@windriver.com wrote:
>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>
>>> -----------------------------------------------------------------------
>>>> thread 'main' panicked at src/core/config/config.rs:2047:13:
>>>> setting build-target.llvm-config is incompatible with download-ci-llvm.
>>> -----------------------------------------------------------------------
>>>
>>> Disable the automatic download of pre-built LLVM binaries, ensuring
>>> compatibility with local LLVM builds and preventing conflicts with other
>>> configuration settings.
>>>
>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>> ---
>>>    meta/recipes-devtools/rust/rust_1.83.0.bb | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
>>> index 2bf87ba27e..ffbac267b6 100644
>>> --- a/meta/recipes-devtools/rust/rust_1.83.0.bb
>>> +++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
>>> @@ -129,6 +129,7 @@ python do_configure() {
>>>        # [llvm]
>>>        config.add_section("llvm")
>>>        config.set("llvm", "static-libstdcpp", e(False))
>>> +    config.set("llvm", "download-ci-llvm", e(False))
>>>        if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
>>>            config.set("llvm", "use-libcxx", e(True))
>>>
>> Hi All,
>>
>> Previously, download-ci-llvm was set to false. However, with the
>> following commit:
>> https://github.com/rust-lang/rust/commit/7d579046c80d3de3143dcb8b2db5640f95b5383c
>> , which has been present from rust_1.83,
>> it was changed to true. As a result, after updating to rust_1.83, we
>> encountered the following error during the build:
>>
>> --------------------------------------------------------------------------------------------------------------------
>>> thread 'main' panicked at src/core/config/config.rs:2047:13:
>>> setting build-target.llvm-config is incompatible with download-ci-llvm.
>>> note: run with `RUST_BACKTRACE=1` environment variable to display a
>> backtrace
>> --------------------------------------------------------------------------------------------------------------------
>>
>> To resolve this issue, we are setting download-ci-llvm back to false.
>>
>> If no other issues seen in the AB , we will send a V3 with an
>> explanatory commit message.
> Nothing was seen in testing so far so the series is looking ready to
> merge. How was the previous world build failure from v1 fixed out of
> interest?
>
> Thanks,
>
> Richard
The issue which was seen in AB is because of the following commit 
https://github.com/rust-lang/rust/pull/131372/commits/68034f837a39387e49fc7d7c5b088f5372a1127e 
,

When building Rust for a 64-bit architecture with lib32 enabled, the 
patch incorrectly prevents the addition of the -Zdual-proc-macros flag. 
This occurs because the check introduced by the patch detects an issue 
with proc macro support. The issue might stem from the 
-Zdual-proc-macros flag not functioning properly when lib32 is enabled 
in the build environment. As a result, the build fails when lib32 is 
enabled, but the issue does not occur when lib32 is disabled for 64-bit 
architectures. Hence for now, we reverted this patch.

Reverting this patch will restore the previous behavior, where the 
-Zdual-proc-macros flag is always added for building proc macros, 
regardless of the target architecture's support. This would bypass the 
check introduced in the patch, allowing the build to proceed without 
error, even when building for a 64-bit architecture with lib32 enabled.

Regards,
Deepesh

