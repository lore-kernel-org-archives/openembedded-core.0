Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20203EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 13:53:16 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.80])
 by mx.groups.io with SMTP id smtpd.web11.12609.1686750787938791090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 06:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=pTGwLu9q;
 spf=pass (domain: arm.com, ip: 40.107.7.80, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/Riapr+JKRCfEOn6Us7XbPvt1StpGMjVlnP4LRwAe0=;
 b=pTGwLu9ql/mlvzdAJoYrZEYMlt0FGUitcEgXBKCRgzGdr8iJ/SvgDoP6S30KLu1Yk1G/fZS7TiwwJdstoQVhp+rD6s1d6wZMqLssl235yjcScYhehDngeHGNHLTmWDUaGybSoycOl9SSsCGC1oOO+qDyvIK9DBjI1GkYMO+aIkE=
Received: from DB8PR06CA0007.eurprd06.prod.outlook.com (2603:10a6:10:100::20)
 by VI1PR08MB10244.eurprd08.prod.outlook.com (2603:10a6:800:1bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 13:53:02 +0000
Received: from DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::2c) by DB8PR06CA0007.outlook.office365.com
 (2603:10a6:10:100::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.36 via Frontend
 Transport; Wed, 14 Jun 2023 13:53:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT019.mail.protection.outlook.com (100.127.142.129) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Wed, 14 Jun 2023 13:53:01 +0000
Received: ("Tessian outbound 5154e9d36775:v136"); Wed, 14 Jun 2023 13:53:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf046aa5234e532d
X-CR-MTA-TID: 64aa7808
Received: from 1c18773c99ab.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 46BACCBB-FFC4-4871-B0C4-DFF7F04E8109.1;
	Wed, 14 Jun 2023 13:52:54 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1c18773c99ab.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 14 Jun 2023 13:52:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NnAqwo30AxR6/BOh34KSXOo8Dim/UVFoohIlysIpBJRxTs0xrgCxl8KjmJz+1EsmlEHjoFqCMNeYfWmMEIy8tp+DStQXaYY3XhzKDEyCPxPCjvB/a4CGSI3/zRDUowHejWz3jwWaSjK53eqGoqNzjse2dN0969b8Fi2wnE+f8K/CcgmaMMKpLsXI5lTK29sZkXdWkHpMH2BvMEtL3JbT2qCbftXmhE1/uZTYyje9qxsPI2wY5S//PDxTEXe+osM7yOe0+Xzl+RSlB3XW0BhnBIDQhcPdT8BvFU0TYUDif+TKP92X3zFmJPWiepHPDNN3meu0Y3GrQtFVUzbQ8++oeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/Riapr+JKRCfEOn6Us7XbPvt1StpGMjVlnP4LRwAe0=;
 b=fYAWygrtpymJCO7fCYSLUTPKfi0jxY0Wmk2LzIjYKJr8L8mLYrXybK8wmrDzwgGXFkXggw8BJmMcVHqz9D6PTWcSHoQMjuozJZc4cc8qHQhaZK5RX7m6oklDMjHl0x05ThODiXWN1eNQgL73qLJk8URJir4i9UbOX/VwHYhaCdLy8Dfs0zHyq/L84Hij4tZPml9fA/l8kA9ScVR5TogpT2hW373yrVyzkZVs7p9ann5EBr5g360MDWuKIU9WAkTlvA1iCuxITbNW9w7jJ8z2JnYiRInB1zvMe1uZyalhhtE0+aeLJVSOFrRfSouk4FYrzERhfI7DFu8B+yxt76WUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/Riapr+JKRCfEOn6Us7XbPvt1StpGMjVlnP4LRwAe0=;
 b=pTGwLu9ql/mlvzdAJoYrZEYMlt0FGUitcEgXBKCRgzGdr8iJ/SvgDoP6S30KLu1Yk1G/fZS7TiwwJdstoQVhp+rD6s1d6wZMqLssl235yjcScYhehDngeHGNHLTmWDUaGybSoycOl9SSsCGC1oOO+qDyvIK9DBjI1GkYMO+aIkE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB9351.eurprd08.prod.outlook.com (2603:10a6:150:da::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Wed, 14 Jun
 2023 13:52:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Wed, 14 Jun 2023
 13:52:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sudipm.mukherjee@gmail.com" <sudipm.mukherjee@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] libssh2: Upgrade to v1.11.0
Thread-Topic: [OE-core] [PATCH v2] libssh2: Upgrade to v1.11.0
Thread-Index: AQHZnjj7PNEoTmExa0yCtxHtKgPo86+KUoeA
Date: Wed, 14 Jun 2023 13:52:51 +0000
Message-ID: <71B74F88-1911-4F00-BD3D-0B4628D9ED99@arm.com>
References: <20230613205212.7548-1-sudip.mukherjee@codethink.co.uk>
In-Reply-To: <20230613205212.7548-1-sudip.mukherjee@codethink.co.uk>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB9351:EE_|DBAEUR03FT019:EE_|VI1PR08MB10244:EE_
X-MS-Office365-Filtering-Correlation-Id: e100731e-62af-4692-3ce7-08db6cdeab76
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 pvZiJuofHsRYtHhO6qs9bv3He5da0MWVxvqOZBP0sXI+XZyr3qCcrHvzAeGGEFcA7nIj9atrx7AQIskzAIUQao1QMVJMNskmJhsJZcnKNLoVJrQG6/Ghzaw6+yvtATPngcj57TQ55nWsctqGvAVHTc7W2NJkcLs4F4zYsdiiAjT3grZwPq5iAv3D3RduAFCTL4tPzQNNbfUek5RDyd51UVEKPxKo8vtGBa+GhyYxFiX3xsW65Sarg0s5mpWLkD+QVqFwRPPEdcXeUvVyE3V4cfhew94o61vqDI3RZZ3HxBsgmkQUKHrajHMcJYJYBdZoXuXs3RWK7P/oW/4hjJLjNP1tKnE+26TDCB8p5yR4ExY5pQvcTcn3zkv323GnBm4z0tYyuHvGz2g2jcy3XU/lo/WQR6gyC7GSpbkKsvRggCtiF7AGt+SQb2fIDdhDQA5GW18SZiRmS7CWOXcB8sz/V3wX3pmiO7aTtvAZDWGHNlBLUHNEbr7VhrHZJ6IwwSj6uQXklpHe8N5hD9vGc8g79cIL2+vEwXo1tC0NZu2U0GFE/j2mYpFMJME0pJBXxIQBbKvxfrZRgAww9qFmQDwSsqaNE9lJbk/JLKmeyqHTpq7C4xtWhqWC7Jw2vk1Naf3hC3X5SynU/tkFkLFx2xyLBw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(451199021)(5660300002)(8676002)(8936002)(2906002)(66946007)(76116006)(64756008)(91956017)(66446008)(66556008)(66476007)(54906003)(71200400001)(4326008)(6486002)(6506007)(26005)(6512007)(41300700001)(53546011)(316002)(6916009)(186003)(2616005)(478600001)(33656002)(38070700005)(36756003)(122000001)(86362001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <90DFAA329B4CE54481F98AA7D13C1DCA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9351
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2d8913e4-ccc1-47d2-2d3b-08db6cdea591
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HO2sinhkIruJM5y9vh9KEJbMddA0WgS8qzikLaLHgFh1ZEIF1fxCf0/H8pxlv3iFhRYX4LL0rSQ7ktAsTfJ5fyNZ0DyhK8qTvbFgKAhuRsZB6qAJopNp5lawINLk2YcdidSa/kCdplpXPULbubd20xnSuvEte4KksEPAn2UfOtvA72mu2wevyBmbfX+MTlovkutcU++mNJpifVNJBaCIjKo2umK42Uf0zAb7UBE0NJUDh3ugEZUlQmaPEgsRenZYIzET1HMdximRIm0OIiIdFLTKlxv+MtMXQFewY4GeKw0Mq+Y+p4FnqtacpS8xGKe8P7UZ3AanSwa+/eTi72Nlilp44FOARZspp/OpXXdIbNtnZug3aE3swe90FzYgVJWsXhin/JwPEDHzhLMKyHqGM2Nmn5scDjatU6u9lCRG6EGluVQi4MkrTiuTl8kT4oneeRqRkUWK06l1c6cop5ki8/JVX4co33K8j7YTTREPcAudRl1i2U/Kh3dY4MIcY45d0/Lo8S5iw6bsrZauyEXCdSuwqlGBLldBU16vlsiQaCF3nu5h5OhuVNs1UVGGcM447vJlTLV2mEOjA24dmIVfcXh7fSoGGAlAXuo1yHiAzLpORRDmg6FLnxKDhj1xPtrlftYG8m3bTyzGEYI7OHImERW3uZwrKO943vlxEniAd6hlnUuaVRyD/c8guhnmew/Dy/C6ka152ln1mGltL20UWwsWSbZAoZvgbI8DQvifsIo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(8936002)(6486002)(26005)(40460700003)(8676002)(6512007)(41300700001)(36860700001)(6862004)(356005)(81166007)(478600001)(82740400003)(36756003)(82310400005)(70586007)(70206006)(4326008)(86362001)(316002)(33656002)(54906003)(53546011)(6506007)(40480700001)(5660300002)(336012)(186003)(2616005)(47076005)(107886003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 13:53:01.8249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e100731e-62af-4692-3ce7-08db6cdeab76
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10244
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 13:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182807

T24gMTMgSnVuIDIwMjMsIGF0IDIxOjUyLCBTdWRpcCBNdWtoZXJqZWUgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPHN1ZGlwbS5tdWtoZXJqZWU9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiAjIG9ubHkgb25lIG9mIG9wZW5zc2wgYW5kIGdjcnlwdCBjb3VsZCBi
ZSBzZXQNCj4gUEFDS0FHRUNPTkZJRyA/Pz0gIm9wZW5zc2wiDQo+IEBAIC00MSw5ICs0MiwxMyBA
QCBkb19pbnN0YWxsX3B0ZXN0KCkgew0KPiBpbnN0YWxsIC1kICR7RH0ke1BURVNUX1BBVEh9L3Rl
c3RzDQo+IGluc3RhbGwgLW0gMDc1NSAke1N9L3Rlc3QtZHJpdmVyICR7RH0ke1BURVNUX1BBVEh9
Lw0KPiBjcCAtcmYgJHtCfS90ZXN0cy8ubGlicy8qICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLw0K
PiAtIGNwIC1yZiAke1N9L3Rlc3RzL21hbnN5bnRheC5zaCAgJHtEfSR7UFRFU1RfUEFUSH0vdGVz
dHMvDQo+IC0gY3AgLXJmICR7U30vdGVzdHMvc3NoMi5zaCAgJHtEfSR7UFRFU1RfUEFUSH0vdGVz
dHMvDQo+IC0gY3AgLXJmICR7U30vdGVzdHMvZXRjICR7RH0ke1BURVNUX1BBVEh9L3Rlc3RzLw0K
PiArIGNwIC1yZiAke0J9L3Rlc3RzL3Rlc3Rfc2ltcGxlICR7RH0ke1BURVNUX1BBVEh9L3Rlc3Rz
Lw0KPiArIGNwIC1yZiAke1N9L3Rlc3RzL21hbnN5bnRheC5zaCAke0R9JHtQVEVTVF9QQVRIfS90
ZXN0cy8NCj4gKyBjcCAtcmYgJHtTfS90ZXN0cy90ZXN0X3NzaGQudGVzdCAgJHtEfSR7UFRFU1Rf
UEFUSH0vdGVzdHMvDQo+ICsgY3AgLXJmICR7U30vdGVzdHMvb3BlbnNzaF9zZXJ2ZXIgJHtEfSR7
UFRFU1RfUEFUSH0vdGVzdHMvDQo+ICsgY3AgLXJmICR7U30vdGVzdHMva2V5KiAke0R9JHtQVEVT
VF9QQVRIfS90ZXN0cy8NCj4gKyMgTWFrZWZpbGUuaW5jIHJlcXVpcmVkIGFzIHRlc3Rfc3NoZC50
ZXN0IGdlbmVyYXRlcyB0aGUgbGlzdCBvZiB0ZXN0IGZyb20gdGhpcw0KPiArIGNwIC1yZiAke1N9
L3Rlc3RzL01ha2VmaWxlLmluYyAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8NCj4gbWtkaXIgLXAg
JHtEfSR7UFRFU1RfUEFUSH0vZG9jcw0KPiBjcCAtciAke1N9L2RvY3MvKiAke0R9JHtQVEVTVF9Q
QVRIfS9kb2NzLw0KPiB9DQoNCkFzIHlvdeKAmXZlIGNsZWFybHkgYmVlbiBsb29raW5nIGF0IHRo
ZSB0ZXN0cywgd2h5IGRvZXMgdGhlIHB0ZXN0IHN1cHBvcnQgbmVlZCB0aGUgZG9jdW1lbnRhdGlv
bj8NCg0KUm9zcw==

