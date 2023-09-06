Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A149EB8FB9
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:39:42 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web10.7489.1694003977976563415
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yyCUjasJ;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yyCUjasJ;
 spf=pass (domain: arm.com, ip: 40.107.22.76, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6txKbVQ6zDQpLDrFlyljOIbCy3eymrc9uk54UeM067A=;
 b=yyCUjasJEYWl8uRuTQF39MXmeCkCgmhhAE4XFdaABME8k7UbJaaSb9kjK1Ai5CRzRaubDR0OCHurK+B4V8rnD9rAW3Qz1bAu3QxUqXlqTIpU0cnSlpiRFqlElGNhwzR0YbtHTSeg9rzsTXQ/bmOU88d0gwjyM4xBXQGQTX0usjI=
Received: from DUZPR01CA0081.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::6) by DB9PR08MB6697.eurprd08.prod.outlook.com
 (2603:10a6:10:2ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 12:39:34 +0000
Received: from DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::91) by DUZPR01CA0081.outlook.office365.com
 (2603:10a6:10:46a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.36 via Frontend
 Transport; Wed, 6 Sep 2023 12:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT032.mail.protection.outlook.com (100.127.142.185) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.26 via Frontend Transport; Wed, 6 Sep 2023 12:39:34 +0000
Received: ("Tessian outbound 169aaa6bf2b7:v175"); Wed, 06 Sep 2023 12:39:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: fe1855f80a0683f1
X-CR-MTA-TID: 64aa7808
Received: from 789e8cadc692.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CB05BD8E-87A4-47C9-AE36-B27206EF7003.1;
	Wed, 06 Sep 2023 12:39:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 789e8cadc692.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 Sep 2023 12:39:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZcUyva/K9qPkBfCU0H7506A4IIcfXhHeMAob3V1zzeWV/sH9Eckee4e1zD6Lqbos6R4UQxSaarXk99AQ68XLLToXnTEA78RIh5gmaCvLpPKGSezSnrXOHT3tpQdzYayeqkK3v30veMHA28Jjo/OTHU/4q+NEcl3uCarl3GCtrDtpvzWIUaRoGeNLF1WmXcQzeDnTJmcS0U8ogcPg/4Dn+K70zMzQQfpM0QbLZKakimhPplpaXqvVSTTrYb+3WVBwJTId+eOz4MeXB0lZYZ8/FABV7z1SPKeq8dbSmo7uafPGqBcGcecg5L1oXL1a5FB2MHVpUj9zW3YjYQiiDqQFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6txKbVQ6zDQpLDrFlyljOIbCy3eymrc9uk54UeM067A=;
 b=B/HBwmJFI6tPISo0IiF2zprbGxDxLYtG/bx93J3xK3oEwiNOlDr0g4mPtm/j6dtksS9veJnGAxLb12tuz3gUReE+3sb5Rqruj+Bo7E/WQh08mZW/xYPsB9yl4/BiUl27rqfBF5NkF1VDxI7F25j//+FOQoTHEneXSNN+p136+cVrOz2/l8OryH9k+HptmZafvxyRVVO7Z832bKDl5+jPiYOXBndtKKVa3pykT7vrwxvOONpFRdtpb1AJgVEygeLm72Hq89oUtOM8Etrpx+SEgImZK/bKcfg4hnU4QNO1t/U7A8/rgIJzO4zeWpamcpaAXe57yU5xWGRbgIu+DjlVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6txKbVQ6zDQpLDrFlyljOIbCy3eymrc9uk54UeM067A=;
 b=yyCUjasJEYWl8uRuTQF39MXmeCkCgmhhAE4XFdaABME8k7UbJaaSb9kjK1Ai5CRzRaubDR0OCHurK+B4V8rnD9rAW3Qz1bAu3QxUqXlqTIpU0cnSlpiRFqlElGNhwzR0YbtHTSeg9rzsTXQ/bmOU88d0gwjyM4xBXQGQTX0usjI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6536.eurprd08.prod.outlook.com (2603:10a6:20b:31d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 12:39:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 12:39:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/8] linux-yocto: consolidated pull request
Thread-Topic: [OE-core] [PATCH 0/8] linux-yocto: consolidated pull request
Thread-Index: AQHZ4AaFv2eW/Uorvkmp8tZZ1CWZhbANvjkA
Date: Wed, 6 Sep 2023 12:39:22 +0000
Message-ID: <2E1BC731-5CE1-41F7-88B5-3ACF145BF7B0@arm.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6536:EE_|DBAEUR03FT032:EE_|DB9PR08MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: 91473528-5479-49fc-edb9-08dbaed65320
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TJN+3XGEyAaoiUAHRY6lHvsR5vCg/M2TKjs1jdcg+SPTeipEFY3eciWZKgkJhNfyswUpux9EAPOagcphQahHATDBYoa3Np5u/ZByV/g9PbrrEx1kdxrYkgTl/n6jIIeJw+tfp3EEEPxH/QWNHljq3WVQWlbf3rtmhZ13IZDhKr/QrT7fSC3J7ELryaHZKyWydCB9/HQvzyd4w2zwgZnlw4tqr59SyKN7PFa/nO0ylz3T0GJI7h6kTu6BOEaxJkbQaKqx9jU0VPCryQ3CIQDnOouQbHblF0RMurAlbWF5iXDdGhNtKj4iLO/bnHJDA+z6Prk24KVOeG7lCEWaY6iXZO+yl4P6TNkaDdtf0Zo0p9Si77zl9zPDU3rPaIIMbzXb1KT1BlpvQni5ZrkWq44h4QRY1xCyY7zlPPNYSUvNNFtqtelSxCBrU/VeM2EehhcbcRpOT/ztdOg3CGUIevBQsWmYQLrY7ZuMxA5K3f3UmTpIx2DtOUYtow+jFNzJEZoyDhHya485qQ/+W4CstF1mPj9AKsMle45pKeeD4NWBpC9JKB4lWdzrhbBDLUKi7kK9G9yRODbPgEiCEFQ6/6PWA/JhQ9Q2UVlprUYKVsyEMFI13k7u5OcCZKkRent4+k3qOYHIgEHFyb4inAGGers4ow==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(396003)(39860400002)(366004)(376002)(186009)(1800799009)(451199024)(966005)(4744005)(41300700001)(86362001)(83380400001)(5660300002)(33656002)(478600001)(2906002)(71200400001)(91956017)(76116006)(4326008)(8676002)(8936002)(66446008)(54906003)(6916009)(66476007)(66946007)(64756008)(66556008)(316002)(6486002)(6506007)(6512007)(53546011)(2616005)(26005)(122000001)(38070700005)(38100700002)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A935D430266184E96C70234E1CFC926@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6536
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5fbe5f1d-b2b1-4d9e-261e-08dbaed64c03
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dvo3csoC4du26w3kJkllc7eN1TTuy2Bu02H4xJikJdctFx9vWUb6W5d44Bqk28gT8yXbGBTIEtNE2QMjesm/6N20mniW3uEQoHj4nhSByBHxKI+0ZX50yaeLuGANYVB6TjYJluh/x8v6qVLK+P9SU1OVdj3kdtGolCDPxrRMe8VLhoMXpwH6gz8DQvzXh6I+pbj+TdjcORbQfvZu9f1iDJ1lTnDfUWRGYVlYvEbvj+wcSvwHCacRKzY4TuxnsidFNNCrO8iyB5IpftEoYs6p3vgfPpdHlQsz76421mpkP/4xzQsqHYD92PpdrBxRR8FxFUSVy601pi7OCPieEDht0RgHoWPrbbUk86z10B1++ems+/LGLD/mx/Q21uPWFzoWSZnI1Jx4PAv0GHrJ9788vyhBWFQnORbo7/TJc3FsFicMMiSHzi/vHywNnV4MB3kMhpNY+mFIvGrSM8iZa/rSFfhtC6U8kg3/YYcgcabBAhA5F1IErmsYYijlu7wT2H9x+YN8SnVOon9QtXUkPI52qrC80X/MWqgvz5rrYz5P+3wetOmkrp9OAPcM872R298k9Iut6ALam/u01ez8VS8d2tZahBC3OTfcrfnpvMTvn2HLmFkUiV3W3u0Q0mbDWP22HrLB6kFbF8Qo+x77AEc1c9VQPs2muuxsbQxh8IP/FaynCQgm/A7pE0GqJte4PorZwzURle0BcN/O9Jtdet5SChI7ZrIS29VikV4Gz5t34A0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199024)(82310400011)(186009)(1800799009)(40470700004)(36840700001)(46966006)(41300700001)(36756003)(33656002)(86362001)(8676002)(4326008)(6862004)(8936002)(81166007)(54906003)(70206006)(70586007)(316002)(82740400003)(356005)(5660300002)(966005)(4744005)(478600001)(2906002)(36860700001)(53546011)(6512007)(6506007)(47076005)(6486002)(2616005)(40460700003)(26005)(336012)(40480700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 12:39:34.3021
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91473528-5479-49fc-edb9-08dbaed65320
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6697
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187295

T24gNSBTZXAgMjAyMywgYXQgMTU6MzcsIEJydWNlIEFzaGZpZWxkIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxicnVjZS5hc2hmaWVsZD1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+IA0KPiBGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21h
aWwuY29tPg0KPiANCj4gUmljaGFyZCwNCj4gDQo+IEhlcmUncyB0aGUgbmV4dCByb3VuZCBvZiAt
c3RhYmxlIGFuZCBjb25maWd1cmF0aW9uIGNoYW5nZXMuDQo+IA0KPiBJIGFsc28gcmFuIGludG8g
YSBidWlsZCBpc3N1ZSB3aXRoIDYuNCsgb24gb25lIG9mIG15IGJ1aWxkZXJzDQo+IGR1ZSB0byBh
IGd6aXAgbWlzbWF0Y2ggd2l0aCB6bGliIHZlcnNpb25zLiBTbyBJJ3ZlIGluY2x1ZGVkDQo+IGEg
Zml4IGZvciB0aGF0Lg0KDQpXb3VsZCB5b3UgYmUgYWJsZSB0byB0aHJvdyBpbiBhIGN2ZS1leGNs
dXNpb25zIHVwZGF0ZSB3aGVuIHlvdSB1cGdyYWRlIHRoZSBrZXJuZWxzPyAgSSBjYW4gZG8gaXQs
IGJ1dCBpdOKAmXMgZWFzaWVyIGlmIGl04oCZcyBkb25lIGFzIHBhcnQgb2YgdGhlIHVwZ3JhZGUu
DQoNCkZvciBub3cgaXTigJlzIGEgbGl0dGxlIG1hbnVhbC4gIEhhdmUgYSBjbG9uZSBvZiBodHRw
czovL2dpdGh1Yi5jb20vbmx1ZWR0a2UvbGludXhfa2VybmVsX2N2ZXMgdG8gaGFuZCB0aGVuOg0K
DQokIC4vZ2VuZXJhdGUtY3ZlLWV4Y2x1c2lvbnMucHkgIH4vQ29kZS9kcml2ZS1ieS9saW51eF9r
ZXJuZWxfY3Zlcy8gNi40LjExID4gY3ZlLWV4Y2x1c2lvbl82LjQuaW5jDQoNCih1cGRhdGUgcGF0
aHMgYXMgbmVlZGVkKQ0KDQpSb3Nz

