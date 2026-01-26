Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 811F1C88E5C
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 08:18:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15092.1769415521713242827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 00:18:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qb/5cSjI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=548692571b=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q5aWST1395974
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:18:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Q10KahoQGZE+VEb/usrTNPhB9UKWiQhg3cO3AofjWEo=; b=Qb/5cSjISgEJ
	mJp7P4qP4MBA+QBkN/7uUZB71fFcRLIjHYFz1fVdjRyC/AcrfBOiiZpl0jzK6PYX
	NUuhCwZ1egZriZIX8HYG7hl/1Wl4SnHmU0toJLLnPl2hQeEOCHKaVP226cQWUqMk
	K/0vxeJ/z4qNeWFf2EjonOT3pvOuMOxiGefVEoRYFzQZv3d0mdJuz/Z2bOPAu97A
	PSjyAntyriCxxXcNGORnX3CXWnP0sOMPOq9gzzrXdfp36a6n097ZnVq94v6fVU44
	P+ZMvr6w324eEChn/vEQaObxErYBesEQLAYCiBW2sttXD0Sljik6FqsSfL7qJDt1
	8/Y1HBNNgw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012016.outbound.protection.outlook.com [40.93.195.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvka01mre-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Jan 2026 08:18:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHb9Z/atrzVrCT6uXPukWhfSwbqyvUpFR/I+jubor9euQoFvIAjGNKECGwdZC07qG9KUZ1ffhSRPHJ0OsDEZ5AJNqzoSPW5CPBuEUwXTj7ZtxsXAD/iFRaaKgOYseemd0X8CRHN2/5Z706zk7+QoSt+Q6GXAtFSkzsARpb1w4V5kQ17lfS/NiMF8fgNexlRKvce7oqpjXrHQvi7nRFAfvsrh2SWxgql9xr1Rz80YrKkxigBClXPanZIMTwBa95L029NRcsEmx9mTvkdhQ01lygzjHnb114RcbgfQi1VFntQfggmh/keMGpKO82eoB9ByFrTiV2dFPrgHinRf7yo3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q10KahoQGZE+VEb/usrTNPhB9UKWiQhg3cO3AofjWEo=;
 b=WR/Bq7SC/Tcs7noe0KsNX4bso8pjRhpa+79Kn+ElXLKl918GyZWvBvjWg1YSz58ycw+7jqb1R+nt7lts2XL6+WQXjwWASbMqhpd+P2m8uOL+3zxCYcqrL1akT42SIoi5jMYisn73zUNLVSHmla7cXIEJTkYjJ51v7x5DGswf5w+/2/f71XF4W3DY7l52w1vtGhDuxnnInr82Uo0ls8attDzKDIMGMaePNc0hI/dWe1gniwF7lrFEbf4TKRVSe8dN97sM752wzC/5Y2dxmt5Ya6EfCUjEyFa10v4GVnDE2QlSoXwdgHSI3Axp0SNdG6zIIqzn6rCuH3ZCmKsiOC+Rqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DM3PPF74831EF4B.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 08:18:35 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 08:18:35 +0000
Message-ID: <eba59226-122f-40c1-a83e-184df0e8ffcf@windriver.com>
Date: Mon, 26 Jan 2026 16:18:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
To: adrian.freihofer@siemens.com, openembedded-core@lists.openembedded.org
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
 <20260126073809.468495-2-adrian.freihofer@siemens.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20260126073809.468495-2-adrian.freihofer@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0194.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DM3PPF74831EF4B:EE_
X-MS-Office365-Filtering-Correlation-Id: efba8385-e2fc-46bb-a94b-08de5cb37fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|1800799024|376014|366016|7142099003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZytnZW80Z2ZjNGxEbCt2dU1JZFlNMUZOMy9pZ1U0N2pENDVhYllHQ1d6RGli?=
 =?utf-8?B?ZDRrTXB6TXhIVWhzM08vN0FKMWRDNEh1a1FzUmpRa2dNZzhheHpNNzJpQTlM?=
 =?utf-8?B?c0pCS2lFbDhDRnlxMmE0TzFNWFowR0xvelI1VW14VmNBMHBGRzFsdmp6eG1t?=
 =?utf-8?B?TTU0RzQxUE9FbUNhc1ZrWWZNS1ZhN0hhVVhPRCtySkt6cHFOYUpyYXNITExu?=
 =?utf-8?B?RUlyUTV1TG9tNnhwdHB4TU43NCtlU3NycDY4R001VDdkS2pVdGxMS0FtV2F5?=
 =?utf-8?B?ZjVXb01FM0pPU3VJNWVHS1pmc0pWL2hLOTgwaG1wbVNPN1dFUVRTdlBJeHI1?=
 =?utf-8?B?ZmZwdEUzMklSekRFWTE4SlBPWDRoOGVRNnhENi85d2xlYWtJZ0w2MGtGckJy?=
 =?utf-8?B?aW5yTG1BckJTR004YVN3cmlwZXJub0lXTUE4MVhUMW0vL0k4UW80OTFmSGVa?=
 =?utf-8?B?MU40QWMxZ2lKRVZnSjNCaDhuMzZEZDAzb1hML3lMd1Z4dUsvSzcrMnFXb3Nm?=
 =?utf-8?B?SngvcGRsMW16Tkp4N0lZU1doSlhlckpYRldsZ05WeElIOUVrSGV2cVRPcTRz?=
 =?utf-8?B?eTdNcDl6Tk1aRGxoaFdwdkFZeFUxSitmaUswQ1Z4WVhGRU9wTVdFUFlLcnMr?=
 =?utf-8?B?UDZjakVLN1hXbUhRTW9zWVlOYVUrdVA2ZXJDNzRnSGxmNlJlODh1MkZleUpY?=
 =?utf-8?B?WkJieHdPYnFxbXZ6WTBpTFlnV3JVdmlOWnI4RUt4ODhxeFNsaVFoblhmaHNR?=
 =?utf-8?B?K1NoYWhWNGgxOU9TQmFEOWNmeHNKRGRNc1VYTVlzWE5NTmlkTTNxdXdwVDZs?=
 =?utf-8?B?bU13WmthbnkzbEVoS1crdjBoMzJSQmhtZkFmbDlKUTNTNlhBUStiTXpYN3Nv?=
 =?utf-8?B?eWVMTnIrZUJWWC9DczZYZFFjRDg3VHREdzhoMnB4aGJNQVlYMVNiNFc2Wksx?=
 =?utf-8?B?dW1aTHV0aHZVQkhvaWdCVkpsYVZZVk1qaXVaZU5IdHFuSk1SemZjTitWVUx4?=
 =?utf-8?B?bitkWGdCbysxOGg1akt2MHpYY2JLc2hhWW5BMERJNWNhZENqTjFoRUNSNU5h?=
 =?utf-8?B?Y2RnazRZWHdCSU83MDcxOGEvQkoyajdyVmoxU21KTnBhVG0vN0ltSmhDTGtE?=
 =?utf-8?B?cTFkamRLbEFaZWxlN2xRZHd3SXZjb1lCd2MycmU2bmlhdTRhbVVpYUhxSGY4?=
 =?utf-8?B?VC9sRUsyTmQyd3c1YmZBbFFNR3lXaW85UjBXYTV0enBOTjV3NXVadUs2MTdC?=
 =?utf-8?B?VTkwNjRoZC9oYjhtSHdsY3FqeE5Ra0tQbGhoNStlZ01iRkV0M3FEcnUzNmxY?=
 =?utf-8?B?YlJkUXRTNmV3UEtobTFZVExZTmJTZW1OYmxLY3VVTFRqVjNGVEc2Y0MwSzVk?=
 =?utf-8?B?Wmo4dFRMMG4xQTkveTRvUXlrMll6REFlSVZxT1NLY0MwUXJqR2NUeWJJZkRj?=
 =?utf-8?B?dlI3RmlCd3NVUlI1WXd3OVZuQkwzTG9sdWFBN3ZyeFJrUDZralZhWC9hVXFW?=
 =?utf-8?B?UFFDVEVHdndla2VnaTRITmxHeVBWbU8vM2JwbWg4R0pmNnBFaFVxc05TV2xv?=
 =?utf-8?B?VnBYRHBIM3hVajh2VnZCMm5JZExFY1pLVEVYYVp1bDdnTDBvTk9XNTNzTzFK?=
 =?utf-8?B?dklwOCtDcnpISWlCaDlIMksrclJmYWpCbU5VbzZnZ3ZxT2N1dTZYYnptRXkr?=
 =?utf-8?B?WGlwMlhYcEZwcFRWSEdJMU50bU5adTJGL2lDV3JXZWZHQ2hKNmQ4MHl6RVpJ?=
 =?utf-8?B?S2NLdkp0RmJwMEMxU0hJdXlJR0x0TDdEcytUTzViVWxYT2dGUFk5WHhET2dr?=
 =?utf-8?B?OEN2VmlLRnZkb0JUb052L0swZG55eFBhbnFvWE1HSlYxNUYwTmROYUhKSUNO?=
 =?utf-8?B?NU1RU3NUWHhpbmZGN3paMm5QeFNDSG1Ka1crZ29ZRUk0eW1GcHV0SzhZb0tV?=
 =?utf-8?B?NUR0cDQ1ZXdId01yM1paeU5GWTBhbklESTI4dEI0d3pEdUluNVd2eG9yNDl6?=
 =?utf-8?B?UitPck56dkRQQ25xN2ttelRUVGtTV2NNaWFCVVUxNGszNjJFYkQ3N01FT3k5?=
 =?utf-8?B?bnhMN0RDNVRuaEtEN0pjTUVTOGU2cUxhY0IwSXoyc0JHcXpMbnFDSDRKWnh1?=
 =?utf-8?Q?/GJs8fouD1NaXlt7eel3v4lMg?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016)(7142099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZDJyOXh3TXRZSEY3b0doRC9wN3hFejdxTy9WTVJ3RmkybC9QUndLalFZWGI5?=
 =?utf-8?B?TGgzd1dvbkcyVWxkVjY0Ujl0TUhEc0JFVEgwUFcwVEZ2Sk9BajZmWVh1TmFJ?=
 =?utf-8?B?dHFQVW4xWkVybGlVM1pnRGxPd1N5cU4weUhKbXZVOTJ0Y1QvMy92eGpySStj?=
 =?utf-8?B?YkZWUGttOFpBTHZVVmdMU3I3b3lrVTJrRHRsd1Z5MUNpMDEzQUFWblljU0xx?=
 =?utf-8?B?MTRZemk2U3Rla3dIMmlQdU81WTdnTnhoK2xWNmE2RWRxRTF0MHJ0WTBvd280?=
 =?utf-8?B?YnNrYytmbjZGY0FLQ2x2d3N1QlJuSGxBSFliN3VQcDZvQitLTGpJT3RIK1VD?=
 =?utf-8?B?MTVCOXA3R3V3N0lrZWJHSGtNTTFUMmppaVFHUGFDSTRtQVlYQk1lYi9MNmZW?=
 =?utf-8?B?aExER1BoSnVIRVk0VUVNNEc2eG9zSTVHUitVcjI1RDQ2QnNuNk1NakpxUnc3?=
 =?utf-8?B?d0JiREZaNE9GaGJqUGl4aCtuY0ZSeUxEQi9MNk9vdDR2WExWYUgzOXgraHNv?=
 =?utf-8?B?YkZDdHhQdlhSQWdvWTRvdzhXWEVVQlIzc3lIRjVRWTNKd2JYaytjODJWT0FX?=
 =?utf-8?B?ZGY5eGZKOWRMaEltZ2dJWC9kR3RaMUIyWjlWTFloZGxuZUszZlNQSFFzR3FE?=
 =?utf-8?B?d0M5ZC9WQXhSSnVpbUQzVEhmT1U4QWxEMlZnZVoybE5FdFJ2aUlmTWFycnll?=
 =?utf-8?B?TmthWjFzVDJzRDRDZFl1NWVRbU5HM1p3T055ODVVSHMrNElWZWNEU0pZb2sx?=
 =?utf-8?B?SGRHU3Axejd3b0NqVmQrSWpqNG5LUjV0dEo3aWxZODBwWERkeFMrdTdiS2pu?=
 =?utf-8?B?NlJLbGcyYnJnU3R1aXpRdmhmNEgrbWNHQ29GQUNRaW5IOEh6ejNDWlA1bWwz?=
 =?utf-8?B?RU1kaml1RE1VV3c4RFg1cEdnd01kdnhsbGl4bHVLMU5TL05YYytKOWRwT0xQ?=
 =?utf-8?B?R3ZFOVpiMkE1VFlsdm5hcmIwNThlZkZMR0RNa0hrcnM2TVRjWUo4QnMxQmFo?=
 =?utf-8?B?TzQvbHBpanNqdXNTTEROTm1CL3QycERJWEhQbVJZa1kzdElKSUgwY2hLSWJr?=
 =?utf-8?B?ZFc3TmluVkxoTG8vOHB0WU5hQkJXTjdoRnI2eS8rTm9nV0xYQUYyVVlOazNp?=
 =?utf-8?B?OUZsOU4vc211K1FZRHRtZnVsTmFXMXpwa05EMFIrRXlyQUo2QTUzUU9pVWZT?=
 =?utf-8?B?V21UT3B1TXZSWlpOUVVybDUxdDI0aE5IaW9MLy9lZnNWSmV6dWlVaWxIeUtE?=
 =?utf-8?B?eEROUlo5SFBnaVFwQ2lxd2N0Q2szVTVvZFlkNWJTSXpzOHl0eTZoTVYxZXU3?=
 =?utf-8?B?Z25GcndQVVdtZ2xWck1kMlRZdDZpb3JWSzB0NFdxYmpBbG9CNlNpVkU0WjZU?=
 =?utf-8?B?cFVtM21uQkkzbjVGblVkTjNSRGxLL1hGelpqRmUvTFhZOERTOE5CMkhBT3dM?=
 =?utf-8?B?M0dnU0I1bWlNc0ZQMDBGQ3Q2aFVEODBCcytGc0VXaUdteDB5TmJqQnlVNmMx?=
 =?utf-8?B?aHd2MkkwbUJlMDVTWXFVZUxpNTkxM2xXMCtINUEwdnZpa3doUU5zMmJFWFRs?=
 =?utf-8?B?YmFXc3k3enViWXB6VndwUkVXNC8zcFB5aXF0Q3RGbmpCbTBCQUR1bEJXK1g0?=
 =?utf-8?B?QTRZWE1iOURZL1NKU2JrZDNybDA1dU5iaHV6LzlXSDdKNE1lUitzS25oR3RM?=
 =?utf-8?B?eE1sbjdINnB1d24vZ05oc3h0T1YzU2lZVG9XUGJDSXJzdHhuWnZiR0I5T0dN?=
 =?utf-8?B?dU1zeTBRTTBwWXJYSXJUczEwUVc0Y0NtZ0FpNHMwdFNRQkVGZTNsc0oyVTRl?=
 =?utf-8?B?M2ZONWRvaXlTQWhuTXJBTnlYb0VQUktZUlpRUmV3RW8wa3dQbGVqcjVkM0lR?=
 =?utf-8?B?N1FuTlo2OWlBMHBheVAwWUh2aXVlK0s2ODlqaEloNTA0NUlaTENFeGJ4RzZs?=
 =?utf-8?B?YVBHMGI5RHh0QzBXZS9FTGdhSHgyUFU2NXFVNzFkOWo3Z2ZTYzhUa1JZZG91?=
 =?utf-8?B?cFJudUM3UDRVSlRHTEtlTGhDazN4S255ak1WSEtaenFWQTNJWk54UE41bE9B?=
 =?utf-8?B?UzhBRlZYUk5NNFlSeVVnWVlVNGxLRVN3TnZRZVdRQ1FmVlhBU3hidHZTZTNC?=
 =?utf-8?B?cldCNkhTUGVmUmJ0bldKVENIV0R1Y1FaQVdVM2JkcHI1S1RCbFdHTnY5dWZY?=
 =?utf-8?B?aFF3bHRVTFJJN3hQekE1eEtiRndCOXR6RG1nVWlJZy9kdllUOU1STnY1REZ5?=
 =?utf-8?B?aFo2a1dQcVdIREsyQ21DM0NUVnBzTHJFSWlHWlVFNndjT1dtQnZCZFV1V0or?=
 =?utf-8?B?dDI3MDlDdnkxL3k4R252TlVRelZLUXZVbGhlT1pKckxvWnFBc3AyZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efba8385-e2fc-46bb-a94b-08de5cb37fe6
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 08:18:34.9649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2XQgZr+/f3NJoqVHUyZb+RvpykDAhqRluJEr8dQACHOBEBW4s/ciwmaecw5XWTJuPzoqmoITlRFjpjoH0edwDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF74831EF4B
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=I+hohdgg c=1 sm=1 tr=0 ts=69772360 cx=c_pps
 a=eebb4ZtE0r8msBY2xobl+w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=a_U1oVfrAAAA:8 a=t7CeM3EgAAAA:8
 a=yrUEcVydrHec8ropUyEA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA3MSBTYWx0ZWRfX7IrF0esV4/8w
 DC95DWirfuyZYQBTjAS2hu7PQSFwAUYKeRAr488Xx88uv1HulQ5UXzn5g4oEvmQh4sNO/lNyvTY
 UwTLMMJEVHytquE6yOkkcKvyjqCy2dYMgKTDC2SbCX0zQkrGUeLs5Pq5wyW4en+tU8KSLgLPkhk
 WzP3ynnsht2b1QJONmtnXk0Oj3FEX98gn8XXSRq4q4qvUjkDE2/zbyXq2abKHdm/YqAMST/O5Do
 DyB1zTRDmyjh/wsMWrEeSp1orr6kycTsxdZrOsvZF7k2phpperRs3KmuT6Dq7p3pV1J8JkbN1Lo
 +QAb1AxlYL0N1jw7oRBd6P/YjKl4sqYurBRuS9fEQWkhALW8AJqZTkwb8Jv026tYbONPWy5ChC/
 T7u3hY2+X8NEnofQxGELecgVicKTPAWNVtxSXNve02wPaxquTUARmmw+o+4a0X4eyzrBewfeCxL
 PT6jvEoMO0TzMxAKF0Q==
X-Proofpoint-GUID: vwUUmViItDUp1Y0J9l8KZMiA-bZ5vHx4
X-Proofpoint-ORIG-GUID: eKAsOJNsGZFJeLfaZLmH6VYsbX_xbqZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 08:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229972

I have concern on this patch.

You're modifying a basic bbclass to fix one case without finding out the 
root cause.
By doing this, you're putting unnecessary restriction on the use of 
commands in this bbclass. Other commands with similar dependencies could 
potentially encounter the same issue in the future.
I think if you find out the root cause, you'll come up with a better 
fix. This would not only resolve the current case but also prevent 
similar issues.

Regards,
Qi


On 1/26/26 15:37, Adrian Freihofer via lists.openembedded.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> The exception bellow occurred during
>    bitbake build-sysroots:do_build_target_sysroot
> Re-trying the same command again can "solve" the problem, which indicates
> that the problem is transient.
> Transient probably means that libncurses.so.5 was not available at the
> time when the useradd command was executed inside the sysroot population.
> However, adding gawk-native to useradd.bbclass
> DEPENDS:append:class-target does not help.
>
> As a workaround this avoids using awk in useradd_base.bbclass.
>
> ERROR: build-sysroots-1.0-r0 do_build_target_sysroot:
>    Error executing a python function in exec_func_python() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>       0001:
>   *** 0002:do_build_target_sysroot(d)
>       0003:
> File: '...poky-master/layers/openembedded-core/meta/recipes-core/meta/build-sysroots.bb',
>        lineno: 46, function: do_build_target_sysroot
>       0042:    targetsysroot = d.getVar("STANDALONE_SYSROOT")
>       0043:    nativesysroot = d.getVar("STANDALONE_SYSROOT_NATIVE")
>       0044:    import os
>       0045:    os.environ['PATH'] = "%s/bin:%s/usr/bin:%s" %
> 	          (nativesysroot, nativesysroot, os.environ['PATH'])
>   *** 0046:    staging_populate_sysroot_dir(targetsysroot, nativesysroot, False, d)
>       0047:}
>       0048:do_build_target_sysroot[cleandirs] = "${STANDALONE_SYSROOT}"
>       0049:do_build_target_sysroot[nostamp] = "1"
>       0050:addtask do_build_target_sysroot
> File: '...poky-master/layers/openembedded-core/meta/classes-global/staging.bbclass',
>        lineno: 249, function: staging_populate_sysroot_dir
>       0245:                        continue
>       0246:
>       0247:    staging_processfixme(fixme, targetdir, targetsysroot, nativesysroot, d)
>       0248:    for p in sorted(postinsts):
>   *** 0249:        bb.note("Running postinst {}, output:\n{}".format(
>                        p, subprocess.check_output(p, shell=True,
>                        stderr=subprocess.STDOUT)))
>       0250:
>       0251:#
>       0252:# Manifests here are complicated. The main sysroot area has the unpacked sstate
>       0253:# which us unrelocated and tracked by the main sstate manifests. Each recipe
> File: '/usr/lib64/python3.13/subprocess.py', lineno: 472, function: check_output
>       0468:        else:
>       0469:            empty = b''
>       0470:        kwargs['input'] = empty
>       0471:
>   *** 0472:    return run(*popenargs, stdout=PIPE, timeout=timeout, check=True,
>       0473:               **kwargs).stdout
>       0474:
>       0475:
>       0476:class CompletedProcess(object):
> File: '/usr/lib64/python3.13/subprocess.py', lineno: 577, function: run
>       0573:            # We don't call process.wait() as .__exit__ does that for us.
>       0574:            raise
>       0575:        retcode = process.poll()
>       0576:        if check and retcode:
>   *** 0577:            raise CalledProcessError(retcode, process.args,
>       0578:                                     output=stdout, stderr=stderr)
>       0579:    return CompletedProcess(process.args, retcode, stdout, stderr)
>       0580:
>       0581:
> Exception: subprocess.CalledProcessError:
>      Command '...poky-master/build/tmp/sysroots/qemux86-64/usr/bin/postinst-useradd-01group-cmake-example'
>               returned non-zero exit status 1.
>
> Subprocess output:
> ...poky-master/build/tmp/sysroots/x86_64/usr/sbin/useradd
> Running groupadd commands...
> NOTE: cmake-example: Performing groupadd with
>    [--root ...poky-master/build/tmp/sysroots/qemux86-64 --system cmake-example]
> awk: error while loading shared libraries: libncurses.so.5:
>       cannot open shared object file: No such file or directory
> groupadd: group 'cmake-example' already exists
> ERROR: cmake-example: groupadd command did not succeed.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>   meta/classes/useradd_base.bbclass | 49 +++++++++++++++++++++++--------
>   1 file changed, 36 insertions(+), 13 deletions(-)
>
> diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
> index 5e1c699118..2d42864cbd 100644
> --- a/meta/classes/useradd_base.bbclass
> +++ b/meta/classes/useradd_base.bbclass
> @@ -20,7 +20,8 @@ perform_groupadd () {
>   	local rootdir="$1"
>   	local opts="$2"
>   	bbnote "${PN}: Performing groupadd with [$opts]"
> -	local groupname=`echo "$opts" | awk '{ print $NF }'`
> +	local groupname=
> +	for word in $opts; do groupname=$word; done
>   	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>   	if test "x$group_exists" = "x"; then
>   		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupadd \$opts\" || true
> @@ -37,7 +38,8 @@ perform_useradd () {
>   	local rootdir="$1"
>   	local opts="$2"
>   	bbnote "${PN}: Performing useradd with [$opts]"
> -	local username=`echo "$opts" | awk '{ print $NF }'`
> +	local username=
> +	for word in $opts; do username=$word; done
>   	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>   	if test "x$user_exists" = "x"; then
>   		eval flock -x $rootdir${sysconfdir} -c  \"$PSEUDO useradd \$opts\" || true
> @@ -54,8 +56,26 @@ perform_groupmems () {
>   	local rootdir="$1"
>   	local opts="$2"
>   	bbnote "${PN}: Performing groupmems with [$opts]"
> -	local groupname=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-g" || $i == "--group") print $(i+1) }'`
> -	local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
> +	local groupname=
> +	found_groupname=0
> +	for opt in $opts; do
> +		if [ "$found_groupname" = "1" ]; then
> +			groupname=$opt
> +			break
> +		elif [ "$opt" = "-g" ] || [ "$opt" = "--group" ]; then
> +			found_groupname=1
> +		fi
> +	done
> +	local username=
> +	found_username=0
> +	for opt in $opts; do
> +		if [ "$found_username" = "1" ]; then
> +			username=$opt
> +			break
> +		elif [ "$opt" = "-a" ] || [ "$opt" = "--add" ]; then
> +			found_username=1
> +		fi
> +	done
>   	bbnote "${PN}: Running groupmems command with group $groupname and user $username"
>   	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*$" $rootdir/etc/group || true`"
>   	if test "x$mem_exists" = "x"; then
> @@ -73,14 +93,13 @@ perform_groupdel () {
>   	local rootdir="$1"
>   	local opts="$2"
>   	bbnote "${PN}: Performing groupdel with [$opts]"
> -	local groupname=`echo "$opts" | awk '{ print $NF }'`
> +	local groupname=
> +	for word in $opts; do groupname=$word; done
>   	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>   
>   	if test "x$group_exists" != "x"; then
> -		local awk_input='BEGIN {FS=":"}; $1=="'$groupname'" { print $3 }'
> -		local groupid=`echo "$awk_input" | awk -f- $rootdir/etc/group`
> -		local awk_check_users='BEGIN {FS=":"}; $4=="'$groupid'" {print $1}'
> -		local other_users=`echo "$awk_check_users" | awk -f- $rootdir/etc/passwd`
> +		local groupid=$(grep "^$groupname:" "$rootdir/etc/group" | cut -d: -f3)
> +		local other_users=$(grep ":$groupid:" "$rootdir/etc/passwd" | cut -d: -f1)
>   
>   		if test "x$other_users" = "x"; then
>   			eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupdel \$opts\" || true
> @@ -100,7 +119,8 @@ perform_userdel () {
>   	local rootdir="$1"
>   	local opts="$2"
>   	bbnote "${PN}: Performing userdel with [$opts]"
> -	local username=`echo "$opts" | awk '{ print $NF }'`
> +	local username=
> +	for word in $opts; do username=$word; done
>   	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>   	if test "x$user_exists" != "x"; then
>   		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO userdel \$opts\" || true
> @@ -120,7 +140,8 @@ perform_groupmod () {
>   	local rootdir="$1"
>   	local opts="$2"
>   	bbnote "${PN}: Performing groupmod with [$opts]"
> -	local groupname=`echo "$opts" | awk '{ print $NF }'`
> +	local groupname=
> +	for word in $opts; do groupname=$word; done
>   	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>   	if test "x$group_exists" != "x"; then
>   		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmod \$opts\"
> @@ -139,7 +160,8 @@ perform_usermod () {
>   	local rootdir="$1"
>   	local opts="$2"
>   	bbnote "${PN}: Performing usermod with [$opts]"
> -	local username=`echo "$opts" | awk '{ print $NF }'`
> +	local username=
> +	for word in $opts; do username=$word; done
>   	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>   	if test "x$user_exists" != "x"; then
>   		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO usermod \$opts\"
> @@ -157,7 +179,8 @@ perform_passwd_expire () {
>   	local opts="$2"
>   	bbnote "${PN}: Performing equivalent of passwd --expire with [$opts]"
>   	# Directly set sp_lstchg to 0 without using the passwd command: Only root can do that
> -	local username=`echo "$opts" | awk '{ print $NF }'`
> +	local username=
> +	for word in $opts; do username=$word; done	
>   	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>   	if test "x$user_exists" != "x"; then
>   		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO sed --follow-symlinks -i \''s/^\('$username':[^:]*\):[^:]*:/\1:0:/'\' $rootdir/etc/shadow \" || true
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229962): https://lists.openembedded.org/g/openembedded-core/message/229962
> Mute This Topic: https://lists.openembedded.org/mt/117464897/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


