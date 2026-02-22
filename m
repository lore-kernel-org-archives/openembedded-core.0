Return-Path: <daniel.dragomir@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D58C636BF
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 21:34:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22378.1771796076425977822
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 13:34:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iRuabrG/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6513b9aec0=daniel.dragomir@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLYaPc079458;
	Sun, 22 Feb 2026 13:34:36 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=h7xL9Vvr0tuqmaFnxsbOfikgzvKN256PuHnQxspyBH8=; b=iRuabrG/hCTY
	okbiy+K+iepCqeMxUKFhaOmoqTpsXR3bo5TWhOABzGVe5R4hmMs5F/bhM+RKy389
	cb3OGT6USnXaIq/mqY8faRTljoqhDxopATt4Jp8ufkYaH6ZAB9Sm9gzAcW47uMCf
	PLPGAdOE7eHQdSJFNCwlZ5Xb9+Q8ntoBY1owmMsQumFmLYrBgCanYIcwjPL6++Tm
	6E7A/rwDsSFvZjmUVsHV/UNoe5I4a3s/sFwtbBb8k64m/C+TfZTbqjrkL6A+7q2j
	P4Rg806lFLXQB7hubc6q/wXpZ7I27puHtQrDTLDxk5HQNzvCD/cFZEeFFkw4fq4I
	xqVheY0R0Q==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012032.outbound.protection.outlook.com [52.101.48.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k0ufp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 22 Feb 2026 13:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxrw4l7qe24dID1GJdcEBP9InD0YCUrhCMoJFSsqm2xKhYVOrh3DexvDlzcZu5ReA5KUfcKXvWGAr1Fmeyl4GM1yS0QysBm1/eGcxxMgp27XSlQ6F0OuW9j6k2Xk1/2FT9mlz8qsc8cymA6gIeZE0g/OGE2F2OUGkX5EtnU+mrbFhAGePaAkNp+OzWU2K/Dq10KYKCp4U3VGSlDs2NWeSBtDNP+1rd0qM+n8a0RF4O4PlycFhhqLFOeR9CjHYiIeGvKfh5VEr0mpQYsAEKV0aGWx36wJgFsERyK3X2krFEGUtHic9OpHEUzDiWu5U3ykx/q3Spt5gKQqZmDC1ms3OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7xL9Vvr0tuqmaFnxsbOfikgzvKN256PuHnQxspyBH8=;
 b=fG8X28wJjBm5bwutLdWUcgtQm8YCN0Iuvx7CCL8ZWIcgg3l5MVIqFhbzFnKynkXffRAiITNwHQfqqau2Cu3o6WnrG3hNRWxO+zcuX4yKyXbvcvBDS7npaQtW5CjyNspQAl5ClUqX4yMOsUtu1L9fTIl86wzFcjLhhXbNec8fnegZph+24ylCRj5e80XsdqeJ0rKpPOmusKFSYsTqZvrv3jDOzHDcpsM4p1/X45CFpuqMI28mdzMLLUFPn/lVl4S1Isc7AhHd/7RcSniVrMzrbe6dVh1R4w9w4KOX9cvBhJO3tqdMqD4WZkRVTBuD/4ONDlIcaHcODHFDHNqKj7P+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB7981.namprd11.prod.outlook.com (2603:10b6:a03:52f::12)
 by CH3PR11MB7841.namprd11.prod.outlook.com (2603:10b6:610:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Sun, 22 Feb
 2026 21:34:33 +0000
Received: from BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1]) by BY1PR11MB7981.namprd11.prod.outlook.com
 ([fe80::f002:6d1e:9df4:52b1%4]) with mapi id 15.20.9632.017; Sun, 22 Feb 2026
 21:34:33 +0000
Message-ID: <e71f2529-1724-4232-8abb-ed2d3b495a6e@windriver.com>
Date: Sun, 22 Feb 2026 23:34:27 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v3] wic/engine: error on old host debugfs for
 standalone directory copy
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-core@lists.openembedded.org
References: <20260211131120.2502404-1-daniel.dragomir@windriver.com>
 <DGKYYRP6LKYP.3O6GA4S9H6SZP@smile.fr>
Content-Language: en-US
From: Daniel Dragomir <daniel.dragomir@windriver.com>
In-Reply-To: <DGKYYRP6LKYP.3O6GA4S9H6SZP@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0261.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::34) To BY1PR11MB7981.namprd11.prod.outlook.com
 (2603:10b6:a03:52f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR11MB7981:EE_|CH3PR11MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d5108b-0aab-4973-5ff2-08de725a2b52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UFV0elJoNWliay9jL2ZaMlBicUwrYlp4cUhxWVhKeTlyRE42M2hDcHcwZVl3?=
 =?utf-8?B?RjZSTmJJRDM2TkVoTUpLdU1TM25uL05GRDM2RG4xdjdrNUJacmtjL1kvL1Nj?=
 =?utf-8?B?VUQ1NSs2RWp3aXRRYkhhT0NYUFBlL3NJN2NqSlNFQis2QklvUXUyVzgyQnZH?=
 =?utf-8?B?dEtqbFo4VmM4Q3dRQjJSeWY5QXU0Q1FvU3FnakNuVmtJVzErNS9vWm5yTFll?=
 =?utf-8?B?M2dPQzFlcitoMzk2dm80YUR2em1PY05OYTBWdkFUVmdjcytubEFvSWg3K0x1?=
 =?utf-8?B?VTdtbmc3NWpQUVhXT2VOU2tXaDJHbzJVZSt3ZktzcXJEZXU3SkhXOHJDeE1o?=
 =?utf-8?B?cnpXcHpPSzhtTk51Sm1vTGNtWCthTE9VZkM3Q01tWHB3TS9qb05TQnpzZHlj?=
 =?utf-8?B?aFQrTFdFSzRsVnR5NG14Qmxva2hHNTYxNWNtaWRRWEJNQ3lJbS9hSUVlZW91?=
 =?utf-8?B?TWdCYnpQRGE4ckR0K2tyUjJTUVZHU3l5eWJlbFNqZmJZL3FLRmJ6R2NXeEZY?=
 =?utf-8?B?VDZGdjZKSUU3Nm93N2R3cytndEV4VmxBbEZpOWFJRTQ5SittbWhxK0hUalVC?=
 =?utf-8?B?R2thWkNaQUorc1VqOWhYL0l3LzhCSURNZGEwOWdqVVllM0ZObE1kU3RPTDhU?=
 =?utf-8?B?UUE2ZGkxVVkrWDZPc2dUa1BEZFlHTStwNXhKNVBaSm1HeVNNUFh3RnVjWE1I?=
 =?utf-8?B?UlMzVVVIVGJ6MkdiblZNZ1lIWlR5bTlPZFFHTEJkNE5lcFRtNUQ1akpSR3gx?=
 =?utf-8?B?RG1OVTZVZk13aFc5WmxFclNkVXcyT0VZZ2F5eXVad0JHUGE5TDMzS1lkOEl5?=
 =?utf-8?B?Q3hUb0IwSUlMdjJ1T1ZGd1hKQS9ha3RQVkdCUmxRM3hnVk9Ed3NWS3A2azVE?=
 =?utf-8?B?WDR5RWs3bndrSjJJN3ZTTHpjQkRIZUc3SWRRQVlldTg2VXJwTUR6NDhyd3VE?=
 =?utf-8?B?aGkvWktSNnYzL2lVL0gwY1RlSy92cU5aUThPaThncyt0MVFwc2xiZVJ6elda?=
 =?utf-8?B?WVBuUU91bnZ0OEJjYTN4cFM5WG82VWlBcFhqOVF0TnpWdktiTS92NGtmTVcz?=
 =?utf-8?B?ZHhGUExkU1NpbWM4ZzRkUFJKdXd1d3lML2FnQWNMNzVkQ1Y0NUZTQmYyNlg1?=
 =?utf-8?B?S3RIWnBVWWxCUFFUS2hpVVNlbTV1M3hISFU1eGRoTkZBUlhvdEx0QUZDcUVJ?=
 =?utf-8?B?NnNXNlJsUWphRG5WWVc2OUNCRlVpUlJYS3NOMG5DSWR0UFM0R0tlVXZrYVBF?=
 =?utf-8?B?Y2VST0cwdnJZT1NocHJZVUdINE1HRlUvODFlVzZDQWFTRUxNVytjYWlVWmZn?=
 =?utf-8?B?RDR5cktUaDlQYjVqRHNuSUV5WTRQQWVSNjloS3V0V3AzeUxjamNDalJ6Uk5m?=
 =?utf-8?B?aVVCMDI1QUJsVmdneCt0TVZ2UmVUeDM3UHFxdlNQY1pPOFVyS3NERXJIVkU5?=
 =?utf-8?B?cnFBZm5ZWmFJeFNES0NYR2RxWWQ1aDBqOTNvYmZhdEFwWUpkdmdpcGl6ZjE0?=
 =?utf-8?B?QVhoNWtBaGxKV3V4REZUQmd5bm0ydjFnaDFSZ3pmeGk4bUIzV1dCRW8vLzFQ?=
 =?utf-8?B?dTF2VHNaZjZ0M056THhHbWxVbmhXam5tY21LQll5M2RiTVRLZlhSdXBkeisy?=
 =?utf-8?B?RFJOZHE3QXlzWEx6eU1vYVJNOUNRSWZ0VlVSdEp2R0RtVVhpSm8wcmdkSlE0?=
 =?utf-8?B?QVVTUXdhMmFVVk9WYTM2cW5PNFFORmFUaXZDcmN4UkxLSVd6Z2xIVGt3SkVX?=
 =?utf-8?B?U0ZHNGc1UW5qanRwaTRTaE5HcjF3UWwvT3NiQUZoTFZpeFkvbWJXejBEbHkx?=
 =?utf-8?B?MGVRaVNhYm5uQkl4K3JGQjhhNWU1OXErYkZHRmMzMm54ZFNlSEErcXA5QjJH?=
 =?utf-8?B?S1NXbXNQRFhqdFhnRmtRTTVvR3pNNWIvYU1yZmFxNUFSV3RFOVNwSlo5UDNs?=
 =?utf-8?B?QVI0UzJLVFVTaHoyN25FWWFFRGRlcHVNU3BaM1V1d2REM2Q4Qm11N2FJVGNo?=
 =?utf-8?B?UTBWQXJTZ1M5WHkwSU1QR3BRMExXMWcyTUNxYTBhNzAxZnk4Ym5zdXBkL253?=
 =?utf-8?B?WjhRVzdXbWR1VVRnMGNHRWVHU2FkUVJodFZBaXY4WXBFT0w4Y3JkbFJWWFJ2?=
 =?utf-8?Q?IAxs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB7981.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHg1TmRndVo3d1B3OFpJWUZBNWFVU0FoZTRNVTB4cytuTm1XSUd0YmNmSXpN?=
 =?utf-8?B?cXNURlhEVmVvUituUk9FQ2pxTThpblRYNk9hdVpyK2h5NndjcmRHZFJMajgz?=
 =?utf-8?B?NGlxY3lzNTFQTjh6bVZZRm9yZmNGRFluUDNXbUVQck9MYlgvemViYlZ5SHZP?=
 =?utf-8?B?R1k0Umd6SXhkcVRoY0R0NlpWSkFmbVVPYTJNSW1VWDlvbmxqaHZncDV5Q3Bi?=
 =?utf-8?B?Q2V4NW93Q1ViVEE2bjdJR1g5S3RKOG5QdXp2dURmYUUvaU9mak01dWtVVTA4?=
 =?utf-8?B?Uk5nSXpJQ1g5NHVjZkU2RnZFcTJsOEd6VWoyVDJPMEg1T0lhZnRQbDZneDkz?=
 =?utf-8?B?NkRSeVFMV1EwQ2xkUS9CR3NLeWhqTFEvS3pYTDZyMWZ4THZrRmFrc0JQTm96?=
 =?utf-8?B?ME5BR3RBZ0hobzNXU0NWVGZQNjB6NUNod1ljaTN2STRKQ09NWVRYa1l1VkRw?=
 =?utf-8?B?bzZVZU9mVktDRVBKbmo5WWgrMU4wZ0ZscEZvQ0VybFNxZkI4SWpGU1JKME5D?=
 =?utf-8?B?R1U2UXVpTERCdEtnYjl1YkVXZi9RaWpySklBdUpSQk80bEtOS2J6RWQvTC9P?=
 =?utf-8?B?RElNc04rNmZnM25NdEU0UFZIaEg2VzkzNzFTTmdUMFRVWDJUeU0rR3ZKb0Q4?=
 =?utf-8?B?a1Fna0cvTGFlckRFTEVOejltZSsvYmpqaTFKbUV2Nlc4SmlweDRkaXVlNXJ2?=
 =?utf-8?B?WjZCV3ZTMjhWVTZRWC9Ka0hQZmZvcG4wN1BvbElIbS9ueW9lWlBUUitXMnlX?=
 =?utf-8?B?TXdSbEFpNnJkczgrK2pYelllcTR0TUFRQmtTVTBkeWNmR01sQTVZUXd4UVcr?=
 =?utf-8?B?RXhkYU1qMzBTQ3QxaHNibllidk9PNkhWYXVuNEM2VTN6WGlrcWU5WnN4VnpC?=
 =?utf-8?B?LzBWNlJrUWJuTEVQa25RNTZhN0ZIQ0hQWHZ2T3YzeVRnVVQvMkJRWDVnM0cw?=
 =?utf-8?B?aVFMa0NVQXlsb1hLMTl6TzFwY0RqWWRuZHlHOUpPZ0t1RVA1ZGRkN3FEbTJO?=
 =?utf-8?B?WldlUWhxWE9rb01JdnAyWGdNa2RabVAxa2dkY1I1OWptakNlTGlqY214aG1Y?=
 =?utf-8?B?TU1iNHdPOWdNYlhwUlp3R0FPTktmRmYxd01CSzl0OEsyZGtXTWRZemZCVjFI?=
 =?utf-8?B?REM0MklSTE55SGtwd3hzK3gxNUJlTDlRTDdiandrd1VOc3B2encxODRzWUVW?=
 =?utf-8?B?b3lqQ3puc3I3NnljWDIvS3VGNTVGUzlGZmxDUlM1U3U2RjFtNmowMmRMTGh2?=
 =?utf-8?B?bjIzcnBReGxwTjZuNVdCbENCQytZanozdjQyaHlKQi9FdU4wQUt2bkFFRU0r?=
 =?utf-8?B?NHVuWjkzYWRVbXZCY2pNR1FVUEZ4cjJxWDBOcHhhNjRUcFhpSUhZZ0lWeUdx?=
 =?utf-8?B?eStSbGtUZDB5RHFUdHYxU2pKNnBwcjFTbDgzL1d1VlRaUFhKRU10cGlZQTls?=
 =?utf-8?B?MGQyQktvL2Y2djY3VUVGcU9yVTF5d0JORlhuY2FRK3MzTEZaelIyV1N6Z0R4?=
 =?utf-8?B?MmdsVlhMaGxURDI4am9UY1JhdFo2TEZsZ3FKWGFYdm00RmlGdWlPOFZQN1JQ?=
 =?utf-8?B?UzJWVWVqZDJFUTVVdlRISFpRZXlPZDVtSFFHa2FkTmFjWkxEeGlVcnk3TkN3?=
 =?utf-8?B?UVNHVkpicUw5UjlBc1QwSFE1VldRZ1psZzFMMWNMTm1pQyt5NFczTmwySDVx?=
 =?utf-8?B?enBkS3Q5bHRiUGwyZW16UnVuT3RsSE82TGVTQ1Q5MU0vUnV3cmRLMXZSdDBN?=
 =?utf-8?B?T0dFaUxISE5haDNKNENMRGhKaXBDRjcvOFc3d2J6azkyZ3pBQUhYVzNOeVhJ?=
 =?utf-8?B?TVV0RGlEb0pxaGZSeG5ub3FpTm94ZVNMVWFSQXJobmwzczhPY2ZPYlZxZGRj?=
 =?utf-8?B?MUhTU2ZycEYwTkVJSHRyN2pMaEFvNWgvU0RGU0I1RkhiMGc2bzU5cEZjTWxu?=
 =?utf-8?B?NmdZd2crTnR0NWgrczQ5NDBYaDQyMExFdXcxMmNUUVAxbjlPaHhLbGFWVDIv?=
 =?utf-8?B?NkNUV3ZBMFpNVmIrN2pBeGJnaWh6aEdlM0V5dkE5TjUxNjAreXJOM0lOVUE3?=
 =?utf-8?B?dytDWm1TZ09YTUR6Rmk5WkxBb0FtUW11NGdpblppNU1IQXVVcEZLc0tZOSta?=
 =?utf-8?B?RWQwMGxEYlZ3ODFmUWdRc2xYYnZVbXpYUjUrMXhHYWZTdVZXR2VUMHVqcGlR?=
 =?utf-8?B?WVVOYU16RzNHa1IwUDErWkVvZkNrTnNEUnJ6RjVHc1RUaS8ranZCelFTa3BG?=
 =?utf-8?B?b2YzalR2OWxBNTUyLzF4d1ppb1k5Umg4QXMwTGwyUXE5TWIyR0F0SFIxK3Ri?=
 =?utf-8?B?YjNVQ2ZDZ29PZXpkWkRKM09mS2JwZStiaDk1T1VpRDlPYkpNbnVIS2dXSDFD?=
 =?utf-8?Q?EmXsoWpNaGQ/M0Mo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d5108b-0aab-4973-5ff2-08de725a2b52
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB7981.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2026 21:34:33.4144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UjZe5+IgfmBfsjEhCCwCwHnQpqkLcObBxZQUTegFzf+oc9eCFpp7PA4JcztYEkFF/ORee9f4rr6z2tcP1GqmCZfraLQz8iBl9Bv8J7ur5AI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7841
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Bh2qrJgY2lVgZF1qD3f5KMnlQfUXr8FV
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699b766b cx=c_pps
 a=NeHo0b9PnFRHZsaa1SN7PQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=p9owEOcsLqIPjQwqjccA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: t3JVeWQUxXxcp9H46V7af9wKavUx2MO7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIyMDIwNyBTYWx0ZWRfX5PPwI+E8mKmv
 h3sd561sYq0YD5aVaweNgpy52aqX1uAIA36JfwpxNlegJcNe9kFGTy62UjpKiChfxg9XPg4Qlvp
 jqQEUv+MeYS4ewz0Sctrb1+ocw+1/oivr0Ab5cv+g7xUIiisqat9DIPYZbqVJhtwa5zkpH9nd/6
 IaVtHH7reaPc7BOidbCIVT8Kn0qa1vh2F+Hdup9KN96KaDNN12oCkMZ4/P9Tk71j7MnNnieErLP
 E9Kph1wuNukPOWCN1X6fMjQfuU4Bg/9RUJ9NyD1SvJx9DKKgnHjJNNYMNJZ94ARK1aVQiSxchgQ
 eHJBLgTowuB7tsI0uXZ1Whcohc1tBMsd/97YVc3riY4+Odhyd0iYPrfR/yHFSQ8LFs/ibOo8CUk
 HrwPALE+NmBeotDz70q+8TbtU01WBubqG3kCbI6dajXifZwqjCyP6XqxlcvMO8JlY3Jc+sxyI5J
 mgq2pewnp7c4vjDwaYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-22_05,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602220207
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 21:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231640



On 2/21/26 23:48, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> On Wed Feb 11, 2026 at 2:11 PM CET, Daniel via lists.openembedded.org Dragomir wrote:
>> When wic is used in standalone mode, it relies on host tools such as
>> debugfs. For directory host->image copies into ext* partitions, wic
>> uses scripted debugfs "-f" input with multiple mkdir/write commands.
>>
>> Older host debugfs versions (< 1.46.5) may behave unreliably in this
>> mode and can silently miss files. This does not affect builds using
>> debugfs from OE where the version is known to be sufficiently new.
>>
>> Add a debugfs version check and emit an error when an older host
>> debugfs is detected. The error is shown once per run and halts execution.
>>
>> Changes in v2:
>> - adjust the last working debugfs version to 1.46.5
>>
>> Changes in v3:
>> - switch debugfs check from warning to error
> 
> Hello,
> 
> We missed it during review and this patch has now merge with a minor
> problem: the "Changes in" notes are part of the merged commit message.
> While precious during review and patch iteration, this info is not
> useful once the patch has merged.
> 
> For the next patches, please put these notes below the "---" line. This
> will prevent them to appear in the final merged commit.
> 
> Thanks!

I understand. Sorry about that.
I'll add the notes correctly next time.

Daniel

>>
>> Signed-off-by: Daniel Dragomir <daniel.dragomir@windriver.com>
>> ---
>>   scripts/lib/wic/engine.py | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
>> index 565a0db38a..8ca8ed0dbd 100644
>> --- a/scripts/lib/wic/engine.py
>> +++ b/scripts/lib/wic/engine.py
>> @@ -220,6 +220,34 @@ def wic_list(args, scripts_path):
>>
>>       return False
>>
>> +_DEBUGFS_VERSION = None
>> +
>> +def debugfs_version_check(debugfs_path, min_ver=(1, 46, 5)):
>> +    global _DEBUGFS_VERSION
>> +
>> +    if _DEBUGFS_VERSION is None:
>> +        out = ""
>> +        for flag in ("-V", "-v"):
>> +            try:
>> +                out = exec_cmd(f"{debugfs_path} {flag}")
>> +                break
>> +            except Exception:
>> +                continue
>> +
>> +        import re
>> +        m = re.search(r"(\d+)\.(\d+)\.(\d+)", out or "")
>> +        _DEBUGFS_VERSION = tuple(map(int, m.groups())) if m else None
>> +
>> +    ver = _DEBUGFS_VERSION
>> +
>> +    if ver is not None and ver < min_ver:
>> +        raise WicError(
>> +            "Sorry, debugfs 1.46.5 or later is required for this script. "
>> +            "Older versions of debugfs can make directory copies into ext* partitions "
>> +            "via scripted debugfs (-f) unreliable or broken. Detected version: %s"
>> +            % (".".join(map(str, ver)) if ver else "unknown")
>> +        )
>> +
>>
>>   class Disk:
>>       def __init__(self, imagepath, native_sysroot, fstypes=('fat', 'ext')):
>> @@ -334,6 +362,7 @@ class Disk:
>>           if self.partitions[pnum].fstype.startswith('ext'):
>>               if isinstance(src, str): # host to image case
>>                   if os.path.isdir(src):
>> +                    debugfs_version_check(self.debugfs)
>>                       base = os.path.abspath(src)
>>                       base_parent = os.path.dirname(base)
>>                       cmds = []
> 
> 
> --
> Yoann Congal
> Smile ECS
> 

