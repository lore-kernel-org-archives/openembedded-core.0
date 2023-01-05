Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADF3C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 16:57:02 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.50])
 by mx.groups.io with SMTP id smtpd.web11.18232.1672937819093834603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jan 2023 08:56:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=UL7GsXa/;
 spf=pass (domain: arm.com, ip: 40.107.247.50, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbsB93teC6wZjokb7ZD652vgzTw6HFdl/zWOplXf+u0=;
 b=UL7GsXa/Rqykhj8VcRziLO5RLKmr7/R9fp6xP9hNWP/2j6v6dhQOBEQm30F8c7uK//jE+iBFx33BNck+P2Cejxc2waHW4l5j63ybKE6/oORWU830YvDm0eliB9wVPn57/I26hNCwILXqNAfiLYe3izLiq2y0Jm/kfsN0bM7Bbgc=
Received: from DB6PR0601CA0034.eurprd06.prod.outlook.com (2603:10a6:4:17::20)
 by GVXPR08MB7677.eurprd08.prod.outlook.com (2603:10a6:150:3f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Thu, 5 Jan
 2023 16:56:49 +0000
Received: from DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::1d) by DB6PR0601CA0034.outlook.office365.com
 (2603:10a6:4:17::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 16:56:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT016.mail.protection.outlook.com (100.127.142.204) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.17 via Frontend Transport; Thu, 5 Jan 2023 16:56:49 +0000
Received: ("Tessian outbound 6e565e48ed4a:v132"); Thu, 05 Jan 2023 16:56:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f00d49d2f1de771c
X-CR-MTA-TID: 64aa7808
Received: from 21a9e593f5fa.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3ECC9888-61BC-4CB9-A371-A07D000A7D19.1;
	Thu, 05 Jan 2023 16:56:42 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 21a9e593f5fa.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 05 Jan 2023 16:56:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKGPaXYglTuPw4wNg71RMi2qQdoGz3t0ncOXcKo7Sktmw59BpP2cbXMiS4/yxrXWcTj2XdryvuTKjI2eUT8vzsiR/eTmANQEa8ndJfkwIkWvGr1yemPMINtwlb2C8LY3A42Zfv2+E7rI8+6j1lXyQMT21vDaNQVJUzZeQDd0BYKQjQLomWf4oxSt23sQCaraCzuA9MX1WarJYJy4YuYXe2WYTpK2MVIugon1AkYDD7HJ/u+UTu4GUwFZryjHXbBC+CTlPDEgRdmAt2Bck+noL+1V9GRtQUWnv2Yj7WEo+26TP1Mz+RXBFzo+XA9NZWO2C+DaE17v37IHU9Vr6XmJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FbsB93teC6wZjokb7ZD652vgzTw6HFdl/zWOplXf+u0=;
 b=fXyVcyPqFiTFJ6suipoVTMBtgsh8bW7ptvE0K30lgRSrkoXCfwSc4DECKQJHOm6id/2MB3ddCTzMQ56luWIfzYQZ/0Apw6OoJ5lyfmFkfu9NA5jXYFI34Uwzh1tw9q3UmbTaD2iSQqvxoVhON8ku+iq6IkJS8ASrCbAn8zzMQSdoB2B86vo5QhxWVpSlhROx6yYReho4LGLZg1lB63uaIKml8DGhsO0JL1JyNXoOoIQ3VAU1T5z6ih4gjzR66kLrNVOCxsrxIfW6PVJ0sRLsr7svpjoi2JEq6U5vjWKiZzU5gnTMLHCgMcg/yzKVpkB/AEXyV/zEzb7jV/redz6NOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FbsB93teC6wZjokb7ZD652vgzTw6HFdl/zWOplXf+u0=;
 b=UL7GsXa/Rqykhj8VcRziLO5RLKmr7/R9fp6xP9hNWP/2j6v6dhQOBEQm30F8c7uK//jE+iBFx33BNck+P2Cejxc2waHW4l5j63ybKE6/oORWU830YvDm0eliB9wVPn57/I26hNCwILXqNAfiLYe3izLiq2y0Jm/kfsN0bM7Bbgc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5345.eurprd08.prod.outlook.com (2603:10a6:208:18c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.9; Thu, 5 Jan
 2023 16:56:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.014; Thu, 5 Jan 2023
 16:56:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: NVD data format change and cve-check migration
Thread-Topic: NVD data format change and cve-check migration
Thread-Index: AQHZHzqe4CReICa3UkGXDplrGk3c/K6QDtqA
Date: Thu, 5 Jan 2023 16:56:40 +0000
Message-ID: <07CA9C47-1C40-440C-9128-C527E7A78EE4@arm.com>
References: 
 <CAApg2=T6gxWL6W0df=wxBJgGTBPDYof8AdM_MQm1mBtAG1kThg@mail.gmail.com>
In-Reply-To: 
 <CAApg2=T6gxWL6W0df=wxBJgGTBPDYof8AdM_MQm1mBtAG1kThg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5345:EE_|DBAEUR03FT016:EE_|GVXPR08MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d377f99-eb9e-4df7-260b-08daef3dd644
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 aCz9b9zenuclljtAk/eg91OI41gXnWB9bMkPleBDmwSHxv7L9MXhia7AhXI54BfpxMoCBPA3AfXbP3wyiPFX6RYQ24hD7P7p2bwpvXS0nDQ2Ihj1Vj4YyUYfwkR6agyuCYJAWomSwkepyS+KvAEKxD76v8eZb6P0PyMhgAyBAQwpcpTpUbyJv4GFE2Dt4MAThC/UPKj8NKyxa4U7MqmnyYsOmGuceAUeTwZecEioLvThz6o2LmE0WbYIfiJoT8fvHUtc1+H924THS7UGvecbHgwbUSQR1XXdQh3z/aYe7av46Yk7cYjSOUh11QhqTba/P+j6Thcal5LVT34TVMkbQc4B9HvYEBeTKGUCnsCaXJu1E2DteG2kBM/ufjmt+o8vIlS3crPDZAQBLGjmzcVb/8l573q5F03zSeI94xETp9+q5iLY96AceyA611SNGObs9x1goz5G9Q5mmS5b3wd4SeL8UDYzPV+LbpIg91d9Zu0nDTkwS7Ssus9mVFDpXMOtli+qLdbd7/fOTdDnspYNZ4skSg/Yw+Ykpa7pxc+6p5V+QEP6hU7BB0vw7++Pi8BnH7e/VdvRUBpDrh0LWptH0PEouIK36+EhqOLU3D16fOIVtKPqJLDNxqTh4LBDRcXHca+ysYsNDyjveLTouEJYm/+1aEssCghxJ6dw/aSo7NX9evo4F9eIn1WD5AAhFWQwJLFqutDYJTUpzFAJPUUKSjh1oc6KJmFekkmNfZE0hEcZsCxJ2JmAIM72byXfMxmC
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199015)(38100700002)(38070700005)(122000001)(966005)(33656002)(54906003)(2906002)(86362001)(6916009)(186003)(316002)(8936002)(66476007)(66946007)(478600001)(6486002)(53546011)(66556008)(71200400001)(4744005)(41300700001)(76116006)(26005)(64756008)(8676002)(66446008)(5660300002)(4326008)(6506007)(83380400001)(91956017)(2616005)(6512007)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <58AB7F203995784483B2294F073026D8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5345
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	442edddf-a94c-4f1f-00c8-08daef3dd127
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ITyoJsLlle6EOq9B0P9aaUaZOngfMjklNO7m18kGxvjnk7S0uuEUC28JABBgZ5cIG2Wl0DKR7+T8C2XUUxmcEPIAVr5dtGEuvytthMDIxfv/Pcdk8WpbUPBrwnQf9VhgGNssc+/0eUmxQRM5Z7F0uGAbdw+e14o6J3HYqbn4Ku1NxSLnK5cZbPzT+HBrXT6Dj9BxDzVgG4Z+RHsGAGHYyAWlJlYkEa1+/ILsfLgcCRD+xJZ61WOhML0KWR4VQUOk1/VnP4xg9JJUIHEJY/qM+zymyFPOtvL1+eWX+yYlxtYHUMa7dZs9kxaZ0b04OjTJMWgDNrAFBF7xP1gwAHPdZ2t4RgZkUpjcXDFfXMqobKE3BDawsLDJbrttrjHpX9/3HN5Sjc7DbqiT5Fy9sWGh263m5lYb8UjZoDbFgmKwDcQwKT/tZkvIQ0YBP3tUhaJCNHZdJRSyiVv0/40fzSycLwAy9R/2EeH1pzJRMPG1MACeI7Be/YWrhW0iuHpL+D0a0matG8jEJFXmZpFJicqZv/dimTXDz2G/avoA2kw021U9x/yxXYx9rX+/mo28eH/3r/aksSjhuq8ibddPjYCHByH9YQK2+zrCbEeNgVXAxpTdYM1BYreMmY5MkTN/uRi6Otnah/n2cWRBWRMJbaM5nOKBFgMpb7E36KL2fs3HsbA+to0JCkEJVS+d4vb1PhERRtZmF51LbB/mHNfqnm7xUlsZc9k137BGQDHrUxg25sU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199015)(36840700001)(40470700004)(46966006)(83380400001)(478600001)(6486002)(316002)(6512007)(966005)(86362001)(40480700001)(186003)(36756003)(33656002)(26005)(40460700003)(82310400005)(336012)(36860700001)(356005)(81166007)(82740400003)(53546011)(107886003)(47076005)(2616005)(4326008)(41300700001)(6506007)(70206006)(70586007)(2906002)(6862004)(5660300002)(8676002)(54906003)(4744005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 16:56:49.3024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d377f99-eb9e-4df7-260b-08daef3dd644
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7677
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jan 2023 16:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175544

T24gMyBKYW4gMjAyMywgYXQgMDY6MTMsIE1hcnRhIFJ5YmN6eW5za2EgPHJ5YmN6eW5za2FAZ21h
aWwuY29tPiB3cm90ZToNCj4gTlZEICh3aGljaCB3ZSB1c2UgZm9yIHRoZSBjdmUtY2hlY2sgZGF0
YWJhc2UpIGhhcyBiZWVuIHdvcmtpbmcgb24gdGhlIG5ldyBmb3JtYXQgZm9yIHNvbWUgdGltZS4g
V2hhdCBJIHVuZGVyc3RhbmQgaXMgdGhhdCB0aGV5IHBsYW4gdG8gcmV0aXJlIG9sZCBBUEkgYW5k
IGFsbCB0aGUgZmVlZHMgKGxpa2UgdGhlIG9uZSB3ZSB1c2UpIGJ5IHNlcHRlbWJlciAyMDIzLiBI
YXMgYW55b25lIHN0YXJ0ZWQgd29ya2luZyBvbiBtaWdyYXRpb24gb2YgdGhlIGN2ZS1jaGVjayB0
byB0aGlzIG5ldyBmb3JtYXQ/DQo+IA0KPiBUaGUgY3VycmVudCB0aW1lbGluZTogaHR0cHM6Ly9u
dmQubmlzdC5nb3YvZ2VuZXJhbC9uZXdzL2NoYW5nZS10aW1lbGluZQ0KDQpXaGVuIEkgbG9va2Vk
IGF0IHRoaXMgYSB3aGlsZSBiYWNrIGl0IGRpZG7igJl0IGxvb2sgbGlrZSB0aGV5IHdlcmUgcmV0
aXJpbmcgdGhlIGZlZWRzLCBidXQgdGhhdCBpc27igJl0IHRoZSBjYXNlIGFueW1vcmUuIDovDQoN
ClRoZSBBUEkgc2VlbXMgcHJldHR5IHNlbnNpYmxlIGFuZCBoYXMgYmV0dGVyIGluY3JlbWVudGFs
IHVwZGF0ZSBzdXBwb3J0LCBzbyB0aGF04oCZcyBnb29kLiAgV2lsbCB5b3UgYmUgYWJsZSB0byBw
b3J0IG91ciBjb2RlLCBvciBzaG91bGQgSSB0YWtlIHRoZSBidWc/DQoNClJvc3M=

