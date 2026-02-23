Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200EAEA4FAE
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 11:20:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33105.1771845604295670125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 03:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=j3jm483I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6514dab5d8=sundeep.kokkonda@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9RuI4941626
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 11:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wQzuPd4OZV9BQC6uMGuo9gIREES5wSu0V9jz1hOiBaA=; b=
	j3jm483IyvLo70gC0npnBG4tJxnOAeW/l58B7XEb8+hvgSXqWucErbpKT3YEeCww
	Dau/4U8AjpFFd+6gkK+PgjT6gGEgRRNV5i0itmRikm9wtH2Loh/Yus+zB4Bzspng
	Tc1Wh34ZTbEuJZIozyxClsFPIcjSB1FNqLxU9+/VXTKI8Bx+6rs+JN7ayd/23lGY
	MuTnChQiu5jOnzAT00Hm2q3m/YgYsGbEMBFu9qUCiteM3D2Y7evHb0jwCJcnoKwn
	7XDgZt0dHKTQW7IDQEfv4IThiiDipJNWlGvqAqXkHVEOH6VRcjtftaQ4oimu9WLL
	oBofjGCbPJKkIV6sVIWBbQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf1wv9qjr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 11:20:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u96SyjCd+eTm+38YxADdVajS0BByqXXRf5eH373bIcPkLT/VTzeOqH/Wyk5TZuSvt2LHHbiRKV2ICUZzr18KBpKF2Deb+gNfYA8kxI69yI5nqPj/glF+yUkmTSK8pIAzMryPv5Fnp6QqkEPv0i7G1lEocjzQoND/okvLyBwfLragIaqg/S/rlFzb9anSHiCWBO+BOBQ5oN2dWcNxYb80Zmqm5rPQB8NQzPSgZR4ZFAA60ApBDbBKiPUZUUN6kcqk3trmSh1kebYLPLnNEVo7OkUlj8Kh2ekZsEoRkaNGDVc9EHkXlDfna1OwIl/Ez1NvdP4Gg9mWsOBDIEi3a122bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQzuPd4OZV9BQC6uMGuo9gIREES5wSu0V9jz1hOiBaA=;
 b=nR+wKC6tG2vYvhXNT1AKVwjFXe6+YyOD0YEhEHPoETzmG/tRRRIQLPMJFq2MG3vDebfLOaMP5wNsdsAE4gyr+Qx2de3wqR8SeW20iKONRG32x+jYuGmJZlzohEG253ZTUz2wOi60izli9HV+SJOEhsAAZy6cbuon93mDEwhjpvpAaRssJMaCtw5qkljT3p8suWKh/yKxSezQelQUsZyT7FnnLQ7xup9H8OQBG5hWRALZb+q/8CDOz8uWhKlMpO2FE5SK0vwMvDF2v6x8yTHojdXwnEf45PNOzfjDbhVSeSgVA9nCl/ZwvLInU6ercyIfiL8X7hEbunXmD7xCnsEL0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15)
 by SA1PR11MB6942.namprd11.prod.outlook.com (2603:10b6:806:2bf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 11:19:58 +0000
Received: from CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465]) by CH3PR11MB8443.namprd11.prod.outlook.com
 ([fe80::9939:8aaa:b651:d465%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 11:19:58 +0000
Message-ID: <176df973-9458-449f-b166-308847608822@windriver.com>
Date: Mon, 23 Feb 2026 16:49:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 09/14] selftest/cases/runtime_test: Add test
 for Linux Rust sample
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Harish Sadineni <Harish.Sadineni@windriver.com>,
        Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, bruce.ashfield@gmail.com, paul@pbarker.dev,
        elmehdi.younes@smile.fr
References: <20260212181039.1826154-1-Harish.Sadineni@windriver.com>
 <20260212181039.1826154-5-Harish.Sadineni@windriver.com>
 <DGFKTMA2S0AH.2FYRLKHRWQT5I@bootlin.com>
 <DGFP3A56EZTR.1TWUE93WL575C@smile.fr>
 <7d5ca94b-0062-44ae-b941-5401bbc56aae@windriver.com>
 <DGGI69KGL871.JD0YXGHLVBAH@bootlin.com>
 <DGHECF0K4Z1P.2HFBCFPWDKJQ2@bootlin.com>
 <DGM5RWWI8ITI.1N1WPFMB4FBJB@bootlin.com>
Content-Language: en-US
From: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>
In-Reply-To: <DGM5RWWI8ITI.1N1WPFMB4FBJB@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR04CA0197.apcprd04.prod.outlook.com
 (2603:1096:4:14::35) To CH3PR11MB8443.namprd11.prod.outlook.com
 (2603:10b6:610:1bd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8443:EE_|SA1PR11MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 69da06b0-88e5-47bb-a97c-08de72cd7a5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTlzVHkvZXM1azhWaFRxQmJVclVlbmJKRUVzdms4cHE0OFJ4ZDA3Z3dxOUEv?=
 =?utf-8?B?amg0OHNac2lTbEZvV1dJeTVwSzErSDBTMCtDNDl3VVZmUEJuUmYvMWtWVGNR?=
 =?utf-8?B?UDEzaXpMM3hHcFRVbDNHV3YxTEF6NlR3eU1BbFF3TUNFeVR4aDZoUW13bjBi?=
 =?utf-8?B?TXZ1S0VndGNjYytFWFJybDMzRm13M2dxZnF6UW9IWW1Ydm03TUFjeitpR0hU?=
 =?utf-8?B?a0FTM1Q2T3Z1akNPQlRJY0Q5ZHlkQlhiL0tIdjVkZFl6MnZUdFRQcTE0MUVQ?=
 =?utf-8?B?dk14Rm9weTZLK1hLSllTTmZMWUZ1aEY3VlZZc0xoVTRPYkM5R1NFVDNkTUVr?=
 =?utf-8?B?bkJIcUFSUWVFZk5YbHUwQkkwQURobXIyYURvQlhDVE1URUtuNHc1bzE2ZmV3?=
 =?utf-8?B?dlZWSm5iV0pYeU51QzJlUWJ5dWNiR0dSVGxlaWVQOGVwWEFXOUlpRXdQdG1i?=
 =?utf-8?B?cFhKUDRyMDZCZUFKSmpnNWJLb1Fydkh1ZFdDV2NpQjZRWjFVeEVMNlZVeWVG?=
 =?utf-8?B?T0doa1NncnZ4bGFaNkl1c3YrMS9qeUlNV3JMN1hRZ0h3MlN6Rk9uUUYwNzIz?=
 =?utf-8?B?Z1ovMkUzSkZkVmRma2lwQmM2dGRKOVpDVUZHWVZKQmQ2V3Joa0RiNGpvZ3N1?=
 =?utf-8?B?Sk5IS0VmM0hhcVE2K2s5QjN1azVScExRdjhkTVRtRWdsQWl5Y2pCTWw3Y0Fw?=
 =?utf-8?B?cHpFTVhJUHlURndCanBCZkFEN0pjL1pUVDNKWVVjTm8ra0ZyOUlvZXRzV2Jj?=
 =?utf-8?B?VkFwNG92eHpJQ095eVREOWpuZ0hUNlNzcjFNV25pZUtTOGl5RHBCOFIxczAz?=
 =?utf-8?B?YUVmblkxcGtBTUNYRDZsaUpTRFlvYy9iSWNBeVRISnJ3UXZLbXFGbmFGOG1U?=
 =?utf-8?B?WmthU1lBdEVhSGJ0Z29UQitla0dEL2s3MVI1QnYwQndqY0gyTUt5dGhjZEV6?=
 =?utf-8?B?RmduT1BaSlU3bk8xTURRVW01ZElYYyt0REtlZVczYWdRWDFBSXFMS2t0WXhH?=
 =?utf-8?B?clZZZlVadHcvMG9kczdTVDRlR3pqL3F2czR4OFNJelVRMEYzRC9lTVBYR0p2?=
 =?utf-8?B?SVRScE81U1lZOExMUTliSWgvcUFXL21yV0lqNGVnTDUra2NYcDBVZ0hxcVR0?=
 =?utf-8?B?MGUyQkNLQ0Z5MEluMXpob0N2R2RiT3pYblZDN2VQU3NyZnpOUnRMcEt5SEZI?=
 =?utf-8?B?MklPTWhoK0NvTzd1emw2bXlLWk9aYVlGN2YvczY2M2lHRmJ6WmV5MHpUMXBs?=
 =?utf-8?B?VlkrZ3VwRzA4cFlobTZQT1NKU3U1SmxEdTU2aWlwVE0wNC8zYzVXaVRGQm1H?=
 =?utf-8?B?WUN2eXRwNVlnazBDWjBDWW0xYmlBd3IwRWsxaWRrZWM1TmRtVkVYZUpTZk14?=
 =?utf-8?B?cXFwSjlqWTRIMURqa2k2ME9jVGVROFpHOHpJc0h4Mkp5NnFRWi92UEd2aHcw?=
 =?utf-8?B?YzBuemZDT2JYZks0UVptYVR3QnVUZHBoeHV1VWdkNXFvT2R3R1Aya01NajNE?=
 =?utf-8?B?YllobmNhcE5ERXVvYzJaazNJay95eWIxTDZpN0xHWXJSWU81S2FnTHBWSlds?=
 =?utf-8?B?T0ZuT0JTZDdYMmIwTnp6S3hUOEIwbXVRRGc4QXNSU002Wk9rTHh1L0JYa2pk?=
 =?utf-8?B?NXpYNStEUTVWOW1GU2RmSmdxSGRoZG9EaE95NGlGSCtMUEtWR3dWVG5nN09W?=
 =?utf-8?B?RDduWXNJTXY1MnBkVXdaUk9mNW1CZDExQ2lRRzlFajFBb0psMVU0VVk2RWtP?=
 =?utf-8?B?Vyt3NUUrWmRhS1F2bWg2TDNqMWRIVko0WHQ1cTVtOTI3MW5CaG13NTFQRC81?=
 =?utf-8?B?L1Y1SzliQ1h1UUZWUzlUa3VBdEhUK29kUi91MWcxWTRJUUpVcEQ0NVlQa2pi?=
 =?utf-8?B?M1VHYTZnS0RtTnNnRFVIK01hNG5ZbUwydHZoaHNnbkJyVllVR2JCV08wOFBK?=
 =?utf-8?B?QVZEblMvdExheEM3RHpkUWhSR29vUEtHaEEyWlZMQXZGbzVydlVsU2d5ZXkr?=
 =?utf-8?B?WE9RWEUrZGVEOFNkYW9aWGc0ZFV3bWxZWG9DTGlVdzcyd1Rlck53dkozT0NJ?=
 =?utf-8?B?WjdPSkpxclVVZWdxcG5iamMrMjVYU3c5Z1VMWURwb0xUNHVWL0Z6SzVpWFMx?=
 =?utf-8?Q?6k2E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8443.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dDE2cUVkN3ZZMHl1Z29WbGxxMFQyZnVwaTdtRGJVYUtmeXJ4WVh4bkI4YXFh?=
 =?utf-8?B?QUw1czljaDJIU3JLZjhXcEVtRG5rNi9LaXJ3eUpSSlozTCs1SVRQRjFnWDk5?=
 =?utf-8?B?eDl3ZzNRWUQ0OVdGN1RuK1RlUGxON01PN1FKUXpTV1ZDWFVveDlyYVd6dlgw?=
 =?utf-8?B?WVBBb0F5aWZxRTRzSWR6WHlHc1ZsOHN3a1NTUzNOUnVxaG5SbXNvNkFWeDVs?=
 =?utf-8?B?Z0JXSDBYSnIvaTdMY0tTY0tuekh5SW5yeExhREdYZDB4UC8vMWRNWVZLcmd1?=
 =?utf-8?B?OFFqZUs5M1FzSnNka3Q4YnVOUGx4elhOZHhRUStpOWlYOC9FUmI2RXdGUjAy?=
 =?utf-8?B?OHNiVUFUajFPQnpOSlpnNFRteFFHT1RUdnJMM3BBT2ZpRWdENjFJVENZL0dS?=
 =?utf-8?B?K2R5ZmNnRmRJc3czdGl3cHdlb1U5RkMzZTFTWjU1cGF1TUxyOGM0V3E1alFL?=
 =?utf-8?B?Zmw5QU1INEVldjRRRmk5VlFOUHVKL2kyNW91bWEzRmQrWjY3TDJ0Tzd3cTkv?=
 =?utf-8?B?Z280THFQSWI3eDNMUXZwN09EdmFaenB5MjdlS2RPa05HRVFVVlBhVlZIRk9T?=
 =?utf-8?B?c3lXdk9iUEhSRU1ZSkx0VllsNWlkU2gzNk5TWThEODZ1TlBkcHRvRVJWNEpL?=
 =?utf-8?B?VEZ1ZUpKamJrbzZQeXpZSnZFSjBNOE9KZTBtemdWQSthVkd4WW8ySVpsckZ0?=
 =?utf-8?B?TXNIZGF0REw2MUdjeGk2b2ZXeHF3d1hIaUN6RlNhWlA2d1ovOFJjSlg2RlV5?=
 =?utf-8?B?eEpwVWZJZCtRN1pyc3Q0eVpDam5SRTBlUm5wNmhHNndCZEtrMHFFc0JlK2lZ?=
 =?utf-8?B?bmdwcVZOS0hvaURmaElPTWhDRFAvS3ZxUGpHTXBESzVNWjVOc2VQcGhrME44?=
 =?utf-8?B?YktVeGNncEV5aGRWdmhJcU5ERWRaY0FqeUZCSnQxakY4eDVPcEp6bkRRRmht?=
 =?utf-8?B?Z0dHSHBNaXBNbnZZZG5JN2RPWjVCZXZqa2VoMU1WRW9LbWRWZFJxZ0cva0Za?=
 =?utf-8?B?MFVIaXhDRjZ1K1huWDJYdkp1bi90dGR0Z2pNM3M2YXZ5ekRJUVJOenFVRDFD?=
 =?utf-8?B?SVV2ZGZmU2VpMkJ6QU9sVGxBZmE1VW5oTmMzamxpSXVtR3hBZlQ4WEhvVkpY?=
 =?utf-8?B?TW1xQURNQlREakJuejU1THduT2ttNUszQWpuZndjVVBvRmdhOWN6M096STh4?=
 =?utf-8?B?RFdkM21UdnRVVW8xbTJHcHh0UjhqTERReDBsMktRMEJYclZld24yYVY4NmNT?=
 =?utf-8?B?SzllTFpzUnpReFlMakpZZDczUUxGOTRiNlpTelJ5bW1VM0dhT0NMbVJUZVJM?=
 =?utf-8?B?UjNvTm1mc3dkRUFlUUxwdWR6dnZuQ3BLY1A1cFcyeHVYcG1jRVJqemJIRWk2?=
 =?utf-8?B?c3JvZXVFN2tKNFdudjA2VkVSbHlPc2JpMWpnV0ViR01BalppR093UFRDUTkv?=
 =?utf-8?B?ZEhWYU16N2laQ2h1UTg5Nks0cWtKeDZYeFh2WnR3OFpPQ2NOV0ZHb29aMmht?=
 =?utf-8?B?MUxNekZmbzFZd3dDYUxhZDNmbWJMcWxkVnJxV3A5YmYyWXg4Y0ZiQmJETXJ6?=
 =?utf-8?B?aGV2L0czOTI3d3hzRy9Cb1VDMjNISFFaMVFYU0ovZ3JmSjV5NldyYVkyeE9M?=
 =?utf-8?B?bmtxem1PbGczMVduWDRBZzVuM2VtVXpiS1RsMS9yajNBeDd2M21BM0tPSXJU?=
 =?utf-8?B?SmNVNlo4RXFFMTJ4bzdGV0svVm1WeDZNUU1QVW9RZlRGNWYrYWlOWVN5VGlD?=
 =?utf-8?B?ZGxLdXpzQ1IwdEl0ZUw5alBVbjE5SmhLV0EvcVhGbDNTaTFnQlpDYlBGeDFz?=
 =?utf-8?B?QVhzSXBLR3UrZC80MVhXamt2RFEraHowNlBSMDV0WjhZbExKL1VPcXpIVmNv?=
 =?utf-8?B?VjR3UlJuU3o0eXd5SVMrUmFNUXN5TVAxTUJaQSt2V0EwSGJENGtFL21XZ25a?=
 =?utf-8?B?NHg2NFhzV1djUGFaMFRJYTE1b0UxYkFjbTZndldkRjFHUUo2NUVNczRwRS9V?=
 =?utf-8?B?R2VLYjdhVEZqcERNOS9uN04zLzJjRUUzQ2xtMTN2bldLN3dFaDlrNVhjSSs4?=
 =?utf-8?B?NmZDVmUzWkhnK1dWNnM4NzJPaWlSUUoyRkJxOURIbE1id3dmcUdOQitnS3F1?=
 =?utf-8?B?b0N0WDMzUGJySnVTeUxUNDZTQnhtV2FhWGZQZFRubXplSVE1MHhvdkJ5ZGJF?=
 =?utf-8?B?VGlCdjZxaS9JYkdveUplSDBzc1pVcXJ0SEdqK21nNlRSQXFOWFFtZ0tyZ1Nn?=
 =?utf-8?B?WktIbW5QSjBTcjUxd0JOUng0ZFZtem5SdldIZzB6WnFDeENsUlJJc1hadzJT?=
 =?utf-8?B?SmRJd0wyaGR1WSsweVd0WlVNTVNuS0ZEdUgyelpRRXNWSjRIV01YNzVpVVEr?=
 =?utf-8?Q?Ep5VhpmGv/c7rI0Numb901WXT6rPJZdwdVr8Z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69da06b0-88e5-47bb-a97c-08de72cd7a5c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8443.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 11:19:58.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1qplXnKd362nojHfOxdhV2wKojbn8uQvQPZX6NF3DZS8W1Wh4Anwb7hxw3+72LdsSVpgvlPRsF1OcakgREhf68b59TCNzssM9KF/fIS1ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6942
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA5NyBTYWx0ZWRfX9oAFPVc5wXH8
 fVRqujd4w1DYEc1sPiQ5uwxKbz9nYI2uB8QrE0wo9fPNWtwTbg9miLtFmi+7CTTJgV52qNTNTru
 quaHjgsBZwt8qREUFC9+zQmgStcro8nQRH4immgxrALFnlknoLRiwyVBZqxknNcq9tzsI8u5auP
 +8K9iYB9ucwAd7h4OL9+fDDEVb0OKBZC7MMUiHAixvd/467WYoY/ed1ECpO++0XU+hM+FzsTqTQ
 9VrsCIg5M99qjPiotz6zkn+5bq5m91e8wro7YKJVquXvJKEOchhojB+wfFxxtpgBXi/gsyae8Pb
 PVo26PdF8KMt+X/zjyDVYFKHPkp3+P1rV13xzPts6QvhDIt3WdIpEv4j6xWhqalvxMtUyKPG9vu
 vB+fjXyY6T3fGte2ATpn1aXxwXHfflrB5FZ+lw5LXzYK9A08KbDvu+DPekja3LH5VWHiMCJ8mm1
 brU/2PrmSVmYW8R1wsg==
X-Proofpoint-GUID: gON9RccKonuNvxkxh4XTZgdZSZMvYK3i
X-Proofpoint-ORIG-GUID: oKYSBi9HSXtZu-g5-9337MCjc-rs1ngs
X-Authority-Analysis: v=2.4 cv=F+hat6hN c=1 sm=1 tr=0 ts=699c37e2 cx=c_pps
 a=j7tsCyGgeYHcZD8MHzM6Gw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=1mRALLBIYJNp9wpf3_wA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1011 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230097
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61N9RuI4941626
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 11:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231663


On 23-Feb-26 12:51, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue Feb 17, 2026 at 6:01 PM CET, Mathieu Dubois-Briand wrote:
>> On Mon Feb 16, 2026 at 4:48 PM CET, Mathieu Dubois-Briand wrote:
>>> On Mon Feb 16, 2026 at 2:09 PM CET, Harish Sadineni wrote:
>>>> Hi Yoann, Mathieu,
>>>>
>>>> I tried few builds locally, but not able to reproduce this.
>>>>
>>>> On the autobuilder, We ran following builds which were completed
>>>> successfully on ubuntu2504-vk-arm1:
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3=
326
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3=
331
>>>>
>>>> Additionally, One of Mathieu's build also ran successfully on
>>>> oe-selftest-armhost ubuntu2504-vk-arm1:
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3=
323
>>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/=
3323>
>>>>   From what I can see, build 3319
>>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/=
3319>was
>>>> triggered from a-full/3219
>>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/=
3219>:
>>>> However, when checking a-full/3219, it triggered build 3317
>>>> <https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/=
3317>,
>>>> where the rust kernel selftest passed.
>>>>
>>>> I can see few other builds were successful on oe-selftest-armhost wi=
th
>>>> this patch series. I=E2=80=99m not sure why the failure occurred in =
this case.
>>>> Mathieu, could you please try running a few additional builds to see=
 if
>>>> it reproduces?
>>>>
>>>> Thanks,
>>>> Harish
>>> Sure, I will launch a few builds and see how it goes.
>>>
>>> AB maintenance will begin soon, so I will start either later today or
>>> tomorrow morning.
>> I believe I got one:
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/334=
6
>>
>> I backed up the build folder, it should stay there until next Monday.
>> (/srv/pokybuild/yocto-worker/oe-selftest-armhost-3346-mathieu-2026-02-=
17
>> on ubuntu2404-vk-arm1)
>>
>> Please tell me if you need me to extract any build artifact.
>>
> Hi Harish,
>
> Do you need any file from this build before it is removed?

Hello Mathieu,

I copied the build logs and we will be looking into the failures.


Thanks,

Sundeep K.

>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

