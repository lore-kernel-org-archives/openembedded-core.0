Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF77C8303F
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 09:29:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16728.1756373373293096907
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Aug 2025 02:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HVLOODhR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0335ea6984=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57S7Y85P3436857
	for <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 02:29:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=+rNOjJDQipaGcX8j7KMIlCFsP1lGFX932YeQpZrE1Lw=; b=HVLOODhR/9Uf
	ZCnUivfGcJriMV9MVjtIsdbx7eImmcpBS18TAsLrGi/RPkTiOPZSJnSL0yh3eO8j
	sswfcGI9sv4hfqHYwSGJs2wICl0E5wivvZqybNAHDGj8WaIA3rXDUuO8V22yQfnk
	8s3VPoyGAKXVwHT+qbsXby3TNUYqqSE1+xG0hLFipY5JslxHY/TaAfDdMsE1jjFu
	5XBuGCl8eeW9qz2nx9cGpr7elTrogoGBXXw3jKnQRCQMJRZRkUg9p9sSzv8KZ5yo
	vYCQ1Lg9L9y6DEg+PkurKGZBhqZ+Jz6diQQAnKrrZW2ucT+y2CCaAIdVQV95CzQf
	JVrT3qejrA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x25hgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 02:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dVyBnqhDcmhlAfcKbvotgos1NeDpx2CGALtc21ZJ7NJnhRypmxoe7sGWwO14WkuuFpH2I0cDSvP1mQBBupvTsuPw7qBG8mP/qPcYm22x9RW3yw0cWAkPofkdgog6+KMp10mLoZFAHQbFVwKlpLmQC1rJVdTcz+KLKMhfWHeQAwtup47cBX+Cpd9kaBfvBDn8x4Dv7pTgq08NMs7utpM5jRK85w9DNG9FWmybs1bDZBfKxPPIXDAjO6oqkmEDctLX5ZhC3xJSN+lwnYfoch0Qx/A8ufxg75NqzSUotKsNn55T38G5e2rPvuA0AarLWPv7DOmBSCLZX+4velrjmTi3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rNOjJDQipaGcX8j7KMIlCFsP1lGFX932YeQpZrE1Lw=;
 b=cf4Vsecxeyl3Raq8HFcoPAIEru4KJ5+91x9dGe3PCPoU7X88WQuNc8aLsTDvUesWehyI2xGOX4PEgOTXojCPiU0qRswyG2pv7actG2foyftuH7nViBCZDgZoJP5ITwM1BDJ1Hr1AdQKOPuQf97EExpuTYfL+ZxUQIKbkdLjBUtRuCcqJQ18KMkEx3jAey/bUTUxIdLdG9WghyMab7+ohsxJOh8/y+iX6pTB+Uanf1YNrce46izYYxJr0IR+RzuAyfUWeuR2ebR35lTwp++zGzLAPDFUcq8q2fUUOsQFWKz57+R0QhsKaMXXXzgxFzcbirHQ6T8OOtKsFwRiao9tK9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by IA1PR11MB6441.namprd11.prod.outlook.com (2603:10b6:208:3aa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Thu, 28 Aug
 2025 09:29:25 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9073.016; Thu, 28 Aug 2025
 09:29:25 +0000
Message-ID: <51adb889-b255-4a63-9f52-08563a60bc58@windriver.com>
Date: Thu, 28 Aug 2025 17:29:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] babeltrace2: Define LDCXXSHARED
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <20250827043440.2791498-1-raj.khem@gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20250827043440.2791498-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCP301CA0029.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::15) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|IA1PR11MB6441:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c271998-4bb5-4e33-f379-08dde61560ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|4022899009|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U1lzRzFNOGo4emtMUGlvNFcxL2g1b3A2dGN5ZjgrVWpTajNZUEFNQlpCZ0Jq?=
 =?utf-8?B?cEVIOE1PcTIxaUdvTlZLTCsrelNSaEs2dWZ1WHNmY005V01hTVl1ZEZsbTlY?=
 =?utf-8?B?YUkvWkdZdGdVcVM5VFBwVlRoSXFEcWw2UUQ3U2I0RjBTMFRLU05USHdqaGJi?=
 =?utf-8?B?TzVKMjE2YWxUSjV3OGpTbGdRM2tHOWs2clF6dHdYQk52eVNmbnpZK3FNcy9x?=
 =?utf-8?B?OVc2ZW1rZVlxZHVhS3RrNDNROTd1dHNuU1NSdEgzTmpsMDhKYms0R1I1dFRu?=
 =?utf-8?B?ZHRiRVhRK0NhWWVJMU1aTTBsYTI2TFlOYXlUcDZoNVB4OXk3bDh3RmoxRnZp?=
 =?utf-8?B?K0tid0xTanpvZSt3QzRLeFI3ZnV5ZllkaDdWb1VIcEQrQ0UxeDdSVEwxcWZF?=
 =?utf-8?B?eWN2d1BxVUY0ZU1SSzlZaWdOZGYrazhZUDVSOS9UZmdWSGpRb041aVpHUEVF?=
 =?utf-8?B?SlQrREpkK3o5eExXMEE3MnRLM0FWaXJNUTFxZEt1M3dHNjg1TDZ6OVpYWllB?=
 =?utf-8?B?WXY1ZVZTdEVnbnlxSkc4NzNUckw4SGptME1aUnJCSHNTeXFiT2F1aVF0Z3Bl?=
 =?utf-8?B?eW1JWDVxVElzdk9qWnZ6Z3Y0UE16WGlubmpRQndBdVFiaS9IWTJpYVJxNmgz?=
 =?utf-8?B?ZFMrTHZTK1J3M1F1RzNDNFRzNnRhcHQvL0RSRjNtNFNCYnYrelpvYWhxSlB4?=
 =?utf-8?B?aFBpQ2diZ0dZUC9GRkFRN3lTWmlia3VLTzg3MnQ4UmtiVkVUOFd3SktrZUlu?=
 =?utf-8?B?ejlrNEFtczNITXRkazI0TWhYa2lKcm9rSzloM09ScFBOWVdlTGhhbDFWaDBG?=
 =?utf-8?B?VGk5OVpWdnh5RzdQNHdScnFhYzB0SndDRWt3MTZ3ZXAxZm1vWkxEVUZNOVJp?=
 =?utf-8?B?MmphQS9PT1kwU2NhY09aUjVVZTFhazM0ZTdTTDhZRjErL2RCb3JGb1N6M29T?=
 =?utf-8?B?N2NpQUIyNEJuYng0djFyOGhGUExsWlVsM3IrV1IwU2JUajU4cTRaWjU4R1F6?=
 =?utf-8?B?bFd5T1BOaEFqOFhMbFg4bDk4UHA4YmVuUjVxOTk3aFFTd280Tmd3NnJzc0pp?=
 =?utf-8?B?cFdCU3NqM1grNmdkTUVQN2c2YkgxSUkvWkpqWGN0N0Y5eFkyTXNra1Y4RC9r?=
 =?utf-8?B?QlpNbWpraUMzRGxLWjhFZ2pXcHhMWXF5aFI2ZTU1QlovenBxM21MNDZoSEI2?=
 =?utf-8?B?UEJ4OVlVbjh4MTBBMlpIcFg4UnIxWkZNZUR6NDExUWJ0anJzNjBmNzk1bS9Q?=
 =?utf-8?B?Z2ZCaFlLWGhUNEVUNys4ZVhlaUpURWJvQmhnOU1LemRFSU9uSGJPQzhtYUF6?=
 =?utf-8?B?VVZOVVUraGFiSHRtMUJNQU5ScHJrZ1FKUXB4T05rbjhURmsxOHFCdmlRK2RE?=
 =?utf-8?B?cDB3UXVOQ3N2WWZTUHZyeGJFZ284TjUrYlFQdXFocDB6N055RXM3TFB3OHdE?=
 =?utf-8?B?OUVBRHdTd1hTTDNUSVlkZjFYVXVxUDRvR2F0NTM2c3lGYkEreHJiby9YVksz?=
 =?utf-8?B?ZTdXZVVPdTBjOVFZeFlKb3hRY1lJdWlpd1JkKzJ3dXU0UzBjaDE2Szlkakdo?=
 =?utf-8?B?Q3htR2o0SHRabHpNb2RFclYvV1dFSDZvQ0d5U0tjaVdaMDE4NW9NMk53Vmh6?=
 =?utf-8?B?OUg5Skx0aWFYY09GeEhsc1ZjTkNNUGhrblZEcmErSUhhcVNjeEhMNzJIdEM0?=
 =?utf-8?B?ZEtUNXVHbEtRZ3BoVGo2VEUvc1d5aXc2cSsyWWFRTTRnL3kzZ0VnWE9oQmhJ?=
 =?utf-8?B?aERxbjQ1VVd1TitIcm9ReUhmM1VLeG5kOThmeDVlZ1dJTmpIVEcvV3oycUlt?=
 =?utf-8?B?TGVkYzZMUVNCK3ZKekViTjZtQ3hwdVZyYXByRFhIaDhSa2h4ZHhJdWZRbll4?=
 =?utf-8?Q?dRbuyNKqc577G?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4022899009)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cWEvUXU3ekkya0tGeW1mTGFmYTdpdkFIejRVS1RxaTNsTTBLYk81TThWM3dC?=
 =?utf-8?B?Z214RGYweE9jOUkwcXQwcUlRQk0wd0RZQmZOR1hsMS91SkJxZDdKM2hFb2hR?=
 =?utf-8?B?aW9NOVRrOUIrSW5UOXJaSEY2WXh6a0NHQTd2dkx1WElDdUUvSVdHWTJNR01H?=
 =?utf-8?B?T3lDcTdNV0VYVU9JSEgwWmsvYlhKcWNMalFYLzNPLys2MFpNVXROTjQ0WmZ0?=
 =?utf-8?B?OTB5cm9nS2xoYmdVeUs0VStKU2JlbUgxbW01YUwwK0pHbWE3UC81UWVrakhl?=
 =?utf-8?B?UkJQamk3V0JZTm5rU21XK2RkeUgwdzNyd041a2tIQ1E4TkFvZjVEQ0EwdEhC?=
 =?utf-8?B?TDlwL0dQcHk5ZEF1RnhrRmEyaHBmUlNmV3h1Z2hvTWpiUDYyU2NZbWIxMkVC?=
 =?utf-8?B?bkN6YTU1ZVdzWWtLUDFjYjh5Q01IblRDaW1ySWpTNE9QYTFEcndMdi8yelA0?=
 =?utf-8?B?WnlNay9oT3Z5N204ZXkzMEFOdDJPQ2U1TU5KTnZDS3haam12Q2p2OEpyenBp?=
 =?utf-8?B?bnFBdXBwYmxLMW9NaW0vQlNnbFAxczFzZzI4YVJiSG9nd2tIY3FoR1dFT09h?=
 =?utf-8?B?bGtsV1pBSC9WT2NZS1E0cS9GVzRrZTJwNkg1UGdrQnpBRGI4dktXRlY5emJ6?=
 =?utf-8?B?VnRCd21yVHAvNElOR2tMSXhJVlFuZGJzQXRuaDFsaUcyVGRnc0xDU0RLOHhO?=
 =?utf-8?B?NC9hRk1EYkUvczkvKzJJSHVUaG5yMHZ0T2lENXp5OW8rdG4xQk1keVB4OXIr?=
 =?utf-8?B?SjVobWhEaTErS1M1L01ReGJRMjVGV2gxenJwa054anJhOTI2T1FobE45K3BD?=
 =?utf-8?B?ZncwV25UT2VLR2s2c0xlVmxsYURvNnUwRThoSm1jQi9JOE9UM213RXRIUUsv?=
 =?utf-8?B?TzMrTUg0Y3MrZnZteWNaVkp5WStGVHZOUnl3OFQ5bVNEYWVCcm1TZWd0T1Qw?=
 =?utf-8?B?OGpqR090YWpZMUNkQTBBWDdVbDZseUxQUDkwcVp3ZTQxTVRlS3U2S055dXZX?=
 =?utf-8?B?UGViMEc2QkJyZHBrM2k4Ym1OYnRuck1VZUNKRVpwWmk2UzRXZzltcjVtdlpN?=
 =?utf-8?B?QTlkNGR6OS9NL1pLV3UzZmViNVMvSU5iRWNWSTRUR2Y3WTlSQnZ6eDNwN1p4?=
 =?utf-8?B?c2NzMk1DYUgyZHBsT2Nqd3FvUEdqSXIwMVUxYldoS1VsU3A4MmU4QTBtRXc4?=
 =?utf-8?B?TUludlFLVkhBSFQxRjNGajBoUU05bnczTWVDQjlUV0hUcnFBSVhaVmtCWGpW?=
 =?utf-8?B?TWQwcXA4V2Fyb1pxT2M2cTBUcXBsUis4dTBwejEraElPZmJhaFp3SnJCejBS?=
 =?utf-8?B?YVFWZk0wT3c2WHhHUkZENXVzVFZEYmd6OVZNZnVLdTBiQWZLeDZmQ3lXQ3dK?=
 =?utf-8?B?dmRtTDdYSFljQWxmS20xSGpXVUFaVU41eThLbm5UbUIrZXB6bHpMcVJsdVNo?=
 =?utf-8?B?dWhxOEVjWDYzYVNiV2tGUHc5clRnSVFnVDhnYloweVEyU1UzRUlxYVdJSlFF?=
 =?utf-8?B?UStRMjBraUo1WDhCYVowdVN5RXZ2NzBYSEN4UFRTb2NxbldhZVFXeDRxV1dG?=
 =?utf-8?B?Nk9yYWdwQVlNY1h0QlhIS2NsSHpwZUFaZmJvaHo2UjdPeDVacERCTm9QcEY4?=
 =?utf-8?B?TWVCQVhtRExUdmV6aUxCN3JIWldSOE9YRjdNWExpaUdRRUhnTEpIUVN2cWFq?=
 =?utf-8?B?WGRudy8vdTFJK0JpWHgveXFkT2hTQlFmeUF5dkRiSjdhZmFtQ2lkd3Q2NWdW?=
 =?utf-8?B?MVBwWERvczRHY09WMlBKMkNwaUw5ckdhK095N1Jtak1vWnM3ZzRiOFVQWnhs?=
 =?utf-8?B?SGZFN1FKR1ZRY0hkWEs2ZTlVaFRZZU5EYUpubFhrUVdhT0tHUDhqeGRuODFx?=
 =?utf-8?B?NXdjcWFvdkdDdi9WbzZWa1FIbHUwREdWODhaQ1NLZ2FNdjY0L05iUW9rNHBL?=
 =?utf-8?B?aWtQOWZmODFMZ2s0TldUNEtKU01XVW44Q3BHdmJEU3JsdnlmSzUwSVErOTFR?=
 =?utf-8?B?OE5odCttVElZWnp2OENDUU5iaklvK25JRWNWT3krbmhERERNMS93NG5heDVu?=
 =?utf-8?B?TlJydnpBRnVqc3FXT3lPT0NHemhpaXRDUUh5Nng2bWR3UEROM0RaKzJaZFBw?=
 =?utf-8?B?cWpzdnBZbEZaUWtSKzl5UG8wY3R5TVRuNUl4ZSttWlVjWk04MGMyZ2VocVdK?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c271998-4bb5-4e33-f379-08dde61560ce
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 09:29:25.1956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6rwItxrmEOeem+JxYEwVNYmD1+6TairE77Uo5ZW4GCBRFHpybVrRovJIaYzhXE+jGYHT6VdN2hbxmxCKWS3GMqANuTJH8Sd5e03kptzBnE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6441
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: pjK550bsL9EjQpfY-Ri9JxIgzkf_ZPF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA3OSBTYWx0ZWRfX4QzeowPa63w8
 zCzMl5x3zc2GHpINPtgaZdSVOkk6Q9ayfRO52s3tIQy7YsBJhFdy3UWNqWyE6l2+xg/xiwgu7dp
 zxkqDsL6U66svfc5axZJrEgWFADwnZM/+pGapFtYEFfpkK1ImEmkx0Hnj69lmjVYJ4IqkTL9W8E
 IEbSc+55qX9k+yFwnAEaGr60M0nOC8/2TIKmkrBbzxKWMsNp6tAo24k046dr9hm7BgRdTEJ1J5a
 cP/7XWWKvFvKbKsYi2N58OUmiYYtunU8O+uE4iOtr0xQZpPkJttrFsPnZ05J0eRIVGZdukipX2h
 eztMmxXVnp9GQD/AmNNPccE++vusTbQnEy8fJ/G0bZlFQsdgu7Ukxt4o13ehy8=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68b0217c cx=c_pps
 a=Nk9nByta7IVv34Xs/Tv0zA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=RnRFvQNgBIFfqJXiWMwA:9
 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: MGVqz9CFFNY-jC11BNUnwypRPhazfqgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Aug 2025 09:29:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222551

Hi Khem,

On 8/27/25 12:34, Khem Raj via lists.openembedded.org wrote:
> python plugins use setuptools/distutils to build and it tries to compute
> LDCXXSHARED as described in [1] in /src/bindings/python/bt2/setup.py.in
> It gets confused and ends up specifying compiler twice and the result is
> that linker fails with cryptic errors e.g.
> 
> | /mnt/b/yoe/master/sources/poky/build/tmp/work/x86-64-v3-poky-linux-musl/babeltrace2/2.1.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/15.2.0/ld: cannot find x86_64-poky-linux-musl-g++: No such file or directory
> | collect2: error: ld returned 1 exit status
> | error: command '/mnt/b/yoe/master/sources/poky/build/tmp/hosttools/ccache' failed with exit code 1
> | make[3]: *** [Makefile:741: build-python-bindings.stamp] Error 1
> | make[3]: Leaving directory '/mnt/b/yoe/master/sources/poky/build/tmp/work/x86-64-v3-poky-linux-musl/babeltrace2/2.1.1/build/src/bindings/python/bt2'
> 
> This is because first occurance of linker is encountering second linker on its
> cmdline and tries to treat it as an input object to linker
> 
> Define LDCXXSHARED like it is in setuptools-base class
> 
> [1] https://github.com/pypa/setuptools/commit/2c937116cc0dcd9b26b6070e89a3dc5dcbedc2ae
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> index 1dc8cd8a498..ad6b7e8f057 100644
> --- a/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> +++ b/meta/recipes-kernel/lttng/babeltrace2_2.1.1.bb
> @@ -23,6 +23,8 @@ inherit autotools pkgconfig ptest python3targetconfig
>   
>   EXTRA_OECONF = "--disable-debug-info --disable-Werror --enable-python-plugins --enable-python-bindings"
>   
> +export LDCXXSHARED = "{CXX} -shared"

It seems that the {CXX} should be ${CXX} ?

// Robert

> +
>   export DISTSETUPOPTS = " --install-lib=${PYTHON_SITEPACKAGES_DIR}"
>   
>   PACKAGECONFIG ??= "manpages"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222488): https://lists.openembedded.org/g/openembedded-core/message/222488
> Mute This Topic: https://lists.openembedded.org/mt/114912971/3616940
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


