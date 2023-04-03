Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01303C76188
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 19:52:27 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.75])
 by mx.groups.io with SMTP id smtpd.web10.81935.1680551538745467340
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 12:52:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7DPmbDCZ;
 spf=pass (domain: arm.com, ip: 40.107.247.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcDwjoH9dgn8F3C/2P5XAYDCmUJhUA0lFBpnjYZ+KBM=;
 b=7DPmbDCZgefTEXmc6o58aixurBrOV3b0X00KCG7k9Vr7b1guhKmwaOyaHyK2OPUeT4UZIjk4dZ5KXvY2glEFOHt0yAj0FiFZUqwr/nY66qCDeonmtRgQbLopvQos0tejVLGwYxyfnxDPPRr9ik3VmZX13fybvsa2sNaeOJh46h8=
Received: from AM6P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::42)
 by VE1PR08MB5790.eurprd08.prod.outlook.com (2603:10a6:800:1a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Mon, 3 Apr
 2023 19:52:12 +0000
Received: from AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::e) by AM6P195CA0029.outlook.office365.com
 (2603:10a6:209:81::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.44 via Frontend
 Transport; Mon, 3 Apr 2023 19:52:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT065.mail.protection.outlook.com (100.127.140.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.9 via Frontend Transport; Mon, 3 Apr 2023 19:52:11 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Mon, 03 Apr 2023 19:52:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d27d4ed78657720
X-CR-MTA-TID: 64aa7808
Received: from b041fa09aedf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0E530227-6277-407A-9A06-295D7B0D5DBE.1;
	Mon, 03 Apr 2023 19:52:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b041fa09aedf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 03 Apr 2023 19:52:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KADlGdqtevViOPcg0FffkvVhNUcNgBuvpFFZWi1xlKUWjP2fLhnJS/ZD3/u8GhYCA8SRxebVbRtzvRZoXyh7ygi8DDDO6gs69ksgWOTyVQ5Y04cW8/XEc+u85nI4QUaq0KM352YPHzX1ZJsuDAV8PHY3zLbTRAVHTwdqkgAy73o272LEK/eeGjUd5xoKES0r42CZk2clb36QJDVU7N8ckeF0O80mRneVqvK28XGvkMtxPZb/gQMnzCJ5ROUbS6RtJGfQgw5N9Msdo9ijUgzTgPmNaOoPrVzFIWmjrzQ/Q0YNmSWZ9Y0ZmgjGVsfUCNW/dWRZBohR1yy+oIXBdFWdPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcDwjoH9dgn8F3C/2P5XAYDCmUJhUA0lFBpnjYZ+KBM=;
 b=NI8wao25Dv1Nw7aHeoRW80/VDArMI85qbVkdOdYuediZxuykH0tWQ6p6tPu7b9aLdwx3EavIIIw0hmSMZbGCiY4pi4rIsiRL0Q0rgBL/HgFpGWz8u+VQDeQIX6C/LBM3ebLX5/Y89AD8FDN28XPzJsl/GPtnGM6WcMLQ8Gip1UEg8ZD9AN74ATGArtFP5OtBz5nI65Hmp6k5wHeKKwK0SHt/Trbau6i9bS3FdEjnToY7r8OjTRIHn3CdH56qbOAakayRi7T6N4wpKOyToB4MkCucGj44xvDdTt2Uc2k1d5VIotGJKVqCngoYLLAlFiAkDZ9lDXf93KK9SyPYohvODQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcDwjoH9dgn8F3C/2P5XAYDCmUJhUA0lFBpnjYZ+KBM=;
 b=7DPmbDCZgefTEXmc6o58aixurBrOV3b0X00KCG7k9Vr7b1guhKmwaOyaHyK2OPUeT4UZIjk4dZ5KXvY2glEFOHt0yAj0FiFZUqwr/nY66qCDeonmtRgQbLopvQos0tejVLGwYxyfnxDPPRr9ik3VmZX13fybvsa2sNaeOJh46h8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9643.eurprd08.prod.outlook.com (2603:10a6:20b:608::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 19:52:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ba7:a556:599f:4369%7]) with mapi id 15.20.6254.028; Mon, 3 Apr 2023
 19:52:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] systemd: Allow native build
Thread-Topic: [OE-core] [PATCH 1/2] systemd: Allow native build
Thread-Index: 
 AQHZYw155bCIHOVn9ECbS3by857hjq8TVzIAgAAE/4CAAACHAIAAKXeAgAEfNE2ABMszAIAAIegAgABy3oA=
Date: Mon, 3 Apr 2023 19:52:01 +0000
Message-ID: <3C4EAC0F-C717-4FFC-9885-808BAB334616@arm.com>
References: <20230330134214.2772913-1-zboszor@gmail.com>
 <a25c3a41d623242edf004723dc94518228cfc1da.camel@linuxfoundation.org>
 <869f611a-1645-52b6-1f3b-e4b605f2ddd4@gmail.com>
 <CANNYZj9uYcBaDHgBABrnjCuH9AGTEQ8PhkxuJBm+FaTTNkwaPw@mail.gmail.com>
 <ab068d9c1e16fe78ea74b25a30412b55cad616a1.camel@linuxfoundation.org>
 <1751778F66ADC2DD.27612@lists.openembedded.org>
 <27b6f2b6-5e7f-8be6-32fc-2aa7cbd1402f@gmail.com>
 <3ADE60F3-FF7C-4022-AB82-9D992AAD1405@arm.com>
 <6f3a27c7-a8be-4430-b66f-a0d2c53ddf7f@gmail.com>
In-Reply-To: <6f3a27c7-a8be-4430-b66f-a0d2c53ddf7f@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9643:EE_|AM7EUR03FT065:EE_|VE1PR08MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: e5493f26-97e7-4d90-b208-08db347cea90
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 IPSoE3RQ5mWXddTr3zhEYZPA6lQ7YeVdOQ1DP4GgNRXEZz668l5yoyWRLkWhcnAdoC+1GR/b/EktfBRviJ2wGYypCAuwYYhnfn2RdtG61i/BABoo5340fw+UpOcNwMldOm45xTGFhrQN5SyqmBnmmPfPbFh4veee+V4E0ssTuxdhpW5v74fluQKNsHtxM7xmy6u6/R2g1S3t8qHBUXKYtBScFZsJqCJRP0KO3UustkzETQDcq7wo/pcSmoT5SV6MNYgwGPD+Z3O6nyGL9n9c4aUwOaxYT+Y1zdP2P42ZB3tJggNQTsbUtkggcjAUXgwcja1SEB/Bk/Orl9fJkuMcUnmePuvfKY2sP82gISO7TjmtfIDVvF9aqoZukwQ1sHP6Q+o8EWWbHbAMirweiXXbIEjkWJvPelmjO/jogftLxBnGSxJONNbVeykM3NlP6EMIldVVHX2U0YtXmf8rWHU7naAdvueFQVt/3RftPGogN+LxtFNngNV107dPGXeOj3oxtEOAhOHlLisLYYs1w2iDkfDu9zIv5OlOPeSJvmoTp3O/gjlUl4icx1ayxaxnnpWIJzU/4IviECXsPdn57e90CfiGDpHtFzYjnS6qsIBuDI6da3YO5z5zKOXq8hdhBlILKO2io6XKGehlOg95gfSGKg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(86362001)(38070700005)(2906002)(33656002)(36756003)(6486002)(966005)(71200400001)(2616005)(53546011)(186003)(83380400001)(66574015)(6506007)(26005)(6512007)(6916009)(4326008)(76116006)(8676002)(66556008)(66946007)(66476007)(64756008)(66446008)(91956017)(122000001)(5660300002)(38100700002)(41300700001)(478600001)(316002)(54906003)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F3BFEF2306CEA4C8B4B6CD5B6368D14@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9643
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7144f111-600f-41ec-a25c-08db347ce4a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l+1X9a5Nf2+jv5+DpAtprEqF5D6qrCSaCZkgN44YYh3yAIEcZATywxqnpSBLkPWRioWJ6GDsATjcFHAm5aMNjOuUFXtiGugOPOR6MON5CK35U3QdqzuXxj4DCoJTZNbVo0+vRtwXFzeqkE3hzvM1PHMF14weEuZSSM36ijzQkUMZ+q6G04DASSkV7v/DdQXQmJITXxkqfaOGar+31b1KExRQr9I+OuEx9HiEJ8jbKonwB6gibS27QPGNOSF8Vewlr9mh/v3IXlycACPfZ0WcsbwNhnZKSGUBSCo7DEwS20Wxce89hO9/XAwu58oo+SkMJH+E8lq1Jc5T4Pr/LMwgRhz1/RfVn8wp9eF9aAFI22faXMoj2DuIUZ31uqpGQqgSFa80VeeQ/3TGuG3GJ0j2evCzmXMDzyQeBbeSVqv3i6rsr8pCUPokYy+eEHZiD/z1k3hhMPSUVUhXmegXFKg1HqU7NRZZrESepcpN3e7g40ODQYeIoaIfqTfqoUsIrpH/iD+Y/CMPRhglriP9I2uaEblFhlIz7MOF2/fnYeNNxTqbGHPZzSl+8JE5szMvD0r/dQUZKIpjW9N9iPKthiutW8PW3pRxs9Wq8dILhKQBWXMSI3nTpdSz0JCNPC2SRGSWUglj5x5puh8H70NGspQ3h+yy0Cltm1aFqyg1+TRumffP3Hqx0IedRbq89Z9oXGE+
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(346002)(39850400004)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(36860700001)(316002)(54906003)(478600001)(5660300002)(8936002)(6862004)(36756003)(86362001)(33656002)(82310400005)(2906002)(4326008)(8676002)(40480700001)(82740400003)(70206006)(70586007)(356005)(41300700001)(81166007)(66574015)(47076005)(26005)(6506007)(6512007)(53546011)(6486002)(966005)(83380400001)(336012)(2616005)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 19:52:11.8528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5493f26-97e7-4d90-b208-08db347cea90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5790
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:52:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179652

DQoNCj4gT24gMyBBcHIgMjAyMywgYXQgMTQ6MDAsIELDtnN6w7ZybcOpbnlpIFpvbHTDoW4gPHpi
b3N6b3JAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IDIwMjMuIDA0LiAwMy4gMTI6NTkga2VsdGV6
w6lzc2VsLCBSb3NzIEJ1cnRvbiDDrXJ0YToNCj4+IE9uIDMxIE1hciAyMDIzLCBhdCAxMDo0Niwg
Wm9sdGFuIEJvc3pvcm1lbnlpIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDx6Ym9zem9yPWdt
YWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiBSZWdhcmRpbmcgbXkg
YXR0ZW1wdHMgdG8gZml4IHRoaXM6IEkgaGF2ZSBsb29rZWQgaW50bw0KPj4+IG1ha2luZyB0aGVz
ZSBleGVjdXRhYmxlcyB1c2UgIm5hdGl2ZTogdHJ1ZSIgYnV0IGl0DQo+Pj4gd291bGQgbmVlZCBk
dXBsaWNhdGluZyBhbGwgdGhlIGRyaXZlciBhbmQgbGlicmFyeSB0YXJnZXRzDQo+Pj4gd2l0aCAi
bmF0aXZlOiB0cnVlIiwgdG9vLCBhbmQgaXQgc2VlbWVkIHRvIGJlIHRvbyBpbnRydXNpdmUuDQo+
Pj4gQWxzbywgaXQgZG9lc24ndCBlbGltaW5hdGUgdGhlIG5hdGl2ZSBkZXBlbmRlbmN5IGNoYWlu
LA0KPj4+IGJ1aWxkaW5nIHRoZXNlIGV4ZWN1dGFibGVzIHdvdWxkIHN0aWxsIG5lZWQgc3lzdGVt
ZC1uYXRpdmUsDQo+Pj4gbGliZ3VkZXYtbmF0aXZlIGFuZCBsaWJndXNiLW5hdGl2ZS4NCj4+IEni
gJlkIHNheSB0aGlzIGlzIHN0aWxsIHRoZSBjb3JyZWN0IHNvbHV0aW9uLCBhbHRob3VnaCB0aGUg
4oCYbmF0aXZl4oCZIGxpYmZwcmludCB3b3VsZCBiZSBhcyBsZWFuIGFzIHBvc3NpYmxlIGFuZCBu
b3QgdGhlIGVudGlyZSBsaWJyYXJ5Lg0KPiANCj4gSG9wZWZ1bGx5IHNvbWVvbmUgY2FuIHNvbHZl
IHRoaXMgYnVnIHNvb246DQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9tZXNvbmJ1aWxkL21lc29uL2lz
c3Vlcy8xMTAyOQ0KPiBGV0lXLCBJIGNvbW1lbnRlZCBhYm91dCB0aGUgcHJvYmxlbSBidXQgdGhl
IG1lc29uDQo+IGNvZGViYXNlIGlzIG92ZXIgbXkgaGVhZCBzbyBJIGNhbid0IGZpeCBpdC4NCj4g
DQo+IFRoZW4gbGliZnJpbnQgKGFuZCBwcm9iYWJseSBvdGhlciBtZXNvbiBiYXNlcyByZWNpcGVz
DQo+IGluIFlvY3RvKSB3b24ndCBuZWVkIGEgbmF0aXZlIHBhcnQuDQoNCkZXSVcgSSBqdXN0IHRv
b2sgYSBzdHJpcHBlZCBkb3duIGNvcHkgb2YgeW91ciBsaWJmcHJpbnQgcmVjaXBlIGFuZCBpdCBo
YXBwaWx5IGJ1aWx0IHVzaW5nIHFlbXXigJlzIGV4ZSB3cmFwcGVyIGluIG9lLWNvcmUgbWFzdGVy
Lg0KDQpTbywgeWVzLCBpdCB3b3VsZCBiZSBnb29kIGlmIHRoZSBidWlsZCB1c2VkIG5hdGl2ZSBp
bnN0ZWFkIG9mIHJlbHlpbmcgb24gcWVtdSwgYnV0IGl04oCZcyBub3QgYSBoYXJkIGJsb2NrZXIu
ICBXZSBzaG91bGQgZGVmaW5pdGVseSBiZSBkb2luZyBBQiBydW5zIG9mIHBva3kgd2l0aCB0aGUg
ZXhlIHdyYXBwZXIgZGlzYWJsZWQgdG8gZXhlcmNpc2UgdGhvc2UgY29kZXBhdGhzLg0KDQpSb3Nz

