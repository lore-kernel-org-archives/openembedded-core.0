Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B4C8EB64DA
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 11:19:18 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.86])
 by mx.groups.io with SMTP id smtpd.web11.56221.1688469554739043350
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 04:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=s+o2avdE;
 spf=pass (domain: arm.com, ip: 40.107.247.86, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny0z5TpP1fanka9s5xX7vNpF/dF4ER+o6bu5+LeJjGQ=;
 b=s+o2avdE9n3o7MTY7vDaWEJzyhuAdE6DVPmGvh/S4fv4KrL03uKpeORQC3YArpF4enSYrlMrPKdVlD602eWuO7L8bXkIqyNoVHpwZRP3+ZRgGJZPUWflW5MWl3U8xzLQuRh7MMoIBwS0d5Iag1HpgDve+NK6hNGPxQ0EX5otJTI=
Received: from AS9PR06CA0612.eurprd06.prod.outlook.com (2603:10a6:20b:46e::19)
 by AM8PR08MB6353.eurprd08.prod.outlook.com (2603:10a6:20b:361::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 11:19:11 +0000
Received: from AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::fe) by AS9PR06CA0612.outlook.office365.com
 (2603:10a6:20b:46e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Tue, 4 Jul 2023 11:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT004.mail.protection.outlook.com (100.127.140.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 11:19:10 +0000
Received: ("Tessian outbound b11b8bb4dfe8:v142"); Tue, 04 Jul 2023 11:19:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f7a8141c722fc3bf
X-CR-MTA-TID: 64aa7808
Received: from 9a44c3ba3980.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 76F2C065-FB4D-4E5B-B5A8-AF340CE766C4.1;
	Tue, 04 Jul 2023 11:19:04 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a44c3ba3980.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Jul 2023 11:19:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJGm6WUDln6deJQ+TNLpYzvrZJOc2W4dMavDDwNMLSXm7ctTRQnIgY0QSQP3ijxIlcGeYS5X0CkdvMqakbcRbDl2pBQC/zQCcI6WYdQWOrhL4fUh8plD2PiaOI5yPm7XvEvjx3kVjaZO95suMkD+Dz9A069I2+01e3pyxaQsJsjsehBuFHHVV6pk64FKM4cCKbQQp9dWt5aVO9laQ15jVSqkEzABcVJ3vm28mYVDUBZzsYf/yfcEi8ANPyPtp8w6Jdw7qiCJoOvxUObax+qhJwloIbfnNMF7MkvaVlvpFiQ6+p2HUZcjlqpsAJoERgQ4gmCDfsbpuShT/4Q3At5g7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny0z5TpP1fanka9s5xX7vNpF/dF4ER+o6bu5+LeJjGQ=;
 b=OIHBcLoTcLibHyYMVfvBo8c6gdJrrkJnfeYyW5jmpT1Fq/KkdRWmxNRp7P7s+0D69mracQ8T1j7VU64JYK1JvyehPwzPqhgNXq1/qtZ7hasHp00algGOLA1HiJ82BrN0libSdsdW4unlVTiSNbWbI0MfAHmjfD0pifbF+XHpoOXbY+YbVZKlXnUbakASylq4mNxRRJ0jDIIG3fgv5zptmati1FLDQlXuEVYXRVAB6xvNtvZSenD2tiwbgS5Hk8pk/v32YD+foXak0R07R1h+pNWQ+KwMalK4pnumZK+1oafijghxOyGNSw/7RGM5u/yz6lwWNjH2d+L4K/HtS4O5BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny0z5TpP1fanka9s5xX7vNpF/dF4ER+o6bu5+LeJjGQ=;
 b=s+o2avdE9n3o7MTY7vDaWEJzyhuAdE6DVPmGvh/S4fv4KrL03uKpeORQC3YArpF4enSYrlMrPKdVlD602eWuO7L8bXkIqyNoVHpwZRP3+ZRgGJZPUWflW5MWl3U8xzLQuRh7MMoIBwS0d5Iag1HpgDve+NK6hNGPxQ0EX5otJTI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8650.eurprd08.prod.outlook.com (2603:10a6:10:3d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 4 Jul
 2023 11:19:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 11:19:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "yang.xu@mediatek.com" <yang.xu@mediatek.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] sstatesig: Fix pn and taskname derivation in
 find_siginfo
Thread-Topic: [OE-core] [PATCH v2] sstatesig: Fix pn and taskname derivation
 in find_siginfo
Thread-Index: AQHZrivTTYfZA6FEskimKMWnhs3vUa+pdkeA
Date: Tue, 4 Jul 2023 11:19:02 +0000
Message-ID: <30C684EE-4374-4ADE-86B1-8F641BF7CECE@arm.com>
References: <20230704035806.2937-1-yang.xu@mediatek.com>
In-Reply-To: <20230704035806.2937-1-yang.xu@mediatek.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8650:EE_|AM7EUR03FT004:EE_|AM8PR08MB6353:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7b9d2e-2330-4def-a5df-08db7c807dbd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 HOuK+Gneb447sw0/psHppy7KU14GynYH9bX3va7CKknJwtc+zTZcglTj3D3RZxlWiWwGiCBIXII1z3mobe3f7M0baH5tObXB5E4hBYpTV+qrGA35BqA0RnUw82o8OD0hX0r6VptpBFUKvBceqTJhP2edcaB/rQkf8Vuypts822PVAr0UX/7MQ5PI+CRyYK/28PVB+I2DmAgb9WIRiyUmdrqaoHNx7CVnY42N10ptQH0eALQJ2/fju+BRflvUYXDEpelQF9+HYmiTSCWspcKsp/kwajJTnCM7Nb9X7JXsxaIyTK+yOMyc9gW/zUs+U26QMTevpU9/ux8hKqTrm8UUt55UYtA/V8u0bdEXU9GfvOM4fC2xN+P3+DDp4XLi2B0+S5J0MlKzWP8aKfgTBOvItvhob37lc1Falj/wSdujhYi/PXsUhULvME/t48mjsBhJaCxczd/KBdHjrijM5TBijuf8IRGmNpYhtn9+DY7FmRRyLVZeZISUBZNTXDwMKOxM3qMgFt6pAzd7pYSA/wUqfKFFF7HuFDqCUkGg8CKOEqO1ar12GnvdoI7/1ZRPI7LyvWKOukB3LwGhcoFjgK6kPko/wPZpGpAPvRpp4Vf1XZ6PdRYdy7r8/xOvSYUYJrpjV7/8HsHYStF2QosrvsNwALlJUji1HXYNuTZjpeK63TbICsQMLsHD4tK61k7dYM/n
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(26005)(6512007)(2906002)(71200400001)(6486002)(122000001)(86362001)(2616005)(38100700002)(83380400001)(53546011)(6506007)(41300700001)(38070700005)(186003)(316002)(36756003)(4326008)(66946007)(66556008)(64756008)(66476007)(6916009)(76116006)(66446008)(33656002)(91956017)(5660300002)(478600001)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EB81D20259E9844942F217DD0A4AEC0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d16e7a24-786a-45f6-6d90-08db7c807866
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BP9g9Zx10V97HjcTui9itCdUR2QKK8BfJ8mKoup2Rs4RCf4vNulD5EEqj9e0tlvXY6n2We0IwNh9BE4MExivhw1LVl3Z6+PZD83SxZNyPXKJqZxypHoAii6DypXXpgLXpEfUEcO4rpILzjcrBfrmLuxOJ9JXIQAOnkFCtzVQtLlXpD8u+aciV5356aX9JKQ6ME2lhp13Q5ch3XlzpiVfAhUUkDovxgERWLW4VowXxkzJqxJLSHI0KopqkGUOxl5B1WK82PeUsozndcHUAxz5naQzxJKpFm0ZJwWI853xNWPuy7RosW24BYefMAzr++o7naCCfdbECbnvBFHIwYO5+jyMi8n9FcJDX3vW9RJMpkSLVXVNobkGYG7iV1ueoiynV2LNQ4PWzuqPVtSEZA033UJoeh90KC6jc7pK146rqSrDaym01Hx/blBbSJ6MJI1a2BVBTgp9YQr6B2X7mql/M0oj04omI/U0Dj3V4BeCEzF2D551jKpYTqK24fOP8BUpF/ZvrKebKhFuxxBOvkz+eOHhyCTAKVP6SAQHCd58TFJeRLnR4Qsi4gRYDC58qoPyRQ6psGwyKAlu7MjpKDmLYgH12Nqn/rkl4j8nfydNVp+ohj7hO25Ak+eYjSmyTCCtSSEyrkvpQcw0e6HyK9wD9k6IvlEwofrD0Fa8bmzpbm+3Gl40L1TR6LvK/LnD4cKOxHeaiGOxpTdEBgoxbTZOCMJ++jM3qC+0pT0NeswnkFfQlLAYQc3LqSm6P0/+v1UQ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(2906002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(82740400003)(6486002)(70206006)(47076005)(316002)(70586007)(4326008)(36860700001)(53546011)(81166007)(336012)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 11:19:10.9671
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7b9d2e-2330-4def-a5df-08db7c807dbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6353
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 11:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183829

T24gNCBKdWwgMjAyMywgYXQgMDQ6NTgsIFlhbmcgWHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPHlhbmcueHU9bWVkaWF0ZWsuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gRnJvbTogWWFuZyBYdSA8eWFuZy54dUBtZWRpYXRlay5jb20+DQo+IA0KPiBUaGUgYGJi
LnNpZ2dlbi5jb21wYXJlX3NpZ2ZpbGVzYCBtZXRob2QgdHJhbnNmb3JtcyB0aGUga2V5IGZvcm1h
dCBmcm9tDQo+IGBbbWM6PG1jX25hbWU+Ol1bdmlydHVhbDpdW25hdGl2ZTpdPHJlY2lwZSBwYXRo
Pjo8dGFza25hbWU+YCB0bw0KPiBgPHJlY2lwZSBkaXI+LzxyZWNpcGUgbmFtZT46PHRhc2tuYW1l
Pls6dmlydHVhbF1bOm5hdGl2ZV1bOm1jOjxtY19uYW1lPl1gDQo+IGJ5IGBjbGVhbl9iYXNlcGF0
aHNgLiBIb3dldmVyLCBgZmluZF9zaWdpbmZvYCB1c2VzIHRoZSBvcmlnaW5hbCBmb3JtYXQNCj4g
dG8gZ2V0IHRoZSBwYWNrYWdlIG5hbWUgKHBuKSBhbmQgdGFzayBuYW1lLg0KPiANCj4gVGhpcyBj
b21taXQgY29ycmVjdHMgdGhlIG1ldGhvZCBmb3IgZGVyaXZpbmcgdGhlIHBuIGFuZCB0YXNrIG5h
bWUgaW4NCj4gYGZpbmRfc2lnaW5mb2AgYW5kIGFkZHMgaGFuZGxpbmcgZm9yIG11bHRpbGliIG5h
bWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBZYW5nIFh1IDx5YW5nLnh1QG1lZGlhdGVrLmNvbT4N
Cj4gLS0tDQo+IG1ldGEvbGliL29lL3NzdGF0ZXNpZy5weSB8IDE3ICsrKysrKysrKysrKy0tLS0t
DQo+IDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL21ldGEvbGliL29lL3NzdGF0ZXNpZy5weSBiL21ldGEvbGliL29lL3Nz
dGF0ZXNpZy5weQ0KPiBpbmRleCBmOTQzZGYxODFlLi5mMDQxYTBjNDMwIDEwMDY0NA0KPiAtLS0g
YS9tZXRhL2xpYi9vZS9zc3RhdGVzaWcucHkNCj4gKysrIGIvbWV0YS9saWIvb2Uvc3N0YXRlc2ln
LnB5DQo+IEBAIC0zMjEsMTEgKzMyMSwxOCBAQCBkZWYgZmluZF9zaWdpbmZvKHBuLCB0YXNrbmFt
ZSwgdGFza2hhc2hsaXN0LCBkKToNCj4gICAgIGlmIG5vdCB0YXNrbmFtZToNCj4gICAgICAgICAj
IFdlIGhhdmUgdG8gZGVyaXZlIHBuIGFuZCB0YXNrbmFtZQ0KPiAgICAgICAgIGtleSA9IHBuDQo+
IC0gICAgICAgIHNwbGl0aXQgPSBrZXkuc3BsaXQoJy5iYjonKQ0KPiAtICAgICAgICB0YXNrbmFt
ZSA9IHNwbGl0aXRbMV0NCj4gLSAgICAgICAgcG4gPSBvcy5wYXRoLmJhc2VuYW1lKHNwbGl0aXRb
MF0pLnNwbGl0KCdfJylbMF0NCj4gLSAgICAgICAgaWYga2V5LnN0YXJ0c3dpdGgoJ3ZpcnR1YWw6
bmF0aXZlOicpOg0KPiAtICAgICAgICAgICAgcG4gPSBwbiArICctbmF0aXZlJw0KPiArICAgICAg
ICBpZiBrZXkuY291bnQoJzonKSA+PSAyOg0KPiArICAgICAgICAgICAgc3BsaXRpdCwgdGFza25h
bWUsIGFmZml4ID0ga2V5LnNwbGl0KCc6JywgMikNCj4gKyAgICAgICAgZWxzZToNCj4gKyAgICAg
ICAgICAgIHNwbGl0aXQsIHRhc2tuYW1lID0ga2V5LnNwbGl0KCc6JywgMSkNCj4gKyAgICAgICAg
ICAgIGFmZml4ID0gJycNCj4gKyAgICAgICAgcG4gPSBvcy5wYXRoLnNwbGl0ZXh0KG9zLnBhdGgu
YmFzZW5hbWUoc3BsaXRpdCkpWzBdLnNwbGl0KCdfJylbMF0NCj4gKyAgICAgICAgYWZmaXhpdGVt
cyA9IGFmZml4LnNwbGl0KCc6JykNCj4gKyAgICAgICAgaWYgYWZmaXhpdGVtc1swXSA9PSAndmly
dHVhbCc6DQo+ICsgICAgICAgICAgICBpZiBhZmZpeGl0ZW1zWzFdID09ICduYXRpdmUnOg0KPiAr
ICAgICAgICAgICAgICAgIHBuID0gcG4gKyAnLW5hdGl2ZScNCj4gKyAgICAgICAgICAgIGlmIGFm
Zml4aXRlbXNbMV0gPT0gJ211bHRpbGliJzoNCj4gKyAgICAgICAgICAgICAgICBwbiA9IGFmZml4
aXRlbXNbMl0gKyAnLScgKyBwbg0KDQpIb3cgZGlkIHlvdSBub3RpY2UgdGhpcyBwcm9ibGVtLCB3
aGF04oCZcyB0aGUgYWN0dWFsIGNoYW5nZSBiZXR3ZWVuIHRoaXMgYW5kIHYxLCBhbmQgbW9yZSBp
bXBvcnRhbnRseSBjYW4gd2UgYWRkIGEgdGVzdCBjYXNlIGZvciB0aGlzIG9idmlvdXNseSBjb21w
bGV4IGNvZGU/DQoNClJvc3M=

