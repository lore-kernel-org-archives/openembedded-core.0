Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CEBE6E815
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 05:34:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13593.1770183269891506737
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 21:34:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=cDZHl8hm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=64956f7392=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6145YSs33056637;
	Wed, 4 Feb 2026 05:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=aaSEp8YhqTOi6aV+zfvCx7ycRyip94Ipzzg2GXJbquc=; b=
	cDZHl8hmX3utQja+E+DrFJaDAM1gBY2+s6/NYFYqfNZwUe24mx1iBig2wxF0/ufZ
	pBGFS0ImgObXu9Pc3a6Ih73Q6aQ2Yl8lz5V6pO7Ab+TduNfp8fkYY68w4tEb5Zt8
	YvJTHs5DcnYgwxqKuquxRjVcP8OIH8W8JIlFp8FMf9TK786SkgNvh8c3wwwc/20F
	JOMQ7TBsz4s1rUeN+tR4edjOZWPgHH9z5oBojafg/F7yGbV78aLkB2Edsh66TGi5
	YffkQjorEh3vm7gGtvrpQmsFRczdxWjr4yYYJyLg0EtS8gWLF/cNAanH2OcOd5Ld
	QjjL90VICgJZFUX0CnRv+A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012057.outbound.protection.outlook.com [52.101.48.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c3vcj05at-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 05:34:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CPvvKhjE9AjXyhTKu0800UiAZrnXnrMXBpZJCsiquh59/CdPMmIedxolYaDvOB83EiCnnSPHJP+75+HAbWt/2ZUsQ5W7fYpj+I0A41A4R5wYJ4CAfmqInamgCuhsd296y/C0afZsLFV+FGZ/TpgoMLOQNzknYEpxU1fpLf11bG4YnGBpdjQlDqj59DqHBsDM7/opwRN658I8c9AQH5sxzMRd7QdAm6UMVvgog56MG35cta4bXXFjnLmRW48Px2LfPRKiRLnDtdwfTnfhCh2KQMNEfKSN0F4ngnqqCV44nrfl+HhPqh/22z6Vt4NGkbtFYRPEyJ9RGQlJP5puLap0vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aaSEp8YhqTOi6aV+zfvCx7ycRyip94Ipzzg2GXJbquc=;
 b=njNRVpfYQqTlqqSf0cmz8EP38FjeZJbaFyxT455tN+w8tzAgUY9OVnjwTxfvULfAUnLBMLJhAYwHdvyT38Mn1GwYKzFix9dIcd8ZvcSZVyQo7tKF7B+rTurItJOZ/BTTXPWn0nOenUJ+pVKCGUt57vMbQWXA7/vAK7tEwfLF/3lkwebzi28c8WQCtnmyNw8nj4lgI4Q7SsbX/6w6uPZt3j+sM/0UtumWezsaI0KIJyc/OrnXLmD/Cax1TIZTbGu1kAueGtuYXnwYITRU4p5gPSMsxmbGV0XCtnhiH7W6lHvGmqBvihTDg8Drgaw4MAZFiH3sgNrOEs3SDpjW5BatHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH8PR11MB7094.namprd11.prod.outlook.com (2603:10b6:510:216::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 05:34:25 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.9564.010; Wed, 4 Feb 2026
 05:34:24 +0000
Message-ID: <427a9d34-94c5-49c4-b2cf-55e567157f17@windriver.com>
Date: Wed, 4 Feb 2026 11:04:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC 2/4] clang: Enable tests for llvm, clang, lld
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Cc: "Randy.MacLeod@windriver.com" <Randy.MacLeod@windriver.com>,
        "Sundeep.Kokkonda@windriver.com" <Sundeep.Kokkonda@windriver.com>
References: <20260203140337.1971735-1-Deepesh.Varatharajan@windriver.com>
 <20260203140337.1971735-3-Deepesh.Varatharajan@windriver.com>
 <DB5PR02MB10213EFF0F909111910AB7E1AEF9BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <DB5PR02MB10213EFF0F909111910AB7E1AEF9BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5P287CA0169.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::13) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH8PR11MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 96ddb622-227b-48d9-01e8-08de63af0e4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?d3dPeDk0Nm5Ga2dHNWg2QWQ1WjJ0dlZmSGhyVy96OXRUYjFYcTBxa2F2NFQw?=
 =?utf-8?B?VmVWNFFpTi9KckZmTFJqL1p5ejFMK0FzVEpkNXN3S0dTSFdvb1J6QU55MHpT?=
 =?utf-8?B?RVhNd2MrSXFrVkpVTk5UVG0xN0I5c2lxNlVQWVNBcTN2TFF4ZVFwMTlLQVFK?=
 =?utf-8?B?b2RiR21Bd084RkVlYUpWeXZzTzVMbXkxMTZIVnhoRzBjc3ZONHNJaTVHZDBi?=
 =?utf-8?B?R3MvcCsrSG4xR285YVRYdUlqdDNHRGp6RkpsQ2dEQXBlTXhkS0h4TUJYWHI5?=
 =?utf-8?B?OGJxakNSSnlCRzlNRy9ZRVAyVDhINXZUVDkzSFJsbGl6dHcvb2JNZUUxTmw2?=
 =?utf-8?B?SFFEVmF5dFdQQzhFQ1FYN1pyRnlqUFRRSFJmVGJRWmNhMFIwTHYvL0FncG03?=
 =?utf-8?B?ZzR6UTUwWmMrTUlRV1gzRHdKYjN4MS9ZU2lWTjZUQTlUaWh2RkxseUk1OWoz?=
 =?utf-8?B?N1B3L1pRRGhjNStyMUdNeURXdHd3eE5maElFWTUxV0MyRUIyQ2FVRmlZUmNr?=
 =?utf-8?B?aFlKOEI1L1NGZXMvWkV3aHByMWN2VDVpUXU2bm9UOFZjdHk4S2VkN05LODBl?=
 =?utf-8?B?VzBXQXNJMnl2NjV6eFk3UCtkZzgwNWdqbUhCVDFuUzl4U0NCOXNLb1Q3ekkz?=
 =?utf-8?B?R3JOUWx2M2dRQmZYQXdOWnd2K1NpeTB6K1lRVW1QeHQ3R0NRQlpGTFZJcTNv?=
 =?utf-8?B?WTdUN3dMRjNQeS9scmQ0UzIxNmVzcFB2RHNxZDN2WlVnNUZ6OC9MamMybVg4?=
 =?utf-8?B?dVlrbGJPa0FXMXo2ZThhbWs5a2lpZG9OMVdySlNxRU9iNE5uL1k5OGxaUmdv?=
 =?utf-8?B?VWtYNUp0QVNKTThIUFZhendkZXQ4SmQ0TjlDa2NRcDFBcnVFMDJYdnhzUEVZ?=
 =?utf-8?B?VGJKZzc4VnpVN25RcHNkN3ErSkQ2MzJqRENWd01QbjB2dmkxTTFueEVxNlBq?=
 =?utf-8?B?UTF0Rml3SWFCcGZwNm5GLzVscmtQalcwWFg0M1BBY1IwcHB5bHoxUmwvYXMy?=
 =?utf-8?B?aUtQMWFUcCtRUjFPRXNPVzdIWU1JcTdlcTlMUlB2azBEWDNsUzdvaUczSkN0?=
 =?utf-8?B?R1RWdmkvbHAyRS9QVjltTE10bFB3YzdnM28xbEFieHYxaFEvMWxoSitmRjJS?=
 =?utf-8?B?cVQ5R3FCTFlEWUNOeWJmTUpUY1ZhZzBpN25vQkVza2NyaW1vemk5WGp6ZU11?=
 =?utf-8?B?RldQOVJVY1JvY1NTRldsaGc3aTJidHY2dnc2UkpEK0xPUGlXVEUxRTAxaUpa?=
 =?utf-8?B?ZUtvYzlLOWRnbkt5MzVDRm4wWlIyT0Zic01QSnY0eWNjZHdYeFp5R0pxdFJr?=
 =?utf-8?B?c1RRMFZWZVlvSmo1UzE4dGp0VVBYU0xWWk1kQjh4Y2RuSWJpSFQrUHVzV1BL?=
 =?utf-8?B?Ly9tOWhYZmxEbC9sQThPZVVTVmV3RjNlcDl6aTNWb0xJT1JrNEJRN2ROa0tG?=
 =?utf-8?B?WDJqZm1tZEdMNDZtUDRSZ242ZzlUQWVtS2tQMXVSU2sranBHeFVpTEVBSGNM?=
 =?utf-8?B?Kzhvc3NHMU5oa1ErdUszYUNKeFNWSzJzTTdZZ2JYc05MV2ZNM3RyaXZ3c3hP?=
 =?utf-8?B?dHd4RmQ3a3I2eFEvMGNrMEYxY0UxeXFaR091VG9USWRqKzRGWkppVWJ3Rmtl?=
 =?utf-8?B?aDE2SXpneDdZZTg2VkhaOHNDWFhheGdrdGlzT0NmZytmMTR4TmtuMjFJUFBJ?=
 =?utf-8?B?WDNDc2h3bDRDejBiZEZUOFY0dVlxODhBSk5WV0NVdlpscmN3cjEwNFhHREtZ?=
 =?utf-8?B?MHFuTVZTRW5tdEtubmhqOWExOCs4TmxhTkZ1N1pzOWhvUmNPNFpSRFlPcEk1?=
 =?utf-8?B?b04vVWdob2Z0cXUwTmlZYURsQzFCUWRTUlVZNkU2MkJHbHhHOE1CV1IwMVdn?=
 =?utf-8?B?dkhhaGlsU2N1RkliYWd1ZHV3cVJzYTBBRTBLenhWZ1dzeWc5cDlyQ0M4TkMy?=
 =?utf-8?B?WENrUC9oL0lyZW1ucUVsUi82MDh3alBwYTRUTXZ5ODNvRks3OGdrRXdOaHhi?=
 =?utf-8?B?S2d4L3BwK1Y1RHlFeG40cXZ2MS9UbmFVeU8zOHBHLzNJR1cxMFlNMXp5cnAx?=
 =?utf-8?B?TXBtNmNMOTAzVWFhRmwybU83b216Y3BmQVhudnNCRitrWklJc0U4SUhTWkt2?=
 =?utf-8?Q?9KrI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Mmd3OWlJUlEvTVBkTGVoNE84dm9GeUdHWmNFSGc2eWlheXd6YVh3YWc1SlZr?=
 =?utf-8?B?WEsxNDUxd2M2dFdWcTNxMlNJbTkyanhkTUw4M1RPd05zU2p2RjVPWlFtWndt?=
 =?utf-8?B?dnR3dWNyN0JYSjJ4UXRyQnR0ODgwbGlHVmZGa1BhTTdRK0p6dytXckJhVG1E?=
 =?utf-8?B?N1pkQndJUlA1Rk92WHloRUFHc3pRWU52L1BYNkc0VlphdjZObG9UR2R2YVND?=
 =?utf-8?B?S3ZRdUxNY0IwNDZJZ09MSkZWdGE1OG9TeHFleXI5QU80SWVnT1ZiMHNiMDQv?=
 =?utf-8?B?MEhrZ21DTXRRUVh5c3dLSUp4K2tkdU5FWitOdXVBT3Qxd0tZOTBHTTZmZFJI?=
 =?utf-8?B?eThvNTBncHhFNmVnWHpNUm1SQnRSM2h6b0w4eEZ1Wis1SXU0WVFOY0pXTE8v?=
 =?utf-8?B?ZkRKZldLMlo2Z2Z4dmM1dlpRUkdvZ3BuSStTaUR0dGhJMmdYY1pHS0lyUEdn?=
 =?utf-8?B?WTlOMmppWGcwNEFGRnBlT3JscGhqMUlFSUhTMHY5b3YvQStlVzZmSmhuMVFG?=
 =?utf-8?B?bE1JTFRPZVh2MW42Ynphc0JPaXVRZW1SL3BBcWJRbFc1aFdXeWJNa3M0cm0x?=
 =?utf-8?B?OElCVisrc0NuVk13T2ZmUENwL3VVVGtjM0tncUxTdVNpQ1BReW5sRzlPaVMx?=
 =?utf-8?B?YUlLeGUyRVFoVGtiV0dpVzd4TEVFZWVzd0V0eFBScFFYam41QWtzYVp2UHpU?=
 =?utf-8?B?MEQydzBpNTdaRVlDTUFhTE1tSExkdk5tMjRXKzFTZnByR3RDalpTWnVHaVl2?=
 =?utf-8?B?YXdmdWw0TTNUcnB6NUtTWFJxNlpUSUZHSHdyVnBHVFlxK2dCOFZHYU9rK0RP?=
 =?utf-8?B?ckZJWkQyaVJXZlZaQTZTY0kxNzcwZ3l0ZjcyUkFIS3Z0a1N0ajFtQTRuOHNH?=
 =?utf-8?B?K285NUFYOG1VYlZSV0E1QUVIaUVSenNpYy9HMG82U1hyVjFlR0tIbE96OEd0?=
 =?utf-8?B?Nk1sUW5DMnluWDE4T1FqQ3pBOEVlNGc0Qlh0OUREWDBPMklJaGVUaGZPd1ZZ?=
 =?utf-8?B?Y1VhaG9Obi96dUN5UFNaUEZFd3RHU2NBaWZHekJrOFYzcGxFNk5TQldTelp4?=
 =?utf-8?B?ZjhVeFQ0NFdXM05wb0VrLzJkKzU4RGU5c3hqdmxqYVdNVytOZGFmUXIrUXdq?=
 =?utf-8?B?M3JzQWFTTEFXTU1KOVd4OXNyZlU2REsyVWJMMTIvV3U5WTM2MmhoK094WDNk?=
 =?utf-8?B?MkNkTUFnWEVBekN0VFVEbWt2Y2YzaHI2Z2t5WWJLS09GMlhJVVJuQzRnUnow?=
 =?utf-8?B?aDdIcFVad2hnb25oL1B2SE5jL3pCNERZdEJmWTlHR1o5MmhUOGszZTh5UVR3?=
 =?utf-8?B?Ynl5TlJmUmxHakRJRmk0NzZSTEcvUzlVbUZWRWNyV2c1VElhajRLTGNCMVhC?=
 =?utf-8?B?RElkVHpFTlVEcGorNmc4ZzJTNXYyU3JneU9mV2N1dDI5eWt3LzJSZTlUdkhK?=
 =?utf-8?B?NHB3V3RSTGVVOHl6VkdYcnFpUTV6WURPMXJhZmxKMWVXd2Z2b2RYYVhJUkhL?=
 =?utf-8?B?ajJaUndpU1NqNTBDb0FuTDJsQktkTEF5MTRiOXUyVFR6d0NVTElnOUtuSHVX?=
 =?utf-8?B?VXJ0emRpOStYdUd0V29HUDh1MmJBaTdFcDJiRkVlWHFnbmNkanhmWDJXUTFI?=
 =?utf-8?B?WEYxZ1I1dFg0b2FkQ0hndVpjMVNCNGlmSG5PanB3RHpqcHlVdkMyRDZaSjJU?=
 =?utf-8?B?NHZPblZwd1h0aURBbUZCK0RUVEVtUXFyUmhMNTRaT2oyZXp6dVdLNThkcFBl?=
 =?utf-8?B?WXBNejhkVHo3ZytxVDZTUnQ2cWg5UzB3ODJCa3NCaENVYitmZC85Z1VCaFpN?=
 =?utf-8?B?OVpLc0RYOG9vMGZmVUJ3aUs1ZXNPT2M2dVRVeEVjUTA3K1dzREErRUp2S3R4?=
 =?utf-8?B?Si9JbFNISnVnTWtYVVpuSVJvSXZoTDF1MjZXSHRndmN0Vm02YUhnRVJ5Z0hY?=
 =?utf-8?B?cUNkZ0srTGx0TXZycGpJaHZZNW10eWJKcTBrc1hhZjhRbHNFc0tqT0NhWnVQ?=
 =?utf-8?B?Q3Q0ZkV3TXRIZmFocWpEN1kvS0lReGVuWmpDZkdQbFNKZnNKNGMxZW50dThT?=
 =?utf-8?B?SVozSjRVeUxLQzBObGRPZ2hiSDdrSXdsa0FsNDlxeUhDUlJ4VjlydC8vK3VC?=
 =?utf-8?B?VjArbWlNS3ZvUEFCZ2lkQkxTajVoK3BTVElVVFNOOG42emlVWHRkTU9Uc3JB?=
 =?utf-8?B?bTA4R2s4cVVWWkxtOWpUVjdlOE9HUXV4MDhZR1dHOEVVUXRiLzdmT3Ftb0Ew?=
 =?utf-8?B?amkzQ1U0aW1qKytxWWEwbnp6WmpMUDB4WkJkdTltNWc3S0IvZEUzYVhFMDVF?=
 =?utf-8?B?VEx2QU1aOU9KditlVENhQlNJbWxJMFdldk42S2FDb2tXL2RHSWNBMzBHaUJO?=
 =?utf-8?Q?31PGvVEeADaKvKFWcrisNzpVyq1pC7Y0HN4DB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96ddb622-227b-48d9-01e8-08de63af0e4c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 05:34:24.6537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMIf5gUh1C6n6AsFviC3mwR+kADLsvadJSu1JICAxz/70SKouvRsWCubMtoxvsSdZXE/Qx3greKalA7nFHml3LISY9Mob9WhK9srP6dteFRTK34GEDZDtfKwEeGF0aGQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7094
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzOCBTYWx0ZWRfX6vcda9zSvCsc
 eUpcNhaENMukbnG3+0qzpYcfe40+88NloNSBnUSXPrKazt9oIDUS3OInCs8dIT9glcy0RIKRIkH
 mz/qugXen/lncqo+0Jsxd8lIY4hvR/KttxJ8bVV1ZdlAGm1m1G+SD3xzOFvw0kGb1bi9pmNn/vW
 vI8VNYKHhCVL413po8x55A436NGmPrcf5xGIdITQd4ivFrVx4yPVeV08TTxJ6AoDLkpG9pp8rVp
 +Q2MtEgwhLKEt2/E875a2Q3ThjQpVlxkIXk27uV0jum2X4JXFpPLubILX+Ll2POehNwleO8eMl4
 K4JQuJkeCE9akF0NvjdDS9Kl3sZvgI57y7RL93oEwq0tuSOgoWu+Wfq35mPdvAIaURtSPJCKWo5
 LNEIEVI5fN6/XtKWkTVJPMk6/PP8Kydvd5jnOWRxynpG+tHuJdH6D8/ZPBjseywZ8HUBsycpmoD
 /LYry4BodQ9Awfjb3Ng==
X-Authority-Analysis: v=2.4 cv=VaH6/Vp9 c=1 sm=1 tr=0 ts=6982da64 cx=c_pps
 a=7NJmVDyNEcEWmOhjwSrRAw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=iklBrtU6uEfedeuOzGsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: silOQQ-4Kv_DRioIhia3-lFx-advlJgD
X-Proofpoint-ORIG-GUID: E61iHmobLau4WIBc2w475s6tcbjXHDUA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040038
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 6145YSs33056637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 05:34:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230495


On 03-02-2026 21:38, Peter Kjellerstedt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-core@list=
s.openembedded.org> On Behalf Of Varatharajan, Deepesh via lists.openembe=
dded.org
>> Sent: den 3 februari 2026 15:03
>> To: openembedded-core@lists.openembedded.org
>> Cc: Randy.MacLeod@windriver.com; Sundeep.Kokkonda@windriver.com; Deepe=
sh.Varatharajan@windriver.com
>> Subject: [OE-core] [RFC 2/4] clang: Enable tests for llvm, clang, lld
>>
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> Enable the required LLVM, Clang, and LLD test build flags for both nat=
ive
>> and target builds, and install the LLVM target tools needed to run tes=
ts
>> via llvm-lit.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.co=
m>
>> ---
>>   meta/recipes-devtools/clang/clang_git.bb |  3 ++-
>>   meta/recipes-devtools/clang/lld_git.bb   |  2 +-
>>   meta/recipes-devtools/clang/llvm_git.bb  | 11 +++++++----
>>   3 files changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-d=
evtools/clang/clang_git.bb
>> index e10c327a2a..a1ff25f863 100644
>> --- a/meta/recipes-devtools/clang/clang_git.bb
>> +++ b/meta/recipes-devtools/clang/clang_git.bb
>> @@ -68,7 +68,8 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
>>                     -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} =
\
>>                     -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llv=
m-tblgen \
>>                     -DCLANG_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/cl=
ang-tblgen \
>> -                  -DLLVM_INCLUDE_TESTS=3DOFF \
>> +                  -DCLANG_INCLUDE_TESTS=3DON \
>> +                  -DLLVM_INCLUDE_TESTS=3DON \
>>                     -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAI=
N_FILE=3D${WORKDIR}/toolchain-native.cmake' \
>>                     -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>>                     -DCMAKE_AR=3D${STAGING_BINDIR_NATIVE}/llvm-ar \
>> diff --git a/meta/recipes-devtools/clang/lld_git.bb b/meta/recipes-dev=
tools/clang/lld_git.bb
>> index ba36942790..1d3d80e117 100644
>> --- a/meta/recipes-devtools/clang/lld_git.bb
>> +++ b/meta/recipes-devtools/clang/lld_git.bb
>> @@ -16,7 +16,7 @@ OECMAKE_SOURCEPATH =3D "${S}/lld"
>>
>>   # Explicitly enable symlinks as the lld build doesn't call into the =
llvm setup
>>   # and turn that on.
>> -EXTRA_OECMAKE +=3D "-DLLVM_INCLUDE_TESTS=3DOFF -DLLVM_USE_SYMLINKS=3D=
ON \
>> +EXTRA_OECMAKE +=3D "-DLLVM_INCLUDE_TESTS=3DON -DLLVM_USE_SYMLINKS=3DO=
N \
>>                     -DLLVM_TABLEGEN_EXE=3D${STAGING_BINDIR_NATIVE}/llv=
m-tblgen"
>>
>>   BBCLASSEXTEND =3D "native nativesdk"
>> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-de=
vtools/clang/llvm_git.bb
>> index 96ea383731..6fed382d69 100644
>> --- a/meta/recipes-devtools/clang/llvm_git.bb
>> +++ b/meta/recipes-devtools/clang/llvm_git.bb
>> @@ -44,10 +44,13 @@ EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRe=
l \
>>                     -DLLVM_LIBDIR_SUFFIX=3D${LLVM_LIBDIR_SUFFIX} \
>>                     -DLLVM_VERSION_SUFFIX=3D'${VER_SUFFIX}' \
>>                     -DLLVM_TEMPORARILY_ALLOW_OLD_TOOLCHAIN=3DON \
>> -                  -DLLVM_INCLUDE_TESTS=3DOFF \
>> +                  -DLLVM_INCLUDE_TESTS=3DON \
>> +                  -DLLVM_BUILD_TESTS=3DON \
>> +                  -DLLVM_INSTALL_GTEST=3DON \
>>                     -DLLVM_INCLUDE_EXAMPLES=3DOFF \
>> -                  -DLLVM_TOOL_OBJ2YAML_BUILD=3DOFF \
>> -                  -DLLVM_TOOL_YAML2OBJ_BUILD=3DOFF \
>> +                  -DLLVM_TOOL_OBJ2YAML_BUILD=3DON \
>> +                  -DLLVM_TOOL_YAML2OBJ_BUILD=3DON \
>> +                  -DLLVM_TOOL_LLVM_EXEGESIS_BUILD=3DON \
>>                     -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} =
\
>>                     -DLLVM_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llvm-tb=
lgen \
>>                     -DCROSS_TOOLCHAIN_FLAGS_NATIVE=3D'-DCMAKE_TOOLCHAI=
N_FILE=3D${WORKDIR}/toolchain-native.cmake' \
>> @@ -69,7 +72,6 @@ PACKAGECONFIG ??=3D "eh rtti shared-libs
>> ${@bb.utils.filter('DISTRO_FEATURES', 'lt
>>   PACKAGECONFIG:remove:class-native =3D "lto thin-lto"
>>
>>   PACKAGECONFIG[eh] =3D "-DLLVM_ENABLE_EH=3DON,-DLLVM_ENABLE_EH=3DOFF"
>> -PACKAGECONFIG[exegesis] =3D "-DLLVM_TOOL_LLVM_EXEGESIS_BUILD=3DON,-DL=
LVM_TOOL_LLVM_EXEGESIS_BUILD=3DOFF"
>>   PACKAGECONFIG[libedit] =3D "-DLLVM_ENABLE_LIBEDIT=3DON,-DLLVM_ENABLE=
_LIBEDIT=3DOFF,libedit"
>>   PACKAGECONFIG[rtti] =3D "-DLLVM_ENABLE_RTTI=3DON,-DLLVM_ENABLE_RTTI=3D=
OFF"
>>   PACKAGECONFIG[shared-libs] =3D "-DLLVM_BUILD_LLVM_DYLIB=3DON -DLLVM_=
LINK_LLVM_DYLIB=3DON,-DLLVM_BUILD_LLVM_DYLIB=3DOFF -DLLVM_LINK_LLVM_DYLIB=
=3DOFF"
>> @@ -124,6 +126,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D=
 " llvm_sysroot_preprocess"
>>   llvm_sysroot_preprocess() {
>>           install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
>>           install -m 0755 ${S}/llvm/tools/llvm-config/llvm-config ${SY=
SROOT_DESTDIR}${bindir_crossscripts}/
>> +        install -m 0755 ${B}/bin/* ${SYSROOT_DESTDIR}${bindir}/
>>   }
>>
>>   FILES:${PN}-dev +=3D "${libdir}/llvm-config"
>> --
>> 2.49.0
> Will this noticeably affect build times? Because we never run the
> selftests in our environment so if it does, we would very much like
> to be able to turn this off.
>
> //Peter
Hi Peter,

We=E2=80=99ve measured this over multiple runs without using the poky sst=
ate,=20
and the impact on overall build time is minimal.
Comparing before and after the change:

llvm increased by ~50 seconds
clang increased by ~15 seconds
lld increased by ~1 second

Regards,
Deepesh
>

