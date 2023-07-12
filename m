Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9526EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 10:37:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web10.4233.1689158215958411761
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 03:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E53cY8Dr;
 spf=pass (domain: arm.com, ip: 40.107.22.83, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htZIXyt3NSKjY4KnuexUCZxlTOda0DmBN21ClscXCeA=;
 b=E53cY8DrQ/PoU2BcbKbnnoC3bL0ut/Br1i5q03idlkB1LYpnoNd0eamSZ0Bj55GAO/cp8htLBO2Wa7oEznclMJQOLxPDcQ3tSJoGbo8J2dCX2gQTBkOWQKu9viZaAtrXZcLHulqo0O0v8tWcac6+9UP14yIXvOeBRji2gSeeANM=
Received: from AS9PR06CA0121.eurprd06.prod.outlook.com (2603:10a6:20b:467::12)
 by AS2PR08MB9295.eurprd08.prod.outlook.com (2603:10a6:20b:599::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 10:36:52 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::3b) by AS9PR06CA0121.outlook.office365.com
 (2603:10a6:20b:467::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Wed, 12 Jul 2023 10:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 10:36:51 +0000
Received: ("Tessian outbound f9124736ff4f:v145"); Wed, 12 Jul 2023 10:36:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9c2b2aa24a3fb4d
X-CR-MTA-TID: 64aa7808
Received: from 590070e7fc19.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A96E7C32-F8BC-420B-935A-F875CF16A301.1;
	Wed, 12 Jul 2023 10:36:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 590070e7fc19.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Jul 2023 10:36:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVSvNDGilrXUrQW16bbngTImekaci5NKHgGIyiefg968l1N6SXZPm55FY7TzVxWpQLYjceuqD1Jv/eowBmAtxIdLBL8nIel90+2+6oUfCUzZxw1CdD19xQ2CScFGFBjJHyAd+GZIG9om4qpPrbSGxDD2Xq3uU9nWW4rEuwnzkrpzyhgEJ9CRn0CQtGpAD8lO9lz5hSM1BC2X/4ddpiR5SSeaGfPqfsI8+MDerh2mTIU2921mup3PUYO7Fw5X7Dn5N4N9FZ7D/DQ0/FI0yMRkofAMsBR2SJF9L4IGIs1LqJ8p731ywhpVTK1hAMXwHOAtpUnvWyP4d035LDpRiTPAuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htZIXyt3NSKjY4KnuexUCZxlTOda0DmBN21ClscXCeA=;
 b=Aq/HFYKNRP2fVAvf9PToeSR5eZm3Gp12xV29LMUXF/SyuMSZI9TPhlWb4uxIr5tKDicgdTP0jWrteHQfITvM/adjIRHOTQ84+V4sYr4mnVUybA7ubMOTNdkDQ5dW4T2MjTtkXMIEM2EM7UujqEfGdKx7LOsYltsdZ9R3HI7lZ97dnFGxWgjCf69wU4bxqjKiQqZfC51cjYcASKzo/RAwE8vioafrFLRUO0iT1ojT7JV6hBvBtxeE1gUp8cmEWqQTDSOz8KYbMJy39aHKem5N8PPTg/pxCub11NIssxoHsH992uv6gkP1+zEpm7AYn0ACawhHEENW6V7PrwhoYZcR+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htZIXyt3NSKjY4KnuexUCZxlTOda0DmBN21ClscXCeA=;
 b=E53cY8DrQ/PoU2BcbKbnnoC3bL0ut/Br1i5q03idlkB1LYpnoNd0eamSZ0Bj55GAO/cp8htLBO2Wa7oEznclMJQOLxPDcQ3tSJoGbo8J2dCX2gQTBkOWQKu9viZaAtrXZcLHulqo0O0v8tWcac6+9UP14yIXvOeBRji2gSeeANM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB10077.eurprd08.prod.outlook.com (2603:10a6:20b:63e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:36:41 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 10:36:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "p.lobacz@welotec.com" <p.lobacz@welotec.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core][PATCH v2 3/3] package.bbclass: add support for ACLs and
 xattr
Thread-Topic: [OE-Core][PATCH v2 3/3] package.bbclass: add support for ACLs
 and xattr
Thread-Index: AQHZtE+Tz3+97xj44k6u2JyAiyPS16+18NEA
Date: Wed, 12 Jul 2023 10:36:41 +0000
Message-ID: <2CDF761B-DEFB-44FD-8933-AD47A9821F96@arm.com>
References: <20230711232819.2212134-1-p.lobacz@welotec.com>
 <20230711232819.2212134-3-p.lobacz@welotec.com>
In-Reply-To: <20230711232819.2212134-3-p.lobacz@welotec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB10077:EE_|AM7EUR03FT021:EE_|AS2PR08MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: 9463b0ea-d904-41bf-18e0-08db82c3e76d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1g7mYh6xL5lzTC3EHLYn+j2kUbHmCJoOajSpPwL9VEYqfngWC1UVNLi3VkXRQEXs26SibLaugY4sbYw5QtMKn9oSY+QXiF5f+sinYUjkgXUM5GkMlOpm+Pdzl0+7cgwptBGf/zH6MDuEMutJESwWiJJn1p10cGlz56Xtsv+tGOvkwtPSnuZObYepY3vB6mg3OoqcPGuZf2d+qQP54JtnsXxfJCOvo0e3Gy+ZbEqYNtn37BoxossvevJgVl9GtCC0oURIjdW6VTHDJ+pMpZoxfqmQ4fEVGqViyt0jJ5h+roUhyRm/+9AUrx9GyTW2DWPNbVVwTMSSLeyM0wuWW3/IEWGiWdmiaBSfInhDdaRyrAbjSe+pdK9D+jEBhdYW7Y0rrTRZh0LhdK8K1qQFCZLIP4GMIiur+a/8spJxTISxBB/ehIhc4ZahkDjtY6Ik53cLpvp3RTLkyC+tX8wxYUUsEmCre6jhhuYDTtfHVCbgj0Sw75E3HV/reHq6YIxl8YVvX2DEi6yiWezsdV5JMiR2PPl8C5o8Hb/7c9QnTzho6h5Flpw7mfcICCaUKe0aP5QhPJ26MbskVN0ETm3MdZGyr3yWK8pvZXVTJBEvvfeEaI1c0gTmQvyhJX/ScGOco6njaOwCcgU76bzc0Y2cwLGUbQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(8936002)(8676002)(38100700002)(122000001)(66574015)(2616005)(41300700001)(2906002)(316002)(5660300002)(66446008)(64756008)(66476007)(4326008)(6916009)(76116006)(66556008)(66946007)(91956017)(33656002)(71200400001)(6486002)(6512007)(478600001)(36756003)(38070700005)(6506007)(53546011)(186003)(26005)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDC6989C8E6B77498B4F8FFE7CCCECB3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10077
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4c86904c-a45a-4431-85d6-08db82c3e14e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qUtICv+9SD33XxHIQ8j0rGf4OfPX4QHVcfGLY/262El5tdt+tSJAtZiXARWII07csicF0C5nTjyvf2c+JJspXFaT4tFfyoThtwJKk0HbBF4d4xsGGLNybLQVtJZYpdE6wOFgko+1K2rzC2q0ZJw3PMMsalMCRCcq2E3xn8sP5JwngiuoiAhwiVLrfwUy/cPxSDE4VFKtBnU0y3DXQVvt3MeE5u7TSgzewHF3/UZUTapKl2W9E0u0bzBMR+Ru7lYk2P6LXkWdj/XcDJByzraVRMZa7ikAPWRH6yWz31sceCI6g2o+mOVYBu8vf/jWN4JsrMgAx2B70Wy1d/HKi1CX3QvJSrOZkIKHQSJGZdE8Ss58F3MMrK0705ypd3OAGKy++6AAeW53DRYucQBRdQ4OiDHJvefmi+VhXwGt8ZeF7Z3INcAGbrpwZHqzJ6nxOpJqExTgPWF8ZH7IGdrhirbuw492WQrOLxRvwKEzo6zsuWeQzAWesJnre7JQRxxGsAFvA/MrREUUchKolKSGh9b6ZWapWcdHjUnpXbElL8jkqvDBu5A4as/29T+yBqxCTE1uITLPSwxkIBtAk+eWXSN5XoVdvmpgc/y6x63wZ+x8FYWqpQQ4DWYH8iFWuqPrZ+UCtZBNg90pPJonKSIDz/t7jqpCe6j6naokoDgPrxEB18FITgFpXcHvXhguxf87TBe/YmH8aa6AezHW9JwE8E0up4Htjy0E2Q6M2GHEiMGjF+raZLX1beFb3q6wykKsk8QX
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(39860400002)(376002)(396003)(451199021)(36840700001)(40470700004)(46966006)(82310400005)(82740400003)(86362001)(40460700003)(40480700001)(36756003)(70206006)(6486002)(70586007)(33656002)(356005)(81166007)(36860700001)(2616005)(26005)(336012)(186003)(6512007)(53546011)(6506007)(5660300002)(2906002)(478600001)(4326008)(6862004)(47076005)(8676002)(8936002)(66574015)(316002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:36:51.4415
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9463b0ea-d904-41bf-18e0-08db82c3e76d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184175

T24gMTIgSnVsIDIwMjMsIGF0IDAwOjI4LCBQaW90ciDFgW9iYWN6IHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwLmxvYmFjej13ZWxvdGVjLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gLSAgICAjIFByZXNlcnZlIHNwYXJzZSBmaWxlcyBhbmQgaGFyZCBsaW5rcw0KPiAt
ICAgIGNtZCA9ICd0YXIgLS1leGNsdWRlPS4vc3lzcm9vdC1vbmx5IC1jZiAtIC1DICVzIC1wIC1T
IC4gfCB0YXIgLXhmIC0gLUMgJXMnICUgKGRlc3QsIGR2YXIpDQo+ICsgICAgIyBQcmVzZXJ2ZSBz
cGFyc2UgZmlsZXMsIGhhcmQgbGlua3MsIEFDTHMgYW5kIGV4dGVuZGVkIGF0dHJpYnV0ZXMNCj4g
KyAgICBhY2wgPSAnJw0KPiArICAgIHhhdHRyID0gJycNCj4gKyAgICAjIFRPRE86IGZvciB0aGUg
bW9tZW50IG9ubHkgaXBrIHBhY2thZ2VzIGFyZSBzdXBwb3J0aW5nIEFDTHMgYW5kIGV4dGVuZGVk
IGF0dHJpYnV0ZXMNCj4gKyAgICBpZiBiYi51dGlscy5jb250YWlucygnUEFDS0FHRV9DTEFTU0VT
JywgJ3BhY2thZ2VfaXBrJywgVHJ1ZSwgRmFsc2UsIGQpOg0KPiArICAgICAgICBhY2wgPSBiYi51
dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ2FjbCcsICctLWFjbHMnLCAnJywgZCkN
Cj4gKyAgICAgICAgeGF0dHIgPSBiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywg
J3hhdHRyJywgJy0teGF0dHJzJywgJycsIGQpDQo+ICsgICAgY21kID0gZid0YXIge2FjbH0ge3hh
dHRyfSAtLW51bWVyaWMtb3duZXIgLS1leGNsdWRlPS4vc3lzcm9vdC1vbmx5IC1jZiAtIC1DIHtk
ZXN0fSAtcCAtUyAuIHwgdGFyIHthY2x9IHt4YXR0cn0gLXhmIC0gLUMge2R2YXJ9Jw0KPiAgICAg
c3VicHJvY2Vzcy5jaGVja19vdXRwdXQoY21kLCBzaGVsbD1UcnVlLCBzdGRlcnI9c3VicHJvY2Vz
cy5TVERPVVQpDQoNClRoaXMgaXMgc3RpbGwgY2hhbmdpbmcgdGhlIGJlaGF2aW91ciBmb3IgcnBt
IHBhY2thZ2VzIGlmIGlwa2cgaXMgZW5hYmxlZCwgd2hpY2ggc291bmRzIGxpa2UgYSB3b25kZXJm
dWwgd2F5IHRvIGludHJvZHVjZSBzdWJ0bGUgYnVncyB0aGF0IGFyZSBoYXJkIHRvIGZpbmQuDQoN
CklzIHRoZXJlIGEgcHJvYmxlbSB3aXRoIGFsd2F5cyBwYXNzaW5nIOKAlGFjbHMg4oCUeGF0dHRy
cyB0byB0YXIgYXQgdGhpcyBzdGVwPw0KDQpSb3Nz

