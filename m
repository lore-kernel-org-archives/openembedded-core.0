Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41A14C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 10:37:37 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.72])
 by mx.groups.io with SMTP id smtpd.web11.19142.1702550255749897394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 02:37:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PkgXjDrG;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=PkgXjDrG;
 spf=pass (domain: arm.com, ip: 40.107.8.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=OBQzTE4UX5Bgd0VltswRTykABFTcKIufhHzH7EmU3b9mJ8IUkYhkuRvBXhjh7W4xnsNcLVXGfLCLrNWv/klsPgS62D+4moSzs1i9mgwqSmdRlY73BFUkez7pMmTkdgRg21Gpbi93NGrSdThacIESO71B/TB2navIYJnrqWsfp62jBVxCCl0SFUt957kC5SM8flgnW4NPaWvTcJeMvX3BqazonuZH9RQTx1YnFu0BtbBqzZ5mobQfrVkP3o+EiiRvLadkf+Pme8vcR6ho50qOg3Inf9YVrjjDc9TDkg/qD7qS7F5wZrOUhJ57Vu8gNu+SSrMfz9Gq+NJOIqP+s+v3OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqF6cbwAkRo0f8ZeKlq27bBOY1FrmZIl34VfetAejHg=;
 b=LwjIJpVk8/E1+noXO0dP8VnvjTUO637tpL2A5jM6abXzpr6yKd3w/rWks2xLUIf81OIiCsqhfsJl+N1Pp/2RwPBHYjU1Zgej/ofRKSZgVcRyPVdA30IY7o1B3zjHSwQ1eEKiKrGU7sf5sPKyI1ZJTyyRypXNAp6ZVPvxLLfc6tRl6UYhw7FUHRErj+HXMcpdpQZFPIRele/QZC7rUitza/p1CkcmsfUz8Aa0HkTt97DBEFcF/JA5as4osnjUD+h8AcLgvGH/81J7fIvqZ4dccbsAmXog2dlioaq+nl8pmXsTyLVeHv1VyGvqE/Q1zmctCL/y8oL3RpEV+1PCfj+N5g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqF6cbwAkRo0f8ZeKlq27bBOY1FrmZIl34VfetAejHg=;
 b=PkgXjDrGrrhLIUdntUI0tppE2/XOK9vZg3cg05ga5tFZnQlp71/0Ro/RjBBa8q7BC10b+A3VfKCKfNAOBEYIpEU5Jf7WS0942QXKz+CZYkQl0s4eBmN2xqLSlfmTz0fCNIscvJ3aQb54dowfAy7oWILqBBxBB+UUI6pHONNuk+o=
Received: from AM6PR10CA0044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:80::21)
 by AS1PR08MB7564.eurprd08.prod.outlook.com (2603:10a6:20b:473::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 10:37:31 +0000
Received: from AMS1EPF00000042.eurprd04.prod.outlook.com
 (2603:10a6:209:80:cafe::4c) by AM6PR10CA0044.outlook.office365.com
 (2603:10a6:209:80::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28 via Frontend
 Transport; Thu, 14 Dec 2023 10:37:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF00000042.mail.protection.outlook.com (10.167.16.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Thu, 14 Dec 2023 10:37:31 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Thu, 14 Dec 2023 10:37:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d839cb5aa0271e7
X-CR-MTA-TID: 64aa7808
Received: from 1fe6a9861389.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0E26ED58-1B06-40F1-86CA-3273E772488F.1;
	Thu, 14 Dec 2023 10:37:24 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1fe6a9861389.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 14 Dec 2023 10:37:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ji+JaXQ34e8fPq5xgqvAptc2EC50VjxNT6cvfykN3DRD4YFlaI4mAzQbNTN+1ul7PEFM/Cy62ZDCYQQjre0ain+HG/ypY+wdfxDZNoRonPLizlA8Czb7gQs/VPV/FWxu6EQIdCJPlPnJzL3xOpVRPKb1hSpw5lNHmq+s6LU3lz4hJSNB2QaucmsR2I0cenx2Jgw+972DJSsdxz97cAJN3uqmgVWANdI2aFS8qZyRjm40uYyoRaROp9wmWUlxEY7j7rP8uuJ0kwv+XRuxEtJjS07yVkclB7YYhh74uC1gDwemRz9ERXFo1oxc08noJUz5zTm7Pz2bLvlWNjFMt+6hdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqF6cbwAkRo0f8ZeKlq27bBOY1FrmZIl34VfetAejHg=;
 b=ev3oU/HCPEF11GFcYVWvtBnobU3ZwVMnv885lIUsdAuwIABU8J3yFHkBRnCaWy3awlzMhR7g5XNsX+XAUR9ot2FV9Gc/Z07KKx9o6NXsctkSbJuvPhYmTYeWnP1qG/0rlPF3fNipTcCEiaoNdM5BAbgYXOWNsUrc64ke3Sk23Dgjn8qpBQzEX+HsOo9WViGOjBGkyxldWcexmbkddbk/stXFjtc/nqaSnsVQ1wqoi3uwdwMMzV/XFGWEMju8UBrbxRPPcFo0g+ZDF6i02MtnYwjFFJGBBSADQnnJ2qeEh8HEAZaQt96k9S6QgiQM1WUcLb/O+8S68QZacdmWl5Do5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqF6cbwAkRo0f8ZeKlq27bBOY1FrmZIl34VfetAejHg=;
 b=PkgXjDrGrrhLIUdntUI0tppE2/XOK9vZg3cg05ga5tFZnQlp71/0Ro/RjBBa8q7BC10b+A3VfKCKfNAOBEYIpEU5Jf7WS0942QXKz+CZYkQl0s4eBmN2xqLSlfmTz0fCNIscvJ3aQb54dowfAy7oWILqBBxBB+UUI6pHONNuk+o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB5951.eurprd08.prod.outlook.com (2603:10a6:102:ee::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Thu, 14 Dec
 2023 10:37:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 10:37:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: =?utf-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
	<pidge@baylibre.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv2 4/4] login.py: Proof of concept for screenshot
 testcases
Thread-Topic: [OE-core] [PATCHv2 4/4] login.py: Proof of concept for
 screenshot testcases
Thread-Index: AQHaLgM6lZPzT5/R9kGIyoosSdKWA7CnsXmAgADlfYA=
Date: Thu, 14 Dec 2023 10:37:22 +0000
Message-ID: <D011D08D-DC89-4A71-BA4C-B25570413C81@arm.com>
References: <cover.1702499299.git.pidge@baylibre.com>
 <e43f9d74edb8a9504075964ac9a277dc031560cb.1702499299.git.pidge@baylibre.com>
 <dc83ff18c96bd6bd5326e07139043699b0fb099e.camel@linuxfoundation.org>
In-Reply-To: 
 <dc83ff18c96bd6bd5326e07139043699b0fb099e.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB5951:EE_|AMS1EPF00000042:EE_|AS1PR08MB7564:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d081194-b292-44fe-cc6b-08dbfc90ad29
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 037caUSod5CiWq72O6NIOs7jgPqj7QAZq4JWWcFhEbuWKHnkGGAmi6l0DESCzCDdRGeVaDAJYgfnSQ8+/yjUC7Y3Apqj+QKoIIRDTLMtu6gneA+KE4qt7/6drIVAX0Y2Ufg446oP82iWfQaiAQlPRrW4rYflVSMJ8VYb2feydYgmxJHq862trPZLFn86SQsCMHMMgt8fYWURJUVQIZYLlzuMdIjEMuwsm6wx2Ba5P2e0qogM4aJwoAuQJIyr+ngUg6P0MacgDW29c1XcGswG0lQP0IxOEv7YxOzfjIHMPC7TaxGQpOz9j7/KKMlxvpMulnyXg1lJGeERkkGM1MX1r099OuG7bRUp2aWAV2gvRhljUqLBqM7g2tsILPzvasj3JRcerL1SlEeswHdWwMr4nxjgi0Abi8JPWFGks7rn0mw0pYMnySHYVQHuM8+MBt1hmZah4osurXHON7HyetaQH2UWbxkcFYVGnXiThzWTQrZYNuUu8DEUxMSjSiGrfX4eTjCzeI86tqII+LLd9BJGDAd3We16vSV/yDjS42BvntEfaV+apVSkSf5zYqKn85ipepck2pSKsBe6jvBVP0bnN6igBm4NsC3O5bWhQHUHX1s9XnKRTiXBbfRKwMJCxGBxqM1M6scZBXaryhXfP5UlWlKrdwoPZ/vrjaWd4bR35VoUR9HG8QJDy+YCj5d9c0X5ezAONznSSaOSbRJlnTUCXVmSSRNExbJkIQrXzyPhf64=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(122000001)(26005)(41300700001)(38100700002)(71200400001)(4744005)(8936002)(316002)(6916009)(54906003)(64756008)(8676002)(5660300002)(2906002)(4326008)(66556008)(66446008)(478600001)(66476007)(66946007)(76116006)(2616005)(6486002)(91956017)(6512007)(53546011)(6506007)(86362001)(38070700009)(36756003)(33656002)(206463001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3EAE2E3E5F41364FA9918BA97438CDF5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5951
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee4118ae-9055-4eda-155b-08dbfc90a7a4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+GulumdjyHlLHfAx5YXIQJVQOuc4kqVvEUlc/XoyjO7QYyctAjbeTZg7+vDxAxDZpy9bVIWRDzhWLXHhEpQhHNgEVc2lR4rYay1kXN5IUtYIho9bK0H3JUTN6eB3VECweUJ9EITnwlGljfUp+bDgQqLVtaIB7vuOsfChvx6ys4MuES9Cf9m1t6lNEkMd+UsR0EKTr7dnUz8k306R8EBGPqfRdxCq2v0GF+4tTtqkKH64cdFcgnyl10ibKbIfWW3vKo4PS7QfRrIW3stG3wH2ST/EPOVZftODGhyAHOfRuk+FeMC7eXQPr9KdPI6xMygBvPzvb5xJSdFTxBt0u5QkTll2epNGTYXuqYlKtHQkXTCGxa3z0ifj4u8vI+cJ/GsvgGaX/N1WCaDye2j3n0nNiZtg/2An51QkWJd1tkXG7BVQJchyHiqP/TfXedQaRvNDr3EBDPG3SbqKuIsx7pMd24sdJdoXecjptwcDrvd9S3dvyYMTIw7TXqZmBS+oH7qA/Zp7U/DpyHW+IoyqweXb3ogE8wGz4O8QzWN29Mk8Hp7Zgp6UNkWu0mbyyxXjJeNlSJF+iVfXKx6z4xY5vB2tfeiw+h/ArHxdR7qiTqTk9HtxkNVzv2OTqP95u2DaojBk7qW/XwSdJeVtLxSJyW3FVUHY71v2urCP+yVhBy4K9bwAexm63AySHqFdjb1VPVrN3cSa7tYBCKAGsXZnsvAjFGJkKdH9gw2NttKKxj0LiTEVpobOA5t6P1JcgUZ8zGI9FJF45ZnIe2fpObYDnub3EBJN1W1HgDIHvznzN/VdgQy/vXUaJ1wJHQcZZKQmjpGl
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(1800799012)(64100799003)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(478600001)(6512007)(36860700001)(36756003)(6486002)(54906003)(70586007)(70206006)(82740400003)(47076005)(356005)(81166007)(336012)(26005)(40480700001)(2616005)(53546011)(6506007)(316002)(6862004)(40460700003)(4326008)(86362001)(8936002)(8676002)(2906002)(4744005)(33656002)(41300700001)(5660300002)(206463001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 10:37:31.3120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d081194-b292-44fe-cc6b-08dbfc90ad29
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000042.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7564
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:37:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192349

T24gMTMgRGVjIDIwMjMsIGF0IDIwOjU1LCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0KPj4gKyAgICBAT0VIYXNQYWNrYWdlKFsn
cHl0aG9uMy1xZW11LXFtcCddKQ0KPiANCj4gVGhpcyBvbmx5IHdvcmtzIGlmIHdlIGhhdmUgcHl0
aG9uMy1xZW11LXFtcCBpbiB0aGUgdGFyZ2V0PyBJIHRob3VnaHQNCj4gdGhlIG1vbml0b3Igd2Fz
IGV4dGVybmFsPw0KDQpZZWFoLCB0aGF04oCZcyBub3QgbmVlZGVkLiAgVGhhdCByZWNpcGUgd2Fz
IGluIG15IHByb3RvdHlwZSBicmFuY2ggYnV0IGl0IGlzbuKAmXQgcmVxdWlyZWQgd2hlbiB1c2lu
ZyBydW5fbW9uaXRvcigpIGFzIHRoYXQgaGFuZGxlcyB0aGUgUU1QIGl0c2VsZi4gIFRoZSByZWNp
cGUgY2FuIGJlIHJlbW92ZWQgKG9yIGFkZGVkIHRvIG1ldGEtcHl0aG9uLCBhcyBpdCBpcyBzdGls
bCB1c2VmdWwgdG8gaGF2ZSkuDQoNClJvc3M=

