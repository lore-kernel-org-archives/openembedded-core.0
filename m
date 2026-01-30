Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D08E6BF32
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 18:14:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.619.1769796882932022473
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jan 2026 10:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=BFqujOqt;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6490b94fbc=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UGuUU8799309
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 10:14:42 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=FCj9F4910wjx/dl4wtNzn2
	uanpRmhBirbR7i/668j9k=; b=BFqujOqtbBbsDHD49q+cUQcw1bSWeLoecplq4P
	1afUxVfbgTDL8GPgwkn6q4+Y7ERqoBaPv5LohIZDCWAwHjyuYLeNkmLzexnrwy79
	qXmXRNwofORWaqRCAc8L/aGnRlR1+dTqS47JY5vpXHtR4kEY0UHFih6/UlueaW3U
	B2eNnBfIEo0VVWXARw0ozuSSPPdZKJoNVYv5HD0H6oY6fpKIDp84p7MTH70U8bhq
	MWieI5CGNkqfk8Yjx9nDsucx6DOHXGmz9T6HrrZP9O0R7/qHHIz6QHzxH7h9xV34
	a1HrLYmaXFn4FvkGJSmhpS0SxvWuoYEzyfT7gH3Fo8V2+r0g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013055.outbound.protection.outlook.com [40.93.201.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bywwrjqv2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 10:14:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRyey+yK2j8malt4a35ERpih1aOo2RXIxYQj5zYl8qE+pW9Uv/gpZO7kx7epDgblsxZE9UAHMa0ePu1A6ppETHapOf+5WcD4y/mQ0zzIPJqQGnfN3Sr/JHTvFEh85PlpEj4CU38DV3zh3x/k+EBHyeXX8ex9llF+LTuEy3W2+1aN9Vy3MhJTy5ikASBEwYxSCgp3OsstxYcXp9SOp6+WmiS5JdBlGHcDJw3kIBkUfYjgGllDEkLSJx9FCmMSRKtVWO7zWYfunD0eJJK1D6PFcyBl8unU4fQfVI5LoEfw7wGLMHvSdAXGx/wiRAqLZh3XJwvyiIWcLUl4TAFZx/2e/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCj9F4910wjx/dl4wtNzn2uanpRmhBirbR7i/668j9k=;
 b=bqS86UQ31xCdVrU1ObC56zZHANy0UkiiAI2VbhgxO0IrECLEBpS4RZKQfPeyjys1r66VMYw88paFZYc22wWxl8Qg3KB0C3Eun3LM1SudzNTMgMI0lunW/s+q16vyDq8FWNubZ2/4HRRiltCpOiWFwSj+dlpD7YOyIJAYkKDNJHoL17ifQL4gioA7au9UeCvToekc9Ff+wYSOL5ChVu3HbcjjFLJODy8uW4gkSKHfN+eeYBLf7UQZH9WDhMqJpLKRy7aQj1eP4zpaHQCK2lbY0NZiQ9wFFw+49cbEerQwxN7GYeZRLfpjzRHxFYAYAnAwNlU7ikvM79B1y7VWKaonzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA2PR11MB5114.namprd11.prod.outlook.com (2603:10b6:806:114::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 18:14:39 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:14:39 +0000
Content-Type: multipart/alternative;
 boundary="------------iU3IJZXlyxBmKbpohXwFWPox"
Message-ID: <eac30c25-8fd2-42e1-ac43-b4455da50200@windriver.com>
Date: Fri, 30 Jan 2026 13:14:36 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.92.0 -> 1.93.0
To: Hemanth.KumarMD@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260130134137.2463745-1-Hemanth.KumarMD@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260130134137.2463745-1-Hemanth.KumarMD@windriver.com>
X-ClientProxiedBy: BY5PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::23) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA2PR11MB5114:EE_
X-MS-Office365-Filtering-Correlation-Id: ef268b59-c599-4d59-9156-08de602b6e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZUdoQVZVWExZMVF5M3N5K2dqbVNMM0lZeUhQdXpiNWlZelhJNFlPdnFYSktM?=
 =?utf-8?B?dWpJZjExKzFpSk9jaWNhd1pVbWFYVTROTFMyVmUrY1BRQnNpbFBmTmczSDVp?=
 =?utf-8?B?T2xTclNGcE95UUVsc0JiVG1oenNZWFJ6bzBrYWo1OXYrREFnYmhJTDY2end1?=
 =?utf-8?B?M3NQRmk0clRwdlZRbVFPVmhQdS8rNERDMXZuM2EzVVZKdk5iVktqTExzeU5V?=
 =?utf-8?B?L1NDbXVHTjBYR1k1Qi96V1JMV1ZYUDJVK2plU2Uya2ZneDViNzhDLzNiYUF1?=
 =?utf-8?B?V3drNVY5YVptVlB4dE5VdG9TRG5OZXJ2ZXVmZFExb25wREUwd0FZbU5nR21Y?=
 =?utf-8?B?WjlIbDR5Y1VqVExwWWJQaGtiNWRTUW5mYVlCT2x6TUZ2allRdkJKWEF3Ky83?=
 =?utf-8?B?eVBCalpySUZyNTdGanlobk02T2NSSklFSkF2dVNHeXpZRkNVbElISUwrbGx4?=
 =?utf-8?B?allaRzU0QVRyc216Tis3aFYxTzdZVnBmRG5QSE10Q0QyMVNaLzEvR2tyUVpS?=
 =?utf-8?B?U0ZrWnU0cFdUdm1PdTVCUWZ0a2tLZy9tSnc0Qm9UZzFSR3lWV0FMbEZQVnlw?=
 =?utf-8?B?T1dqNkE0NzBaZnp3MjYrNHBrRFV0ZHJ5Q2NBY1V0NUVLamRUd2JQblNleWlk?=
 =?utf-8?B?OUo1UEhCS3o0a2xiVDQyK1hTa0d4a21qMGJhUXZrVSswYThhTE1RejhyZFIv?=
 =?utf-8?B?SjNEQjhPaldZbGxQbk16Q1VTSnk1TUdqdXM1aDd1OGN3WG11cGhDa1R0amNo?=
 =?utf-8?B?Y00yTXdhc2R2aUhoZWJoMW5OUE82NUNSOXlucjF3d2Y1VCtsVWJFbzdjaVlU?=
 =?utf-8?B?b2lJZjRwd25XVjZOU21xYk5COWJPblg1MVJPeVMrSUtiWTN3YUVjOVViZ005?=
 =?utf-8?B?bTVFeldUeGZobjBGWE1yZStNc2pnR2xqNGhWVTdIemZLYlZzSVlVSG9zbmdm?=
 =?utf-8?B?UGxoSkwyY3pIYzM3WmtCZHN0MmpWWS8vNGk1dktJS1hudlVMUmRrbmZlaFVW?=
 =?utf-8?B?OVRTRm12RkVYMUdWbjVZSkRQS2tWWnNlc29SQnV4dU1QTW1KMXl3d2hFNnc5?=
 =?utf-8?B?YnVIb1ZqemdGdzR1eUVCSldZRVRTVGlHbVNMeEZUUWhtK0ZYdFEwMWVJUTQv?=
 =?utf-8?B?alF3d3pUaVZyMkxQYlZxdDRwMGhoL0plV3IyelNyN0s5VDRpeWtEdlRMY2dN?=
 =?utf-8?B?eVRtYUNweC9aTEZMK2luRVdVRStkRnNGdlhPVXd4cmpyOXFEcFNoZ3BHZ0wv?=
 =?utf-8?B?bmdQN0I5OThRazRUTjl0dG9UN1J1Ym1oeWhFZkorZERxWkRtc1VMRHQ0ZTZX?=
 =?utf-8?B?bDJiVFZGcXg4akNrRDVpWmZlcFQ2eEM4dUtMZHdjTGNHN1VXZ25YYUFsWHdp?=
 =?utf-8?B?WktyUjlsa3JuL2doWko4NzFDRzFLelNkTjFZT1hBdTR0SCs4UFhVVW5MWlhy?=
 =?utf-8?B?dXVnd1hrWkRrOE5WMWZvV1dxMlBJa3VpbS9wVExVVnc3TnZqY2Y5S1M2VitM?=
 =?utf-8?B?QUtocloyOG05S25rRnVKRGJmODVBTzZxOFp1UXBla1ZNRkRKZXY3T25xS3do?=
 =?utf-8?B?TlphU3RXZlViN1R0ZzNVemxJcXluRXQ2L3RFVytaYzRIaU9wN0hHMWdvTm9S?=
 =?utf-8?B?RFB4dVNsdVZlbTMrVEhYbHAzRU11RFdLV3Bzdi9KSFNyYjE3WW1iRWlIdWpu?=
 =?utf-8?B?OS9IQzUzc2RoV3FsYUdiWW8xYWZicXFGV3daZjAzZFJndllLc3NQd1JaR1VB?=
 =?utf-8?B?b0dZaHFueTFYZ0J0QUFqUmw5UWJmWFNxYmZWN3c4NnNaZkhjZ0M4Lytva24r?=
 =?utf-8?B?SjhTVFFvcDM1ZTRCUkhCeTlwWDYwakRtd3BFejJvUVpoME1xN3o0RkVya09U?=
 =?utf-8?B?c1NuVFRsZ0hTQzkxR21ORGZDbWl3d29iSlc4MmZKN0ZzT2wxNHFHd3I2QjRK?=
 =?utf-8?B?eG0yZnFSRm9UZUt6NlFzang2ZGdlZWdlTFVvSnE0VU1IQUtTMzBvVXVJWFZY?=
 =?utf-8?B?b2xaWVJLbEJrYkFsTXRtU09RaWpITk9EZG1yV2twaVRMTU5TVGVjZVVmakVy?=
 =?utf-8?Q?LwX57p?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGhWS2gySzIxRHVDTXg4eVVvcENSSVQxZzlTai9KNWtES2xvNFdxTDRwa1Bj?=
 =?utf-8?B?TXA2aTc2ZjZPUEp0cVpwamg0TUJkQit0NXFuenlVZVkzNnJOcmY1Y2xHSEpq?=
 =?utf-8?B?L09EMnNBSlg3a245WGNFS2RHcDl5UVo4TWVDdzRpKzJXd0hUV2ZwTlpqbWFm?=
 =?utf-8?B?ZDB2bkRQbnpqTStOSUNnbkNvWmcxbXJtUlRVS0RCemRNTmEzQUlNZ3I0RXRR?=
 =?utf-8?B?cDNjZkpxcFV6OXhuRkRBSmNUblZjM1pyN1RMSkI4M2dQak82bjIrcW5qbHda?=
 =?utf-8?B?akRnaGNkclh2SWdaRzdiUEFaY056LzNqSis3QXBaeU1pdWtEaEdyOXZTeHVt?=
 =?utf-8?B?SXcxVkEzbGliRWxnY0pHakR1RGhQVTJLYThRQzk4b09Iby9iZHJ3VWdwWkFi?=
 =?utf-8?B?RCtOYk54NHQ1QXZOMGZpdVR6ZXVhTlVWNW5LTGtsNEFuT2FzSXNLRk1uYWZs?=
 =?utf-8?B?a2RtRkZwTWFqbXRjZHBpTFpJU0VHSVo3VUVhTUp3U0NrM3BuR0luK1VCWkE4?=
 =?utf-8?B?LzBITHVaOVMwbDVrc2J4aWJzamlRN3cybzlBNDJMQ3JRanYxZ09SS3dwdjNx?=
 =?utf-8?B?cnZ2d0JrbXY5TmxhclVUQlFmSUZZV0YzSWtqdTM2bndIc2lFTWFHbm9WeVEy?=
 =?utf-8?B?ZXpHZ3RSQnNpWE1HZ3AvWi9NcThBQnJZZXdrdy9RSXk1cjNFbUcrRW5odzVH?=
 =?utf-8?B?aVpPSklGSEdmaUdlQzZIS2NFeDB0c3VFdjRxdk1LVHBQRDJFdEZxN0taaEhZ?=
 =?utf-8?B?WnpjTkNZOFI1TzJ1dkhpSExORGt4L0RrZ3owT3VSVTlHdy8xTCtHMTlVckIr?=
 =?utf-8?B?dS94bjhTMFFvSlllN1N2QjZlWjQ4aDVHVm1GMTlEeWI3Vkdac0xvc1l3ZjU2?=
 =?utf-8?B?QTJJbDh5ZnRRNWNhb3VYR0FEV1lZTVZJL3FRQ0orMEF6T3ZEcEcycGpnZDVk?=
 =?utf-8?B?UDVDbHdtSkZmYlBuQWFYTUV3ZGFtOVlTOVhURXYzOGwxemx3Rk9LR1dCMm5C?=
 =?utf-8?B?NjhMOG5yUkxSQUVjT2MxbnQzMGhJVlh1V0h6akc5STRvWDZtUTNLVzYyU2tF?=
 =?utf-8?B?c082VXo5RkRGYjdsL1h0U0Z5dTl1UWg0WFJOaUhUOUwwV1pqckJBbVpPTDBw?=
 =?utf-8?B?TEJnSE9TK1UwTjVLc3JVNWhNWXBYaXhwQ3dNVDVTZnZOQWNndVpaVHVvRWly?=
 =?utf-8?B?NGp6S0dDTUZSS3Z4QVhkeHowRi9VdUNsNGxpME52OXJUNk54UVVHT29OQ1dj?=
 =?utf-8?B?bDRaU1U4V2VxTXNwSURSdzkyLzcvMzR3aCs2eDdTWnpFcE0yUnZzZGM5Rjlr?=
 =?utf-8?B?ejcyeTlmRzFtalVGVUhnd2QxQVpaNy9MdzN6NXFneFNCaE9QRG1jbTlkbUFF?=
 =?utf-8?B?ckhhUkpkZHBseFJ3UFJ6aVNwNVhmOHd0ZmRYaGNJQ0NLeEM3UVNUbG50Ulgv?=
 =?utf-8?B?Z3o3ZVZBUEZIaWVRL0ZtWkRXcCtzWklkS0lQNjZnZ0VpaXFlcWJQekdUbXUv?=
 =?utf-8?B?Y2l2MnR3NU1XUmtJZDNENjhnUExjdHRkYkppYm55Szd3UUh2ZmVDUmt3TGhj?=
 =?utf-8?B?OFJPQ0g5N1RMQzBIT0VjTHVieDZmaDBYUGY5OEIza0dIQkFJU2g1L245Q2lT?=
 =?utf-8?B?YU96WlFDS1JjVUMvMGhhSU1MWHdoNnlOOEEycTd1cUlOS1lWQVNtcjVZUGh6?=
 =?utf-8?B?MUYyTGFPUmIwcml0ZDdnalMzbWNmc3FIdGcwMk1rWWFHSmZSUXZKc3ltWHgw?=
 =?utf-8?B?dnJWTzdyU2hTdnpPN1RlSWRQaU91SEtVMHRLcktOMDd6UGpaN1dmb29VZmlp?=
 =?utf-8?B?RzA3Qkh4SlNVQmsyZW9RbmFFTGxMTStVU0t4VnBtVGszcjJMRzI2aG14dFVn?=
 =?utf-8?B?UmdTS2pVTm1QaFBsdWp5a0M4b1l4YWY5dFQvTnd6bGhPYTZmZFZIWFJTcVpv?=
 =?utf-8?B?VDNaenlhV1FDU1UzNCs3Z2JWbTNJTUdKeVJQNUJEUHVXZTdoNnZiSzR4M0I3?=
 =?utf-8?B?ZndKWEhubEFSQ1NZL0puejNhV3VqZzcyMGJ4c2Y2b01XK3JIZFNUL3dxbG5n?=
 =?utf-8?B?bms5eUxsaUFHWXp1emt3NGN5SmNFbjVIK0xZVVhXWW5SeGpiQndnbUNWa1V4?=
 =?utf-8?B?aW8yeklaaVdjcDgvbjc5eXZrWGE2L1JleUtxMXlidnN6V2NTK3RJTTBLaHVr?=
 =?utf-8?B?T0JzSWVIU3JjTUFYOVczcUlSdkpSaXBtYUxZaHZsVDBpTjVBVVAvNmEwSG10?=
 =?utf-8?B?U3NvOERpNnMrVS84LzJJTUQ3OEZKbjU0amFGRUx5S2kwd2h0OFEwNzJLdkp3?=
 =?utf-8?B?SlA5V3ZBbXF3M3ZGbHZ1RXgzTTNIZ2Fqb1lFbE1yMHNubTNya3FBUmNPVmg3?=
 =?utf-8?Q?4AF+1MzEnWaZveko=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef268b59-c599-4d59-9156-08de602b6e8b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:14:38.9868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwHQ+G8o4mHDt9QA0iXBmYA6IzIbKusiKi9k7dYejf0Wje5c+3tE227TbCZuDkYeTTlMKklGsOclbmalVqprAFJ0pXeUZe+WnsKMn1UxUIo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5114
X-Proofpoint-ORIG-GUID: fnXeI3quNuYVhs3gcUfG_brectXlvaEL
X-Authority-Analysis: v=2.4 cv=KMVXzVFo c=1 sm=1 tr=0 ts=697cf512 cx=c_pps
 a=lT9N4OFqmOca6tf2P0aJdw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=j57RdskLAAAA:20 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=ssoiLI-z4nIonBgNgTMA:9 a=yBC6KlaNc_0GwChP:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ocp33sKsEv4A:10
 a=sDh6PsAAsdZ8pbU-uKAA:9 a=9hf_mMTQhtIGo3Ys:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=r-HJ9bD__24A:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE0NyBTYWx0ZWRfXxrxWUHj8ktx6
 pzhSbQ03ZTlPFf0JhgDvRWcqFD3CBvaV5msUSdmuH8z3+p/4CfGqGlaOSuSRIbDzjfHysRG3JlP
 nzDBHp29RKBCSZWL2S0BBqCDlrfvNRkuaZqiVLP3L/tyXe481b9x5lPixP4BRsS5MrzvKfEIIYO
 bqb9nW48DmyGkkXdBxa0LrQXo4S8qhnN/OLzol5F1eP1nz6h8NuK46/dISw38BuF7hDjgk04SsF
 rBfbWipIhgQjFPSwCPkhEjHxZdp1d7R1l15IAvb2v2z942EsseZjXmjJk+9ZOwbTxOpu+Y94sqq
 7aKGW5GD0wqGTOoLI3C2tQPx0ZC5kgijs8cPa4eyl+zf677q6dttugIF6PMHNSny6xJ5LYErhKs
 eW0Trh34OvO2EpMTzC5lyTSdsoGvjAJYvO6jJTDs3ngq3ImQ+aEOgCkGwM049TOrc1528qnwnvj
 SAHOGv8trJpV6TSUnOw==
X-Proofpoint-GUID: fnXeI3quNuYVhs3gcUfG_brectXlvaEL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-30_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300147
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jan 2026 18:14:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230201

--------------iU3IJZXlyxBmKbpohXwFWPox
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60UGuUU8799309

Summary: LGTM.

Some comments for future commit logs and a request for Sundeep below.

On 2026-01-30 8:41 a.m., Hemanth.KumarMD via lists.openembedded.org wrote=
:
> From: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
>
> https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/
> Rust changes:https://github.com/rust-lang/rust/releases/tag/1.93.0
> Cargo changes:https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#ca=
rgo-193-2026-01-22
>
> * rust-oe-selftest.patch updated for 1.93:
>    Renamed UI test directive from add-core-stubs to add-minicore as in
>    https://github.com/rust-lang/rust/commit/3796f7de57f5d4cf4325d1f13ae=
b07fdaa57983b

>
> * OE-selftests:
>    - Exclude src/tools/remote-test-client from test suite.
>      This unit test modifies the TEST_DEVICE_ADDR environment variable,
>      which breaks the OE test harness that uses the same variable for
>      QEMU remote testing. Filed a bug with upstream:
>      https://github.com/rust-lang/rust/issues/151823

If you need to do a v2,
please include the number of tests that we skipped before and are now=20
skipping in your commit log right before the test results.

Something like:
 =C2=A0 Tests skipped: 36 -> 37
Some python code to count those lines programmatically, thanks to Gemini:
=E2=9D=AF python3 -c "import ast; tree =3D=20
ast.parse(open('meta/lib/oeqa/selftest/cases/rust.py').read());=20
print([len(n.value.elts) for n in ast.walk(tree) if isinstance(n,=20
ast.Assign) for t in n.targets if isinstance(t, ast.Name) and t.id =3D=3D=
=20
'exclude_list'][0])"
36


Okay. The IP address they use to test that timeouts work is:

 =C2=A0 127.69.69.69:6969

( so may 69s, someone likes that number! )

Anyway, that's a:
*Loopback Address:* Any address in the range of *127.0.0.0 to=20
127.255.255.255* is reserved for loopback or localhost.

and on my system at least is pingable but I'm not sure if the intent was =
to
use an invalid address. The code could make that clear by using an
intermediate variable such as invalid_ip_addr =3D ...


Oh, a bit off topic but I noticed in:
https://github.com/rust-lang/rust/blob/main/src/doc/rustc-dev-guide/src/t=
ests/running.md

that there is the env var: RUST_TEST_THREADS that seems to default to 1.=20
We should check if anyone really runs that with > 1 or >> 1 and if so,=20
see if we can use more cores in when running our Rust tests.

Sundeep, Please create an YP enhancement in bugzilla and assign it to=20
yourself. Reply with the link, please.

Approximately how long do the tests take per target arch to run now?

>    - Enable +v8a feature for cortexa57.
>      Rust 1.93.0 added a regression test (PR #149549) to verify that th=
e
>      ARMv8-A system register ttbr0_el2 is recognized in inline assembly.
>      This addresses issue #97724 where LLVM wasn't recognizing ttbr0_el=
2
>      as a valid register. Upstream Rust enables +v8a by default for all
>      AArch64 targets (PR #105026), but Yocto's custom target specificat=
ion
>      doesn't inherit this. Adding +v8a ensures LLVM recognizes ARMv8-A
>      system registers, fixing the test failure.
Super!
>
>      Related upstream links:
>      - PR #149549:https://github.com/rust-lang/rust/pull/149549
>      - Issue #97724:https://github.com/rust-lang/rust/issues/97724
>      - PR #105026:https://github.com/rust-lang/rust/pull/105026
>
> Test results:
>
> rust v1.93.0
> +-------------+--------+---------+
> | Machine     | Passed | Skipped |
> +-------------+--------+---------+
> | qemux86-64  | 21,689 |   646   |
> | qemux86     | 21,439 |   896   |
> | qemuarm64   | 21,495 |   840   |
> | qemuarm     | 21,421 |   914   |
> | qemuriscv64 | 21,466 |   869   |
> +-------------+--------+---------+
>
> Test results difference (1.93.0 - 1.92.0):
>
> +-------------+--------+---------+
> | Machine     | Passed | Skipped |
> +-------------+--------+---------+
> | qemux86-64  |  +205  |   +33   |
> | qemux86     |  +205  |   +33   |
> | qemuarm64   |  +206  |   +32   |
> | qemuarm     |  +205  |   +33   |
> | qemuriscv64 |  +205  |   +33   |
> +-------------+--------+---------+


Good.

>
> Signed-off-by: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
> ---
>   .../classes-recipe/rust-target-config.bbclass |  2 +
>   meta/conf/distro/include/tcmode-default.inc   |  2 +-
>   meta/lib/oeqa/selftest/cases/rust.py          |  1 +
>   .../rust/{cargo_1.92.0.bb =3D> cargo_1.93.0.bb} |  0
>   .../rust/files/rust-oe-selftest.patch         |  2 +-
>   ...ibstd-rs_1.92.0.bb =3D> libstd-rs_1.93.0.bb} |  0
>   ....92.0.bb =3D> rust-cross-canadian_1.93.0.bb} |  0
>   meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++---------=
-
>   meta/recipes-devtools/rust/rust-source.inc    |  2 +-
>   .../rust/{rust_1.92.0.bb =3D> rust_1.93.0.bb}   |  0
>   10 files changed, 45 insertions(+), 42 deletions(-)

I reviewed the changes below and they LGTM.

../Randy


>   rename meta/recipes-devtools/rust/{cargo_1.92.0.bb =3D> cargo_1.93.0.=
bb} (100%)
>   rename meta/recipes-devtools/rust/{libstd-rs_1.92.0.bb =3D> libstd-rs=
_1.93.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.92.0.bb =3D>=
 rust-cross-canadian_1.93.0.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust_1.92.0.bb =3D> rust_1.93.0.bb=
} (100%)
>
> diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/clas=
ses-recipe/rust-target-config.bbclass
> index a0a590bf62..2e83cf5aa7 100644
> --- a/meta/classes-recipe/rust-target-config.bbclass
> +++ b/meta/classes-recipe/rust-target-config.bbclass
> @@ -77,6 +77,8 @@ def llvm_features_from_tune(d):
>           f.append("+a15")
>       if 'cortexa17' in feat:
>           f.append("+a17")
> +    if 'cortexa57' in feat:
> +        f.append("+v8a")
>       if 'rv' in feat:
>           if 'm' in feat:
>               f.append("+m")
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/di=
stro/include/tcmode-default.inc
> index c6e00dea5e..0c82a81de6 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
>   GCCVERSION ?=3D "15.%"
>   SDKGCCVERSION ?=3D "${GCCVERSION}"
>   GLIBCVERSION ?=3D "2.42%"
> -RUSTVERSION ?=3D "1.92.0%"
> +RUSTVERSION ?=3D "1.93.0%"
>  =20
>   PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>   PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}" diff =
--git a/meta/lib/oeqa/selftest/cases/rust.py=20
> b/meta/lib/oeqa/selftest/cases/rust.py index 3a41391101..3ae1946e43=20
> 100644 --- a/meta/lib/oeqa/selftest/cases/rust.py +++=20
> b/meta/lib/oeqa/selftest/cases/rust.py @@ -70,6 +70,7 @@ class=20
> RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):=20
> 'src/tools/coverage-dump', 'src/tools/jsondoclint',=20
> 'src/tools/lint-docs', + 'src/tools/remote-test-client',=20
> 'src/tools/replace-version-placeholder', 'src/tools/rust-analyzer',=20
> 'src/tools/rustdoc-themes', diff --git=20
> a/meta/recipes-devtools/rust/cargo_1.92.0.bb=20
> b/meta/recipes-devtools/rust/cargo_1.93.0.bb similarity index 100%=20
> rename from meta/recipes-devtools/rust/cargo_1.92.0.bb rename to=20
> meta/recipes-devtools/rust/cargo_1.93.0.bb diff --git=20
> a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch=20
> b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch index=20
> d1fba81612..dc4ed9d94e 100644 ---=20
> a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch +++=20
> b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch @@ -207,7=20
> +207,7 @@ index 551485469d3..575db924968 100644 ---=20
> a/tests/ui/abi/rust-cold-works-with-rustic-args.rs +++=20
> b/tests/ui/abi/rust-cold-works-with-rustic-args.rs @@ -1,6 +1,7 @@ -=20
> //@ add-core-stubs + //@ add-minicore //@ build-pass //@=20
> compile-flags: -Clink-dead-code=3Dtrue +//@ ignore-riscv64 diff --git=20
> a/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb=20
> b/meta/recipes-devtools/rust/libstd-rs_1.93.0.bb similarity index 100%=20
> rename from meta/recipes-devtools/rust/libstd-rs_1.92.0.bb rename to=20
> meta/recipes-devtools/rust/libstd-rs_1.93.0.bb diff --git=20
> a/meta/recipes-devtools/rust/rust-cross-canadian_1.92.0.bb=20
> b/meta/recipes-devtools/rust/rust-cross-canadian_1.93.0.bb similarity=20
> index 100% rename from=20
> meta/recipes-devtools/rust/rust-cross-canadian_1.92.0.bb rename to=20
> meta/recipes-devtools/rust/rust-cross-canadian_1.93.0.bb diff --git=20
> a/meta/recipes-devtools/rust/rust-snapshot.inc=20
> b/meta/recipes-devtools/rust/rust-snapshot.inc index=20
> 4314734df4..7a0049c45d 100644 ---=20
> a/meta/recipes-devtools/rust/rust-snapshot.inc +++=20
> b/meta/recipes-devtools/rust/rust-snapshot.inc @@ -4,56 +4,56 @@ ##=20
> The exact (previous) version that has been used is specified in the=20
> source tarball. ## The version is replicated here. -SNAPSHOT_VERSION =3D=
 "1.91.0"
> +SNAPSHOT_VERSION =3D "1.92.0"
>  =20
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "f3ea3c964b7f3b884337f2d=
411764032bbd1722d7f55592a547cbb29afd87c03"
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "ff23dc81f796d64e34e8=
66a44fd0bcae726e34014835369b8f9393a544167eca"
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "003d7008219ca0d225ad1df=
a301f7c079b123499430ee0780c85782e0878eeff"
> -SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "a5f8bd961fb30962144d2f=
68be0bdd1014cf07110323087b0d6a68251a7a4eca"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D "7c8706fad4c038b5eacab00=
92e15db54d2b365d5f3323ca046fe987f814e7826"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D "ce2ab42c09d633b0a8b4=
b65a297c700ae0fad47aae890f75894782f95be7e36d"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D "cb2ce6be6411b986e25c71a=
d8a813f9dfbe3461738136fd684e3644f8dd75df4"
> +SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D "333ab38c673b589468b829=
3b525e5704fb52515d9d516ee28d3d34dd5a63d3c3"
>  =20
> -SRC_URI[rustc-snapshot-i686.sha256sum] =3D "bf718b184d6ace8fab0012835d=
129130a6dd6a8d78f4f742ae9308a86b96dfc5"
> -SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "059fe4b9802c3cb64b539cc=
501ff5e64f8d750573009c3004fd0b583b3f50d39"
> -SRC_URI[cargo-snapshot-i686.sha256sum] =3D "92486e31c070667681328ad57d=
d3bd4ca1e3d37958540d622b2afda9b67fbe3d"
> -SRC_URI[clippy-snapshot-i686.sha256sum] =3D "14cae2980accb8536ae700bb7=
ec6a3b540a06d84e7a4c71db1c7f05a17b1edbd"
> +SRC_URI[rustc-snapshot-i686.sha256sum] =3D "c1c920cd59e255e5dcf844af22=
b80483fe4b04ff04f143be6da69314bd6733f8"
> +SRC_URI[rust-std-snapshot-i686.sha256sum] =3D "abc840631a4462a4c8ec613=
41110ff653ab2ef86ef3b10f84489d00cc8a9310d"
> +SRC_URI[cargo-snapshot-i686.sha256sum] =3D "63001bbde1c036fae9ad624807=
bfb18117c7e7cb4a04de81adc4acc7e8580c07"
> +SRC_URI[clippy-snapshot-i686.sha256sum] =3D "f21090ddb01503ab7e326ff8b=
1ab44121611121e83572aa2dba2c5ceffe12d22"
>  =20
> -SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "04bdbb954f48fcd0b12=
5fbddbf3e59841ec81c58ff858471f7977c8343d9a73c"
> -SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "cb0c3c2704add4d1=
271713ff87e1b7a8a4f756b4dc9f580b62953532efd0f7b9"
> -SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "9437727091d30d73a98=
7e2c56463a2de4f01fb69cfd229617e2f8a7d8de5c05a"
> -SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "060a0eb3ee236e8a3b=
fb2cad9495165d755ea60d32e62ce85f12ad17c26afedf"
> +SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D "6207ea209b332c01437=
fe742c2ef2bc914c88b6d4f9a23a43bc01ad924f6e4a8"
> +SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D "62e2568ebf6f1add=
c750a8c32dd1fa4fef8d27679cbac33b837afeb54f204819"
> +SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D "32f4b393f1471d7d50c=
9a50512f02116187b3ea6a885c26ff2d74f87fa72baa8"
> +SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D "70783e0b31682938db=
53b78f87c948acfe589e3ece5dee6ae6aa5b667a384f3c"
>  =20
> -SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "c625de10cbfd21031f71fa6=
fdd50ccaffd449744614ef1f57ee3cefe80c57792"
> -SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "d5ecd84b78eefaf30fb6=
5ec169af1806bd06d0b5bbe166bf010b058c9c59d27f"
> -SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "1f8f0ac1b05acb7cc50592c=
a39ec78e374093a0701405e8ea1894bb64a7422cd"
> -SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "425e5a1a72cc20c4764166=
82cb5df4222c0b9c28fbb9818d4d8f505ccea578e3"
> +SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D "961cb6b8c2b5e969ad8eb02=
56fee43b88608b27310d946a7df3c9e9577139cae"
> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D "c3e809a324b00eb53096=
c58df38645bb496c6560de334dfe04ed0b77c0605aaa"
> +SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D "1249c64f95d8187b3a89cf8=
429329bdbc98f53a9fc538e898c95c487e3234d90"
> +SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D "93ed9fdd6fc2655c7789ed=
096d57a47178532b6bda1ec4480adca7920563e934"
>  =20
> -SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "139a077f72197ce73031d=
ae7cd2156fb6718b09fe9a3f4008266d34fb8d09ae6"
> -SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "ac046a72a957bf9fd1=
213e95d46d7ca431a6704f63e99c759ccdd9ae7c07f7d9"
> -SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "abc14cced999e0d5f0ec7=
5f10af33998dcaef39fab27b8e2c63b93ca0b79f2ab"
> -SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "b8129667c5b309636984=
66b7edeef4c5a1c869e78b5f9218fcf1426defa5cea9"
> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D "357dd4745f978080d35db=
b6192ecfea331abbb93d88be7d70407856b30722a40"
> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D "2ce706afa4a46b6773=
340854de877fc63618a40e351298a4e3da8eb482619863"
> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D "e94a8f97c3143158e285b=
4f8ade1fae844961caca30c0eeed44f6c14da484f05"
> +SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D "7912584254f455b90ed6=
ce6089c4efded33bb753d1bf948286ef2f4f782d2f30"
>  =20
> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "c526302dcf4f1627525=
b0eef3ef4181bea801f119c4a0963c3675b390cba164f"
> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "c79c071fd14ef094=
c1a2e750f19795e7e162f4237bf92299885c0d56fa6017fe"
> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "704bfa80ffeeafacb8f=
13043873e20e1b9c4a5e785ee6c5e7d0e5828fc1f0c8b"
> -SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "1571b18b39f97d808b=
9f10ed2697b9d87bc3959abf858bfcd3baf9eaf8d5d548"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D "f48a214ff6fa36a77de=
8a0a2ee009be8aa48ba1533792450aca5edac29497606"
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D "eba59766c2d9805c=
0a1fc82fd723acbb36569e1bec1088c037bba84d965f70ba"
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D "49dd01f5d10e3f36818=
1223db0fbf7dc191161f7d80a295de4909bf87e53da58"
> +SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D "873047278043e6506f=
5c98b8f633a9b96dc49ff83869a86a151fe5b1b9455044"
>  =20
> -SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "7c3d4ceaa630ddb45bcd5=
38c687637a349b2c3e18634a2b944178a7b4b42a4cc"
> -SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "7486237c83844d48ac=
96b67241ef0c1f4f702ceb74c44721f6f8660c3068dede"
> -SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "8946ea952e5a516e8bb6f=
d859d9798902877e01bd4508b717f8b9fd915019ad5"
> -SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "97feb6d6b2158b410a83=
c40d7eeba1e97220e505eae6666aa09d112665cc8dc1"
> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D "729f4c074ccda30bff493=
fa94f255bcfcec1be594fecd8a4d0f57da845121c64"
> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D "8ee20dcf3b1063fa60=
69b3ce85e1fcf42794dfa783263314865cb53fff42d9e4"
> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D "e8708d0a929ad15941ecd=
e368e8a156911927a805b492afafc737124b6aa55d4"
> +SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D "bdedabeedd48080e6ef7=
0376c52338fbb45ff80d1fbb12a81aa2d8cabbb706c8"
>  =20
> -SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "073c3817f91ff425ffa141a6d=
b215d54b50db5a8abe08fed593b7597687bdf94"
> -SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "454ecc9a53dda63762f3d1=
d92b7e4f4459c58c89d39a4178cce1fd9fd0ce09b5"
> -SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "3af10597a739402d6ecb3db85=
abaf62e12f7b298d2df6377c3c80e09a54f91b6"
> -SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "8d3bb8aa79abcfe5c24a3765=
1d09dd356f994663699e65e7dd9978514a5ebf31"
> +SRC_URI[rustc-snapshot-s390x.sha256sum] =3D "6a8cf614a74f7469c70d32b37=
8f0163633e6bbe19624b248b758501c5bcdfe84"
> +SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D "ebf944dc95015498d32250=
4a54e4f9cdb28590f7790aa3a9eb86d6cf4b6c93ff"
> +SRC_URI[cargo-snapshot-s390x.sha256sum] =3D "a290edf359a5632dfda3b2325=
a309d9edeb58c97de97e3cc67274335b58adf05"
> +SRC_URI[clippy-snapshot-s390x.sha256sum] =3D "41aa44f1cf37cac87b83e450=
eb19148c539ff266bb40dc146207ad5b9e1e1acc"
>  =20
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "a7169e8cb6174af2f4571770=
3370363d8de82ce55f6ccba185893045b9370874"
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "89e6520b16c12b4352644=
0298d2da0dcb70747c5cc2d0b8e47d39b5da9aeef49"
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "7103c03fb8abe85b23307005=
a9dfe4f01c826a89945d84b96fa2d03fd4d2d138"
> -SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "0087c3d58d2fdeafa89830c=
299b1026c9f981b49835db89c922b3c6a299b3225"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D "78b2dd9c6b1fcd2621fa81c6=
11cf5e2d6950690775038b585c64f364422886e0"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D "5f106805ed86ebf8df287=
039e53a45cf974391ef4d088c2760776b05b8e48b5d"
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D "e5e12be2c7126a7036c8adf5=
73078a28b92611f5767cc9bd0a6f7c83081df103"
> +SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D "2c1bf6e7da8ec50feba03fe=
188fc9a744ba59e2c6ece7970c13e201d08defa9a"
>  =20
> -SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "47e91cba208b1f87348e7b6=
a49274ebb4364651a4191fa67e6850e7813e26ad5"
> +SRC_URI[rust-std-snapshot-i586.sha256sum] =3D "8b984b31ffca1f27d32ee77=
ec2cc4c2ab59e72beab67bfce13bbd926dbea8715"
>  =20
> -SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "4f7bffb09cf5a0c25dda=
9b51811c60996eb1ae06a277c1e836980c21b3a44766"
> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D "d85afb14120c3c736733=
8a565a920db653dccd4bc5062398791d7b62b89fd1fd"
>  =20
>   SRC_URI +=3D " \
>       ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-=
std-snapshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-=
devtools/rust/rust-source.inc
> index d7d44510e4..514f3fec1e 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -9,7 +9,7 @@ SRC_URI +=3D"https://static.rust-lang.org/dist/rustc-${=
RUST_VERSION}-src.tar.xz;n=20
> file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdi=
r=3D${RUSTSRC}=20
> \=20
> file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;=
patchdir=3D${RUSTSRC}=20
> \ "
> -SRC_URI[rust.sha256sum] =3D "ebee170bfe4c4dfc59521a101de651e5534f4dae8=
89756a5c97ca9ea40d0c307"
> +SRC_URI[rust.sha256sum] =3D "e30d898272c587a22f77679f03c5e8192b5645c7c=
9ccc3407ad1106761507cea"
>  =20
>   RUSTSRC =3D "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
>  =20
> diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-d=
evtools/rust/rust_1.93.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.92.0.bb
> rename to meta/recipes-devtools/rust/rust_1.93.0.bb
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230197):https://lists.openembedded.org/g/openembedd=
ed-core/message/230197
> Mute This Topic:https://lists.openembedded.org/mt/117544255/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------iU3IJZXlyxBmKbpohXwFWPox
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">Summary: LGTM.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">Some comments for future commit logs
      and a request for Sundeep below.</div>
    <div class=3D"moz-cite-prefix"><br>
    </div>
    <div class=3D"moz-cite-prefix">On 2026-01-30 8:41 a.m.,
      Hemanth.KumarMD via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260130134137.2463745-1-Hemanth.=
KumarMD@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">From: Hemanth Kumar M D <a cla=
ss=3D"moz-txt-link-rfc2396E" href=3D"mailto:Hemanth.KumarMD@windriver.com">=
&lt;Hemanth.KumarMD@windriver.com&gt;</a>

<a class=3D"moz-txt-link-freetext" href=3D"https://blog.rust-lang.org/2026/=
01/22/Rust-1.93.0/">https://blog.rust-lang.org/2026/01/22/Rust-1.93.0/</a>
Rust changes: <a class=3D"moz-txt-link-freetext" href=3D"https://github.com=
/rust-lang/rust/releases/tag/1.93.0">https://github.com/rust-lang/rust/rele=
ases/tag/1.93.0</a>
Cargo changes: <a class=3D"moz-txt-link-freetext" href=3D"https://doc.rust-=
lang.org/nightly/cargo/CHANGELOG.html#cargo-193-2026-01-22">https://doc.rus=
t-lang.org/nightly/cargo/CHANGELOG.html#cargo-193-2026-01-22</a>

* rust-oe-selftest.patch updated for 1.93:
  Renamed UI test directive from add-core-stubs to add-minicore as in
  <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/r=
ust/commit/3796f7de57f5d4cf4325d1f13aeb07fdaa57983b">https://github.com/rus=
t-lang/rust/commit/3796f7de57f5d4cf4325d1f13aeb07fdaa57983b</a></pre>
    </blockquote>
    <br>
    <blockquote type=3D"cite" cite=3D"mid:20260130134137.2463745-1-Hemanth.=
KumarMD@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

* OE-selftests:
  - Exclude src/tools/remote-test-client from test suite.
    This unit test modifies the TEST_DEVICE_ADDR environment variable,
    which breaks the OE test harness that uses the same variable for
    QEMU remote testing. Filed a bug with upstream:
    <a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang=
/rust/issues/151823">https://github.com/rust-lang/rust/issues/151823</a></p=
re>
    </blockquote>
    <p>If you need to do a v2, <br>
      please include the number of tests that we skipped before and are
      now skipping in your commit log right before the test results. <br>
      <br>
      Something like:<br>
      &nbsp; Tests skipped: 36 -&gt; 37<br>
      Some python code to count those lines programmatically, thanks to
      Gemini:<br>
      =E2=9D=AF python3 -c &quot;import ast; tree =3D
      ast.parse(open('meta/lib/oeqa/selftest/cases/rust.py').read());
      print([len(n.value.elts) for n in ast.walk(tree) if isinstance(n,
      ast.Assign) for t in n.targets if isinstance(t, ast.Name) and t.id
      =3D=3D 'exclude_list'][0])&quot;<br>
      36<br>
      <br>
    </p>
    <p><br>
    </p>
    <p>Okay. The IP address they use to test that timeouts work is:</p>
    &nbsp; 127.69.69.69:6969<br>
    <p>( so may 69s, someone likes that number! )<br>
      <br>
      Anyway, that's a:<br>
      &nbsp;&nbsp;&nbsp; <span class=3D"T286Pc" data-sfc-cp=3D"" data-proce=
ssed=3D"true"><strong class=3D"Yjhzub" data-processed=3D"true">Loopback Add=
ress:</strong>
        Any address in the range of <strong class=3D"Yjhzub" data-processed=
=3D"true">127.0.0.0 to 127.255.255.255</strong> is
        reserved for loopback or localhost.<br>
        <br>
        and on my system at least is pingable but I'm not sure if the
        intent was to <br>
        use an invalid address. The code could make that clear by using
        an <br>
        intermediate variable such as invalid_ip_addr =3D ...<br>
        <br>
        <br>
        Oh, a bit off topic but I noticed in:<br>
        &nbsp;&nbsp;
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/rust-lang/rus=
t/blob/main/src/doc/rustc-dev-guide/src/tests/running.md">https://github.co=
m/rust-lang/rust/blob/main/src/doc/rustc-dev-guide/src/tests/running.md</a>=
</span><span style=3D"white-space: pre-wrap"> </span></p>
    <p><span style=3D"white-space: pre-wrap">that there is the env var:=20
   RUST_TEST_THREADS
that seems to default to 1. We should check if anyone really runs that with=
 &gt; 1 or &gt;&gt; 1 and
if so, see if we can use more cores in when running our Rust tests. </span>=
</p>
    <p><span style=3D"white-space: pre-wrap">Sundeep,=20
Please create an YP enhancement in bugzilla and assign it to yourself. Repl=
y with the link, please.
</span></p>
    <p><span style=3D"white-space: pre-wrap">Approximately how long do the =
tests take per target arch to run now?
</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span><span style=3D"white-space: pre-wrap">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:20260130134137.2463745-1-Hemanth.=
KumarMD@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">  - Enable +v8a feature for co=
rtexa57.
    Rust 1.93.0 added a regression test (PR #149549) to verify that the
    ARMv8-A system register ttbr0_el2 is recognized in inline assembly.
    This addresses issue #97724 where LLVM wasn't recognizing ttbr0_el2
    as a valid register. Upstream Rust enables +v8a by default for all
    AArch64 targets (PR #105026), but Yocto's custom target specification
    doesn't inherit this. Adding +v8a ensures LLVM recognizes ARMv8-A
    system registers, fixing the test failure.</pre>
    </blockquote>
    Super!<br>
    <blockquote type=3D"cite" cite=3D"mid:20260130134137.2463745-1-Hemanth.=
KumarMD@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

    Related upstream links:
    - PR #149549: <a class=3D"moz-txt-link-freetext" href=3D"https://github=
.com/rust-lang/rust/pull/149549">https://github.com/rust-lang/rust/pull/149=
549</a>
    - Issue #97724: <a class=3D"moz-txt-link-freetext" href=3D"https://gith=
ub.com/rust-lang/rust/issues/97724">https://github.com/rust-lang/rust/issue=
s/97724</a>
    - PR #105026: <a class=3D"moz-txt-link-freetext" href=3D"https://github=
.com/rust-lang/rust/pull/105026">https://github.com/rust-lang/rust/pull/105=
026</a>

Test results:

rust v1.93.0
+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  | 21,689 |   646   |
| qemux86     | 21,439 |   896   |
| qemuarm64   | 21,495 |   840   |
| qemuarm     | 21,421 |   914   |
| qemuriscv64 | 21,466 |   869   |
+-------------+--------+---------+

Test results difference (1.93.0 - 1.92.0):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |  +205  |   +33   |
| qemux86     |  +205  |   +33   |
| qemuarm64   |  +206  |   +32   |
| qemuarm     |  +205  |   +33   |
| qemuriscv64 |  +205  |   +33   |
+-------------+--------+---------+</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Good.<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20260130134137.2463745-1-Hemanth.=
KumarMD@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

Signed-off-by: Hemanth Kumar M D <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:Hemanth.KumarMD@windriver.com">&lt;Hemanth.KumarMD@windriver.com&gt=
;</a>
---
 .../classes-recipe/rust-target-config.bbclass |  2 +
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/lib/oeqa/selftest/cases/rust.py          |  1 +
 .../rust/{cargo_1.92.0.bb =3D&gt; cargo_1.93.0.bb} |  0
 .../rust/files/rust-oe-selftest.patch         |  2 +-
 ...ibstd-rs_1.92.0.bb =3D&gt; libstd-rs_1.93.0.bb} |  0
 ....92.0.bb =3D&gt; rust-cross-canadian_1.93.0.bb} |  0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 78 +++++++++----------
 meta/recipes-devtools/rust/rust-source.inc    |  2 +-
 .../rust/{rust_1.92.0.bb =3D&gt; rust_1.93.0.bb}   |  0
 10 files changed, 45 insertions(+), 42 deletions(-)</pre>
    </blockquote>
    <p>I reviewed the changes below and they LGTM.</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20260130134137.2463745-1-Hemanth.=
KumarMD@windriver.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">
 rename meta/recipes-devtools/rust/{cargo_1.92.0.bb =3D&gt; cargo_1.93.0.bb=
} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.92.0.bb =3D&gt; libstd-rs_1=
.93.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.92.0.bb =3D&gt; r=
ust-cross-canadian_1.93.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.92.0.bb =3D&gt; rust_1.93.0.bb} =
(100%)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-=
recipe/rust-target-config.bbclass
index a0a590bf62..2e83cf5aa7 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -77,6 +77,8 @@ def llvm_features_from_tune(d):
         f.append(&quot;+a15&quot;)
     if 'cortexa17' in feat:
         f.append(&quot;+a17&quot;)
+    if 'cortexa57' in feat:
+        f.append(&quot;+v8a&quot;)
     if 'rv' in feat:
         if 'm' in feat:
             f.append(&quot;+m&quot;)
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro=
/include/tcmode-default.inc
index c6e00dea5e..0c82a81de6 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D &quot;gettext&qu=
ot;
 GCCVERSION ?=3D &quot;15.%&quot;
 SDKGCCVERSION ?=3D &quot;${GCCVERSION}&quot;
 GLIBCVERSION ?=3D &quot;2.42%&quot;
-RUSTVERSION ?=3D &quot;1.92.0%&quot;
+RUSTVERSION ?=3D &quot;1.93.0%&quot;
=20
 PREFERRED_VERSION_gcc ?=3D &quot;${GCCVERSION}&quot;
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D &quot;${GCCVERSION}<a clas=
s=3D"moz-txt-link-rfc2396E" href=3D"mailto:diff--gita/meta/lib/oeqa/selftes=
t/cases/rust.pyb/meta/lib/oeqa/selftest/cases/rust.pyindex3a41391101..3ae19=
46e43100644---a/meta/lib/oeqa/selftest/cases/rust.py+++b/meta/lib/oeqa/self=
test/cases/rust.py@@-70,6+70,7@@classRustSelfTestSystemEmulated(OESelftestT=
estCase,OEPTestResultTestCase):'src/tools/coverage-dump','src/tools/jsondoc=
lint','src/tools/lint-docs',+'src/tools/remote-test-client','src/tools/repl=
ace-version-placeholder','src/tools/rust-analyzer','src/tools/rustdoc-theme=
s',diff--gita/meta/recipes-devtools/rust/cargo_1.92.0.bbb/meta/recipes-devt=
ools/rust/cargo_1.93.0.bbsimilarityindex100%renamefrommeta/recipes-devtools=
/rust/cargo_1.92.0.bbrenametometa/recipes-devtools/rust/cargo_1.93.0.bbdiff=
--gita/meta/recipes-devtools/rust/files/rust-oe-selftest.patchb/meta/recipe=
s-devtools/rust/files/rust-oe-selftest.patchindexd1fba81612..dc4ed9d94e1006=
44---a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch+++b/meta/rec=
ipes-devtools/rust/files/rust-oe-selftest.patch@@-207,7+207,7@@index5514854=
69d3..575db924968100644---a/tests/ui/abi/rust-cold-works-with-rustic-args.r=
s+++b/tests/ui/abi/rust-cold-works-with-rustic-args.rs@@-1,6+1,7@@-//@add-c=
ore-stubs+//@add-minicore//@build-pass//@compile-flags:-Clink-dead-code=3Dt=
rue+//@ignore-riscv64diff--gita/meta/recipes-devtools/rust/libstd-rs_1.92.0=
.bbb/meta/recipes-devtools/rust/libstd-rs_1.93.0.bbsimilarityindex100%renam=
efrommeta/recipes-devtools/rust/libstd-rs_1.92.0.bbrenametometa/recipes-dev=
tools/rust/libstd-rs_1.93.0.bbdiff--gita/meta/recipes-devtools/rust/rust-cr=
oss-canadian_1.92.0.bbb/meta/recipes-devtools/rust/rust-cross-canadian_1.93=
.0.bbsimilarityindex100%renamefrommeta/recipes-devtools/rust/rust-cross-can=
adian_1.92.0.bbrenametometa/recipes-devtools/rust/rust-cross-canadian_1.93.=
0.bbdiff--gita/meta/recipes-devtools/rust/rust-snapshot.incb/meta/recipes-d=
evtools/rust/rust-snapshot.incindex4314734df4..7a0049c45d100644---a/meta/re=
cipes-devtools/rust/rust-snapshot.inc+++b/meta/recipes-devtools/rust/rust-s=
napshot.inc@@-4,56+4,56@@##Theexact(previous)versionthathasbeenusedisspecif=
iedinthesourcetarball.##Theversionisreplicatedhere.-SNAPSHOT_VERSION=3D">&q=
uot;
diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/=
cases/rust.py
index 3a41391101..3ae1946e43 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -70,6 +70,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPT=
estResultTestCase):
                             'src/tools/coverage-dump',
                             'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/remote-test-client',
                             'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
diff --git a/meta/recipes-devtools/rust/cargo_1.92.0.bb b/meta/recipes-devt=
ools/rust/cargo_1.93.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.92.0.bb
rename to meta/recipes-devtools/rust/cargo_1.93.0.bb
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta=
/recipes-devtools/rust/files/rust-oe-selftest.patch
index d1fba81612..dc4ed9d94e 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -207,7 +207,7 @@ index 551485469d3..575db924968 100644
 --- a/tests/ui/abi/rust-cold-works-with-rustic-args.rs
 +++ b/tests/ui/abi/rust-cold-works-with-rustic-args.rs
 @@ -1,6 +1,7 @@
- //@ add-core-stubs
+ //@ add-minicore
  //@ build-pass
  //@ compile-flags: -Clink-dead-code=3Dtrue
 +//@ ignore-riscv64
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb b/meta/recipes-=
devtools/rust/libstd-rs_1.93.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.92.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.93.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.92.0.bb b/met=
a/recipes-devtools/rust/rust-cross-canadian_1.93.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.92.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.93.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-de=
vtools/rust/rust-snapshot.inc
index 4314734df4..7a0049c45d 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,56 +4,56 @@
 ## The exact (previous) version that has been used is specified in the sou=
rce tarball.
 ## The version is replicated here.
=20
-SNAPSHOT_VERSION =3D &quot;</a>1.91.0&quot;
+SNAPSHOT_VERSION =3D &quot;1.92.0&quot;
=20
-SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D &quot;f3ea3c964b7f3b884337f2=
d411764032bbd1722d7f55592a547cbb29afd87c03&quot;
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D &quot;ff23dc81f796d64e34e=
866a44fd0bcae726e34014835369b8f9393a544167eca&quot;
-SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D &quot;003d7008219ca0d225ad1d=
fa301f7c079b123499430ee0780c85782e0878eeff&quot;
-SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D &quot;a5f8bd961fb30962144d2=
f68be0bdd1014cf07110323087b0d6a68251a7a4eca&quot;
+SRC_URI[rustc-snapshot-aarch64.sha256sum] =3D &quot;7c8706fad4c038b5eacab0=
092e15db54d2b365d5f3323ca046fe987f814e7826&quot;
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] =3D &quot;ce2ab42c09d633b0a8b=
4b65a297c700ae0fad47aae890f75894782f95be7e36d&quot;
+SRC_URI[cargo-snapshot-aarch64.sha256sum] =3D &quot;cb2ce6be6411b986e25c71=
ad8a813f9dfbe3461738136fd684e3644f8dd75df4&quot;
+SRC_URI[clippy-snapshot-aarch64.sha256sum] =3D &quot;333ab38c673b589468b82=
93b525e5704fb52515d9d516ee28d3d34dd5a63d3c3&quot;
=20
-SRC_URI[rustc-snapshot-i686.sha256sum] =3D &quot;bf718b184d6ace8fab0012835=
d129130a6dd6a8d78f4f742ae9308a86b96dfc5&quot;
-SRC_URI[rust-std-snapshot-i686.sha256sum] =3D &quot;059fe4b9802c3cb64b539c=
c501ff5e64f8d750573009c3004fd0b583b3f50d39&quot;
-SRC_URI[cargo-snapshot-i686.sha256sum] =3D &quot;92486e31c070667681328ad57=
dd3bd4ca1e3d37958540d622b2afda9b67fbe3d&quot;
-SRC_URI[clippy-snapshot-i686.sha256sum] =3D &quot;14cae2980accb8536ae700bb=
7ec6a3b540a06d84e7a4c71db1c7f05a17b1edbd&quot;
+SRC_URI[rustc-snapshot-i686.sha256sum] =3D &quot;c1c920cd59e255e5dcf844af2=
2b80483fe4b04ff04f143be6da69314bd6733f8&quot;
+SRC_URI[rust-std-snapshot-i686.sha256sum] =3D &quot;abc840631a4462a4c8ec61=
341110ff653ab2ef86ef3b10f84489d00cc8a9310d&quot;
+SRC_URI[cargo-snapshot-i686.sha256sum] =3D &quot;63001bbde1c036fae9ad62480=
7bfb18117c7e7cb4a04de81adc4acc7e8580c07&quot;
+SRC_URI[clippy-snapshot-i686.sha256sum] =3D &quot;f21090ddb01503ab7e326ff8=
b1ab44121611121e83572aa2dba2c5ceffe12d22&quot;
=20
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D &quot;04bdbb954f48fcd0b1=
25fbddbf3e59841ec81c58ff858471f7977c8343d9a73c&quot;
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D &quot;cb0c3c2704add4d=
1271713ff87e1b7a8a4f756b4dc9f580b62953532efd0f7b9&quot;
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D &quot;9437727091d30d73a9=
87e2c56463a2de4f01fb69cfd229617e2f8a7d8de5c05a&quot;
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D &quot;060a0eb3ee236e8a3=
bfb2cad9495165d755ea60d32e62ce85f12ad17c26afedf&quot;
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] =3D &quot;6207ea209b332c0143=
7fe742c2ef2bc914c88b6d4f9a23a43bc01ad924f6e4a8&quot;
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] =3D &quot;62e2568ebf6f1ad=
dc750a8c32dd1fa4fef8d27679cbac33b837afeb54f204819&quot;
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] =3D &quot;32f4b393f1471d7d50=
c9a50512f02116187b3ea6a885c26ff2d74f87fa72baa8&quot;
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] =3D &quot;70783e0b31682938d=
b53b78f87c948acfe589e3ece5dee6ae6aa5b667a384f3c&quot;
=20
-SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D &quot;c625de10cbfd21031f71fa=
6fdd50ccaffd449744614ef1f57ee3cefe80c57792&quot;
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D &quot;d5ecd84b78eefaf30fb=
65ec169af1806bd06d0b5bbe166bf010b058c9c59d27f&quot;
-SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D &quot;1f8f0ac1b05acb7cc50592=
ca39ec78e374093a0701405e8ea1894bb64a7422cd&quot;
-SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D &quot;425e5a1a72cc20c476416=
682cb5df4222c0b9c28fbb9818d4d8f505ccea578e3&quot;
+SRC_URI[rustc-snapshot-powerpc.sha256sum] =3D &quot;961cb6b8c2b5e969ad8eb0=
256fee43b88608b27310d946a7df3c9e9577139cae&quot;
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] =3D &quot;c3e809a324b00eb5309=
6c58df38645bb496c6560de334dfe04ed0b77c0605aaa&quot;
+SRC_URI[cargo-snapshot-powerpc.sha256sum] =3D &quot;1249c64f95d8187b3a89cf=
8429329bdbc98f53a9fc538e898c95c487e3234d90&quot;
+SRC_URI[clippy-snapshot-powerpc.sha256sum] =3D &quot;93ed9fdd6fc2655c7789e=
d096d57a47178532b6bda1ec4480adca7920563e934&quot;
=20
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D &quot;139a077f72197ce73031=
dae7cd2156fb6718b09fe9a3f4008266d34fb8d09ae6&quot;
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D &quot;ac046a72a957bf9fd=
1213e95d46d7ca431a6704f63e99c759ccdd9ae7c07f7d9&quot;
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D &quot;abc14cced999e0d5f0ec=
75f10af33998dcaef39fab27b8e2c63b93ca0b79f2ab&quot;
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D &quot;b8129667c5b30963698=
466b7edeef4c5a1c869e78b5f9218fcf1426defa5cea9&quot;
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] =3D &quot;357dd4745f978080d35d=
bb6192ecfea331abbb93d88be7d70407856b30722a40&quot;
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] =3D &quot;2ce706afa4a46b677=
3340854de877fc63618a40e351298a4e3da8eb482619863&quot;
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] =3D &quot;e94a8f97c3143158e285=
b4f8ade1fae844961caca30c0eeed44f6c14da484f05&quot;
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] =3D &quot;7912584254f455b90ed=
6ce6089c4efded33bb753d1bf948286ef2f4f782d2f30&quot;
=20
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D &quot;c526302dcf4f162752=
5b0eef3ef4181bea801f119c4a0963c3675b390cba164f&quot;
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D &quot;c79c071fd14ef09=
4c1a2e750f19795e7e162f4237bf92299885c0d56fa6017fe&quot;
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D &quot;704bfa80ffeeafacb8=
f13043873e20e1b9c4a5e785ee6c5e7d0e5828fc1f0c8b&quot;
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D &quot;1571b18b39f97d808=
b9f10ed2697b9d87bc3959abf858bfcd3baf9eaf8d5d548&quot;
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] =3D &quot;f48a214ff6fa36a77d=
e8a0a2ee009be8aa48ba1533792450aca5edac29497606&quot;
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] =3D &quot;eba59766c2d9805=
c0a1fc82fd723acbb36569e1bec1088c037bba84d965f70ba&quot;
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] =3D &quot;49dd01f5d10e3f3681=
81223db0fbf7dc191161f7d80a295de4909bf87e53da58&quot;
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] =3D &quot;873047278043e6506=
f5c98b8f633a9b96dc49ff83869a86a151fe5b1b9455044&quot;
=20
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D &quot;7c3d4ceaa630ddb45bcd=
538c687637a349b2c3e18634a2b944178a7b4b42a4cc&quot;
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D &quot;7486237c83844d48a=
c96b67241ef0c1f4f702ceb74c44721f6f8660c3068dede&quot;
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D &quot;8946ea952e5a516e8bb6=
fd859d9798902877e01bd4508b717f8b9fd915019ad5&quot;
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D &quot;97feb6d6b2158b410a8=
3c40d7eeba1e97220e505eae6666aa09d112665cc8dc1&quot;
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] =3D &quot;729f4c074ccda30bff49=
3fa94f255bcfcec1be594fecd8a4d0f57da845121c64&quot;
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] =3D &quot;8ee20dcf3b1063fa6=
069b3ce85e1fcf42794dfa783263314865cb53fff42d9e4&quot;
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] =3D &quot;e8708d0a929ad15941ec=
de368e8a156911927a805b492afafc737124b6aa55d4&quot;
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] =3D &quot;bdedabeedd48080e6ef=
70376c52338fbb45ff80d1fbb12a81aa2d8cabbb706c8&quot;
=20
-SRC_URI[rustc-snapshot-s390x.sha256sum] =3D &quot;073c3817f91ff425ffa141a6=
db215d54b50db5a8abe08fed593b7597687bdf94&quot;
-SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D &quot;454ecc9a53dda63762f3d=
1d92b7e4f4459c58c89d39a4178cce1fd9fd0ce09b5&quot;
-SRC_URI[cargo-snapshot-s390x.sha256sum] =3D &quot;3af10597a739402d6ecb3db8=
5abaf62e12f7b298d2df6377c3c80e09a54f91b6&quot;
-SRC_URI[clippy-snapshot-s390x.sha256sum] =3D &quot;8d3bb8aa79abcfe5c24a376=
51d09dd356f994663699e65e7dd9978514a5ebf31&quot;
+SRC_URI[rustc-snapshot-s390x.sha256sum] =3D &quot;6a8cf614a74f7469c70d32b3=
78f0163633e6bbe19624b248b758501c5bcdfe84&quot;
+SRC_URI[rust-std-snapshot-s390x.sha256sum] =3D &quot;ebf944dc95015498d3225=
04a54e4f9cdb28590f7790aa3a9eb86d6cf4b6c93ff&quot;
+SRC_URI[cargo-snapshot-s390x.sha256sum] =3D &quot;a290edf359a5632dfda3b232=
5a309d9edeb58c97de97e3cc67274335b58adf05&quot;
+SRC_URI[clippy-snapshot-s390x.sha256sum] =3D &quot;41aa44f1cf37cac87b83e45=
0eb19148c539ff266bb40dc146207ad5b9e1e1acc&quot;
=20
-SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D &quot;a7169e8cb6174af2f457177=
03370363d8de82ce55f6ccba185893045b9370874&quot;
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D &quot;89e6520b16c12b435264=
40298d2da0dcb70747c5cc2d0b8e47d39b5da9aeef49&quot;
-SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D &quot;7103c03fb8abe85b2330700=
5a9dfe4f01c826a89945d84b96fa2d03fd4d2d138&quot;
-SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D &quot;0087c3d58d2fdeafa89830=
c299b1026c9f981b49835db89c922b3c6a299b3225&quot;
+SRC_URI[rustc-snapshot-x86_64.sha256sum] =3D &quot;78b2dd9c6b1fcd2621fa81c=
611cf5e2d6950690775038b585c64f364422886e0&quot;
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] =3D &quot;5f106805ed86ebf8df28=
7039e53a45cf974391ef4d088c2760776b05b8e48b5d&quot;
+SRC_URI[cargo-snapshot-x86_64.sha256sum] =3D &quot;e5e12be2c7126a7036c8adf=
573078a28b92611f5767cc9bd0a6f7c83081df103&quot;
+SRC_URI[clippy-snapshot-x86_64.sha256sum] =3D &quot;2c1bf6e7da8ec50feba03f=
e188fc9a744ba59e2c6ece7970c13e201d08defa9a&quot;
=20
-SRC_URI[rust-std-snapshot-i586.sha256sum] =3D &quot;47e91cba208b1f87348e7b=
6a49274ebb4364651a4191fa67e6850e7813e26ad5&quot;
+SRC_URI[rust-std-snapshot-i586.sha256sum] =3D &quot;8b984b31ffca1f27d32ee7=
7ec2cc4c2ab59e72beab67bfce13bbd926dbea8715&quot;
=20
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D &quot;4f7bffb09cf5a0c25dd=
a9b51811c60996eb1ae06a277c1e836980c21b3a44766&quot;
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] =3D &quot;d85afb14120c3c73673=
38a565a920db653dccd4bc5062398791d7b62b89fd1fd&quot;
=20
 SRC_URI +=3D &quot; \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=3Drust-std-s=
napshot-${RUST_BUILD_ARCH};subdir=3Drust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index d7d44510e4..514f3fec1e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,7 +9,7 @@ SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"htt=
ps://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile://rev=
ert-link-std-statically-in-rustc_driver-feature.patch;patchdir=3D${RUSTSRC}=
\file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;pat=
chdir=3D${RUSTSRC}\">&quot;https://static.rust-lang.org/dist/rustc-${RUST_V=
ERSION}-src.tar.xz;n
             file://revert-link-std-statically-in-rustc_driver-feature.patc=
h;patchdir=3D${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-vari=
an.patch;patchdir=3D${RUSTSRC} \
 &quot;</a>
-SRC_URI[rust.sha256sum] =3D &quot;ebee170bfe4c4dfc59521a101de651e5534f4dae=
889756a5c97ca9ea40d0c307&quot;
+SRC_URI[rust.sha256sum] =3D &quot;e30d898272c587a22f77679f03c5e8192b5645c7=
c9ccc3407ad1106761507cea&quot;
=20
 RUSTSRC =3D &quot;${UNPACKDIR}/rustc-${RUST_VERSION}-src&quot;
=20
diff --git a/meta/recipes-devtools/rust/rust_1.92.0.bb b/meta/recipes-devto=
ols/rust/rust_1.93.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.92.0.bb
rename to meta/recipes-devtools/rust/rust_1.93.0.bb
</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#230197): <a class=3D"moz-txt-link-freetext" href=3D"htt=
ps://lists.openembedded.org/g/openembedded-core/message/230197">https://lis=
ts.openembedded.org/g/openembedded-core/message/230197</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.o=
penembedded.org/mt/117544255/3616765">https://lists.openembedded.org/mt/117=
544255/3616765</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openembed=
ded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openem=
bedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.opene=
mbedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/ope=
nembedded-core/unsub</a> [<a class=3D"moz-txt-link-abbreviated" href=3D"mai=
lto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
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

--------------iU3IJZXlyxBmKbpohXwFWPox--

