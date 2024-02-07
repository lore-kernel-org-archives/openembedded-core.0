Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B284C4828F
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 15:58:48 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.67])
 by mx.groups.io with SMTP id smtpd.web10.916.1707321518741762414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 07:58:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E3uziSvp;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E3uziSvp;
 spf=pass (domain: arm.com, ip: 40.107.20.67, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aOMoxDQSTWJ64HgDQEl/5XEGEArYnvEN4wE96t88pkBbwM0VD9ZVWRn9luOn+QG86F2BJx8ln3Ya2XGLboRZgUk70wdfGIB8LkSCBm0uvNnEKl1itGdN2GQceq2854iiprRCnMxsoGQ9Og5jhWp8+DEVemnyh/inra7rJaDg/0iytHOxQzXBM40Vxlt1ytS6x230ihQ7JyMQ1h9jMgUkmM34rXkmHQdeqt+hw9KuW08CgrAXo+ycaqWQBP207ImshxjtG7B1JjBOK7eCMzEeUwS/GS2W5dNDl2BFZAe/+R+1s7QSypN9l2IOn1cwXPrkDWn0NWsbkUWw9943I6FXzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9TOxVKxgLaLIlNHcIKZV9Tg0iOGf/uenbeOlVfApBo=;
 b=kAflnDVsK4/iiqkUTR9Y48Gi2f/hRFEfGxGpHA5KlFvl8pUN+Lje3R/o5pEQVZr5ddp2IJUZNh1Eq8IPfwPqqMI0KFa+j+GyYhi9p0hNlgo6x1MuETB0zAZ6MUUvqkiwu/gBAni3CPRz8IRkOhXBLCT9p6MzTtvhXz/J3sA/pgnECAkOHfQgplotrYcTgbHfA6IaFm48VNpIDhNQNUyjH7EirgnOqf9pq8UVukWzs2qfvTvyPaKsZiZNAKH8mYXCcYfVmEQoMU3oXIxIfjE8dwTXIfAkTbRsilLEhWOTsUxgSCfsKDv1kCtYCf+TvKh0MElT23TgT9p8gy4Aww6tIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9TOxVKxgLaLIlNHcIKZV9Tg0iOGf/uenbeOlVfApBo=;
 b=E3uziSvp/dpUxeL0wZEqE5VHdZfFBHp/lbgqVPCEOzF2TeQXFvlUrwfaSV65T+3eMrKflZmVmHtW3cvbuw6eVTjvMmwoLxGQ1Zm7w2V5CKxE6zfbrZTTgPWCFMXeBuqoAQuD7zS9zrc8jGseAMu0R9lMHRrxXd0O1AgIcNLOxmI=
Received: from AS9PR07CA0013.eurprd07.prod.outlook.com (2603:10a6:20b:46c::10)
 by AM0PR08MB5443.eurprd08.prod.outlook.com (2603:10a6:208:183::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37; Wed, 7 Feb
 2024 15:58:35 +0000
Received: from AMS0EPF000001B1.eurprd05.prod.outlook.com
 (2603:10a6:20b:46c:cafe::f6) by AS9PR07CA0013.outlook.office365.com
 (2603:10a6:20b:46c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16 via Frontend
 Transport; Wed, 7 Feb 2024 15:58:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B1.mail.protection.outlook.com (10.167.16.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 15:58:35 +0000
Received: ("Tessian outbound 31df1b57f90c:v228"); Wed, 07 Feb 2024 15:58:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: eb32a72af02ac5dd
X-CR-MTA-TID: 64aa7808
Received: from 9aa19cdc869f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id EB94F4DE-A4D8-42FA-9FDD-5FB0F4481F1D.1;
	Wed, 07 Feb 2024 15:58:27 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9aa19cdc869f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 07 Feb 2024 15:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLd4zrcX9HHgvRy/8FcTbZ6ex5uaNax8X7IFLKKaDb/HPSMZcz7LUMuimO8OEVEZ7B9mWFzhqyMRNDyGBr/pQyhUHZdpRDx4jNGGrqOXQy9vEnsx+ef28BhQ7Efzct4asEN/L7kInSC81jjZatyP1yMdB+I/kzLMwwHHRGRqh3yox9FRtLTA10RLTjUmtsvIlpfBTJFjaB0PNvv/AhQZehM87d2Nh5bt6e0pGT7nZI0DXyzLHu8/k0TkdjMw8dEjPZznEN7n965G/9Yd4phgrt9KR6xk51vpsSNShouF4YrBcQdO44NdNjen9ToGwJWHXAtopVXbtY1z0MAYHV+j0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9TOxVKxgLaLIlNHcIKZV9Tg0iOGf/uenbeOlVfApBo=;
 b=n8N6hVWYzCtEyHp+vX7p4NJCcAsXoZp1bng1TAQWM0eB2JvfFCeqZGp1kcz4k+COT+xLB+0LmVOjuWv3QYBC/aVXh+Mw5A0Mk8d644aKIIYJT59ikMv7MN80DazV/ag6oV8g1WeteMbKGYU3cjMSWQgRkKZCKE+k8ciaH8uuy8qip0EB0rKAjnuWDw+d0MihVzBNJtGDEhLM4Xyy3aMlmjUMgmjfYmh2regoZHEP4IhgIScW72iGSnejGtR9HLawcp3CsjCq+t6EtmLesLxOChG3SD5Vq57/GUQG9BW9HqDcoIHkMT5/ADPguZglOaB6MgEF7h5XwOHU30iKlaxqew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9TOxVKxgLaLIlNHcIKZV9Tg0iOGf/uenbeOlVfApBo=;
 b=E3uziSvp/dpUxeL0wZEqE5VHdZfFBHp/lbgqVPCEOzF2TeQXFvlUrwfaSV65T+3eMrKflZmVmHtW3cvbuw6eVTjvMmwoLxGQ1Zm7w2V5CKxE6zfbrZTTgPWCFMXeBuqoAQuD7zS9zrc8jGseAMu0R9lMHRrxXd0O1AgIcNLOxmI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6489.eurprd08.prod.outlook.com (2603:10a6:10:256::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 15:58:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 15:58:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "matthias.schiffer@ew.tq-group.com" <matthias.schiffer@ew.tq-group.com>
CC: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	"oss@ew.tq-group.com" <oss@ew.tq-group.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: install .config to deploy dir
Thread-Index: AQHaWbAlf0LqASD2jUO3umsU4hjzdbD/CYqA
Date: Wed, 7 Feb 2024 15:58:25 +0000
Message-ID: <4021EB06-42BE-45D5-9F7A-EE0F63F8EA30@arm.com>
References: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
In-Reply-To: <20240207102529.128369-1-matthias.schiffer@ew.tq-group.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6489:EE_|AMS0EPF000001B1:EE_|AM0PR08MB5443:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3698ef-5e51-4490-b7b3-08dc27f5a3f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hiJMzjOcNTSUsGIF16wHYG6290GOPYo2U+89VkEIrNfRO6OcYJ0FVnCgjM3fozZs3oxI2/o9NXv7a9C8xTJ8dEKeP31MRlbgqcjrVpHN/DL29H1JhUrYehn8jx18zrDetytPYFJ06b5MArEgMyPJDCS1hXTxHTtUNPs5YgYsI9pfkiGNrhme4KyyMCjp0O+PzGntIt96+/bAj7Q6lfNL6gnA/y1YM/VTmGBX/4hqeJIgR1cfF+FVkyF4/k+DOaBZF0k+EgKEBAzQi99SaJHke+/GZzrp8i6A5DzpWhn1guYGfIed7Wc9EIz6rJqxUksnSK7H1uWHEljyEE2Qb3fLdrNXc70Gts5mfAtrrA1h3GZNy4mkxpdtbP1l4nL/YYXkFYcUvgwbSy/khX3b5Nr5QB2mYpwcsB9enBxrUQ8hY5rmQXtxKy7kWNHEyS4ao/1fnHScn6Q/mT4yYpuJhb3fi9cvlynIwaHoXwDHoEB0wP+kOPi2QXHhIo8nlN27bII6h9Y7hfbGY+jo0kYiP8/IvqXbMAEY/VBuePuNOAdSU6lrbANJSdSkhDe4+K7s80wRxrNVfVAfIGA+YPLfG1CEMT6N38o+c7dTiLrjQiyAkjvMdM0ttDjHyfQQwvjdi9mQZgCHJ4AVDCv3b8xGBsb+GA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(39860400002)(396003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(83380400001)(122000001)(38100700002)(76116006)(41300700001)(316002)(66946007)(26005)(64756008)(66446008)(54906003)(6916009)(66556008)(38070700009)(4744005)(86362001)(66476007)(8676002)(4326008)(8936002)(6512007)(36756003)(33656002)(478600001)(6506007)(71200400001)(2616005)(53546011)(5660300002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F667947DC03B4B43BAB4C971D231FA99@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6489
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	33594aa8-d57d-43ec-8ac4-08dc27f59e8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EPpj7/5LJHmTFHPsxVdgpvY1PU30E3i+l/kX1wAnvv3IlpXkSfRSxiHvUjo/L7PYZyed9YGtGir/Qy7cZ8sKVg/Y7ol94d1AeFZ+qtTgoBPTBbR1b7V4qcwXU7fvLMrQHyGU3tCXV2DSQ3jgRBs2UV+cG4VJmZh2476ZS1d3Eu5fftKznPnN/QUMh8qDk7gQvj/m/4jvgpxANkzj7902P584Joy49jf+IecLuzkRTDTdg5OB7Myl5qquo2mV3dx6plSrL4oSh5w637jEnUoKPbBzyYvdy3sTuNrdH4s54C5MVvGg+5W6lPnBKFRKhXkTXBBV1/RfXBOwhKxiRMNqXl9FmZzTE29Y4C0nceRDZ8UVqhLTbIjS6UVAJ5F3xvbn5QMilGYp8GYYaZudbVDx8Pg0FU6DBg80nFmhzc6qfvM73DI3JDcUNrRZ6s6QRlexZBf7w5h46nC+MA0FCajTdGP6m9Nyk9TpPq/qTUiNNszQo8M/NrIoUHRTYJb0RLXZ4uQExEFX+tGkVYe2HDX3G6dleYGNrTkGTqucARxLmGJ2sdAaAUV2IZE1wZkIGZMHYs5rCR+uj4T0ffkki6iL4N8loMWY3xFPuJPzHK1oSByCmmK/35cXW8Wsv75UjxKxDbDEmRANf2yFI7eKR4OVOyl86mup2wEzR2vvH6pLFBqMPxDwUUVFh3tD0w+IKd+yAwynDBS8HEj+3YbX4e+a9f31phebo0RYEJd+hERLWaUgYM1n2g2l9cpL8RQDJRja
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(2906002)(47076005)(41300700001)(5660300002)(86362001)(36756003)(33656002)(36860700001)(81166007)(6486002)(356005)(478600001)(83380400001)(82740400003)(6862004)(6506007)(4326008)(8676002)(107886003)(6512007)(316002)(8936002)(70206006)(70586007)(54906003)(2616005)(26005)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 15:58:35.0075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3698ef-5e51-4490-b7b3-08dc27f5a3f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5443
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 15:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195068

T24gNyBGZWIgMjAyNCwgYXQgMTA6MjUsIE1hdHRoaWFzIFNjaGlmZmVyIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxtYXR0aGlhcy5zY2hpZmZlcj1ldy50cS1ncm91cC5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBEZXBsb3kgdGhlIGtlcm5lbCBjb25maWd1cmF0
aW9uIHdpdGggdGhlIGJ1aWx0IGltYWdlcywgc28gaXQgaXMgZWFzeSB0bw0KPiBjaGVjayBpdHMg
Y29udGVudHMsIG9yIHJlYnVpbGQgdGhlIHNhbWUgY29uZmlndXJhdGlvbiBvdXRzaWRlIG9mIHRo
ZQ0KPiBZb2N0byBidWlsZCBzeXN0ZW0uDQoNCkZvciB3aGF0IGl0J3Mgd29ydGgsIEkgYWRkZWQg
YSB0YXNrIHF1aXRlIHJlY2VudGx5IHRvIHRlbGwgeW91IHdoZXJlIHRoZSBjb25maWcgZmlsZSBp
cyAoYW5kIGdlbmVyYXRlIGl0LCBpZiBuZWVkZWQpLCBzbyBmb3Ig4oCcd2hhdCBkaWQgdGhpcyBr
ZXJuZWwgSSBqdXN0IGJ1aWx0IGhhdmUgYXMgdGhlIGNvbmZpZ+KAnSB0aGF0IGlzIHBvdGVudGlh
bGx5IG1vcmUgdXNlZnVsIHRoYW4gZGVwbG95aW5nIGFzIGl0IHdvcmtzIGV2ZW4gd2hlbiB0aGUg
Y29tcGlsZSBmYWlscywgb3IgaWYgaXQgaGFzbuKAmXQgZmluaXNoZWQgeWV0Og0KDQokIGJpdGJh
a2UgdmlydHVhbC9rZXJuZWwgLWMgc2hvd2NvbmZpZw0K4oCmDQpDb25maWcgZmlsZSB3cml0dGVu
IHRvIC95b2N0by9yb3NzL2J1aWxkL3RtcC93b3JrL3FlbXVhcm02NC1wb2t5LWxpbnV4L2xpbnV4
LXlvY3RvLzYuNi4xMitnaXQvbGludXgtcWVtdWFybTY0LXN0YW5kYXJkLWJ1aWxkLy5jb25maWcN
Cg0KDQo+IFRoaXMgY2FuIGJlIHBhcnRpY3VsYXJseSBjb252ZW5pZW50IHdoZW4gcnVubmluZyBh
IFlvY3RvIGJ1aWxkIGFzIGEgQ0kNCj4gam9iLCBhbmQgb25seSB0aGUgZGVwbG95IGRpciBpcyBt
YWRlIGF2YWlsYWJsZSBmb3IgZG93bmxvYWQuDQoNCknigJltIHdvbmRlcmluZyBpZiB0aGUga2Vy
bmVsLWRldiBwYWNrYWdlIHNob3VsZCBzcGxpdCB0aGUgY29uZmlnIG91dCBpbnRvIGEgc3VicGFj
a2FnZSwgc28gaXQgY2FuIGJlIGluc3RhbGxlZCBvciBleGFtaW5lZCBzZXBhcmF0ZWx5Lg0KDQpS
b3Nz

