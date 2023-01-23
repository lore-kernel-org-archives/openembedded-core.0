Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D981EC05027
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 13:43:09 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.81])
 by mx.groups.io with SMTP id smtpd.web10.42090.1674481385323489245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Jan 2023 05:43:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=g6EYJjXt;
 spf=pass (domain: arm.com, ip: 40.107.105.81, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRvyWGqV9EksYBFxabF5Wq8mGBM3consz3P2uRu2yOU=;
 b=g6EYJjXteSk4HKf8nlgcknfB1uuT9RBQb6cqYnvTt1sLyeaSaqmlJUO6wl7Q0RGwTt9T6f0FdKD6TaAx4Niy4MD9WtRPl7XZTd8AtikUA8YvDQTnZ9D95o/s4c9q6S39sH+ur5AfL5l4+31y9qWpJNXGB0ZyxeVrgxRreWjHcIc=
Received: from DB6PR07CA0107.eurprd07.prod.outlook.com (2603:10a6:6:2c::21) by
 DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Mon, 23 Jan 2023 13:43:02 +0000
Received: from DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::af) by DB6PR07CA0107.outlook.office365.com
 (2603:10a6:6:2c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16 via Frontend
 Transport; Mon, 23 Jan 2023 13:43:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT036.mail.protection.outlook.com (100.127.142.193) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Mon, 23 Jan 2023 13:43:02 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132"); Mon, 23 Jan 2023 13:43:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4362901301765520
X-CR-MTA-TID: 64aa7808
Received: from d9f010674afd.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 737520FA-7229-41FD-A262-8AE197B6AA57.1;
	Mon, 23 Jan 2023 13:41:59 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d9f010674afd.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 23 Jan 2023 13:41:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivZoC0RC+9aSkXUH/5kqd4IM3qu6sZ12PyLchdbdsiJtCSCVQMDPuz80pSHN1i/iQTPhMav0Cx067yTJIA7MXWNtOVS/sHsgrUvnNRdT+TT4+5CzcvF+Ny61nVY+uYfPiQKAsjsICGr9f+avuhhOnBOPgTPZgDywt0lXBr4wnOKeeP0KijAt3aauir6Vt8mHuiSaDsQOLpj9TVlEVYdsgjkqaMIZQbh4H+6VjgmsTWhqop+9ldhEgIaJDqUPAcHO4Q/oXPdddrXuA+VbeukwhyOi62oh0HMfXZNwGShNctmOkQ+UKN4sB3kVQdH94VK9Ka+b43z66ZDyGuaHHUZ1/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRvyWGqV9EksYBFxabF5Wq8mGBM3consz3P2uRu2yOU=;
 b=ack90/+9iRq7e6QJfCvRzPi+LHeZM0ztW4VR/8T4xI5LeeeerPlJOzekCquqmk1xr1l3rS597L7PpGxF63LN9O4/cGY9d7rWBVm2iCm0cKQt+uQ3mLZtNZPhB27eeBhFwta9+A7bhpZ1gKN/Xq+te8it8tjZziFAi6ZdnZBtgyHPQMutWuHfWiKc9Oy50pA/adA5hhblYA2ifpFcsxuPHvoTA66qmGJufO0JVGCJZAHx1nttA7YQeoaNc2zEaaSxKQJ3N3JC2u95QQDN5TFxqlUoVevD+gDgGwEhH/LTHif/K5KxhnXPOGIpXt/tw5OKDTZjQG8hte1ycG9NMybScQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRvyWGqV9EksYBFxabF5Wq8mGBM3consz3P2uRu2yOU=;
 b=g6EYJjXteSk4HKf8nlgcknfB1uuT9RBQb6cqYnvTt1sLyeaSaqmlJUO6wl7Q0RGwTt9T6f0FdKD6TaAx4Niy4MD9WtRPl7XZTd8AtikUA8YvDQTnZ9D95o/s4c9q6S39sH+ur5AfL5l4+31y9qWpJNXGB0ZyxeVrgxRreWjHcIc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5624.eurprd08.prod.outlook.com (2603:10a6:10:1a8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Mon, 23 Jan
 2023 13:41:50 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 13:41:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>, Quentin Schulz
	<quentin.schulz@theobroma-systems.com>, Michael Opdenacker
	<michael.opdenacker@bootlin.com>
Subject: Re: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 22 Jan 2023 02:00:01 AM HST
Thread-Topic: [yocto-security] [OE-core] OE-core CVE metrics for master on Sun
 22 Jan 2023 02:00:01 AM HST
Thread-Index: AQHZLlm7q63XVIZ6802lIPUPSnx4ra6r8uQAgAAAvoCAAA0agIAAAbgAgAABtwA=
Date: Mon, 23 Jan 2023 13:41:49 +0000
Message-ID: <2E81B0F3-3747-46CD-85F2-9BBED3F1CF8E@arm.com>
References: <20230122120427.D9CF696035B@nuc.router0800d9.com>
 <D5C2125C-6245-4E41-9029-6EF99E4AE623@arm.com>
 <CANNYZj-mtOntD4NcfMKd4j5jqzCN6sP_OFrGdVWWBv8ug93=Yw@mail.gmail.com>
 <37CCF635-CA4E-4300-A49C-0F31D9472B6A@arm.com>
 <eac9dcd2a8b0f0916fd373da9f2c3ee198d437ba.camel@linuxfoundation.org>
In-Reply-To: 
 <eac9dcd2a8b0f0916fd373da9f2c3ee198d437ba.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5624:EE_|DBAEUR03FT036:EE_|DB9PR08MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 65f4a107-ac84-46d8-09e3-08dafd47bf63
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vIqVEmi/fQVBFQgXDlFHXMGHmp9M5NhQYCQ2a+iAiy2VgG9XczNjJtFxcNthJFI/EfVvnJddh6sai1SQSHwQCscMANs9VlLXLrLl5Z6pvi8Oul1W7j0fzqZYnoF8l+dQk5rJ+0aKj2sg8gRHM6P0HWDaCaMZxCprvjikaSq1lqgVO98C6R3xsXi32Lm+4Ib3nzQ53EtbUBdmiMdda4Uw2Av9udRWNgoR7NX3LhWIrdAn6ymfJ3b/y/WaBooVrPU8eDC2LavfFOsIGxWeYjxFpS3RSZXEfRxMBc+JIMx7ezLAg76YccnTK6ql2q5oaAITUdeZJjslpC3NxwB0qJj2D5yjEHL0fKbHZdZ85NLmSQRd1vPmlk8evHrU80hBv5cY47p/ekzcyL0dfCuO1+TnDSaRan0b+Ayfd7FT7zqrX3JIOJSK1m2tZTo8+/OnuIgjbefMqkl73h1KrqU7NVKPN70dSqrQTibgVlqxcP+m70DJQhxqlR8CD/XphlJ7wrM5Cyr3USJY0ktC7x+fEIAkrpmJuVV4R/3jdMZStLu63I6S71ckQm0xliZbJNWn9/kWX/9tRFt7IkHMGgUYTlmPkOmd2oblNiIpbdqCLR7jnsXnEqSUkJQ59S/b7GJzIonY+Q9UEO7i2c4+wmUsBQ9dwcdlNzKbAwtJskyxAd5untQwpSsb4dzlaifVrLJnrKKgpJq0iPH6+6myQqLlHK3nFZPiZpZCtow+te6f0MMMyN4sj47g88/VRixnCLtiX6QmzOJDHQDTvFs846DtB+afzzyXGsU+6LYpTBPL1mYhvHgUGKjETWNZw1+QzBhWgdv3
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(376002)(366004)(451199015)(122000001)(4744005)(33656002)(36756003)(316002)(54906003)(6506007)(53546011)(41300700001)(2616005)(86362001)(8676002)(66556008)(66446008)(64756008)(6512007)(186003)(26005)(8936002)(5660300002)(66476007)(4326008)(71200400001)(38100700002)(478600001)(6916009)(66946007)(6486002)(966005)(38070700005)(76116006)(2906002)(91956017)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B16E7C92982D64999410C783187758E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5624
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1334c61d-e558-443e-8154-08dafd479445
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O2Tndg5YDhjbF6nxyv/jwWdmKhCR6KdyDAiIQm/uOk8PLeXS5jOO77PK/aNyefGM5E2o9tdBLf0PPJRPI+6RgUum3Fu35ypAMyitXrsK9kbvm4hYBu9GkN9jkZCNuoKX/X4escMTyUmIA90lbXJMozVfYzEYHfsNWwpih+4cYqEzsSTlugyAEmfpUI55rXQQFrZGgPdamwG436LNbMLyp47QY24PAPz5FEyYbNv+utE9hmvz99Lcr3WLOxh59cD2hwxPhcUFu0HpTSV/GY5wkIWUk/jKUPtvxHAB15MyEsKBByEJiLH4S+fZhWT6KqJtTiNl4Nr2FZgJtz/ZiHzicTLJj5K+0zzpEprIWhE+7InJ0ZkdGTtnEc7mmV6+Ob8KOuZdSWoMQfMF4PJtdAwDeLwxvMrALpPNHdV3/hl2Ehjyle8mgV9ye6KxYH3wqkht6WOdXSib1gVx9COCJa13TAN07WICibyDuTUwIFoTA9aL/AQSudb2DabxQrmlwa431IX6jbWZNyM78w5+DG1QQ17iokEpszrLxI39sa/dAUT+s2SI7x8vpSgKmdxJIzSMJvGBSq83nfhbXDyFO6ZA7S1k7WvafgW7g3ywy8oOwpgAafP0TUTQ2dWpA4jhMqI3uFWVl9MD0CRj4YTAYFD0ka1bCyjioqfBGHcsvnCiFE1TsYCymf1q+hw3/gvLsYId7Qvm46HASuC6zYHnteNKpcCRsDqkdjxKFx2aiI99W1+OhYskQtA/uWzg6NMaTJCJ1ivQxp+7WN2CXx/yufaC8w==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(33656002)(41300700001)(40480700001)(2906002)(53546011)(36860700001)(6506007)(6862004)(8936002)(336012)(5660300002)(47076005)(2616005)(4744005)(186003)(6512007)(26005)(40460700003)(478600001)(966005)(6486002)(86362001)(82740400003)(81166007)(107886003)(356005)(8676002)(4326008)(70586007)(36756003)(70206006)(54906003)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 13:43:02.1634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f4a107-ac84-46d8-09e3-08dafd47bf63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 13:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176309

T24gMjMgSmFuIDIwMjMsIGF0IDEzOjM1LCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+PiBJ4oCZdmUgc3RhcnRlZCBicmFpbmR1bXBp
bmcgaW50bw0KPj4gaHR0cHM6Ly93aWtpLnlvY3RvcHJvamVjdC5vcmcvd2lraS9DVkVfVHJpYWdl
LCB3aGVuIGl04oCZcyBleHBhbmRlZCBhbmQNCj4+IGNvbXBsZXRlIHdlIGNhbiBsaW5rIHRvIGl0
LiBPciBtYXliZSB3ZSBzaG91bGQganVzdCBzdGFydCBhDQo+PiBNYWludGFpbmVycyBib29rIGlu
IHRoZSBkb2N1bWVudGF0aW9uPw0KPiANCj4gTGV0cyBwdXQgaXQgaW4gdGhlIG1hbnVhbC4gVGhl
IHdpa2kgaXMgZ29vZCB0byBwdWxsIHRvZ2V0aGVyIGluZm8gYnV0DQo+IEknZCBsaWtlIHRoZSBt
YW51YWwgdG8gYmUgZGVmaW5pdGl2ZS4gSSd2ZSB0aG91Z2h0IHRoaXMgYWJvdXQgcGF0Y2gNCj4g
c3VibWlzc2lvbiBmb3IgYSB3aGlsZSB0b28sIHdlIGhhdmUgdG9vIG1hbnkgZG9jcyB3aXRoIHRo
ZSB1c2VmdWwgYml0cw0KPiBvZiBkYXRhIHNwcmVhZCBvdmVyIHR3byB3aWtpcyBhbmQgYSBmZXcg
UkVBRE1Fc+KApg0KDQpDb3B5aW5nIGluIE1pY2hhZWwgYW5kIFF1ZW50aW4uDQoNClRha2luZyB0
aGUgSkZESSBhcHByb2FjaCwgSeKAmXZlIHN0YXJ0ZWQgKGFub3RoZXIpIHdpa2kgcGFnZSB0byBj
b2xsZWN0IGEgdGFibGUgb2YgY29udGVudHMgYXQgbGVhc3Q6DQoNCmh0dHBzOi8vd2lraS55b2N0
b3Byb2plY3Qub3JnL3dpa2kvTWFpbnRhaW5lcnNfTWFudWFsDQoNCknigJltIHN1cmUgdGhlcmXi
gJlzIHBsZW50eSBJIGxlZnQgb3V0LCBidXQgdGhhdOKAmXMgYSBzdGFydCENCg0KUm9zcw==

