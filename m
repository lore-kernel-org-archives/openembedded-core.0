Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DADAC77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 16:44:19 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.77])
 by mx.groups.io with SMTP id smtpd.web10.2142.1684860253534609022
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 09:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=NcBJ57bz;
 spf=pass (domain: arm.com, ip: 40.107.15.77, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LN8wV/6nX8spppk5ZL6FkGTLOzTldVKmNFxWZGGOoEs=;
 b=NcBJ57bzqr2wL3bi+PasmfdAH5fZh74tEaqNYI+seMaCfzHVJuR/UznxxmcN2tYd1+6kOS1jjgeEoxSDw5K1kfHYkzB6K5IU0Ghf9d/rAWKIEjnZM6kdiRGMuT9BaX5omIHY7UWv+JtmwACWNsTTFjMDpJ2F3xZMNzvO9osw2WY=
Received: from AS9PR06CA0663.eurprd06.prod.outlook.com (2603:10a6:20b:49c::8)
 by PA4PR08MB6159.eurprd08.prod.outlook.com (2603:10a6:102:e8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 16:44:10 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::20) by AS9PR06CA0663.outlook.office365.com
 (2603:10a6:20b:49c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29 via Frontend
 Transport; Tue, 23 May 2023 16:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 16:44:10 +0000
Received: ("Tessian outbound 3570909035da:v136"); Tue, 23 May 2023 16:44:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5dc41bae32a2bb84
X-CR-MTA-TID: 64aa7808
Received: from c4941049715f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CF5E60F6-AEF7-414B-8280-6D88A3D6E080.1;
	Tue, 23 May 2023 16:44:03 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c4941049715f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 May 2023 16:44:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK7Ak9JhAYVfGho2DtZXlQJIOGHnZcm3klyg6QwanaLncuuc9i21p+rTdkwzHD6YmfjSoktFQvkCRnkaowE8kr/kOFlcB9kqB9WicnMsrBqPfCvccdOK4DNAdJVaK7Q9dvIaaPNCuBJI7l4SqZEzcbs8g9fAaQTItiIpsElpPkd7+0tS77HMY4xYBJBvX+SJSPTmM9e0Yt4CoDhCvZEW/jSVVcwfbOqTlFYuwdae1Pj4xR8v3Ig3OD7DhRlQ3XRUyC4TcbsT++fW6Wdvg4tm6iKlYpYCqzMPaLSK6p7mymvA8/Y3n51W07AbqF93O1JA/GJI5UZSAXXFbGQrIPwrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LN8wV/6nX8spppk5ZL6FkGTLOzTldVKmNFxWZGGOoEs=;
 b=QpIKsBnLAYHwz2aO9LIHk5fLuzrhO2e5FsGKq5bExm0A8WIJgD60w6EaVuWjjKIfv4XSp70sbGLjGvTsmVh4I3ptraYfUKZKEzr0rLbJ1GgNO4JKqX3rt9N9l3ATThs7uC2F+fzBjJ0s52UKQU/J2GU+vn5fS4PP598UmTvrypfxtV8H/D33DJlmBn+nURV/CiWbs60KMLaUgC8Vhl1LDp+n3zgWgw233uf6IA0URj8CpfG/RpTlV/jqspwds4QWibqJC4b7yBvnUFs0MxcxDjE06P2QqNINLHkkSvckINLHzpouM8i1dkaotUbKb6RjxupvOo2TqiN/we3ShAwlYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LN8wV/6nX8spppk5ZL6FkGTLOzTldVKmNFxWZGGOoEs=;
 b=NcBJ57bzqr2wL3bi+PasmfdAH5fZh74tEaqNYI+seMaCfzHVJuR/UznxxmcN2tYd1+6kOS1jjgeEoxSDw5K1kfHYkzB6K5IU0Ghf9d/rAWKIEjnZM6kdiRGMuT9BaX5omIHY7UWv+JtmwACWNsTTFjMDpJ2F3xZMNzvO9osw2WY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5849.eurprd08.prod.outlook.com (2603:10a6:102:84::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 16:44:01 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 16:44:01 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] psmisc: Set ALTERNATIVE for pstree to resolve
 conflict with busybox
Thread-Topic: [OE-core] [PATCH] psmisc: Set ALTERNATIVE for pstree to resolve
 conflict with busybox
Thread-Index: AQHZjYx4ZPkIv0aBnk6SUQyUQqUMrq9oEGiA
Date: Tue, 23 May 2023 16:44:01 +0000
Message-ID: <0F0935A6-1757-4CAA-B9E9-F61C90D95DDF@arm.com>
References: <20230523153608.119800-1-frieder@fris.de>
In-Reply-To: <20230523153608.119800-1-frieder@fris.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5849:EE_|AM7EUR03FT003:EE_|PA4PR08MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 0186caf9-66b6-48e2-b5d3-08db5baceebc
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ea6P2Aa0gNhbssHdR6zhcWWlJU4NZxJLYS7fzMM9LhmjtdnR9ZpPNQz5SUKj8MvWd12OVTK4kcsaESY9A/a390arwWqFj0ekC+2J3ooBNfQ/AYUc2NZUS0F/EfrkMnbYlCxZLI6cCtSUVVXe1IXx4CJQdtgZr+XfwqxbVhNMO4GvvqKAZaT44h0I0n67PMxKoVvvK486PUXudFZyD5ETMzwbN+X2yA9T1U0fyuTCTkSN43nP0kW54aL8pBjpsUrBs9gxoV9BZ50Egg/JX4qjxHhE4Y4ZQHwVdjex9QVuGpethws+wPMPg2z506/qTSBTe/Mi6yxYtoeU6gK3opj7AzaCyi/NJYtLyv0LSmPcfpOd0IhrG6BHYJ993nkEu9mBSJEvwKm3qxcMlCgqzfiLswRTxM7iwlZ4iQQnKoThleiVHLmg23xAKrGNTmpmRiPnI2rN0ZpNW2NKD3OSFDlid+2KpzoLoDkO02twnJgtxggCGLnPjJdZt3n2+YdxTGkKqa6JFuopMeXvJEuwKoCpWLoPOuXs9yTfW+Z0RfgsE8UdTO2j+Vfm6WMelQZdIuFc722WDfB3LIi//YlGyHpglGmE3cNVNvEWp06k4Y6gVoDpiTKI+892Y3bAt5ytyMsJInbp/Zoqs/jLhlDO2q17Kw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(136003)(39860400002)(346002)(396003)(451199021)(86362001)(41300700001)(6486002)(478600001)(316002)(66446008)(91956017)(4326008)(6916009)(64756008)(66556008)(66476007)(71200400001)(76116006)(66946007)(5660300002)(38070700005)(8676002)(8936002)(38100700002)(122000001)(33656002)(6512007)(26005)(186003)(6506007)(53546011)(2906002)(4744005)(2616005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <01AD0936443DAC4C8799F6B4541B4F18@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5849
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f851e828-1704-44cf-a528-08db5bace9c5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MCivkd5EDsh6HruoLToBh02KP6a1h5N1ZFDY0T1u9JmZivHN0GQ5OvyQCqWckFbf1Ef/UewWVAu9RYj8ahV/YSzTeFFmMvzHjqm9nTWXf3IVcj0Wi2MzI/vclPb8B7Xy+QotYJgSRv6tQSqD6/+kmu11TmsoTY12ygca5W4sCSgllkCsqeF89eTLEsLeOgnSvFKosolKSvlVyB2npyZEKBkVtBc/1XPg59ARVAvGLNS2YQR/7Sxkg7eK/9j8kbm8D1Dyk7t5/nW/mFuT7ZNUopxBp+1jcEb41a0ey5VqCXPDpAEprzcMRTEzLBe4KZr+tG0KqIgtvTf57keDIDu0moj9tVEAh0LfBtpZDTbOjK6R3RMtxRYO6oYa7ScEIOlxSj1Z4ZLre4LR3AzJwSwe9egFf8vsKt89OASUkg8wNi+dyZKRtwyY4spXAUzEPhiKnuJV5I1xs93ho8Acygk//Oeq/3ZbNKMlWbiJDDScYIqwgu5prg+FdJjRhfOQk62qxV0A8TthzJmoN3i5gUb5u85WJ3+v+wJM9SX6L9NWUEv3Oht3KUJ/8DRe/5Phkk2cEWHOlu21QYgcnYHh27M4xy2yr4aLeW+yiacPN9JCBhsRgD5FhH1YiCq8idP54B7B6SgSUTWaVWhxSezGcq3eZ6s66Kk5bVUhz95QCrz6BBIIW+4HQ/Fwzs2mdxu1JKyrukfAU4ufNJg8LkW9kZRbpJfJsn5okG4KLHG36Rv5JHxtm9xK6a+QxaLoQ+4d54PP
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(82310400005)(70586007)(70206006)(478600001)(41300700001)(6486002)(316002)(4326008)(86362001)(8936002)(8676002)(6862004)(5660300002)(4744005)(356005)(26005)(33656002)(6512007)(81166007)(186003)(82740400003)(40460700003)(6506007)(336012)(2906002)(40480700001)(2616005)(36756003)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 16:44:10.0435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0186caf9-66b6-48e2-b5d3-08db5baceebc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6159
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 16:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181649

DQoNCj4gT24gMjMgTWF5IDIwMjMsIGF0IDE2OjM2LCBGcmllZGVyIFNjaHJlbXBmIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxmcmllZGVyLnNjaHJlbXBmPWtvbnRyb24uZGVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IGRpZmYgLS1naXQgYS92c2NvZGUtYml0YmFrZS1idWls
ZC9leGVjdXRlQml0QmFrZUNtZC5zaCBiL3ZzY29kZS1iaXRiYWtlLWJ1aWxkL2V4ZWN1dGVCaXRC
YWtlQ21kLnNoDQo+IG5ldyBmaWxlIG1vZGUgMTAwNzU1DQo+IGluZGV4IDAwMDAwMDAwMDAuLmQ3
YTRjNWE1YWENCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi92c2NvZGUtYml0YmFrZS1idWlsZC9l
eGVjdXRlQml0QmFrZUNtZC5zaA0KPiBAQCAtMCwwICsxLDMgQEANCj4gKyMhL2Jpbi9iYXNoDQo+
ICsuIC4vb2UtaW5pdC1idWlsZC1lbnYgdnNjb2RlLWJpdGJha2UtYnVpbGQgPiAvZGV2L251bGwN
Cj4gK2JpdGJha2UtbGF5ZXJzIHNob3ctbGF5ZXJzDQoNClByZXR0eSBjZXJ0YWluIHlvdSBkaWRu
4oCZdCB3YW50IHRoaXMgaW4geW91ciBjb21taXQuDQoNCih5b3UgbWlnaHQgd2FudCB0byBhZGQg
dnNjb2RlLWJpdGJha2UtYnVpbGQgdG8geW91ciBnbG9iYWwgZ2l0IGlnbm9yZSkNCg0KUm9zcw0K
DQo=

