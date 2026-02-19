Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DC2C531CB
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 20:57:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24535.1771534637109289683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 12:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BkIfaGZ5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=651017371c=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J9nva04179496
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 12:57:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=DtR8lrodkc1rAW5kKpeQzW
	TnLwHSQjn4zHZpIXYZxsY=; b=BkIfaGZ5Klfu4KlJInn0Li/nuw3Q1VNy4NaiaJ
	ClRKliGdlCKqELZOXZVAZGpvCZYPZJKkDDj9wgyLSkaTzYWP+uex7t1cQVShYLRN
	DMjJfbAlfHgXKzb/tQBRbNi7rHkTXlRhQjpQcw1XM5hC2JlWhVwWqRB4rkq2fuR2
	hBlLB0i+G8u1BJZN3p2ITnTP/+qSCl5HJ3knez106chdn2T/hXyuWOet9KeT9/uO
	vD0DZgFbQdMBxBqzX7e7On3KIArahW87HS9Tp6uquJ97yeWWUNBCeeHJFAoFpwzS
	dbcDIK6DAN/oHUwQb43Gn64r4SUC94hAjNcfEEWB6/6k5YDg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013067.outbound.protection.outlook.com [40.107.201.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cdtuagv5k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 12:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=frPCrnSJOAlP7KNnEWUkYXqFntYGbC1m6a6bhx047Al2fBO1hbV0Q2UbJYmKijfklQOUAHnsjmJNShdter3c5mSjO2BCM4FyxLpw+3oGKTaj/FL/h5sMW45ITMFUTru4xj85y4ezM7mQSwgq4SPlCZEKNXTaQzx1m83eyT1Zqavfqy92HX4qWv7SKLVyaE/WhBp5U4ah0NreltHBuXepWkHgC2lXaG7i5yaWv4/d7H2Id33JwYBRqwvqCc43W0AqN2u0p0EC5zqcZmqkhCiJFEp5DgYPIA3izk0MGjOwsR5mUYSMuSLvwCMI7PEcHKHzyhEy0x6jEe4LZCQ4wsog3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DtR8lrodkc1rAW5kKpeQzWTnLwHSQjn4zHZpIXYZxsY=;
 b=oVeOox0qabylikABajggxLvvF6jV9K9qNUy9T8lXUkWtE0MQh1wex2qoWc6HJzmzMN2hQnjqr+ClF/ewJSI24/laTBThamKbsNqHdhZl+vargn3RM3Acg98Mi6lOGPC83TBkBFb61cIZj6SDBcGVjB0Rau6PaXmAPbWWqaohTKCSFOk4c7bms1i/AxdtBzfGj6VcqsKW+d2s5uNm5WczJIJvV08nVJJVz7dTk1W+nvjnki604HRpbttDMFVxG/EMpZRpKwsqK/0IJ6FS1ZnP9rwOOuMe2vEeEv0yDTwrsSDCr8EPd+YXycmNb8Qv3pVIzuhB4adEojrkkis/3YaAqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 20:57:12 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 20:57:12 +0000
Content-Type: multipart/alternative;
 boundary="------------3TgreRpUKk7QPkVI9m6jIxpG"
Message-ID: <1263b317-6996-42c7-8cf3-163589ec16ad@windriver.com>
Date: Thu, 19 Feb 2026 15:57:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] socat: upgrading to 1.8.1.1 FAILED
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
        "Jia, Hongxu" <Hongxu.Jia@windriver.com>
References: <0101019c720ece81-b7ab8eac-2702-4d06-8f69-00cdbe191d9b-000000@us-west-2.amazonses.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <0101019c720ece81-b7ab8eac-2702-4d06-8f69-00cdbe191d9b-000000@us-west-2.amazonses.com>
X-ClientProxiedBy: BY3PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::34) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: ded5a958-64cc-4baa-e013-08de6ff97403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|376014|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aWo3emM0elFKWmpDQ3BLa1BWT1hydVRHU1JaRy9vZlBzcWczTFlnSmxYOU9K?=
 =?utf-8?B?by91MjhjSFIyWThGYzU3SDlsZW5EWUZRN3hjeG5DejhYckdQUkxKMjZnK1lT?=
 =?utf-8?B?alRFTEwySHF4MUVDYjZBUFlCTHRsVms4OU4xc2RxTGFPYjZhZUJYaWJNamYr?=
 =?utf-8?B?SC82V1FNVEphUjR0OVZXR0tWdjFxN0tGbmxqbE5RNWFpU3hIMFltYzZKMk9k?=
 =?utf-8?B?bFFQUGNXOE9jRThSeG40VTBJb3pUejVaZVlibWVBMHdhZzdXTURndzNFbW1k?=
 =?utf-8?B?ZkVheEtFeUxlUG1SLzFUOWtoc3Rkc1NwNTVnZ2RBMU8rOW9nQU5jWnVjUXJl?=
 =?utf-8?B?QTlwUUxJYnNtOWJKcFdiV3RIQis2OFFkTmU2TFpkb1pqTUlxV1RwOXZ5dVlz?=
 =?utf-8?B?MWlnUU95SmY4aTVlK3VZY0hMTjc2S0loSXZvaVJaSDg0dk1jYUpFR1pzaTR0?=
 =?utf-8?B?eDUzYzNhSXcvblFIZG9rcHlFT1dpZDV0eTVCV3kvQVhLM0tJTmhaSEo2OEF5?=
 =?utf-8?B?c0I4dG1VT1JlWjczUE1TYUVTK29hU1NPSXNUOCt1ekthNkYzZHJQMDVWclNY?=
 =?utf-8?B?SEg2dEdONm5la0FzUGNyakR5YVlYSTV6VG5hbnRFYjNHU2ZGNGZ6QU5pQ0pS?=
 =?utf-8?B?SGgxUmNVQzNHaHBoR000VDhxUzZQeTJ4bE9sSWJYT09JcWhkeDJBaWlxOFk5?=
 =?utf-8?B?bFJ5YVIzZlFhWVdIeTBQekhlWVZiNkNTMDFoWFRaRHhqSnZuN2tnUllzQnZa?=
 =?utf-8?B?d2p5TDFHZmlQU2J1UEdRcUhJQmhURWI4aFcwb0swbVhXTUxtZlJxOGdXVjBV?=
 =?utf-8?B?b3dDL1J4TFZkNlhpcUVEekwxU3VaMGRwQWN3cUJyZ05HK096RW5pL3lNZURk?=
 =?utf-8?B?dTVsQWlKUUtrbUN2bFhURjZYQzFRcm91cmRDeGg2L3ZPTndIVzFJVkJLUndn?=
 =?utf-8?B?bHVET2Y4ZzFUMU9qTExwVTZUWTlhS3dyNzRzV0FJSTFyd2xWWUxZTmM0VnBI?=
 =?utf-8?B?Nk1Fcis2WVYySndVUDNsZU9qcHY5TnZRcGNTT0x4MGs3U3FrVUVrazVwR3VQ?=
 =?utf-8?B?ZE8xK3k5ZmhoNytndlpiNW8rTUtVbSttUnR6Y1l4cXY2bDkyZzZrbDV2aHhF?=
 =?utf-8?B?ejJyemVjYzNzWTdCUTQvYnRyTnFzMmNYYXN2V2ZvaExaZlVEMFVOK200VXRU?=
 =?utf-8?B?ZmNPQUJ5eWZvZFVKeEd6eXFEMnBaQXlSVlpBSEZLd3U3ZlMwSWFENTRCeEsx?=
 =?utf-8?B?YUM1b1lrekRGMnNodTU1aHdZRHM5MUdTU3F2Z0c5aDM2aVlhdmhxWUZsZWl6?=
 =?utf-8?B?a2VYSVJtNWpnUXlSaG9Qc1BQN0JtMzg0ckNxMmxxUkdxMFJpeXM1aFVSNFEr?=
 =?utf-8?B?Q0xYS2NQK0NkTWlzc3YzU1o5RnZVWlZjVDVOY0NxZkVQY0hSR0VnMDBORjky?=
 =?utf-8?B?emI4Rk5ocWNJMVdlQnBHWjdWaGFEMElGbEZQSWdQV3NDN2pmd2tsaXFvSGpT?=
 =?utf-8?B?MCsxVzhZRWwrcWxTWXZ5UTFYaGYrcTlSY1daSW4zc1J6SzZnQlE4ZCtLSGtx?=
 =?utf-8?B?em01YytrU0dvd2pHS2NIT2t5ODRIQzVTQTZSMnJ0Zm5PQi9PWXY2R2ZlWlNM?=
 =?utf-8?B?UytyOFl4bStrNHpUeXk4R1dKQkFZaWlGemdKNHY0N1h3ZVY5emhRODA5bHYv?=
 =?utf-8?B?RitkUm9XQWhiL29aNWo2Y2hIY0VsSzlVcXQzRE1UaEU1aG9JRGpqOGxsaU1Q?=
 =?utf-8?B?R2tNY0ZwYmFidjVyUzZPb3hkcE9QNE5ZSWVCWStvZ05BcHlZVzFUQUw1OTFK?=
 =?utf-8?B?Z1N3MkVBbG5hNFd1dnN0L0cwNS94TTNLeFluMHNHMzBCcXlQdVlhcEs4Y0tn?=
 =?utf-8?B?Qkw4bnBvcmdveFQ0TEU5RDc1TW9sc1JLR0hKc1REY252NkxhMFZDL0N3b3JE?=
 =?utf-8?B?Zlp2cXdqQWhQQ2lnb3Q5VXROejZMNHVQcTRoT3d5bHNJN3BENGtlSVNNMEdJ?=
 =?utf-8?B?K1NjWFRyRCtiUDRJY3pKZkNZbVJSanRuSnhBeHFlQUdnRnVhUjZHNnNSKzF5?=
 =?utf-8?Q?sG19Ub?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(376014)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Njk5RlNIYWpxYkhlNTROMFo0bjc0WEIrUmc1U09NcGFjZUNqK2Z0SEFtUWht?=
 =?utf-8?B?TWMwQ0N6bGt0Q2c0Wi9wczZiQkVNME0vWUw2TVhNaDduUkNKcHFKUEVwQlBI?=
 =?utf-8?B?SWcvVnJiNktOeXp3cXZPcG90OEtEZnU5MnZLM2RROFRJc1Zac2tCbjNLM0x3?=
 =?utf-8?B?VjdSbml3dU9pZDVGVnc4TGZlWGpGUXNiY0o1cUk4Mk9BL2NBTGgxN3U2bkQw?=
 =?utf-8?B?L2NlMy9aVkh6cTdkU1A4Slc5Q0c0SHh4Mk1YUGs4RHJTMVVDVGN0SVEzajBk?=
 =?utf-8?B?QjZJWk90UDh5c21mVDNJeE80bVpEWUpadUdsL2QwcnZ5UTdyODFnZmxna1Yx?=
 =?utf-8?B?L05oaisvUndvWVo5R2xTWURrYUJGc1V3TERmaHVlVXM3WENTYllvSmc2Umdj?=
 =?utf-8?B?Wk14NStSRXFNeElWbW9DRmNHRG9qdDdlak0vcExqeGJJMnB1dk1Fa2RBSS90?=
 =?utf-8?B?ZkZ2b00zN0NWc2NvYktjUVoyQVVKUXo0azFFdFFCVzU3aWpmL3N2MTZScmp0?=
 =?utf-8?B?cEdVSDdzVmNoMTN5UmNDM3ZJOTZxc3dCUzJHY1FiMDExdS9iMWt0SHMwMmF5?=
 =?utf-8?B?dWxHdmgwb1NjMEVyZ1pheEVPRk5kL2VDYzNFVTQxa1laTmpkZ3VFT3VwMW5Q?=
 =?utf-8?B?NXZkZGpSdzRWcDNUK1kvRXhaNWliSDRVK0dmTFZTTms1U3YvQlZZYlQ0K1o4?=
 =?utf-8?B?dXZWTEk2dWR2SituRWQ3a3JOaXVKUlkvWHJ5SWVkN09JTnhSdGM4UndieDBM?=
 =?utf-8?B?MHZGYTEyQWVsTWQ3UmdvMk1lU0pZeG82N0dSVFNQQmdXOU96Nm90QnRpUm9q?=
 =?utf-8?B?bER1bnpwOTRFREI1R2ptSUgyTnFqcWx3TWF3ZHI3OWNlajNjb29LcFY3dXVX?=
 =?utf-8?B?RERkYktQVFlZUy9PdDB5azB0V3pCNW4rRllNVERLN2R0Q0ZwdjE5RitFeFZ0?=
 =?utf-8?B?bVl3aE5jK2hmTXBQUCsvcGJiNG91V1lNdCs3Z01PWEdEVXFuVmdYNEg5akU0?=
 =?utf-8?B?N1V3NGNuaDZZeXh1cE9CWE43ajUwK3p5UjhEMEozZmgyc2dwOERnZ1FIb01v?=
 =?utf-8?B?NUFpY3lLZ0VGUkZFcXM5YVpJcjZvd0NrckNFRlB6NE1PNmhiVFl0TC9MdU9i?=
 =?utf-8?B?QkxrRWdwY3FmU2M5ZU9TMFhaVk1LSlNVY2R2RUszWFNIRzFMTWhHZm5yb011?=
 =?utf-8?B?YjJXdU1lS2FBZVNMV2tGMDU1WGMzM1Y5R2dWQURLb243dWVSZittZG12VC9p?=
 =?utf-8?B?NDJ6T3hLNnM3cEhrNkwxSmo0UTF3SmVXYWNTOERBckp0cWRQOEV2UWppMndU?=
 =?utf-8?B?aVgyNTNNcmNDR2wyRjB1ZW1Cc2h1VjQxWndXZnV5Mm5VVTBpT1ZXSGloR1B5?=
 =?utf-8?B?ZGhmVG9mcTB2ZWc2U1FyOUp4Qmh6ZlJscGwyV1ZpU0hRV0k3dzZBaGlybm1J?=
 =?utf-8?B?ODNFcENTbTJjQkU1ektlU2FoTmc1N2JkdVhLMllLcTdKQkF4YXFKSklJYUNI?=
 =?utf-8?B?V0tZY0YwRGVuNEtEeVV5UWlVTzdldzMwN29OUWI1ZStDQXh4K1g1eGJNODFi?=
 =?utf-8?B?czA3OGxuVGVvdFJma2l1czdGb0tWNktkTTI2dFJWdytKRnBIWE9ETmxIdVVB?=
 =?utf-8?B?ZE9xTlRpMmprQVk4ZG1CWmdCamJhOTZMem9CYTY3Yy9FMG05c3YyMTMvTVhW?=
 =?utf-8?B?d0Juc1hiSHN1RnI1aGxKWng3dHk0S1RPTzJpOEpuYmQxUDhYNzhIdUFZako1?=
 =?utf-8?B?aCttV25ad0tmMmhIcmU5anplSEE5MGpucUloOVFVNUJ3U29SK2hSdnBreEYw?=
 =?utf-8?B?WFMxWElnbDFOWjg2ZThYb0VOYklmMnJOSUxCNC9WOHUxTitHK3ZsWlprREd5?=
 =?utf-8?B?d09kcENxeE1vMWhOeDRuYkdiWXFRMGgwdXNsQklNdGV1QnhFSzczOUVnZUhj?=
 =?utf-8?B?NlNnRjlnV01ZMlV6VWovU1ZzK2pkZ2FWbU9xV3puRHpicDBVNi9NV1NmeW5r?=
 =?utf-8?B?Q0hocThXTk5wSlZkRFJaRnkvUndPYnN2UFIyV1BPc2pHY2ZCNFcyTUNHaW92?=
 =?utf-8?B?MFc0RkkybmVkZEs4TGV3Zm90SDNWU3ZYMHB5SFVxblZHTGMxS0gyUVZHODFQ?=
 =?utf-8?B?WUw2dTMyZGxMY1hYQ1pNY1MxbDBMd2NnWXBDZ0VKNjhySjV5NHVTUzR4OUow?=
 =?utf-8?B?elhQOWt1Z0Zxc3o3THVpSllBbEw2SkpOTUJQTWd2MWkvZ0dYV2tKK2E1Qnpl?=
 =?utf-8?B?N3F3WVdXSWZoNm5hdEdjTm1mbjhHV2F4dklTamkyRFpyaDFUcFMxYmxCWGVN?=
 =?utf-8?B?TFlBd1ZWd0tsdnFRT1I1N1RYKzV4b252Y1NjVmxGWU1rNDJJaFJ1SmFGc2sy?=
 =?utf-8?Q?Rgx/PMSsZEkWQPv4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ded5a958-64cc-4baa-e013-08de6ff97403
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 20:57:12.2695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGANsVk0olcKjwC7SBQJwDlvH0E7fgzFJGj3cAIa8xJBQcqz3O59DcY3pv2m3E9ANLIlVeUpXF0A8vWS2XBcnEBJtLWaFSCAk3k3jWXns2A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=OqxCCi/t c=1 sm=1 tr=0 ts=6997792c cx=c_pps
 a=WMD2V7/OXcB8V+UEbxscyA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=rFFRleaeAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=24cWuJK5KgJzVlmNI0wA:9
 a=QEXdDO2ut3YA:10 a=B8ibFTVmAAAA:8 a=PCSvyhVM40FJggCoNxMA:9
 a=d8OY8GEF2APl-a_5:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=YLtI_f64H5IAZ6mI3Lwl:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=xvSgdcfEVHFitugM1GHH:22
X-Proofpoint-GUID: ZuRrL_FcLfj98YMPLu7S5V02bqk7JfyX
X-Proofpoint-ORIG-GUID: WGsh71-64tfo4AFC8oe5W0mhM_PmzAC_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE4OSBTYWx0ZWRfX32S81nn9SXWS
 9hcU4UlgN97WUiISRX7lS/SCeslh+zpaq5mDOS+9VCgnR9E5EOnJ2pK0H2IAdi8Hr42bENjLV1U
 N2f96JaQ6w1MPRBvksw5JLVFqSzLd+0D231Z+4hTSKBL46/xdaMJQk583rgHn3UMgA4Im0Fm5Q1
 yYAaUGmwifDN8uI9eS3VSimnn2H2MeztVK4UzBj2VPbNXJ5zfk6LRsfXPY6bNvBTX9pHTIIbiJ7
 t9wEx89JksMqZNXnd/v204YOpBXQfNp5ap0gfVwSM6hAOVWoyIVmRM1ekH4MY+ax3f2fBd4+0Dm
 tfMQksUnpFVapUhnhgtra0Hy1WjVXhltbw27O1rS334D8X8UH2cld7Z3DDXeqz1qesRc7PL2/Sy
 tQV9BxQ4cyhTO+dy9XqsPc+AcM+cKEwGXu/aaiWAdTDD6NbCWabYqmSpHZ1lLZVB6IXGTistVcI
 JLrZVLEtl20a5vm1qJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602190189
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 20:57:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231442

--------------3TgreRpUKk7QPkVI9m6jIxpG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-02-18 1:41 p.m., Auto Upgrade Helper via lists.openembedded.org 
wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *socat* to *1.8.1.1* has Failed (devtool error).

Khem, Hongxu,

I will do this upgrade soon, maybe tomorrow, if neither of you have it 
already and reply.

I see that Khem has some patches:
https://git.openembedded.org/openembedded-core-contrib/log/?h=yoe/mut
so I'll review them since at least one is merged in 1.8.1.1:

http://www.dest-unreach.org/socat/CHANGES


../Randy

>
> Detailed error information:
>
> Running 'devtool upgrade' for recipe socat failed.
> NOTE: Reconnecting to bitbake server...
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.16.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "5.3.99+snapshot-142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
> TUNE_FEATURES        = "m64 x86-64-v3"
> TARGET_FPU           = ""
> meta                 = "tmp-auh-upgrades:142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
> meta-yocto-bsp
> meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
> workspace            = "<unknown>:<unknown>"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
> Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> Loading cache...done.
> Loaded 0 entries from dependency cache.
> Parsing recipes...done.
> Parsing of 945 .bb files complete (0 cached, 945 parsed). 1953 targets, 42 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION           = "2.16.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "universal"
> TARGET_SYS           = "x86_64-poky-linux"
> MACHINE              = "qemux86-64"
> DISTRO               = "poky"
> DISTRO_VERSION       = "5.3.99+snapshot-142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
> TUNE_FEATURES        = "m64 x86-64-v3"
> TARGET_FPU           = ""
> meta                 = "tmp-auh-upgrades:142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff"
> meta-yocto-bsp
> meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
> workspace            = "<unknown>:<unknown>"
>
> Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
> Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
> NOTE: Writing buildhistory
> NOTE: Writing buildhistory took: 1 seconds
> Adding changed files:   0% |                                   | ETA:  --:--:--
> Adding changed files:   0% |                                   | ETA:  --:--:--
> Adding changed files: 100% |####################################| Time: 0:00:00
> INFO: Extracting current version source...
> INFO: Extracting upgraded version source...
> INFO: Fetchinghttp://www.dest-unreach.org/socat/download/socat-1.8.1.1.tar.bz2...
> INFO: Rebasing devtool onto 4a341d382601b8a880a0950671382f45493ef604
> WARNING: Command 'git rebase 4a341d382601b8a880a0950671382f45493ef604' failed:
> Auto-merging xio-netlink.c
> CONFLICT (content): Merge conflict in xio-netlink.c
>
> You will need to resolve conflicts in order to complete the upgrade.
> INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/socat
> INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/socat/socat_1.8.1.1.bb
>
>
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug athttps://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#231339):https://lists.openembedded.org/g/openembedded-core/message/231339
> Mute This Topic:https://lists.openembedded.org/mt/117879853/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------3TgreRpUKk7QPkVI9m6jIxpG
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2026-02-18 1:41 p.m., Auto Upgrade
      Helper via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:0101019c720ece81-b7ab8eac-2702-4d06-8f69-00cdbe191d9b-000000@us-west-2.amazonses.com">
      <pre wrap="" class="moz-quote-pre">Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *socat* to *1.8.1.1* has Failed (devtool error).</pre>
    </blockquote>
    <p>Khem, Hongxu,</p>
    <p>I will do this upgrade soon, maybe tomorrow, if neither of you
      have it already and reply.</p>
    <p>I see that Khem has some patches:<br>
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core-contrib/log/?h=yoe/mut">https://git.openembedded.org/openembedded-core-contrib/log/?h=yoe/mut</a><br>
      so I'll review them since at least one is merged in 1.8.1.1:</p>
    <p><a class="moz-txt-link-freetext" href="http://www.dest-unreach.org/socat/CHANGES">http://www.dest-unreach.org/socat/CHANGES</a></p>
    <p><br>
    </p>
    <p>../Randy</p>
    <blockquote type="cite" cite="mid:0101019c720ece81-b7ab8eac-2702-4d06-8f69-00cdbe191d9b-000000@us-west-2.amazonses.com">
      <pre wrap="" class="moz-quote-pre">

Detailed error information:

Running 'devtool upgrade' for recipe socat failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = &quot;2.16.0&quot;
BUILD_SYS            = &quot;x86_64-linux&quot;
NATIVELSBSTRING      = &quot;universal&quot;
TARGET_SYS           = &quot;x86_64-poky-linux&quot;
MACHINE              = &quot;qemux86-64&quot;
DISTRO               = &quot;poky&quot;
DISTRO_VERSION       = &quot;5.3.99+snapshot-142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff&quot;
TUNE_FEATURES        = &quot;m64 x86-64-v3&quot;
TARGET_FPU           = &quot;&quot;
meta                 = &quot;tmp-auh-upgrades:142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff&quot;
meta-yocto-bsp       
meta-poky            = &quot;master:2486ce2889062500e39446bc07c7d21120a0345e&quot;
workspace            = &quot;&lt;unknown&gt;:&lt;unknown&gt;&quot;

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 945 .bb files complete (0 cached, 945 parsed). 1953 targets, 42 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = &quot;2.16.0&quot;
BUILD_SYS            = &quot;x86_64-linux&quot;
NATIVELSBSTRING      = &quot;universal&quot;
TARGET_SYS           = &quot;x86_64-poky-linux&quot;
MACHINE              = &quot;qemux86-64&quot;
DISTRO               = &quot;poky&quot;
DISTRO_VERSION       = &quot;5.3.99+snapshot-142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff&quot;
TUNE_FEATURES        = &quot;m64 x86-64-v3&quot;
TARGET_FPU           = &quot;&quot;
meta                 = &quot;tmp-auh-upgrades:142fad2c3cb3c9044c4c97f6b0a2c251a31cfaff&quot;
meta-yocto-bsp       
meta-poky            = &quot;master:2486ce2889062500e39446bc07c7d21120a0345e&quot;
workspace            = &quot;&lt;unknown&gt;:&lt;unknown&gt;&quot;

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
done.
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching <a class="moz-txt-link-freetext" href="http://www.dest-unreach.org/socat/download/socat-1.8.1.1.tar.bz2">http://www.dest-unreach.org/socat/download/socat-1.8.1.1.tar.bz2</a>...
INFO: Rebasing devtool onto 4a341d382601b8a880a0950671382f45493ef604
WARNING: Command 'git rebase 4a341d382601b8a880a0950671382f45493ef604' failed:
Auto-merging xio-netlink.c
CONFLICT (content): Merge conflict in xio-netlink.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /srv/pokybuild/yocto-worker/auh/build/build/workspace/sources/socat
INFO: New recipe is /srv/pokybuild/yocto-worker/auh/build/build/workspace/recipes/socat/socat_1.8.1.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at <a class="moz-txt-link-freetext" href="https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler">https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler</a>

Regards,
The Upgrade Helper
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#231339): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/231339">https://lists.openembedded.org/g/openembedded-core/message/231339</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117879853/3616765">https://lists.openembedded.org/mt/117879853/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------3TgreRpUKk7QPkVI9m6jIxpG--

