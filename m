Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2EEC4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 21:02:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.68])
 by mx.groups.io with SMTP id smtpd.web09.736.1667336519545783663
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 14:02:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bhNBZB/B;
 spf=pass (domain: arm.com, ip: 40.107.20.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RwDZu+WLVwZDchhcLt13ZcCfuX6b0ZRIaHvdCvnXPc7yC68rG8OEomJnHiWvtwrS87kwWDaQRJC7NElUNoY+55ilWfebO2dKKdPwEHfXjjkruR+p+eZuCyVu5/hVcUJKYwTv8HB4aUFjlyoJkopGgp4r5RQqa/Dnaat5a7kDfNkUu24Kn4s4xdXPacWhhEBumQqXYSL1yGNfILWR6U0GFAKsV9PL0cwdU+XdRA6zuizpltuUCXzvW4FvsyAPBiUgGeBNUDmC9krsiWkcIkqyVDQUdBgVqtFdlzzdLZN97LF2UThKeOQm2dA+sZJ1DYQQz1OXAGf64fESg6gnu8JuZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYkYPsqc+PO9qO1V6t9tkU6WVWRfies6kfU8dAuIT0Q=;
 b=I8v2+SHcSejotqMRHlo+hvM9ruYunuel6dz4uF9o4ZdJ6va2EKlVac/a4zZGAke3wBsdO5vaYEuLkHzXYlw2ow9zPY7FJy8ff0826sVhzXDkIHQQpfrzz87EMQ3k3P7oi5CG4ulif7jAWWf8fOakL7c75hRiEW4QNrFwK61QS3zbYNRIEXJkipi3NpvO90wakOJB+dLykfkaaL5QBOlq/DGTAOdHYQnWZhQCOjxhc9qVNG4ZrXVTdqA2H4GXQPRTvq4tnb2euUqLc1jKcWbzeslJrGjRD5n9qwjwbbAscmqS58F1WxtbIDXuuaOLGjq8a3DKYQBHzipjM720LSCIag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYkYPsqc+PO9qO1V6t9tkU6WVWRfies6kfU8dAuIT0Q=;
 b=bhNBZB/B9RjGuZXK1jxlXxYTWK3nF7Xz3IhRQXRd5Rsig+b8fTTtMb4adnhuEHBB9OA1P80vBpp3gaP35QiGyFrJYH+U0vz1z/7ahN71UXtKilNcYC0100wjoy2A1zgWZ2LltdiFg7DpzeUk64EzZR5Fm4vBalnVMxf87gVXMvI=
Received: from DB8PR06CA0055.eurprd06.prod.outlook.com (2603:10a6:10:120::29)
 by PAWPR08MB10259.eurprd08.prod.outlook.com (2603:10a6:102:366::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Tue, 1 Nov
 2022 21:01:56 +0000
Received: from DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::8b) by DB8PR06CA0055.outlook.office365.com
 (2603:10a6:10:120::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Tue, 1 Nov 2022 21:01:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT028.mail.protection.outlook.com (100.127.142.236) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 1 Nov 2022 21:01:56 +0000
Received: ("Tessian outbound 73ab5f36653e:v130"); Tue, 01 Nov 2022 21:01:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a2423829d2210595
X-CR-MTA-TID: 64aa7808
Received: from 045778b46bf6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8FE3B5F5-C1A6-428E-913D-CADEF484FABC.1;
	Tue, 01 Nov 2022 21:01:49 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 045778b46bf6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Nov 2022 21:01:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ba4zv+cMJ0FQGodEbV3CtDXMu1EjqF/XiUXEYpmDKwWrdBEGmRLfCqljLowAfrQVvEg5eSPgHk80nDclwB3OWUeP2jSxMvrsKId0kAjEKtIjLKUk3SnOz7weDdHwH33Qk9rJlURW/X7TC0CIjywTaG7JtNq9v3R2bDpqXuSwJR2olXP/HK0TnExqPGcE5xdhRalNkFjNXFfcff+XiybAX3ylumEExRUTsAPVncEFf10ImNwMi+ROGPPud+D0W1UOIaiPe0p67TRNjhko1QtTOMlfZ97OHCobJaCHpkAb2cgkPSNQY5N8iCQNOVrr11Wi6lad7jYSXhUK36QGJU2mcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYkYPsqc+PO9qO1V6t9tkU6WVWRfies6kfU8dAuIT0Q=;
 b=EXMGCF/60jJ2Uq6JyhyAwGO/uC5rJvHuvxw/+ErXkktnApXLBPZ7EjPWigSXLFwJHxMqWEo/pth1A5WJGWIfsiel4XGetvVDIDz6NwD/9VLa2VCfZdGIdjsy8K2BMAr1SKrHKNqjavGseV8oFAJGu9gEmzJHTu3ZobwF8BCcg9ma454ZFvF+2yu6PUJcEwQRphCQfPLxt5DDR3AtEcKcVBA9zK0hIug/9yymmPG/Hq8zf8PAmzdAsg2IrdCWymrwaOjpeuHVa5BXSVwCPiVQU+nGc1BanSoPmBB0Yxyu+Fcngh44Tl0vpRf3/MlK1c56vN9gD8zI2Mi702KdLxMviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYkYPsqc+PO9qO1V6t9tkU6WVWRfies6kfU8dAuIT0Q=;
 b=bhNBZB/B9RjGuZXK1jxlXxYTWK3nF7Xz3IhRQXRd5Rsig+b8fTTtMb4adnhuEHBB9OA1P80vBpp3gaP35QiGyFrJYH+U0vz1z/7ahN71UXtKilNcYC0100wjoy2A1zgWZ2LltdiFg7DpzeUk64EzZR5Fm4vBalnVMxf87gVXMvI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5685.eurprd08.prod.outlook.com (2603:10a6:10:1ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.18; Tue, 1 Nov
 2022 21:01:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.019; Tue, 1 Nov 2022
 21:01:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sean.anderson@seco.com" <sean.anderson@seco.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Openembedded Core
	<openembedded-core@lists.openembedded.org>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>
Subject: Re: [OE-core] [PATCH 6/6] u-boot: Rework signing to remove
 interdependencies
Thread-Topic: [OE-core] [PATCH 6/6] u-boot: Rework signing to remove
 interdependencies
Thread-Index: 
 AQHY5aZLoPFQ4WyWk0uK1Loq3RWG8K4g6rDTgAACzgCAAAYegIAC/8IAgAAFXoCAAAJzgIAGU48AgAAU7wCAAAMOAIAAODcA
Date: Tue, 1 Nov 2022 21:01:44 +0000
Message-ID: <9E040E94-6F15-471D-8065-22F8FDB26326@arm.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
 <20221021233726.1751124-7-sean.anderson@seco.com>
 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
 <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
 <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
 <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
 <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
In-Reply-To: <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5685:EE_|DBAEUR03FT028:EE_|PAWPR08MB10259:EE_
X-MS-Office365-Filtering-Correlation-Id: ec29bf2d-c9a7-4cab-d5a3-08dabc4c4f7c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 n52FPpcxA4AVsyu/T7SbexqY/DvuHZVXdh/6c794rq/k0LsaFLU4hPBdd05BnaBTcvyHpKX5qZy7LRz/UURm4TLpho9sNilygL22j124rKPSFh4zIZjNCaBCkkXgflYVRJO+He1osTxEj2fVyFEmSEldapU0UPrLUusK/OFJwm81cjq0Pm3Q7EKc/bSSErAtFFQ5wwitBO2NJykL/lWA7dtApqRD6FFgiSXzii9mBCBK8nGRMtyR03iSEAnCm52qBe1cXRS3IElurLmPtx8uDTqZAIt5da0/yBZAjuZ/K4LLksCispTBOhWxmCbmnphVXCvMaIaYiz2SWjmpt5PS+WA3GK5L8M0I4nTMEU0P6bPPq3ZDfmjQLG4zMhR340lXivCNqlsbup/IhQsiY6QLHurks6Iy7LaLrj9t6oExSHtedDbCSQN0HcQWU5TAOm/ytITLOAN74cWB8dUhIbgzKKZe6JLyHIhKgzm0n1JicwhlWCRL3wPYZ3Szk+8Y9kceC5B5o5kVTC3GuEinx1bFjDst3qVgdpNzZ8FSQ/u/rd24050yigZr/1celiVwNlbdw6JI2gjqvXsfKTlZbu1uI7yANtlmYdgcfq/7rV+cLk9gXaqfpojOhnn6D+L0sz2Lnxkl/oQ2CxH2Hde//GYXpHbHwKb/2yCJy4DyaNaSnP5nGL9hlow+515cTFw5ExGrXBVI+RGZ29uVQ3BbyjCwYQyY/RfRLuTKZZsB+zV7LPQzJvw00AflwPg54g1ZOWUPMKDlfvRwzbCHfymF573IWJwWoaA6YtEf3PBZi2vn5nY=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(53546011)(66446008)(33656002)(66476007)(86362001)(36756003)(38100700002)(2906002)(4744005)(5660300002)(41300700001)(38070700005)(2616005)(66946007)(8676002)(66556008)(64756008)(83380400001)(186003)(54906003)(316002)(6916009)(91956017)(76116006)(6506007)(4326008)(26005)(122000001)(6512007)(6486002)(478600001)(8936002)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <265318F676373E498FA89F3FBCEB336F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5685
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	921c1714-5833-4f7d-0f90-08dabc4c48a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+zKeBUV51763r1/q+TorJFW8l9nif4iyjw0kAKixzEPbO9hdvGqh1zrOonxjyxeh7MZXFz2kh251ztVhh1UCoZiw3tsn2QGgWHoiJWiv8B5JgERArbWtgFQY+rqNKIBLKnNzWcwerwKZalE8vi8LXQh1/OCIAcF4oMJIdiYVJPtmB+0sMG2VwfTFUqDjVnZvLKonz8Q2Z1ZxmpwDJ2FmGgmNBQMrhskH0EWyVTAVo9qXgNpGhGL3a3lxpNkpoPWp2F8A/IZX2AchDa32qGH3Ai7yc0cedfWrVlFnfMu9slbE1g1RTVrjQ8cFVZlPjho+dunLFnBhAH6a+OEhzUGji41mkVASGbeIUdhEeMEhPnpIZJuJY3aycTgeqDMPHezxbYy43Eve0y6cfiE4tqtC08gB8AGmiFXrHvaAe2CVcSNNFSdqlKSBT/wEFla4k/U0Gix48lFGmlTm8o7JBuQa1/II3TpzImEoy+H59L95daXIGgoEei3/jx9RdGeQtOxB11tCxTbryyZiz6hpNOU3Q+YYl7R7kR3SQ7j9UcR6Jdjy5gC1fECJ7tMwy89exhzLUKUkFynOsmN9Pf3OVM+kWwZJWXeQj+ovXl0NGCIN2N1bHa9IDykkb1WbHDF/+82U5lOwn0R1832djVW76F32u00jak4K4BhFDy3EeAk65ksRBVmRC2wNysLC/705YBqUYqd810DOJy5Nb9EKcg2KYSeA82S2JeeNJQlm4jewreOLZMDKAZEqPNaI0XKGf9z3rLyVjakHyr2ikO5YRvuBiA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(336012)(36756003)(83380400001)(4744005)(6862004)(5660300002)(2906002)(356005)(47076005)(2616005)(33656002)(36860700001)(86362001)(81166007)(82740400003)(70206006)(6512007)(26005)(316002)(40460700003)(478600001)(40480700001)(54906003)(186003)(6486002)(41300700001)(70586007)(4326008)(8676002)(82310400005)(107886003)(53546011)(6506007)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2022 21:01:56.3464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec29bf2d-c9a7-4cab-d5a3-08dabc4c4f7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10259
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 21:02:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172388

DQo+IE9uIDEgTm92IDIwMjIsIGF0IDE3OjQwLCBTZWFuIEFuZGVyc29uIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxzZWFuLmFuZGVyc29uPXNlY28uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gSSByZWFsbHkgd2lzaCB5b3UgZ3V5cyBzZW50IHRoYW5rLXlvdSBt
ZXNzYWdlcyB3aGVuIHlvdSBtZXJnZWQgc29tZXRoaW5nLiBNYWtlcw0KPiBpdCBhIGxvdCBlYXNp
ZXIgdG8ga2VlcCB0cmFjayBvZiB3aGljaCBzZXJpZXMgc3RpbGwgbmVlZCB3b3JrLg0KDQpNeSB3
b3JrZmxvdyBpcyB0byBoYXZlIGV2ZXJ5dGhpbmcgSSBzdWJtaXQgaW4gYSBsb2NhbCBmZWF0dXJl
IGJyYW5jaCwgd2hpY2ggSSByZWJhc2UgYSBmZXcgdGltZXMgYSB3ZWVrLiBUaGlzIHRlbGxzIG1l
IHdoZW4gc3R1ZmYgaXMgbWVyZ2VkLCBhbmQgbW9yZSBpbXBvcnRhbnRseSB3aGVuIHN0dWZmIEni
gJl2ZSBzdWJtaXR0ZWQgbm8gbG9uZ2VyIGFwcGxpZXMgZHVlIHRvIG90aGVyIGNoYW5nZXMgaW4g
dGhlIHJlcG9zaXRvcnkuDQoNClJvc3M=

