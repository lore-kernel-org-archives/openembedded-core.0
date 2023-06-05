Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABD9C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 11:57:42 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web10.5577.1685966259724034754
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 04:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=OhxRJGwZ;
 spf=pass (domain: arm.com, ip: 40.107.21.83, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1+F9UBvCbAq1Vc1iFcST+RZYb9cJjAeKO26gia+Dnk=;
 b=OhxRJGwZkidMTWauttZLhkMb/n1eTD7qpfbMVOHZYtHogQegi+9HHLQUDp1MZ3+lX8z8S8YYMqq8DQdifHQtCtX/MCirY200CLbpiVVlYJ3dzdNFX3N1yNuQ+A/lvQqoo8drsp4as58qXXbD8aRCgGfK2aOCMzeUlpIbpI5dJE4=
Received: from AM6P195CA0084.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::25)
 by AS8PR08MB9720.eurprd08.prod.outlook.com (2603:10a6:20b:614::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 11:57:36 +0000
Received: from AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::1a) by AM6P195CA0084.outlook.office365.com
 (2603:10a6:209:86::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32 via Frontend
 Transport; Mon, 5 Jun 2023 11:57:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT048.mail.protection.outlook.com (100.127.140.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.19 via Frontend Transport; Mon, 5 Jun 2023 11:57:35 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Mon, 05 Jun 2023 11:57:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e2228bc9c3e85767
X-CR-MTA-TID: 64aa7808
Received: from 83731d5a332f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 193B6601-76E1-464F-A953-D176AC821797.1;
	Mon, 05 Jun 2023 11:57:29 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83731d5a332f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 05 Jun 2023 11:57:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CjL0PlW12DW9B1NYIHeOZE4wHkpF/rnadu8eGiE9jh3n0X/d64zTWrTG6O+9mE99wsEmW31nYoF6HJBWr6azzth47WIGvhzF3a2jcObFedNWKtdXLvW0rPZSv9N/Gv30lNbHy6nrEaegprF0IQxH9qcdNiARuaJruH2XOPl1KMX1GiwF9HVq3CZQlgNIJKhI9gv12fCvzipKxk0sVLLqtfUq5a6pnqsn/0yxYHMbgyc57pHg0ZNwEXl1bS+RT9CKZtqbXL3+1J3DJHfQalPGP+xE5l7cu3LQknMxBEUY0NCYtNe7QwWcpE8O2gGolwrRC4tq5bOZbhyEWXU8vAEaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z1+F9UBvCbAq1Vc1iFcST+RZYb9cJjAeKO26gia+Dnk=;
 b=c5VEuDlxzNmbsuchI3Wdb4xYVya8RJ3+XRbnw3AM0a65xA6PLTELvfomZaTgO9QaQm63f8Uf/zrXy3worP+HvNsXnQe5OR4Vrt51oLxTPuB+EaA60ZomuqIImbz3JCbgQHGjVdK/seKIxxWdstIWVTW+0coMzhC+mGCvgHJXJfDKtgcOkSG/HDHvpWJhVU3ViGPhjHraawvhpYg0ABu/K5l/l2BKTghm524jQ9LELI9XJCTqOEWxGGWZzzHh1IjdWDIBQVR4dWLq5USHUMOjV/XPH9J6XulfdgZyVAOe+yQtBLSNRtUcn1uC+86fGsMvoneUgmL9n4XmzjKjULJpbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z1+F9UBvCbAq1Vc1iFcST+RZYb9cJjAeKO26gia+Dnk=;
 b=OhxRJGwZkidMTWauttZLhkMb/n1eTD7qpfbMVOHZYtHogQegi+9HHLQUDp1MZ3+lX8z8S8YYMqq8DQdifHQtCtX/MCirY200CLbpiVVlYJ3dzdNFX3N1yNuQ+A/lvQqoo8drsp4as58qXXbD8aRCgGfK2aOCMzeUlpIbpI5dJE4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9837.eurprd08.prod.outlook.com (2603:10a6:20b:616::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 11:57:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 11:57:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 3/3] python_mesonpy: New class
Thread-Topic: [OE-core] [PATCH v4 3/3] python_mesonpy: New class
Thread-Index: AQHZlfJ0s4G3vsHyQkCclcDxkmdyw698HdqA
Date: Mon, 5 Jun 2023 11:57:27 +0000
Message-ID: <EE298E95-80DF-45D0-A4CB-52CD86601CB0@arm.com>
References: <20230603080703.1400571-1-zboszor@gmail.com>
 <20230603080703.1400571-3-zboszor@gmail.com>
In-Reply-To: <20230603080703.1400571-3-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9837:EE_|AM7EUR03FT048:EE_|AS8PR08MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e33fef1-75f2-405b-b40b-08db65bc0d88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Cqlf57xUCArvDvR59WJ4nJBtohIWPFLIOo0xober0IgStlESg5Os1zQzmPKauGbQFGIUwCI+9Qwwhx+hmGS/YtGvypgo2Tyr6hilhwfcERt8Rlg1KWu56gfGN7TZQIdiBx83RFEQV8ps5tYg4gDye0qS/V8xC700EOwVx1TxVYJq0DPb8khneg2unmfiLsDT94xk4LXTziMTa7AvQyVg274oTx1Enh3BtS/qg7joh0pCLDZpbGUPZSANVG0OBqdNDeTPsmP5PjkKOVIUHYp0e6artMdX/E0+UC/5+FartWWBHfEva+Q28u3InZMtD8/MBBQCnVd5gLEsCFBJBr9OXKEUGeJ0kdynE6BijucINWaOeyqONC33NA7krq9Q34KutZohDWUdWArPM3Wr/ePd0S7twvbuhDa7yvYcd0NXXFw5q2odXihXoO0m9cNxepkG5v1JGTyBzLT6OqIn1YDxIc0lAFZImfyRiZ8vxjHbHEwBFCbdqiUAzBwVxG7f704nS9lD5NDbGmh2MediGHu22IY0MZRAAOsOyG8m9BTMU5GDpGTgaHz1Dv286d0eOnjTVcnnsCEL1Jd6UcR7Bdj2bDY+gAl2D8sT/NJplGuvSIwei8KM6OjuwbfROybHEDQq45DsO8nYuJysEX8Dw+7olQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(8676002)(8936002)(478600001)(966005)(316002)(41300700001)(5660300002)(6486002)(26005)(186003)(76116006)(4326008)(71200400001)(91956017)(64756008)(66446008)(66556008)(66946007)(66476007)(6916009)(66899021)(6512007)(53546011)(6506007)(2616005)(83380400001)(2906002)(66574015)(38100700002)(122000001)(38070700005)(86362001)(33656002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <578D48B61217C54FB0106FF1838D2904@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9837
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0d97f519-b2b5-4f10-c93b-08db65bc088c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RjUtJICRq8d+x8jpyf8dFM/PakhXHGeAYyIXfxImoPZdsFcDskwbxYcH4CCx2Pc3aRPimpYZ/S4UR1mYUKh65Euvqg3jU7wUljgIdASK5KrDB73fsNFg7AdVW5s7pewmTY8laA2Qlcyd0kcDFIyARQo0b10udDilag43apinxgUKZL67MqvdycOhcKpKDCiF0UeNWBEuRk5GloVA+PrLqb01C4hL/FrUWyxhMYYJmh8zMQaf7L4b2zZxCngcEHw18jwOQpV/mf0nfIqGI99BAB9CqXykpPQ/6gGWWLdePxDvRiMfYwnfKG03ZnIuUERJqvomhKueSZ0kzLygBiFhT6vpt3WRlo5liXg8Diep9QG6pmWmggaVWAQx1q7LzhsjD7qs8XrEtg1MblPH/wcLAex8QGPKAsISrY+x885xk5vbFeSnEqZootudGBIo+3ULmg/j6Etbxl9MK8BfhJVkTajJXGEmFsshLV5gGp/fGjzpsWnNOVFfLxyzmwi4c5DwO1gPOwGaSXJUdJ9zD4V03VlbWw5IpVtQ43c16R8BcDtyBKJaHgojL469ALChSNce0va9oaEpJT2oMERyxAPF/hpZoyV2kY7nRwJ6cwJ4LXpciSkeu4Nm3DrSUhGgBMUOePFYCO5REH9sd9n64zmsLv+zoiqrw7AQ9WvwzYsp/dKUjL6NrephVETvBkmyelNJA/Bdjak1tKYRfGdpD+GQLSvbYBVB/V2Z4B7t253NWRg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(478600001)(356005)(81166007)(82740400003)(8936002)(6862004)(8676002)(4326008)(70586007)(70206006)(316002)(41300700001)(2616005)(186003)(336012)(36860700001)(83380400001)(66574015)(47076005)(966005)(6486002)(53546011)(6506007)(6512007)(26005)(33656002)(82310400005)(86362001)(5660300002)(2906002)(36756003)(66899021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 11:57:35.7908
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e33fef1-75f2-405b-b40b-08db65bc0d88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9720
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 11:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182378

RG8geW91IGhhdmUgYSByZWNpcGUgaW4gbWluZCB0byBkZW1vbnN0cmF0ZSB0aGF0IHRoaXMgd29y
a3MgYXMgaW50ZW5kZWQ/DQoNCklmIHRoZXJl4oCZcyBub3RoaW5nIGluIGNvcmUgdGhhdCBuZWVk
cyBpdCwgbWF5YmUgaXQgc2hvdWxkIHNpdCBpbiBtZXRhLXB5dGhvbiB1bnRpbCB0aGVuLg0KDQpS
b3NzDQoNCj4gT24gMyBKdW4gMjAyMywgYXQgMDk6MDcsIFpvbHRhbiBCb3N6b3JtZW55aSB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8emJvc3pvcj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBUaGlzIGlzIGEgbmV3IFBFUDUxNyBjb21wYXRpYmxlIGJ1
aWxkIGNsYXNzIGZvciBweXRob24gbW9kdWxlcw0KPiB0aGF0IHVzZSBweXByb2plY3QudG9tbCBh
bmQgdGhpczoNCj4gDQo+IFtidWlsZC1zeXN0ZW1dDQo+IGJ1aWxkLWJhY2tlbmQgPSAnbWVzb25w
eScNCj4gDQo+IFRoZSBuZXcgY2xhc3MgdXNlcyBweXRob24zLW1lc29uLXB5dGhvbi1uYXRpdmUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBab2x0w6FuIELDtnN6w7ZybcOpbnlpIDx6Ym9zem9yQGdt
YWlsLmNvbT4NCj4gLS0tDQo+IG1ldGEvY2xhc3Nlcy1yZWNpcGUvcHl0aG9uX21lc29ucHkuYmJj
bGFzcyB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysNCj4gMSBmaWxlIGNoYW5nZWQsIDU0IGlu
c2VydGlvbnMoKykNCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEvY2xhc3Nlcy1yZWNpcGUvcHl0
aG9uX21lc29ucHkuYmJjbGFzcw0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNp
cGUvcHl0aG9uX21lc29ucHkuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvcHl0aG9uX21l
c29ucHkuYmJjbGFzcw0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAw
Li4xZGE4YjAwNWFiDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lw
ZS9weXRob25fbWVzb25weS5iYmNsYXNzDQo+IEBAIC0wLDAgKzEsNTQgQEANCj4gKyMNCj4gKyMg
Q29weXJpZ2h0IE9wZW5FbWJlZGRlZCBDb250cmlidXRvcnMNCj4gKyMNCj4gKyMgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXI6IE1JVA0KPiArIw0KPiArDQo+ICtpbmhlcml0IG1lc29uIHNldHVwdG9v
bHMzLWJhc2UgcHl0aG9uM3RhcmdldGNvbmZpZyBweXRob25fcGVwNTE3DQo+ICsNCj4gKyMgRmls
dGVyIG91dCBtZXNvbl9kb19xYV9jb25maWd1cmUgZnJvbSBkb19jb25maWd1cmVbcG9zdGZ1bmNz
XQ0KPiArRE9DT05GSUdVUkVQT1NURlVOQ1MgOj0gIiR7QGQuZ2V0VmFyRmxhZygnZG9fY29uZmln
dXJlJywgJ3Bvc3RmdW5jcycpfSINCj4gK0RPQ09ORklHVVJFUE9TVEZVTkNTOnJlbW92ZSA9ICJt
ZXNvbl9kb19xYV9jb25maWd1cmUiDQo+ICtkb19jb25maWd1cmVbcG9zdGZ1bmNzXSA6PSAiJHtA
JycgaWYgZC5nZXRWYXIoJ0RPQ09ORklHVVJFUE9TVEZVTkNTJykgaXMgTm9uZSBlbHNlIGQuZ2V0
VmFyKCdET0NPTkZJR1VSRVBPU1RGVU5DUycpIH0iDQo+ICsNCj4gKyMgVGhpcyBwcmV2ZW50cyB0
aGUgbWVzb24gZXJyb3I6DQo+ICsjIEVSUk9SOiBHb3QgYXJndW1lbnQgYnVpbGR0eXBlIGFzIGJv
dGggLURidWlsZHR5cGUgYW5kIC0tYnVpbGR0eXBlLiBQaWNrIG9uZS4NCj4gK01FU09OT1BUUzpy
ZW1vdmUgPSAiLS1idWlsZHR5cGUgJHtNRVNPTl9CVUlMRFRZUEV9Ig0KPiArDQo+ICtDT05GSUdV
UkVfRklMRVMgPSAicHlwcm9qZWN0LnRvbWwiDQo+ICsNCj4gK0RFUEVORFMgKz0gInB5dGhvbjMt
d2hlZWwtbmF0aXZlIHB5dGhvbjMtbWVzb24tcHl0aG9uLW5hdGl2ZSINCj4gKw0KPiArZGVmIG1l
c29ucHlfZ2V0X2FyZ3MoZCk6DQo+ICsgICAgdmFycyA9IFsnTUVTT05PUFRTJywgJ01FU09OX0NS
T1NTX0ZJTEUnLCAnRVhUUkFfT0VNRVNPTiddDQo+ICsgICAgdmFybGlzdCA9IFtdDQo+ICsgICAg
Zm9yIHZhciBpbiB2YXJzOg0KPiArICAgICAgICB2YWx1ZSA9IGQuZ2V0VmFyKHZhcikNCj4gKyAg
ICAgICAgdmFsbGlzdCA9IHZhbHVlLnNwbGl0KCkNCj4gKyAgICAgICAgZm9yIGVsZW0gaW4gdmFs
bGlzdDoNCj4gKyAgICAgICAgICAgIHZhcmxpc3QuYXBwZW5kKCItQ3NldHVwLWFyZ3M9IiArIGVs
ZW0pDQo+ICsgICAgcmV0dXJuICcgJy5qb2luKHZhcmxpc3QpDQo+ICsNCj4gK1BFUDUxN19CVUlM
RF9PUFRTID0gIi1DYnVpbGRkaXI9JyR7Qn0nICR7QG1lc29ucHlfZ2V0X2FyZ3MoZCl9Ig0KPiAr
DQo+ICsjIFB5dGhvbiBweXggLT4gYyAtPiBzbyBidWlsZCBsZWF2ZXMgYWJzb2x1dGUgYnVpbGQg
cGF0aHMgaW4gdGhlIGNvZGUNCj4gK0lOU0FORV9TS0lQOiR7UE59ICs9ICJidWlsZHBhdGhzIg0K
PiArSU5TQU5FX1NLSVA6JHtQTn0tc3JjICs9ICJidWlsZHBhdGhzIg0KPiArDQo+ICtweXRob25f
bWVzb25weV9kb19jb25maWd1cmUgKCkgew0KPiArICAgIHB5dGhvbl9wZXA1MTdfZG9fY29uZmln
dXJlDQo+ICt9DQo+ICsNCj4gK3B5dGhvbl9tZXNvbnB5X2RvX2NvbXBpbGUgKCkgew0KPiArICAg
IHB5dGhvbl9wZXA1MTdfZG9fY29tcGlsZQ0KPiArfQ0KPiArDQo+ICtweXRob25fbWVzb25weV9k
b19pbnN0YWxsICgpIHsNCj4gKyAgICBweXRob25fcGVwNTE3X2RvX2luc3RhbGwNCj4gK30NCj4g
Kw0KPiArcHl0aG9uX21lc29ucHlfZG9fYm9vdHN0cmFwX2luc3RhbGwgKCkgew0KPiArICAgIHB5
dGhvbl9wZXA1MTdfZG9fYm9vdHN0cmFwX2luc3RhbGwNCj4gK30NCj4gKw0KPiArRVhQT1JUX0ZV
TkNUSU9OUyBkb19jb25maWd1cmUgZG9fY29tcGlsZSBkb19pbnN0YWxsDQo+IC0tIA0KPiAyLjQw
LjENCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUg
KCMxODIzNDkpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzE4MjM0OQ0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tdC85OTMwMTY0NS82ODc1ODg4DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1i
ZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBo
dHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBb
cm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQoNCg==

