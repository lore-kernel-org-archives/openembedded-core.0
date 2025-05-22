Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86ED8C54E90
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 11:37:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22005.1747913865750559874
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 04:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7237c3be41=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M9HYl6017659
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 04:37:45 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrafhj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 04:37:44 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54MBXsY1028463
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 04:37:44 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfrafhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 04:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bc2yiKj38jctj3EUptqsnj3H+8O6Tcx3eXSmdf34qYBngdPCOrK72KuqEU329l043nVnd96mkF8G5KtOzSkRQa63RsYSb8ubXpmDn8ZN4QXCIFQHibVa+VzQKbBNMuH1x7cSTfMB8btUbZpGwh0U7BXJPHi8A+DAWE8RTAMznrF5NIq+4iEwSpbEt4I6SYTZDYxFMdeY9q2HMjA1gDhK+xLWE3+CqwTR44jTmB7L1BtKutnMj16j4MmAkpb2Ld0a0bE4KppSQtOlQBiXSwqMGIkCzxVOCGad5Mz0ev6whRsA+P8feSlDjJvjg52kRVsIjJ+TNLea4FSuWvQCrlDtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIorA5/9eFO3cmFtwmcMpJYF6cRZ/zg4yesIr9bc+XI=;
 b=M+RL/QySgllwlfrQ95KmBOKUo7NNQUL7vcLKLXyaGyc/GoXXiaighzkJYHfnBgEWky013NatUVkv0EEiOXpELsHvmFQFoxtSKpCIH7Ev/JXqvGg86pNIsUTmqRyq6n/biQDyUpcuSrJbHomrH1PRZDmF1SBuyuYdhgB7CWjUgKJI8xteqNDkLgNWZYYtbhc/aqmPiyyJ3PHy++zUemP1uworcSrMs7tc7XT8VWbunGR7j/1QQssH7hqYvTexQrKaxtTNWPtwOrm/QiEbiVrH1V8H9dYAtbJmrxrjkf9SHgVDnoDdojeOoXowavU5m/FoBWLbjFY24ylulmCJUc8NJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by MN0PR11MB6033.namprd11.prod.outlook.com (2603:10b6:208:374::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 11:37:40 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::7cb0:dd30:85d3:8f69%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 11:37:40 +0000
Content-Type: multipart/alternative;
 boundary="------------goJF4lfGSaEjejsoAH9C0EvE"
Message-ID: <88b2762f-a1e1-456d-aab3-aca83ed3e14d@windriver.com>
Date: Thu, 22 May 2025 17:07:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [kirkstone][PATCH v2] gcc: AArch64 - Fix strict-align
 cpymem/setmem
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com, skandigraun@gmail.com
References: <20250521115945.3629052-1-sundeep.kokkonda@windriver.com>
 <52ac2533-4b64-47a1-b4b4-0ea43ab2f25a@windriver.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <52ac2533-4b64-47a1-b4b4-0ea43ab2f25a@windriver.com>
X-ClientProxiedBy: MA0PR01CA0121.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::11) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|MN0PR11MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f1ea4e0-eb37-4972-218f-08dd99250ed9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|10070799003|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aXhoUm5kREtORXduTjlhbDlJWVV5Z0RzZXNTY24wbTNXOTZxRUZ5SkE3SjdZ?=
 =?utf-8?B?ZEM0aGNwZjc5QzhJVTJndXBnOVgrTXJ0Y0VvOHFOUFNnTHcwaGZvUGdSSC9C?=
 =?utf-8?B?WUNvZ2N0dk9sRnZva1EvOFA4ZzR5U0FYSm1jSDZEekpRV09FZnNmYTJpTk9R?=
 =?utf-8?B?ZEpRQjRhdDk1eTJjQ1kxMi9zYll4MXVUSzR4VFVTajBiMFR3TWJIcXhYdW1T?=
 =?utf-8?B?cW5wbWZtbUN6a3EzZFhNdEd2QmYyVjVjOUZ4NTZDU1g5b1lGWkJFNWJUQllt?=
 =?utf-8?B?MXFFcVAxbFZ2dUUvT0I2ZWplZUFVcm1JbW9HK0hXNllaV0xJeW1qNHZZUXdj?=
 =?utf-8?B?YmNQeTFHL0JKd1dNQ2tkOSt1bFhKTlBzekxLU2orZzFaS3NXcGN4ViszMFgv?=
 =?utf-8?B?ZjFlVG03NnB4elIxMGh2Z0swaEZQWFljU0JwS0EvVUdFR1JvS01mdFoybjVT?=
 =?utf-8?B?TjFHYUtzYjB3TENtSFlFMEtLZEx6RFY4T3JyWkliQi9QYnN5TlRYeVdYS243?=
 =?utf-8?B?d0d6akhmVlFzSlZCTFhwM3FpelRvUE9NSUxXbHpwT1ZGbGdneGlOb1dOaDlC?=
 =?utf-8?B?aWYwbGhDTmZVa0JIMzlLYWN3V0VlWWF2SE00WW9HdXlOd2owT3lYZXZvcVF2?=
 =?utf-8?B?SlJ3ZnV5TXdRT2NxUjF0QjE5ajVnTGxaWVdUNWZhS0RZU2R1c2txK2dFelc0?=
 =?utf-8?B?Nnk2MG9YWFUyRVNiK3hrY2VCOHFDTWFNeEpFc3BRVjZGUmxPdjFyN01hRnRt?=
 =?utf-8?B?SEtRaXN4Ti9aVTVyNG5zS2ZlcFV5V0dxMEN4V3p3WnN0Ulk3UDNrZHJCUXBF?=
 =?utf-8?B?SW1LZm9sN3VIc1V6R1k3Y1JUR0JmMWYwYktHdHlFV2toczNhSjJqYWVtRXlU?=
 =?utf-8?B?bWxDK09HTGlWRTlXelF5NTVMS1NCYTAxcVVMSDRKRmZSR2RxN004dHNwTDdr?=
 =?utf-8?B?R3JTeTl4eTQ3K1NyNTFuOHJzVXVPQ3hKMWs1U1l3UlMwd3BSRDIzaDlvQ3hS?=
 =?utf-8?B?SGROK1VwUnNJNXpnbVUyOHhSalEvMHFTV1dSaTVSc1RiaGlqeDJoSmdtVVVJ?=
 =?utf-8?B?VWNWMEx1WG44TmhuR29YUmZQeG1jcWw3SWQ3blpkS3B4TUlSTXVtSnpncXE3?=
 =?utf-8?B?ajdMb1BDQVhyL3BpbkVsNndtM1FrZnc4aW1YT2g4eDIvbUJnSE56SW1MTmp1?=
 =?utf-8?B?TzR4OHVkQWwvTXpJbWt2VWRFMWdqOHJLUlRSSWxnbnFPNTd4VkVwTExzQlFm?=
 =?utf-8?B?NDBVSWU4c3ZxNGM0cHFYcWVKOVJwSXBVV2JXcDlTSEU0eEpHNkpLZUdmTkpD?=
 =?utf-8?B?VEh2SW5mSXJXVFNjY0xLQW5jajUwM3p2UmEzalhMemZZR3d1NVlqMVhVYWVr?=
 =?utf-8?B?Sk9wZTRSL245L0tnRmxmVCs4aVlqYlBRckFGbmpha1huWkV0VDJXd2pHK0Mw?=
 =?utf-8?B?SjNiVjNLZG5yQnhLT0RoQ3M2RVpWMFhkNDFTOUNzdjh5VThySUZkVHB2azBj?=
 =?utf-8?B?anhUNkFaR0czbXhaVVlXZGhUL290V3JZUVVlMW1tdHBNdTFhdXBwRjBsZ0hF?=
 =?utf-8?B?QU10NXZ6NWI2M3FYQllNWWliK1JnYWdibHYwZmFqUXVXMUFoMTV2VUJwMVZT?=
 =?utf-8?B?RDg1eDhEcDRKQXNKS1ZIZjRyemNYZENTVDhsSERtSmZFR2MzKzBtS3d6M3ZE?=
 =?utf-8?B?bVdRWW42NWp0cXZSYlZndnA5MFNCc0dJQnBpS3V2Y0dySFhlMFhQSGREbnhI?=
 =?utf-8?B?enpiMzFPd0krWFBwZDF5a3o4RGU4Q204UUNXSmVLVmVJTktwU05acDdOaFlQ?=
 =?utf-8?Q?NKkOvdM5Uiy9gQuPhSkHderQkNoZcsnG8UpXw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(10070799003)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RVRXV3l3aGRuM0FhZUNNemVGVHFkdkUyUWNnMS80cGVFaFVPeElzTTNVQ3JB?=
 =?utf-8?B?czB6OUR3Q3pSZDBhUVB1aE8zSG9qSGV4YUdQTmVKSkRsaHJjeTRHUW00a1Nn?=
 =?utf-8?B?RUtqcUxpRGpONWQ5eWxPRGJPaS9INHhvYzlLbVBjZkE1TGNncGRWcGlCeTRu?=
 =?utf-8?B?RHFEVXB3aERwZVNRb1liKzBMNzV5VW44NEVmTlhaNWdQbXRHckFEb3M4clhO?=
 =?utf-8?B?NUJsTVZtUHJuOFRXSWhaS2lNbVNSOFY2MzRTdjByblBnV0o2WHNTSk9PeDlY?=
 =?utf-8?B?eHdub3JkTVJtbzE3WWNIK0tuS2xCeUoycVRKdmhyaGpNUVp4NUoxQ2RYRmdX?=
 =?utf-8?B?azNXSHFNMG5PUFJqYkVaNThjNXR0K3lpMmFPcWhIbnptZXhqc1VPMzdLeEFk?=
 =?utf-8?B?WWZCRnF6bDNjLzkxeVZ6eFQ3VnZMcGNOWHFKNHVQNGtvM1BFMUh4ZDczTTZv?=
 =?utf-8?B?QXVtdGZRZndNOFRKU0NoQUFvSGRSQ3ZSTklQdzdRUzBhSDlYakkzdmlWZXV0?=
 =?utf-8?B?bnI3aSs2TVpnU0RZU3E1Z214bFJYbHRCaHdtKzdTT1ZXTlM4TUR5VjhVYjZi?=
 =?utf-8?B?MDhZek9zVHJJc0xLL2FWZUcvUkxqRk9lQWhXcU1uWnR0RnBBTzIxRjVPZDEr?=
 =?utf-8?B?VHo3dmpVUGRGS1lnQ3ZFYWYwVHcrbFFTSUNxWDdUS1V1U2hXcU9hd2VuRGFS?=
 =?utf-8?B?aGFCYUtoVTRlMG91ZlV4SWFhbjlGcVN6dkhNUHhTa2lBYUNpRWZCR29hdEhk?=
 =?utf-8?B?aVFvQWlVTWRWSGx3bUFmdk1hRWFiMHhXZUlydUo1VGtXSEN0UXB1UkNoR0ph?=
 =?utf-8?B?b3Myd0k0Z1lmV004Wlc4VzFnVHhjUjBPaThkK25saXBVMk8wUmUyUDU3WDZ3?=
 =?utf-8?B?eDB0N2pYV0VQSVlqT3l5Q1Bxank0QitFdDUwVVcxaUpVWCtIZjY4UU1wcWVH?=
 =?utf-8?B?c0ZUR0xLbW8rbzhnVWdKYWE4eXpJc01kR1M2TGxaVVBIUmVlVXZURDY0QlE2?=
 =?utf-8?B?azhielo4bW9CaEUzNm5EZ1QzUWtveUE5S3NMeXRaeHVReFFQSi9xdTB2aHV1?=
 =?utf-8?B?SHlMT0NUeWprS2VMTFFRMExCZXBLWGJhUnFIODRJeFN4MWpVcmY4U3dUdHM2?=
 =?utf-8?B?azBMZVBaWWdidGkydHBLWW5uY3k5eU5LcGNIa0FVbnoxdm9TWWkxUklPZHdt?=
 =?utf-8?B?aWhONG0vSVV6NlJnbDJDNzZzRFNzOEJJSVNhYVc0VWNyeEE0RXcyWmtVR2Vl?=
 =?utf-8?B?eXZiSThDR1ROd2VXdGd3OE5tMEVTMXR4Y1JmbksxT1MzbFUzbklZSGZjQjBU?=
 =?utf-8?B?R2JrQjhMYkQzaFh3dmhpT1FDaVpJSHJGTGM0Z0xTOXhSWkt0RWxKdXZrNjFY?=
 =?utf-8?B?VkdTNkMzV05qTHNjZHhtTGNWc0pWMkF2ck1zM05MRS9sS0owbkN3bXR4bXRR?=
 =?utf-8?B?MWJGTGxOVk1DNi80V1dJczYxdlhHTnZEaFBNNWV2T3NOWVg3Z01aRjhNUVRZ?=
 =?utf-8?B?T2VIaFVYUVF2ODlmM0lWNHdkUSt2emxqb3FjenBEeVhYNVVSVUxaN1RueHdR?=
 =?utf-8?B?TGdZSXFDMWVRcFpZcnY2OGpZTkhaUWFzRUNORFpNZ1dmNHl4dmRxNGs5b2lj?=
 =?utf-8?B?VWhzS05WRytVYjRNQ1FtTTJpaDVmUUtvWXlHTGlhSVk2TmpUQjIyM21MdTQ3?=
 =?utf-8?B?Vlo5TnhhUnZUU0NJbW1OWWNUQ1JMS2pPTWpoYmpIaS9qaFRhenMxdEEra29J?=
 =?utf-8?B?U2dGU29zQTBka250L2tFNzg3cHpJSjRXZGVJdW5CMTMxaEdOVklTUTFLRWtF?=
 =?utf-8?B?eVhESlhqRmZPZVF4alRYd0FHYWpPR01sSmlXR0IwTkFpTW41MlViYlJ3Y0Yw?=
 =?utf-8?B?UnZRc1V5WCtwN3M2Z1ZSZHF1bVgvT0g0Q1pFUmhOc1N5cW1EYjh4L011MGEv?=
 =?utf-8?B?clMvaDgyamlVWTNtNUFxUkpJdFRtSEJsc1c1MzJxZWxaSVJRRkNKQ0ZObFdG?=
 =?utf-8?B?NElZVW9uTkxaVFB6a3k1RjhEazVyVHg3d1lHdmVVaTI1MjZoczlSVkVvdXE4?=
 =?utf-8?B?MUZENFlZalBVQ05iZHR1TmxDT1AyL2kwL3hjZ05JTnNRWDZJd3FKNUREeFRk?=
 =?utf-8?B?SEhwelBmeXh4YzVNc2FhRnVjQytqWkwvVHJLSWVmTTZBbGkwdGh2R2wzN3Br?=
 =?utf-8?B?M1g5M3E1WnM1UXFPZXBQNjVxOU15ZjNoZ2lGaFhaN3ZLQ2ZZM0VkclNXL3Zr?=
 =?utf-8?B?TkRlTXhNWFVXd215RmQraFVkYmRRPT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f1ea4e0-eb37-4972-218f-08dd99250ed9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 11:37:40.2984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9a1ptHukiJfNT2S9SKDWJq1W/t1zwVoStPqtI7RmdQ6fLBYfvGzu9Kya1L/DK1ywtNVJMJfYFCWpYiN3/KoNIYlyNFunf4LzWT1H13d+rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6033
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDExNyBTYWx0ZWRfXxueDN0D8B1El dkyGBWqvYoXB25N33hANnuInXDXPzV8JO9Dw5SmDEyt0cdtlRyCSScLqYPBwGSBVLDmERGkohk8 2vN/4xyObo7gv3R/yKPlaPuQHYU5/yii3BYXC9OW6O1uP8aVKTnmLJF+Ya0knZbVM2BIBQ/qrHB
 G6PCcim2nirizKUiY05lhYrT2Q55NRIbXtPnXclrWSffDH+PLi6qi8CW0nC+bMBsE1Ls6n8sI/m AkJNr+LnaaLywGmCsuJOm5UpTLyLK9PQNxtEEyy4rkmMBKgcHfy2HdmRFGnJ5xhVOaecncpKjMG C9btfv8W7DhxvMSbNgN0T+QCOj2DcpbbS9ykyztMLLuZzcJIB0glZmtDfCUr2BG7nNh8V3arb/O
 DycKp/50ZAlQycZaJKqGxfpfvKMjAlOOgy7Cr7iCwWvhfqDncRY+ghRRB9SRMsv3ktQvV+Pv
X-Proofpoint-ORIG-GUID: LHsopWM1mY6xzA78_n8ceme0-fMrB4Ze
X-Proofpoint-GUID: P8JFb1Hy76hYDfO8HMG2OUkmFLTk3TJU
X-Authority-Analysis: v=2.4 cv=TrPmhCXh c=1 sm=1 tr=0 ts=682f0c88 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=CCpqsmhAAAAA:8 a=7CQSdrXTAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=1fE3wbWIHrnlGEXSoRYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=hO0lkUUjndcSgt8wMlwA:9 a=vGzhxvF-So5vWSCg:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=ul9cdbp4aOFLsgKbc677:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505220117
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 11:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217089

--------------goJF4lfGSaEjejsoAH9C0EvE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54M9HYl6017659


On 21-May-25 21:54, Randy MacLeod wrote:
> On 2025-05-21 7:59 a.m., sundeep.kokkonda@windriver.com wrote:
>
> It's good practice to CC the person who asked for a v2.
> I've added Gyorgy to this thread.
>
>> From: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
>>
>> The cpymemdi/setmemdi implementation doesn't fully support strict alig=
nment.
>> Block the expansion if the alignment is less than 16 with STRICT_ALIGN=
MENT.
>> Clean up the condition when to use MOPS. (PR103100)
>>
>> This patch includes only the alignment-related changes in the aarch64.=
c file.
>> Changes to aarch64.md were skipped due to non-essential impact and pot=
ential incompatibility.
> That's better than not mentioned what parts of the patch you dropped bu=
t
> it's doesn't *explain* why that change isn't needed or I'm missing the=20
> point! ;-)
>
> Please dig a bit deeper and explain:
> =C2=A01. what TARGET_MOPS means and does and maybe what the .md file's=20
> purpose is,
>
TARGET_MOPS is a target-specific macro or flag in GCC that stands for=20
"Memory Operations", that controls whether the target (e.g., AArch64)=20
supports specialized memory operation instructions, such as mops.memcpy,=20
mops.memset etc
In GCC, TARGET_MOPS is used to conditionally enable instruction=20
expansion patterns (e.g., setmemdi, cpymemdi).
GCC .md files (machine description files) define /Instruction patterns/=20
(define_insn), /Expansion rules/ (define_expand), /Instruction=20
splitting/, peephole optimizations, etc. They bridge GCC=E2=80=99s interm=
ediate=20
RTL with target machine assembly. So when we write setmemdi in .md,=20
we're telling GCC: =E2=80=9CHere=E2=80=99s how to emit instructions for s=
etting memory=20
blocks on this machine.=E2=80=9D
>
> =C2=A02. why was it removed in the gcc-12 commit,
>
There are many changes in aarch64 implementation in gcc-12 w.r.t gcc-11,=20
which includes mops changes as in this thread=20
https://inbox.sourceware.org/gcc-patches/mptee4mhon1.fsf@arm.com/T/#t
GCC 12 likely refactored memory ops which may make TARGET_MOPS obsolete?
>
> =C2=A03. why it's safe to ignore that change for gcc-11,
>
GCC-11 and older versions are still used TARGET_MOPS for certain=20
expansions, like setmemdi and cpymemdi. So, we must rely on its original=20
behavior to prevent unsafe expansion on unsupported hardware.
Removing TARGET_MOPS in GCC 11 without full backporting of GCC 12=E2=80=99=
s=20
changes would break instruction matching, cause ICEs, or expose=20
unsupported paths (which we have already seen with the build failures)
>
> =C2=A04. Since you are not backporting the MOPS part,
> =C2=A0=C2=A0=C2=A0=C2=A0 it might be nice to point that out in each par=
t of the patch that=20
> mentions MOPS.
> =C2=A0=C2=A0=C2=A0=C2=A0 Maybe that's overkill and you just need to exp=
lain in the commit=20
> log but
> =C2=A0=C2=A0=C2=A0=C2=A0 think about someone who is just looking at the=
 patch and do what=20
> makes sense to you.
>
This patch is based on changes in GCC 12 that remove TARGET_MOPS gating=20
for setmem and cpymem expansions.
However, this version for GCC 11 does not backport the MOPS-related=20
behavior change and retains the TARGET_MOPS condition to preserve=20
correctness and compatibility with the GCC 11 backend.

> I can almost understand things better now but
> I'll let you present it, step by step, in v3.
>
I'll send v3 by updating the commit log with above analysis.
>> All changes and outputs have been verified by the author.
>
> Is there a test case that covers all of this that starts passing with=20
> this change?
>
> Please explain how are you testing?

I tested the prog given in=20
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D103100#c3 on qemuarm64.

And, the generated assembly I get it reviewed by the author.

>
> ../Randy
>
>
> I looked at this a bit and found gcc/ChangeLog-2021 that talks about
> the introduction of TARGET_MOPS. This was done in gcc-12 and later
> as you have hinted at.
>
> =E2=9D=AF git blame gcc/ChangeLog-2021=C2=A0 | rg TARGET_MOPS
> d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1214)=20
> (aarch64_expand_setmem): Adjust for TARGET_MOPS.
> d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1215) *=20
> config/aarch64/aarch64.h (CLEAR_RATIO): Adjust for TARGET_MOPS.
> d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1219)=20
> (setmemdi): Adjust for TARGET_MOPS.
> d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1238)=20
> (TARGET_MOPS): Define.
> d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1239)=20
> (MOVE_RATIO): Adjust for TARGET_MOPS.
> d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100=C2=A0 1242)=20
> (cpymemdi): Adjust for TARGET_MOPS.
>
>
> 2021-12-13=C2=A0 Kyrylo Tkachov <kyrylo.tkachov@arm.com>
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.c (=
aarch64_expand_setmem_mops): Define.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (aarch64_expand_setmem): Adj=
ust for TARGET_MOPS.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.h (=
CLEAR_RATIO): Adjust for TARGET_MOPS.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (SET_RATIO): Likewise.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.md =
("unspec"): Add UNSPEC_SETMEM.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (aarch64_setmemdi): Define.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (setmemdi): Adjust for TARGE=
T_MOPS.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.opt=
 (aarch64-mops-memset-size-threshold):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 New param.
>
> ...
>
> 2021-12-13=C2=A0 Kyrylo Tkachov <kyrylo.tkachov@arm.com>
>
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64-opt=
ion-extensions.def (mops): Define.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.c (=
aarch64_expand_cpymem_mops): Define.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (aarch64_expand_cpymem): Def=
ine.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.h (=
AARCH64_FL_MOPS): Define.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (AARCH64_ISA_MOPS): Define.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (TARGET_MOPS): Define.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (MOVE_RATIO): Adjust for TAR=
GET_MOPS.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.md =
("unspec"): Add UNSPEC_CPYMEM.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (aarch64_cpymemdi): New patt=
ern.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (cpymemdi): Adjust for TARGE=
T_MOPS.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * config/aarch64/aarch64.opt=
 (aarch64-mops-memcpy-size-threshol):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 New param.
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * doc/invoke.texi (AArch64 O=
ptions): Document +mops.
>
>> Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3Db=
9d16d8361a9e3a82a2f21e759e760d235d43322]
>>
>> Signed-off-by: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
>> ---
>>   meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
>>   ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++=
++
>>   2 files changed, 46 insertions(+)
>>   create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fi=
x-strict-align-cpymem-setmem.patch
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-dev=
tools/gcc/gcc-11.5.inc
>> index f17ec9da5c..1e8371b2bd 100644
>> --- a/meta/recipes-devtools/gcc/gcc-11.5.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
>> @@ -60,6 +60,7 @@ SRC_URI =3D "\
>>              file://0029-Fix-install-path-of-linux64.h.patch \
>>              file://0030-rust-recursion-limit.patch \
>>              file://0031-gcc-sanitizers-fix.patch \
>> +file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
>>              file://0001-CVE-2021-42574.patch \
>>              file://0002-CVE-2021-42574.patch \
>>              file://0003-CVE-2021-42574.patch \
>> diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict=
-align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch=
64-fix-strict-align-cpymem-setmem.patch
>> new file mode 100644
>> index 0000000000..4c2d827799
>> --- /dev/null
>> +++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-=
cpymem-setmem.patch
>> @@ -0,0 +1,45 @@
>> +gcc: AArch64 - Fix strict-align cpymem/setmem
>> +
>> +The cpymemdi/setmemdi implementation doesn't fully support strict ali=
gnment.
>> +Block the expansion if the alignment is less than 16 with STRICT_ALIG=
NMENT.
>> +Clean up the condition when to use MOPS.
>> +
>> +Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=3D=
b9d16d8361a9e3a82a2f21e759e760d235d43322]
>> +
>> +Signed-off-by: Wilco Dijkstra<wilco.dijkstra@arm.com>
>> +Signed-off-by: Sundeep KOKKONDA<sundeep.kokkonda@windriver.com>
>> +---
>> +--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -070=
0
>> ++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -070=
0
>> +@@ -23621,14 +23621,15 @@
>> +   int mode_bits;
>> +   rtx dst =3D operands[0];
>> +   rtx src =3D operands[1];
>> ++  unsigned align =3D UINTVAL (operands[3]);
>> +   rtx base;
>> +   machine_mode cur_mode =3D BLKmode;
>> +
>> +   /* Only expand fixed-size copies.  */
>> +-  if (!CONST_INT_P (operands[2]))
>> ++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16)=
)
>> +     return false;
>> +
>> +-  unsigned HOST_WIDE_INT size =3D INTVAL (operands[2]);
>> ++  unsigned HOST_WIDE_INT size =3D UINTVAL (operands[2]);
>> +
>> +   /* Inline up to 256 bytes when optimizing for speed.  */
>> +   unsigned HOST_WIDE_INT max_copy_size =3D 256;
>> +@@ -23750,11 +23751,12 @@
>> +   unsigned HOST_WIDE_INT len;
>> +   rtx dst =3D operands[0];
>> +   rtx val =3D operands[2], src;
>> ++  unsigned align =3D UINTVAL (operands[3]);
>> +   rtx base;
>> +   machine_mode cur_mode =3D BLKmode, next_mode;
>> +
>> +   /* We can't do anything smart if the amount to copy is not constan=
t.  */
>> +-  if (!CONST_INT_P (operands[1]))
>> ++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16)=
)
>> +     return false;
>> +
>> +   bool speed_p =3D !optimize_function_for_size_p (cfun);
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux
--------------goJF4lfGSaEjejsoAH9C0EvE
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54M9HYl6017659

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 21-May-25 21:54, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:52ac2533-4b64-47a1-b4b4-0ea43ab=
2f25a@windriver.com">
     =20
      <div class=3D"moz-cite-prefix">On 2025-05-21 7:59 a.m., <a class=3D=
"moz-txt-link-abbreviated moz-txt-link-freetext" href=3D"mailto:sundeep.k=
okkonda@windriver.com" moz-do-not-send=3D"true">sundeep.kokkonda@windrive=
r.com</a>
        wrote:</div>
      <div class=3D"moz-cite-prefix"><br>
      </div>
      <div class=3D"moz-cite-prefix">It's good practice to CC the person
        who asked for a v2.<br>
        I've added Gyorgy to this thread.<br>
        <br>
      </div>
      <blockquote type=3D"cite" cite=3D"mid:20250521115945.3629052-1-sund=
eep.kokkonda@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">From: Sundeep KOKKONDA <a =
class=3D"moz-txt-link-rfc2396E" href=3D"mailto:sundeep.kokkonda@windriver=
.com" moz-do-not-send=3D"true">&lt;sundeep.kokkonda@windriver.com&gt;</a>

The cpymemdi/setmemdi implementation doesn't fully support strict alignme=
nt.
Block the expansion if the alignment is less than 16 with STRICT_ALIGNMEN=
T.
Clean up the condition when to use MOPS. (PR103100)

This patch includes only the alignment-related changes in the aarch64.c f=
ile.
Changes to aarch64.md were skipped due to non-essential impact and potent=
ial incompatibility.</pre>
      </blockquote>
      That's better than not mentioned what parts of the patch you
      dropped but <br>
      it's doesn't *explain* why that change isn't needed or I'm missing
      the point! ;-)<br>
      <p>Please dig a bit deeper and explain:<br>
        &nbsp;1. what TARGET_MOPS means and does and maybe what the .md
        file's purpose is,<br>
      </p>
    </blockquote>
    TARGET_MOPS is a target-specific macro or flag in GCC that stands
    for &quot;Memory Operations&quot;, that controls whether the target (=
e.g.,
    AArch64) supports specialized memory operation instructions, such as
    mops.memcpy, mops.memset etc<br>
    In GCC, TARGET_MOPS is used to conditionally enable instruction
    expansion patterns (e.g., setmemdi, cpymemdi).<br>
    GCC .md files (machine description files) define <i>Instruction
      patterns</i> (define_insn), <i>Expansion rules</i>
    (define_expand), <i>Instruction splitting</i>, peephole
    optimizations, etc. They bridge GCC=E2=80=99s intermediate RTL with t=
arget
    machine assembly. So when we write setmemdi in .md, we're telling
    GCC: =E2=80=9CHere=E2=80=99s how to emit instructions for setting mem=
ory blocks on
    this machine.=E2=80=9D<br>
    <blockquote type=3D"cite" cite=3D"mid:52ac2533-4b64-47a1-b4b4-0ea43ab=
2f25a@windriver.com">
      <p> &nbsp;2. why was it removed in the gcc-12 commit,<br>
      </p>
    </blockquote>
    There are many changes in aarch64 implementation in gcc-12 w.r.t
    gcc-11, which includes mops changes as in this thread
    <a class=3D"moz-txt-link-freetext" href=3D"https://inbox.sourceware.o=
rg/gcc-patches/mptee4mhon1.fsf@arm.com/T/#t">https://inbox.sourceware.org=
/gcc-patches/mptee4mhon1.fsf@arm.com/T/#t</a><br>
    GCC 12 likely refactored memory ops which may make TARGET_MOPS
    obsolete?<br>
    <blockquote type=3D"cite" cite=3D"mid:52ac2533-4b64-47a1-b4b4-0ea43ab=
2f25a@windriver.com">
      <p> &nbsp;3. why it's safe to ignore that change for gcc-11,<br>
      </p>
    </blockquote>
    GCC-11 and older versions are still used TARGET_MOPS for certain
    expansions, like setmemdi and cpymemdi. So, we must rely on its
    original behavior to prevent unsafe expansion on unsupported
    hardware.<br>
    Removing TARGET_MOPS in GCC 11 without full backporting of GCC 12=E2=80=
=99s
    changes would break instruction matching, cause ICEs, or expose
    unsupported paths (which we have already seen with the build
    failures)<br>
    <blockquote type=3D"cite" cite=3D"mid:52ac2533-4b64-47a1-b4b4-0ea43ab=
2f25a@windriver.com">
      <p> &nbsp;4. Since you are not backporting the MOPS part,<br>
        &nbsp;&nbsp;&nbsp;&nbsp; it might be nice to point that out in ea=
ch part of the
        patch that mentions MOPS.<br>
        &nbsp;&nbsp;&nbsp;&nbsp; Maybe that's overkill and you just need =
to explain in the
        commit log but<br>
        &nbsp;&nbsp;&nbsp;&nbsp; think about someone who is just looking =
at the patch and do
        what makes sense to you.<br>
      </p>
    </blockquote>
    This patch is based on changes in GCC 12 that remove TARGET_MOPS
    gating for setmem and cpymem expansions.<br>
    However, this version for GCC 11 does not backport the MOPS-related
    behavior change and retains the TARGET_MOPS condition to preserve
    correctness and compatibility with the GCC 11 backend.<br>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:52ac2533-4b64-47a1-b4b4-0ea43ab=
2f25a@windriver.com">
      <p> </p>
      <p>I can almost understand things better now but <br>
        I'll let you present it, step by step, in v3.</p>
    </blockquote>
    I'll send v3 by updating the commit log with above analysis.<br>
    <blockquote type=3D"cite" cite=3D"mid:52ac2533-4b64-47a1-b4b4-0ea43ab=
2f25a@windriver.com">
      <blockquote type=3D"cite" cite=3D"mid:20250521115945.3629052-1-sund=
eep.kokkonda@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">All changes and outputs ha=
ve been verified by the author.</pre>
      </blockquote>
      <br>
      <p>Is there a test case that covers all of this that starts
        passing with this change?<br>
      </p>
      Please explain how are you testing?<br>
    </blockquote>
    <p>I tested the prog given in
      <a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/bugz=
illa/show_bug.cgi?id=3D103100#c3">https://gcc.gnu.org/bugzilla/show_bug.c=
gi?id=3D103100#c3</a> on
      qemuarm64.<br>
    </p>
    <p>And, the generated assembly I get it reviewed by the author.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:52ac2533-4b64-47a1-b4b4-0ea43ab=
2f25a@windriver.com">
      <p><br>
      </p>
      <p>../Randy</p>
      <p><br>
      </p>
      <p>I looked at this a bit and found gcc/ChangeLog-2021 that talks
        about<br>
        the introduction of TARGET_MOPS. This was done in gcc-12 and
        later<br>
        as you have hinted at. <br>
        <br>
        =E2=9D=AF git blame gcc/ChangeLog-2021&nbsp; | rg TARGET_MOPS<br>
        d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1214)=
&nbsp;&nbsp;&nbsp;&nbsp;
        (aarch64_expand_setmem): Adjust for TARGET_MOPS.<br>
        d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1215)=
&nbsp;&nbsp;&nbsp;&nbsp;
        * config/aarch64/aarch64.h (CLEAR_RATIO): Adjust for
        TARGET_MOPS.<br>
        d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1219)=
&nbsp;&nbsp;&nbsp;&nbsp;
        (setmemdi): Adjust for TARGET_MOPS.<br>
        d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1238)=
&nbsp;&nbsp;&nbsp;&nbsp;
        (TARGET_MOPS): Define.<br>
        d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1239)=
&nbsp;&nbsp;&nbsp;&nbsp;
        (MOVE_RATIO): Adjust for TARGET_MOPS.<br>
        d04ae83244d3 (Jakub Jelinek 2022-01-03 10:18:16 +0100&nbsp; 1242)=
&nbsp;&nbsp;&nbsp;&nbsp;
        (cpymemdi): Adjust for TARGET_MOPS.<br>
        <br>
        <br>
        2021-12-13&nbsp; Kyrylo Tkachov&nbsp; <a class=3D"moz-txt-link-rf=
c2396E" href=3D"mailto:kyrylo.tkachov@arm.com" moz-do-not-send=3D"true">&=
lt;kyrylo.tkachov@arm.com&gt;</a><br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64.c (aarch64_expand_setmem_mops):
        Define.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_expand_setmem=
): Adjust for TARGET_MOPS.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64.h (CLEAR_RATIO): Adjust for
        TARGET_MOPS.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (SET_RATIO): Likewise.=
<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64.md (&quot;unspec&quot;): Add
        UNSPEC_SETMEM.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_setmemdi): De=
fine.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (setmemdi): Adjust for=
 TARGET_MOPS.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64.opt
        (aarch64-mops-memset-size-threshold):<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New param.<br>
        <br>
        ...<br>
        <br>
        2021-12-13&nbsp; Kyrylo Tkachov&nbsp; <a class=3D"moz-txt-link-rf=
c2396E" href=3D"mailto:kyrylo.tkachov@arm.com" moz-do-not-send=3D"true">&=
lt;kyrylo.tkachov@arm.com&gt;</a><br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64-option-extensions.def (mops):
        Define.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64.c (aarch64_expand_cpymem_mops):
        Define.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_expand_cpymem=
): Define.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64.h (AARCH64_FL_MOPS): Define.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (AARCH64_ISA_MOPS): De=
fine.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TARGET_MOPS): Define.=
<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (MOVE_RATIO): Adjust f=
or TARGET_MOPS.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64.md (&quot;unspec&quot;): Add
        UNSPEC_CPYMEM.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (aarch64_cpymemdi): Ne=
w pattern.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (cpymemdi): Adjust for=
 TARGET_MOPS.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * config/aarch64/aarch=
64.opt
        (aarch64-mops-memcpy-size-threshol):<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New param.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * doc/invoke.texi (AAr=
ch64 Options): Document +mops.<br>
        <br>
      </p>
      <blockquote type=3D"cite" cite=3D"mid:20250521115945.3629052-1-sund=
eep.kokkonda@windriver.com">
        <pre wrap=3D"" class=3D"moz-quote-pre">Upstream-Status: Backport =
[<a class=3D"moz-txt-link-freetext" href=3D"https://gcc.gnu.org/cgit/gcc/=
commit/?id=3Db9d16d8361a9e3a82a2f21e759e760d235d43322" moz-do-not-send=3D=
"true">https://gcc.gnu.org/cgit/gcc/commit/?id=3Db9d16d8361a9e3a82a2f21e7=
59e760d235d43322</a>]

Signed-off-by: Sundeep KOKKONDA <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:sundeep.kokkonda@windriver.com" moz-do-not-send=3D"true">&lt;sund=
eep.kokkonda@windriver.com&gt;</a>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
 ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-st=
rict-align-cpymem-setmem.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtoo=
ls/gcc/gcc-11.5.inc
index f17ec9da5c..1e8371b2bd 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -60,6 +60,7 @@ SRC_URI =3D &quot;\
            <a class=3D"moz-txt-link-freetext" href=3D"file://0029-Fix-in=
stall-path-of-linux64.h.patch" moz-do-not-send=3D"true">file://0029-Fix-i=
nstall-path-of-linux64.h.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0030-rust-r=
ecursion-limit.patch" moz-do-not-send=3D"true">file://0030-rust-recursion=
-limit.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0031-gcc-sa=
nitizers-fix.patch" moz-do-not-send=3D"true">file://0031-gcc-sanitizers-f=
ix.patch</a> \
+           <a class=3D"moz-txt-link-freetext" href=3D"file://0032-gcc-aa=
rch64-fix-strict-align-cpymem-setmem.patch" moz-do-not-send=3D"true">file=
://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0001-CVE-20=
21-42574.patch" moz-do-not-send=3D"true">file://0001-CVE-2021-42574.patch=
</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0002-CVE-20=
21-42574.patch" moz-do-not-send=3D"true">file://0002-CVE-2021-42574.patch=
</a> \
            <a class=3D"moz-txt-link-freetext" href=3D"file://0003-CVE-20=
21-42574.patch" moz-do-not-send=3D"true">file://0003-CVE-2021-42574.patch=
</a> \
diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-al=
ign-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-=
fix-strict-align-cpymem-setmem.patch
new file mode 100644
index 0000000000..4c2d827799
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpy=
mem-setmem.patch
@@ -0,0 +1,45 @@
+gcc: AArch64 - Fix strict-align cpymem/setmem
+
+The cpymemdi/setmemdi implementation doesn't fully support strict alignm=
ent.
+Block the expansion if the alignment is less than 16 with STRICT_ALIGNME=
NT.
+Clean up the condition when to use MOPS.
+
+Upstream-Status: Backport [<a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://gcc.gnu.org/cgit/gcc/commit/?id=3Db9d16d8361a9e3a82a2f21e759e760d23=
5d43322" moz-do-not-send=3D"true">https://gcc.gnu.org/cgit/gcc/commit/?id=
=3Db9d16d8361a9e3a82a2f21e759e760d235d43322</a>]
+
+Signed-off-by: Wilco Dijkstra <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:wilco.dijkstra@arm.com" moz-do-not-send=3D"true">&lt;wilco.dijkst=
ra@arm.com&gt;</a>
+Signed-off-by: Sundeep KOKKONDA <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:sundeep.kokkonda@windriver.com" moz-do-not-send=3D"true">&lt;sund=
eep.kokkonda@windriver.com&gt;</a>
+---
+--- a/gcc/config/aarch64/aarch64.c	2025-05-08 20:40:10.969865898 -0700
++++ b/gcc/config/aarch64/aarch64.c	2025-05-13 23:11:07.006796627 -0700
+@@ -23621,14 +23621,15 @@
+   int mode_bits;
+   rtx dst =3D operands[0];
+   rtx src =3D operands[1];
++  unsigned align =3D UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode =3D BLKmode;
+=20
+   /* Only expand fixed-size copies.  */
+-  if (!CONST_INT_P (operands[2]))
++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT &amp;&amp; align =
&lt; 16))
+     return false;
+=20
+-  unsigned HOST_WIDE_INT size =3D INTVAL (operands[2]);
++  unsigned HOST_WIDE_INT size =3D UINTVAL (operands[2]);
+=20
+   /* Inline up to 256 bytes when optimizing for speed.  */
+   unsigned HOST_WIDE_INT max_copy_size =3D 256;
+@@ -23750,11 +23751,12 @@
+   unsigned HOST_WIDE_INT len;
+   rtx dst =3D operands[0];
+   rtx val =3D operands[2], src;
++  unsigned align =3D UINTVAL (operands[3]);
+   rtx base;
+   machine_mode cur_mode =3D BLKmode, next_mode;
+=20
+   /* We can't do anything smart if the amount to copy is not constant. =
 */
+-  if (!CONST_INT_P (operands[1]))
++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT &amp;&amp; align =
&lt; 16))
+     return false;
+=20
+   bool speed_p =3D !optimize_function_for_size_p (cfun);
</pre>
      </blockquote>
      <p><br>
      </p>
      <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
    </blockquote>
  </body>
</html>

--------------goJF4lfGSaEjejsoAH9C0EvE--

