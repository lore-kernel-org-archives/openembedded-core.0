Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256B6C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 16:02:51 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.70])
 by mx.groups.io with SMTP id smtpd.web11.16983.1676908967613481033
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 08:02:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=MYEFM4gB;
 spf=pass (domain: arm.com, ip: 40.107.15.70, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P5s1laU1JJ+mmSrfmhilAFl/AGC3qS0Fb5HNgKzGrk=;
 b=MYEFM4gBfQCS8Vc84C3mQ2QBKWG+ODtnTcwLggJyClzQaoxlg/PiMCSgAI5kxAJVZkuNwsC8XZDGcTSNfEKw+D6HMPtahM9YlU6eh+FgUPLgKPqtJNEXks6rZydrhP4M+JiUksyS8GIusuxPYhkOQ08YdmVsvgoTMd73jcZXOK4=
Received: from AM5PR0601CA0064.eurprd06.prod.outlook.com (2603:10a6:206::29)
 by VE1PR08MB5824.eurprd08.prod.outlook.com (2603:10a6:800:1a8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 16:02:32 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:0:cafe::6b) by AM5PR0601CA0064.outlook.office365.com
 (2603:10a6:206::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.20 via Frontend
 Transport; Mon, 20 Feb 2023 16:02:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.20 via Frontend Transport; Mon, 20 Feb 2023 16:02:32 +0000
Received: ("Tessian outbound 43b0faad5a68:v132"); Mon, 20 Feb 2023 16:02:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5956a3d70e9aa545
X-CR-MTA-TID: 64aa7808
Received: from 9a041553c260.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81908836-8D6E-48DA-8A7D-F692401FB47E.1;
	Mon, 20 Feb 2023 16:02:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9a041553c260.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Feb 2023 16:02:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0NqNlztJXlO9rio3WFDkOldyHNIHBYRlPU5Rb4z00E8mxqKbNMjT6bW7yA9SeKyis8qoYSvj96pEFbAJYMPPzmWdiPdI46weSWr41pqetfLYr5Kl2ij4eeOqelWuN95/9gwmcSAov66wNoAGvHNk5VE546L43kyfWZqdpbj3Q9eu0yDpoZgm8/XJ606/IFNPnIeHkLpJOlL+K4CVXYUB9w0Se5S0eSiRX4xS/El/fKVQ2nM8DPCV7BUqjJZ8kT0XugrBhVQuBiAADbVP+28fKlHj8c53rQIxx7IjZdJxzgep6/8zwR91ipxq/1+KcbuXkAEKJS8WzsZdr0XbNi9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2P5s1laU1JJ+mmSrfmhilAFl/AGC3qS0Fb5HNgKzGrk=;
 b=NCuy3jFsj3OlCok8/6hGNOkR/j+VE3Un5txL/EdoCKKw/O6Xc2DMM0cUS4RIXN8oDck5lwFhRqq5Nf6cc51JbPSdUI1DGBcRAfM/yz40Mxg3Y1Y1iE2MSPTaUlTWVvpA7GPpS5X3vp733tJaAclFJaZ3rezoqUSmYz/x7Gw7UK4LB6Kd2UAcySa93eGGZIhg2OYCS6DT4NKhQrXIR/qzODGzoo9Xmy4tzRD/imD5nBrIARijBf3iuztWK1yYODIa97JoCbHlqt4Tjle+ezWLjnkswA7UeSM86SHI/vQejK8yOaJZ9kG24AMnO11eFACTnJCsUZM5fmr2jM29XY0a/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2P5s1laU1JJ+mmSrfmhilAFl/AGC3qS0Fb5HNgKzGrk=;
 b=MYEFM4gBfQCS8Vc84C3mQ2QBKWG+ODtnTcwLggJyClzQaoxlg/PiMCSgAI5kxAJVZkuNwsC8XZDGcTSNfEKw+D6HMPtahM9YlU6eh+FgUPLgKPqtJNEXks6rZydrhP4M+JiUksyS8GIusuxPYhkOQ08YdmVsvgoTMd73jcZXOK4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10137.eurprd08.prod.outlook.com (2603:10a6:10:4a8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.18; Mon, 20 Feb
 2023 16:02:21 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 16:02:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>, Alexander
 Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 31/39] harfbuzz: upgrade 6.0.0 -> 7.0.0
Thread-Topic: [OE-core] [PATCH 31/39] harfbuzz: upgrade 6.0.0 -> 7.0.0
Thread-Index: AQHZRJlBVNpRQi/EMUKYVKBxhUu+va7YAC0A
Date: Mon, 20 Feb 2023 16:02:20 +0000
Message-ID: <0A05E655-C979-4820-B2D4-011C03A3CD5B@arm.com>
References: <20230219193101.338397-1-alex@linutronix.de>
 <20230219193101.338397-31-alex@linutronix.de>
In-Reply-To: <20230219193101.338397-31-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10137:EE_|AM7EUR03FT034:EE_|VE1PR08MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a9b5c0c-f399-49e1-8956-08db135bdfec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 gIhNwx4rAuBQXuqLH84LzbZMe8YLV3YBnqW+A2ISTlRXtHhEPHOeQEqTzC1AMsmrt7lyrnIUkkeSmAkyQ8/TMKM59JiazTCZNjFUBxqkNZx4cKiuld7mbYKySw8Gqmm+eojxxMuhz1EjtP9ri5Bb0wWx9wvZZKmfsEkVvXcsfd9iEPG8qWxVnMZJlsE8I9/8IGa3iFckjCVWfGJnQmJ3vRUa9A/5NphDIDpmmHBsTLEhSBTgYityioiiqn+fo5JmLhqYcoOfVBq3PiJ1g4l6qV/eBNOCPpXGs5u9iXqztdx5Mpq5/PrNWzbBwqjxY8aNCXqEIrOx/BOwDSOskVXNMD0smWLbEKcCmlRmBPOx0YPwtqTBwiEadGf2Vk4uleglFJ12w14xkpM4G2UciX8rm80RSElttG90zRYGI9KenKQRPZ8SuYsPjlVNUF5ANPAuP604BOJ7DBckWfnyLiiXh/U4ZAZjtcs7pSXXm/qhdYh5KghbDujAmJ3VMMWmHotDmr7VDKBpzb60s6j78khEwLrQaoYn3Z0RZrAaiDvTbqFX/O9E1SPX/aogQ+avOgK9zfXKbW74IrinBVoeA6zNG/heGjqEvXG+qOVjDWPLC8ZKIzQwnpWvRHh6wCMIQLRn1STEfzjd+iBp+zm/zDr3oJKgTZqTK2+NCbe1r1gei5meeOnDAoP3roTpYgHojZO3cUwMsGJe8eFeP4ZS8bBjXb5QqLJ3Srz34TQzCaCqIz4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199018)(36756003)(66899018)(6506007)(6512007)(478600001)(6916009)(2616005)(66476007)(53546011)(6486002)(186003)(26005)(8676002)(41300700001)(54906003)(316002)(66446008)(66946007)(64756008)(66556008)(91956017)(966005)(71200400001)(76116006)(122000001)(2906002)(38100700002)(5660300002)(38070700005)(33656002)(86362001)(8936002)(4326008)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB8BBE1074A5AE44949D0D0E51081CDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10137
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bbad4888-6b8f-415c-aed0-08db135bd91e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BpviRfqzGD4ULlsLeTDGrhEsALVTikt5DXYisKJg5cbMef1casdlvB77+oRgSiN9t/k7Uq10qhIKCZVlfwiB0F9TqKXuiwkyelkFIQ9fF1f5X1Csp+J244Agk35JPebfuoA7FV0nbhZsA1FK06aClffh9w+4lCQrKLxMMpFYJp6tUtl2Z0xWVhwyw0SMgd01bid9xqyksaYreAneGi93hTlyBFJFCYo5pHyObGH5d0AJzoj9uthfWgUVFzM6pbndEuXfcXuCK8xi0oU0aqLdvzsq5+zygBSIKAQMSjRmuGNiON0Rmh9saTGUKej78ui8x7G7DY9ruDSpoubGllHpFrf2OpQxkGLrSoCJxDX5OZwExrH//ES7DjbLVZwfw2I/y55n5YcSb93htboKx07rZjp8v1Il9ZCOSet4ChbCcs6k8aFJzGPy6ZyjAxCV0/BquD8UE+n6rOD22oxZ7FxHFW3HoJoWSYueOcF13DWJUa+cw/iiPvJ/+kM2oI/Pj2NZPWGWTLZ5ab0leWqkl5uNWumm1YAp17ymwCjHaMtbPwC1iX0CFDcXhxiUnI11gkq++ECoXe6oyYXvxVMY+YqhGPDVUZVbT/MohR/EXL8lQ6xAAl2PP5P8thpaUlKY2PZ/GStobJUYybBSV38HdQFZQhtagAHquQOcjNdcgTS7ZoUGPR0tzc4w+A+aMC6Pt+SC
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199018)(40470700004)(36840700001)(46966006)(186003)(26005)(53546011)(966005)(4326008)(40480700001)(8676002)(6862004)(70586007)(83380400001)(66899018)(2616005)(6486002)(8936002)(70206006)(107886003)(6512007)(6506007)(5660300002)(36756003)(336012)(54906003)(47076005)(40460700003)(478600001)(356005)(41300700001)(316002)(82740400003)(86362001)(81166007)(82310400005)(36860700001)(2906002)(33656002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 16:02:32.2048
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9b5c0c-f399-49e1-8956-08db135bdfec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 16:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177430

RllJIHRoZXJl4oCZcyBhIDcuMC4xIG5vdyB0b28uDQoNClJvc3MNCg0KPiBPbiAxOSBGZWIgMjAy
MywgYXQgMTk6MzAsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFycw0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4NCj4gLS0tDQo+IC4uLnN1
YnNldC10aHJlYWRzLmNjLWFkZC1taXNzaW5nLWNzdGRpby5wYXRjaCB8IDM0IC0tLS0tLS0tLS0t
LS0tLS0tLS0NCj4gLi4uL3toYXJmYnV6el82LjAuMC5iYiA9PiBoYXJmYnV6el83LjAuMC5iYn0g
IHwgIDcgKystLQ0KPiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRp
b25zKC0pDQo+IGRlbGV0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1
enovaGFyZmJ1enovMDAwMS10ZXN0LXRocmVhZHMtaGItc3Vic2V0LXRocmVhZHMuY2MtYWRkLW1p
c3NpbmctY3N0ZGlvLnBhdGNoDQo+IHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1
enove2hhcmZidXp6XzYuMC4wLmJiID0+IGhhcmZidXp6XzcuMC4wLmJifSAoODclKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6ei8wMDAx
LXRlc3QtdGhyZWFkcy1oYi1zdWJzZXQtdGhyZWFkcy5jYy1hZGQtbWlzc2luZy1jc3RkaW8ucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enovMDAwMS10ZXN0LXRo
cmVhZHMtaGItc3Vic2V0LXRocmVhZHMuY2MtYWRkLW1pc3NpbmctY3N0ZGlvLnBhdGNoDQo+IGRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAxMzgxOWY1Y2Y4Li4wMDAwMDAwMDAwDQo+
IC0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6ei8wMDAxLXRlc3Qt
dGhyZWFkcy1oYi1zdWJzZXQtdGhyZWFkcy5jYy1hZGQtbWlzc2luZy1jc3RkaW8ucGF0Y2gNCj4g
KysrIC9kZXYvbnVsbA0KPiBAQCAtMSwzNCArMCwwIEBADQo+IC1Gcm9tIDdkZmE2NzJkYWM5NThi
ZGJjNzcwM2FiMDkyMGUxNjdlYWExMjY3NTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQo+IC1G
cm9tOiBTZXJnZWkgVHJvZmltb3ZpY2ggPHNseWljaEBnbWFpbC5jb20+DQo+IC1EYXRlOiBNb24s
IDE2IEphbiAyMDIzIDE5OjQ5OjUzICswMDAwDQo+IC1TdWJqZWN0OiBbUEFUQ0hdIHRlc3QvdGhy
ZWFkcy9oYi1zdWJzZXQtdGhyZWFkcy5jYzogYWRkIG1pc3NpbmcgPGNzdGRpbz4gaW5jbHVkZQ0K
PiAtDQo+IC1UaGlzIHdlZWsncyBgZ2NjLTEzYCBzbmFwc2hvdCBjbGVhbmVkIGZ1cnRoZXIgdXAg
aXQncyBzdGFuZGFyZCBoZWFkZXJzDQo+IC1hbmQgZXhwb3NlZCBtaXNzaW5nIGRlY2xhcmF0aW9u
IGFzIGEgYnVpbGQgZmFpbHVyZToNCj4gLQ0KPiAtICAgIC4uL3Rlc3QvdGhyZWFkcy9oYi1zdWJz
ZXQtdGhyZWFkcy5jYzogSW4gZnVuY3Rpb24gJ3ZvaWQgdGVzdF9vcGVyYXRpb24ob3BlcmF0aW9u
X3QsIGNvbnN0IGNoYXIqLCBjb25zdCB0ZXN0X2lucHV0X3QmKSc6DQo+IC0gICAgLi4vdGVzdC90
aHJlYWRzL2hiLXN1YnNldC10aHJlYWRzLmNjOjEyNzozOiBlcnJvcjogJ3ByaW50Zicgd2FzIG5v
dCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlDQo+IC0NCj4gLSAgICAuLi90ZXN0L3RocmVhZHMvaGIt
c3Vic2V0LXRocmVhZHMuY2M6IEluIGZ1bmN0aW9uICdpbnQgbWFpbihpbnQsIGNoYXIqKiknOg0K
PiAtICAgIC4uL3Rlc3QvdGhyZWFkcy9oYi1zdWJzZXQtdGhyZWFkcy5jYzoxNTc6MTk6IGVycm9y
OiAnYXRvaScgd2FzIG5vdCBkZWNsYXJlZCBpbiB0aGlzIHNjb3BlDQo+IC0NCj4gLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vZ2l0aHViLmNvbS9oYXJmYnV6ei9oYXJmYnV6ei9j
b21taXQvN2RmYTY3MmRhYzk1OGJkYmM3NzAzYWIwOTIwZTE2N2VhYTEyNjc1NF0NCj4gLVNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IC0tLS0NCj4gLSB0ZXN0
L3RocmVhZHMvaGItc3Vic2V0LXRocmVhZHMuY2MgfCAyICsrDQo+IC0gMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKQ0KPiAtDQo+IC1kaWZmIC0tZ2l0IGEvdGVzdC90aHJlYWRzL2hiLXN1
YnNldC10aHJlYWRzLmNjIGIvdGVzdC90aHJlYWRzL2hiLXN1YnNldC10aHJlYWRzLmNjDQo+IC1p
bmRleCA5ZDg2ZDhkNTEuLmYwZTRiN2UyYSAxMDA2NDQNCj4gLS0tLSBhL3Rlc3QvdGhyZWFkcy9o
Yi1zdWJzZXQtdGhyZWFkcy5jYw0KPiAtKysrIGIvdGVzdC90aHJlYWRzL2hiLXN1YnNldC10aHJl
YWRzLmNjDQo+IC1AQCAtMSw0ICsxLDYgQEANCj4gLSAjaW5jbHVkZSA8Y2Fzc2VydD4NCj4gLSsj
aW5jbHVkZSA8Y3N0ZGlvPg0KPiAtKyNpbmNsdWRlIDxjc3RkbGliPg0KPiAtICNpbmNsdWRlIDxj
c3RyaW5nPg0KPiAtICNpbmNsdWRlIDx0aHJlYWQ+DQo+IC0gI2luY2x1ZGUgPGNvbmRpdGlvbl92
YXJpYWJsZT4NCj4gLS0tIA0KPiAtMi4zOS4xDQo+IC0NCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el82LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1n
cmFwaGljcy9oYXJmYnV6ei9oYXJmYnV6el83LjAuMC5iYg0KPiBzaW1pbGFyaXR5IGluZGV4IDg3
JQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpf
Ni4wLjAuYmINCj4gcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9oYXJmYnV6ei9oYXJm
YnV6el83LjAuMC5iYg0KPiBpbmRleCAxZmNlMTI3ZDA3Li5hODVjNGNhMWNlIDEwMDY0NA0KPiAt
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvaGFyZmJ1enovaGFyZmJ1enpfNi4wLjAuYmINCj4g
KysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2hhcmZidXp6L2hhcmZidXp6XzcuMC4wLmJiDQo+
IEBAIC00LDEzICs0LDEyIEBAIEhPTUVQQUdFID0gImh0dHA6Ly93d3cuZnJlZWRlc2t0b3Aub3Jn
L3dpa2kvU29mdHdhcmUvSGFyZkJ1enoiDQo+IEJVR1RSQUNLRVIgPSAiaHR0cHM6Ly9idWdzLmZy
ZWVkZXNrdG9wLm9yZy9lbnRlcl9idWcuY2dpP3Byb2R1Y3Q9SGFyZkJ1enoiDQo+IFNFQ1RJT04g
PSAibGlicyINCj4gTElDRU5TRSA9ICJNSVQiDQo+IC1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT02ZWUwZjE2MjgxNjk0ZmI2YWE2ODljY2ExZTBmYjNkYSBcDQo+ICtMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iOTg0MjliOGU4ZTNjMmE2N2NmZWYw
MWU5OWU0ODkzZCBcDQo+ICAgICAgICAgICAgICAgICAgICAgZmlsZTovL3NyYy9oYi11Y2QuY2M7
YmVnaW5saW5lPTE7ZW5kbGluZT0xNTttZDU9MjlkNGRjYjY0MTA0MjkxOTVkZjY3ZWZlMzM4MmQ4
YmMgXA0KPiAgICAgICAgICAgICAgICAgICAgICINCj4gDQo+IC1TUkNfVVJJID0gIiR7R0lUSFVC
X0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IFwNCj4gLSAgICAg
ICAgICAgZmlsZTovLzAwMDEtdGVzdC10aHJlYWRzLWhiLXN1YnNldC10aHJlYWRzLmNjLWFkZC1t
aXNzaW5nLWNzdGRpby5wYXRjaCINCj4gLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIxZDEwMTBhMTc1
MWQwNzZkNTI5MWU0MzNjMTM4NTAyYTc5NGQ2NzlhNzQ5OGQxMjY4ZWUyMWUyZDRhMTQwZWI0Ig0K
PiArU1JDX1VSSSA9ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7
UFZ9LnRhci54eiINCj4gK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI3YjQ2ODViNzA2NmM1YzZiOGRj
NmNkN2IwMmY2M2M1NTRmYjhjYzFjNGRkY2ZjNDRiYzI4NGVmYTNjMjBjZjI4Ig0KPiANCj4gaW5o
ZXJpdCBtZXNvbiBwa2djb25maWcgbGliX3BhY2thZ2UgZ3RrLWRvYyBnb2JqZWN0LWludHJvc3Bl
Y3Rpb24gZ2l0aHViLXJlbGVhc2VzDQo+IA0KPiAtLSANCj4gMi4zMC4yDQo+IA0KPiANCj4gLT0t
PS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBz
ZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTc3Mzc0KTogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzcz
NzQNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQv
OTcwNzIxNjgvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5j
b21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

