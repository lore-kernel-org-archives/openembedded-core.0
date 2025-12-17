Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D69AD6406F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 02:59:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5409.1765940346981981684
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 18:59:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=eNje4USx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4446d33a3f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH1suBa2147412
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 02:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+sOVqf5WN59dV+ob7FymEDIQs0z8PGp6KVDjgui8j+w=; b=
	eNje4USxpivxEMepDw7hjao9b/Urt4H3C+KbH4FMkf9f648nF2n0YN9JmndIvOvw
	8OSHXXCYY4d6q1+Q0hnFe4XteUd6UN8cEJORLl1zRsvbH9qTsoT/mSkujX1nxRhG
	welmYZ5W3J6noTXgK0YDw4kk0YZ2LlDvVX7ZS2bg8QG+tKLeYV2LEI4JEa6PxgKg
	Wg8Vp5JBYioQ5lufVtugT77a5mT7Q144E7Y/nuGvx/t96xM8kSAShXHPkp9quSnb
	PdwYx5Cne7vgtaMemXSRKUOn6HjkQkgP6J5GdxIs5hcL9TxjmZ+8t4G/FkJ2G4ma
	Ae2GoWdmYkvoE+XPtFJgTw==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012049.outbound.protection.outlook.com [52.101.53.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0br1yq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 02:59:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dab8Xw+IABzqiT2tNbRelsSbiqa4GQw4tXDT7P0GPoVpQWL8hN8R8AJzc0QsrGC6eNPHUjQdp5fj+V5lu//Yu/0G885ToRvAqkAoogB8Jxrewv6QNdkgwvyBqJPwMGiXZOD44rDZArYCH+WOJ/X+ETPFSWR3PHVv8GPKgEoYJUHwz/chQmPSxu/d+fzPDJmTrTKn7zqDK4nhi326MKFcDgsNp8LbEQyTzDrkEmum1MPGvGn13xkqAD2d9UmHPZ8lhS/of5gp5P5Ez2ZPH5itJWkp/pwbiNGcEPATqbC3zUVZjUdTFPEdbk2Th3TzkBcP+mLQXML8wBZZwguwHD047w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sOVqf5WN59dV+ob7FymEDIQs0z8PGp6KVDjgui8j+w=;
 b=hKRJkudO5Kb2NpyyRKed/3lPNXrM0eKnIt7mrla6r2zWzA80NUwsHx9765JLeyWdG4BvX49hc6qaAWqf1J2ziaNXN/BylhZAzDSarejmJLh3aYtZpcR//QsJc1XV16SCFdjcpaGV4QtFQEZqHcRGtdr7hwdiEjP/X2rx+a1EDu2QhrKiU5SpTXSQpZiyd02SYObLnJB04uQ2Miwr+f/wY7Qep0+2Z2WFPVyJ1Tl/1pzI0XkGhWRGKPJJZelC/+KLn72LMVCaqUrhc7AZyOZCpSPFNqCWAVseGoeRjBzmaVobMCQD6tGbcZCDKgZS834s2ClzP80Dl5zsyGZNGQ17xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by MW4PR11MB8268.namprd11.prod.outlook.com (2603:10b6:303:1ef::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 02:59:02 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9412.005; Wed, 17 Dec 2025
 02:59:02 +0000
Message-ID: <a85b6698-ecc2-469c-8d89-cf9b631a0ce1@windriver.com>
Date: Wed, 17 Dec 2025 10:58:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] gstreamer1.0: install Gst-1.0.gir to
 ${libdir} for multilib
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        Randy MacLeod <Randy.MacLeod@windriver.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>
References: <18807B69349A79F6.984558@lists.openembedded.org>
 <c0d06db9-f163-4421-80ae-97136b09d6c5@windriver.com>
 <53587996-F67E-43F1-A6D1-2D8863D2A3B7@arm.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <53587996-F67E-43F1-A6D1-2D8863D2A3B7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR01CA0182.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::20) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|MW4PR11MB8268:EE_
X-MS-Office365-Filtering-Correlation-Id: 28020e8c-63d3-463b-cac6-08de3d183bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QkVDSFlEdGVsbUNnSWdlVnk2SDVTbjhkbFNQV1N0eHZiWGJ2YTArdnVSYmNN?=
 =?utf-8?B?cHZwYWNaeHdNYURsSGdGdmxXbUVLMEM5VmZUREVqL3JYVHU2c3R1OXlEYVVj?=
 =?utf-8?B?bjhacE0zRExOZzhkSVFWOGtwT2pzZVc2cTVneWRpUENkV3V2QVBpdDJ6ZEVX?=
 =?utf-8?B?bml1N1paYXY2SFkxVlNyd3haR2ppQ3NXcnN1ZlovSjFnUTRmZkxsMlBxTUU3?=
 =?utf-8?B?YVprYngzNkhPNjZVenB2bGNSUTFGZGh6dTZVc2ZFTURpeDNnQ2VXTU0zOHhV?=
 =?utf-8?B?R212N1JiUHdlVEprWVZrMzFHd3IzSnFEeXVxdDA5K1MvZmhOUVdYRTFGaGtD?=
 =?utf-8?B?Sjlmc1Q1T21FcDlNR0hLV3dqM0xHYklzdGJoRWJuQjdZNk1JT3pOZDN2RVRQ?=
 =?utf-8?B?M0RrYk1wc2pLQzRqdDNldkxNTytBelZiK2RBWTZyR3NYSjAveTBIc3lxbUNM?=
 =?utf-8?B?N3lQZWsyaHRDb3VldmswUnBxZlNBdUo1ck4ycmZTMlAzNU1sc1dyaFYxSDhJ?=
 =?utf-8?B?cTN2SEFZV2tCTEJSamxBRkxxcjNMdjZPeURlN3FxQndnUFk3eHQ5cUlxRGc0?=
 =?utf-8?B?NHJac2JScTkyZG9HOGlhaXNvRGdxb0YyLzdKanhwODQ5RnhYaklnalF1VWlS?=
 =?utf-8?B?MXRRaXQ5bU5lSExwOGFiTjk0YlpZQkhUNHluQXhvM1lMaUhiK1B0WjFIeE1V?=
 =?utf-8?B?cHdZVXBrTDJibFZOYmdydW5CcEJTYmI3YVNiSGRZbmNMRmxLQ1lLOVdRWXpp?=
 =?utf-8?B?Q2U4cEJaeUZva2NrR2tIZXJscCttZlg3bk8zS3JJdHhKeDFCRy9jcElib3lJ?=
 =?utf-8?B?aC81YTR5ZVUvNUIrUFZ1ekFqOW8xbmZtN0twenNYMlJJWFN4VkV1UmNPRzRD?=
 =?utf-8?B?dDdCQ1BsTlZnbndiWTBnc3Y1Ri9VSHZBdmE3dVQ5N0dQdGxxL3lxK1JtNlBm?=
 =?utf-8?B?Wld3aytmQ28wQ1ZvbTUxSzlCU1VuM0FMbkdpQjdoVjNoYnErcjNkMFBITnZV?=
 =?utf-8?B?ZStYR2x0ekN3MG1zZUF3b3dLT3FtL2ZVZ1FtTDF0OFVtU0dEeDhFYmpUdEJq?=
 =?utf-8?B?akIwRFAveThWdWc3VjUwUXMramRQRERBcUxjSzg1UTlkT2Jzb3ZyTEFrb3gv?=
 =?utf-8?B?MlRxS3lhaEdRcEc2ek9JYnBxRjczR1YvUmVOaUlhRW1tUXJTSVkrQTQvN05X?=
 =?utf-8?B?SDJvOFcxRU4vMmtZdEZkakZGa2dqckphNUxyK0pFM251SXg5S1oyeW9aUU1r?=
 =?utf-8?B?MDlJYnFscytWT2ZJSzNLdDdwUzhzU1lOMEl1aFRRSDRoOTRsNFpTOStVR3VB?=
 =?utf-8?B?YkxKSmJ5d0xIcXYyeW53SE5TSEZyVDlDSVhsc1JQY0lyYWVuY0c0Mnozb1Nx?=
 =?utf-8?B?bzQ0RWhpQnV4N2x5Nm83eDlFQkQvS0hSWUhNODBrOC94Z05zRzhCZFlkQUs3?=
 =?utf-8?B?NWdkVzhwL1Q3RnFrdUVrRVlNRUVmUGhWN2RIeWJ5RkMvdlpGaVZ3STN5dGxr?=
 =?utf-8?B?dFdxL3ZUMEZPOTBWT2k5MWc3dVNnSVhLNTNTWDdNNmJ1ZGVNcVJXQVJ2Sk5v?=
 =?utf-8?B?cTZwdk5yTEQ2ckhYNXhtWUQxTkFTcDduV1h5S2JueENWVnRhZEFia3R1cFNF?=
 =?utf-8?B?aDhBYnhEbzd0c2gvM2ZvYUE1bG9OUWQrYWNJVzgzSjdyOGFmM0ppYUlDbzBv?=
 =?utf-8?B?SUZ1WDI5RG5NNWtSdDBRajVrNExsZFM1VFg4UXhRem1raVQzS1JVVUtRcGVS?=
 =?utf-8?B?ekZORlRZb1RLRy9MVHpURVNUNXZWWFgrZFh6STFUVHpwNVBYaEY0MmdwOHVa?=
 =?utf-8?B?MDZidkhYSGJ5M0x4ZGZPbkZvdmE3R2R6OUw1anJFMjd2d0hLMU8rWXJ2OHI2?=
 =?utf-8?B?SzZDVnNZOEx1MjBabmN4NEYzT1N6S0VJQjFpWm83RyswNzN4d0lsRGk0SjNN?=
 =?utf-8?B?NmFxQTUxcXFHL3pYcXExVHVrK05tcTFydFQwSTYxeUNjaU44NjkrSm5xRnp5?=
 =?utf-8?B?R2N2cDF6bkR3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NnVyQUx5QWNnRmszeXJVd0NCZFRPQUx1WEhnZXF0K2VGN1B3QUlTZjdBSWJD?=
 =?utf-8?B?T1BXNnZydGE0dWlKdVJ5STV3b1pKTHJBNXhFUVlkemxTZmlKeFNuZ1hJTGho?=
 =?utf-8?B?T0FQWXBRbVFNQ0VwSzZrc3o1Vm1HengyRHdjOUt4VHNqcVhWRE10T0NEWWpF?=
 =?utf-8?B?TnVXZ21rN2NpKzZSVEFzaU1NTUZMQk9nK0k0V3NrMldVemZyOW5aRjdnM3dR?=
 =?utf-8?B?VzJ6RXlxNDNjT0NRM3VxOVZYMTZqSlFWMWozZ20wM3h4NmljR3JCKzVqd1J1?=
 =?utf-8?B?MTNkV1NwOFRtUTd3M2ZVU0VMZDgrMkVXSWVrS0dJVEVEbDF4ZnhDaUZZdFZh?=
 =?utf-8?B?QlR3Nnh3WTEyL2dRUzFQUXN2VldKUzdqY25TOE1HdU1UZ0FBTEhxTWFGamU4?=
 =?utf-8?B?T3o2U3B1eEg0YU5MMDNXTm1TUHZxQjc4NWFyd3RtVGZOdUlRL29pZ1EvVjls?=
 =?utf-8?B?S3F6RnBxazFqbmNUZ0p6bzkvcWV3VmIrY1gxUHQvTytMc1puSFdPbHByZHhF?=
 =?utf-8?B?aHpQcVcrMlV5V2ZlU0liVE1maWNXTFp1dVk1MGt3ZkVCU1dYeENSVjROZFJv?=
 =?utf-8?B?S2xkKzF6eHdRLy9rdUJWM3haT3dZejNpVThaTTd1QTRUU0dxQy9qVTNONjR5?=
 =?utf-8?B?REkxaXNsL2lsR05KWXVhaXJwbjQyait1bENZZmlENlk5Y3pORjc1WDV5THov?=
 =?utf-8?B?bTBmMVQxWjlTR0ZBclVVWDErR1F6QVJsTUpwbmh0VVRKWGNPdlpoOFIvMU5R?=
 =?utf-8?B?d2d3YnpRSWhIVmVvM05OY1RyR2R4a2tVKzF4Z3FodzlDVnRGT3BKTkVkc0Ja?=
 =?utf-8?B?bXplbnplT2wzdVI3a0d1TnFkNjFURnZXeUxybGV2S3BQd1k1aVRndlNvUFhj?=
 =?utf-8?B?RmZFZStxazBUY0JydWlsN0wrQStQbzc5WVVzZWJURTM4a2xWVEtkcHdyN3N1?=
 =?utf-8?B?WDBBT0hGaG5YSndiMW5NMU5BVXBzcWNld0JZcGpGVG1oRmxyR0tTRWgramsx?=
 =?utf-8?B?b2N5aGFrL0hRcHcrN3pPOGVaUkZ3NjBWcFl0OFR4QnR5MVhIZTR6RU9RSE5l?=
 =?utf-8?B?dTZab1FpaWtzYjl2YTJjUzdjblhmOUk4R1RIRlhMNkdoaHpKYkljSWZIZE5l?=
 =?utf-8?B?Z1J0a3lSMURLNlVBUGthd2hXeEVySDl0MTdMWm5ZM05US1ZucC9EOFhtcFQ1?=
 =?utf-8?B?ZnBvR2JWS3Yyanc4dTJudkpXcUcrZVBzQzZoWTRHd1ZRY0RCM3VUS3BRcmRR?=
 =?utf-8?B?THZpSU1DU25UZjdZN1VFS09tbURuRk4rdWl6YXdPdEtSSEU5czYzdWtsR3ZE?=
 =?utf-8?B?TkxlcFdXeEpuSzN1YTVrRVhiYTdKcENBZEw0L0NwanFEakVIMEJITlZMdGRP?=
 =?utf-8?B?T1hQMDRucUEvMWxoNmVGZENoVFE2UkkxN3V6RTdpQ0cweXVjaU9WL1R1QThG?=
 =?utf-8?B?NFYwQ1BJT3dIdnpRUUtLdk9XWEhzS2xncjdHL1BlSk1YcUhnRHNNUVNJdENF?=
 =?utf-8?B?SlZhcTdlbjdMTGZJLytseWpRMEJEa2lUVlhPdVhkODUrS2dXN2FzUVRpeE9u?=
 =?utf-8?B?UGcyMzFSVnJUeWhjY1hMVWhKN09yL0MwZzd4c2hWbUhyaXFUUnFPOWdTbmtn?=
 =?utf-8?B?RW9nc3p4TUZ3b0hTOUxnVmhxRlJsN1Bma3VESGd2WW1wK05YMkJwdUQ3TWlE?=
 =?utf-8?B?RzVjdmd1RHBaQm9QSGlhSUg1SE10UTR5RFRUWFNMeFhZZnNDZ1FFdGlWdnAr?=
 =?utf-8?B?RmVjUW5hTk1XdGV0Y29FMytydmxNbUlQaHJ1alNIdFBJSExPNWJsZUhTQUw4?=
 =?utf-8?B?RUM3dHMvTStCZC9CeEd3eWtRWm5kUE42VVBiTUVuK2tSY0NHeHgvUXpYRnMw?=
 =?utf-8?B?bFQrRzErVnRQZ3VoV1VQMDFtWGt6Zi83QnBjNmYrRkcwRTN1THZZcUtoL0sx?=
 =?utf-8?B?MXdyWGJ1dDk5SzFmMW9LYzhzSDdFcXJlVWcxN0tlcWE1SW1nWXlPVWxBblFk?=
 =?utf-8?B?c2VjMmd3SGNLdUFCYXJXd21IcGl5dDRacmgxU3puLzU3dkxqelI3dW5nQ2da?=
 =?utf-8?B?ZlBpTUFvMDk1UFArSU9YYzhtYVJjdjlFUWFpdmt3ZTU3dDA2dnBjaE9SZWp2?=
 =?utf-8?B?UENTbkFvN0VpZVE5OXlyU2Rpci9rR0tYNWZpWlhUem1wTXd1UUFRakFKMzJ6?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28020e8c-63d3-463b-cac6-08de3d183bb2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 02:59:02.6004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g+Gjigcp12Osgj+NzcT++uM76cDNQxWcX2pAiMuvq1ul4rY9fv8vrsXzd//wa1+7DZ/eamZfDuMsssoLVthJfgmAj0vYk/aQ23+0cqPUvBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8268
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDAyMiBTYWx0ZWRfX5PUc/Fm6Eqct
 fljsC8XTAsOONqKPGlzA4Dhzpwllavy+ehKAE3uO5snzr8uLW5HLilkhc80TzOjmVXGssbkyRfL
 0IOpYAZt4WktbqWAsVHfVuWMDC3TS1R+WYIB2XAyzhrLbgJAWSze0MFCHRH5BRSVzeWPS07rGT8
 dF7XUt+XO2Xx0EhGCmR4dlxXF+6uMG5O57rKujqppFl/B6OCK3CR6g2IQTDRkfkVNQqk1urlgEd
 E5AcsQI9bDtCKkoFReVoj+w046aWnbDE7dtueZGEztfDVVT3TLS0e0hNytdLnwPO/IiXQejbm0T
 yW9fZmSFbgodDWKsy0eAWcE6yj/xyQRSOpEFu4/ShAURkln2jVZa2qhUab04IsKsTTc086psmfg
 G5v8REiAbpn4KNud/Q9wAl3UxpopXg==
X-Proofpoint-ORIG-GUID: 8ncftpYXz4d3e2Z64Vqfc0OEaP2JiFaw
X-Proofpoint-GUID: Zmy76vGFfuR6XjErLQt9gC2WTrMhsQka
X-Authority-Analysis: v=2.4 cv=C+HkCAP+ c=1 sm=1 tr=0 ts=69421c79 cx=c_pps
 a=cC1MplHVCFGqAfo43Zf6QA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8
 a=tlNS4uzUJ01tNSQIwtwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170022
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BH1suBa2147412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 02:59:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227994

On 12/17/25 05:12, Ross Burton wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 16 Dec 2025, at 10:49, hongxu via lists.openembedded.org <hongxu.jia=
=3Dwindriver.com@lists.openembedded.org> wrote:
>> On 12/12/25 21:39, hongxu via lists.openembedded.org wrote:
>>> While installing 32 bit gstreamer package and 64 bit gstreamer packag=
e to
>>> one rootfs, package management (dnf) reported a conflict failure
>>> |Error: Transaction test error:
>>> |  file /usr/share/gir-1.0/Gst-1.0.gir conflicts between attempted in=
stalls of
>>> gstreamer1.0-dev-1.26.7-r0.wr2500.corei7_64 and lib32-gstreamer1.0-de=
v-1.26.7-r0.wr2500.corei7_32
>>>
>>> Due to upstream commit [1], the size of padding differs between 32 bi=
t
>>> arch and 64 bit arch
> The commit doesn=E2=80=99t exist anymore so that URL is 404, https://gi=
tlab.freedesktop.org/gstreamer/gstreamer/-/commit/0ee18781f9b210129da23a8=
5236266bf84bafa83 is a working link.
OK, I will update the link
> This is a bit of a complex problem and just mv'ing the file isn=E2=80=99=
t all of it.  It would be easier to just mv it in a do_install:append() c=
onsidering upstream doesn=E2=80=99t seem interested.  But the bigger prob=
lem is how does this interact with the rest of the G-I ecosystem? Is our =
G-I configured to search that location? What about PyGObject?

This patch reference glib [1][2][3], the meson option gir_dir_prefix:=20
'Intermediate prefix for gir installation under ${prefix}'

[1]=20
https://gitlab.gnome.org/GNOME/glib/-/blob/main/girepository/meson.build?=
ref_type=3Dheads#L24


and correctly install .gir files into custom locations [2]

[2]=20
https://gitlab.gnome.org/GNOME/glib/-/commit/22ec5a96e3d7b1e17a4b0c31e000=
89ed17a12050

> Absolutely worth referencing https://gitlab.gnome.org/GNOME/gobject-int=
rospection/-/issues/323 where the core issue in G-I is fixed, by adding s=
upport for GI_GIR_PATH. So if we=E2=80=99re going to move .gir files arou=
nd, that needs to be updated too.

and compile with option -DGIR_DIR=3D [3] for C

[3]=20
https://gitlab.gnome.org/GNOME/glib/-/blob/main/girepository/meson.build?=
ref_type=3Dheads#L88

>
> Also, does this _actually_ work?  Do we have on-target multi-arch g-ir-=
compilers so you can have a 64-bit rootfs with a 32-bit g-ir-compiler tha=
t does the right thing?  Bandaiding a solution that breaks other users, a=
nd doesn=E2=80=99t actually do anything useful, isn=E2=80=99t a solution.

I did not test it actually, yes, you are right, I will send v3 if=20
runtime test passed, otherwise just use original v1 [ gstreamer1.0: add=20
mulitlib scripts Gst-1.0.gir], treat as a multilib script

Alex, what is your option?

//Hongxu

> Ross



