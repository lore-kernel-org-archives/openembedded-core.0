Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A625C4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 19:50:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.59])
 by mx.groups.io with SMTP id smtpd.web10.2159.1701201023212434533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 11:50:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yG7Eh9ZV;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yG7Eh9ZV;
 spf=pass (domain: arm.com, ip: 40.107.22.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=jHlTcNLXwY6WWWp83uJZO0s/Gxbq7GTSr3JoXlQpSuGGlj+4pJtXdZjR5AhxaNTNrRfeRMVNYZzDid2gGoeIbANktxrD6yLLxByA86UfUOrnVmktrOkP02hZsDrQPDeRluBPX8XsJmz6ZRXyDFjtL1Yq4P4ICumapQgz+JLMbNjzkGddMW5C0/lYYUwlnQXbBswuSPoqf5za5pKwdjF6+F881nZatQE2eXdcWNbbYPVFiIM+jSiO005NJk22pKINQI2MjXn+ew1XhYfwnC4U+kFOxNEOyu2jYGl9SaHR0bNo+p8Gz2bYiznI2QjiCVc7odmkDBmPoEGWpKdV0nnHXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K0Y9/c/g7TMAp0ytHLmgvk3nnqUsdcbwH2sNh9X+VY=;
 b=hmGXdqAUq03eGb2FSrU3jYji+U4RMB4QRtfdkeIj6SWKpS2Aht9fSXT8XxSdEj+I4xEqyl/n/BBXUoGieAPo8Vdm2rHPZkh/amcyAAJSF4ia7zeM4+qD5nXAOjcuCqNaE/6/gP7GrP2oDAPajQMZk2h4R6Su9weRxeAbNNSvZiUpWbH6KjXOUKNhRVfaIFcwc7kHpF8ZLsrf7FHokgF+dLbGlL5N2dpSfzaq2k7dySaFUPFcDIF7WliiHz61FvrOXySqllDYyH7G/lMPJjDirGhamNATDZomVKW1AsipVXeuGHvyS/dZ3uLyR0e+I4e+hLHCnE0lDky2tRhI6/Zgrw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K0Y9/c/g7TMAp0ytHLmgvk3nnqUsdcbwH2sNh9X+VY=;
 b=yG7Eh9ZVi7CCXbnyMasHrTv7pbqvqOQrtpA0TGO5OjE507bdp8iM3ga1NfTjdpqRp8nne8IPTp5+mdwzNcZsNiXGqxFl4ym/UOZwOfaT3Vk0ubOP6RdCsCQzuHcJ/04WNNcEN80g1wj11UOseGU52Tz6j7UgS1jNqnL52OsxJi0=
Received: from AS8P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::13)
 by PA4PR08MB6237.eurprd08.prod.outlook.com (2603:10a6:102:f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 19:50:19 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:2f2:cafe::b3) by AS8P251CA0014.outlook.office365.com
 (2603:10a6:20b:2f2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27 via Frontend
 Transport; Tue, 28 Nov 2023 19:50:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 19:50:18 +0000
Received: ("Tessian outbound e243565b0037:v228"); Tue, 28 Nov 2023 19:50:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 22575081871afcdd
X-CR-MTA-TID: 64aa7808
Received: from 87e721046e5e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 709F0B56-D761-44EA-8A18-B23ECAB4A9BD.1;
	Tue, 28 Nov 2023 19:50:11 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 87e721046e5e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Nov 2023 19:50:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aOu4/vah4bn2QVEgnmBkP6J8Wzkh7/BEExWYAxy2AoShPrdOJgoVwu1+vJCUYI3xlGVeyeHOKiuOwmcGBn8LFGBgZB4XgkdONxD/2PJKl8FNoVLh82mAJCtzGSUmZTKVPsyLNxva4P1yompjywZQodjJAWDYalv7zivPW69JlKvOOc25cEAKou/3Nu31ZRqB0iWiOZ9YATj2Mkcl4Sm0TVGBIvfEsWKrKwR85tDOwU6coCxjWFarhuKcpx8G+z9jRApT4avMs7fu/o/T3i/S7/2XmvTTomHfaJuyEDT7b1qchIEaAS5xPRqsNq7PVHsvA9QMVqsQWKXe54WhOljI4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8K0Y9/c/g7TMAp0ytHLmgvk3nnqUsdcbwH2sNh9X+VY=;
 b=nV5n6WR0O1VheHTsrpkwpHptqyrjXXcBGxqBsXf7Q3KRXLtSB8/ALK1deUqXPg7bnv9PQIYTdrvYV1c8H0KS3ZY+nViyo/Yvt8jooilt0CscWXQtaCghqrU2ue+wc4An22aDqXU0zytpATTbygEn73xZwarCENQtyA3QsLhrCYrbsVLyRh+2wNPUD6r8jSXrf09t8ALhrTeO2lqoA2ZA4YvBqR1GoP//PsiboYryHH4CeygOOzyEVgJXC2+1lPOL95o0w4xsg9nHlczFl4kCLeO7llteviTPWG4AGtf5wo5W4YnfZuv5qYtP6CxBxOti11p9TMne6xJSotWkFR1RMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K0Y9/c/g7TMAp0ytHLmgvk3nnqUsdcbwH2sNh9X+VY=;
 b=yG7Eh9ZVi7CCXbnyMasHrTv7pbqvqOQrtpA0TGO5OjE507bdp8iM3ga1NfTjdpqRp8nne8IPTp5+mdwzNcZsNiXGqxFl4ym/UOZwOfaT3Vk0ubOP6RdCsCQzuHcJ/04WNNcEN80g1wj11UOseGU52Tz6j7UgS1jNqnL52OsxJi0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VE1PR08MB5869.eurprd08.prod.outlook.com (2603:10a6:800:1b2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 19:50:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 19:50:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Chuck Wolber <chuckwolber@gmail.com>
CC: "andrey.popov@yadro.com" <andrey.popov@yadro.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Thread-Topic: [OE-core] [PATCH v2] image-live: Add support for building
 EFI-bootable ISO images for non-x86-based archs
Thread-Index: AQHaEYzy5bSjqgeOX0K1TXdExQQEv7CQJP2AgAASOQCAAA3TgA==
Date: Tue, 28 Nov 2023 19:50:10 +0000
Message-ID: <2AC2FA03-37DA-46B9-9FB9-E9562C242E31@arm.com>
References: <20231107151243.10853-1-andrey.popov@yadro.com>
 <53356C03-3699-43FC-B8A5-70609982F612@arm.com>
 <CAB=6tBQqsC0XpFQ3z5EmNz2+2TqiVAeazf0dyL2tnVDgTkV=eQ@mail.gmail.com>
In-Reply-To: 
 <CAB=6tBQqsC0XpFQ3z5EmNz2+2TqiVAeazf0dyL2tnVDgTkV=eQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VE1PR08MB5869:EE_|AM1PEPF000252DD:EE_|PA4PR08MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: 3afd6a57-3020-4d3f-b06e-08dbf04b3fd1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 BZCX0j8rQnkz6Zz9U0FkV7bYkEolBL7toooQnqMTDKfb/1gD4R/QNVF/oc+SMbTxf0t4CMV8+wAZWcXXUJVLa3N2RLiJzsOIeTvol+tIfUYItCn2b/GqtWloL03d3W1tdIasgtNUPh/+Ibia+mLQ+WAAxFgDMHvKvaiDOmdnjPgsl3dWgOxEFlNagfyEU2VBryvIF+Li3B7cnqMvKCdjdTpT4Wwa1FNUTk4RFHViKAFdd+Ze2Mfj8O48I2f8kjhgRLz24/tGhF9Tk6ME8NK37vA7Kf7zERJiMLxJNsAnwLhThHPQ0VGhxAFkiHtk5MaynzzuX+aQ7wY6mWKfELDZf5bMjpZ3xwalNr3MC00PofB8C0gz7XwgUiglEljPvfXelRfej3caeTAjYGu+Em1KC3iqCeJqrghcp4KSv+MH9jpdPLOsN0X2MWOK7HECWjRMZSQ/Hg5wcI5XDDAeGWAFGABfP2UXbTGyLt1SdugTuWhM5AviW2HjKQoyJNS030XpGqr6lacCOu2qCJMhvJr97vkfSYsgWERIa//UYCg1lc+ts5Zba8tDCNo8kHsnmx8hNnJ+VpmlNtEYdtsoFSC+Be6QcPfDdKWk1ZPD0NZMbaumJnj0ZLcB4QAPJyuR4nYf08I+YY1OVNFJOPxjTKpoQg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(376002)(346002)(366004)(39850400004)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(122000001)(2616005)(53546011)(6506007)(71200400001)(6512007)(26005)(478600001)(2906002)(5660300002)(4744005)(4326008)(41300700001)(54906003)(66946007)(64756008)(6486002)(66476007)(66556008)(6916009)(8676002)(66446008)(8936002)(76116006)(91956017)(316002)(36756003)(38070700009)(86362001)(33656002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B671A1B84514BF49A56D842961E9FC97@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5869
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	27f17352-639d-4d0d-b098-08dbf04b3ab5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	B4sknHpACEz/mObV3Qh4ztKjW+YvW5KchwMI916l3PE25U+WUlBdde82v9Z0RGYowgghhs9QQxnT4ACKWy8iSLynFf6BEZ1rkGPXpjcKOpdFm+wA4Y5l2ZviSDve4svq9vlT64wxj2ykD89aTDeq9sPzoMAhqpFIvoDKzANNxuoKHEDcC+mtYeycOTrXYJLRnQuia2cJGvf/k/tGpmaOgy3Ly33YOBGH8m2qGS32v7hv88lezUHtxaEPJY6/iZ+HNQeCYqTiYFiXEtWo3qoL/9xYVSPfjEOUEtEOxovKavNh0zaEdbe0peTMdN9tIvkHUCsaK9a5Z5hNXmg3qDbtZ5Gw+DQIYxYHZlyIicrduN1C8Wj1yEcxsy9BDb+rh5pYqDFONnFpAPgghkosipGdPAQFivExdLsC+Q+8Remkc1MeGXqzUBYOMlWe5s+HF/nH16rEJ4jBfL8q7FLx1sGApOKTtlMCg6xaejmk5PnsOIyGma9fFnFl38wB24bwzlX+Ed3tFXChhm5KySodwA0i2rjD14uVINUkN1hyK818oDYjMJDJcS2vutBAKeo0odFYX4lbhA4rM1W7sdkLH5u3h2+/cCi+MlBpRfz5ZDmtkNdychb1IrJOzhTLpAd4+nYXyAZypX5kM7kAkF5ACm+jTYLQykzfzlNfnLbIug1OPBHdueAX7B12zqnqG6KnwIaoOtgwLhCtN3yFz8dA1zHn0vtf9jhIGNSkAdbdZCschZukHz3EEh6ZNlSwHUVwb6g+
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(396003)(346002)(230922051799003)(82310400011)(1800799012)(451199024)(186009)(64100799003)(40470700004)(46966006)(36840700001)(81166007)(47076005)(356005)(82740400003)(336012)(4326008)(6486002)(5660300002)(8936002)(8676002)(6862004)(6512007)(53546011)(86362001)(6506007)(316002)(70206006)(70586007)(36860700001)(54906003)(478600001)(4744005)(36756003)(40480700001)(41300700001)(33656002)(2906002)(26005)(2616005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 19:50:18.6508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afd6a57-3020-4d3f-b06e-08dbf04b3fd1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6237
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 19:50:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191386

T24gMjggTm92IDIwMjMsIGF0IDE5OjAwLCBDaHVjayBXb2xiZXIgPGNodWNrd29sYmVyQGdtYWls
LmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBUdWUsIE5vdiAyOCwgMjAyMyBhdCA5OjU14oCvQU0gUm9z
cyBCdXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+IHdyb3RlOg0KPiANCj4gSeKAmWxsIHJlcGx5
IHdpdGggY29tbWVudHMgb24gdGhlIGNvZGUgc2hvcnRseSwgYnV0IG15IGluaXRpYWwgdGhvdWdo
dHMgYXJlIG1haW5seSBkb2VzIGFueW9uZSBhY3R1YWxseSB1c2UgSVNPIGltYWdlcyBzdGlsbCwg
ZXNwZWNpYWxseSBvbiBub24teDg2IHN5c3RlbXM/ICBJ4oCZbSBjdXJpb3VzIHdoYXQgcHJvYmxl
bSB5b3XigJlyZSB0cnlpbmcgdG8gc29sdmUgaGVyZS4NCj4gDQo+IEkgY2FuIG9ubHkgc3BlYWsg
Zm9yIHRoZSBwcm9qZWN0cyBJIGFtIGludm9sdmVkIGluIC0geWVzLCBJU08gdXNhZ2UgaXMgc3Rp
bGwgKnZlcnkgbXVjaCogYWxpdmUgYW5kIHdlbGwuIE1vc3RseSB4ODYgdHlwZSBzeXN0ZW1zIGZv
ciB0aGUgdGltZSBiZWluZywgYnV0IG5vbi14ODYgaXMgb24gdGhlIGhvcml6b24uDQoNCkFuZCBi
eSBJU08gd2XigJlyZSB0YWxraW5nIGFib3V0IHByb3BlciBidXJudCBDRCBvciBEVkRzPw0KDQpS
b3Nz

