Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682DDC7115C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 07:38:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10030.1750837105963728781
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 00:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8271d9b6d9=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P75wox006255
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 07:38:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqam283-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 07:38:24 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55P7cOPp021473;
	Wed, 25 Jun 2025 07:38:24 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dkqam282-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 07:38:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=umBFc65GXJVcbpdwMBI4b4h+gcRf1j1zkUb9Mt0u8BHQBFu1xJM0s+ql+lW4a5OEaIe40tcmD5vm0bzvac9PIhLAevz4SzaZvqabvYg4v+sVmQePScw3eC9OK6febHuhKOh1MNlq09hrA3Kj3bswX6c0ja7Od/CjuqBJJ1HnESAh2hm10VjsttUYHxiGrZg69sf4rcGo5MA9PyYxrfCFpyaQenFY+me4Os4dxvW8N/guJMzkrbRC+jUyR8JNsi1688kF2DGrz38k7yDZavRmxqwxs2vznYmcJ3YU3+q3D2kro1sMFy4Iji9CPuuejZcicvR0gVBOwDwzgfaD4rw3JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5tq4cJkjl1DC+Ep0noc4TAdogMDycLNmchvv946XRk=;
 b=rm3pWFxEZ/RrOsu4GaHu91uCCPX+VdTMFA1TxmYhITQoLSDTJ+kM23jdPtPNpp3jM5yZfVb+Uy9CQioSW3Q50PNFv0K9ZYtHY9sHEQ2NAEVpe9Fvg6nXIp/8Eu4L02ggtpqELCGbdXdGfa/HFkzfHe6gOybicCp7eezF9Yq74x+3xM8JWlv4eo0bdDPDVo51pxsbiLWpp5SFmUPdaPTvr2WukLBMKHvnGjASH1/ZKgF71T4UoHGgb0Zu51j6ioa5XTCyVwCZbdQDcA+nkMMCIfluzGZ7OAzmzGT6UsY/Lzj+row6oI2Cc9DXzNL0DQXVsJDJ6iPjOoJg581Q43p3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 25 Jun
 2025 07:38:20 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 07:38:20 +0000
Message-ID: <56f19ece-1243-4708-95d2-d6e7eb7af2f3@windriver.com>
Date: Wed, 25 Jun 2025 15:38:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RESEND][PATCH 0/8] fix runtime versions
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250624104155.559827-1-yi.zhao@windriver.com>
 <CANNYZj82+jT8iUCnSdXdD17hGf_O0b3iXzFhxx+mHGcdQs6L-Q@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj82+jT8iUCnSdXdD17hGf_O0b3iXzFhxx+mHGcdQs6L-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0202.apcprd06.prod.outlook.com (2603:1096:4:1::34)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 8800cf09-ab18-442f-6cba-08ddb3bb41ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3hpcjVvdGVPY2ZOUFdudERONnFGRVlzTnRINGZaUzJmMWdRM0k1MWNVcjl2?=
 =?utf-8?B?ZVZkWEw0R3pDL1haUlpKNzlHN3YwTVR2b3E2ZnFHbmhoQVc5SjRTNjl1RHpR?=
 =?utf-8?B?bEIrSkRDVk1Lb2U4WGR0VEN5SEdKWXE5cVdtVHFVcDRqaFZSVSt5NEo4SDBV?=
 =?utf-8?B?L2ZQdGo2YjVvdTRnNUp5dlY1cGE3UEV5dkR4LzcyMUw0TUpOM1lybm1rNnB4?=
 =?utf-8?B?RmN0azk0N29qNzEvalJyWHBCVnlmb0R0YThWZFU5Q3NKL2pFcW1nL1k4Y1U1?=
 =?utf-8?B?ZThxL21Nd08xaFYzMTNCYW1GbkloWVZwTlRMSWdGK1JPV3lrRGhLQXdkWXFL?=
 =?utf-8?B?RHN6SEVGamtLdFZ4c1BSU09NWmlvcW9OSk5HWEtUM2puZ1ptbHRFWjdvV09P?=
 =?utf-8?B?RnZjZVg2UmlMYlpCKzYyMGROL2V0RDNDYldUSXFUN3NyalQzb2JPVnBaQkkw?=
 =?utf-8?B?dlNMUXFCT3RtNkprT05NOHNBb1k4aklseXpTY0p0dHpNNzJCRjhLSmtTTGlP?=
 =?utf-8?B?RFBqRm5QZVpHQjhYR1d1OGZyZFBLRndNQ1ZyMnE3eUx6LzBWNU1mZDZjYm1a?=
 =?utf-8?B?allIeFNJK1JOelhrMGpkWStsZHdkS2hJYldvTmZjUFlDRFdIWE5nVXpiSVZY?=
 =?utf-8?B?aDh3Z21icjlYNnpXQmtWUHNpK0JqY3daMWNUaHdiT2NYenFnTHNBMmRldnlr?=
 =?utf-8?B?TDJvdnJLWVJ5R2xVL0VQazNsckJxaGtwMHhJWnRNOUN1MWRWNDVoYnRHSWZn?=
 =?utf-8?B?L1RvdEJFSVUxb1NrcytHNmluQUp1UlNVOHpwTmRQZFIxMHR1Vm83TUliQmky?=
 =?utf-8?B?L3djQWhjam1NOWhsTXRzWG93YjhDWG9NRHJhU1VNcXl5amhrWWdJcERoc1or?=
 =?utf-8?B?WStZZkg1QmZmcTVvRVBmL0JGRGhsMzRlZGVRdEVsa1loM09IZ0JoRWZDRUhq?=
 =?utf-8?B?RTNiQVNBQU15SkZsK0NaL2xEREtUVHlQRlJFRVJOalE2S3Irb0Y0ZFMxQUdo?=
 =?utf-8?B?M3VRbVlSQmFPOXNmSTd5Y0ltclRSNEtGNk12NWpoeXg1ekNXbXIwRFRyaUMx?=
 =?utf-8?B?RlpiQTAvR3AyTjNrelRSZ09kNzVBSnZOVW4wVVcwKzhBZGp3YjR1cHR1dEVy?=
 =?utf-8?B?UkdBTnpxeWQ3QTJ0SXcxVzRaY0VPQUErUG1SZlN4dmk5M3VNVjdmY3N3SnBF?=
 =?utf-8?B?NWpTRUdiUnNyL21Dc3BuaVVSTDI3TjUveFVtRTBaMFdsNXY4Zkl0NXZWR1pw?=
 =?utf-8?B?VjdHVkpCcUo0dzUyR21NRDNZNmRBTWR5RWdHR2FRVE5Ma0d4TXlIWDgybDFG?=
 =?utf-8?B?Mmpzb3lGak91bUhRR2N5NEVnQTE0VzU5ZWhCKzNOc3VVY1loT3JyZUxTZU1F?=
 =?utf-8?B?RDJ6YlVIV1FVSEhhamxYeFZFTGVHUERlNWhCT0ZMYjVuVVYvQmVXOGRUZWZI?=
 =?utf-8?B?eDBydlRiUmVaRnpjY3JCV2pjaFR1MEZkQnpmTm1yQ1d2UU5oUi8vbXdCUGtO?=
 =?utf-8?B?R3V2Vk9XVjREVWFxelU4RFVNZHdHb25UdlVJRnNzQlNqV3NDVXozK0lReGtC?=
 =?utf-8?B?djFJVDh2KzhDK1VEWHVUR1B2YlgxN1VJYWh6dDl4UGtwdzM1dFNocEtvbXI4?=
 =?utf-8?B?b3kyMis0NmhuZUVzbkFQMlJSRXdxdElMS2pCK3ZCUzkrNHN5SW1GQkVMclpF?=
 =?utf-8?B?alJWb2VtRE16MjZDQUNGVjZETzBFTXNYb05vcFptN0p3U2Z5cnhVRkpjVDFn?=
 =?utf-8?B?NjZBOEpHMUpqMmJxN2xid0dZdTBIYnEvZStUZlJVMVVYd1BQbDJnQjc0VGFy?=
 =?utf-8?B?K3BSREdvZXFheUxJdllSZzFYRTFHV2hVQnpJMjgxQThxT29STUhiaDRoUmxu?=
 =?utf-8?B?Yy9tM2x0VVFQcGkwSS85dU5rNDV3WC83OFZJNWw0U2Z5LzBhMnJLS25YeEl6?=
 =?utf-8?Q?kBk9kwCP+Zs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OCtVMnlMdW9QdENDRVR5aUpzWW1uMHo4bU9FV1NjamNuWUtoR0ZiV2NxbzFw?=
 =?utf-8?B?WllXU0tvRFhqOXUrcGIwMnBVOXlMMzlVUzlUVzYwdmdVN0dNSW5WVHQ4YWc3?=
 =?utf-8?B?K0NCbk0vRmIrc05PeG5tVFY5Smo4a3F4c2RLRGxCRDFCQ2NsNTJ2RTBzZ3dS?=
 =?utf-8?B?NkdyUU0rclorSnkxQnlyUytiVWk0UENKaXo3TzN4OStyakg0MldKYkwwSHdn?=
 =?utf-8?B?cW5nL3UrNk5ZY0ZJQkQ4dXliaHEyMC9WSUIyODNyeFhwbHF4dWxSalI5ekxE?=
 =?utf-8?B?UGFXakVnS2lEYkwweDJZT2J2M2s0VUJzWE9ORzFkVFB6TEdqNzFPNjFxbkpp?=
 =?utf-8?B?bG9tN0NBYW5MajFxdlFOVW5rYVJ6RmdLcG1jYlNUSUtaSnVyc0hOemlZSk1W?=
 =?utf-8?B?UTZ1SWFSbmZUTC9Nc0hkWS9venUrNlI2KzZmdzBQN0hjVmJhZ0hJS25ocnRo?=
 =?utf-8?B?UDN3OXNzYjlVMnp1aW9rSTh4aWlFUnp1K0c4eFNUbytPeno5LzJqdGpBaW44?=
 =?utf-8?B?bzZVc1JEOXpMcXpoQ0s5Wk51RzBQa2JacTBoejNCUDM3ZG1FLzByRWozZVhw?=
 =?utf-8?B?WnhmR3RvQzJIcnh5RkxIL2FheHlLdFV2NjB3NVVBeWZwTlpBN0pIZEU1ZzM2?=
 =?utf-8?B?K3QxYm9la1puMVNrRkxjSWljR29GNjdsbmdUTDJYTlZaT3BKRWx0NU1hOGZE?=
 =?utf-8?B?eEFkWWo4aG8zdE4wWHc1NVJpSnpiSk41aUM2bVhPWjFIUDJoVXdzZWt4YWRV?=
 =?utf-8?B?MUZVcW5FTEE2MDc3WjY0NjcxYnNEVVE5c3VSZFNJMEZ2SGdjV01YZVhQYUU2?=
 =?utf-8?B?cUdMOUlDeHl3SjE1NXRQcWJoNXkyb3M2SzVKNmRPRGNNTkt2SFZDSG5zS0Y2?=
 =?utf-8?B?c3N2dktsMEltR0dNOVpCTVJ1dHJZdzRWZ2pjNCtuVmFaL3pFTGp6ak9ubjdR?=
 =?utf-8?B?V25SRFhvSURiaHZ1QU5YV0hGYjFTVHQ4eEFSRW51Wkd3eDFwcTlOcUo3TEVL?=
 =?utf-8?B?cHVweEU2cnUxU090Qzg3bnBHZUdYZjRDcDhnMkVXNzI1RlRFNEN0ZFZiRDYx?=
 =?utf-8?B?cHN5YWN0djBwb0RPRkRIUzlOaUlNWHRoR0FxeDZVelFULzY5VGF5cklYQURV?=
 =?utf-8?B?MnhkcDZLUWdEWVpmZ0xaRnNTb3k3R1lyNjlFd2l2SXdPRi9NYkhxQjZuNGVp?=
 =?utf-8?B?c25zRmZDT3JhUGFXaFRxamRHL0hON1VRUll0eXZCS3NZMERZTHAwZDNabzds?=
 =?utf-8?B?b3pCOFY5cy9FY1BkL0NCRkZCVXFNUDNNYWt4cUlPMkNsdzAwY0hYdkpPOHpi?=
 =?utf-8?B?Nk1Lb052R2dMamxiNVdHZk8rNVJaTEtwZEF1VGNydHdXbFhsb3pYK0FyK1pq?=
 =?utf-8?B?aThQYmFLOGZWRlU5Mk9ub2RNMHdab1Zva0tYaWRGK3E2UXBJdk1qL1ZTd0tF?=
 =?utf-8?B?S2NXelJZVmJUOHFnL2RuTGVDa282amtadDRZWDR0cVRpV2VwWFhuQTYwWkky?=
 =?utf-8?B?UndoSHhvMklmYUNTbzkxSERiUCtHTkVJZ3FLMUtmNlgvaFlaTnI2ZVlZNUFI?=
 =?utf-8?B?N1lYdFdBY0x6eWlYUzZySUp5UGlKdEFDWDkzYkpCR2hHdXNSVFEraExEa3RL?=
 =?utf-8?B?Rzk1SlliZGxneTl1RVlZZENaemU3SXZtNVRhSFl2c3ZGK0U4Ui9ueVg1TWJm?=
 =?utf-8?B?N3FQUi85YTFoYi9zYWJ0R2ZOUG9zMi83VGxUdkNLWjE0Tmx2WC90V3JQQTIz?=
 =?utf-8?B?Vml5U2ZMcTlxNXRYbUFNSTROY2NhdEZmd3ZDcENEdk9uOGxxbXp2WlJ5WUhp?=
 =?utf-8?B?TVpUSStlTmdWTURPL2QrMUYwVzFUank3cE9tbmU1REpEZkZjMW5jb21uRXht?=
 =?utf-8?B?ZnNpbVYzZE5sb0h6Sk4xN05yVjdNY045Sk5OeWVlNUg4SFpscEczeDNrSVhk?=
 =?utf-8?B?cXl2ckFQWWNnR2xZQUZXdktJdG5pQSs4cUoxd3FmbllCUmhKZmlEbHBMOVFM?=
 =?utf-8?B?Kzh4YU1RUHFFL3RlM3hWSGpBQ2RQUkI2dHJLN0lkY3hORWJqeW51YmR2bmlk?=
 =?utf-8?B?WnJ6U3ZneEhrMnNYemIxWUIrVSs2R0pVa3lTeWZDSmxwSXlXSGZYVFpyNWVI?=
 =?utf-8?Q?FSmZ36Tuv3e/t+o+SefL28lDb?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8800cf09-ab18-442f-6cba-08ddb3bb41ba
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 07:38:20.2894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qdVs/cTl/G0cLQ8WMTNu6EkB+UvOwYxkzUI6HsvVtpmmZO/ZK2dpYkeKw2zWQSZxZlobB+6n3telXEcLT37nzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
X-Proofpoint-ORIG-GUID: 8zIG7TIYLf6Qnv0vLDlnzasHqhfI-ADI
X-Proofpoint-GUID: Ugkeiky5JRXzRMCBOKr_X0b1d63wcFIS
X-Authority-Analysis: v=2.4 cv=N/IpF39B c=1 sm=1 tr=0 ts=685ba770 cx=c_pps a=ngScqOCEdLrCZ1H4VCpMTA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=tHCDFI7BpzwFzyN_7-oA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1NSBTYWx0ZWRfXx96IpNYWQI8+ o16G7PJV7ssKeMi/kTU64EeCfFf6VewROoX7ahgQOAIn4uu+yJoOIeI5qpYcyQOCcElCllbGTd7 4ojY+5wLLKKMQCDw9VmdSToB3VvzgYX+43hFreMJTydTlQKaUM9sgC74PZGkdvc6y1XsT+FtxOk
 oaBzYHRvSjZlO7HK2GQMf3UxF9WERIMPGCxS1yH6GZw0LAByzY1/ih9IDsVDMSEDVJYhVtNoyF2 G8c2KEn7t1cI+3m1TXMgIrAytXTiwllQ2UpPlAt6aMHBitIobO9fZCLcPSb9joa/EQqAYBA+xmk EwXEoyO9BbAxNSOrDAP5lsMYCYOaLKXYb06dra6B7Q6UXh5wOB4knIvDVd3rxSpWJhPZTQYVIJE
 3l2IY7s/hCnnZQdEDfR0YfA0+56onPFXbhLoZ8Bn96aP++r4C3gILRAmJvjfSsS5e/X9JdOj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250055
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 07:38:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219303


On 6/24/25 18:50, Alexander Kanavin wrote:
> On Tue, 24 Jun 2025 at 12:42, Yi Zhao via lists.openembedded.org
> <yi.zhao=eng.windriver.com@lists.openembedded.org> wrote:
>> This series of patches was sent in April. Ross suggested discussing this
>> with upstream to see if they could update the scripts to address the
>> issue. I talked to upstream and they declined because they believed that
>> "autoreconf may result in different built source code than what has been
>> distributed"[1].
> Is there a benefit of carrying these patches in core to the broader
> community? I don't think anyone's particularly confused or misled by
> 'unknown' reported by executables at runtime, we have procedures to
> verify that what we build is exactly what upstream has released, and
> various built time reporting mechanisms to see the versions.
>
> Wind River obviously has invested a lot of time and effort into this,
> presumably because it has a paying customer that is obsessed about
> what executables on target say, but I do struggle to justify carrying
> and maintaining these fixes.


This is exposed by version check using check-version-mismatch.bbclass.
In some cases, a mismatch between the runtime version and the build-time 
version can cause confusion for users.
On the other hand, this suffix does not exist in other distributions.
I will follow Richard's suggestion. Use a more standardized approach.


Thanks,

Yi


>
> Alex

