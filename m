Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECA4E9E2EE
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 11:48:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17225.1770810484195827315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 03:48:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=mTpp2wwZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=650237d055=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B5JpXm4165743
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 03:48:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=PcpKbxskFE6bFKNpD2KExu4C0WdQh9qdvtPGQzNlUrs=; b=
	mTpp2wwZAXAR/46NZCZKWqHJOm2BU6fc1rX9FiAzgL7I4NMITtj8MitygejXuCYN
	5WFgMiV8jZaABh6MllcF5/pZrE6AXUbBzrVq2eoEJxYNnyOX6lSDwlXEf6BtHSzN
	9CovEJG+cPWixYXqkmqMh2GzFaJsqdYbo2GdFBgsXHBqtFyNPzCChXOqEBZCyOgX
	79PJdteGDdBUr8TIzwb8ZKn3cgCd1noruLbGW2MhFP42bmdvOVR2N6tSiPjFgVwR
	WR6NcHh8UzGXVQwH/vqDvOOSX9TuFe2ES98Yk2xYv8YMSv98QRDbunRc8eIw/FL4
	Cd8AUvujVGFB2PXZ8RYINQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c61j4vd2r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 03:48:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToGU9QqnXHb8vxBIVBGKJ5HdIRo73Wjs6RMWBJuYJSLYnqjvLiRunJQZcYoyhoXaRae7zlILfALuKm1deAcmb+EWU7451l/nAkVWJWCbS+rwZmwS7Q1T0MYnfYCXXJsyKFvFPjD8GF3OjcuFeEcK6wmr/JM/2cBHYCHhY4HnuOzMAlRjvOJcKFkiWWWTAKXjN/0Vj05DeXH+3qcVAJsLn/Zm1b9nzmcijaukPF+CHXGdrJTAyVvaoq5BF9CsHi7cPNPpbXcprJYpaG3UwA56eATMIAjimcd9Ya+4vGxb07ykH50NJrBwOzp0ASoQUjqD+lkVG7VfsV0f57lLw41wGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcpKbxskFE6bFKNpD2KExu4C0WdQh9qdvtPGQzNlUrs=;
 b=ge2s1zrFMFHI0FTebSb+hTYxlpqDEc5U+Z5PMfreoHkqUkyzbYj86pR5BCHe0/6AbvvxeryrJX9VIHepHFVzwUhYYohc3qPGYYobX7wA0FPW2HmDEPx6/Tve65J8Sk2xwFqhaHA/mQdLqJgVTy3apyA+nC1aLPET1Gb4D0rEfYe+CiBMRyjrsf/jPaevOsjqnK4RZtaj07k7enJcvG/L3cgbSpvv12LY7Kqdg+NpvVbHwGJGLQmxCWhzZqe2hXAlK2KdzLp6NF3GBze7SoFmGLSdN6UJ/JoXhgknbKKr7dEiCMNyXSCIwhbXGq063wrCISDy540bd9sHBq6L4HI9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 11:48:00 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9587.013; Wed, 11 Feb 2026
 11:48:00 +0000
Message-ID: <92f80f63-5663-40b2-99c6-09b04a6d0c7b@windriver.com>
Date: Wed, 11 Feb 2026 17:17:50 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v5 07/15] kernel-yocto.bbclass: Disable ccache
 when rust-kernel is enabled
To: Yoann Congal <yoann.congal@smile.fr>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org,
        Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        alistair.francis@wdc.com, bruce.ashfield@gmail.com,
        elmehdi.younes@smile.fr
References: <20260129163910.2612040-1-Harish.Sadineni@windriver.com>
 <20260129163910.2612040-8-Harish.Sadineni@windriver.com>
 <8a9cf281b36ede03135fb042e260d22785ed4f38.camel@pbarker.dev>
 <DG66GUA3GH4D.31PC9MVWLCK32@smile.fr>
 <1cd94533d438ad4e689da8636bae06859778ef29.camel@linuxfoundation.org>
 <CAMSfU+4dKa6adoEtKSWp7Q-ZhT9L4ohtbruSZZPeb1_SxkpHEA@mail.gmail.com>
 <DGBDWWXW2P0E.29TSC8ICL6TPO@smile.fr>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <DGBDWWXW2P0E.29TSC8ICL6TPO@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: MA5PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e598437-265f-4dcc-dc9a-08de696367b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OHBLSDdoK1hySUFMbXA0QTZOVVBjRHNjeE40TzRDUkxkMTBtNnJmNEx6dDQr?=
 =?utf-8?B?RTlETVR3MFNOLzYvRk1QU01zMzBXdUVoS0ZsWVk3aFMxbmRDUFp0cG1JR1RC?=
 =?utf-8?B?OE0zTm56dExZaEhyUFdhSzY0bG9PZXQydVhnWlBOZU4vSTRNTlRnY3VBQ1E1?=
 =?utf-8?B?dUFiVkVnWGFhQ1h3N2ZOTU4vcytPN1JRNVJzYk5neDZuM0I1MzBEbFA0MXRC?=
 =?utf-8?B?QkNId3BZM09ON0pKaGVxZ0d1NExDdVI3S0U0R1pSUmtkVWJPMGcvdXY3OXZU?=
 =?utf-8?B?UXRKZnFIQ2U2eVFpcEJlM3V0TDI1Y3ZDaGRIalJUYk9pcDhvb0RkamVDZXJU?=
 =?utf-8?B?Sy9BaW5Bc3lsN29xa3ZaQzFhUlZOWkF0Z2l2anM1YmJXci9xUmo5S25USSt0?=
 =?utf-8?B?TDQwVlhGM2V4MUVZbElFUnJtQldhVnd4N21FSnpxTlBTL0xSSDdQRVF6RURQ?=
 =?utf-8?B?VTZaUUFteWdLaE9GZ2x1TG1jN3pDSWNlM3ZwNUF3Yno3RlN3MHc2NjRhdmJy?=
 =?utf-8?B?d3U4c2ZtV3JVZDVkSVZjTmRuVFBiWnVzSldtbVYwM00vKy8zZXFLeXFNTTdy?=
 =?utf-8?B?NXRIUEtPeHJjcHdTNUdzaGRWT214ZkpOMWhiYmZjalhXQWpTMjRWb05TS01y?=
 =?utf-8?B?ajgxa01QWFNYSjh5RVB1MGthd2IzTjJudDdPeTRlRmlWY3B2R1RTSzJ0aXgy?=
 =?utf-8?B?cGovSVc2TDBtejcycGZ0QzV0eFFYN2VUakxHczFiL29FUU4vN2toZm90K05Q?=
 =?utf-8?B?SzdmLzc3OWdybXBMQ0FjaFVqTFVjalBIL3FwM2FpNzh4Z3JFSk5mVzJNR2Zl?=
 =?utf-8?B?dVhQTnJuSUxndmx4RzFYSzZRaDlQcEJ1cWZCcnQ3OFdlbmswcGtSYXl0Qm5z?=
 =?utf-8?B?UXZ5alo1TWlBdDZneHNrQ29XL1NheGE0T1lHelRuTHNzeXAyWk5XaGhFc0JW?=
 =?utf-8?B?N1gzbG4yT0d2Nk1mdjdnbmdVZ2NMTFB4VjdMSnYrTmdZUjhwaWVaNEFiK2NM?=
 =?utf-8?B?OTEzd1J4VS9yTHVpQUZ2dFp3Zmh2T2F6dHZkbDN0VnVwdDBnSkxIM0JMbC8v?=
 =?utf-8?B?MENqRVFTNURmelBUbGg2Nmx3WEV0TU5RVnFNcWJMWEFMUU1KWGhZQVpzZEpq?=
 =?utf-8?B?STdTVXYrL0MxSHhOZE4zdlJPOTdrdmdVVjh0MStzcWZqeGxoblROMDk2VXFL?=
 =?utf-8?B?b2RDVkh5cjE1Yndid3AyWFE3OERFS0NTdEg3Z21PbXZzQ0Uzbi9zeGxkQjdr?=
 =?utf-8?B?Q3ZFaUdFUXg2YWNnVDRPN3lzVVYybUY2dVJua0VXM1NFN0NKWkg3d3cvNkFI?=
 =?utf-8?B?eENZd2RFM2lEUW9TaUFmZUNMdG5JS25CT1h5UkV6UDRua296TUZYNUFVdWpI?=
 =?utf-8?B?eFlYVUhuRzFpb252cG1VajRvN1RhZWlyakJPbnFJSkdkU3JUTEo1NjlYL2sy?=
 =?utf-8?B?eGQ5ZFNOYzU2UEpncFZueG9pNm9WUytTUDNVOU9ha3VDVHpYM2FWWUc5cTIy?=
 =?utf-8?B?aE1HalRsNk5aM2YxZjQzc0phMEhZN2dxaldUY0YxaDg5ODRQVWcvVGh1Q3Zs?=
 =?utf-8?B?YkIxdUtYVGpLOFVENkZEYXlaNW1IUkVRWDljVnk2R2lhTXNob250VmhzUGdD?=
 =?utf-8?B?T0w0UWo5NkVMTkNwVCtMSUZXandyYTRGTUJ1ZU11T2lXdXhoUDlNMDB1UzVt?=
 =?utf-8?B?V3dCeE95L1dxUWtYK2tYZWd0SW5rVENDWFZRR1YyaHhEN2xkSDJVUlV5cFox?=
 =?utf-8?B?ZDJmU2M1dGExaDdBUXd1M2k4bUlZL2QvM3M1a2l5Tm5hMktET1l5YWZ1alpl?=
 =?utf-8?B?ZU1McVQ5UWRrV2NjVnpWdytpbjVqZ3BvMWh3YStpRVVFY2lqbEQrKzZBemNR?=
 =?utf-8?B?YWpWWkN2SUwwYXpqUVJzOWs3U1JaMHFsSzVEejZGVGg2MVFCeEFWMTk2REor?=
 =?utf-8?B?ZXJsUGlLM1QreVVaa285QWpQUUpiaktBSzJsMy9URFhGVzNCTC9QNUVqYUk3?=
 =?utf-8?B?dHBwaGFHT01LMkxSbS96ZStjR0xzbnY4OGh3Tk9DaDh1SWpLQ0dPRFpWeWpt?=
 =?utf-8?B?Z2U2c0Vpa3ZsNWMvNUgwREtrUWtvbTJIR2ZwTHNCbWV4VXlwajNiRkpMZUs4?=
 =?utf-8?Q?C9WgeSoFRQL3gQO+oSKZn8UWr?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SlRLbUx6OUtuLzR4R1dLeWJJamdMVjVOZjJjK1MxUW51UU8xM21ad3lSQnFG?=
 =?utf-8?B?aVcrVXZCcnl6d082NHFGQS9aNEJ3QmEyQVhwdjRFRllaM3licW1NT0RpZy9s?=
 =?utf-8?B?eWJlN3ZXOWErSFMvVCtwaHB5MXZGRnlobk5jR3E5QjZya1M4d3k0NUN0ZVlV?=
 =?utf-8?B?MjdvWk1xWjBDTW9JREZldENsQzhlZEZIV0JTVkhnODllUGh2clNoN1Ayendj?=
 =?utf-8?B?NlN4UlZINHUzTmZYMFVabVAyTitHYTFpZ2oyeElKeWZKcHVhTHc4R294Ty9a?=
 =?utf-8?B?emduRE96TURDUnFwYjZScDhLWUFCckVwU1NUcElHWmlwaXpZRmlwd1E0cTlQ?=
 =?utf-8?B?ck5RRWVsR0U2Y1BtZy9TUG9ZNlZyQit2UCt0LzV3cWh4VG1BVXhyZXduQkRk?=
 =?utf-8?B?RzhMZURDVGYvZ3J1L2RreGpXYzlMY1BLWEpFMDdkK0VkMWpKbUZvY2FXTi9h?=
 =?utf-8?B?YkpnSld1eUxGRkJ5cncvTS9vME5WOU04UXgvaittMy9tUnRUSytnZjh1dm1D?=
 =?utf-8?B?NmRIREQ4KzFzaXdWY3E1WmJkMjRxVlBWTXJSZVU2TXA5ZjNqRjJSclN4QXhF?=
 =?utf-8?B?b2toNXZBbFNidEF5Q0g0K21zNXBkQmQ3UDR1WjNUZ1I4ZDc1R2RyQVlrWG1r?=
 =?utf-8?B?MUFFalZWdmp4Skc0UzlWQnl3M0plQWZCb2ZySGtyTE44V0ZieHpqbWlwcy9E?=
 =?utf-8?B?SUtYSUVUWFUveDh0QVpENmt0Skk4d2ZrWnBJVFJSajFNWEFEMmZTRUV0ZWJp?=
 =?utf-8?B?SnBacnNqcS9yTWVjKzhMelVZMDVEaExyL05nems4b0tZd0JXZ25hb2xiNnlI?=
 =?utf-8?B?WTFDcmhKcXhGY3pxSlJhekVBdFBrMDN4YmN4RkNVb0w5RCt3QXoxUngwQ1pC?=
 =?utf-8?B?aHRKWlBkVUpyZkhRM3hLRzBFWmU1dnVWZ3NMaFJqbC93SmJHZUYvRzN0ZzlS?=
 =?utf-8?B?V0w1cll6M0R5VTRsRklPV3ZiRlBSYkVWVDhUMWtReXMvYXJreW90MUpIY1h3?=
 =?utf-8?B?eEZ5eVNpWXRJUUhEOGZ4a296OVZKalZVTDFqVmlVRytsMWZ1eU5NZ0dQME5s?=
 =?utf-8?B?UTBXMVIyRTdxTk94Z09xUzJPTXRWQVIweldRUXVjL01HNnhEeFRmRlBPZ25O?=
 =?utf-8?B?cDlnWERNVVFFQ3VmSFNsRk5iTmI5V25NUGhXK2xLRnFCTUFOeDQySmRKUWZm?=
 =?utf-8?B?MHF4SWkwSCtjQ2w3Q25VMzduUmNQMWhBb3kraXpGbVJLeThjcEhBVG9yUXc1?=
 =?utf-8?B?S2VXaW4rSGxsTE8yZndFUUFXcjB2RDhyaGU5OVZzMkZZQndMSmNzZzhyWHZ2?=
 =?utf-8?B?azBEVmtES3B1KzVVM1hwcnJublJJMENkRi9NbVhHNUdlZ0xYaWxxWDJYREpZ?=
 =?utf-8?B?dU5zRHo0NTcvQ3FBamRQM0FRalI5OEY1U3RLNU9rSkkvZHg1dVVjRkZ0MXFH?=
 =?utf-8?B?RnRxdWFmZlppSEFvd0NxczJBbFBkdGw4eExGQVh4akphWDErSTE1ZnI3VzZR?=
 =?utf-8?B?QlJ1STNaeWk5dmFTcWhWSlowK3V2YkxjVm4zQUxsU0QxVThSMVBpSlRHVlFj?=
 =?utf-8?B?YkpjaFZVRloyczdHRFQwOFoxOFdkYVV6ZFAxOHFuSkNZSUsxTWtQZlV1T1hJ?=
 =?utf-8?B?dmJnbGJzNG02SU96Zy9tN3p0b2Z3OUlZc01RU0dDbGJkVE9pLzB4bUNsVjVk?=
 =?utf-8?B?blozVWdRY2Zld012dHdpU2tsQlVyS1lDY3FnZ0hTUUx2aDZWYVJWV1NjbHk3?=
 =?utf-8?B?Z3VHSUpmWE1WNHlaMG50VGMrRTczTUEvNEYzOXFScm9Sd1ZRNlJBU1BhYysw?=
 =?utf-8?B?WXRSWFZOU0RtMUVNY3RySUcxdXNMazdVUjQxS1dVRE9pT3hibmlHUGYwVFd5?=
 =?utf-8?B?dnJ3eGZaeHNVOW8wdUVLRTBQY2Yyc2dJS3d4WlJ5UHcvOTdjNzRmYlYyVjY2?=
 =?utf-8?B?dUZ5RjZwT1NiKzg1SkxiSjd6SWtXaGM0SWg5N0czVjhGZTRMNUlPWWptRWht?=
 =?utf-8?B?UjlMaDZTRHdhMzU1ekEwVXJYSjFPdzFrZ2h0cDBVaUYzYXdMTVhqVE9wbUZT?=
 =?utf-8?B?bzREbGJpQ3VCamtBRDZlb3dZTG43bkRaci9MVnRWKythUHVkNlpOaTZYblV5?=
 =?utf-8?B?anY1aWU1QWxMb24vMlo2bUtDKzdXeGo2T2tEUGRhbnh6MFp0Ty9nNHdqVUpq?=
 =?utf-8?B?cEU0MXJQRE9YTlVzbUY2a1Y5TGtZZzcrRFFmSXVGMDYxRXhxcUtvcE4wZWs4?=
 =?utf-8?B?QldNNFhlaSt3ak9xcm5NajFxWnVlMElWQ2J4b05nZXQ4TGszU0RGSXV0Z2Jz?=
 =?utf-8?B?bGtRQW53MzMyS2tCOFZqM0NLYVVCODkxSXlySjhDRGt6b0lDV01MeG1KYk5Y?=
 =?utf-8?Q?y0w9Jkgimns45I/E=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e598437-265f-4dcc-dc9a-08de696367b5
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:47:59.9018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIC7uIcL8T38pHasAPaLUZH6fcaRJsDaryAKrI0B/swMWu+MtKK22cn+solDQjZRywjk2gh8QkGe96ul+h3dm6xAUfpHPGTQdXwu/CoW7r0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Wb0BqkhX c=1 sm=1 tr=0 ts=698c6c73 cx=c_pps
 a=H9d2Io+6O/etw3jU54J+0Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8 a=ag1SF4gXAAAA:8
 a=t7CeM3EgAAAA:8 a=9Oca0kpIS6b8AbWxs6wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: HeABqLp6jjiBwtJw9jl_jAX59Z31o_VB
X-Proofpoint-GUID: Nytyc8olpRxKv001Us1u7ZH-g7z0UiuV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA5MiBTYWx0ZWRfX0Y9JjyBWBkKD
 iBVTcUvxMyEs0laR7Zpqo603YlRQkC7FGb35nWUV9MOQcf6JK5Ps1TpEuxCiQ9JXYIjHs40vObZ
 +KR6qpWAGNjnZTEy+eSxxGEu4fePRUFijgEM/lVlmm4HKv83AfO+OEHNqELY8NJhK8GzwSrV7LD
 SqYvNv+yBCAndMdS3hOTKJxj9A02abUUXn5yPw5HoHJgmB6aF8OPMIk/u1PaaCXXoLfes9zm/Vh
 xjTDXOqArgsb44Mzant2tXCqA6gCY7cE2cWqrbn+nA494MMswYcXapBm/HTkxRM4R3uVf047ch3
 SYWvJfmE9ZjfqfTZu1JQRtlvxiVZtyxwCPUeRPpKM9+2sPmbef0G2U+M1SApfgD+fYg44J1UNcx
 XbYDLSMalbrOr/WThdGgLpza6d4x4/Lja85ugjGZm/cjtWFveWbAvtt2ZnO9TMUi7Q6HCDPEx3b
 JMTZ8huxLTruT7rH/Lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110092
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 61B5JpXm4165743
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 11:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230979


On 2/10/2026 8:54 PM, Yoann Congal wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Wed Feb 4, 2026 at 2:07 PM CET, Yoann Congal wrote:
>> Le mer. 4 f=C3=A9vr. 2026 =C3=A0 13:34, Richard Purdie <
>> richard.purdie@linuxfoundation.org> a =C3=A9crit :
>>
>>> On Wed, 2026-02-04 at 13:31 +0100, Yoann Congal wrote:
>>>> On Wed Feb 4, 2026 at 1:05 PM CET, Paul Barker wrote:
>>>>> On Thu, 2026-01-29 at 08:39 -0800, Sadineni, Harish via
>>>>> lists.openembedded.org wrote:
>>>>>> From: Yoann Congal <yoann.congal@smile.fr>
>>>>>>
>>>>>> Currently, a ccache enabled build fails with:
>>>>>>    |   HOSTRUSTC scripts/generate_rust_target
>>>>>>    |   HOSTCC  scripts/kallsyms
>>>>>>    |   HOSTCC  scripts/sorttable
>>>>>>    |   HOSTCC  scripts/asn1_compiler
>>>>>>    |   TOUCH   include/generated/gcc-plugins.h
>>>>>>    |   DESCEND objtool
>>>>>>    | error: multiple input filenames provided (first two filenames
>>> are gcc and
>>> .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_ta=
rget.rs)
>>>>>> when using ccache, value of "HOSTCC=3Dcache gcc" when this value i=
s
>>> passing
>>>>>> to rustc, It is thinking gcc is a input file. when ccache is not
>>> used "HOSTCC=3Dgcc" is passed.
>>>>>> Disable ccache for kernel build if rust-kernel is enabled to
>>> workaround
>>>>>> this.
>>>>>>
>>>>>> Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
>>>>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>>>>>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>>>>> This patch is good, but we should try to get the issue resolved
>>> upstream
>>>>> if we can so that ccache can be used.
>>>>>
>>>>> Has this been reported upstream yet? Could you also open a bug in o=
ur
>>>>> bugzilla to track this?
>>>> Hello,
>>>>
>>>> For context, a lengthy discussion happened on this patch here:
>>>>
>>> https://lore.kernel.org/openembedded-core/CA+TGqK9Yd2WWKrhMkhofF-8N0c=
ESCSefWD2DXr4sBO9fDQXyrg@mail.gmail.com/t/#u
>>>> And, sadly, we lack resources at the moment on our side to follow-up=
 on
>>> this :-/
>>>
>>> Putting some links alongside this to more details would probably at
>>> least help a bit, particularly if ccache upstream documents it is
>>> imcompatible with rust...
>>>
>> Ok, I'll send a more documented patch to Harish for him to integrate i=
n his
>> next iteration.
> I pushed a branch on contrib (v5 + this commit modified)
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dycongal=
/kernel-rust
>
> The modified commit is:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dycon=
gal/kernel-rust&id=3D794bdad82933ee112452c8c08c917cf235e07ada
>
> Harish, are you OK taking this for your next iteration?
Yes, I'm=C2=A0 fine with this.

Thanks
Harish
>
> Regards,
> --
> Yoann Congal
> Smile ECS
>

