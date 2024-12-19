Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9AAFE77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:50:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.141119.1734648646193446353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 14:50:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=208332c61f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BJLEkWF002122
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 22:50:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43gy80pjwm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 22:50:44 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BJMoiLF014403;
	Thu, 19 Dec 2024 22:50:44 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43gy80pjwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Dec 2024 22:50:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u36xYYZAd8sfXYqx6x1YV/kD+xVeqBblwbOeoeczeDfGutAEOhU0Cd5fTDXcgvWrjYxW6qtHnaUXqOLeOT5c0TcxLSCqlQU4MEl8QyvMB5DKJTwrnCoL1fGX4SvvgoG3ly3RkYK7+pVQC9IS+4FZfNlBWrV1u5XJ3dN0zx3+kWR+yXwi+6+2W/tImapAWowKN0hdiFHe71cdJWoaya2NaFMK25Xzmt/OIaqrVVZ3mYX2x2C8pntMsaQY1pA3XrzOK9q1ZhkrG50EpKvLLDJrTqeSF07SwXiPz2SvRYlgoX78/F++KcUhxrHvmCBZWofgKlzQrUp4JkmjY8HoQ1JN4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZqHBZAqq0YQ5+phuU3eLB8lNqwAunKTiPlz1npfQkc=;
 b=cjp8DJShYrHU61I8jV9VXWanZ/88HhBJCZNo39oIzxdKF4EojzKDg0F8ELjWHjU7wmASwReN4Anrjs/IiqSiMDzCHVU5JFXR2WP2BVoRIIRGiA5tPR1Wk1YApljJvHcFgq16wmld0+xqz7VY0fsNHGlwsf1RHkh3jX2d281rov1VeAcydx6/E3WutfgaMFOAScC+DykMwdEOE3imBag0NfX34d5MI+ulUBPncMLMu7DDnUk8kiPptis6M0Pck3o3fNFXUJlvSsXy10c5aih5wt44tC7qfomkUeaLgwi+NDRzZPH4HrRNzSoocjEj4KOdwMDhaJZ97sy5fOYXnRjFNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 22:50:41 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 22:50:41 +0000
Content-Type: multipart/alternative;
 boundary="------------zk9BginY80dLs8uBxPZ38ytZ"
Message-ID: <94d26371-7e09-423c-bf78-006a5e5d1c9b@windriver.com>
Date: Thu, 19 Dec 2024 17:50:38 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Patchtest results for [PATCH] Also check that
 'tools-debug' is not set in IMAGE_FEATURES to determine if gdbserver is
 missing.
To: "Georgi, Tom" <tom.georgi@karlstorz.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241217101607.542503-2-tom.georgi@karlstorz.com>
 <01010193d42c17c6-6e80daa6-d4bb-48d9-bb9c-1d5a0b06b036-000000@us-west-2.amazonses.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <01010193d42c17c6-6e80daa6-d4bb-48d9-bb9c-1d5a0b06b036-000000@us-west-2.amazonses.com>
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB7250:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2fd933-e3d3-49c1-e9cd-08dd207f9068
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|4022899009|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?KzV4d1VsMDdndllUWVc4dDNTNE1xR0RPYlI2aDJQMDIxSFBzaWZSTkhQY1BP?=
 =?utf-8?B?VXpuUnFQUERPNjYwdzVnQjdjYTQrMDlhRkgwVGtLbEZ4N3JyU1hWNVRFQk9u?=
 =?utf-8?B?UUtsTlp1Z0tscEM5L2tnbXl6bTNzaStGbWs0YW5KTDI4bHROU1VBREtiWVFh?=
 =?utf-8?B?Rjc4YTRZL0VCRjVaSUNyM2JWcXBoTHdvZkRMWHo3SVR0TEZ0N0hHS1h0TXNr?=
 =?utf-8?B?WjA5cGlvZXlQVnl1a3lOQzllTVY3MWs0VEFSYk1ZZkJZTXJ0RW9XV0xBZDU1?=
 =?utf-8?B?Q2xuTVR4M3UrbDVvbjE4bWhxL1lIcTQxWEg2UnBPLzY3RjFZdGxlbHF0SkxG?=
 =?utf-8?B?NUFLM3ZIVUpvcEQwU0NYUUVhNmc3YWtUUFB3NE5UbUpSNHluaS80KzYzK1FR?=
 =?utf-8?B?TWI5ZlNvWTlXenlaVFJZV1phM2VmMGpIMkl5SjBYMmhPOTB4aFpqV2JXa2FC?=
 =?utf-8?B?NGFwbWdKMC9JcHdtR1Ewek5tdERhUlJ1NXR4eW5GV3dodTFuVkdlcVFCY2g5?=
 =?utf-8?B?c215alhTUjVwQzRLbTA4b2FPVDZ1UDJIQUM5V09zRWVUZm54WUtlYWZ5TWRi?=
 =?utf-8?B?a3ZkdUhheHZCa0lmeUN2cWlTQW9Zc25xNFg1MzRLbGVwam52TjgvOUsxYXda?=
 =?utf-8?B?ZytxWDZJNllHSUNwZVdtTU5iVnBtR29DM0RwS1Vlb0k1OURHMjdXWU16NEpw?=
 =?utf-8?B?UWwvWVZIMG1ZelkrNEtQUVJ0Vm1ZOS9Ld09kZmpIYmMwSzJLNEhISzZWSjJS?=
 =?utf-8?B?eWd1ejJ2N3NmMmVMTE9JaHpURnh1NWpDL1ZsQnR6VWtGWjBpTzI3QXNRMFpU?=
 =?utf-8?B?WkNEN0MvTnN0MWMxT3ZnUTVVL2hZVUw4ankzZmJLQlJ1SGZ2M1lDK3VHeWQ4?=
 =?utf-8?B?WWRJeDBqOWlFLy9lZWR5N0ovY2ZYWHVOMG96ZVBqanduNnoxdDR6S3pBZTRS?=
 =?utf-8?B?YWFlNUhmc1FMUGdjdkNNM0tRQ3VyeWpCR2FCSTJwZzhTeVZXRXh2WndXbjRC?=
 =?utf-8?B?Rk1IRk1wVFNEeWIwUTJWeEpZMnl0K3lBUHluMW5VTGJ4RzNwVUlxSmNlTFpv?=
 =?utf-8?B?Q0xJK0ppbnE3ZTFGRWdlZHp5MlpRbEZtNGN3L1orbWlPMkFYeTFGck1nYXRy?=
 =?utf-8?B?clI5a0JERkRyS2dNVE16czBnUVVRdW51RWR1RVNCcmxXcE1xTEhIVDF4NW43?=
 =?utf-8?B?NzJabGxsdzdCRVBXN0dsVnBTcU5iYVNLWWNoaE12Y2NnVC92UHlUYXpQTzVZ?=
 =?utf-8?B?UGoxaWRJbHVPaU5RRG80Q21sZ2RlS2MzaThXbmo3Nkx0ajAzeGxuaS9zblpD?=
 =?utf-8?B?enpaRXgxb3dKc0VmRG1hRFJBWUpBd05FZXpOS0VicFhicjhrWVQ0STd0MXE3?=
 =?utf-8?B?d2Z3OHIvNFlCOU1TcVdTcDhVd2JsZ2tZczN6M0RiOUQyWGRYeWcrSzY3eVEz?=
 =?utf-8?B?Sm5TdmEzTTJTV3V4ejhia3ZrNkp1ZEVTV25WUjZGaWtJOG1sNEkvNEl6bERG?=
 =?utf-8?B?RGp6czk1QWhGK3lYTGhoUVp0RW9ZYnQvVmxQTVBreXROTzNZRVZtZElpRG45?=
 =?utf-8?B?dkNHRWhxSFhRT0VKdTBhWUs0WjRKajJjcSt0UjE2Z0tkT1hJaXloaGJpazEy?=
 =?utf-8?B?L1NsNzVkTkQzRXlNWWZVdGx0VmUycXl3dXVsU0xhTFdKcEZvNmhLM0R5NGFV?=
 =?utf-8?B?MXBOODFNeE53QVJCaUZlN0p5QjR6VEkxQkdOeHZJcklxblBXUWpJSm9FZjVn?=
 =?utf-8?B?cUZQays4VkFkbEJlRW14Z2R4dTdKdmVrM1dlZ2NnTDJyRERhMW5iYmhjbmUv?=
 =?utf-8?B?cVhibW1iT3UzaVpnekk4UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(4022899009)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dWYyNStiUUdpZU1aelYxejRLYnlXTzFYVDByQjNSby9odnlqTk1OTWVCdE5P?=
 =?utf-8?B?Q0xoVGNOL1NZM3pXREFHVzhHUWtSMzdjdFpWS2RRVUQ2cFFWeTJZWmxjZ25l?=
 =?utf-8?B?YlpHbldNbkROY20vNjdKaXMvaDlwM1hoR3ZFMW5HTGdnQ09aaUFzNDh6c1Rs?=
 =?utf-8?B?V3pqZU5Dd1RNakR4anRHT0l6Z3FxTGJwMWdJdS8rWUIveStvS1NQbWpWeGtP?=
 =?utf-8?B?bTNMUWt1TXl1TlBqb21wOVA4T29RUHJqWmdUMDdPVWlMa0c0NG9rRVV3RkRi?=
 =?utf-8?B?dGZucERrZ2hTU254UW5ONTFJTDlXZ2RBdlZ4RUhwWHRDZHI3ZjdQOHZmNVh6?=
 =?utf-8?B?dzl4N1Ayam9haE04OFl5YWhkMUJvcVMyeHJHSTdkd25FSUp6aElKSWplRnZU?=
 =?utf-8?B?ckoxRGZjdU1VVnBDcE5Qd015ZDc2R09iMXVBbnEyeUNXZDZJWVcySGVOL3lU?=
 =?utf-8?B?OXV2ZytLbGw3VVFTMHB4NnVJZTRuRCsxYTFjTHZXdnZmZS9TenJDSHRDM2dh?=
 =?utf-8?B?eCt4TkxuRUFvMVgrMDRhSWNXbTZHVlNBSjlvSWZYNWt4NWVvVHMrcWR0SWE1?=
 =?utf-8?B?ajJ2MWlsTmF3YjVCSGJBbDRPNjNWL0tCR1RObVZ1VVVvWlQ3bDVIbUg5a0lq?=
 =?utf-8?B?YzBvbExxU3hHN1BmSjk3UnJOS2N5N2wrc2ppdkk5N3I5clo2RHZMdHdKelhN?=
 =?utf-8?B?ck03U0dVSjdDeUtqM0dORFNMYWdReUcySXFWSUY1VVpad25SbUQ1aW91OWVv?=
 =?utf-8?B?ci92elEzeUM1cU1oaFFQTnZjbXdSZWlYVjQxaG9zampOcEp6Wld4dnJ0ZE9p?=
 =?utf-8?B?TFpVdVF4eUNsaWZ6SCtHaC94LzNtS21IeHlpY3FYZnlEYy9VdVR5MFRFNjY5?=
 =?utf-8?B?SGZjbXFTeUY5YXVtZlZDTktkVHY5OGFNa25Db0YzKzZHTmZYd0Z4cGNxNFhy?=
 =?utf-8?B?bUdFNHljYW5iNDhPWjdhcDNTU1N2L0g2T1pld0xsZGhFL1kwQ1A5RVFUZU9w?=
 =?utf-8?B?dUFaTUZHTnRkeU5vZkZXa05udGFNR3l0U0VBMGtBZUhJbXY4TWovVjVrRnNF?=
 =?utf-8?B?d0lMeSsxWjY2NGZDTUY1cEpxRWdyWDl6WmloeWFnd3g2UklNV3V1ejQrSjVT?=
 =?utf-8?B?RzhINHQ3bXBHOWd5VDkwajI4SUlrT2Z4V0dlMVpac1BVUDhoWmFSUGhRVWkx?=
 =?utf-8?B?OWE0MW9vdUJ5YnpuNThKV24vMEUzS3pHSUhQalh2MVJHQmxGTFgxQ1dnWC9r?=
 =?utf-8?B?ZnZzK2p0QmlxakpwMHZxTTJ1YWJVZjJiSjBZdlp1M2I2dllWVUtyVktNYkNZ?=
 =?utf-8?B?UjMyalEwQkdVU0J0T2wreHBCQjVrY0E0QlozaGRST201VHlOSGhUdmx1eVZV?=
 =?utf-8?B?UGVOUUtVMVlVejk3QzRCV1gwOWNSSmVTRUxyWjJRM0xMOElYMXgyUzdDUWZa?=
 =?utf-8?B?V0ZhVGl3RHFGN3ZCL0VsNUdkMmMrbC9seWdxeUhLNGRlY21OR1J1WUQ3MHl2?=
 =?utf-8?B?S0FPWWZoSW1pSFFBSXh5RzNKUW5jbFR0dGtWajd0MFcrM3BoVFhtQnlQL2Rm?=
 =?utf-8?B?OXVQdTBhMmxJT2JKN3FWcS9YUmYxSU9WdVVFV3NuOGN5NHI2VVBKMExNQ2dL?=
 =?utf-8?B?YUY4ODBLWm5SaHRrd3UrU0t6QmE0TnVuNWQrdFJjTDgxd25CRlhOTDlucWJj?=
 =?utf-8?B?L3FGQ3JVakY4SEd0dEJTWHlsNlIvek9XSTNQQ2ZZcDdKRmE1d0lvK1A5TTBI?=
 =?utf-8?B?dUk0UmErSS9xMWd4VXVqdThTWlVINi9NV2g4VmVldEhyUHRYWHZCS0xkRW9G?=
 =?utf-8?B?RXVLZVVjZlZGUlRoVUpBOEozQXRQd3ZJQVJKQUE4dElNRVVjZGRFTGE1VUk0?=
 =?utf-8?B?VW44bFdCSndCeVk1b3h2a3JlSEdzVFFBR1YzM2xWbklxOTh1S0JOYjYya0F6?=
 =?utf-8?B?YTU4OU85bjYvLy9UM0VleGtBLy8vQllNd01qbjJiaXdFTGliU0FheStkVW9x?=
 =?utf-8?B?N0x1KzI5ZDN3YkdLWEtiUVJFQUlOVFVhTTVrWDUzRXlMUENxZ2E5T2R2QlQz?=
 =?utf-8?B?MTNvTnczbUY2aTdrT0lyUHovcktLVzhIajBNNmUrM0sxbzNlNDY3RjMrdVI0?=
 =?utf-8?B?OWpVOGJwNDltTDFSVU9Sd01ZRTVEK3k2Q1RETFRTVVpvS0tIbmtTZTFGK3F3?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2fd933-e3d3-49c1-e9cd-08dd207f9068
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:50:41.3721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuL2nfHVBxuOrybgH419C89+namyC4qwtaulyk6/9Sv6ZB+RH6v+4XA7/BNfB17daQGEnSAxKUjwK0CuQPjfAYKmh3qAxrQY0cVRDN/xevo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
X-Authority-Analysis: v=2.4 cv=I4ufRMgg c=1 sm=1 tr=0 ts=6764a345 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=hymz-D8Ecddct5J_:21 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=n9SCklZpAAAA:8 a=t7CeM3EgAAAA:8 a=GKorptp6to1jHw70YYQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=B8ibFTVmAAAA:8 a=ca9WJqIlQOw2rjaFYacA:9 a=7-Jx9xdXsA-m24SM:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=MDYma9B3dblYkEs0OMj2:22 a=FdTzh2GWekK77mhwV6Dw:22 a=xvSgdcfEVHFitugM1GHH:22
X-Proofpoint-GUID: cwIDJc9v4RvZtmtX9dEtAgy8F8xtFC5j
X-Proofpoint-ORIG-GUID: oBQ5AL4whSDnRZ620c2wi8EoUys8rjXo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-19_11,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412190180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 22:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208964

--------------zk9BginY80dLs8uBxPZ38ytZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BJLEkWF002122

Hi Georgi,

I think this is your first submission to oe-core - thanks for sending it =
in.

As Patchtest pointed out there are some problems we'd like you to fix up=20
before resending.
I haven't been using this feature of devtool but your change looks=20
sensible to me.

On 2024-12-17 5:31 a.m., Patchtest via lists.openembedded.org wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/Also-check-that-tools-debug-=
is-not-set-in-IMAGE_FEATURES-to-determine-if-gdbserver-is-missing..patch
>
> FAIL: test shortlog format: Commit shortlog (first line of commit messa=
ge) should follow the format "<target>: <summary>" (test_mbox.TestMbox.te=
st_shortlog_format)
> FAIL: test shortlog length: Edit shortlog so that it is 90 characters o=
r less (currently 96 characters) (test_mbox.TestMbox.test_shortlog_length=
)
Do those errors make sense Georgi?


For shortlog tips, look at:
=E2=9D=AF git log --oneline=C2=A0 -11 scripts/lib/devtool/
65950eb601 devtool: ide-sdk recommend DEBUG_BUILD
b886c26bf8 devtool: ide-sdk sort cmake preset
fc17808799 devtool: modify support debug-builds
d31a7718c1 scripts/devtool: use bb.util.listtasks instead of __BBTASKS
e6e548170a devtool: ide-sdk: fix help typo
02b52a2de3 devtool: drop useless variables
43f0c6beaa devtool: menuconfig remove useless code
2b799fdf26 devtool: drop S =3D WORKDIR workaround
94ff1be36a devtool: remove obsolete SRCTREECOVEREDTASKS handling
b0733c440e devtool: modify kernel adds append twice
4467aa0661 devtool/upgrade: rename RECIPE_UPDATE_EXTRA_TASKS ->=20
RECIPE_UPGRADE_EXTRA_TASKS

and as Strunk and White said, omit needless words.=C2=A0 ;-)


Also for commits, we want to apply the change directly from email so=20
please omit any greeting
unless you write a cover letter. Are you sending your patch with git=20
send-email?
Have you seen our Contributor's Guide:
https://docs.yoctoproject.org/contributor-guide/index.html

Below is what happens if I apply your patch/email.
Hopefully by running git log and comparing your commit to others you can
get an idea of what is expected but don't get too hung up on it but=20
rather just
CC me on your next version and I'll take a look.

Thanks,

../Randy


oe-core.git on master
=E2=9D=AF git am /tmp/devtool-fix.eml
Applying: Also check that 'tools-debug' is not set in IMAGE_FEATURES to=20
determine if gdbserver is missing.

=E2=9D=AF git show
commit 43d08c7eb1297842fa62df55b66a13f109d6ec2d (HEAD -> master)
Author: Georgi, Tom via lists.openembedded.org=20
<tom.georgi=3Dkarlstorz.com@lists.openembedded.org>
Date:=C2=A0=C2=A0 Tue Dec 17 05:16:08 2024

 =C2=A0=C2=A0=C2=A0 Also check that 'tools-debug' is not set in IMAGE_FEA=
TURES to=20
determine if gdbserver is missing.

 =C2=A0=C2=A0=C2=A0 Hi all,
 =C2=A0=C2=A0=C2=A0 While using the relatively new devtool subcommand 'id=
e-sdk', I=20
noticed that the gdbserver is listed as missing because it was not=20
explicitly listed in IMAGE_INSTALL.
 =C2=A0=C2=A0=C2=A0 According to the documentation, it is also installed =
by the image=20
feature 'tools-debug'.
 =C2=A0=C2=A0=C2=A0 Therefore, you should not only check whether 'gdbserv=
er' is not in=20
'IMAGE_INSTALL', but also whether 'tools-debug' is not in IMAGE_FEATURES.

 =C2=A0=C2=A0=C2=A0 Best regards
 =C2=A0=C2=A0=C2=A0 Tom Georgi

 =C2=A0=C2=A0=C2=A0 Signed-off-by: Georgi, Tom <tom.georgi@karlstorz.com>

>
> PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
> PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_b=
y_presence)
> PASS: test author valid (test_mbox.TestMbox.test_author_valid)
> PASS: test commit message presence (test_mbox.TestMbox.test_commit_mess=
age_presence)
> PASS: test commit message user tags (test_mbox.TestMbox.test_commit_mes=
sage_user_tags)
> PASS: test max line length (test_metadata.TestMetadata.test_max_line_le=
ngth)
> PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
> PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
> PASS: test pylint (test_python_pylint.PyLint.test_pylint)
> PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_=
list)
>
> SKIP: pretest src uri left files: No modified recipes, skipping pretest=
 (test_metadata.TestMetadata.pretest_src_uri_left_files)
> SKIP: test CVE check ignore: No modified recipes or older target branch=
, skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
> SKIP: test CVE tag format: No new CVE patches introduced (test_patch.Te=
stPatch.test_cve_tag_format)
> SKIP: test Signed-off-by presence: No new CVE patches introduced (test_=
patch.TestPatch.test_signed_off_by_presence)
> SKIP: test Upstream-Status presence: No new CVE patches introduced (tes=
t_patch.TestPatch.test_upstream_status_presence_format)
> SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.t=
est_bugzilla_entry_format)
> SKIP: test lic files chksum modified not mentioned: No modified recipes=
, skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modifie=
d_not_mentioned)
> SKIP: test lic files chksum presence: No added recipes, skipping test (=
test_metadata.TestMetadata.test_lic_files_chksum_presence)
> SKIP: test license presence: No added recipes, skipping test (test_meta=
data.TestMetadata.test_license_presence)
> SKIP: test series merge on head: Merge test is disabled for now (test_m=
box.TestMbox.test_series_merge_on_head)
> SKIP: test src uri left files: No modified recipes, skipping pretest (t=
est_metadata.TestMetadata.test_src_uri_left_files)
> SKIP: test summary presence: No added recipes, skipping test (test_meta=
data.TestMetadata.test_summary_presence)
>
> ---
>
> Please address the issues identified and
> submit a new revision of the patch, or alternatively, reply to this
> email with an explanation of why the patch should be accepted. If you
> believe these results are due to an error in patchtest, please submit a
> bug athttps://bugzilla.yoctoproject.org/ (use the 'Patchtest' category
> under 'Yocto Project Subprojects'). For more information on specific
> failures, see:https://wiki.yoctoproject.org/wiki/Patchtest. Thank
> you!
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208830):https://lists.openembedded.org/g/openembedd=
ed-core/message/208830
> Mute This Topic:https://lists.openembedded.org/mt/110160631/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------zk9BginY80dLs8uBxPZ38ytZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BJLEkWF002122

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Hi Georgi,</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">I think this is your first submission
      to oe-core - thanks for sending it in.<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">As Patchtest pointed out there are som=
e
      problems we'd like you to fix up before resending. <br>
      I haven't been using this feature of devtool but your change looks
      sensible to me.<br>
    </div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2024-12-17 5:31 a.m., Patchtest via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:01010193d42c17c6-6e80daa6-d4bb-=
48d9-bb9c-1d5a0b06b036-000000@us-west-2.amazonses.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">Thank you for your submissio=
n. Patchtest identified one
or more issues with the patch. Please see the log below for
more information:

---
Testing patch /home/patchtest/share/mboxes/Also-check-that-tools-debug-is=
-not-set-in-IMAGE_FEATURES-to-determine-if-gdbserver-is-missing..patch

FAIL: test shortlog format: Commit shortlog (first line of commit message=
) should follow the format &quot;&lt;target&gt;: &lt;summary&gt;&quot; (t=
est_mbox.TestMbox.test_shortlog_format)
FAIL: test shortlog length: Edit shortlog so that it is 90 characters or =
less (currently 96 characters) (test_mbox.TestMbox.test_shortlog_length)<=
/pre>
    </blockquote>
    Do those errors make sense Georgi?<br>
    <p><br>
      For shortlog tips, look at:<br>
      =E2=9D=AF git log --oneline&nbsp; -11 scripts/lib/devtool/<br>
      65950eb601 devtool: ide-sdk recommend DEBUG_BUILD<br>
      b886c26bf8 devtool: ide-sdk sort cmake preset<br>
      fc17808799 devtool: modify support debug-builds<br>
      d31a7718c1 scripts/devtool: use bb.util.listtasks instead of
      __BBTASKS<br>
      e6e548170a devtool: ide-sdk: fix help typo<br>
      02b52a2de3 devtool: drop useless variables<br>
      43f0c6beaa devtool: menuconfig remove useless code<br>
      2b799fdf26 devtool: drop S =3D WORKDIR workaround<br>
      94ff1be36a devtool: remove obsolete SRCTREECOVEREDTASKS handling<br=
>
      b0733c440e devtool: modify kernel adds append twice<br>
      4467aa0661 devtool/upgrade: rename RECIPE_UPDATE_EXTRA_TASKS -&gt;
      RECIPE_UPGRADE_EXTRA_TASKS<br>
    </p>
    <p>and as Strunk and White said, omit needless words.&nbsp; ;-)</p>
    <p><br>
    </p>
    <p>Also for commits, we want to apply the change directly from email
      so please omit any greeting<br>
      unless you write a cover letter. Are you sending your patch with
      git send-email?<br>
      Have you seen our Contributor's Guide:<br>
      &nbsp;&nbsp; <a class=3D"moz-txt-link-freetext" href=3D"https://doc=
s.yoctoproject.org/contributor-guide/index.html">https://docs.yoctoprojec=
t.org/contributor-guide/index.html</a><br>
      <br>
    </p>
    <p>Below is what happens if I apply your patch/email.<br>
      Hopefully by running git log and comparing your commit to others
      you can<br>
      get an idea of what is expected but don't get too hung up on it
      but rather just<br>
      CC me on your next version and I'll take a look.</p>
    <p>Thanks,<br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <p>oe-core.git on master<br>
      =E2=9D=AF git am /tmp/devtool-fix.eml <br>
      Applying: Also check that 'tools-debug' is not set in
      IMAGE_FEATURES to determine if gdbserver is missing.<br>
      <br>
      =E2=9D=AF git show<br>
      commit 43d08c7eb1297842fa62df55b66a13f109d6ec2d (HEAD -&gt;
      master)<br>
      Author: Georgi, Tom via lists.openembedded.org
      <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:tom.georgi=3Dkarl=
storz.com@lists.openembedded.org">&lt;tom.georgi=3Dkarlstorz.com@lists.op=
enembedded.org&gt;</a><br>
      Date:&nbsp;&nbsp; Tue Dec 17 05:16:08 2024<br>
      <br>
      &nbsp;&nbsp;&nbsp; Also check that 'tools-debug' is not set in IMAG=
E_FEATURES to
      determine if gdbserver is missing.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Hi all,<br>
      &nbsp;&nbsp;&nbsp; While using the relatively new devtool subcomman=
d 'ide-sdk', I
      noticed that the gdbserver is listed as missing because it was not
      explicitly listed in IMAGE_INSTALL.<br>
      &nbsp;&nbsp;&nbsp; According to the documentation, it is also insta=
lled by the
      image feature 'tools-debug'.<br>
      &nbsp;&nbsp;&nbsp; Therefore, you should not only check whether 'gd=
bserver' is
      not in 'IMAGE_INSTALL', but also whether 'tools-debug' is not in
      IMAGE_FEATURES.<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Best regards<br>
      &nbsp;&nbsp;&nbsp; Tom Georgi<br>
      &nbsp;&nbsp; &nbsp;<br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Georgi, Tom <a class=3D"moz-txt-l=
ink-rfc2396E" href=3D"mailto:tom.georgi@karlstorz.com">&lt;tom.georgi@kar=
lstorz.com&gt;</a><br>
      <br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:01010193d42c17c6-6e80daa6-d4bb-=
48d9-bb9c-1d5a0b06b036-000000@us-west-2.amazonses.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

PASS: pretest pylint (test_python_pylint.PyLint.pretest_pylint)
PASS: test Signed-off-by presence (test_mbox.TestMbox.test_signed_off_by_=
presence)
PASS: test author valid (test_mbox.TestMbox.test_author_valid)
PASS: test commit message presence (test_mbox.TestMbox.test_commit_messag=
e_presence)
PASS: test commit message user tags (test_mbox.TestMbox.test_commit_messa=
ge_user_tags)
PASS: test max line length (test_metadata.TestMetadata.test_max_line_leng=
th)
PASS: test mbox format (test_mbox.TestMbox.test_mbox_format)
PASS: test non-AUH upgrade (test_mbox.TestMbox.test_non_auh_upgrade)
PASS: test pylint (test_python_pylint.PyLint.test_pylint)
PASS: test target mailing list (test_mbox.TestMbox.test_target_mailing_li=
st)

SKIP: pretest src uri left files: No modified recipes, skipping pretest (=
test_metadata.TestMetadata.pretest_src_uri_left_files)
SKIP: test CVE check ignore: No modified recipes or older target branch, =
skipping test (test_metadata.TestMetadata.test_cve_check_ignore)
SKIP: test CVE tag format: No new CVE patches introduced (test_patch.Test=
Patch.test_cve_tag_format)
SKIP: test Signed-off-by presence: No new CVE patches introduced (test_pa=
tch.TestPatch.test_signed_off_by_presence)
SKIP: test Upstream-Status presence: No new CVE patches introduced (test_=
patch.TestPatch.test_upstream_status_presence_format)
SKIP: test bugzilla entry format: No bug ID found (test_mbox.TestMbox.tes=
t_bugzilla_entry_format)
SKIP: test lic files chksum modified not mentioned: No modified recipes, =
skipping test (test_metadata.TestMetadata.test_lic_files_chksum_modified_=
not_mentioned)
SKIP: test lic files chksum presence: No added recipes, skipping test (te=
st_metadata.TestMetadata.test_lic_files_chksum_presence)
SKIP: test license presence: No added recipes, skipping test (test_metada=
ta.TestMetadata.test_license_presence)
SKIP: test series merge on head: Merge test is disabled for now (test_mbo=
x.TestMbox.test_series_merge_on_head)
SKIP: test src uri left files: No modified recipes, skipping pretest (tes=
t_metadata.TestMetadata.test_src_uri_left_files)
SKIP: test summary presence: No added recipes, skipping test (test_metada=
ta.TestMetadata.test_summary_presence)

---

Please address the issues identified and
submit a new revision of the patch, or alternatively, reply to this
email with an explanation of why the patch should be accepted. If you
believe these results are due to an error in patchtest, please submit a
bug at <a class=3D"moz-txt-link-freetext" href=3D"https://bugzilla.yoctop=
roject.org/">https://bugzilla.yoctoproject.org/</a> (use the 'Patchtest' =
category
under 'Yocto Project Subprojects'). For more information on specific
failures, see: <a class=3D"moz-txt-link-freetext" href=3D"https://wiki.yo=
ctoproject.org/wiki/Patchtest">https://wiki.yoctoproject.org/wiki/Patchte=
st</a>. Thank
you!
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#208830): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/208830">https:/=
/lists.openembedded.org/g/openembedded-core/message/208830</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/110160631/3616765">https://lists.openembedded.org/mt=
/110160631/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g=
/openembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D=
"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------zk9BginY80dLs8uBxPZ38ytZ--

