Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DA3C27C53
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 14:44:37 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.46])
 by mx.groups.io with SMTP id smtpd.web10.242.1718203473297591234
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jun 2024 07:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TT1hdfjU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TT1hdfjU;
 spf=pass (domain: arm.com, ip: 40.107.8.46, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XgM+XJQnN8td5yuogMwHrmkheN1gY8WHihTpODSBrZBOaa0AWO+COfTDneGz0PrnfKwPYVqq8+N9tj3dYv9OrYdwn0VPR0ZnKNH6LAAjfEf4zKQTfluTCKStJI6BK4D/t9gyoVIHtrYAMUUpYw6g5WfD1TCAemk3jX/GXYmV+VL7miFurasyLVmEfqqMWF9LqoGYHPrgn8pRzs/n8CYaM5smLz6csnnucbICLQ+Rl7ii9GV5566uiYO+w5eyl/y/U3nHUJCiB1yk9rX84lKWOG9C7ij/8WrbU/GEtFtGEUVOomuU5KlWWZ37kr9i0+if/7AQrPVuSOYHzfzlCwNoBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrGTOAeD+SGOP/gWKf97S8WmbxciUquxqIlHXbNkMM4=;
 b=frbNLkUEGZdGdHBns1awlcc46fqcPrxdaAMMeDzI2LqP8s4s4nNQJkM5/akJWez1qlOaQ7LSmAFFOeoLiXlOQ9xTWPR2W3tdOsOK/C6//wT5yjLxcevd5fnfEyAilhbIy/FV0orJNhOCl5DKJUZwwq5N96Uau3FCPyHnIRyeQfk0wNb0kD4lN2soNk/CK+MUKGmB/sLJEpkUAJ5jN3gvQJz60l0bcF31ano8hu+PsueWf1rx58n1X/xhyANisKRiuadva9Tmz4wssTOl4+1DrNgbwAlZ/ooGBQikBrniPzsgfl+7t9po1IKa0iBsV84IpPWjGg+nGntW+FQrmZS66w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrGTOAeD+SGOP/gWKf97S8WmbxciUquxqIlHXbNkMM4=;
 b=TT1hdfjUJFSvjRTZYiWkusi6zWuHFPL0wDJ5Q7FZjdaXmp0E8/Mon/tXdh7sIwpXXV4DYX5+OXZUvcL5QlisKzS/HHnKpfylFRaspboJVzN/kuu275tjUcZeiBNwEJJ6Hk6zeQ7eOCWak84T6JYEKHpu4i+l0xXSnGQXwbP0Aa8=
Received: from AS8P189CA0052.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::32)
 by GV1PR08MB10597.eurprd08.prod.outlook.com (2603:10a6:150:166::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 14:44:27 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:20b:458:cafe::d4) by AS8P189CA0052.outlook.office365.com
 (2603:10a6:20b:458::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Wed, 12 Jun 2024 14:44:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Wed, 12 Jun 2024 14:44:25 +0000
Received: ("Tessian outbound 2ded0d7f80d7:v332"); Wed, 12 Jun 2024 14:44:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 20b0c6531b2f1819
X-CR-MTA-TID: 64aa7808
Received: from a16df7d2bb32.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E5AA1BCD-994A-46AB-854B-1BBF721BEC78.1;
	Wed, 12 Jun 2024 14:44:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a16df7d2bb32.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Jun 2024 14:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOQ2WNuPm4KYZaOd//cpz/cninaX7Ti8QoXDxe9S6CItXRlhnCywsq+Kq+dSvtN6Xq69e5v8IHN8vB/1CAMWj1dG6a6zzLJQedt5YUYzKIt/9xVg6OBvNVzxTLKpeQWnKBAWZr8gHegl0xT9u9tCvVYhsT13arQjkdUE8LxU3UVC6V8dYvKiH4ko1db+ldu5qkOgDZ55QtL2sUx3Z1WyP+z4Locwh4o6Xqn0HMKfCZbB+ul6SLZLkkmuemBQUCwm9jmxwUIKSr5HA0lNt1GTKuPp2alNzzbXblHSIX4ozstiARNvejGG6Z4+RGtw2xqXd5NTnZwZPPI6ccFHMfiq6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mrGTOAeD+SGOP/gWKf97S8WmbxciUquxqIlHXbNkMM4=;
 b=Y2GyVDPyaaJbuePa8IOZM3d5At/fZuZwPaz1jfesdh+GOyuCEDKLdhMUa1mz7aY+sjSO72qC7oSQscaxRCoEz7VnJTjgtS14BFIdMmSYLGM5wFHnv1TDa3EiNIx/b3NLOhZ8oPR/WhWYnGO5G0bE1g1ZsZQUO+/i/qGNdWMIDjty2H0GEBi4kDXsmAx6lMYbw0ueuCsmUUTpQrBhL1mG0+CeeeCLZJjk+Uisr6dLaq98qTFlXv98jPNZyRRbP2Ek37GRbIC85ISvVSbZaHXO+Xj/jE75JuJ0q8RVsS8azbzjzfoXhRRem64VqMYj+7qmSo+nTzrfQhj2hXcTqzMkCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mrGTOAeD+SGOP/gWKf97S8WmbxciUquxqIlHXbNkMM4=;
 b=TT1hdfjUJFSvjRTZYiWkusi6zWuHFPL0wDJ5Q7FZjdaXmp0E8/Mon/tXdh7sIwpXXV4DYX5+OXZUvcL5QlisKzS/HHnKpfylFRaspboJVzN/kuu275tjUcZeiBNwEJJ6Hk6zeQ7eOCWak84T6JYEKHpu4i+l0xXSnGQXwbP0Aa8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9613.eurprd08.prod.outlook.com (2603:10a6:102:2e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 14:44:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 14:44:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Tim Orling <tim.orling@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/5] cargo-update-recipe-crates: add
 RECIPE_UPDATE_EXTRA_TASKS
Thread-Topic: [OE-core] [PATCH v2 2/5] cargo-update-recipe-crates: add
 RECIPE_UPDATE_EXTRA_TASKS
Thread-Index: AQHavBfUsnmNm1DC4E2udsASbZItMrHENcMA
Date: Wed, 12 Jun 2024 14:44:17 +0000
Message-ID: <B6F2AA31-12CD-462A-9638-58BC36C8784B@arm.com>
References: <cover.1718120117.git.tim.orling@konsulko.com>
 <850df47dfd1844e24a6013aa88c32c1b7911bb3c.1718120117.git.tim.orling@konsulko.com>
In-Reply-To: 
 <850df47dfd1844e24a6013aa88c32c1b7911bb3c.1718120117.git.tim.orling@konsulko.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9613:EE_|AMS0EPF0000019B:EE_|GV1PR08MB10597:EE_
X-MS-Office365-Filtering-Correlation-Id: efd96c88-3a9e-4fb5-3f9d-08dc8aee2811
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230032|1800799016|366008|376006|38070700010;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WTQ0YWtxNytkNVJRTFBmY1NiMkljdk9Ba095NUllU2k3c0V6T2NtcVpnSlQ0?=
 =?utf-8?B?WTJ3MkdZVFlRNm84bHpCUEw5cEtqbjhtYXN0d2dQM2dTQzhMMFZSK3RkZmMr?=
 =?utf-8?B?dHZEWFBEKzdaTHRNbU5NREJKbXc4bDMvNnVwMnhST25JdGR5UnpJUjBZS0dT?=
 =?utf-8?B?VC9IckY4SkFBU0FocWltd25sU1kxRmJsbWJPdU9pQ2xsVXVwZGtTMkFSSnRl?=
 =?utf-8?B?TnhQbEtwSkMzS21nQlJxNU5vVU9rcGN1aUU4VkNCeG1FcUZVUkRoT0t5MjNy?=
 =?utf-8?B?YnpER2VnZVFXcisvbFFoYU1haVhJdWRmOFlYS2xwNkU5RC9Rb2pMV3QxNnl1?=
 =?utf-8?B?MnNtZjE5bTZ6S0pEb2xFVnNSTWVkOXdEczllMVI5YzlpUitVZ1crMUgzdlJi?=
 =?utf-8?B?QWFYdWZFQ2JmZmNCMXR0enhUcFRvWUVQY2ptcEQrcWRGZ3ZDUllqWklTczBn?=
 =?utf-8?B?TjU3WjJlZXlEblRZdjlHa3dvVC9HRUl2bDVVUG50M1c2VXVhckNEem9XNitX?=
 =?utf-8?B?RjhCQkZoVkpVUHg1ZWlqQ3VlY2RTL0puSjJXd05PQlhJQnJORWpheEhIYW9E?=
 =?utf-8?B?WXVyVWNpZjF0ZnF6RUJkWHplOGpNOEZML3BmVFFlY0ZxdWRnVjgxM21OeFRG?=
 =?utf-8?B?Z0RPcUx1Wk9uR1BlU1lyRFVsdld1UUJkNmsvY2c3aUM0c2VMMGM0UzZlbGJF?=
 =?utf-8?B?RkI0UWpEdE1wazJZUkRiYkdWaHA3K250cWUvMmJkZVpsQ3ZmMnNKUDl2WkYw?=
 =?utf-8?B?ekh2Uk1yTDlQb0N0c1p2UXNBVDhCT0VFQTdadlRTVGpiMmlhYko1WVZxMnp4?=
 =?utf-8?B?TnZQdU9BN0lYWkhmNFJ3dGFkUTRmWXZWM2k5UzJqSExaRCtIb3FObFdEQjFJ?=
 =?utf-8?B?WkpRdkg5WFF2anBBQUxGUmQ5d2pDb1hhWHVaUGJWV3dDWjJieFkwNGNCYjE3?=
 =?utf-8?B?aXUzOXJxRm1UeGo5dEN6TlVRM1FTb2gxbjFuS05tSVVIWSt2a1I3TUluRDV5?=
 =?utf-8?B?d2Jud0pPMm80KzhzbUpaMXJBR1E5dTBNRXo3TVZrWTljNTA5NGhrcWo2cXYy?=
 =?utf-8?B?ZFRhSGhNNFpGc3ZLVE5wSUt2WTNJeXU4MjNKc1BqN0w5dnN4WUlZOHdFVHJN?=
 =?utf-8?B?M3NJajBTdTdjR1loeUExdG5GM0ozUU0rRHltUDdBTWpXVjI2NjZrc0JMMUJv?=
 =?utf-8?B?QkEvRmFyZHlTK1l2R3FXVTVsbFpTNEhmZEgzU2w3QmwwK0NYQVVWaDZ3ZEJJ?=
 =?utf-8?B?MTRpMzRvdHZrUVQ2VDc4eDh4cjVqUVUrdUM3MFZSK2lLUFNRSVNhd3p4cW9P?=
 =?utf-8?B?clE1Y1U5em1pM2V3WEZGTFJaNDY1dUY3QWFRWWc4K1ozaDd0aDhFaW5zajVI?=
 =?utf-8?B?Tm5Gc1lDdGc2WHF2MWRuT2s0RENySnV1Yk00dEU5TE92Wnd2TDljS1psSmNq?=
 =?utf-8?B?azZ1ZDV6OWpvNmJ6b3FYQURza2QrWHlIMWw4WkxhTGw1UEdOWk8vN0t0MTc4?=
 =?utf-8?B?T0E4S3JIQ2pMUWxvN3g0MnpwWFdlRnRUSkE4Z2lHVkloZ25JWWxrWnJjYXlp?=
 =?utf-8?B?NzZGK3k2cFhYQlVOelQ1ZE5yQWNXeHRsK1hVb1BXMjl3ZkxOeVpTL0ZIUTFQ?=
 =?utf-8?B?Ni9ZNnVLeURObTZuVFFQQUhZTXU4TitlaUhFakMvaDg0dXZqcXJIdEdhdFVB?=
 =?utf-8?B?VG84c096L1NkY1NvZnhPMkRFdHI1SHc5QzJPVGRERmhLbi9KTjZJYzYrSTRR?=
 =?utf-8?B?Z1ZTZnNUdFR0bmVib2QvcENQYjM2SlBJTzhYVXRLMTBCbkJJcng2U0M1OGx3?=
 =?utf-8?Q?I/RJGIyN0KH1nMk1EkOEakGzCLY0SdSuxNATI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(38070700010);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <AD8B61623B215941B2AA4E5CA5C56260@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9613
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c6ef9cad-16c8-4291-d2fc-08dc8aee22e2
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|1800799016|82310400018|35042699014|376006|36860700005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SWllTXQ4eFFNK1FWSnFFNURoYjZRZWZMeEJxUHJSNkF5a2U0Y1RnQlBlLzBN?=
 =?utf-8?B?Q2wyOWhWdTJDY28zbHVTTTBaM0lYajRld1FSU3ZIOGZzUHlzbWQwRDB3eXp5?=
 =?utf-8?B?RGM1aVJGc2t1UFBNVWZCd21tQjd3Qk4vSmxaZVJ0b0pseGRTNTlMc3gzdmRO?=
 =?utf-8?B?Y05BRlQ4TDhBaWJySUNhend6bEFnR0J6TTZxTXBrT0VBUm0xa0U4bUdZcFAx?=
 =?utf-8?B?ZjRQWUxudEhOWXljdnlGZmJ0L1k1UzBmMWwvN1pnY3grcUQ2N291c2xtVEFn?=
 =?utf-8?B?Rmhybkd6d2lTcE5DL3A4WnNYaDgyeXBPdDFXeHQ0UmFsd3VKQnNNamw1bkZH?=
 =?utf-8?B?ZmxnUWZrbXQ5QXN3T3NpUUdIQkhFYi9PdlBRKzRmdWJhREpaanpmc3BxbTFN?=
 =?utf-8?B?c1RSSmt6dHpjMkhpL1ROWHhzYUMyV044ZWFnUktpVWxva1IraytoOHRDYnhh?=
 =?utf-8?B?cnhYb3lXcVdhc3RadU4wbTN0V2lQQXVHUi9oNU42TmVIMDk3QWw0RElRMFlN?=
 =?utf-8?B?MXJTcDZMdjJQemNBd1I4TXZkdG5tazlUanNjVmd4elBGZ1ZVUFJyQ0ZpQU8r?=
 =?utf-8?B?QjB5Q0FEUUp2TWlOS0IzZXJXU1YxYmVPSEtuelhKeC9OZ051blJIQnNpclVG?=
 =?utf-8?B?VFl4MGZRZjhNSWx0ZTVxdHYvQkRsSE5SeFd3RkpmNmhHK05OQStpUW9zaVZK?=
 =?utf-8?B?Y3RUd01qMGRDU3Y0WkV6OWprZnFrVXhEWjdIY3RvWitYSmFhaWtjMm1iL3U4?=
 =?utf-8?B?REloR0h1TWdoVmJnMkRrenZveHNEdForSUx4bCtzbzN2REIyWUY2bXJDOE5U?=
 =?utf-8?B?SlY5dlhkVlZEMU5FM1M1M3Q3M0NacnFvcG1ubm1CbWNINFZCeTlUM20rVWZB?=
 =?utf-8?B?S3VoQmYrcGlJOHRJL0Z1enJnYnhsSDF6TGZXWlVTMWdBdlRHZEgyQUlpTWxp?=
 =?utf-8?B?MjBQZFN1cnRCYllENTBkd3VkbHNncHZ1SHoydm9la3FiRVlrL25MSUtsbFZV?=
 =?utf-8?B?NU9uOW9ZTGg0c2pneHJ0b0pqZVMyd2JVUktyOE9FQStxMzhvWTFhb1haV2ZG?=
 =?utf-8?B?NWhEK0xPSlE0Mlg4WW4rWkZHcUpGVEk3bFdaTkM3b1NLdnFKdEdoQ0xXRXZL?=
 =?utf-8?B?aVc1ZXdSTGRreUpQVzdBWmNxcVVrRkxJdnNhWTdxclhPRHhOM0kwQkh4Tm1S?=
 =?utf-8?B?QUJCYWRDaW40Rm0ySFRPQ1ljS1BnMFdibi84RE1pZWcwQ3ByVWY4VVRsejF6?=
 =?utf-8?B?UmU3dHFRYUthQUEyRklRZ0I4LzVqUlV4Z2JLOEthd2FqL1JPVTJmb010Tnpw?=
 =?utf-8?B?cEFSeDVkd0hQZ3JSU3ZnWFNoUmc0R2ZjOXN1WVZvY2ZiN0l4NUczMEFIZUti?=
 =?utf-8?B?U3Y0bHppdmtTTXgrL3V3STFZU3RKanlqS1FhRXZjVFJncWo2V0V3UitodEtG?=
 =?utf-8?B?eTdIZWtOMlFqcTB5NVlrb2ZjdXc3VW5KMXhaOXhFNzFKbU1ST1gwTzRPK29N?=
 =?utf-8?B?R2pzWVkwOEhmY0p6UlZTcXBqSldnb1ZUcENZbndkV1V0VlowTlI0all2bUdq?=
 =?utf-8?B?Rll0bXBlYmZrNWY0bmlmaTZuRkxwcExYeE5ISUVvTVI1eEVCczdwSUdtdjY2?=
 =?utf-8?B?emRXbW1MYVJBS1Y3azVRcDhWOUpkR1NjNHViSWdVekhidGMzMjVMZVpzLzQ5?=
 =?utf-8?B?anBaTnQyd09vSE0zdDBZY24yL3pHdUJvcTlzdWo5d0xpNnpMWW9ZNCtXZFJh?=
 =?utf-8?B?OW9vd2VKSm5YSlUxSmYyREx1SE1DMVg4NnA5blN0V3pqMlB1OWtKQ252MnF2?=
 =?utf-8?B?eENra29uYkY2MDZOSTZvck1FQVpRSzNpUUM0cVFhazIyUm1FVkRaNkpmaUZz?=
 =?utf-8?B?Kzc5S3JPUjFNWnhwaVp1Wkhkc0NJU0htUzNBalUyVEx3ZEE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230032)(1800799016)(82310400018)(35042699014)(376006)(36860700005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 14:44:25.8367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efd96c88-3a9e-4fb5-3f9d-08dc8aee2811
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10597
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 14:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200572

DQoNCj4gT24gMTEgSnVuIDIwMjQsIGF0IDE2OjU1LCBUaW0gT3JsaW5nIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDx0aW0ub3JsaW5nPWtvbnN1bGtvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gK1JFQ0lQRV9VUERBVEVfRVhUUkFfVEFTS1M6JHtQTn0gKz0gImRvX3Vw
ZGF0ZV9jcmF0ZXMiDQoNCldoeSB0aGUgJHtQTn0/ICBJdOKAmXMgbm90IGxpa2UgeW914oCZZCBo
YXZlIFJFQ0lQRV9VUERBVEVfRVhUUkFfVEFTS1M6JHtQTn0tZG9jLg0KDQpSb3NzDQoNCg==

