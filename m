Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A076C3601E
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 01:10:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.64067.1744074628533502894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Apr 2025 18:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6193ad70c2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53802clu030626
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Apr 2025 00:19:58 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8k2xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 00:19:57 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5380Jvmp021716;
	Tue, 8 Apr 2025 00:19:57 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45tug8k2xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 00:19:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=actY2NPv175odrzzAmKKW/ris+7OkZQN0MuPduJ2rnte7/5kBLL7sw/au2/202abdO3+fhD0LIU2vz5b+ZUEKw8KMjq1gmWgPtq7uyF+3QcgQCu/D5rObimW0ForHOJsghhvfcQbO0sVxMZ3JhQOL0X6a9AWApqh5x+ud9yK1ydss1dAtMA2yIBXmtt/f4ioVTuh4vYV2ygiAlFYXU0drFS/hMRxoOj7epyNeecP1p3jMRC05lk7sz7uTjDmiSt3fYxGGQrBD3iiRahfIqLmDKgsBmzHcGXMiCsVdrXs68iWYDJxiSVRa8Dy+UTx+jN+sjdZOe8H7bzpdlm0ZMxotg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k600t8PpWNnA3rOpTcTfKU7OZ3t0sDNmqc0S2+5crJw=;
 b=C+Sigxvhs/M84/3AB9us7DURH2iS0uKmZ0fxbAAPtH4O5gdYvDAeUbcStJUP72sapcdo2tnB1joJH+J0oEaQbdvZhnQ2Mdz6l8ctGv/w0lUfoGtpxh69zIo2e6f7KQuzy3IIGN4Kmnshn9Po6dcaSx2uLyh3j1z8a2lG74TgS8sa3cklx/cNBKeusEUMQixGQCGLTNmiOiCdqO3k/qOkKXWr/XuBEzApyq0kyxv70xID0vvcejsUXRcSJgUMaKu35hTHJZia28FMCBAMxleUFqKYbQVbFrTJwYFE+VPlfWeelfTYu0LcZ4wlkWT+LXxvFcDg6UPzW1J5/n8QqIEtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by MN2PR11MB4742.namprd11.prod.outlook.com (2603:10b6:208:26b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 00:19:53 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 00:19:52 +0000
Content-Type: multipart/alternative;
 boundary="------------Ps60NnFQjUP3OCFGeCZRhZl4"
Message-ID: <9fbf35dd-e562-408b-be87-daeca7c86d3b@windriver.com>
Date: Mon, 7 Apr 2025 20:19:50 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] initramfs-framework: remove hard dependency with
 busybox
To: Khem Raj <raj.khem@gmail.com>, Christos Gavros <gavrosc@yahoo.com>,
        "Hao, Kexin" <Kexin.Hao@windriver.com>
Cc: openembedded-core@lists.openembedded.org,
        Yoann Congal <yoann.congal@smile.fr>, jbk <jbk@mm-software.com>,
        Adrian Freihofer <adrian.freihofer@gmail.com>
References: <20250407164456.4845-1-gavrosc.ref@yahoo.com>
 <20250407164456.4845-1-gavrosc@yahoo.com>
 <CAMKF1sqHSmryz3LSpsJiL1AMGdaoSGZK0vWgYfw3xymBAiEz0w@mail.gmail.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1sqHSmryz3LSpsJiL1AMGdaoSGZK0vWgYfw3xymBAiEz0w@mail.gmail.com>
X-ClientProxiedBy: CY5PR19CA0096.namprd19.prod.outlook.com
 (2603:10b6:930:83::24) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|MN2PR11MB4742:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c98a9f-e463-45d9-af52-08dd76331506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|7053199007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YUVpZEtmWUd6eGtqYXRtZDlDdjBzZ2JhZFJqbDlxWllXZnNNeUtvNWFlL1BW?=
 =?utf-8?B?MUt5RzhvNURtQ0NBUEMyM1BHMWlvNHVKL0FBYlpIVjJMc3RXSGRBV21yQTh4?=
 =?utf-8?B?NUNZUm90aXVkMzJOL1ZwVlVza3AxWkduYXV3Uzd6L2phdytYazRLdmF6cEdh?=
 =?utf-8?B?M1NjUkplNTZtWnV6bEFzVStISkNwT2ZHK0RVQU1MK1FxSHZiMUowTEIrWisv?=
 =?utf-8?B?TWgzU2Fab3FwcG5pRFVEaFdEYlgxRS9ZVE9hQ0ZNY0tZaWc0eVR2QzErdzVI?=
 =?utf-8?B?N1RwcUtnYThsSWFZSFhBWmFSUGZvdzNtdFpTVytHMVRzL0ZCemNkTXk2VkNE?=
 =?utf-8?B?RlpjRHlVOGM5Z05ZWW8rc1hXc01pRThoTEhaV01kMlNWb2lpeUNyMExDalRV?=
 =?utf-8?B?dS9KUTNWc3o2Y1A5ejNZaDJuQysveDFBS3kwV3lucnU0SmxjQ1RRRlBwSjFY?=
 =?utf-8?B?QmE2NjhUVjlnVUxBUlQ2R3U0UVJZM3kxdjl6ZmplSGRqdUsraDBla0Nvb2lw?=
 =?utf-8?B?dWlFSDhYUUdnRHI4MU8vcDR3UTBCT2xtSEJYUFplZXBaQ05FNWh4V3E5S1Jw?=
 =?utf-8?B?U3JEd3ZlWnpWK3QxK3VIMStZV1hIeDVOcDNyWXc0ZWE5SWhlMDlJbDY2enh3?=
 =?utf-8?B?ZDRjSDhiVndxQUIxd2VFMlk2aTMvOWttTkNWUmFZMUFzVnRleTJGSUdQKzRR?=
 =?utf-8?B?QklIaXV2d0s0TGFLY1pGV1c1dEE4T0VncFFxR1haODZxOVRqQlVRdFhqUmNs?=
 =?utf-8?B?K3oxQVU3cGFVZjhDZTY5Y2FqY1BHM05vU0tsV01rOGxPWm9NWHZxbDcxR1cx?=
 =?utf-8?B?OHU1Z3RreEN6b1NnNHFGVTlzalp3aWlDRVYvU2l2YmxLd3R1NjNic3hPNzJa?=
 =?utf-8?B?R3FPQWxoVWFaTlI2bEEwdVB5T285by9qc0MzWDZKT1NselZaZ2doZGYxZVlo?=
 =?utf-8?B?LzVlMmxKMUtWYUtDS3JLTC93SzQrU3lKaDFWV0lwcjc0dHNoY3Z1WWV1WXB6?=
 =?utf-8?B?d05ZYXlwMjNMVjBlaFJXTHN4U3g2d1M0NC9adEQ3akFnd2xPZjVuWWpxZjQ2?=
 =?utf-8?B?SDRRenZ3NytrcGZ1TDFlZnV1RkRsMkd3a05wY25ENG92SlhOcURIT0J4U0FQ?=
 =?utf-8?B?eUloejhJdURhc0pXaHlLSmh3N2ZGekQ0L1NybzAvdXVjaCt6MWdvUldpUzE0?=
 =?utf-8?B?TnRqL2pVV1U2eThxOGdVYVo1cnlPZ241QXJoVk9mb2xFRkU0M01BeVA0WUZp?=
 =?utf-8?B?N2hjQ1lpbE8rZlUzQmVMRC9ZbTVyMlFLaGJMeXJDMjZXeUY4OHcvQ3QzN3pk?=
 =?utf-8?B?Smgyb1puQzM4NGYxUnlIdTFzWHkwR0hWSDdIa3dzdmtiUjBGWWlVUHo4Y0F1?=
 =?utf-8?B?aldJVDFSVVpnUmFvQkdLWjFKZTd6U3p3MSs3ODlZdHJOMVFqYTUyVnFiQXNC?=
 =?utf-8?B?dW1vSEQxVUtwYlRxS2ZlM2FQaEp6ZnJtem1oV0k0S3dLTW9sN0dVTkRCdDlC?=
 =?utf-8?B?MnVrb3BMSGpDamRkT0xZckZmUStrOURZNHJUSlNRT1VCODE4cjBEVDVCbWs3?=
 =?utf-8?B?dWhTZFNkN1M5cWJnVkpZMWZMQXJYNUExK1ZHWE5qNjFPWkdRc3IvbG8zcVNo?=
 =?utf-8?B?bTlXUlFwby9qZVhmY1Z2NC85Sm1rekZyeFZ4UGx6V05JTFNEWjFvaFRacC9Z?=
 =?utf-8?B?dE9vVGx4enByczJzMUVVVy9vQkhVUTBINnJSeFB0anlJSFJ5NEM0Wk1UcXdk?=
 =?utf-8?B?cnFEVnJFeVRxWHhodit4MEZrTVN0bzRycnNmN1ZQbldyS2d2NG5jKzJyVWxP?=
 =?utf-8?B?Z1VVb2dnN2JEMWp1V1J4VHFUUnJyT24rTlNMNzVUVUlzKzNpaFBvOXl1ZjAw?=
 =?utf-8?B?ci9SbURkaEFDZWVwVkU5N2s2V2F6Q05MTi9SeUU5ZDN0cU9xdFFVKzdPS01M?=
 =?utf-8?Q?Me7ScOVdv68=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(7053199007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2xjZHJLTmsrYmRvekIzTk9YMkZxeHVwRHZmNHBDTWU3T3VJL1VYU0dIOHZL?=
 =?utf-8?B?THQ5UnJwSU1ZbDBpT3BrU3lINGJ4UXVQS3A1ei95S1Z4a2RsU3J5V0doVTlV?=
 =?utf-8?B?RUNrak11QVFLSWkvZWgxc2ZrWXhWVjZZcS9Za1lOTFU0elFNa0J6ekg1bDRD?=
 =?utf-8?B?TW5JcjJOUjFQTmh6U3VuZzA4L2ZXdGhNTEJmR3ZGdEV1NGFDTnArSUhkWDJX?=
 =?utf-8?B?S3VwcTJjT3Zkd0tjME5iMDVWa25KdWhka0hkUC9VSm9wZzZuRUFhOUk5cGlF?=
 =?utf-8?B?T2RzMnFvWXFIQ0d4K2puTmdhcHRjOFFmcE1aVkMvRmJBL2FOclZwRlUycFB0?=
 =?utf-8?B?MWJDNXo3Q1dBM2IrZFl4WEVQdkRKM1Jwc1NXKzBSaldmRVFzRUYwRVoxMWhE?=
 =?utf-8?B?SjFTc3Fuc1U1aGErQ0tOcDBVSUJpa0ttQjFrMWdhRGttZUR0c01xTkZ3TlpI?=
 =?utf-8?B?SzZiTFVwTmRDQlNPb0xoVytwZjFtcWhKN0pFSVhhOU53U2UwWHZsUllwNllR?=
 =?utf-8?B?SG1FWUtPS0g5cFN6Z3R1VXlRYXZTbGZJS2xaazR4RDlCZC9GbWdTVE9lR1Bn?=
 =?utf-8?B?MjhoTEx3UGpmV00rYm1kQ29RRm5iV1ZzeXcyOVoyNlBzS1RZdnk4SmhtZmF3?=
 =?utf-8?B?bTB4OGN1eWhpNHRZSklpUGVHUnIxZEdVcm84cE9lUlFwMWdZVklVS3JaVVQ2?=
 =?utf-8?B?TWF1VEo0OGwzNTgvNmZDd0RrYmdNaVEwSGpaelM3Vm5jOHJPeTRqMjc2WENC?=
 =?utf-8?B?VURXOHlxaXY4VUhSeVVlMVhQelhkTnpBckdwdXBmVm5WZms2WnFzQmx5Rjlt?=
 =?utf-8?B?TnVaSnhwck9lWkVPYUdUUkdkclV4cUZRYlBjQVNDV3Q2V2ExR1N6a0E4L3Rs?=
 =?utf-8?B?SVdJeFkxM20yd0NSS2IwVG1aUWpJeXpSRERkMnRGMEp6TEZObWZ1QmNqSWVy?=
 =?utf-8?B?V1hZTnNIbUJkTHRwdTZQbHo5ZFhuUUxWOFg4OHFMU3kvb1B2bkg3c01GMHFF?=
 =?utf-8?B?bUhsamN6T2JxcFRzV21sTGdYV25yS2ZMeFI4S2VOa2hrYU91cFFyN0NsSFJK?=
 =?utf-8?B?L3RrTEdlc0lvLzQyTHBCd1FaZU92YnAxYlVzaXJOaTNSNXBwWlgvNXAxMUg4?=
 =?utf-8?B?dEI4ZW5mekdiVlZpZXFYMDZ5MXhUK3lSa3d3UFBldzAvZ0xteWFxQzVsTHBi?=
 =?utf-8?B?UklOcFovRWMzUHNjQ2J4am9oNi8wWit4cFNRemNGZ0JacWh4VDE5MjVrUWNZ?=
 =?utf-8?B?YUkxd202cmU2SGh3OWJObHltNVhFeWl6S0tqdGxJbUxER0FDU1A5K2I5S3Nm?=
 =?utf-8?B?NzZaUDZIOEVUOXRaMGZncmJ1WlMwYndFMVoxNDFoYXorSDhGaTlnZlFHRERi?=
 =?utf-8?B?bDEzZkNGRmo3ZUNsL0NCTTF1MXdaOTdnNklDd0JRUFdZTDNlckd5VVp1ZEtV?=
 =?utf-8?B?dHBpaHBkQkFRNS9yZlptNHFMSThGd3AycVdWZ2JkUHhucEJmMmNyMExodG5q?=
 =?utf-8?B?VldZb2NDdlpibGczU3diOUhCR3I4VHZWUGk0UjFjY2lDL1czcUdRdGhLc1pv?=
 =?utf-8?B?SFpEYVhNOTFheUh0SnZzdjd1V3YwM2dsQy9LZzVHMVU5RWx2Tk94ajVRVmZU?=
 =?utf-8?B?bmFCaEo0TUhLcmdSc1VKa3lGUkcyRjJ1N0NwUXhNTnROK2RrSkZBNHFQekxl?=
 =?utf-8?B?ZHRoN1E1VnZrdWZBTnl2WVMzNFc0bFVER0xLS0xtWWkwNmN5aTBKeTVFRTY4?=
 =?utf-8?B?QWhvUjVEbXZ1NThkamJTaFdpemwxK0lkMU1INnZxME00K3Fxa1BpeHUra3NX?=
 =?utf-8?B?U09NWmMwa08ydVkwdVM5V2Zud1FqVVhwaUFPVkhURUxaWit0RFQraGdNRjFi?=
 =?utf-8?B?eXVWaWdzRXdQb1FlYXdpa1lKelhRQk9NaGxlakZTTFNqTmJDWEtwVWlVQ1Ja?=
 =?utf-8?B?Q0JMVGdCYWMyN1dkdGFUTVNUSjZPL1lqVUNtaDU5TXBvK0hDNUM0L3V5clV4?=
 =?utf-8?B?ZmlHVHRXZnJkeVpGQm5KTDk3U0YwRVNoaGVGWXUrYVRLLzd1bG85Z3ZsMzl5?=
 =?utf-8?B?YWFBSWF5emJpV0R4TEc5VjUzMGVUVVpkWW5rYkhwbkV1TzFiQWFLMTlZSzJz?=
 =?utf-8?B?ZjRqbVhYMENJRlUzdWQxQ1NiZG0rNmVYL1U1TVBVZ2pRc1oxSXppUDNMS2Fs?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c98a9f-e463-45d9-af52-08dd76331506
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 00:19:52.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f6RGaXPqBcpCHwB1IjFfbhbdtiajiGcTDNsT0c2f+ANXOq5oVpUqDlRq7g7IZV0UFUql+ror54icgVxdpDpLfpPhImgC09Zh3xXMsbv7/pk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4742
X-Proofpoint-GUID: KiuV0jMIeDrUKo4fx6MZM81xKwcI8api
X-Authority-Analysis: v=2.4 cv=YJefyQGx c=1 sm=1 tr=0 ts=67f46bad cx=c_pps a=+hq7TYb7Jqj0EztKBnUMzg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=NEAV23lmAAAA:8 a=CjxXgO3LAAAA:8 a=t7CeM3EgAAAA:8 a=irw2G16eAAAA:8 a=pGLkceISAAAA:8 a=zF8OtAtjQrIYS3SDxbUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=VlzzDNXSX2W-1kkgHGQA:9 a=2of4nO-NaFsluVjO:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=RvFFu2bzxk4ABdbp7JBg:22
X-Proofpoint-ORIG-GUID: juhNwVDG_7Zx6EYtllAe2V5VEHsxHy8i
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_07,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504080000
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Apr 2025 01:10:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214499

--------------Ps60NnFQjUP3OCFGeCZRhZl4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53802clu030626

On 2025-04-07 1:04 p.m., Khem Raj wrote:
> On Mon, Apr 7, 2025 at 9:45=E2=80=AFAM Christos Gavros<gavrosc@yahoo.co=
m> wrote:
>> In 'finish'script the Switch_root command with option -c is busybox sp=
ecific.
>> When package-core-base-utils is selected the boot is breaking with mes=
sage
>> "Switch_root: invalid option =E2=80=94 =E2=80=98c=E2=80=99.It was repr=
oduced using qemu.
>> Remove -c option to make it compatible with both providers.
>> It is tested using qemu with busybox and package-core-base-utils. In b=
oth cases
>> qemu boots successfully and filesystem is accessible.
>> Fixes [YOCTO #15716]
>>
> Looks good

Probably, and it's a small change, but :

1.=C2=A0 Usually the busybox version has fewer features but
here util-linux doesn't have the option, which is a bit odd.

I also checked the git repo/master branch and it hasn't been added.
Note that toybox, a BSD-Zero licensed, re-implementation of busybox=20
*does* have the -c option.

I wonder if anyone has asked util-linux if they'd like that feature for=20
embedded boards...

No sign of that as PR or issue:

https://github.com/util-linux/util-linux/pulls?q=3Dis%3Apr++switch_root
https://github.com/util-linux/util-linux/issues?q=3Dis%3Aissue%20switch_r=
oot

and

2. More importantly, embedded folks are often emotionally attached to=20
there serial lines/ console
for doing BSP development and low-level debug work.

CCing Kexin who will hopefully comment on whether=C2=A0 he and the WR tea=
m=20
would care if we drop the console specification.


If not, then I have no objection since one can easily enable the -c optio=
n
when debugging and then ship without it.


../Randy


>
>> CC: Yoann Congal<yoann.congal@smile.fr>
>> CC: Randy MacLeod<randy.macleod@windriver.com>
>> CC: jbk<jbk@mm-software.com>
>> CC: Raj Khem<raj.khem@gmail.com>
>> CC: Adrian Freihofer<adrian.freihofer@gmail.com>
>> Signed-off-by: Christos Gavros<gavrosc@yahoo.com>
>> ---
>> v1->v2
>> * the commit message is extended with more info
>> ---
>>   meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finis=
h b/meta/recipes-core/initrdscripts/initramfs-framework/finish
>> index ac0de9f996..716c2f44af 100755
>> --- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
>> +++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
>> @@ -41,7 +41,7 @@ finish_run() {
>>                  mount --move /sys $ROOTFS_DIR/sys
>>
>>                  cd $ROOTFS_DIR
>> -               exec switch_root -c /dev/console $ROOTFS_DIR ${bootpar=
am_init:-/sbin/init}
>> +               exec switch_root $ROOTFS_DIR ${bootparam_init:-/sbin/i=
nit}
>>          else
>>                  debug "No rootfs has been set"
>>          fi
>> --
>> 2.34.1
>>

--=20
# Randy MacLeod
# Wind River Linux

--------------Ps60NnFQjUP3OCFGeCZRhZl4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 53802clu030626

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 2025-04-07 1:04 p.m., Khem Raj
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqHSmryz3LSpsJiL1AMGdaoSG=
ZK0vWgYfw3xymBAiEz0w@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">On Mon, Apr 7, 2025 at 9:45=E2=
=80=AFAM Christos Gavros <a class=3D"moz-txt-link-rfc2396E" href=3D"mailt=
o:gavrosc@yahoo.com">&lt;gavrosc@yahoo.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">In 'finish'script the Swit=
ch_root command with option -c is busybox specific.
When package-core-base-utils is selected the boot is breaking with messag=
e
&quot;Switch_root: invalid option =E2=80=94 =E2=80=98c=E2=80=99.It was re=
produced using qemu.
Remove -c option to make it compatible with both providers.
It is tested using qemu with busybox and package-core-base-utils. In both=
 cases
qemu boots successfully and filesystem is accessible.
Fixes [YOCTO #15716]

</pre>
      </blockquote>
      <pre wrap=3D"" class=3D"moz-quote-pre">
Looks good</pre>
    </blockquote>
    <p>Probably, and it's a small change, but :</p>
    <p>1.&nbsp; Usually the busybox version has fewer features but <br>
      here util-linux doesn't have the option, which is a bit odd.</p>
    <p>I also checked the git repo/master branch and it hasn't been
      added.<br>
      Note that toybox, a BSD-Zero licensed, re-implementation of
      busybox *does* have the -c option.</p>
    <p>I wonder if anyone has asked util-linux if they'd like that
      feature for embedded boards...<br>
    </p>
    <p>No sign of that as PR or issue:<br>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/util-linux/=
util-linux/pulls?q=3Dis%3Apr++switch_root">https://github.com/util-linux/=
util-linux/pulls?q=3Dis%3Apr++switch_root</a><br>
<a class=3D"moz-txt-link-freetext" href=3D"https://github.com/util-linux/=
util-linux/issues?q=3Dis%3Aissue%20switch_root">https://github.com/util-l=
inux/util-linux/issues?q=3Dis%3Aissue%20switch_root</a><br>
    </p>
    <p>and <br>
      <br>
      2. More importantly, embedded folks are often emotionally attached
      to there serial lines/ console<br>
      for doing BSP development and low-level debug work. <br>
      <br>
      CCing Kexin who will hopefully comment on whether&nbsp; he and the =
WR
      team would care if we drop the console specification.</p>
    <p><br>
    </p>
    <p>If not, then I have no objection since one can easily enable the
      -c option <br>
      when debugging and then ship without it.</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1sqHSmryz3LSpsJiL1AMGdaoSG=
ZK0vWgYfw3xymBAiEz0w@mail.gmail.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">

</pre>
      <blockquote type=3D"cite">
        <pre wrap=3D"" class=3D"moz-quote-pre">CC: Yoann Congal <a class=3D=
"moz-txt-link-rfc2396E" href=3D"mailto:yoann.congal@smile.fr">&lt;yoann.c=
ongal@smile.fr&gt;</a>
CC: Randy MacLeod <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:randy=
.macleod@windriver.com">&lt;randy.macleod@windriver.com&gt;</a>
CC: jbk <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:jbk@mm-software=
.com">&lt;jbk@mm-software.com&gt;</a>
CC: Raj Khem <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@g=
mail.com">&lt;raj.khem@gmail.com&gt;</a>
CC: Adrian Freihofer <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:ad=
rian.freihofer@gmail.com">&lt;adrian.freihofer@gmail.com&gt;</a>
Signed-off-by: Christos Gavros <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:gavrosc@yahoo.com">&lt;gavrosc@yahoo.com&gt;</a>
---
v1-&gt;v2
* the commit message is extended with more info
---
 meta/recipes-core/initrdscripts/initramfs-framework/finish | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/finish b=
/meta/recipes-core/initrdscripts/initramfs-framework/finish
index ac0de9f996..716c2f44af 100755
--- a/meta/recipes-core/initrdscripts/initramfs-framework/finish
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/finish
@@ -41,7 +41,7 @@ finish_run() {
                mount --move /sys $ROOTFS_DIR/sys

                cd $ROOTFS_DIR
-               exec switch_root -c /dev/console $ROOTFS_DIR ${bootparam_=
init:-/sbin/init}
+               exec switch_root $ROOTFS_DIR ${bootparam_init:-/sbin/init=
}
        else
                debug &quot;No rootfs has been set&quot;
        fi
--
2.34.1

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Ps60NnFQjUP3OCFGeCZRhZl4--

