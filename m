Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C707EC54EBD
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 10:36:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.75])
 by mx.groups.io with SMTP id smtpd.web11.83128.1673606199828581414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 02:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2aEZqPqV;
 spf=pass (domain: arm.com, ip: 40.107.20.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCNDiibgjDJ56b1ZqXdI/m5dRj2coL7jdKgflcdYtjg=;
 b=2aEZqPqVZU9NsqQhA5f2TD6XtN5T5By7FPXZM4YyIk+02KW/G2uPDKsEFgJfqUlrdAe1JGOKnCgFukba+BQd/+l65068PupieAKF0wmIyioUcnCfVKWjgzrqtQIZqmkaOR+rgmoLUHsbMf92PztNt8/XMlr3DXaFV86aFXhCYg8=
Received: from DB9PR06CA0021.eurprd06.prod.outlook.com (2603:10a6:10:1db::26)
 by DB9PR08MB6425.eurprd08.prod.outlook.com (2603:10a6:10:261::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 10:36:36 +0000
Received: from DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::3e) by DB9PR06CA0021.outlook.office365.com
 (2603:10a6:10:1db::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 10:36:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT049.mail.protection.outlook.com (100.127.142.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 10:36:36 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Fri, 13 Jan 2023 10:36:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e47edde370bbb6d4
X-CR-MTA-TID: 64aa7808
Received: from 0993ff99b5b5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C3B9EDC9-3051-4B2C-B14E-99446491005C.1;
	Fri, 13 Jan 2023 10:36:29 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0993ff99b5b5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Jan 2023 10:36:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5ZklKqD4kC5KyiqCAJ1nILmXcCr6r46uBcsqrHP6WAk8W5TGadWM3W20rizjoILh39OOP+uWaOi+i0gqJRk7Mkvz0tnG3VIPwcx1g1GkFR1A9o2w5vv1vS5WrTr175Y6SMHu9oaw2hPxtUmwXK7pt5J5EMteZbKsRD5Fqj7rRFNiJ1rddb53MXyWlj+MhkWupJsiuHVoHvOCnB6wT5sNN8iaLH6OWgzZ5NqY6oX9JWinQb/+ZQCkJ8ORVbkWldDwF3kvZTr2HusMvRSkGamKnVobQNZD8HS1o2VGFJZV7MjVFf1HE0J1yhmsPoX/w2MHp5snr8dHvn0DtuWqmvovA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCNDiibgjDJ56b1ZqXdI/m5dRj2coL7jdKgflcdYtjg=;
 b=Fl08sDh3K1MuKPWmZqDdBo7HRAxUfFIKxZv+vSjG4hqKc6R+ZnX12WtF5zOjwT40+UVGPL5+l6khn8ahHprdn1FisMs0bqlvickIX+JTptoid3Ju/EhnGzgUxdjSSd8Uize2CAUyW1qyHXMy8JdzOitlrb1dIzlbYWMFCt5fJMkVx/Z0cB8XUvX4TVHsteoRbyX7YmWJwoZ+gtjKlzfEPxHw4s+O1PBZvL13U0C4NWeL2DvmculmuT/YDyeXtqw6dp5xYkQAJOh6iky6UzULT+AFVwMyH7PKH2Oy9jkowMHDUJ4cFhcxU+2QGC8xF6cC+qk2onDO2zHZQM6fj3F54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCNDiibgjDJ56b1ZqXdI/m5dRj2coL7jdKgflcdYtjg=;
 b=2aEZqPqVZU9NsqQhA5f2TD6XtN5T5By7FPXZM4YyIk+02KW/G2uPDKsEFgJfqUlrdAe1JGOKnCgFukba+BQd/+l65068PupieAKF0wmIyioUcnCfVKWjgzrqtQIZqmkaOR+rgmoLUHsbMf92PztNt8/XMlr3DXaFV86aFXhCYg8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9607.eurprd08.prod.outlook.com (2603:10a6:10:449::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 10:36:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 10:36:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] python3-picobuild: remove
Thread-Topic: [OE-core] [PATCH 4/4] python3-picobuild: remove
Thread-Index: AQHZJnhpotPNUici+USS7JLAQk8I/K6b+p6AgAAuKwA=
Date: Fri, 13 Jan 2023 10:36:26 +0000
Message-ID: <1B8E8CEE-02A1-474B-AE7A-A3CA2F515F08@arm.com>
References: <20230112112336.2254765-1-ross.burton@arm.com>
 <20230112112336.2254765-4-ross.burton@arm.com>
 <CAMKF1soqRFWz4HNgQDLq2BPkaTt-0mb0225ddN_20b22KsTf0g@mail.gmail.com>
In-Reply-To: 
 <CAMKF1soqRFWz4HNgQDLq2BPkaTt-0mb0225ddN_20b22KsTf0g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9607:EE_|DBAEUR03FT049:EE_|DB9PR08MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: f12c3569-2309-409c-af5f-08daf5520c1e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 QnESA55/y/9f6XONJ5EiGVKikrCduFGzB3RitjGcy2/jeKsVYW1Ionq/UA7e0ZVyRO5gNCDnQVEkz6jM51qNUDJedddY3OekvG5994aOgwPW6+jZ+EwKKgzvSrr8NNB55jcKr3OQRpPUPdXZ+OnIyKLqNkkQcRAi1fCNIi5BD2BUR28a+owpQj9tIz808ZLdI65QDdBScGkaauQI/cMsyGiA57QlnN5xOVGzQ7Olb7zzJ1dNQDiIbCGGErHPUpg2h/hxQuH3AbgubNQJuPOBZ+ZwMABxQkJEqErqqWIzEa1CQa/qtSLjQzx7hTVgeaC/5g2dw3y+E8Cx9Gn00pnRp7L0NxlPiLAKYv6ddy4Oy5SiaLsBLIoFfq/a0pjzRCpD7JySWzhQxAja7aAg6AxEGPVFN1FwxrwoCO56nLRXbaqIIiXP1daDTX6SKQEDlhDqNsa65m8X7jNAEkKGmMJ+SAsbJqCo9aVHc07WmpZ2OwjGH1/1inZmlUD0RUT6E+DuMxcYlEzp1mf5cJu51ofDdyYM1tPhWJRBEYUr7yAK4ZhcGLwNUc1JLYrCu1znYjpiwreFeyNMkkF/EcKymOn1K91FdAhSfJxV2oddhV2I1XC3Ka5+2cAmr5GP0G2ZSuohozXD0VD0oFRXLQzXgMvx3flN4wkuvS1NIsWKH5+ocgWzb+db9dygH2WABp3ySIQ0ISd1byb2OieZVArMinVtdmly9RXhIf0GUxZSi2DHS7OGXMYt1fk3nyn61tv+Yt9C
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(451199015)(36756003)(76116006)(66476007)(66446008)(64756008)(38070700005)(2906002)(8936002)(8676002)(5660300002)(4326008)(33656002)(6486002)(4744005)(66946007)(86362001)(66556008)(38100700002)(122000001)(316002)(966005)(6916009)(478600001)(83380400001)(41300700001)(71200400001)(91956017)(26005)(53546011)(2616005)(6506007)(6512007)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0FC607E49948A4BB31DC97EAD1DE695@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9607
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	406b9fbb-de50-4e12-d80e-08daf552065d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	05A/+ONgUHrRXx2zDmk6eMkYy0eZU6fXMQWzAU1tPs0wwZHpWuWfvcCyJ1mBcrLj0euO6YSydtP2xm+8wwYPpa5lSa0o+rtlbRhJog3dZ0rn0jvgo2mFGJNZ6EeGUx+Xw8YT7Aw2lBG9qyOini7Cbufley4uJaGOx+h+q0f7D//5wisdPfQjeA6d9CkevAaBG+8FscVoqI9027bF04Svd+JsTe50qmhyzvUOcjI4pVdNnZLtsMfxQY5mDreTOCw/F0yFrKfKjd+1cytZ04zthNQup9LuPHkPqlKdMrNxRLasXNeGmbDQU2fD/rpsRLLMGduiS/Eo8PmCzxOb6+7RuNv5idhmjnsUTk+B3731jz2mAfXx+xZ7Q4y5rFxz2+KtvgG0rJLaqJ52u+Tf1d1Whfubxd5o0qOh2pIEhGpoJS32s0r5Pwnw8NlGYoBbuBAR5REkj78wqfBG9FJN3MSo/OQ5OK1A9BqkhRltfpzZ0gNHSsX0chizo0vCMA5tXTukN7He1/DLCIkgjcJpDrMXe+XhLjJiPVXLV/p8so0DaH05q1LGWXbdHDHpnhEcwSZpYH/YoXPCPmMZZJuFdrEc45sSr3qSLiagLnf1d7N7ddwZmVw5sCSY4Bauj6R2dwOkYjHIeSSd6YgHMBUOa1DGLGZP3H5APR6P4oaLb/9dD2VorRnIn7Nq6qsPRf8tKhitaLB6vqHFa3FOpxTcTdc6Cu23WEaxAR5UZwOUDkQxSQ0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(40470700004)(46966006)(36840700001)(81166007)(82740400003)(356005)(5660300002)(6862004)(4744005)(8936002)(70206006)(82310400005)(8676002)(70586007)(4326008)(186003)(36756003)(40460700003)(53546011)(6512007)(26005)(40480700001)(41300700001)(316002)(36860700001)(6486002)(966005)(478600001)(2906002)(6506007)(86362001)(336012)(83380400001)(33656002)(2616005)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 10:36:36.5651
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f12c3569-2309-409c-af5f-08daf5520c1e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6425
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 10:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175820

T24gMTMgSmFuIDIwMjMsIGF0IDA3OjUxLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IEkgdGhpbmsgbWV0YS1weXRob24gaGFzDQo+IG1ldGEtcHl0aG9uL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0LWZvcmtlZF8xLjQuMC5iYg0KPiB3aGlj
aCBuZWVkcyBzb21lIFRMQyBhZnRlciB0aGlzLg0KPiANCj4gVGhlcmUgaXMgYW5vdGhlciBmYWls
dXJlIHdpdGggb3BlbmdsLWVzLWN0cw0KPiANCj4gfCBNb2R1bGVOb3RGb3VuZEVycm9yOiBObyBt
b2R1bGUgbmFtZWQgJ2J1aWxkLmNvbW1vbicNCj4gDQo+IFNlZSBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzg4L2J1aWxkcy8yMzQ4L3N0ZXBz
LzE0L2xvZ3Mvc3RkaW8NCg0KSSBoYXZlIHRoZSBwYXRjaCBmb3IgcHl0ZXN0LWZvcmtlZCwgZmFp
bGVkIHRvIHNlbmQuICBJ4oCZdmUgbm90IHNlZW4gdGhlIG9wZW5nbC1lcy1jdHMgb25lIGJlZm9y
ZSwgSeKAmWxsIGhhdmUgYSBsb29rLg0KDQpSb3Nz

