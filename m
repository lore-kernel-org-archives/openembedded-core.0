Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64767C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 10:05:38 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.87])
 by mx.groups.io with SMTP id smtpd.web10.5283.1666692332930550923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 03:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=7/iK7rpU;
 spf=pass (domain: arm.com, ip: 40.107.13.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O7fYfsc+88lpwg580PgJUCqcyMXk7C/0pfwcIPUro/RZcSm5SYgnkeYD7ddSWC84nS3y71Dn9kQQ+Z9PN6qCVB7/ZTGdY2CJQQlEcnOsope0NpjTiHHfO9/3zYw6dal9H06Bj06PI7s/MOpQh6OAGUKB3m/yacTxHfm6yEBHSPJIIJTILbGSW7n9g8P4G+6KAJahmkjLeUu2SFPuKIbYm85cW8Uf2yNMyJCZ+z3I3N/bMJTQ1ZDvG8XeUSMM+gzQbH5s8Ze2sCFvHVCDi4tVOqC9rYdhHykW4NGVt6JMz+iA5Pc6BxsgreiVbwrroadpnRBxGWFZP+qKO2/nNYuTOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DylhZFUiJ+MSFY9ruy+/W/RqM2kvM53oWUh3B9VeJIQ=;
 b=c6vmGNyEjSQY7sdilyDZ+vaDOPgTekQiFG2KoCU3lz3O1moJP2yobIzLDLcuyntytYpu3kaJyfuVPmaGmOnYrhcBrfbMXtp5JDShCL2XQG7f/1RlOrObuXsKbfEenT7ogAo27BhCHDosrnRzKaFHucYeQdT86GTgPddmwgWB1StX4b1o0Q7GlddgrBWaX4O7x6OYkPEXzC269ffv9ak4pWYMxgyJ1gEFVL99Ue0XWcf8j/7SE7B/y5KV5LWnqYd/W1N1Y2rBIADy3DZ4KGhAbUOof2eCxTzw6hvrcFGOz3G6C+F5kE4ltQnzpx+1qti3uGytovX7Jez/rptjrRLeFw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DylhZFUiJ+MSFY9ruy+/W/RqM2kvM53oWUh3B9VeJIQ=;
 b=7/iK7rpUQKfQ9BQSOGTF71pqwi3Nj2h8Iq60sMXuRKH1pnBr7J75XCpb7UvvWa1h7GfSQR3tfaLs/6t3nZPC/2PfvpPtY5XBV4Bz52traGEsSXkBFXU1m9X67+m5e52vpgIHBt6lRMrZDF8CRYiOIz8x3wS2GN+tU0FZ0SQ25w0=
Received: from FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::23)
 by DU0PR08MB8614.eurprd08.prod.outlook.com (2603:10a6:10:402::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Tue, 25 Oct
 2022 10:05:28 +0000
Received: from VI1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1e:cafe::b0) by FR0P281CA0084.outlook.office365.com
 (2603:10a6:d10:1e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.12 via Frontend
 Transport; Tue, 25 Oct 2022 10:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT008.mail.protection.outlook.com (100.127.144.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.19 via Frontend Transport; Tue, 25 Oct 2022 10:05:27 +0000
Received: ("Tessian outbound b4aebcc5bc64:v130"); Tue, 25 Oct 2022 10:05:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ede8e538dd3d73d2
X-CR-MTA-TID: 64aa7808
Received: from 4ab5b2e9f6c4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B3C345F4-BC91-4BA2-BACC-76D0C79888C6.1;
	Tue, 25 Oct 2022 10:05:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ab5b2e9f6c4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 25 Oct 2022 10:05:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MIqtOGJPMN2Ul6KtYxAxpbXK8kxTlcyO33pLvtC/e62NH8d4Pqt8f5vgr+48D5UyNqYrcz3GXqyNqVFkhv/n0B6MEcUmWHJQYpuOm+qq+SHmDGgnW0ThAqoQugSNwbHipb4TZtuv5kcwmUoOyf/YGTz906nj9V6XldKnJ+rAzuBxBRXrvueRBxt/wCo0gZiMg3Kjd5MxHnwEblOyGzPSvsQ+0pj/Oc7yOtCEshSH75CYBzjGYvcs+CuxKLl+lWR+ggPZ6H2k0Er7p0Y8XA2+CHONlFbckGbQm+bLtEJ2QU+AuYGplJTQZwSPrLwzHd4XgziXUexn51O78CFPSrx0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DylhZFUiJ+MSFY9ruy+/W/RqM2kvM53oWUh3B9VeJIQ=;
 b=HqksAECsX1NRmKTnOBdrVqo4Ve+f5WNQbeDs6VTs2VrX9JfcvQP6zu4GzU6Yidsbc65CenQOaOx9KzuXJTq3unGzBg6niuLKbqKeX1BHvrLIBnV0HV9bzEJyBXjcO7NSPhZoZCSDBefGJHuuTd7WKSatwugnDAQCWTOKRYIc95yypYu8E5EIelTCC15Re8Q1J3Kxnd7DcODer2bnjeCuNviXekhjj6gBQJTp53IKTGqths6Dc4ZvEIBT+KG0zTkNVLDGdzDr1Z48tKCprbm368JTa/Saibzpegs8yUL1U6iIvI+OGAyOAfPfCkZ7RI1sym9BBR8TmnLzefNJztGTWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DylhZFUiJ+MSFY9ruy+/W/RqM2kvM53oWUh3B9VeJIQ=;
 b=7/iK7rpUQKfQ9BQSOGTF71pqwi3Nj2h8Iq60sMXuRKH1pnBr7J75XCpb7UvvWa1h7GfSQR3tfaLs/6t3nZPC/2PfvpPtY5XBV4Bz52traGEsSXkBFXU1m9X67+m5e52vpgIHBt6lRMrZDF8CRYiOIz8x3wS2GN+tU0FZ0SQ25w0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7854.eurprd08.prod.outlook.com (2603:10a6:20b:51d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 25 Oct
 2022 10:05:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%7]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 10:05:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "vince@underview.tech" <vince@underview.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] mesa: enable glvnd support
Thread-Topic: [OE-core] [PATCH] mesa: enable glvnd support
Thread-Index: AQHY53SxEWf/LOUYv0qnZLew3Zdb+q4dGyOAgAHIhIA=
Date: Tue, 25 Oct 2022 10:05:18 +0000
Message-ID: <C917DA2F-DB15-46D8-901C-B1AEF21AD347@arm.com>
References: <20221024064759.343728-1-vince@underview.tech>
 <850.1666594281180346600@lists.openembedded.org>
In-Reply-To: <850.1666594281180346600@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7854:EE_|VI1EUR03FT008:EE_|DU0PR08MB8614:EE_
X-MS-Office365-Filtering-Correlation-Id: e687255e-97d8-426a-7acc-08dab670714e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GFDHRs+ubsrlxMn9SaDyWLApdpZewEG+VZ4AO44nXpiiyMH3ce8dO1lWA2Eave7FzL8Sxc735c7i0b4jKwch74QAjF6F99ZnrXvaouEN8APvbMqWkg3/S0Ho8pzHKwAQMUv59pdP+Z95m2ssVTYcyYx7cJV8niCyXyjFFxMubz5aIC8zR0OvDqeo0UKgYVt/xDm/YF/ytgV1W2TzOX33a87f2eHsQf4ijcUeD1JZziCaBNaHwI0GMG+RjMoCjFL2QJwBEhrRuFjjlz4dHkRW+B8xhauXeynxOdJWTgGsWbJ3BFsGZCsfyloVSpWKycwTRvzeDYUWYkxUmnNWKUH+bX9xJ3AgoHyNTLyy0bJkCrk6QeDNPLvCmsLWOFGTLvydrcGpC9j/VX/Wec/UchPkhcp6WEYmVoZt8yiw3UqFxXtdirqHaV6CTNPr4v1kWqwfuQMpSCNTgnMtaIJT0xHT3Na0t+lR31yEWNA6M0q5x6TS24EsjyhO68AwJclb+OK86gvV7DUBTALQalo2Mww0UKhvOJLMTGK0t6IIKIVO1rxcDs5LEQGx0pz0vt8kBFWtGaQCBmg0rBidMYSoXDIuEha/ML9D0C/F6DZVy44iDRwE4345co8kqNvnzXGq7091u2AU9glSgkFJpF7kDT7uBoJshSR37DE+2kItvHkSOHHUayZcJNGaZ+JvKfuS6TcPxX5EpLojjb8Xruebj5ZYjC5I1NE+Y1V2HhuU5i4iXF8oi2N2zrJP/7h9/oUnNLmhY8tTory2S4lpSNbEZAT1901WpTQqLqJFmtXBe6KLSyQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199015)(4744005)(4326008)(91956017)(316002)(71200400001)(6506007)(6916009)(64756008)(2616005)(36756003)(66446008)(66946007)(53546011)(8936002)(2906002)(66476007)(86362001)(33656002)(76116006)(26005)(5660300002)(8676002)(41300700001)(66556008)(6512007)(122000001)(6486002)(38070700005)(186003)(38100700002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0F40404D45FC6B42AF2BFCCCB55D9146@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7854
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d826425d-c54f-43fb-d4db-08dab6706b6c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QnSxRSH60V6mrZqKd5BeCUy9kgTuSA8CmFL1gIuN6FfpH7dI32NcyIDsDGfIFQXdyQ+hfLkTynhnd9Qt4MhCukiz6ls/lwKMfjqdFISu7nPcnrlEbzgbp4er4bGBEg7iITVzS4PXyKMuvuHZOxDLceljlOINVgrtEEQgk3Z0y0e2Vf517w1sZz1SAGvySXPlgOAv0CjCsWsgmTq7+OQchANI2EZuZScNajhlSMc2amrJXUrcYsd9rKux9cst+uQmsgEFIct/t9tg1wUys6NiAPR+9wz0++6dpoOnPP+zrrBZh8d6LRM3r9SDy9TPkNuCXkyogRmo3bFit5V5t5X2vpFceVWkgpjzDTlce8493sCVdqipzXk/92fUgCMRO6lJoIw4NRjgOd6MM33VI2l5r+FJTOmxJnVqSMWMsvafrUCQVN5gYjdVP2JzpBA0pNP0TAoXYrPUf2TmKiAxPRCrUZls30TaL1oHmDutaI3hNp/I7eZFBLbYr4fypCQP6Yx2K+QmickoDgi6ECT1rq1iKdV2Vst4u4cCsghe9GVKpIXh2ewTX/rt9QVOU/DorTcDoUx+m4rFh2e7RDSDZKMxitsou3kGy4bRptE+VDbk40FaLtZdAhTvzk+IiFvgZ+cy9MvjVDgpvl2rwOg82MzIdScJ84Q5TxBVkQDrzwvX08+tIbRQRYZZy987K+PjF4c7BTFL5pbLVEylGEtTr+MfICnkAGoAyEsgUqgrFRSoXp+O9IkP0YLhx/P4u0EdZIpp3JC4AwgIQQEYLxCwO7yvtA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(36840700001)(40470700004)(46966006)(2616005)(36860700001)(6512007)(81166007)(336012)(26005)(40460700003)(5660300002)(53546011)(4744005)(6506007)(40480700001)(186003)(6862004)(70206006)(6486002)(41300700001)(47076005)(82310400005)(4326008)(316002)(8936002)(8676002)(478600001)(70586007)(33656002)(36756003)(2906002)(86362001)(82740400003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 10:05:27.8813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e687255e-97d8-426a-7acc-08dab670714e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8614
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 10:05:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172127

T24gMjQgT2N0IDIwMjIsIGF0IDA3OjUxLCBWaW5jZW50IERhdmlzIEpyIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDx2aW5jZT11bmRlcnZpZXcudGVjaEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IE9uZSBpc3N1ZS4gQ2FuJ3Qgc2VlbSB0byBnZXQgbGliR0xYX21lc2Eu
c28qIGluY2x1ZGVkIHVubGVzcyBJIGFkZCBsaWJnbHggdG8gdGhlIFJERVBFTkRTIG9mIGFub3Ro
ZXIgcmVjaXBlLiANCg0KSW5jbHVkZWQgaW4gYW4gaW1hZ2U/ICBUaGF04oCZcyByaWdodDogeW91
IHNwbGl0IGl0IGludG8gYSBzZXBhcmF0ZSBsaWJyYXJ5IHBhY2thZ2UsIGFuZCBpZiBub3RoaW5n
IGRlcGVuZHMgb24gaXQgdGhlbiBpdCB3b27igJl0IGdldCBpbmNsdWRlZC4NCg0KUm9zcw==

