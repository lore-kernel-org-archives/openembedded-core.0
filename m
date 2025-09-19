Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF62CAC59A
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 13:07:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16262.1758287252160400310
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Sep 2025 06:07:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Z7PT1yal;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13571bdf75=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58JCBhjj1807690
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5gDHoM9Ws1Gh1wcE0nwbyEP1fQ5HXqlmHvRuS9GIRl8=; b=
	Z7PT1yalpD4G+vSnZZxiFxDeJkKN5W6kK6kWhpJA4P7tm+uFsz938j71vTeEanQg
	8EZII0/idDyXr0RrCDaAIoB9rSs2EiOZgQxXGz1IlIgPeVGILdmSZIaB/ImoNRvy
	Hu5dhxFRnhtBQ/420LsRDgymP1JxRwsVYlXptOdI65rzNTCJAJPq1I9wyBdIQwLd
	GuVkgJYyZfDtWgBJymL8bVMC/EHmalaoWe9EiKgm28JmRbD2T63WivEw/SFJRiP9
	hfzrXFHqAJV/33xc4EYv8LmNebUdFCUsSbXRS2/fSJHI8IiHok0yTvTRJtnSHDgO
	E3fmoxxhAVG81ph7sZT+aQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 498vmrghjt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Sep 2025 13:07:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TgUZxVNmwBeKsaafYh2+BJ5+/6Yf4SrTg0CxXCISSOEtz24pZXYPUFFppdT2vrjqTee2fpuOk/fiMkwDc6z8nkUP6NlmAnXURJavY8wbe8kTqSCv8R6ACm2nrA6XLxAk2XB1rHPEbNHiQyxAgALy6qPlvANStYBhl/ffDsFCjsWcB2E3Oks+siVLMGINc84rLpv/IKPkr6jV60KXT45lBaQFDb6+qKEJDwaohruGm5GK3KH0n5xQf5cWJBu9cAm0z3IbXihNzmDDuXk+uLtz+vWe9vomSEELYLfBGrGVZK6dq5aW1/ewDH4Q94TWVoeMJXu5nPuV42N+yseuKgNpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gDHoM9Ws1Gh1wcE0nwbyEP1fQ5HXqlmHvRuS9GIRl8=;
 b=mm/ghS+c/LhVa7F/4dynIH3jI6nHjzadBKrU+L6MHPw5cp34LyxoUT8OZ0aSm3XO+M3JdaLdisNXNK9mApHKTyggnKKfFFkOMQbfaH41BnFXKOpu6H45o6VLuX22uOAuNu3dvtWOhqxrMITJj+wKd6IJB69xd407Y0s5fzBkuh8D8+m3jHejl3m5oTOi4t8+kuayLZDmr+p4nfr8wBJFPsAWekMJxMSRmhsT+fn4V7U1zFskE0yH1nZqf+vUbjErbyMTK+PAP8Ldcsnriaowt0AM4lcM+fT299DWCx88VS2YtFvq6Qt121jwWfULuiI2FcbEhjT8+0BiI3JQRNj9Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB8232.namprd11.prod.outlook.com (2603:10b6:8:15d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Fri, 19 Sep
 2025 13:07:29 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9137.016; Fri, 19 Sep 2025
 13:07:28 +0000
Message-ID: <cf8a592b-1674-46f2-8b02-3b5a9ec89212@windriver.com>
Date: Fri, 19 Sep 2025 18:37:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Remove rust-llvm dependency after LLVM split
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
To: Ross Burton <Ross.Burton@arm.com>, Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
References: <2906764e-7bca-4947-93f0-2564ccc75129@windriver.com>
 <4513AF0E-A093-4587-BD47-343AC3ECABDE@arm.com>
 <af52f896-b980-4923-bab2-d93c44c71970@windriver.com>
 <909D91E8-7C35-4975-9F76-5D49904F9B8D@arm.com>
 <831a7eea-d724-43ce-b8e0-b6dd384d8737@windriver.com>
Content-Language: en-US
In-Reply-To: <831a7eea-d724-43ce-b8e0-b6dd384d8737@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BM1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::18) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: 4239c62f-3a77-4dbd-537a-08ddf77d7c27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S01tZThqQldBUURTUTM5R1NSVW1PRlNSYWNiM2FRRG5NTGdERkM1LzdvMHVZ?=
 =?utf-8?B?VStVWnB5dU45SXVjOVdZOGhaNnM4S20vZjZ3S1ZaZm9Vb1B2dElvb3dXQjZ3?=
 =?utf-8?B?emRSR2Q4VFpZcHo2Z1BxTGFWeGk3aEdGUkZFUzVkQnd2RzZiTjBQMjVwQjNN?=
 =?utf-8?B?WHJLKzlQSTM5MDhDNW5YWEVsU1k4Y0ZvS1Rwd2NoQ2pyS2dodEszZCt0SENz?=
 =?utf-8?B?YlNRZS9UVUgxdXBuL0J0cHk2NHBCTEVPVVdYUlk4b3JRcVdRY1pxRllwZllp?=
 =?utf-8?B?M3NCZ1liMFlhMTQ1TElhYm9YTURUS2FWQjNqM3NvOTBmckJqQzYzMGc1emNN?=
 =?utf-8?B?ZTBhN1JETnJMTEEwalBoa0JFcDBFSVZiNG1QYVl3OXJUeFpITllUSUgxYjlt?=
 =?utf-8?B?QUxHN0xIR0dXYU9ScHltTlhjakZDYWNIRjJLRjdtMW16QlUxaVZxWkptenlT?=
 =?utf-8?B?SjJuM292bTAzZUlHTXk3SHhoZGhFa3JrWTRkY3U5aHhCV2V0SEo4Sms3YzlN?=
 =?utf-8?B?ekhzNllmcmE1V1JWK1I0NjVwZkpMaElUZ0F6SDJXNGtDQnNDUjkwK2ZlWkVP?=
 =?utf-8?B?QXdxVHBmUTZKY2NVZWdwbjI5M2Nnd0dvZWltMVdOcXA0aG5IdE4xV2x0enRI?=
 =?utf-8?B?WkFsYmZoUVZ4UGhvUmp4T0Q2bWlRNDY2eUJhV2gwSXZmeXhacVhsN3RzWUdN?=
 =?utf-8?B?MFJobTA5ZFlZajlPUG00ZGg3UklXY3RydFl3U1k2V0MyN1VMR1BnTndkcFJS?=
 =?utf-8?B?WWk3L2VYdnl6QWhwNnBUN2JXMTlTUnNtZnYybENPQXZaOVlPL2lBVkF4cVQx?=
 =?utf-8?B?ajFnRk5NdGFPVXRJR04rTERuNzhSR3c1aWh2empvL1FBMXpXb0MwYkNFa0VW?=
 =?utf-8?B?bmxzUHpRbElJRERTTEhsd1V4bEJudENJbWtERWoxUGtldUxrUVRCdGgyZ0Nm?=
 =?utf-8?B?bndTb1NRRGkzc1FKVXhERktMaVQ1Vm1DYmhSRjcvOXJ6S0N3dTgwNytjUnJP?=
 =?utf-8?B?ek1vRWlFajBFNGkycEhtNXFIeS9zc0svNE9NaTBlUmpESFV1bXZrNnRrdEl1?=
 =?utf-8?B?cllYaVZDWTQwUkN2QXorQ1FOeXI5YWpOWGtmalB6RmRiRW0vSFpmVUFXZ1NT?=
 =?utf-8?B?NmdlSUI5NHY2dzBzREVCVnVxM0t4YjJqc1hFOVYrL1pNZjcwTXRaKzU4WWQy?=
 =?utf-8?B?aDlPNkhheXpDbHhpUVpmaEJOR0xWMjlnbGJxdmtWN1B5UStYNXZqcFJvVE53?=
 =?utf-8?B?MElpKzFvOFJWU0ozeUovMkZNcUxmc3Z4TVMydEJ2emg4aC9wb3FRYSt0djlY?=
 =?utf-8?B?dXE0T1B4K1UrblFrZ2xJTEFsRE9wcFc5U3doR1ptWUpWM3ovNzk4NjVwUmU5?=
 =?utf-8?B?aWozT0JBT2Flc1hJRW1tTFRTM1U3c0JrT0N1VFRtVjVJZEt0bTg1QjVXTnls?=
 =?utf-8?B?VjFiaHRuSDIxbFI1VUdyY2dwTlFMUXBrL3EzR3dzaFdob2V6OFAvbTJ5dHJJ?=
 =?utf-8?B?RW44ZXJNYk8vWDNac2ludEMrdGhzWFhHQlAvYk1nSXdsYkgzTW1yNkw0QVJW?=
 =?utf-8?B?SWVKcnhnbVVvUUN3SEZROHh5WFlQMWhxU1VLYWMwSXVENUVEL2JiMkFYcjkx?=
 =?utf-8?B?aUNTQlY0Mng1SjJDRERDZ3pJUXkwRjBzeGkyYzR3d0gxWE5xNm00NWdMOWVP?=
 =?utf-8?B?VmJ3N2dIdDJIeVpvb0F4bVRwY2U2WUZrbXZNVzFnUGxLeEd4TjlaNUI3a2tK?=
 =?utf-8?B?QVc3eHRCcUpGekJESkdNU3J4TU9vRklMaTNPSURjQlZTb0VHQkJlMjBYemJY?=
 =?utf-8?Q?TYE//s8WYBex/R53J/WsJ0KDUUFPQroEUUj90=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bW5Ld0VLOEw2V3Z0VEpUbVd1ZlNVQ1dsQ0Fqd3ZhUFFBdHREUGZJVGZKaEcz?=
 =?utf-8?B?OXRDYXRsRVpubVQzcUJGdXBoWmpOL0VMUmFwcllKMHQ2ZVE3aklvUEM5dFpo?=
 =?utf-8?B?TlYzRHNuUXoxUVd1MEVzUkR0Lys3VVF4VTBJT3V0QXhiQ0NFQjRjVzVGb040?=
 =?utf-8?B?MnA0NHdSeDBGRGtrd3hpei9DbHpzOGhVVC84OUNaN2VBaWZ0TCtqd3JJN2sv?=
 =?utf-8?B?MmsvSkhDQXlEc1Q2aTdUOTFkR1BiTnVOd2dKTitwdElYQkJxSDQrNDBabHRu?=
 =?utf-8?B?M2JOZ3RFSkJ1dGR4cE9DSGhGZGQ2SmZqWmpDZkV3YWhnK1MxeEJGYitFcEZn?=
 =?utf-8?B?cWhkRXk4bDA1dE9EbkNtWDFoemo3NFlPbTdBbXhRSGZkZC9DWmRSZWM0ekNM?=
 =?utf-8?B?azlScEJ2UXJtZC9Cc2loM3BEekF4VFhaRXNMaXE4MWpVQ255TDZXcm5GTlVr?=
 =?utf-8?B?NUpncTlORFZlMHpyZ2hYMjFXZk5XUmdqVmd2aEYvS3BaVHZTWHQrNnlWVmUy?=
 =?utf-8?B?cVhNWkdneU1wVGFZck4xREVmQjcxNWFsRUxqb0ZuUVRESnMyNlJNZ0prZk9U?=
 =?utf-8?B?aHVTK1hGajlXbEtoKy9mbThBajMzZUtZZ0FhNHV2dnRheEFocHNjdDVTbTAw?=
 =?utf-8?B?MkIvRmtLaDMzSXFWK0ErUjdCREZ0MEVUbS9lWXI2MDNzZjY5UWo5M2oyYkt4?=
 =?utf-8?B?ZGxQRWRmRkEvV0x4WnBYRm9Dd0VGQlBaTjRCbzZjOEhiUXRLcy9VaGh6bnZ6?=
 =?utf-8?B?NVRUOFNjZDdJSzI1QWIxbnloV0kyTExhZDBhdk0yaW5xWWtwb2U2dEpzWFlk?=
 =?utf-8?B?Wm9LMnRrOGZ3eVppOUZ4UTFSeDZOd20xR2VvWEhSckRzQk51WXQwWkJqb3NO?=
 =?utf-8?B?T0NQa1BjSkV4WCtHZzc5YmpZN2FWQkZvVytNdEhGcGlkWHQ2N3BmNHVQWmhT?=
 =?utf-8?B?SmFwMHNPT0FCQm1ocW1MZHBPT2E1T0dlemNlbW9qcUp2TnhMbnJ2MTJwUjFW?=
 =?utf-8?B?cm1iRW9DeWdUSWpDb0w2bjlSa2ZpbWg1ME5vQWdmM00rMWtGbE5SL1FOd3NH?=
 =?utf-8?B?TkdpMUNmQnBkQzdzWFg4allIWDV1UlBMVitBNldscXh0Q3ViNndkdGMxd1VZ?=
 =?utf-8?B?MGY2dnpnWU1wVTJZanA2aDh4YnAyQlJpSnZFT29rcU53WUNqRlgxdURSN0dt?=
 =?utf-8?B?NkJNYUhiWE9lZTR2OTc5NmlSbllDc2pMQjRDTVF4a3BYNk9lOTdPSHdmRTFw?=
 =?utf-8?B?Q3BzY3VtSTdlSG11VUM3YnE4Zy9neTEwdUpndEEvc3BNcjl1V2ttUmNtTjZN?=
 =?utf-8?B?a1N6bWpoZFliN3p4bStWZlhVdEYwWjVWejRLTWFmSzJHS2pPSHlqU2Vha25P?=
 =?utf-8?B?MVFvZHQ3QXp2R0FoYlVpNU9TY3Fldyt4Q05yWnBtNkpOcHcyNkVaOVR6dFRR?=
 =?utf-8?B?QmlYeFBrWUY5dy9IZFlXTWIvMlFmTk9DSW1UN0JqQ2I4TkMrWEt3QUh5ZElm?=
 =?utf-8?B?MG4xUStGVVNhdDFJNEJmcVJkcmJtVjJaSW82cGZLd2hSWDlYa3RRS0NuYmcv?=
 =?utf-8?B?aEhUeHVVOHU2anVaeUQ1dXJOTThaUlAydVlhOWt4NnlLb1hWS3YrOFJldlgz?=
 =?utf-8?B?b2p2cWJ5Qm1OS2tGTGVxTzV6ZVpyY2dqM1g3SWYrQUoxRWVWZFJWN3d3cjQz?=
 =?utf-8?B?UExtTXFaUG44UHRFWW83RnZmUXVyc3lxL0FiWjk5bWlYdHVOUkxHYmFueFZr?=
 =?utf-8?B?SE9maG1PSzFmRkZhVjMrOUxhV0xpNjhGYjk2cVBlRGZuUXAwVGNZcHNqTnk5?=
 =?utf-8?B?N0VxaStvRkRjQTVja25RY05BMFI0QVM4WFRwMWFpQU1mNTQ4U3Vyb0ZYL2cz?=
 =?utf-8?B?RHl1R004R1ZGT2hCUUpQM04yekxHVnVKbjRjYnJpRGVRa09vT3ZvUVRBQXlK?=
 =?utf-8?B?cG14TWdkcjVTREZZcHhnOHc1aGNoN0xZUlV4SnFCWGhxOUJWNjZOMlNlenMr?=
 =?utf-8?B?dWdCSHdkYzdJZUtYTVU5ZHh0MFBRdHhnYXdxOUVqdW91L3duZ0hBNEd0ZXBY?=
 =?utf-8?B?UXJEbno2SnA2TEVuNzFyaWJSOVY4Lzlha2hZTnIzcXhQRkcwWFRHdXVHeFp4?=
 =?utf-8?B?K3o2K0VleU1OTXN6Tk9zbXlkbExiR1djSGV1bTNvZjZ2QnNEMTQyRnhiVlA4?=
 =?utf-8?Q?8W2r9tcMNyzMmkvwi8HA6HM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4239c62f-3a77-4dbd-537a-08ddf77d7c27
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 13:07:28.5520
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 195X6UwzRNBWpQBg/o5uNRSXni97KGz5Eiumz7e2SS5DFIg1Omo4JDM5FvqdMwiJhC/+yzySZK11XL5eJwyU8Cewsa0pN9MKOYhJop7vKNe0G2D0g5CiB/gOw4a9zz5l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8232
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ZP7XmW7b c=1 sm=1 tr=0 ts=68cd5593 cx=c_pps
 a=AyKazF/bLMNy1/nXoCkdcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=1NWNoF9oAAAA:8
 a=t7CeM3EgAAAA:8 a=IvQJNAUUq8ru2VKf7xoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=lPB0YCCQEzgA:10 a=raLgtFQXjjEA:10 a=97APRTa-CG6DvPMFVxHL:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDEyMiBTYWx0ZWRfX7AQpeeMRyl8E
 kO+QWx2F2xX1fx9HRj9ewOBMUPTP3BaFUDnkkGErpDZehYk8IsmZkMTn8Nb/CAXdQPoIkukcgON
 kRpAsoGLM5QOJnI7dj+tnzDgfYvdZX3FW9QfCEzh9ydQEwTFv9W19lSiLhLz2qZhYExD6nLETK7
 jCAl7DLTVhypg2m4Cz5fgBdFXrRHf7F5+55OhkGSQRHZTOBtZ4zvF2SEFFH6XKyz8FY75AGjvxU
 ZUdsdiPqazRFBVXy0IC5lmzcqJpVe+PXJALU/VnE3DoXkjnBKUJlDtcQsqLEM/e/sRPtz/KVwaZ
 hYiZXXxZ+FSNDfj5Uftpk57FYDxohIfv78bFiC4a23k7DZa5c1XEu+CbbRukjM=
X-Proofpoint-GUID: U82GzzdUnIAT5cbd9cNeQUoy5BtdoMN5
X-Proofpoint-ORIG-GUID: dTdtyfx9FCpli4KCSIoDA6_NEnSUAp6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58JCBhjj1807690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Sep 2025 13:07:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223747


On 19-09-2025 18:19, Deepesh Varatharajan wrote:
>
> On 19-09-2025 15:50, Ross Burton wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the=20
>> sender and know the content is safe.
>>
>> On 18 Sep 2025, at 15:42, Deepesh Varatharajan=20
>> <deepesh.varatharajan@windriver.com> wrote:
>>>> Can you share a branch with your changes in? I=E2=80=99d love to run=
 it=20
>>>> through the performance builders to see what it says.
>> So I rebased this patch on top of my clang/llvm split and the results=20
>> are encouraging:
>>
>> https://valkyrie.yocto.io/pub/non-release/20250918-107/testresults/bui=
ldperf-alma8/perf-alma8-vk_ross_wrrustllvm_20250918175407_f5c74dc97d3.htm=
l=20
>>
>>
>> The build time reduction is slightly more than with just the split=20
>> which is good, and the tmpdir size drop is very noticable too.=C2=A0=20
>> Excellent work!
>>
>> For reference, this is the buildperf results for just the clang/llvm=20
>> split:
>>
>> https://valkyrie.yocto.io/pub/non-release/20250913-79/testresults/buil=
dperf-debian11/perf-debian12-vk_ross_llvm_20250913145051_e65d2b894fd.html=
=20
>>
>>
>> Cheers,
>> Ross
> Hi All,
>
> As mentioned earlier, we're encountering a Rust build failure when=20
> multilib is enabled. The issue stems from "llvm-config"
> looking for libraries in "$STAGING_DIR_TARGET/usr/lib" instead of the=20
> intended "$STAGING_DIR_TARGET/usr/lib" path when
> multilibs enabled. This appears to be due to a hardcoded library path.
Apologies for the confusion in my earlier message,

The issue stems from "llvm-config" looking for libraries in=20
"$STAGING_DIR_TARGET/usr/lib" instead of the intended
"$STAGING_DIR_TARGET/usr/lib64" path when multilibs enabled. This=20
appears to be due to a hardcoded library path.

llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.89.0/recipe-sysroot/usr/l=
ib/libLLVMX86Disassembler.a
llvm-config: error: missing:=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.89.0/recipe-sysroot/usr/l=
ib/libLLVMX86TargetMCA.a

But these files are present in=20
poky/build/tmp/work/x86-64-v3-poky-linux/rust/1.89.0/recipe-sysroot/usr/l=
ib64=20
location.
>
> I noticed there's a patch=20
> (0005-llvm-allow-env-override-of-exe-and-libdir-path.patch) present in=20
> clang. Even though the
> build fails.
>
> I also attempted to export the $STAGING_LIBDIR variable, but it seems=20
> to be unset or overridden during the build process.
> Is there something I might be missing or overlooking here?
>
> Thanks,
> Deepesh

