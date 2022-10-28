Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53959ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 11:22:16 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.82])
 by mx.groups.io with SMTP id smtpd.web12.5039.1666956134504903523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 04:22:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fSjxPwNE;
 spf=pass (domain: arm.com, ip: 40.107.8.82, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=didsOds89m2svBjWpS5+gZxxbTdVmoQmnADncZlzaD+klCHaQBEl5oqoRQpVEE2EXMIdbAEd96KqMUVgvZlYHU5LZyHdEug9dixCsoPofTCzdXUHLLEWOXPkYWqRnoULhSwpIbFeoMZUZ9JFcOow9+IFCErRPGFQwjVcw7OzqczOmAViZvxEoFqcBxFJm66u69s/rth4SCeamIn8UEb1Crmbz0x0sHjM54D3NbCgWqxkh7xVN3Ty75xUEa/UPi/IqRQ1BTPnkwRlMOhszX0viy08JafJovPPtyN+y180zbQxWl5qVZJkBC3aeOxxBuFXH+zmTN/GGTv+dW+RVhUK7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fniSVL2P0W0hzbrno3scRHDnDSv+2pwlsi+f95rlga4=;
 b=mNWK2/sm60pjlpaf18kRi5RAgMegfQQ1NN03bsZgac6oPh8tl+BoHOmasIeSu7PByREjqiqU/a7mk8PsPYM9WTITks9FFYl6umNHg5q7fMJEmOXgAu8FQx74QttDA6nxryK8IrcdtYc5D7tjWKyhvaFukPTTxMHRTaIdaYjellcIMV0cv0q3TNk6P8mndI7BVDLQNqJc1GKPwYUsB7PZn2kVShHN7Ao1WKGeC7K4/6BVUiD2EamT6j9E4AoMzwL5APIDaMm1UOi54YBnlMEY35YKeTqR78yjsc0redg4tck6307g0sHiLn3fmfqSriU6PuX9JcEwDLdm7hUfvuueug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fniSVL2P0W0hzbrno3scRHDnDSv+2pwlsi+f95rlga4=;
 b=fSjxPwNEWbssFYwDdVy6+tx2Nmri0yF6PL/dcZe2l48cIBedzACVpBNE3PywRAZM01JX5yMmy1vxmDX5omZhaPzOk4x8vT5jZeJnl5sOVN+ohy7KUr/Xc5Cw7UQhRDRylMEcOpof4JSX5DbMFTZqLrkUUkGzWSoRFZ8DSquckHo=
Received: from DU2PR04CA0214.eurprd04.prod.outlook.com (2603:10a6:10:2b1::9)
 by DBBPR08MB6010.eurprd08.prod.outlook.com (2603:10a6:10:20a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 11:22:01 +0000
Received: from DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b1:cafe::62) by DU2PR04CA0214.outlook.office365.com
 (2603:10a6:10:2b1::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15 via Frontend
 Transport; Fri, 28 Oct 2022 11:22:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT012.mail.protection.outlook.com (100.127.142.126) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 11:22:01 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Fri, 28 Oct 2022 11:22:01 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 698555dca6fd6cec
X-CR-MTA-TID: 64aa7808
Received: from f58de4740219.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 7F26EF27-36B2-4532-A606-DA2A4D0866A7.1;
	Fri, 28 Oct 2022 11:21:55 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f58de4740219.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 28 Oct 2022 11:21:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdARPzysPUMSx9A4K5Tfx+EWSgf/yYNcNl3Fka07dIiUTn3ZSOSC7WrP0vHkFjaQEVV47tnq4/KbpttdzzDjllzpHztsr0EVgmWkvUWBbjz4yWvFf1gs35abd5iqrMkTUYrujFQL/FqxZvFUbEs2eCEDDa9xyD0/9cferr+AUvDhNm81P4JxU7nJSQtFU5pOA7B7S6YJy2DNnIDSk1kBFZBFUV9XLfn9trjBWa3GUFeQ9hCg8lLhMMj9ppTqRWih+m6eCDhqCbr/TfP1zcl5wLZ4siBahPGwBTlf/inVfNNv41JHr9Ih5qnzQbVAE6j79vVMkOiIfVoyOPUsZiM12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fniSVL2P0W0hzbrno3scRHDnDSv+2pwlsi+f95rlga4=;
 b=F4OrC7XSnkd9bMP71uF1ECV6yOnXStrDbLtBIwZSTklVaNgoUjJA8GnNLmF4RfsSUnPgw6doT1Rm2zg389KMoUrBc6GfGA+I8jIw+qwH1n5qbQMBkABFE8sO8JoUxfS97oIbIxvUK+MiWep0G2eLtzHxDHyfjkEw2oNz1PisKJEWPJYe0Qo2FEXwgjmjU3yF7KJ1XhDN+RvtvmPs0VvAgUKHDOzy3oOaPRyxyCh1t7adEGvH1xAJRvWzK8nxois41DyKiOX/Sak/tB0cw1tBaSbHDcVJIA1cBgwLwE14zBoBafXba+Qv5M13tZtcVcHWiK18BJi/AXauweP7D14yFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fniSVL2P0W0hzbrno3scRHDnDSv+2pwlsi+f95rlga4=;
 b=fSjxPwNEWbssFYwDdVy6+tx2Nmri0yF6PL/dcZe2l48cIBedzACVpBNE3PywRAZM01JX5yMmy1vxmDX5omZhaPzOk4x8vT5jZeJnl5sOVN+ohy7KUr/Xc5Cw7UQhRDRylMEcOpof4JSX5DbMFTZqLrkUUkGzWSoRFZ8DSquckHo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB8067.eurprd08.prod.outlook.com (2603:10a6:10:3ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 11:21:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Fri, 28 Oct 2022
 11:21:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "bero@lindev.ch" <bero@lindev.ch>
CC: Openembedded Core <openembedded-core@lists.openembedded.org>,
	=?utf-8?B?QmVybmhhcmQgUm9zZW5rcsOkbnplcg==?= <bero@baylibre.com>
Subject: Re: [OE-core] [PATCH] base.bbclass: Try harder to find a compatible
 tar implementation
Thread-Topic: [OE-core] [PATCH] base.bbclass: Try harder to find a compatible
 tar implementation
Thread-Index: AQHY6lnoLnmijkGmQE60pUSGMGYNzq4jqj+A
Date: Fri, 28 Oct 2022 11:21:52 +0000
Message-ID: <5055796B-4408-475C-9D96-9F7CE574EE61@arm.com>
References: <20221027231350.418471-1-bero@baylibre.com>
In-Reply-To: <20221027231350.418471-1-bero@baylibre.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB8067:EE_|DBAEUR03FT012:EE_|DBBPR08MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: c7da85a2-4dea-428b-19d5-08dab8d6a285
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 LpwxW6u1fGP0Txb92j3HI9la9yzJHuSM/sdKPd4h0sybGlVzvd+Ou35trkBD4uPShWLtM2U5YPKnDcyD7FYPI6IEyBYaAWcn6FuY10Mdna24Xza/8H8J783uBxgRnDrN/mM1CdPN/l/L4mKy6anOa3UPvwP2WC8+f0mdC0uJTAnNxg9b+9tRPu5hfVjJzKecyBe62wNny4Cz7chKVyZahzMu/Lmiz96mmMwJ2IT5OOlqxshY5YFjySS4T5MNI7cRkblu6KpTItQIU8j8P6hj1NMQHYTum2pvGV0Mdbhiq/3CJM+9VSkw+RsTZTJaxyG4523DC/Pfk6VEPH2ZrCkS7g2HHfpy0Xy65COzKEWNg9g+lBxLbbj3gRC9ORGOlqscUaMtHb2YphClOVhiYsXlBym872JLWiBNAJw4YY2qQDZ2b+AT7tPqYkw2GbUCgCzCy6iqq2L9BhJi10gPWqggSmQRoj0rDW5/cOs6UF/6W3dht5QhUrGThAjXI65wrhJ4XUEpiUig/aVYHzeTa4cGLccxd+J5J3vskY94XR5ScGDjLqPTWkchzvU3LQ3Spw4y/FTLixaLwkuhXaeHjG/78riPj1xhHu/PRtkGtM7KiMgo9eCKnerlz578pVncOTXRW/zQ2vRjJOdkR5qaZhQIBzoT+IfqNVwK10uRTE0P/NR8pi7r3iTzM2UDDE5ka3VkWgn43bLeUi95cWMXco15v7RdRMs7Jp6EImV58bjYBseJ9GaOcshUVqPKWzp+kvVo0UiDLfgKoy/8Os9nAHCE9UIDJtxlOvq3zW5d1SIxqR+KqwEgHdL5sU+hrudB5S3UTwQDAAUAs7eIklwBETwn1ORdj6mUM9NQV/4ibjPVPLmzvkyJWorguL2eRrifkCFfhOji5y8lXlpZcaw6syamzw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199015)(316002)(2616005)(4326008)(6916009)(54906003)(53546011)(2906002)(186003)(6506007)(66446008)(64756008)(36756003)(8676002)(33656002)(8936002)(5660300002)(6512007)(4744005)(66946007)(41300700001)(26005)(66556008)(86362001)(76116006)(91956017)(66476007)(6486002)(122000001)(38070700005)(71200400001)(478600001)(38100700002)(64163002)(34023003)(37363002)(148693002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9994FD848273D54DAAF2ED4B55FA2ABB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8067
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	812a3540-72a1-4471-a20e-08dab8d69d32
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uSfrwPxN5oXmhV0Jbp9rBbpALVV5I9STWdsKN2o8q8KBBWTc2PNnDiEpCewyZaAngYJsKlTlR6qiOfct3fUhjA6/tzdA2+sLLKvCUZdtKBsUBBvKMLotjLi1jMR44jjMm80Yszw+XICosa0xypeXN7ZaznFfRFggJWRbQigYb8IodU/oXhkNRgLjBNXg7SnLnQs1//C2F0jSCjhEBYBmjYE70/B+rqAZQmHHgofTElH5yoH9NCG73+dMnfdiSFovq7rTE7TlbNJQojXZs1TBWOlbR7O/AOlhfzRHUAZeeoE8aUaasnjIUOJeoAF/NTn4qww2mmTu/qq/KH8aEUPnKpCQTH2dkM5aFE8t8TLRTUwsU6V3F+xNP8R4wi5QQMMAVx6qV50NMakdhHgTFugUlIfEhc/o3rCoOzidPFhP4t7cJOYHTlOL0qrZ4q1KOvxUR9NTC/RCbzfAmwG24JOYDaQKzbh/RI18IlRJshtdgIxgymstPQTh15MMhx/jOiQZpnRt1YjVOnXruDPTaLHvvZMgB32zsHEOtTwaGZw0gvTGpCU73IxUHcAdnJORdxztx+bGMlU8MFNBiUckBb5SK2uKQNcfDu3zW81/Riq0M+Xae5FmgWhkvLTLRD9PaBJ4nB6fndQsUg0zsz8C4rSn9dLlkKu51UcUVBeHCyeSy9IhDv+GeBAkeUrb8in2zuSIyXUzSXiqRuop8dLEsphVtHfkzavrog2s9fMRiduitMzlL9xpqO+3ePFGCUm1Nj8iTDqtaFQKv5W+1bfUxtu5J1Q+dpSJGWugITETFJIUvlreq1rzzgwWHqZAg7Y9Jou4xhAZaUhyGNKZjPj/1XLkL5C1IQhuQUoDKkWdGVZq99j10mxk5YHYBNKNBe2cln4d
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(396003)(346002)(39850400004)(451199015)(36840700001)(46966006)(40470700004)(70586007)(4326008)(70206006)(6486002)(36860700001)(8676002)(40480700001)(81166007)(316002)(2906002)(54906003)(33656002)(5660300002)(4744005)(41300700001)(82740400003)(8936002)(6862004)(6506007)(107886003)(47076005)(40460700003)(2616005)(6512007)(26005)(53546011)(478600001)(336012)(356005)(86362001)(186003)(82310400005)(36756003)(64163002)(34023003)(37363002)(148693002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 11:22:01.5490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7da85a2-4dea-428b-19d5-08dab8d6a285
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT012.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6010
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 11:22:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172246

T24gMjggT2N0IDIwMjIsIGF0IDAwOjEzLCBCZXJuaGFyZCBSb3Nlbmtyw6RuemVyIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxiZXJvPWxpbmRldi5jaEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gSWYgdGhhdCBjb3B5IG9mIHRhciBpc24ndCBHTlUgdGFyIChzb21lIExpbnV4
IGRpc3RyaWJ1dGlvbnMgdXNlDQo+IGxpYmFyY2hpdmUgdGFyIGZvciB0aGUgZmFjdCB0aGF0IGl0
IGNhbiBoYW5kbGUgemlwIGZpbGVzIGV0Yy4gYXMNCj4gd2VsbDsgc29tZSBvdGhlcnMgcHJvYmFi
bHkgdXNlIGJ1c3lib3ggb3IgdG95Ym94IHRhciBmb3Igc3BhY2UNCj4gaXNzdWVzKSwgdGhlIGJ1
aWxkIGZhaWxzIGVhcmx5IG9uIGJlY2F1c2UgcGF0aC5weSB1c2VzIC0teGF0dHJzDQo+IGFuZCAt
LXhhdHRycy1pbmNsdWRlDQoNCkNhbiB3ZSBuYW1lIHdoYXQgbGludXggZGlzdHJpYnV0aW9uIHRo
YXQgaXM/DQoNClJvc3M=

