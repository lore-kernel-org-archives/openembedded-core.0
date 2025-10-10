Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF675CAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 07:37:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3631.1760081843622935766
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 00:37:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=i426zdI4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=237871debd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59A5Nop11989416
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 07:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=RRIotgcO3+F04eTSwHesg95cGjb7s0GqqpFh71x1j5A=; b=
	i426zdI4RHJp0v27JuhlDnQUsy3n8GxSt8FEFeBReFr15rQHUMFNtH5vAVr44A7+
	32QgzFA0tQzQ7w9dAQtKl7FxFUAVeoRsq12exO/g78lCdlMPzolQ+NbObl6a3Bu5
	nNuCU/U2vrGdxooEoXPu2u2vTX5+Azy3SUj9c/OD6g7n2TLIw0HacMxrewh6aKZD
	bZPFAKKFIVzCdB5fPnuajwdLJ7FiHZVXHom/qHY0O+JlCqbTr9XX3IizwZiztJqA
	jZxwCFgDYWg0hITqZ1RYVLAz5iU+54O7m3l+sEMqsgs26rRxop+lIvjlhRGUn0fv
	58RaY0L6CkdRxquv0dRRDg==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012047.outbound.protection.outlook.com [40.93.195.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx37stah-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Oct 2025 07:37:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FflW5Cz6ykIDd4uo1SYVmTsLHW+xG3rc3xScIeq9Ldl+Gp/brZkLeI9Vam7Cf59kSH/2E2EefqxzZD1ldeDYwgDRfbNvBX2SgsxQovbGLJwWADfh0WnuIugweY0+foXeaZZ/AtSGr3GWAuiZeuQ0R5TO9qtARSICi8i7Is0fPyjclZnYf3wsjHVj5bAZO9dUauRV65Z1uwt9lWEuuJR+eZklZl5FdsR/3d1NEos+aDjj5qiPRhx3boVQ2gbof57Nm5RZ+SGdIXi+1PXs70JpvCjE3ECjTLvxgTtLgkUoiWddqofuz+v6Nq2aCbAO5+x10VpP/woa7vs5+M7YHs+PYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RRIotgcO3+F04eTSwHesg95cGjb7s0GqqpFh71x1j5A=;
 b=fsldVy87kIan8gIvbcqLp6MXAokouYDZjsBQ6LRIk32Sl/KELJ6jmV8yfsJGumvw9vH+oy682/r5Coy0aZjaXiILslj04jcxOOBNNztIIOdMuyf9kXQmJsMx7AWCCoDFFPCng8mE72spt82OUmR72QGieUKLXOIv2WA9FMu2VXSYm6wxYsryomMwTD7navtbVBJrgxSX4FWreQfhKD00Wq3Q2f7c1Nvhm6QU83EXi16IA8OUuHD/BTNr7qJ/B9Tct4qIyRCu0tW63apNCWsRkfwg461hkxidZGe42ZKtaNN4WWv4OXPqdD0/ejGx62BKpmqjJPQ3+2/a27PXXuH5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by SA2PR11MB5196.namprd11.prod.outlook.com (2603:10b6:806:119::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 07:37:19 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 07:37:19 +0000
Message-ID: <769acf67-84b8-40b2-be33-3ea1f7e78018@windriver.com>
Date: Fri, 10 Oct 2025 15:37:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/8] distro/include: Add debug_build.inc when
 DEBUG_BUILD is enabled
To: peter.kjellerstedt@axis.com, Khem Raj <raj.khem@gmail.com>,
        "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
        "randy.macleod@windriver.com" <randy.macleod@windriver.com>
References: <20250916040927.103722-1-hongxu.jia@windriver.com>
 <20250916040927.103722-2-hongxu.jia@windriver.com>
 <CAMKF1srfMTwtqXnsq0LbKh2hMVgSB_5VJW8Hu7gmv2wGsBaACg@mail.gmail.com>
 <DB5PR02MB102139CA56F78EEEE993FC81FEF1BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <DB5PR02MB102139CA56F78EEEE993FC81FEF1BA@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|SA2PR11MB5196:EE_
X-MS-Office365-Filtering-Correlation-Id: 563513a5-621f-4f81-2774-08de07cfd7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|4022899009|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmxmMGUwQ0NHQ1JOTHJmUXhzQzd1U0dmbmFiU2RzM2QrM2ZIQm9PcmRDd2dh?=
 =?utf-8?B?MThPT285V0tEd2pGbDRNWmIxa25EZmwxbGIzckdRVXRNYzZKaTdONSthdnMx?=
 =?utf-8?B?Vlc0TDd3aEdJMXJqSVJiTXZxL28zVDlkUjZXWHdkVUxnQkhwenhSelJaM2Rp?=
 =?utf-8?B?ckJYcTZOeThkUm1QOUdwb2d4WDZ2a28xR1hJditSZVFjNUMrODdXYXg4dkRY?=
 =?utf-8?B?STlxcUg4YWRPWXFzM251SXNCL3RjMXdGRFpmMFdFbnAyZ3BUTnlPblVlTkRx?=
 =?utf-8?B?T0cvQ0g5Z3RkUHFvQ3FVQmVnM0J6VjJwQzdXSmhPV3JUMGRVcG4rdUQxTi9N?=
 =?utf-8?B?clNxTVNkVEJpMnIrdVoxWEEwcE13OEV1UkEwY1RNYis5eW1VWDVkbjdOdHd5?=
 =?utf-8?B?dlhrc0NaOVZ6dDRMMzdvRXZPK3M0MU9mbC9Ta3dncVdXY1h0ZmRzaVNXRkdv?=
 =?utf-8?B?aDNFYjg4em5YMndNVzBtRG10M21GanUyVXU2enJLK2VqaTZIQWl5Vmg3a0lV?=
 =?utf-8?B?ajBGZStYaGdDbklpQmpVazZvQndCZzdFR2hqY0FOTGdPeHlydk0rVnpJSk5i?=
 =?utf-8?B?ZHlrYmRKVVlydzdpN2x0SUx5andkc3A2cENmcjVqRkJUZXZXbHBjNW91alYx?=
 =?utf-8?B?MXdlOFg1VXVyMnUzd0FpUWRSZ1VJS0lJd2drU1F3VE5kYWUvdmNRMjl4cXRY?=
 =?utf-8?B?NXRkbXgwNlh6V3JmVEp3bm05djFRMS9wS044bU94U1dLajJLb2NWQ1Iyait3?=
 =?utf-8?B?S0tpbWh2bVN2RmtoeEF3U3dEMjRGVFhVNXJUNTFOay92Y0J6UlNaNHgxZjBl?=
 =?utf-8?B?STk1VnlpREdYaW5jK05HRnVkM2xRcnFqQ04yUS8zd0JTOUs1TnUwcXVhTFAy?=
 =?utf-8?B?WE9aQjM2SHZHclJTMmdNbHVzQ0NGbFdDNDJJbXV0SzVsY2ZWN094VUs0SHZt?=
 =?utf-8?B?ZDIyOS9qU0pqeFlkWmJoWGVoTG9Pbjdqank0OHdGc2taMWpNNjZKVVJiYnBC?=
 =?utf-8?B?T3JYdFR0WWFTcUtJdzZlRmNUTGFhV3FvRitjRUhtYXVUSkhlZTg0UUs4clhy?=
 =?utf-8?B?bjhob29rc1pHL1A0OEF4djFmMnNXdThNdXo1UHJuN2taajYycDdYTXhGTVhJ?=
 =?utf-8?B?L1MxdEJ5V2VIRForRGpDY1ZpTVBZa2lYT1liNjNsaFlHOURNMzBrVDErb0o1?=
 =?utf-8?B?dFFiSGFMeFhjTlZCbmJtQlFoNmV3QnF6NUxJZHJueWRCYmVsY204dSsvcFE1?=
 =?utf-8?B?RzAvaUcxYzh0UERzTURwb1pHMDhZbEVpeDhYdDJWVVdXVk80N1FobGhQMExE?=
 =?utf-8?B?cnVEbWRDT2JKRVAvZkVUbHFqMnptNXdReWV6NVBWOVlmaEdhYWRoYUpUK0Rw?=
 =?utf-8?B?MFRxdUVITlFLcGpOenRNSEZpeERKdHdhdzdFOUI5d3ZHZ21IOXdaaHNKT3Bk?=
 =?utf-8?B?VzNZaXdLZWo1MmIzOW1rT0I3aDEwQ1Z5NzVyT1RRZzB1NWUzeHNYSWlOSnFt?=
 =?utf-8?B?TzB3TjZlTGJDNnZmU0VIcVRqTkRtbFRubWN3K1d4TnNVSVFMcHBBZklRSHY4?=
 =?utf-8?B?c2hoL2tMUHJCbDV6YUhjNlRXRlduamJ0SzU1djRYTzgxWDRWTVQ0SGVjalJD?=
 =?utf-8?B?Wk8vNEhENThzM1ErbForbkxpOGs1Vy9XSUh3ZkpTK0dRd09XSGNLT2VSaFpw?=
 =?utf-8?B?aGhaRFgvV3lMRE5kbnJuVSt3dlErY1VuMkg5VlQwa3VjR2ZDNnZaZU5yT2o4?=
 =?utf-8?B?THQ1b2hOajZucXA1ZlJpSGthYlB5SnZSeUdnc0RaUHJWNDE3RWJOTXlTeXpC?=
 =?utf-8?B?VFREUHdpNy9MZlpsdGF3UHhXU1dnRlhaV3RodExiTGlqQ1hwMmZLeGMwaTVw?=
 =?utf-8?B?R0ZFdFJhbjNMWVdpUXJNMHpiTEtFUWpVUEtTaGxJZEIvYUE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4022899009)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VzBWYUd2UGVnSUZPWW1uWFBIQ01Qa0dMREw4Rm5hMWNCWVl1enlDaWR2L054?=
 =?utf-8?B?dmx4MVBTaVpLc00wMFBjRzlFak5ENHcyeFR1aDAvWU9WMklaYmlTUlRRZUZP?=
 =?utf-8?B?bFhNc0dIRW1kKzFzR01HZGdRTmxCR0dVditYdUtuSDRqUW5VcTA5V0dhUzI2?=
 =?utf-8?B?aTNDMlI5YzVqM25samtQaUlscTBHTmpJZU5UR0E4Y3N1cFZwVnBvZjg2RXpJ?=
 =?utf-8?B?NHIwQ29IWjU4Z2x3bXlpV3hEWmxQK3lyOGJ2MTU4ZitjZlVvUmRoSm1mdGJm?=
 =?utf-8?B?eDlieWEyWDZpRmZZQkdiSklMakx3Qk5kRVI2UmZLenlzVjNkd2I4MnJqaE80?=
 =?utf-8?B?WVo2a0x5RW9FR2NnWWZpbGlza3VOU2Z0UEc3Si9xVzk4SEtBRzJCbXF4aFRi?=
 =?utf-8?B?cFFyWnVHYmNZM3BWZjhJbEVHMjlpbzNSN0k4TVdZTzdXVTJNYUpodEdUMFU2?=
 =?utf-8?B?MHRiUFhJSlNtcFJrUjN5MktINUtLbEZFU2h5MUhhVWYwN0VCcnJmYStMMFhS?=
 =?utf-8?B?M05odjZyUFdicWZWZGJvc1RaazRMSXFRd3I0amFPZkIyV1RVNEpRUmJlZDk0?=
 =?utf-8?B?dTdpMWRCSzMrRHg1YlNWRmZqV2NFbTA0OXpCRUtTTnRxUXptM0VxUHdvUUVr?=
 =?utf-8?B?cUFrZDg3ckhVUDVxUlZqZm1xcCtrYjVUSXBlUVE3dGhZSnBFa3N0eTMzYUxo?=
 =?utf-8?B?WGpXQzBkMFNrOTBsaFhxTDRNNnNVcVhQV1FzaXAzOWZGTVV5UEZWMGw5MDI0?=
 =?utf-8?B?N1AwSmRFaUtUdGxIVWFpZHE0VzFROWorWmdOY3F1TnFoSmxYK3IzSUJWT1Fo?=
 =?utf-8?B?M2FVV3VIS1k0MlUvbndvLzBncTV5T3IrYThQdnpEY281TXNlbUk0aTNqMWp4?=
 =?utf-8?B?RHVWT1JhMk0vbnEzSzlUN0NHR2c2R0E3WlZXNHVzcFdjWFFCRDJvQmFoRDJ2?=
 =?utf-8?B?MzZEVXY2b1l3eExDVEllRFNBMm1zNXg5YkE3SGg2ZXlIcmpUeGV6dlJCV2Rh?=
 =?utf-8?B?UVdoQXRuSGpHT0daN0VUb1pKb3dZWm1PWGU5cDFtaHZGN2JkM1Q1TGRlVHYw?=
 =?utf-8?B?Lzg4V3NFb2owWFc4ZEtGblJldXhKNDdZbHpxaWlqcHJ4ZXg5VWVJVjRzQWlj?=
 =?utf-8?B?ckJYSnFyelB6aXA4NEpibGxCUTdveFdSdjlLYlNQNUFpRjQ5QnFueVpPZDVz?=
 =?utf-8?B?TklpbitvN2JtbC9GWlI4bkU2OGo0L3g4TVRZMDFyM3dJUHB6dDVVcFhwSmNt?=
 =?utf-8?B?ZmpxRFB0WVc5NWN1S1dJcmY2VFpQRFVDQ1J3K1FvMUdmTUNmNHpDMHNINmlE?=
 =?utf-8?B?TDA4Uk1vOTJkRWVZcUZLdUM3MExOTHJaa1BxcGh0VXZTWkRnclZicG9PNm5o?=
 =?utf-8?B?Q2FTWkdQT0xhUVFaRW9TcjVMZkFjdXZaS0ZvYmZoTnlHY0NRdEpSdjVSSUh2?=
 =?utf-8?B?aVRwM1A4YXk0YjE3U0k4Slc5VWRBVTk1MWpiUnVManZCSExLYStMMTRFQzZO?=
 =?utf-8?B?S1FDNmZDN2RVdWx4T20xVVBxcnFjd01vR0R3TmZaRENncFpXbkZtMXhjWllx?=
 =?utf-8?B?bmsyZ0FCYk1USXFPMXBKWWhMWnRhTFJCNHdpcHVJS09rU3pEOXo0cW82ODE0?=
 =?utf-8?B?TTJFdXRrZGozcWxZY3lqMFBLQVF5c3p3Szk4bHExbDQ3N1h3RWErWXo2Zm92?=
 =?utf-8?B?bTFFT1NKbzdFWitKV214ZXo5YkpkK2FwbEM5RlVPR0RFR1RPMHE5U2hpb2dG?=
 =?utf-8?B?U1kzWGlzazRTeXhWQ1pjVjZ5VFBGY1U2NmhHbXpsZCttRUVoQXd5YXovZUQx?=
 =?utf-8?B?VnVKYmw2WmpxOHllbElnMGNyYm5xSHNpQlUxR2N1SUlZdXp1TUd6QklVS2U3?=
 =?utf-8?B?MFl4eWp6YmpXTkZ2eHFFak9NMHNNdjVDTmNHdEczOTBkcCtvcUhyRzR5Y0p6?=
 =?utf-8?B?TFRPdG02OVZ0ci9TcFR4R0pkd2VoUFpCVk13bVNYbURnR01DaStHQUZwcEQ2?=
 =?utf-8?B?RnhUNHZWalFUUXc0S3VxU1lUYUxWUUJaU0hzeVZENzlMLzNhRmMraUVoWWk0?=
 =?utf-8?B?enRldUcwWjZvdnEwU1BoREEwNEhMaUJVWGhMQTQySkhnellsNUpIRm1hUmQ0?=
 =?utf-8?B?MXJ2R1hEZVlPaC9aVURvdldlME1kNXM2UkdsYThHWUNNZ1ZrbWJqNXJoWWxR?=
 =?utf-8?B?TkE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 563513a5-621f-4f81-2774-08de07cfd7d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 07:37:19.5711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aZdVeGGvfz2GhJ0wPUJUTPIznlYwQjOH8wWz6LNRgVyCFhSd3zR90sv+TSIux9oDtN+JnkAf+b2oRByoaQemeR7MPIFXIzuayyQ9Uq74io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5196
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=68e8b7b2 cx=c_pps
 a=9cGrGZFDAlRO1ZcMJRSO2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Q4-j1AaZAAAA:8
 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=3-RhneuVAAAA:8 a=YIwp9bLCY8FXHsw1hCEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-ORIG-GUID: nwjcnBxzPB3AQImEdpN9UH0oco6tHcKM
X-Proofpoint-GUID: rHCcYocOsOx1mmo2RA-Qu8fwGh7y-iPj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEwMDA0MyBTYWx0ZWRfXzfE6fGBK2F1D
 cHxSP7CoqL1SMte+9m9tDQeChiICvlifAgBTE23o7rUDokRvBC5RJGZo4FO9Jl9iBsPgm/PDS2g
 WPFcQ9kZkihTWmjOtM8lSMI0h8L5kqZHj3TyvqpG8g14j5SbZIsa9HA+c1ieYLtvPQ4MDntdvKg
 4jG/bYy2TDq5xyy0mS10FG1N4yFfZOwGmplgTDpERJFS0+4V4A0kMf34U1uao7v/V2adNLl5IkI
 OwENbnDKcYhX0xwP80TsJHc37wTgKDBNGpCi2wYbntN9BPxKf0eBcucL3nFzdoEejeVnOp0N86o
 4zWYelbT29T7cdXHCKPQ5cdpC4G+ZcEMb7lgzDhawksdojk8AZb5TinDnTgc/mCsVlLTZFb6SKC
 MDB0oRbVTnjbZH1ph2GN8O/QVZc39A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-10_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510100043
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59A5Nop11989416
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 07:37:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224666

On 9/30/25 06:52, Peter Kjellerstedt via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
>> -----Original Message-----
>> From: Khem Raj <raj.khem@gmail.com>
>> Sent: den 29 september 2025 20:49
>> To: hongxu.jia@eng.windriver.com
>> Cc: openembedded-core@lists.openembedded.org; randy.macleod@windriver.=
com; Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>> Subject: Re: [OE-core] [PATCH v3 2/8] distro/include: Add debug_build.=
inc when DEBUG_BUILD is enabled
>>
>> On Mon, Sep 15, 2025 at 9:09=E2=80=AFPM hongxu via lists.openembedded.=
org <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>>> Add a new include file debug_build.inc to override SELECTED_OPTIMIZAT=
ION
>>> and BUILD_OPTIMIZATION when DEBUG_BUILD is enabled
>>>
>>> Add separate variables FULL_OPTLEVEL, DEBUG_OPTLEVEL and BUILD_OPTLEV=
EL
>>> for the optimization level, and override it for specific recipe other
>>> than original remove and append DEBUG_OPTIMIZATION and BUILD_OPTIMIZA=
TION
>>>
>>> Update the documentation for FULL_OPTIMIZATION and DEBUG_OPTIMIZATION
>>>
>>> Require the include file when DEBUG_BUILD is enabled
>>>
>> I was hoping that adding DEBUG_BUILD would reduce number of global
>> variables to manage
>> but it seems to introduce another one in form of DEBUG_OPTLEVEL, this
>> makes the logic a bit complicated
>> I think it will be good to explore a bit more and see if we do not
>> have to do it.
> Well, adding the *_OPTLEVEL variables simplified the recipe specific
> overrides a lot in the debug_build.inc file.
>
I will try to not introduce any new global variables for DEBUG_BUILD, by=20
overriding existed variables more precisely

I will resend the series for discussing, v4 incoming

//Hongxu

>>> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   meta/conf/bitbake.conf                   | 13 +++++++------
>>>   meta/conf/distro/include/debug_build.inc |  7 +++++++
>>>   meta/conf/documentation.conf             |  8 +++++---
>>>   3 files changed, 19 insertions(+), 9 deletions(-)
>>>   create mode 100644 meta/conf/distro/include/debug_build.inc
>>>
>>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>>> index 8e90c7bbc8..0e614c6b21 100644
>>> --- a/meta/conf/bitbake.conf
>>> +++ b/meta/conf/bitbake.conf
>>> @@ -658,13 +658,12 @@ DEBUG_PREFIX_MAP ?=3D "\
>>>   "
>>>   DEBUG_LEVELFLAG ?=3D "-g"
>>>
>>> -FULL_OPTIMIZATION =3D "-O2 ${DEBUG_LEVELFLAG}"
>>> -DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"
>>> -SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD=
', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>>> -SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZ=
ATION DEBUG_BUILD"
>>> +FULL_OPTLEVEL ?=3D "-O2"
>>> +FULL_OPTIMIZATION =3D "${FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}"
>>> +SELECTED_OPTIMIZATION =3D "${FULL_OPTIMIZATION}"
>>>   # compiler flags for native/nativesdk
>>> -BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g',=
 '-O2', d)}"
>>> -BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
>>> +BUILD_OPTLEVEL ?=3D "-O2"
>>> +BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL}"
>>>
>>>   ##################################################################
>>>   # Reproducibility
>>> @@ -831,6 +830,8 @@ include conf/licenses.conf
>>>   require conf/sanity.conf
>>>   include conf/bblock.conf
>>>
>>> +require ${@oe.utils.vartrue('DEBUG_BUILD', 'conf/distro/include/debu=
g_build.inc', '', d)}
>>> +
>>>   ##################################################################
>>>   # Weak variables (usually to retain backwards compatibility)
>>>   ##################################################################
>>> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/dis=
tro/include/debug_build.inc
>>> new file mode 100644
>>> index 0000000000..a9222a442a
>>> --- /dev/null
>>> +++ b/meta/conf/distro/include/debug_build.inc
>>> @@ -0,0 +1,7 @@
>>> +# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_B=
UILD is enabled.
>>> +DEBUG_OPTLEVEL ?=3D "-Og"
>>> +DEBUG_OPTIMIZATION =3D "${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}"
>>> +SELECTED_OPTIMIZATION =3D "${DEBUG_OPTIMIZATION}"
>>> +# compiler flags for native/nativesdk
>>> +BUILD_OPTLEVEL =3D "-Og"
>>> +BUILD_OPTIMIZATION =3D "${BUILD_OPTLEVEL} -g"
>>> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.c=
onf
>>> index 741130a392..b643724e27 100644
>>> --- a/meta/conf/documentation.conf
>>> +++ b/meta/conf/documentation.conf
>>> @@ -129,8 +129,9 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] =3D "Defines whi=
ch
>> layers to include during cve-c
>>>   D[doc] =3D "The destination directory."
>>>   DATE[doc] =3D "The date the build was started using YMD format."
>>>   DATETIME[doc] =3D "The date and time the build was started."
>>> -DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging inf=
ormation. This influences the value of the SELECTED_OPTIMIZATION variable=
."
>>> -DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS an=
d CFLAGS when compiling a system for debugging. This variable defaults to=
 '-Og ${DEBUG_LEVELFLAG}'."
>>> +DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging inf=
ormation. This influences the value of the SELECTED_OPTIMIZATION variable=
 and includes file conf/distro/include/debug_build.inc"
>>> +DEBUG_OPTLEVEL[doc] =3D "The toolchain optimization level flags for =
debugging. This variable defaults to '-Og'"
>>> +DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS an=
d CFLAGS when compiling a system for debugging. This variable defaults to=
 '${DEBUG_OPTLEVEL} ${DEBUG_LEVELFLAG}'."
>>>   DEFAULT_PREFERENCE[doc] =3D "Specifies a weak bias for recipe selec=
tion priority."
>>>   DEPENDS[doc] =3D "Lists a recipe's build-time dependencies (i.e. ot=
her recipe files)."
>>>   DEPLOY_DIR[doc] =3D "Points to the general area that the OpenEmbedd=
ed build system uses to place images, packages, SDKs and other output fil=
es that are ready to be used outside of the build system."
>>> @@ -178,7 +179,8 @@ FILESPATH[doc] =3D "The default set of directorie=
s the OpenEmbedded build system u
>>>   FILESYSTEM_PERMS_TABLES[doc] =3D "Allows you to define your own fil=
e permissions settings table as part of your configuration for the packag=
ing process."
>>>   FONT_EXTRA_RDEPENDS[doc] =3D "When a recipe inherits the fontcache =
class, this variable specifies runtime dependencies for font packages. Th=
is variable defaults to 'fontconfig-utils'."
>>>   FONT_PACKAGES[doc] =3D "When a recipe inherits the fontcache class,=
 this variable identifies packages containing font files that need to be =
cached by Fontconfig."
>>> -FULL_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and=
 CFLAGS when compiling an optimized system. This variable defaults to '-O=
2 ${DEBUG_LEVELFLAG}'."
>>> +FULL_OPTLEVEL[doc] =3D "The toolchain optimization level flags. This=
 variable defaults to '-O2'"
>>> +FULL_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS and=
 CFLAGS when compiling an optimized system. This variable defaults to '${=
FULL_OPTLEVEL} ${DEBUG_LEVELFLAG}'."
>>>
>>>   #G
>>>
>>> --
>>> 2.34.1
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224170): https://lists.openembedded.org/g/openembed=
ded-core/message/224170
> Mute This Topic: https://lists.openembedded.org/mt/115268057/3617049
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
hongxu.jia@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


