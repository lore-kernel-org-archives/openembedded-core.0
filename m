Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C4B8EB596A
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 06:11:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12947.1770790294355969787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 22:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=qRNijC6t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6502e0d1f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B5B1T01832819
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 06:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=A3B2/fVcQUikdVD1ObOkeGnoDSnjjpOnI+EzYU0eilU=; b=
	qRNijC6tfJ0kxj8fuX8Qz8ng/vhzxMmFqpegJi6OO0y45fzpl/SDluj8fn7cGZ4M
	VcNPX+sYevS/BJB+65an9t+Lw0Q6rWYqjvADJPcvs1qcrKSlGCy1Ng+tjNhJ4G+a
	kk8rkDmP9CpuNupHCOdut0jm7sSh/x/nzI6f034WFAZZELPnVCk5SrltrvQyXyhL
	pJ5kHxNMUcplNh1mpAhgau3yFK0w5eWEV/f5SHsw+rkWg/EmMUO52G8CLTapwA0K
	HQVI9yhfxVNrIWXSvZYDmailgctjl7rZ7WeadW9MKb/SLNxcMrHkxuReXmvkUaAA
	exjZPJbTnTjx8Lwse3Ee/A==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c5vc5c9r0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 06:11:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H48rXPBqHLMPbni6PEcGko1kar8HEtwl0QXOL/nnnw38c1qrmyL78jlT+GpCiMkwln7BkV9bnKNGlIxffdAHoBBVtciSquFGSSzao/7YG6krYfY6Dunm4WKaGOqcSKImaPE8qiTSUt69t14rb3ZZap6DXGZAl6tyUBx7kirXfnY2SF1jRDuDUkmBoOBTkfvhby1t8cl17ZmXy3YZ+NB+gbkjCjG0ATsmtpDSBv88qVIvInwzV7qR3w75zty/J5DqSDxM2sAoAXz/RhoqmpOmYaPeJSi9rH1zVPFELxoFmqQJfL+X4VmYZi/e4+/GkrGdgMxeKr4fVErMVy6lKhOVyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A3B2/fVcQUikdVD1ObOkeGnoDSnjjpOnI+EzYU0eilU=;
 b=yMs7pfPhzPPn5icVV2f/8e+h0yf6xRyfOTF8at8FigSNLtKwXQO+lQbWavdYs9RHiwPfZZ6b3TGYmsX8k8MH6dQs6MekIAdcpkgRgp2YYFYcTCNroRgslKIoNq7uGk+YdsUYfL0InaZGfmhsEWXn2OvE1z7hVQ1ciXn7GoCYLjqWZ2YVshCrJ9FLbAYxmRsFI3iMhM7fG2UXS039w7AJWAUC+KGXVIzLFgCHHZpt/kaQy3UK7TZDj3XErGyh3MvD1B91+dSghBj2oh/iTg36yEYmCw1GdSDidh4at6tOdW4GSc5+iZfTBdQYdyzOJ0QaV8LKerCUqF7f/b7cy+t2lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA1PR11MB8174.namprd11.prod.outlook.com (2603:10b6:208:450::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 06:11:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 06:11:24 +0000
Message-ID: <91e636fb-455c-47db-88dc-5fb634a4485c@windriver.com>
Date: Wed, 11 Feb 2026 14:11:18 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][RFC][PATCH] oeqa/selftest/sdk: add test_sdk_runqemu
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20260207051305.2363194-1-Qi.Chen@windriver.com>
 <CANNYZj-0=nQQOLY1h1w2SH9PFOa8K63+wELwNB9KKHuEPu6S9w@mail.gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <CANNYZj-0=nQQOLY1h1w2SH9PFOa8K63+wELwNB9KKHuEPu6S9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR06CA0182.apcprd06.prod.outlook.com (2603:1096:4:1::14)
 To CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA1PR11MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e79b75-6e4a-4d5b-f1bb-08de6934624a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFNRd1EwWTRGcDljVElaMDhyV0puYnpud3JQZWRhanBXNU5GcTZVNjZVUWV2?=
 =?utf-8?B?QzBsdktJZEtVaUQrWFlyajRiUmhEZTB6bHNaQnVERG8wdDZiVlREbWJhTzF1?=
 =?utf-8?B?SDM5UDU5dE5PV0VrMVJOT0hxTjcvalFSMitzamVMOEh4dzhYUFIrMk1UNUcr?=
 =?utf-8?B?Z25MVGtXcVdoRW5VWGlkVWRNaDJJN043L25KZGdBSVp2dmVIZnJOd3h3b2dX?=
 =?utf-8?B?eVhjNEI2UGtFVksrZkY2OWI5L2ZzbVY2N0dXemhZVDBoWkFpeG45aVYzRTNN?=
 =?utf-8?B?M2svUFNZRm1MQXo1Y21BTXJyQ1pBb1BGaFRCTXVQOE1PcmpzaHVSL1gzUS9R?=
 =?utf-8?B?WXViVnd0TXY0cjQwbVdxYkJUVnp0SjlFSXJMYiswVUtwVS8vdjNXSDdjbndS?=
 =?utf-8?B?MXNYRU11WGQ4V3p3QTVZeW11UHk3b2VZK25TS2pRcndyOVBidmdVN2tEQXBw?=
 =?utf-8?B?RG1XWjdiUUplcVc3bGFxcWEycmlvLytyemRiclo2WWpZUE9BK2k1dHQybG9V?=
 =?utf-8?B?WE1tK1JVRFFBM3I1d2hhM080NWtyMjFjcDJZSTBiNDRFSFUxM0lYT1NLR2Zo?=
 =?utf-8?B?VnFvRGY3ZnNSNmxrUC9Kc2RVTlludXFxR0lzbnZRWWpSM2h4NjQ5OS90Z0h5?=
 =?utf-8?B?dlBScmtLbVJLYVY3ZnRSd1J0eUpDRFhMVW0xZ1o5Q0FESndoVG52cmphektt?=
 =?utf-8?B?QkdDT0M2c0k2YWxLWWNZd2dVTTkxVGltcjF0ZDVZcFpBQzNBcnJUc3V4THpY?=
 =?utf-8?B?NFQwcDJFUmwxaW0vdEgyQ0I0Zjk0SThaYTdtTWNNUWhMWXhyWkE5NE1TS1ZK?=
 =?utf-8?B?OTVmWGZ0LytuWHVoKzJ0clo2Z1ZZaW5wdTNLNm9hL3doRmxuS2FNTVJpL1hT?=
 =?utf-8?B?MDdMNDdrcDVzbEdkdGlkWHZpQjVBQW5tSG5vcSsrWXE1WDM4K0FKUEhZaFFQ?=
 =?utf-8?B?ei9BUnljTURSU0ZSeFFrREJDZ1hYK2R3alBGRUF5NGpkamhRRXVmbGsrU2VS?=
 =?utf-8?B?bjFaUUdqVE9tcnpQMHZUOVhzeEVWbVJTaVdmak1mM01rY09DdElwTE9waVN6?=
 =?utf-8?B?RUpnVlF6NXNuSjB4TDZoSjNDbmpSSUsrd05QdHpIYU5saGsvdHNtdGhiOFJW?=
 =?utf-8?B?NGh5b0p2YUVaUGFNSVJUcUV5aVlzTnUwSVBSb0gwSU9KSzh1UmlZcXB5UFVk?=
 =?utf-8?B?U3IzaHJzMXlxWXBEbWwrMnIyNXFnU3VmaTROTFU2bjYwQTQreXN3TTRRZXh6?=
 =?utf-8?B?K2g4K1FnUjNZUkZEcWpPdzhZaE9pTm5HSmt6U3AvRDIxa1pYa0ZyVTNxOXJL?=
 =?utf-8?B?WDNuS2FRYjJIZEhBNnNUa3dxVG5Fb0tBdDQzOTVhN01saGh0Y2R4N0xGVXdX?=
 =?utf-8?B?UmJCRFJnSXNuckRLc04vUTg4ZUF4VmRjTlFWK1Q0SXh6Tkw4RFNZMU9UM2hj?=
 =?utf-8?B?cnkyYXBlYm4razkxdGZsQlhTS1JoKzBiUU5VVktLVWljazVObGQ2QzRmcDJJ?=
 =?utf-8?B?clE0TGkrTkJkMnY0cFZ1TllOR2xFd0dleFR5dUd3eUZTemh0V1lEMmkxd2ph?=
 =?utf-8?B?MEJnS3BaNVpvandCVFgweWw1Z01PeTY2dmw3c1lXZWVZR3ZDSWtxaXRSUC9H?=
 =?utf-8?B?MTMxREJSMkswc2Z4UE9WRmMybExXZHB5NmNDeFhNTG5hUUo4Q1BOSlhCUGNo?=
 =?utf-8?B?UFF6bG1sUGtvdHRLWU5YNDVBbU9NQ0JBWWpCMTlLb2tmVC9HOUJTY1VIRWFs?=
 =?utf-8?B?SWEwN1d5bTB3eWdiZGtyTFJyTmQvRlB5U0FtNjk5WDh2SDF5cmFsK3BucnNo?=
 =?utf-8?B?eDIxeEtFWHNROWIwaDF0azJVNldCblhpS1VLZzNYdm1zUkt1bW1GK1JUM25n?=
 =?utf-8?B?RlZKc2c2YjhpUWpGem9tSUlHYWowN0FIUUl6N0VhSjNZOThybmJyT1hybCt2?=
 =?utf-8?B?MlNyeHR6RWR2Tm5rRzQzcnA0a0NXYXQwdmFXR1FSMzZKbndicEZ1U1cyVDEv?=
 =?utf-8?B?MVgyYWFGNUdHRnlBaDNTblV0enRRL01QeUlERVFqYVFMSzV0dEtIV3ZQdHV5?=
 =?utf-8?B?YmYzQi8va2M5Mm1IcThDOFV6YWM3WGFuY3ZvRzlTVEd2RVFMUXdQdmx6UFFy?=
 =?utf-8?Q?91pQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WFpNa2FDaXFBcit6NmJadnNmMXdPMDlFMGgvR0dSUTNDMVRxZVJ6V0wrUEpx?=
 =?utf-8?B?cVV6MDNKOWdERElSSHVLSEFoR1BBRVByMkcvYlpiK0gySkFTSGlhaXYxVFhh?=
 =?utf-8?B?Nzd3ZitRZktxbnRiRjlzVEVOWlhWRUNXRVBKN0NSYTRFNzdHSER4c1l2OFV1?=
 =?utf-8?B?MW5Iekx0TkY5QWNqV3hYQ3lHbldWYnFSQTJ6ZUw1a1BvS21CcmpXc3hPVWR5?=
 =?utf-8?B?VDNGZmNRaGl2anQ3TWMwaHA4U3VhdndBS05NWVh1Yk8zdTJBb0gxb3NUSEZC?=
 =?utf-8?B?T2FIWFFRNW9hREplclA3RnYranZ4SGgzQmY0cXRrcUVwMFpPZTN1cHRrMFpj?=
 =?utf-8?B?RjJmM1dDRWVTcFhLenlzSitic3BQbVMyS016ejIwQnZ2VXRTLzczcTFkNHFJ?=
 =?utf-8?B?UUhHS3I2R2xtY0dIcEhOSkxGa0w2MWR4SDZKb2FPdWJiakRWZ1EzaUIzUGNh?=
 =?utf-8?B?T3dsY01JRWpNSzR1R2tZOElsWmwycjA5MGZHY2xVSTZBMmIrT3plQ04ydUJk?=
 =?utf-8?B?ZHVKR2NPU0J2K0J0VDJwa0Y4eXRkQytkcktPWmN3a3JpZGVvTDk4UE53b1d4?=
 =?utf-8?B?SDVZU1NPeGdvU0lvbm02UERMOVpqa1lSODdlSkZoVWlkQW1TTUN1YjFsMTJV?=
 =?utf-8?B?dmVzcTNkR3BEWjBQOFdpSW1SektKbmxrYVkvNjNWRThaTGxJZjZ3YnFUR0I1?=
 =?utf-8?B?NkJjdGN1RW56aTRyK08wRjhreG9UT2JhUDJsQnROZi85SXdOcnM2M2lCMURG?=
 =?utf-8?B?K21uVmpyMVE2eDd4TEJTWm9VQWpXN0tWTGhyNmFIeEk2aHpGcmViOVJZdzJT?=
 =?utf-8?B?a2VuWk80dnFURGNBVWNkL1FCeGpGNlF6ZDBQc0ZmcTFzZThLS1o4bFZPa2JI?=
 =?utf-8?B?OXlNMmlRYTRQRmVMMGRNWGpjV2ZPeEFodGU2QXRpU3ZZRUlaTHRPcnIxMGpx?=
 =?utf-8?B?MklLcmU4V1cxZ2VCLytCeXZNSHE3bHVsK05vOWhTWVIwR3JYYU4yTjBmM0FU?=
 =?utf-8?B?NUNRNkxLNDBWUUVQd3hTbE5ONHIyK0tmTXA3Vkxmc1UxT1J2OGZzZ0k5cGh1?=
 =?utf-8?B?bUhoUDJSNW10NjRpTmxvMDdMVHozV1QvRXhvelpnUUpQb0twanBiK2tRL1pH?=
 =?utf-8?B?b0dHQ3VHSXUvYjQwWlhwU2YyZVJHM3duNXlvK055cDBKRVFiOGxvclRMQkRK?=
 =?utf-8?B?WTY3T0VTRnpqdnUxbWsydXYrM2FoTmxOZ1d3SFk3YjArOEVsbndIL1ppNk4w?=
 =?utf-8?B?NVdBRjhIMHNrOEEycFJTMVBlWkU2eWdwN0lIbmgxZG9oOGxZTzBUMkg5UXJM?=
 =?utf-8?B?VStTV0hCYUhFMUNKMm1yOGxhK0Yyb3g3VWFHRnBkQTFNY2ZueEllM1NSVnNB?=
 =?utf-8?B?SG5RalA4aFhQakM3dVArTjFGc250L1UvaWNhTUZScW9tZHY5TUNVbmtKVnJU?=
 =?utf-8?B?ZVlDSzdnSEZnelBRRlcydlZlWHFSdEhqQmxNYnRFeTZVcDZFN0F6R1pkM2pB?=
 =?utf-8?B?c2xFOGtPcjlhZFJYaGI5djhpNTZTOTcwVGJ2RjUybG5zclhtRXJRcHhCL1p2?=
 =?utf-8?B?aVVEYWs0UmRuU1F5RFVPOGx6bGl1YkJ5Ri9WN2Z6bDU1akVjWklFUERtdlRy?=
 =?utf-8?B?MFcxS1I5aXRLTlplb2xmODZ0U0dLTmo1TWVsbGYzQmF0aHh1ZStvYXZhdGVy?=
 =?utf-8?B?Y3FhYTJLNURHNjVrODZPSWMzOEQwYTBJcnVhbVFZRU8rUDBpcTM3WS8zb2JF?=
 =?utf-8?B?SHNVT1lPc2lYSGdQVmxYOW9iQWR1R0NCb2dIWThoRlIreGY2RnpKQTlhcGpy?=
 =?utf-8?B?bTJzTk1YRDRxbUdoTS8zbWcxTE91SkFNM1AvNUZvVDBwVXA4cVZpTUoreVpV?=
 =?utf-8?B?SHpWb3M1U2ZDTzdYNTRNOWZwN3lDRmJBVEVpcXo1TEh5endReTVWVHJ3ZFA1?=
 =?utf-8?B?eE5jTzdrZkR1VlRrRDBGWWhKcHdDOW5SMERNYUtOQlFtRHdSN1MwdlBERGtV?=
 =?utf-8?B?OWlVVzgvMEF6NTBRdkMrSU82N0pvallPZ3l0TnRlbEdEM2RMYTRyQmhzY3Vl?=
 =?utf-8?B?dXdVVlZCUHFydWQvVU9GczdIZDA2Tk1vd2JkSnhVSkthc0QveXRPSXRoVnl2?=
 =?utf-8?B?YVc5Y05YMzJUL3c2Y3IzR01UaG9PZzBnQVVldElDbUZlTkdSMXdTY2hYem85?=
 =?utf-8?B?Z1I5T1piZVVFRDNMYWN2Vmc4OER1Y0FpZUcvb0dtU2V3WFpieHdiekdzUE5Q?=
 =?utf-8?B?M1l2bVE4U0ZSNzluZklzY05vNEhSVFVGR3pHaFhWMTlmd2hlSWtvWGh4NVVk?=
 =?utf-8?B?MnpQTWpEbDFUUEdXcFUxdzg4M2t1d2pVUUdiSjRnOU1IUzhyQTBVUT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e79b75-6e4a-4d5b-f1bb-08de6934624a
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 06:11:24.7983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLTHwYkQykj5qY2kre31cBPTP5UGZaJo5t5X9glTXJvDwdLQG0FlI8NXGcmCvpI4QaFqfBhFiewQGdPlKFWPkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8174
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dPyrWeZb c=1 sm=1 tr=0 ts=698c1d95 cx=c_pps
 a=3N2sgJzBBlSYHYMa9BBQhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=t7CeM3EgAAAA:8 a=BHCfN7M1KJFAjdycPdQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA0OCBTYWx0ZWRfX7M9vVgrfy668
 yjOSIuPB2XzWJpVyiPn/i83JiHS0u+PzY2nfynWp38S88tifpYmSmwSWoOZAuv8c/WfnXcjusj3
 A2gTMjiQq3IA1D91jnS0FmABm307utXOfke1V8FR/0KpyM4WCSw3VuAMecPSGioi7DTuGaK+ZDJ
 xD0ABjdOeQjBePe1ma1eess6QL/PT97gmXRfkoZNIMeIew1Q0xHQtkP2NGzqcJI3XfMH0GuUOgm
 uSvgB1Q2NnHEMATaJ51dzXfW+1lWJiRE/Vx8w3tkOwyFeo5uocyVePhhp4eKWeUechgcp8Mat9M
 EiEW9MG9n1m0jKlnsN9+GOWA2YAzgsDuu+DlceQyGG/pd2DNRQ+0MpG+5+JpxwTNDq12Lil9DWe
 kZR11SerFRZps5GhJtWzfRa/yJFSlPolWRF5G08h0uKaskMKtk/MTbj6uM8BELuMQ73leqIVHlV
 7Wq9+lB3mtzMgegKJ8g==
X-Proofpoint-GUID: goOTomVMhEOfTD0YZ7bI1ZbAd8l6yskx
X-Proofpoint-ORIG-GUID: DzFOZyZ1jcKqPjEGE6G5OWSaU4607Jur
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110048
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61B5B1T01832819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 06:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230963

Hi Alex,

I guess you were still in a bitbake build environment when testing=20
runqemu in SDK manually.
That's why your command 'runqemu kvm slirp snapshot=20
/path/to/images/qemux86-64' worked.

See commands and output below (Pure SDK, no bitbake environment):
"""
chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ runqemu kvm snapshot=20
slirp /buildarea3/chenqi/SDK/Yocto/qemux86-64/
runqemu - ERROR - In order for this script to dynamically infer paths
 =C2=A0kernels or filesystem images, you either need bitbake in your PATH
 =C2=A0or to source oe-init-build-env before running this script.

 =C2=A0Dynamic path inference can be avoided by passing a *.qemuboot.conf=
 to
 =C2=A0runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`

 =C2=A0Bitbake is needed to run 'MACHINE=3Dqemux86-64 bitbake -e=C2=A0 No=
ne', but it=20
is not found in PATH. Please source the bitbake build environment.
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 16354810.08

chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ runqemu kvm snapshot=20
slirp=20
/buildarea3/chenqi/SDK/Yocto/qemux86-64/core-image-minimal-qemux86-64.roo=
tfs.qemuboot.conf=20

runqemu - ERROR - In order for this script to dynamically infer paths
 =C2=A0kernels or filesystem images, you either need bitbake in your PATH
 =C2=A0or to source oe-init-build-env before running this script.

 =C2=A0Dynamic path inference can be avoided by passing a *.qemuboot.conf=
 to
 =C2=A0runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`

 =C2=A0Bitbake is needed to run 'MACHINE=3Dqemux86-64 bitbake -e=C2=A0 No=
ne', but it=20
is not found in PATH. Please source the bitbake build environment.
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 16354858.44

chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ which bitbake
chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ echo $?
1
chenqi@HOST:/buildarea3/chenqi/SDK/Yocto [3][0] $ which runqemu
/buildarea3/chenqi/SDK/Yocto/sysroots/x86_64-pokysdk-linux/usr/bin/runqem=
u
"""

Regards,
Qi

On 2/10/26 19:37, Alexander Kanavin wrote:
> On Sat, 7 Feb 2026 at 06:13, <Qi.Chen@windriver.com> wrote:
>> Add test case to ensure runqemu works in SDK.
>>
>> Using runqemu from SDK has been supported for many years. Add a
>> test case to ensure we have no regression.
> I set and ran this test. This indeed does not work:
>
> =3D=3D=3D=3D
> alex@Zen2:~$ runqemu qemux86-64 kvm snapshot nographic
> runqemu - ERROR - In order for this script to dynamically infer paths
>   kernels or filesystem images, you either need bitbake in your PATH
>   or to source oe-init-build-env before running this script.
>
>   Dynamic path inference can be avoided by passing a *.qemuboot.conf to
>   runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`
>
>   Bitbake is needed to run 'MACHINE=3Dqemux86-64 bitbake -e', but it is
> not found in PATH. Please source the bitbake build environment.
> =3D=3D=3D=3D
>
> The error makes sense, doesn't it? How would runqemu be able to figure
> out where the image it needs to run is on the filesystem if all it has
> is MACHINE value? We can try to hardcode something relative to SDK
> installation, from some environment variable that SDK sets, but that
> would be limiting: in the context of an SDK, images can be downloaded
> and located anywhere.
>
> On the other hand, if you pass the path to the image directory to
> runqemu, it works perfectly:
>
> =3D=3D=3D=3D
> alex@Zen2:~$ runqemu kvm slirp snapshot
> /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/
> runqemu - INFO - Decompressing
> /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-imag=
e-minimal-qemux86-64.rootfs-20260210110409.ext4.zst
> to /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-i=
mage-minimal-qemux86-64.rootfs-20260210110409.ext4
> /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-imag=
e-minimal-qemux86-64.rootfs-20260210110409.ext4.zst:
> 43323392 bytes
> runqemu - INFO - Continuing with the following parameters:
> KERNEL: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/=
bzImage]
> MACHINE: [qemux86-64]
> FSTYPE: [ext4]
> ROOTFS: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/=
core-image-minimal-qemux86-64.rootfs-20260210110409.ext4]
> SNAPSHOT: [Enabled. Changes on rootfs won't be kept after QEMU shutdown=
.]
> CONFFILE: [/srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-6=
4/core-image-minimal-qemux86-64.rootfs-20260210110409.qemuboot.conf]
> ....
> =3D=3D=3D=3D
>
> So would it be okay to set the path to the image directory explicitly?
> If you have several images in that directory, then you need to pass
> the path to a particular some-image.qemuboot.conf file, and it will
> still work:
>
> alex@Zen2:~$ runqemu kvm slirp snapshot
> /srv/storage/alex/yocto/build-64/tmp/deploy/images/qemux86-64/core-imag=
e-minimal-qemux86-64.rootfs-20260210110409.qemuboot.conf
>
> Alex



