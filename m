Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F42FC77B7C
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 11:43:44 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web11.24818.1683287020404697703
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 04:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DZ1/Rutj;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPwvWf/qWmonmI1iR6+rUZHDOZuZs1OD6/fXrkmP74A=;
 b=DZ1/RutjWEfHdGQ6ENB3OnNNkh5SrlQOEjPudrXwYyBolgGr1X61keduQVhYayPY7eO346ppW0y/Sq3GYmjAHnG2cUz7fKsQAvfeAXRb4OG3xvLGlCM96cfWPfE59waGQPtY50OidBU1sHu92lp/U6m+YaBOUhkjFB/h8+XrZKk=
Received: from DB6PR0301CA0006.eurprd03.prod.outlook.com (2603:10a6:4:3e::16)
 by DB4PR08MB7933.eurprd08.prod.outlook.com (2603:10a6:10:37b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.25; Fri, 5 May
 2023 11:43:36 +0000
Received: from DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3e:cafe::8a) by DB6PR0301CA0006.outlook.office365.com
 (2603:10a6:4:3e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27 via Frontend
 Transport; Fri, 5 May 2023 11:43:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT020.mail.protection.outlook.com (100.127.143.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20 via Frontend Transport; Fri, 5 May 2023 11:43:36 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Fri, 05 May 2023 11:43:35 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cff7940be7a73bb7
X-CR-MTA-TID: 64aa7808
Received: from d8ef6a5e11b0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D501CF17-F13F-4081-AA14-5AD8E890AC0F.1;
	Fri, 05 May 2023 11:43:29 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d8ef6a5e11b0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 05 May 2023 11:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=deE+bHdLeNJl27IW4POzlyu+ZhFo/dIpSHcACh4+Y0P3nVH2X+JK1i0yfrxL+JQs3xTtaPwcP0NHwHCCnEMUlXixM9Nn4tHhalVR3ZjQBKOx4wSRwynNIK2EwhbTxEt4uD1nTeRRUfcnLODxjU2RjfjT/yNOfCnHk8PfIQ4nZDIO9wbfC5GmGXCtUVIOUyoOg68aW+6OMUMFPZE/VVkSqmbAKZc0JwxHN6k9OKneOaCJfHtGTPQa1PHKq4KYv4LnMFqiy4ugcAyl01cqVstXhIkat/Gzk/S2rdouLbEs7Ct02Hl2C8qzMEjFKxmzEdvsqiVICT1XOVFBr78rcHsEMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YPwvWf/qWmonmI1iR6+rUZHDOZuZs1OD6/fXrkmP74A=;
 b=njDW7RIsrsWyiyVlFpcKPAFm/SWtEPFfGfsnvtoVvgWNmgiqih2te98z0hSx5tNk1MJPYiFcf8rim2NK1FL2TG2dGKHqAG2yqw3HZ+GP4GkT24lmMDDRtLeK6rpkkcFsASQ9JLi5/9TF/TjqGVTEMGwYDOdl7u/Dh6obTZdGVrppGHP1Y95mbAplAQKmtZBzRFesQb1GswT+b5X1wHxhlPxaL7RPnqJom7QnZbYfgQij6VdRlitlpUNbTZTseypjwRBhPFYjV4VAhWhIYTUT7Uc5bPoG4qPvCENkj259kT/fnbHMV2akxxFummw0gYVYvCMGjiYZwPgZhUCbqLWrSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YPwvWf/qWmonmI1iR6+rUZHDOZuZs1OD6/fXrkmP74A=;
 b=DZ1/RutjWEfHdGQ6ENB3OnNNkh5SrlQOEjPudrXwYyBolgGr1X61keduQVhYayPY7eO346ppW0y/Sq3GYmjAHnG2cUz7fKsQAvfeAXRb4OG3xvLGlCM96cfWPfE59waGQPtY50OidBU1sHu92lp/U6m+YaBOUhkjFB/h8+XrZKk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5639.eurprd08.prod.outlook.com (2603:10a6:10:1a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 11:43:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6363.022; Fri, 5 May 2023
 11:43:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/5] insane.bbclass: add a SUMMARY/HOMEPAGE
 check (oe-core recipes only)
Thread-Topic: [OE-core] [PATCH 1/5] insane.bbclass: add a SUMMARY/HOMEPAGE
 check (oe-core recipes only)
Thread-Index: AQHZeNriHXEPWlgRPEmpgksBveddS69Lm9qA
Date: Fri, 5 May 2023 11:43:28 +0000
Message-ID: <DAE64A67-C0E3-4880-AE19-357FED7695C4@arm.com>
References: <20230427073528.3956414-1-alex@linutronix.de>
In-Reply-To: <20230427073528.3956414-1-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5639:EE_|DBAEUR03FT020:EE_|DB4PR08MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: d9416b16-e00b-4b6a-def9-08db4d5df641
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 kFCmLk8vxcKqH9puv7JgTMi0rf6k5l1cKnB/ZjhxCrvHrgclPdBYcIq82A/G6IYmva/mv3h11qL5uBzN19WfG9TaV+8wdQfmusYRs7RE/xNjzc3GPaBwrAKLGPMnRzG4Mdsxz6AVgc/CjLu3oVzuJ7MryVuITjqVLgYAXkNrUsN3vl9lZX6HCMOi2SBzevuzx39s30XxggbcA5G9+Qb1wMLaxWoryIOrVPq+sNgXDN3/OIKvOnTquCXefuyRhh059quKME4JeI48LSwo+IAGrgwjYxBu14yU0XVdwSDLE4IrAL/WXZWLmU7RJTi1UjKGZz5ddL05LeKCIZUI9zwAeUnxmSffzuNo/I6MKQ1LGJhCMjBC+To1/WZ3tCd56vWuas6zoA2MArVzi8GxPCjHOIyDyZfCzqisPx/yFqvoZM0LOXybYe9a8MCA9vGYcSjPK1SORmJO+pBatyn3Wv4yNK4AEJPfy+VcFjrBVK84r4AiMwpQt9d3zZcvAUhE2UAX7jTgSZmoXC3ioka3yCDPHJZ1tvf3SKpKJysMVDgvFiJ+PT2VRIGV3SJIDaMFK+kCirq5SKoEXaCFAFR47GSb7w7mMFqXrEOPl25DMftLMCwc/I7YdGG9k4ipl37HrdOboBe6pSZwnTXlcTzE3mlr3g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39850400004)(136003)(376002)(366004)(451199021)(83380400001)(2616005)(186003)(2906002)(38100700002)(36756003)(33656002)(38070700005)(86362001)(122000001)(8936002)(8676002)(5660300002)(4326008)(6916009)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(66946007)(41300700001)(71200400001)(6486002)(316002)(478600001)(26005)(6506007)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <15DB77FA64FC254585D12F0E3D2B6576@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5639
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	3b9bdcdb-75c5-42b6-9f9d-08db4d5df1a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aPFyH7+Yzfc7uXNmGw38uJpUGY6/nxV1V8Nd1XyypNV5y45TQsYcSk9mE6paNiWFJqrIJ0PDxg4X8j4KLxtpfFgiN18n1clvnmUsZnoNAG303WbJubaoBJm21do8GtQUpEb6HlwrPlF79mUuyNXLPAcgS9gorraU1/P0BlqAjMST7aN1u0ADS4Hcyji5v7p91leWJvZhHuWTVmYK69rm0n75QaHYmR96phX4bu2ZRwrWjmzrAywRsWLoF1TKPXagnv0Zrd5ihFlgbRkPJVA5I9xaSqTw5ySpvMmKrGtBXgX6KaWT6l3p1GOExy1bURvZLJJSqaprbPaX75k7qRv/uAJce98fg5ig6gU2/qgapyP2n40M/Rj60eSIbjuhNzByPVDU8y2q6Rwsqh6dftIsq3+TXL4fWfC9vZ3jSVZrtWOO7F1Fpq9+nxjL5Y5nyBEzauRaH+dIO0QEPRRM4alDhUoIDXfgKpDjCuVBEfXugyZhcmAidhfQzO8P9S7hM570e6Znr774Wuiw+rmyieb/4LTLgVm0fp6Kn/JLI6gWODg6wgFFEq/V+C3Ck/2o4V0KmF9PSW50nUnKre+gajGLCNJHyzR1vj9uPpVarQPClV842h0refXRTtoIUdZ50eLUIFN86QcZWHLnLtPY77mzQYZ0OpiCsN0eIhZKZgz5uVLN/0HtNL/EY9MO7i+L4wgNlb1mL9NaQ4pYn35y84YN+shx1zJo6Z28u5XHhldcsR0=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(346002)(136003)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(186003)(316002)(33656002)(2906002)(53546011)(41300700001)(26005)(6506007)(6512007)(6486002)(4326008)(83380400001)(336012)(70586007)(86362001)(70206006)(47076005)(36860700001)(2616005)(478600001)(34020700004)(36756003)(40460700003)(8936002)(82740400003)(6862004)(8676002)(5660300002)(81166007)(40480700001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2023 11:43:36.1866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9416b16-e00b-4b6a-def9-08db4d5df641
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 11:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180914

T24gMjcgQXByIDIwMjMsIGF0IDA4OjM1LCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gDQo+IFRoaXMgd2FzIGRvbmUgaW4gYSBzZWxmdGVzdCwgYnV0IHRoYXQg
aXMgdG9vIGxhdGUgYW5kIGNyZWF0ZXMNCj4gZnJpY3Rpb24gaW4gaW50ZWdyYXRpb24gYXMgZXJy
b3JzIGFyZSBub3Qgc2VlbiB1bnRpbCBhdXRvYnVpbGRlciBmYWlscy4NCj4gDQo+IEJvbnVzIGZp
eDogU1VNTUFSWSBjaGVjayB3YXNuJ3QgZXZlbiB3b3JraW5nLCBhcyBpbiB0aGUgYWJzZW5jZQ0K
PiBvZiBvbmUgc2V0IGluIHRoZSByZWNpcGUgdGhlcmUgaXMgYSBkZWZhdWx0IHZhbHVlIHNldCBm
cm9tIGJpdGJha2UuY29uZi4NCj4gDQo+IEkgbGVmdCBERVNDUklQVElPTiBjaGVjayBvdXQgZm9y
IG5vdywgYXMgbWFueSByZWNpcGVzIGRvbid0IGFjdHVhbGx5DQo+IGhhdmUgaXQsIGFuZCBpdCdz
IHNldCBmcm9tIFNVTU1BUlkgKHBsdXMgYSBkb3QpIGlmIGFic2VudC4NCg0KSeKAmW0gdG9ybiBv
dmVyIHRoaXMgYW5kIHRoZSBtYWludGFpbmVyIGNoZWNrLiAgSSBsaWtlIHRoYXQgdGhlIGNoZWNr
cyBhcmUgYmVpbmcgZG9uZSBlYXJsaWVyIHNvIHRoZXkgZG9u4oCZdCB0cmlwIHVwIGluIG9lLXNl
bGZ0ZXN0LCBidXQgSSBkb27igJl0IGxpa2UgdGhhdCB0aGV54oCZcmUgZXJyb3JzLg0KDQpJZiBJ
IHdhbnQgdG8gYWRkIGEgbmV3IHJlY2lwZSB0byBjb3JlIGFuZCB1c2UgZGV2dG9vbCwgaXQgd2ls
bCBpbW1lZGlhdGVseSBmYWlsIHRvIGJ1aWxkIHdpdGggZXJyb3JzIGR1ZSB0byB0aGUgc3VtbWFy
eSwgaG9tZXBhZ2UsIGFuZCBtYWludGFpbmVyIGZpZWxkcyBiZWluZyBtaXNzaW5nLiAgRm9yIHRo
aXMgcmVhc29uLCBJIGJlbGlldmUgdGhlc2Ugc2hvdWxkIGJlIHdhcm5pbmdzOiB0aGV5IHRlbGwg
eW91IHRoYXQgc29tZXRoaW5nIG5lZWRzIHRvIGJlIGRvbmUsIGJ1dCB5b3UgY2FuIGZvY3VzIGZp
cnN0IG9uIG1ha2luZyBhIHJlY2lwZSB0aGF0ICpjb21waWxlcyogYmVmb3JlIGhhdmluZyB0byB3
cml0ZSBhIG5pY2Ugc3VtbWFyeS4NCg0KUm9zcw==

