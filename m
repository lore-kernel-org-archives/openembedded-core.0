Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E3DC25B74
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 15:57:19 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.69])
 by mx.groups.io with SMTP id smtpd.web10.17797.1715875037376885930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 08:57:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kkKEc9q0;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=kkKEc9q0;
 spf=pass (domain: arm.com, ip: 40.107.241.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Jbx+qJ39YKkavO+DB4Sclwo8CbK3UMTl2p5Dx5OmnpButaKttIA9C3AlvJpTMeXlsM6D/5EYgt2bTyCu19ou+fqCkHIDqQXNXA06CFwUjz723es/Ie7A+f2s8MPDPWr87btDx89eUZdoLJxjlD8iohiscgWpqWwoEyUBPZvCgcnkxbqaTwniQCE20ztxe2qo0/hhXBGAT/SHVNyaNZlSHQLFfYxZwZs+5Ou2DnQGutLc4Ob82xC94BUYBxnUFgY4fiH47vRMYQsYX5k38ShAQYo4anDeOe8JWHgGUBIM94OgPbnec9hniqifjwxECZ9sqV9lIE0X2E6/+wB99ZKLcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAm/7s9GUMMflULHsNhgayj7lcNcRFEH8OrGDq0wBUw=;
 b=QkRdHUf1GmLvytIo0h3jjuPllD9+mdRwewpd0DLQD5sWQx8hwxbABpMYaRNzOtRMkXKF5q4aitxhgJWp7oA2yf+FVE0g1n8hFdWJj8ncxtZhZJniCBmX0Bm/KEACJJ8I4jmceaxe9bRaI++tQFnyuXehycDn+CqVQvr8OkuDNuEPF2evZ2eL5D2SHLoyWy/1j86C/FTn6Eyy2cPi5fMPaLZN81HoAWKw1I3lJ+Ggu26RbFpbjr0X6UwCRPBERk9Hdb1qmcPEKMOdOVcXnsGG4vzGS3dYPg3te6NmaYiVV6jhLG4NWtsCHfxOGkCi3XUCFMc6KwMoaYYLmgSGjyMM9w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAm/7s9GUMMflULHsNhgayj7lcNcRFEH8OrGDq0wBUw=;
 b=kkKEc9q0PHPH7iAWAsJcGaQVps0Fe0cMTF1xnMTTcwQe+jPfvsRrlBiF/9JD0ZGfvLRgg+lVQoQyHUf78dGgz0lw5/h+gHOLSn1QP1Hete0ZrlzMacj7CREbhzGdsq296QVuG/0L8PoZhw7ahaDkMoKBTuigNBRH7QxGQyjIkwk=
Received: from AS9PR06CA0718.eurprd06.prod.outlook.com (2603:10a6:20b:49f::33)
 by GVXPR08MB7872.eurprd08.prod.outlook.com (2603:10a6:150:16::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 15:57:12 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:49f:cafe::8c) by AS9PR06CA0718.outlook.office365.com
 (2603:10a6:20b:49f::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Thu, 16 May 2024 15:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7587.21
 via Frontend Transport; Thu, 16 May 2024 15:57:10 +0000
Received: ("Tessian outbound 85e363419cbe:v315"); Thu, 16 May 2024 15:57:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc2898ddcc6028f6
X-CR-MTA-TID: 64aa7808
Received: from ba56c1942fe2.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4C57A00E-7B9C-43A3-AF27-CBC931C1B9FF.1;
	Thu, 16 May 2024 15:57:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba56c1942fe2.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 May 2024 15:57:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8h5UlVKFS2vKqT+TfIE9ELpW6i1IPqxgWwz/mIeRnOJ3v0R2JdmlthhXB6PPywS90Hrv64pICLp7g79VTR7bHwA9Bw8L29KeqH8c5W83Jf25GsoHOdtI475VFZUEwzX8yGwOxzQ/JvVAPnu2NCiqsvFp9Q9DIaIxPlb9ekcS/WLNxsx2uBJk/e6+OEkX5qD3yHopkqydDE/OHKLtQy3dw/wkBa+OReIfMRKLgiUH+Cq0L0pyzoMMXxorywOVJAuJ2CvPKwloUR0Ol1YjgUkHc6wyRBy4+fJeRf2E/TFApQiJAvE+xJbvpvQE/HQdAZkoHdknl88jMECLB/WHrqj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAm/7s9GUMMflULHsNhgayj7lcNcRFEH8OrGDq0wBUw=;
 b=K6fsGhoigcAIJkElyvsjsCINshMjvv8ZOhZF3T/PzjEKAeflqxIHIG1efR/J6ik+SRvQ7As1vrwNIvidQ/j2JuD+VmnUCkL0MKLM4enmMnUZ97p/jg+AHGSU2okWbon6eHC1NGPXNUJEie7rfMqUmgjJLnaGVwI9x7TUq2J55z5TJLGKJV4K44j7qQX8MNuE/m1MoSr26OhDxVGI/P9o6O4Ep5+lR4dneak2orZ9NeVZLQZdpmYKdaqxiLmMI700mb1e4khBxJx+xlqe9lqcgpcb5kjZ0Z/qyKp4mkXeDqWwTWH2Ximk7pQpWfFNw19eKlkXbdI8lQc0an9KJwN6+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAm/7s9GUMMflULHsNhgayj7lcNcRFEH8OrGDq0wBUw=;
 b=kkKEc9q0PHPH7iAWAsJcGaQVps0Fe0cMTF1xnMTTcwQe+jPfvsRrlBiF/9JD0ZGfvLRgg+lVQoQyHUf78dGgz0lw5/h+gHOLSn1QP1Hete0ZrlzMacj7CREbhzGdsq296QVuG/0L8PoZhw7ahaDkMoKBTuigNBRH7QxGQyjIkwk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8583.eurprd08.prod.outlook.com (2603:10a6:150:bc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 15:57:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 15:57:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] iso/live/hddimg images, cdrecord, burnia, the future
Thread-Topic: [OE-core] iso/live/hddimg images, cdrecord, burnia, the future
Thread-Index: AQHap5eP+05eFwzQbECQefhbUOOJALGaA0eAgAAA3wA=
Date: Thu, 16 May 2024 15:57:01 +0000
Message-ID: <A16B8D9F-CE5F-41A9-89A8-F819F684B7BF@arm.com>
References: <005A0B7B-2F65-4997-88B2-BDD86FC2970E@arm.com>
 <d31ffb101aede9f36ecf42e4de452377fdf2eaf3.camel@linuxfoundation.org>
In-Reply-To: 
 <d31ffb101aede9f36ecf42e4de452377fdf2eaf3.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8583:EE_|AM1PEPF000252E1:EE_|GVXPR08MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: c09fd294-d1e0-4f31-9e1f-08dc75c0d884
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NHVlT2QvdDB5bko2VzFSenhDTlpaTmRtQ1hSeDU4UzRrRFR4MHMrOUVzMW5m?=
 =?utf-8?B?TkpxMjgrZXBKZkNYeXJaNVFKWVlBN1lzaGswSUlOZVgrRkg5NHRzK3pZM0hj?=
 =?utf-8?B?aFFPMVVEVHFXQjhxaXdON0RncFl4cnZJZkdVTTduN3ZsNVJ5WmtUWmh0YUdM?=
 =?utf-8?B?Nk1WK05TWmh5VU42ZDg5REt5dGsvV3p6K0ZNMVRUeUJHQmNXdUxKR0xSQlZY?=
 =?utf-8?B?YnhySGN5M3VyUTdXZ2t0V21XeVRyVDB4VVFYeitDdndiV01XSFp1U29NNlls?=
 =?utf-8?B?RzFYVFA3SHpKUHhzRWlsVTRpWjQyeWRud254aFNUeXQwL1BBUFpwd0hadEU5?=
 =?utf-8?B?SGNWUVNhOTNCUjFYcXJEcmE3SksvNW1BK1phQ2ZFQVd3U2tBdzRHK2c2TGxI?=
 =?utf-8?B?VjRCVWh2OVNYQzkyWFdZVnovekFmUEJkTldsUEZkSUlQNWhUR0l1NkJlVGpS?=
 =?utf-8?B?QUt2bzBhZmJyZk42UnVVczI0bW5FZ2l2NEVPbXNRVW9vY2pLbHpPL1IveU1K?=
 =?utf-8?B?WEhJM29uS2lDb1hydGQ2ajk2dW9kek0zTjJzSzFqejAwYXhBQzNOVXcyUlNR?=
 =?utf-8?B?RkhTelF4Y2VvMVc4QjZVSHVSZEltNGlJOVdEblZOdHRQZlQ0d0NpWXRHUjZ0?=
 =?utf-8?B?cnZOejdJQ3hCWEZLVlVmTUI1NDJ0ZmtpWExuMFI2cjMyMHA0QVhaTVF3WHg3?=
 =?utf-8?B?a1N5N0JPRW5JTkxqUUZBZDE3eUdueHdnNXNkUDRKc0N4WUJNcXZncGZOa2po?=
 =?utf-8?B?Wks2dEtwU2VvOWdPa1FlckJiVDBhVkpZTlhXdXhyNEJnWlc3bHczRDBHYzl4?=
 =?utf-8?B?VmltRVJKR1M2V3hQaEl1dGo2ZkhiQWZOZmxTMU1iYWhuZndzb3VvNE9hcW9r?=
 =?utf-8?B?Mmh4ZVByZjFxTVV6QnF1NUs2SEowSDFkK0pBc3lHNmJ3U1BHaU9ndk5iWVZ2?=
 =?utf-8?B?ZCt4TXpNdFdCS2V1dUJLMUlSZGJIMWJoSVNwckM1dGkwN0tzSlMyVlUwenR4?=
 =?utf-8?B?aVpjTjQvTUs0YmdMV1JJL1FRdXlDM2pYMWpkeFkvSnZHRG4wSE1DTzFaZUpS?=
 =?utf-8?B?VkMrMWN6Y2VQWWRZTnE4dWtocUF2VjJzQk0xeCtlbXczNGY2ZmtpNXRPVnFv?=
 =?utf-8?B?dWZKbVBYTFc3eFJaeHI0MlEyOTFSb2NZckhiN1JZT25MeDlpQlhvVjBEalpk?=
 =?utf-8?B?RWJjUnFBRTVWcnRRZngrQlZjSTYrRGxZL3lPb3dvNFBBaVIrRG1DSS9CRDE5?=
 =?utf-8?B?OVBKUmxRY2QwT2FiQ1NwS1ZHQkZCUjBsbmtWdnpLRVFoT28yNzVCYjF4R2lR?=
 =?utf-8?B?MzRLTHV5SDJWcTZwOTlrVjAxQzlIV2RhNkRFeVlsakcvQjBNRWlLb29DaHBw?=
 =?utf-8?B?VzJYeGFZZWlhczBNOHV4NUhibExpTzdsa2lkNndwWUp5ZTR1b3I1MWJzZm0y?=
 =?utf-8?B?MDRxQ0UySkVRVys2WWZQNmxPdFBlNW5xZkpZMjdOQkdIWk50cXk1YTA1KytM?=
 =?utf-8?B?TkxKam1zRFlnNnQ0RkE1cjNEbStveUdZd2s4MEZHdC94cE5GY1Z5THcyZjA2?=
 =?utf-8?B?MzBmYnlEcjJtTTF4VlIzZDMvMmdDWEpIZkVMSEd6M1hUUEt0c05Jc3hxKzND?=
 =?utf-8?B?SnQ1NzdVVjFhVkgvSE9FT1h5ZjFTNjVVY0wyVjB2RUVsWXNtWUV1RUVGMTV3?=
 =?utf-8?B?blpvbWJLT2lKb21SbSsrbmxkamQwSy9tU1FIU1NkUkNrbmRnYmNIR2FCVTJ4?=
 =?utf-8?B?QjdndktqWFJaeHRnU3N0K0d2UWlwZTg3Z3Q3VHY0TmZmVk9VRVBpZWlSeFBD?=
 =?utf-8?B?SXlud1dVY0dmZndBNCtGZz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5BE31EF1A03ADB4996EC96DC02E82C4F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8583
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7696b8e6-dd69-42cd-aa27-08dc75c0d345
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|1800799015|35042699013|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q0xvOHRTNkpUSk1hS3BEazlDQndxVEU1WkdqaEx4QkpJSU0xRW4zVXNrQlJR?=
 =?utf-8?B?bkVMeUttZlBId2pPVzdoNlhBZUVzaWJ5Z3owb2wydnZUYURpVE5iTmFJcWxC?=
 =?utf-8?B?ejZVOGNNblhMdUJFRDc1cGl4dzBQdWIxSFlvZWJOK1FsVlQwMjJQUTU1aGF5?=
 =?utf-8?B?M0J6T21mdHN4aXpjTnJNOWZOYm5oZ0NSbE9aUG9hNEc0UmEwQ1dXbUNyUHAz?=
 =?utf-8?B?UFhsc0p2T0ZWNk9QdWRwd1JmaGlGbDcvQ1B1SDh4SWxkdEFTMUZuWlNBUWFw?=
 =?utf-8?B?TDZxOElqT1pPdTMvcWY0UVBjK2E5RnVMMy8ycGtpbENOajlNQWdhL2ROUHFZ?=
 =?utf-8?B?bHo0VnFLNGRBQWtjZDVydHJZMmhZMm54QjJkenU5WGhITlRFaGd2aldTZDdi?=
 =?utf-8?B?M3M4Mmx4Z2t1K3YxME5ucTlkVk1IYjhOK0lHbGFTRndSdG5HblF0OTlKNWhx?=
 =?utf-8?B?Qkx3eE5SYTNxWmk5a2YwZFM0YkttNG05Y0VBMHRYeEtHdy9GQ3FhSkFhUEF3?=
 =?utf-8?B?TUNqY1ZGRzVBNUxGWm5sYnBYLzJFT2JSZkVML01nKzg4bHpORGFkeDZKODRZ?=
 =?utf-8?B?L0JGdmRtTGhMTnh4YzlQcVNFMXZZck1lZWtlc055eEcvZ2pxTG5sWnhyeEtX?=
 =?utf-8?B?Q284dW5XZFJMZWhLanRKelpVRnZsNU93TW5zYUsxcjBsU01qSHY0aDNrY2VL?=
 =?utf-8?B?R1VucEYraUd6RDhFam10SjRDa2VjR1NwanY1L2dXeTFjdXllZmVJeGFlTFdZ?=
 =?utf-8?B?SGhWRm9VdnpBTm11RzB0SFBxQ1FxRHlYSVBZcE56azRxTjdGQ1BBckZNQ0Q4?=
 =?utf-8?B?WEdUNmw2eC9IcHpNVUhXLzhRcGI0YS9zK3dGZnRldzZ2QlJ0eVZzQ1ZlSXZ1?=
 =?utf-8?B?U3RUaXU1cUNvUVJ4c3Jyc0RrVFFFT2ZkWG05d0piY2JFSzFvVExpWk4vTkFI?=
 =?utf-8?B?cHd5MzR4TE8reE1kTnJKbk8yMC9tblBXNktZa0JFRUZoMzA1VXdYUkdKd2N3?=
 =?utf-8?B?TUV5aytWSW94VHZXajZMdWVnWFozMGk5N3NYUjlPeHVyYTVIT01FMU41d1FG?=
 =?utf-8?B?S2VhSlpkd2dQMDlZcmRSYkxVTXpEcE1NSmhUVTdTR1RxQlV3TmprSU8zSU4w?=
 =?utf-8?B?ZXdPaW9vRnZZcGhyNGs5VnVhcG0wbUlRWVJ4WTVFZDhxR01QK2c2M2hZVWxN?=
 =?utf-8?B?cDR4dTRQUjAwWGNZbXRsNzdTdHg5UGJBQU91QUFzK1JMdS9tQnpib2YxSXUy?=
 =?utf-8?B?YTFXL1Q5UFVSWmRhRWNFeGR1Mlh0OFBCQVpoMU5zdjNRTGxGcWpRMGIzU25D?=
 =?utf-8?B?dmhDRXJLamptSEdEOUcyQ1NocUJjS0s0ZzM4QkNNWFhQK3d2UHhnbTRkWml5?=
 =?utf-8?B?VFNBME4vNVJ2V2Z0bllwZjd2THRNNGxUWjVKa0tnRGNidDcwbE5iaW84aEY3?=
 =?utf-8?B?WUd3ckliWmtrTk5ZNE42aHFvWkZzN2dqYm5qeU82UnhTV2liNGRqK3JkaGtE?=
 =?utf-8?B?NmJrTG04MXZVOWV6ZVNMUGVmWTB1bWJ0YnEzclJqaUR6d1BYakRGWkZtS21h?=
 =?utf-8?B?MkhueHNtVkNUdEhDWFQ0dy9kWE9EaVpaZTRkOVFRYUdtRHpsL2ZRNDdXZlIy?=
 =?utf-8?B?Z3I4VDAwK2E5VUJoOVdEZHppQThSMWFpekw3RXNLTDNQRVlVS1poN3l6Z20v?=
 =?utf-8?B?azNHb09mSVZaTUhsbWxyZW1GZU9rNzFrUUd5dVNkWS8rZDBlT2xiSE5wMlMz?=
 =?utf-8?B?eld5ZnNnRFZlWUhVelorZG05THNrTEtPSkFPTllCWWxtc3dhTXJiKytjTk1Z?=
 =?utf-8?B?dmtBdU51RWQraDY5QWx4OHd0a05ESVhERU1PMzF5aGFUWDVjZXpoYXVEN0lT?=
 =?utf-8?Q?9De/y+sbpT5+L?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(35042699013)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 15:57:10.5883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c09fd294-d1e0-4f31-9e1f-08dc75c0d884
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7872
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 15:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199493

T24gMTYgTWF5IDIwMjQsIGF0IDE2OjUzLCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IEknbSBmaW5lIHdpdGggbW92aW5nIG91dCBp
c28gYnV0IGhkZGltZyBoYXMgcHJvdmVuIHRvIGJlIHVzZWQgYnkgbW9yZQ0KPiB0aGF0IHlvdSdk
IHRoaW5rLiBJdCBhbHNvIGhhcyBmYWlybHkgY29tcGxleCBjb2RlIGluIGNvcmUgd2hpY2ggaWYN
Cj4gd2UncmUga2VlcGluZyBpdCwgSSdkIGxpa2UgYSB3YXkgdG8gdGVzdCBpdOKApg0KDQpVbmZv
cnR1bmF0ZWx5IGFuIGhkZGltZyBpcyBhbiBJU08gb24gYSBGQVQsIHNvIHRoZXnigJlyZSB0YW5n
bGVkIHRvZ2V0aGVyLiAgaGRkaW1nIGFyZSBfaG9ycmlibGVfLi4uDQoNClJvc3M=

