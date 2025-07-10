Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96EFC83F1F
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 09:48:22 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.59])
 by mx.groups.io with SMTP id smtpd.web10.4778.1752140899760767034
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 02:48:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=sa+WvTxh;
 spf=pass (domain: siemens.com, ip: 52.101.69.59, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s9A78uSG1MIk+T+fc2Hwyq89PFvmFMJOoWhBziazmFd3tIbC9rHX7BP5EKmazKDIfBM2NpG6eEnv317VFpoJD3JEPHUQrmsVLvlVIMQVfnh7CzetAo06wT1OMQxjU0kXrhsdNeKNbrwx2uieLXkdCJWnGLyFMs3fdrYJN+ArLwp3C29BNQzH6tYF9EVwHdRmogpM1E571vvJCP+hAfzwwcXgw7c3sbT3XvzVkVeq6qjSB0w/fZzrvvP4G7ZY9wVCQdYLFRXThBdG/8dxSBPcl/efL0eT8IBt1TE06cfA/3A5pPkXnz/Od64YUoW7NJzkG7LqhtlxN0FYP5EbCAXuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lczg2YhxZbFgYqLajNhpJ59wqv13dWtoj7r6ZXN05/o=;
 b=flEmCtDcS8LecyG4cMwNBElPcf0dky1KQEMIGvWNdE2sfKQqIl7dULRBVVwR+QBdSpugsPBo7m6gbkrptXQFXcCpw0Vfh/D2uQWmGzpgUjRbeg9B48jbr7m1PBkwlqrocsNEq3ehrjIMrre3sbWbU6E2y2bKSGbe9cslIk/GhGpVquwfgwAi8no4VPrrBsxqiwMGKrWFLsv3hs0qm73X7ahJZnVwu4z+rg8zcX+8penDts7UTEA8TpIlUhM6PNEmvarKDkRsBeZBefRnHWaXXxy9ykNzjkG5J8NWj+JYZjlr/BNQQBVQKHXCYIM7O2EMD9oAo70AG0h4/ydh4MmzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lczg2YhxZbFgYqLajNhpJ59wqv13dWtoj7r6ZXN05/o=;
 b=sa+WvTxh4Mo2S0V0Bpl7bes4lN2ySvRSSCWV8VlL5u7t7Op3lj9SkuUMbqieLAvSEv8MvbkQ5Ls2Am4Sf1iv8lNzIiscygYniwEb5Z5x++1O8hpUOWUvco1MRNomGjfXfBjT+F1crjKcwOVWC8+V0XdW/uD24/jyEXipZjpHHyoAYc0+tMMbW6i05zh8fN5h18GkLSw14cdSNqjOQWJR0JXLBakF0DoBbJ2r77grzk+OVDGx4xCTrU1u8GhZxIOOjZ+KdolNQYWTz/15NQG8j1bkr+7jaRHWy2oDwjMBZnRzEZNTROCkIqunnik0Hn0fX2gJRxLtD+idZAklX7jK8A==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by DB9PR10MB6572.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 09:48:16 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%5]) with mapi id 15.20.8901.023; Thu, 10 Jul 2025
 09:48:16 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "Pascal.Weisser.ext@karlstorz.com" <Pascal.Weisser.ext@karlstorz.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/1] systemd: add rdepends on libnss-resolve
 to nss-resolve PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH v3 1/1] systemd: add rdepends on libnss-resolve
 to nss-resolve PACKAGECONFIG
Thread-Index: AQHb8B1OUDWutJmBoUubkgQivGEy3rQrH0iA
Date: Thu, 10 Jul 2025 09:48:15 +0000
Message-ID: <5f6fc50feeeb1e8584ddedbf17093fa8f9a7991d.camel@siemens.com>
References: <20250708153030.3324742-1-pascal.weisser.ext@karlstorz.com>
	 <20250708153030.3324742-2-pascal.weisser.ext@karlstorz.com>
In-Reply-To: <20250708153030.3324742-2-pascal.weisser.ext@karlstorz.com>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|DB9PR10MB6572:EE_
x-ms-office365-filtering-correlation-id: 3f8643ce-127c-41e9-bf9d-08ddbf96e4bd
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|4022899009|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aHBHd3ZaamYvaHFvVmlNYU1aaVFEUEsvVStQakZucmNHL1FoN245Ky9LSko0?=
 =?utf-8?B?alAvNTJMcVVqT2VaN2hwbVlQNURhWHhlQ3VpL0xPOGRWWHR6blVmOWdCdUxu?=
 =?utf-8?B?S0VVanduU3lQUWlGWnkwb3B4UU9jbHN0bXFSYnczSXZzSkFlcE44S1FTRmZp?=
 =?utf-8?B?M0JzZDZWV3FIZ2tSQ2JHZG9KU0syS1N3N094Q0djUWlEbFhVL3RadFdubHM3?=
 =?utf-8?B?YktuOWh2SGswL1JMZzZCY0VxNTl2eDkyVnU1Rk45NFQ4N1pMMFo3OVEyWXQ5?=
 =?utf-8?B?aHpXV3VrQVZhSVB5eWo1bVdPVGlGa3lQT3RVaFdTZUoyU3lmVG54YWp6WFpn?=
 =?utf-8?B?VU82OW5DUFlJa3dGdi9sdzd2dEFaeUZFZTJndTB5eXZ1Yy9tbzBZOWE3V2x1?=
 =?utf-8?B?akJFdGRwbWZQWlYzYkxvKzVnZmRvaHhraUhnaXk1Q0hUTUQ5U1kxY0cyeDE2?=
 =?utf-8?B?RFFGaEd0ZGlJcVJyOFZoSjlCZmd1TXkyRk9KbytQVXVGRXBWSGRzRHFSdC9o?=
 =?utf-8?B?MFVPbXc0WEZuREwvWHNzazd4TllzNHFkMVI5MExjT1lTRlJ6OG1tRFZuT3U3?=
 =?utf-8?B?ZmVlSzduMnA2S0FOQy9zUFkvbXJpTU9scGVSMngya0VDZVRtaGoyNU1DWEVn?=
 =?utf-8?B?S3UyLzBxaVA2U0tuckYwM3lWcnpnYTh3RTE3QnhpWC9TVmlFYXQ4RnVCSHFq?=
 =?utf-8?B?c3c4TDA0NFQyYUNWdGxVUDlER3c3SjZoMTduR2FIZ1d2T0xZWlBXcGliZVV3?=
 =?utf-8?B?ZTdMemdQU09CSEtDeDlpa2NRVzFIWllqR1FtUkZnTi9YMTVqL1hQVEJQUnNj?=
 =?utf-8?B?ZjBzeERrTXNXVW9GUWhrUW5ic3NKeWZmckRYTVhXZ2xEMUxBZGpZQ3dnbi93?=
 =?utf-8?B?djBSZUpWZGg5eFdyeXFQVVB4QkdqckRnYUJwSnlZK04xMlk0NFhRdXNsUVNn?=
 =?utf-8?B?WDdIMVpmblZMcitvWWJJdElJeStxZXg5L1FMeUpHUURaWnB1eTZ5MEE3VG5k?=
 =?utf-8?B?NGF4ZHJoeGtIbW10aDA1Y2QwdTA5ZThHcGIvWFRMREQ0NjBOZGdpN3UvTGp6?=
 =?utf-8?B?akZXNEgrdDhpay9iSmU4RlAxM09HbjZWRktOcHJrSXFvcUxZQXZ0bUtrWGd6?=
 =?utf-8?B?Mk5WWUZBUTBMMkh4WFVZbDd3TCtiN0lwNmZsdUZwVkxlTWRYZzFQRW1QV3pQ?=
 =?utf-8?B?c3RRUFVTOWcyRWdDMysweDEyTXRpc1pidlVJYS9BZUE4MGFGUlhrTEw3MFFG?=
 =?utf-8?B?N01ZZlBzWGljd1BkSllxWHNPZGhXWk9Jc0RDQ2NlMkM0UTJ4bGFxSWZyOUNs?=
 =?utf-8?B?UHBwb3d1YmxXWVFoZ1A1YlV1SDlNNmpjSnVaVkNtRytOUzE5N3BDYVhwVFM1?=
 =?utf-8?B?alI3ZTdsNmlneDAxdmlQTW10dWI3Tk8xRmhiV1psMkZHYjdYcGN6VGZzdjlj?=
 =?utf-8?B?OS9yS084d2FUdG1HTU5YZlpETys0WGd3YkNZTmxZNld5UHVDUVU0cUtxVGxD?=
 =?utf-8?B?VnZCTHJ5SHprUEE5M3BubnNNNjBYVFVJNDZBT3FOek5uRUxGS1RLUVlNUnQ2?=
 =?utf-8?B?UU4zWit0Ukt1L20xaTBNRXFQelliR3FzTDZmRGVQQnNKdXdEL3pTQXN3Mk44?=
 =?utf-8?B?QW9ZRkdrenZnZFdCYndhSmlKRDhmUy9vc2hKdmorT3hpNGtLdzd1VWJuR1M0?=
 =?utf-8?B?eFBtWkFyR3NjOE91S0lFK0xCdnRCUVF2NFBkMXh0WW1nek1ORkV2b3RMQVNH?=
 =?utf-8?B?aHgzckI0SEkraXFtNDFFSllVM3llbDcvK3hpV3ZEOGpsNGVPRnZVc25sZjRn?=
 =?utf-8?B?L1gwd3prWlJIY0N5aGp6NktTemZWMDZ5QzVWVE5pYTVkc28rTmh5TlZiM2hR?=
 =?utf-8?B?QzBEZ2MxTmtjNFFoWW5sWWVxWExPL1ZLaHdHNDZEbHdzQTN3YkZ6T1dKM0l2?=
 =?utf-8?Q?bBJQrxK8rvQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(4022899009)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RHhhR2h6bnBia21GL1BTQnhyWXdPczg5SU9zcVMvZGJ6cWNUYVplMzAxNHp2?=
 =?utf-8?B?OWVxZno1aGh3NTVJUVF5cHY5UkU1d0hUejRkNno3dEJnRndyMnpYNktvZElu?=
 =?utf-8?B?QWtCLzc3b3VINnpDc01admllR1NRZnFoNDNVaGdQWUFJemlpd05jLzVIK2pF?=
 =?utf-8?B?Z2U3YktSLzBMZzd2Z3BQRE5OZjFTZGpTMmo2RnN4RStRRG5DV0NhNEhXSHo2?=
 =?utf-8?B?cnNXSzRRODVrQTZyTTkrMEU5Y0poZmF2amw2Zkw4OFFWY21JVkVWWEhMYnVW?=
 =?utf-8?B?eXFiNEd3b3JmMWl4ODJ2K0FnYkFqSlZJQ3VmS0NhV3lXK3pROXhkUHdBd0RC?=
 =?utf-8?B?cWZRQkwxcnVxSFoySzB2ZE1IKzZXRnlXT0ljSzVycjBrQ1I1VlM1aHdKeUZ4?=
 =?utf-8?B?WW9uVm1yNjFRVUZkQzE1bGQvZzZVQzYrYW5sdHZ6dEtrZWx4anNVaDNzQ0k0?=
 =?utf-8?B?eWdWTlhuZDRiK1pGd1RVcmI4dW5EcndsaHBGTENXOThEQjRWSXRWckRKeWMr?=
 =?utf-8?B?NVd6aVdLWnNLaGEzS2ZNMU9WQkFHbE9tZ1pOMGNjT3JHMHh4c1BCTUo2RVZ6?=
 =?utf-8?B?NTVteTJVSWMxRzdEOG9yZkFFQjRkZElFYXZwU2VWWU9Xa0xhQnBzczRKYUxE?=
 =?utf-8?B?UjZ6R0V5MzB2NE5FMXVoZkN6TG5oSGFNdi9KS3liTTRNdU9uUHVhSEx0WmJ5?=
 =?utf-8?B?a2RrekpBWEF6TWExdkpnU1hyYnlXcXdzaFlOd3RISGtuSmFuZFBUSTJMUXpK?=
 =?utf-8?B?emNIZ3BGQjhzRU5EanlnVTlUaWVlSllUalFDNzV5VW5FT0VJQlhTZTQ1UFda?=
 =?utf-8?B?K3FnQlI2UFJ3ZG1reTFIaVJxZzZOZjBRNnZqRDFoSUJYNnhiNXowcEg3M1Jk?=
 =?utf-8?B?VjVUQXVYT3RZaXJBZzVDZ0hieGg0RkFqaDIySFlkWUE0OG1Rbmp0QjB4bTBu?=
 =?utf-8?B?b2I5VG95Q0I0NVhNVGR4dHI0dFVMWGhtM1JHeDJoNFFaN1JqNUxDbWhaUXRV?=
 =?utf-8?B?Q2VnenRtQlo0bW8xa0RBTjNmS3l2Uy8wYndNZXlXREVOajdua3pjVjNnZGhY?=
 =?utf-8?B?Q2ZyZS92elI0R3BvQlp3WklGaDRzdDMzOWhGSkxQUk5QSzNyUmk1RFgydU5Y?=
 =?utf-8?B?Y0E4ejhnNllYVExIbE5PK05XQXpDN3Qxa1drMUZSWWR5aXliNTJKb2J0VGFv?=
 =?utf-8?B?dStIeGdFMUk4NXROMjNoNFRVWkF0bHRHKzRGVzV2VTVEQ3RNaElUZzVOQ3Aw?=
 =?utf-8?B?ZWlGTW9FejRsMUZ0N2d5Z1U1cyt4cnJKL24vQkdrbXF5eUcvWElwSFJGSGhQ?=
 =?utf-8?B?S0p5QVpZZ3NNRFZIcHpuVDc5RnpwN2VPQTI4OTNPVGpqUk51T2dRS0pRQS9L?=
 =?utf-8?B?YmJDd2ZNdjV1aFFIRTJPaUQyZGxIelIwRUt2bTN6MEprOW5Gbk5OTUNLOExs?=
 =?utf-8?B?TUZpdXVKcy8vSS8wMEFVOGtPa3d2d2tXYlJ1MzVtbHVsbGQwU2lJek5tZEFN?=
 =?utf-8?B?ejlGVVIrNlZhNEFHcjl3bFdCdWphZ3FaS1czSmhPVFVEV0ZUK29DVURBc3Jx?=
 =?utf-8?B?OXdQTFZVdWc1SzEvdXQxR3U5eEZaemduZUE5dHllQitaaW54YmpUdlozNGhl?=
 =?utf-8?B?aXRmNUdidW5LRWtRUGVPQ2Y0YjBqMTZrYmtmYTlvb3RYa24xbDJCczBqRTZu?=
 =?utf-8?B?ZUFrc0ZxdktObUJXdW9WelV0MVEwREh2NUlqUEtKOUI3Y2RublI0a1ZNaVJn?=
 =?utf-8?B?aHMvenNPNW9YdzFGZVovNVdHbkVvdGwxaW41czdjZ05WTTJoQTVJNmFDSDNi?=
 =?utf-8?B?NXhyOWpYaXdvM0RXUElvWU1hTkZ3N3NuWlpuT21LaEVKa29qMnY1QnBUbk85?=
 =?utf-8?B?T1RnNmwyazJDSmNFRkNEZUp4enRqZ2duQWVJT0h2c1ZxKzJvcCtreHBISmJO?=
 =?utf-8?B?U3hUM2tVcFFNTTllV3FCMXVaVWhuL0ZLMGpSYng0ZWxkWENKK1R1MHg4TDVN?=
 =?utf-8?B?KzB4alZBRHR4VXEyNU5Fc2NQcFQ2Q1dMV1RLNWh6ZGc2SzY1RlBIZ05ldWZl?=
 =?utf-8?B?WXRKb2x2TXV2azZEeG1HQmVZVGlNRmFDN3FGR0FNTVoyR0RwbExzT2xSeG9w?=
 =?utf-8?B?R2dZRXo4QlZ1MjlyL0thMTgyMEZCUTFuRkgxN0h3Nm0xTncrbmNiQWZBbnZl?=
 =?utf-8?B?VEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0032664B2CF55340ACA10BB0E20E681D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f8643ce-127c-41e9-bf9d-08ddbf96e4bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 09:48:15.9737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yV8STgp2Gti0ly2AftOwqN0x5OKArj+FiRTzJaW4gWQbnU380d3jAQomVj97lL/fFes+8RBWuMWVunRlg9HaLNdrGNJdkpIHppvhoeBs1so=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6572
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 09:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220115

T24gVHVlLCAyMDI1LTA3LTA4IGF0IDE3OjMwICswMjAwLCBXZWlzc2VyLCBQYXNjYWwuZXh0IHZp
YQpsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+IEFkZCBhIHJ1bnRpbWUgZGVwZW5kZW5j
eSBvbiBsaWJuc3MtcmVzb2x2ZSB0byBuc3MtcmVzb2x2ZQo+IFBBQ0tBR0VDT05GSUcgaW4KPiBz
eXN0ZW1kIHJlY2lwZS4gbGlibnNzLXJlc29sdmUgcHJvdmlkZXMgbnNzLXJlc29sdmUgd2hpY2gg
aXMgYSBwbHVnLQo+IGluCj4gbW9kdWxlIGZvciB0aGUgR05VIE5hbWUgU2VydmljZSBTd2l0Y2gg
KE5TUykgZnVuY3Rpb25hbGl0eSBvZiB0aGUgR05VCj4gQwo+IExpYnJhcnkgKGdsaWJjKSBlbmFi
bGluZyBpdCB0byByZXNvbHZlIGhvc3RuYW1lcyB2aWEgdGhlIHN5c3RlbWQtCj4gcmVzb2x2ZWQK
PiBsb2NhbCBuZXR3b3JrIG5hbWUgcmVzb2x1dGlvbiBzZXJ2aWNlLgo+IAo+IFNlZSBodHRwczov
L21hbjcub3JnL2xpbnV4L21hbi1wYWdlcy9tYW44L25zcy1yZXNvbHZlLjguaHRtbC4KPiAKPiBS
dW50aW1lIGRlcGVuZGVuY2llcyBvbiBvdGhlciBOU1MgcGx1Zy1pbiBtb2R1bGVzIGFyZSBwcm92
aWRlZCB2aWEKPiBvdGhlcgo+IFBBQ0tBR0VDT05GSUcgZW50cmllcyBpbiBhIHNpbWlsYXIgd2F5
IChteWhvc3RuYW1lIC0gbGlibnNzLQo+IG15aG9zdG5hbWUsCj4gbnNzIC0gbGlibnNzLXJlc29s
dmUpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaXNzZXIsIFBhc2NhbCA8cGFzY2FsLndlaXNzZXIu
ZXh0QGthcmxzdG9yei5jb20+CgpUaGUgY29tbWEgY2F1c2VzIHNvbWUgaXNzdWVzIGluIHRoZSBw
YXRjaCBwcm9jZXNzaW5nLiBXb3VsZCBpdCBiZQpwb3NzaWJsZSB0byByZW1vdmUgaXQ/IChJdCdz
IGEgYnVnIGluIHRoZSBwYXRjaCBwcm9jZXNzaW5nIHRvb2xzKQoKPiAtLS0KPiDCoG1ldGEvcmVj
aXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZF8yNTcuNi5iYiB8IDIgKy0KPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWRfMjU3LjYuYmIKPiBiL21ldGEvcmVjaXBlcy1j
b3JlL3N5c3RlbWQvc3lzdGVtZF8yNTcuNi5iYgo+IGluZGV4IDVmN2YyMGM0MzQuLjkwOTJkMDJj
NTEgMTAwNjQ0Cj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI1Ny42
LmJiCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kXzI1Ny42LmJiCj4g
QEAgLTE4OSw3ICsxODksNyBAQCBQQUNLQUdFQ09ORklHW25vLWRucy1mYWxsYmFja10gPSAiLURk
bnMtc2VydmVycz0iCj4gwqBQQUNLQUdFQ09ORklHW25vLW50cC1mYWxsYmFja10gPSAiLURudHAt
c2VydmVycz0iCj4gwqBQQUNLQUdFQ09ORklHW25zc10gPSAiLURuc3Mtc3lzdGVtZD10cnVlLC1E
bnNzLQo+IHN5c3RlbWQ9ZmFsc2UsLGxpYm5zcy1zeXN0ZW1kIgo+IMKgUEFDS0FHRUNPTkZJR1tu
c3MtbXltYWNoaW5lc10gPSAiLURuc3MtbXltYWNoaW5lcz1lbmFibGVkLC1EbnNzLQo+IG15bWFj
aGluZXM9ZGlzYWJsZWQiCj4gLVBBQ0tBR0VDT05GSUdbbnNzLXJlc29sdmVdID0gIi1EbnNzLXJl
c29sdmU9ZW5hYmxlZCwtRG5zcy0KPiByZXNvbHZlPWRpc2FibGVkIgo+ICtQQUNLQUdFQ09ORklH
W25zcy1yZXNvbHZlXSA9ICItRG5zcy1yZXNvbHZlPWVuYWJsZWQsLURuc3MtCj4gcmVzb2x2ZT1k
aXNhYmxlZCwsbGlibnNzLXJlc29sdmUiCgpBZGRpbmcgYSBydW4tdGltZSBkZXBlbmRlbmN5IGZv
ciBhIGxpYnJhcnkgaXMgdXN1YWxseSBub3QgbmVlZGVkLgpQcm9iYWJseSB0aGlzIGlzIG5lZWRl
ZCBiZWNhdXNlIHN5c3RlbWQgbG9hZHMgdGhpcyBsaWJyYXJ5IHZpYSBkbG9wZW4uCklmIHRoYXQn
cyB0aGUgY2FzZSwgd291bGQgaXQgYmUgcG9zc2libGUgdG8gbWVudGlvbiB0aGlzIG9uIGEgY29t
bWVudApvciB0aGUgY29tbWl0IG1lc3NhZ2U/CgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaCwKQWRy
aWFuCgo+IMKgUEFDS0FHRUNPTkZJR1tvb21kXSA9ICItRG9vbWQ9dHJ1ZSwtRG9vbWQ9ZmFsc2Ui
Cj4gwqBQQUNLQUdFQ09ORklHW29wZW5zc2xdID0gIi1Eb3BlbnNzbD1lbmFibGVkLC0KPiBEb3Bl
bnNzbD1kaXNhYmxlZCxvcGVuc3NsIgo+IMKgUEFDS0FHRUNPTkZJR1twMTFraXRdID0gIi1EcDEx
a2l0PWVuYWJsZWQsLURwMTFraXQ9ZGlzYWJsZWQscDExLWtpdCIKPiAKPiAtPS09LT0tPS09LT0t
PS09LT0tPS09LQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLgo+IFZpZXcvUmVwbHkgT25saW5lICgjMjIwMDQ5KToKPiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIyMDA0OQo+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNDA0ODQ1NS8z
NjE2ODU4Cj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcKPiBVbnN1YnNjcmliZToKPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YsKgWwo+IGFkcmlhbi5mcmVpaG9mZXJAc2llbWVu
cy5jb21dCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0KPiAKCg==

