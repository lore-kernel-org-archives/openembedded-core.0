Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CDACA6CB8
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 09:06:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6673.1769504780850491764
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 01:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=O+N/S2ah;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54872b1b3d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R80DiD649082
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 01:06:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=TjPn4X7bie0JMdgTK19Vw/hIFrTjwf9vMv1gpVTAw5c=; b=
	O+N/S2ahl7YjEBqYBJg8+P4ksWWemmO00nHVCIuHVzD4O4hI46vhv9AcTUZnUm5/
	796i9UybHGLfW58+FZDfvggFgcW1ojIqSMXPj00/sutKpefIWjFXkboGsWTFQIcT
	2+v4tiSyIg2DjynTHOVeLZA1mvF12FtaxLOlr0l5IVP1cvI0OrYaY4+4y9MlsGDI
	ccYgQgTgXqOtNUtxmQj8it8kF/1+865ys16HBTq756hECoTKMaESIzrl56d3HYZj
	IKp1DcMY+wNdjQLPRS8VdMv9/xncEBxXX6wOrLtwnNfrUGHuIba9BW2cXj4hV8Tc
	3NQG2Cq0nxOZjrc1a/88WQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvt85arga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 01:06:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o4If/s67EOoiub/wq590frQzR/zAgMmZNMpExh8PdM/h3gTIAE5SuiP5zb9geyAACTaCtRqdtKSfA48Gf3RFOkSyBCAxVbiWP/+V1ujR+whSGBzc4HQKuJ3n2f9uARy3jg8urwpPMDX/FI/rBqNYu/X9VpF8z4/Ljy8IR5gx1IJo2y3TLZO6n3VXUrdfEjcJ/0ZOlQVJHZZFqss4YbhuCcL6Mr/etEZTWFjBoNHIaOQrragM9jf7fU4nuS0xGLkY5LJvrVObiXdRZyMPdl9C//pyRDLZtsfzqUjpSl4cnlzIDtXZZNBLAttq1Rq+QXTgumd6V4fDcCmpfV8ZdJtpfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TjPn4X7bie0JMdgTK19Vw/hIFrTjwf9vMv1gpVTAw5c=;
 b=wtrcUAkRexANXfN6C7f165PpIwVDe4RRuZ5Eo8pBohb5XRC8X1IW0PPuXqUWfxCagZLdRguSAm8e70JjOOuyRsDhAdfoi1NjwvDoHTVVjh/YtQDnuSlixcVcsv4lhUNpdHpQDI0Qf3mQhzqOjv7Z8tD4YMuXxl440m/dtAHym7IhGAsVTjb/qWDCbWRPOQ51eiwWD72gGl8RgHsLQtmc9pVdpcuDLsY3r5pLpsVFzEkZRxz+NgG9mJS+AGo7mjd91HmxTGXzC2jyvluruR1OGylXdGcHYdAnDpjUBR90dJnOEyg8oIXhXUSj17L2v6gFpKnGWIyjod6rMq1YyojNqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 27 Jan
 2026 09:06:17 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 09:06:17 +0000
Message-ID: <b708b533-22e1-49c4-abd0-bf91af04eb39@windriver.com>
Date: Tue, 27 Jan 2026 17:06:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V3] procps: support ptest when TCLIBC is glibc
To: openembedded-core@lists.openembedded.org,
        Ross Burton <Ross.Burton@arm.com>
References: <48503D06-1C65-407A-8EE8-B2E5099C797C@arm.com>
 <188E8AC794A362CA.3302988@lists.openembedded.org>
Content-Language: en-US
Cc: antonin.godard@bootlin.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <188E8AC794A362CA.3302988@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:4:7c::32) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ0PR11MB4799:EE_
X-MS-Office365-Filtering-Correlation-Id: a5add63e-cc5a-4e73-8cf0-08de5d835445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cXlzYzg5cjNDSGNWYTA3RWNjRFgwanljS1hHVXZSdVlCT3pMMWpqcTBvTU1j?=
 =?utf-8?B?TjhZeEhqNDZyOHpTVzI4bzFVK0d3M2NMaHFpSTNPWVBLTWJFUnYza3hxV2cz?=
 =?utf-8?B?Qm1ma1dxRkRTUTd6WHZxN0VhdGFTeUw0RUFERmpweWpoL0RJWWZ0Nm1hRHE4?=
 =?utf-8?B?MkVSOFJMbTREZWt4VWZycSs2UnNVUXJFSHBQb2NIenNTSWFGQm9yY3orcC85?=
 =?utf-8?B?WFNiWUhyNnBXcnJSbmRpVUx2RnVUMEs3R1RoTGRGTFdsMVh5ak1vVjBuc1FT?=
 =?utf-8?B?MzZEQ01KaFFFY05oalRxaGErQzE1cXhGdFAwVitiZ2VLaFV6NUlJQzhWemIr?=
 =?utf-8?B?Rml6cWxSUlMrT3Q3bkZEYUZtQy9aZEpIdGZ5UmtnZnFvNDA4VStNN0E0THp0?=
 =?utf-8?B?dzNFYmFRQklEbXQ0VE5wK2lnRTV6RU1MY2lFRVdWTG05NDFqR20vN05uUlpm?=
 =?utf-8?B?aWdQaGRPVVdUandoYlMrNGFEeCtQSUpDNzJPalF5dHloRWljTmdVSTZyNU1l?=
 =?utf-8?B?MGVUWGxGZGxJTC8vNUp3OElOelg2czF6Y2FYb01OVEpYOENRSUkrTXdjUkhD?=
 =?utf-8?B?Zms5b3pjS3huKytNakF5Z1FJaXA3SVZlaFg3UlFzZVlFcEdyTGRuY1VLUGZa?=
 =?utf-8?B?Tzd5UFoxbnVKVEptRmxjcHBFanZ0ZU0yZytjSDM1REZYNndNaVJ3ZHFFSnBZ?=
 =?utf-8?B?NWUzU3lpVkF5VzhCU1l2aDJCc09zL2lXYytjVlp1OGhYOU40eGNEbkFJRzdz?=
 =?utf-8?B?VjBJOEp1TTdSVE9RZjl3T3RQbFlqNTgzc2hMRmxVZmNPNEsxa3B4dDRUcE00?=
 =?utf-8?B?ME0yWm9MRVRVNzdrcWJUakVTZk9jQVN2SkY5cUZKTGxON1o0VXFnUEVlam1C?=
 =?utf-8?B?c1FRNjhYajVoMmZ3RG13aVdLUVNhdThqSDVaNGQ2RVFGWVcxaldBeThSVUZl?=
 =?utf-8?B?Y096cFNJYVpNaUIyWlN5S3puT1BZWGVoaDR2eTJaQWJNQ08wT1JvMy91WmFB?=
 =?utf-8?B?eTZrSzgya2xPeG9KNkRrZWtIRWY3SlhrdVZoSWR4eVBiWmE2N1E2KzhmbFJ2?=
 =?utf-8?B?NVBwNDNuUEZPM0REKzNzMklOcmpiSnQwTnlYbFl2TWtuNyt2UlQvM2F6Z0FK?=
 =?utf-8?B?QlBnL0RCUzZvamQ2ejdUZUhmT0dpRFdUdGZoQitBTHowQ0UwSnFvRUMwbEVS?=
 =?utf-8?B?OWNyQzRNTHJ0dW9lekhqNDNKTzFMNjc1RFJLSkE0Q29QTGpCbzJXZDUxVUV2?=
 =?utf-8?B?dFNUUE9GUkc3dmR4ckNLRUZQU05iVmdHUjIzeVBTeUdEVERtamptQmt4bWJI?=
 =?utf-8?B?UmIrcm5vNkkyZW05bk05eFNkZ0ljazJWeUNxVkRYZFdId0UzV09oOGlSMjRW?=
 =?utf-8?B?L2Q1MFNDbUpaUW1lZVgvbXhVTk1leUVIQmVXLzV5eklqVG5ybVBUaUFwdm5N?=
 =?utf-8?B?UFVXU0NvZ0JUdEJWU2VmU3FBQVpCeWl5ZTh2SDI0ODRnSC8xUUZLeU5xSzk5?=
 =?utf-8?B?aDdKNTlvZkZyRzgyS01uRC8vcTY2VnBPODMyNlR5ck9sbFpTay9oOHdZUjJT?=
 =?utf-8?B?d3FIK1ZIdnppTXBYdjRoUUVKbWVCZUlpTDlUQTZWdHdLdTFldWgwK0h1Rm1h?=
 =?utf-8?B?d2kybHdQL0NXUkpBZEdUMFRmWkV1THRzVThGTFBBbHhxbXkvMHM1RVNmUGhZ?=
 =?utf-8?B?YVlhRWgvanVBbjBIVXVjeDFRQkMrQXVhbGdLalliVDA4NGNPTi9CRFlGdWdu?=
 =?utf-8?B?L2J6MTEwZE02cTNJRU9BSHp1Qi81NFhDOGkwbWhNNUVMVGJuYnVIVG55Yitj?=
 =?utf-8?B?NHBPMHFSNXZsR3d4dFZVL2x4cTM2UjJvTmRIMy9Wd3RZdDZqRXNidFc5VWVR?=
 =?utf-8?B?UU9UWkhCUyt4N3hJR1gyUnVNbW5BUjlnVUI5elhBc2wwSkQwdm9WM21sY1hJ?=
 =?utf-8?B?T21lN1VseS9DNXVLSnV1VERJVDdiTytRbHZ5bjh2WGhkRmo1ajAvTkhDK1VY?=
 =?utf-8?B?OHZGbDZVbGN6SzY5WGkwM3BmVXRJRTcrZFN2NTlJVnpxN29jOFdTMDluNkFz?=
 =?utf-8?B?OTZtNkdzTGZrTmtGZHFKTzNZMC9ocFZxZFd6SmN3TWJaMlI1Y2xIcnhFdWtL?=
 =?utf-8?Q?p2UJFvjhHqhJ88K25L/wJhNeR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TnJ2UWJpSjlGcG5RWEdSMThhK1NQRUxjbzFGSXZJLy9yUUM2cGd2RStzeEcr?=
 =?utf-8?B?MTFNNS9abUJSQTkyNUhxWHVHOGxCUkoxWnZJeWpLR2V0QmN2elVWOHBQYlFn?=
 =?utf-8?B?TjBrTUVITUxTSXBlUmFxTjhvR3ROZVJFM1BjNFhTRVAybVRxbW5MRnRwdS9F?=
 =?utf-8?B?czVNS3pIam5seXcwZ241ZWZSby9DWllkKzI0dTY4aExyZTFZME5QZEpySzdV?=
 =?utf-8?B?clAzTWZSTmRUeWhNS0Q2YjhUN3N2V21tN1p3V0dpNmg4ZmFBV1JqL2ViRHpD?=
 =?utf-8?B?eDdiNkdRWE40NTRDWVVKcmt2RkxraEJKeCtORE1zcjJJVStqN1BqUElTT1JH?=
 =?utf-8?B?aXQ4YlJIejJhWWNSQWg4M1hwbnpXVGtZRDRqQVhteTJnR211eVZUZlJhdm5s?=
 =?utf-8?B?Q05FeCtLMEtlNzRWM1g4OFhrRE1JRllDTmNNTi9wekJkc0o0UFJNMUZRWW8y?=
 =?utf-8?B?MVlmTnBNVVFaZjN2cGVJYmtuajlaZ25TQXhYSXZxR21NT3BJR0NZdm9VZ1h2?=
 =?utf-8?B?bzI2WS82YTloNE9OTG5yWUpSWnRQbjhkanVYMzdGYkZyczN6TFZnc1lWeDF3?=
 =?utf-8?B?Y0IzMk9GSUdjMXlaK2daNUVHTEY3R0NnRGIzdmQxbTFTWnV6Y09Gcmg4bjV0?=
 =?utf-8?B?aDFIOUtQbkxLd2hpVnlqREptU0pQNXh0bVkzdVVWeWJoUEtYQ3NKN1RXanVI?=
 =?utf-8?B?Y0tmUWZ3TkJQQXFsc2xjaE5CNGlFV3g3aUQ2YkZGS3FIWWpOREZIOHNHbTFI?=
 =?utf-8?B?OW1aV2hGaTBIbTJXUDdOYlRYWEZWcUJiaWNPMGdSTWNFNUNWQUxLREZUQXRu?=
 =?utf-8?B?ZVZUMTBURjNqSy9pMWxycXBaOFVkMmczMUJyZURZbnVkVFlGNDFnRUdiRkxT?=
 =?utf-8?B?bFpGc3lIN09TWHFuZjBQOUdIbmlVSWhuTUVqU055T1NPMXg3SEZ0ZGhWZlhz?=
 =?utf-8?B?RXdsMExoR2F3MXhmMm9zenN1NWZ3Q3V4Wm1zRjJacDZqUlJaOVg3cGNrVC9s?=
 =?utf-8?B?TWhEQVgxVjRyY0V6VUVTWkd3dSs1M0NWN2EyQ1B4RHVZZ0dJRng4S3VtNzM3?=
 =?utf-8?B?c0NPbVRwczlndGVzN0wxejYrQlphOHRLc2d2dG9DU2YyWTlHY0xvVkI1cGNu?=
 =?utf-8?B?TzhncTJIWE5oK3dQR0xtSllYQk90UjQwa1VJVDdqOTk4bzFpYk95YndqYjJY?=
 =?utf-8?B?VXRQWXhua1FRVXQ2M1Y3L1h4emU5MzdsNWUrUkxTQkNLNDl5RE5ZeUlmTXp6?=
 =?utf-8?B?eHdyS0RaTy9sWW02TDc4RjMvS3hrNnRKbWZoc1dKZk1QRE5GSmhETHpId1N4?=
 =?utf-8?B?L29jc1NVTEExRStvVGhPcVBZOTlLSDlWMWN4RHRXdHdYdFYwd2g0ODJXYTY3?=
 =?utf-8?B?VnRBbms2Q1IxVGd1YWxRcHFsd1BxSHF4TzFieHdxcVY2NnowWUM4azhlcGlI?=
 =?utf-8?B?RDUrekZ3dS91MjZxZko4UkxNMDFLbHN1ZnFlelp5RXFWajhtck8vU1RxYkNM?=
 =?utf-8?B?dWYwRnBTb0p2WXI1VkNCMFhqbC9WemxQTDJOUjgrZlhacUpQSTJmZXAwb0h4?=
 =?utf-8?B?dGRrenF3dWZ6VGxubkdXTGVjTFhtYlJoZDNUTGQzWkgrSTF0RStwMzF2eCt3?=
 =?utf-8?B?RDRidmEvV2tVeUJRMXF5SXd2bGxFS3BFdnJROVVRckxidkxUczlTZjdMMjhq?=
 =?utf-8?B?YzM2UnZsVXRFdUhWMGl4a0RwMUlxZXpwK25ucnQ2UytJck0yOEt6bmp3S1BS?=
 =?utf-8?B?NW8zZS9vRm1KVDF4bEQvMURobm56cjEzQmgvMys1WWFQUlZudkFVd3F1MGtQ?=
 =?utf-8?B?cUZRS2toUkFXY0ZGM245UVlJNEVqbXhrWXlLVlZqbGRHN0kyeVgyNXNXZGJQ?=
 =?utf-8?B?YzFrTVVDQklsNjlWSmFOT2tmOUlkN0c1aUhac095Ky9KNENkQVhQcCt2ZFZZ?=
 =?utf-8?B?dlhyamdnSVppUlBwL1FCazJLMUh0NXUwRExsczZYM3lyK3NKQ2hLWE5hQ0hV?=
 =?utf-8?B?VmhPYVFNcStBaFVydW40MGZ6bVFReWsyWDNZRjlNTTk1bHpBRFVxV3Jkb1BH?=
 =?utf-8?B?Uk5sWHpzYTE3WEhtYWRObDlmc1hyc2FRdXJVaFEzdXpCUVg1SFlad2ZudlRY?=
 =?utf-8?B?bUNvTDZQZm5PMmlIa25OckFtMVg4Y1BSeGpMTGI1RkZuZjBBdUVUOHAxZm5t?=
 =?utf-8?B?a0R6d2dJajZqMGg4R2t3WHV4aHFFNXZGcU8wUnZLcEJYcEEybm1MU1J6YUc2?=
 =?utf-8?B?cE5FVWMwZGJ6eEtUcGs4YnpoeS9JcjYzd1dMa3QvUnlJUk9kd0xPS0hUeHZ6?=
 =?utf-8?B?NXBmMDhlSlYyaTVHWk42ZTZOOE1tMVZUcUlaelEySTVwc0pvRXNua2ttMVk5?=
 =?utf-8?Q?5dc+GPK8PHghxMXc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5add63e-cc5a-4e73-8cf0-08de5d835445
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 09:06:17.1912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PPOilTHMdNSmAMv1GstQhBrI5npQtqYKyVpFoce/qA8/TiN1Ofyq8M4VuVLOiWAbD1XSJf1yZD2RGAEniEQsp3l5fOvoblFne4QYVBj9sg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA3MyBTYWx0ZWRfX+ozRwJH9Lx5Z
 sM/5c3nuUeQZae52n15heTlX/eli0GbB/sec2btIeNwKMINF6kBNIOCNPguiKoImxz8zeMPTTEB
 GCCdV76IzOCM8YITGFPvfC9a4wHU5JE8xV+FsWKWB9H2jghftW41mlRK5uR5F0rnZ2sm47H28xH
 Yuay8Z2zzmzGFNiRXb2vNp3Z8f0drdke+38X/O3mwwjS4KFVCftr2kJ53cp54JZdEER1Ww451gu
 zyRs97pN+ZvGW8dal9P7LsqoH1XXMM2CF5SKRO4oM3v3b8TtR81hJE3/2ge6JteuOEsOCQYU9HU
 r563MEv4f75AlPCcclrw9EcLtOVh95afCcLJ8SueXh6GVWFYi6EuEIqwurarPEmw6JfP+JrkJRk
 0I3Rc3MypfJ6aOyYuig8hlb5zRmQMgqcueShgBI1zkVD3FuYaYC2PF5A5cQkrD6bzee9raiOXGW
 fZI0hxTpj/Tko//LAGw==
X-Proofpoint-GUID: UWHhU_30HEzxxbQzvbfHHHpzqE2OgJRa
X-Authority-Analysis: v=2.4 cv=M6lA6iws c=1 sm=1 tr=0 ts=6978800c cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=p0WdMEafAAAA:8
 a=si_mruIsR85tfK7zGpkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: J6ZL29FsJDni4UGVloIiMsrYqTmN-H4_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270073
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 60R80DiD649082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 09:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230033

CC=C2=A0 antonin and Richard to remind there is a V3,=C2=A0 because V2 is=
 on=20
master-next.

//Changqing

On 1/27/26 16:58, Changqing Li via lists.openembedded.org wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> * support ptest for procps TCLIBC is glibc. The configure.ac only match
>    LINUX as "linux-gnu", we can patch it to make test can run on musl l=
ib
> system, but the upstream testsuite should only run on gnu libc host,
> some test cases only suitable for glibc, eg: Some of the error messages
> for free command on musl system is not the same as glibc system, which
> will make test failed. In order to avoid some other unexpected failure,
> just support ptest for glibc.
>
> * procps's testsuite use DejaGnu test framework.  The testsuite is
>    expected to run during build time, this implementation create the sa=
me
> folder structure as the testsuite expected to make it can work well.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../distro/include/ptest-packagelists.inc     |  2 +
>   meta/recipes-extended/procps/procps/run-ptest | 24 ++++++++
>   meta/recipes-extended/procps/procps_4.0.5.bb  | 57 ++++++++++++++++++=
-
>   3 files changed, 81 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-extended/procps/procps/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/con=
f/distro/include/ptest-packagelists.inc
> index fff2947177..2391224527 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -57,6 +57,7 @@ PTESTS_FAST =3D "\
>       nettle \
>       opkg \
>       popt \
> +    procps \
>       python3-atomicwrites \
>       python3-attrs \
>       python3-bcrypt \
> @@ -97,6 +98,7 @@ PTESTS_FAST:remove:mips64 =3D "qemu"
>   PTESTS_PROBLEMS:append:mips64 =3D " qemu"
>   PTESTS_FAST:remove:riscv32 =3D "qemu"
>   PTESTS_PROBLEMS:append:riscv32 =3D " qemu"
> +PTESTS_FAST:remove:libc-musl =3D "procps"
>  =20
>   PTESTS_SLOW =3D "\
>       apr \
> diff --git a/meta/recipes-extended/procps/procps/run-ptest b/meta/recip=
es-extended/procps/procps/run-ptest
> new file mode 100644
> index 0000000000..7e132653b0
> --- /dev/null
> +++ b/meta/recipes-extended/procps/procps/run-ptest
> @@ -0,0 +1,24 @@
> +#!/bin/sh
> +
> +# Run testsuite which use dejagnu
> +cd ./testsuite
> +for tool in @DEJATOOL@; do
> +    runtest -a --tool $tool --outdir ../log
> +done
> +cd -
> +
> +# Run test programs not used by dejagnu but run directly
> +for p in @TESTS@; do
> +    ./src/tests/"$p" > ./log/"$p".log 2>&1
> +    case "$?" in
> +        0)
> +            echo "PASS: $p"
> +            ;;
> +        77)
> +            echo "SKIP: $p"
> +            ;;
> +        *)
> +            echo "FAIL: $p"
> +            ;;
> +    esac
> +done
> diff --git a/meta/recipes-extended/procps/procps_4.0.5.bb b/meta/recipe=
s-extended/procps/procps_4.0.5.bb
> index 0e0e06f0d2..cddb79cf10 100644
> --- a/meta/recipes-extended/procps/procps_4.0.5.bb
> +++ b/meta/recipes-extended/procps/procps_4.0.5.bb
> @@ -10,11 +10,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d=
69f5fce4486a80fdaf4a4263 \
>  =20
>   DEPENDS =3D "ncurses"
>  =20
> -inherit autotools gettext pkgconfig update-alternatives
> +inherit autotools gettext pkgconfig update-alternatives ${@bb.utils.co=
ntains('TCLIBC', 'glibc', 'ptest', '', d)}
>  =20
>   SRC_URI =3D "git://gitlab.com/procps-ng/procps.git;protocol=3Dhttps;b=
ranch=3Dmaster;tag=3Dv${PV} \
>              file://sysctl.conf \
>              file://top_large_pid_fix.patch \
> +           file://run-ptest \
>              "
>   SRCREV =3D "f46b2f7929cdfe2913ed0a7f585b09d6adbf994e"
>  =20
> @@ -47,8 +48,58 @@ do_install:append () {
>           fi
>   }
>  =20
> -CONFFILES:${PN} =3D "${sysconfdir}/sysctl.conf"
> +do_compile_ptest() {
> +    for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS); do
> +        oe_runmake $p
> +    done
> +    oe_runmake -C testsuite site.exp
> +}
>  =20
> +do_install_ptest() {
> +     install -d ${D}${PTEST_PATH}/testsuite
> +     install -d ${D}${PTEST_PATH}/src/tests
> +     install -d ${D}${PTEST_PATH}/log
> +
> +     install -m644 ${B}/testsuite/site.exp ${D}${PTEST_PATH}/testsuite=
/
> +     for p in $(makefile-getvar ${B}/testsuite/Makefile noinst_PROGRAM=
S); do
> +         install -m755 ${B}/testsuite/$p ${D}${PTEST_PATH}/testsuite/
> +     done
> +     cp -r ${S}/testsuite/* ${D}${PTEST_PATH}/testsuite/
> +
> +     for p in $(makefile-getvar ${B}/Makefile check_PROGRAMS);do
> +         case "$p" in
> +             src/tests/*)
> +                 install -m 0755 ${B}/$p ${D}${PTEST_PATH}/src/tests/ =
;;
> +             library/tests/*)
> +                 install -m 0755 ${B}/library/tests/.libs/$(basename $=
p)  ${D}${PTEST_PATH}/src/tests/ ;;
> +         esac
> +     done
> +
> +     tests=3D""
> +     for p in $(makefile-getvar ${B}/Makefile TESTS); do
> +         tests=3D"$tests $(basename $p)"
> +     done
> +     sed -i -e "s#@TESTS@#$tests#" ${D}${PTEST_PATH}/run-ptest
> +
> +     sed -i -e "/set srcdir/c\set srcdir ${PTEST_PATH}/testsuite" \
> +            -e "/set objdir/c\set objdir ${PTEST_PATH}/testsuite" ${D}=
${PTEST_PATH}/testsuite/site.exp
> +
> +     sed -i -e "s#@DEJATOOL@#$(makefile-getvar ${B}/testsuite/Makefile=
 DEJATOOL)#" ${D}${PTEST_PATH}/run-ptest
> +     for p in $(makefile-getvar ${B}/testsuite/Makefile DEJATOOL); do
> +        if [ "$p" =3D "ps" ]; then
> +            install -d ${D}${PTEST_PATH}/src/ps
> +            ln -sf ${base_bindir}/ps ${D}${PTEST_PATH}/src/ps/pscomman=
d
> +        elif [ "$p" =3D "sysctl" ]; then
> +            ln -sf ${base_sbindir}/$p ${D}${PTEST_PATH}/src/$p
> +        elif [ "$p" =3D "kill" ] || [ "$p" =3D "pidof" ] || [ "$p" =3D=
 "watch" ]; then
> +            ln -sf ${base_bindir}/$p ${D}${PTEST_PATH}/src/$p
> +        else
> +            ln -sf ${bindir}/$p ${D}${PTEST_PATH}/src/$p
> +        fi
> +     done
> +}
> +
> +CONFFILES:${PN} =3D "${sysconfdir}/sysctl.conf"
>   bindir_progs =3D "free pkill pmap pgrep pwdx skill snice top uptime w=
"
>   base_bindir_progs +=3D "kill pidof ps watch"
>   base_sbindir_progs +=3D "sysctl"
> @@ -80,6 +131,8 @@ RDEPENDS:${PN} +=3D "${PROCPS_PACKAGES}"
>   RDEPENDS:${PN}-ps +=3D "${PN}-lib"
>   RDEPENDS:${PN}-sysctl +=3D "${PN}-lib"
>  =20
> +RDEPENDS:${PN}-ptest +=3D "dejagnu glibc-utils"
> +
>   FILES:${PN}-lib =3D "${libdir}"
>   FILES:${PN}-ps =3D "${base_bindir}/ps.${BPN}"
>   FILES:${PN}-sysctl =3D "${base_sbindir}/sysctl.${BPN} ${sysconfdir}/s=
ysctl.conf ${sysconfdir}/sysctl.d"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230032): https://lists.openembedded.org/g/openembed=
ded-core/message/230032
> Mute This Topic: https://lists.openembedded.org/mt/117485471/3616873
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
changqing.li@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

