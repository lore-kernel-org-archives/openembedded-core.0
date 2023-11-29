Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DD0C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 11:56:23 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.88])
 by mx.groups.io with SMTP id smtpd.web11.31061.1701258976540616789
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 03:56:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hSmd73w3;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hSmd73w3;
 spf=pass (domain: arm.com, ip: 40.107.241.88, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=CrXS1YxK5R6710172tyKHP7FhqCZh4BWTw1Z3bLO144IIC4dwDGHFAtgrwrf1gkdJfgZcr+tlRyqwhZ5dG1y/3ONb1LrKhgfDSTIXVY62UdNXXXKoCC1DlhH6u0rp+empyGQEM4Zmkuod2hRqBqDnm7MblvufCrsFhTK3hXIuWKd+MYRRapZCIW4JTn9zS4o54Xe9/60p4IyjdgESvfqa2/oUrAKxBT51oVtgfQqeymn9fGRujk97crv10MwcRkihpUUxMEKuOL1SZzVLVIsY/8o/retWfXBNyMbGgAfneKaHu+Wy6jwet/gJE4wjyJ70rHhvSZ9RLQ3NAP6ART7BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASjGyESe/KZ64hlJVhGvYx6q1dyYyBl2/7jiy9oB+0M=;
 b=FXZfIzxPrcUSp6AdOD6sC9qBdo7BruxvG20P6WEZaAM73NAKje6AgrRsToeMGfPZg0jHKD0zfeomBNsFXsMm8WwmQxjNc0WtoANRT6H4Zl8GBWKD950S6PYocdwjprLRu2nXGSG+kBkSSj6C4m1183pl7ysZCx9K85NO5pHcziaVz2k94VB2GxABDQl3X1OaLsv/AFh9DM6h6hO8X1AXeRX1iKliA80vB8DWDAQqxwLmxvyclZ/PVTKls79xTvZrRKfs3qZwzHfR0wFhsQ/B2A2MoTPArmMT4It20I7nno6ED4kJjj7wdrLfwrVUDmGdNn8P/R9iI5un1XdHrE9Hgw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASjGyESe/KZ64hlJVhGvYx6q1dyYyBl2/7jiy9oB+0M=;
 b=hSmd73w3qAqxj27qrPkxA6V6maalLqccPz6l1rwzsBio9WLB2d8g9feXPtPCcsCare4514jt3FBM7gwHbm7FLh+qDyO9gbaP+w7EIqSWqrLqCVDT6zD8CkBZwJyRN3W70LKgjowv9xRVhEByFx5aA4mmla88MvzrHXx/4G3zuaE=
Received: from AS4P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5d6::19)
 by GV1PR08MB10501.eurprd08.prod.outlook.com (2603:10a6:150:163::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Wed, 29 Nov
 2023 11:56:11 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d6:cafe::65) by AS4P195CA0029.outlook.office365.com
 (2603:10a6:20b:5d6::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.24 via Frontend
 Transport; Wed, 29 Nov 2023 11:56:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Wed, 29 Nov 2023 11:56:10 +0000
Received: ("Tessian outbound e243565b0037:v228"); Wed, 29 Nov 2023 11:56:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9f40506973f146e
X-CR-MTA-TID: 64aa7808
Received: from d4feeda85b6d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0BEF1332-9E1E-4D83-BF62-AFEEB1B9B92F.1;
	Wed, 29 Nov 2023 11:56:04 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d4feeda85b6d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 29 Nov 2023 11:56:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ToXMSK5f8HM2wLK3Fsv9uDEhYZlUiJsr6oNirrlFtoOYbZwWNOV9UVETpoDCPlHWwDKpaA8dBT57lIohOWUzhptsPwZBjS+nT9UcV4ctj/K7xaHFHjbiw5i3CgF4jwNNRt9Pl+AsH3PEvl/id7G2QVsSHu3HQBCAk632+9NXWQJFmD5j7MDwNbI6+RaSM5wYQm4BnkCCEmMWZKe63qkpzL9jCb0LP/gh4QO10pbUZRndhkBxbyPq5ZFcDTKVel/FwKyGbaPIi5QKJoVngzcRbiuUrmKomcycPmjx4YuanVBMxwKbOr6pEUKerhVaC1lAE6sTnxDHFJq3WI4eLYbhUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ASjGyESe/KZ64hlJVhGvYx6q1dyYyBl2/7jiy9oB+0M=;
 b=DhdU9Fcqa7nTnC7vw1zAuxHyT3c9d6WziBEZ2s3PZqJQMHbn8rVUF+v8Azlbe4IGZ+mHCG7Dh8Ncee1BKqe9te0G8GtdmP1d/c/8bD39ePo+Y9K5IFNZjw1O6ySYXKn8yjEOqU/djaZp4p/dayoSwQbOfxuvW8tfvUkXhr4MEVYJq+u7HVN6WKPWhXc74ini+vPSW+e5UFqPoGh1/Z8b6QOKc+NZP6veW5eRzE2jSA6FXSM2MxS4hGRsaBjh/y2HIOHdSGl3FvHk3NffsSXlGlCgiYLq+z1TrG4NbB1fCwrL3EyDZpXaaioRWyZe9Fxfauo6Z9U6Le2ZZ6BhMM6u3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASjGyESe/KZ64hlJVhGvYx6q1dyYyBl2/7jiy9oB+0M=;
 b=hSmd73w3qAqxj27qrPkxA6V6maalLqccPz6l1rwzsBio9WLB2d8g9feXPtPCcsCare4514jt3FBM7gwHbm7FLh+qDyO9gbaP+w7EIqSWqrLqCVDT6zD8CkBZwJyRN3W70LKgjowv9xRVhEByFx5aA4mmla88MvzrHXx/4G3zuaE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU5PR08MB10465.eurprd08.prod.outlook.com (2603:10a6:10:518::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 11:56:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 11:56:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Joakim.Tjernlund@infinera.com" <Joakim.Tjernlund@infinera.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] Add sub dir for passwd files
Thread-Topic: [OE-core] [PATCH 0/3] Add sub dir for passwd files
Thread-Index: AQHaFzpDgpB0HGOAgUi/vzUju4UjvLCRR4qA
Date: Wed, 29 Nov 2023 11:56:02 +0000
Message-ID: <C613DFF0-DF29-408F-8D13-F3481AD77F17@arm.com>
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
In-Reply-To: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU5PR08MB10465:EE_|AM4PEPF00027A6C:EE_|GV1PR08MB10501:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d92820-c795-45bf-abd4-08dbf0d22e13
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gaGa5TCioBkerttjjjSJE848YERv6vqayPzUWSHvIeqT8nv6MoDMtQcU0zEWBhacXeOuZ+sKpeQdoDj4mcC0U17prSGVETaGfTBXQ6F3PN3ATGpWX2jQgZ+smN763Vn/a7bHBlJ0g0HQf85xtEng4NIhAvBhSqjgV9PnEu0O8VW+oIt87MiKYBPIHOgiHWvwyi0IJA7l5hsgfjGHN3Kw2taJFw3oyKI3SuLEsiEIbnA58mZwvO2uepk2mtUbcg4pi77xth1ogqKenassR3IAAxgqnnWF+cc92z6ywNP1UgRDsBK4hLjCbCxojr1oZNX8H9r9D2zIREfLiocE/fhtLETQkTI0Gf4Y5Qc/9PSCuYdwBtmVaIucR7qMwrkh3YTOziQcUiZeU4eoKrHSEH2tOhbaZBz+0zeB1OMPEQlpTXMu5D2j6nO+0/ddn7RRicFpraY90R1wXD+ZfEIvr05qjjEeTTZLgmHoayv9IIm4seeYj2fc7pX+mAcoXU3k7KfKff+GiIqNJ/KP30T/9BBGl0BDCQviKhRqlNkZuNc1Cok46KKKiUuMqRoj+395UW4ret5T4o8XMBJ3L/zSP0Vd+W2ctau80wWHOv4AZ3+YG35On68q1ennv/HOZ5UiXcJcZojjsieB8eEbpsTNPF79GnIkyVH7nFBQafGBqr0FJ4iZ4fZKtsSeozEHXG0pwf1p
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(26005)(2616005)(8936002)(4326008)(8676002)(86362001)(6512007)(6506007)(53546011)(122000001)(6486002)(71200400001)(478600001)(76116006)(91956017)(6916009)(64756008)(66946007)(66556008)(316002)(66476007)(66446008)(33656002)(2906002)(36756003)(41300700001)(38070700009)(5660300002)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2E5434162B872145B0F7AB2A47E15876@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8dea931b-3b1f-467a-6976-08dbf0d228d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NyKPCb8Be63YmybxZan4HwUBYSfrG996jLfs+W4RHa+01fHgEbAlHYByFI7y19MT/mpHhjiUZjDIurIvVy7Q8QQG5E2U8qUCCd0+IGFci7JQ99mivgif5WSHAKkggbTPQguabPabLvb5WFbpW34MuoxJrZtC3II21ylnRBRYRFiczd8a8Cjd13MpIO0LD5T7QKMNLJsLAIa3rcWg5eePOjQH1mv0ZaML330+y97pQevMLLss5fGxdgaQNTdSWQOUsO0K4XWfcO+bGWmFjmYIoOBcnjnuMhlRy3F43c59zU9IeE6RKlqqGDhNJuKRSyvgCFaJv+obYIn4YiNP8JIJjO+T9r6ADmu6g+vWK1QvS3MuBnDo/N+bd28e1DnYO5c/5tIJ4sdaRE2qBhtQA+V2DtiW2Zwet5sbMu0xjU0DpDT0+X8HzpaEEIlPCeFgxACLxIb+7sbhbF1I8+6J9h3BDEuzWY6a+KXdN9cMH2W+IJ+cqlSVKYocoa7IjYd3B2pjOtATw0WKYFG0OPmDGezDDIfUDd9knu8wuHwBYWeyGevCoNMBtk3LIqAhS6CGRkioDysRyqS287rJBhmhnM4lzolpIWt0uJ6VweYny598L5dYGa9JfFcScdPI8EIoj/jtXg7GaGvvfWNjszTMEjKxA3pVx9X5oGU2Mhp49rSnrWkpuB/7vT+jUi8V3KItdCc2PwsN/O3itf8lqgyBPJgY6HVBumPJkuxm32qLqQMYfEk=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(40480700001)(33656002)(41300700001)(81166007)(356005)(36756003)(47076005)(4744005)(83380400001)(5660300002)(82740400003)(70206006)(86362001)(336012)(2616005)(70586007)(36860700001)(26005)(6512007)(6506007)(2906002)(8676002)(8936002)(4326008)(6862004)(478600001)(40460700003)(6486002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 11:56:10.9427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d92820-c795-45bf-abd4-08dbf0d22e13
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10501
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:56:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191446

T24gMTQgTm92IDIwMjMsIGF0IDIwOjM0LCBKb2FraW0gVGplcm5sdW5kIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxKb2FraW0uVGplcm5sdW5kPWluZmluZXJhLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoZXNlIHBhdGNoZXMgYWRkcyB0aGUgcG9zc2liaWxp
dHkgdG8gc3RvcmUgcGFzc3dkL3NoYWRvdyBmaWxlcw0KPiBpbiBhIHN1YiBkaXIsIGxpa2UgL2V0
Yy9wd2RiDQo+IEluIGEgUk8gUm9vdCBGUyBvbmUgY2FuIGJpbmQgbW91bnQgYSB3cml0ZWFibGUg
ZGlyIG9uIC9ldGMvcHdkYg0KPiB0byBzdXBwb3J0IHBhc3N3b3JkIGNoYW5nZXMgZXRjLg0KDQpX
aGF04oCZcyBzbyBzcGVjaWFsIGFib3V0IHBhc3N3ZC9zaGFkb3cgdGhhdCB0aGV5IG5lZWQgc3Bl
Y2lhbCB0cmVhdG1lbnQgaW4gZm9yIHJlYWQtb25seSByb290ZnM/ICBXaGF0IGhhcHBlbnMgd2hl
biB5b3UgbmV4dCB3YW50IHRvIHN1cHBvcnQgY2hhbmdlcyB0byAvZXRjL2dyb3VwOiBkbyB3ZSBh
ZGQgYW5vdGhlciB2YXJpYWJsZSBmb3IgdGhhdCwgb3IgcmUtdXNlIFBXX1NVQkRJUj8gIFdoYXQg
YWJvdXQgL2V0Yy9ob3N0bmFtZT8gIFRoaXMgaGFzIGEgc2NhbGluZyBwcm9ibGVtOiBpdOKAmXMg
c29sdmluZyB5b3VyIG9uZSBwYXJ0aWN1bGFyIHByb2JsZW0gYnV0IG5vdCB0aGUgZ2VuZXJhbCBw
cm9ibGVtLg0KDQpBbnl3YXksIGlzbuKAmXQgdGhpcyBhIHNvbHZlZCBwcm9ibGVtIGJ5IHVzaW5n
IG92ZXJsYXlmcz8NCg0KUm9zcw==

