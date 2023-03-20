Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0DFEC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 16:20:55 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web10.19100.1679329245762395511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Mar 2023 09:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AG4v0Fwx;
 spf=pass (domain: arm.com, ip: 40.107.20.77, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKh9YBTD2NuCIrXf/m2W4X0svyvtcxjfzUxnNZo7+9o=;
 b=AG4v0FwxpIg0wZAAtE9zyLcd137cKzDagwzkhczgXC+BoR5tx1evG3vGrp4eGzHNNJmF8PV0qbByhAiuKCS0RHOQXpIy4AwE+aPlSC0nmWGBNjuwh6EOa2P4qW22wHhQWUZyR+Q9ElHM8ea/bnTjDPuTki9wnaT/rhLA1rDvgFY=
Received: from DU2PR04CA0072.eurprd04.prod.outlook.com (2603:10a6:10:232::17)
 by AS8PR08MB7339.eurprd08.prod.outlook.com (2603:10a6:20b:446::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:20:42 +0000
Received: from DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::c5) by DU2PR04CA0072.outlook.office365.com
 (2603:10a6:10:232::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 16:20:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT030.mail.protection.outlook.com (100.127.142.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 16:20:41 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Mon, 20 Mar 2023 16:20:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 226823ccb8f698a1
X-CR-MTA-TID: 64aa7808
Received: from 9833632c2218.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2DAB0887-68F4-4902-BB5F-C2AFFFC34620.1;
	Mon, 20 Mar 2023 16:20:35 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9833632c2218.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 16:20:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcOiS0kC7dRLkevpLpnzJu/O4RZTDmdQ2JYBzmQXH2bcQAccx5mYmpip4lFXjxqGhnlET755qG7ezo0+T8b5tLDMPaZQqktmouyn0EuwT97rIN1R1jDEc9P/Mo4VF8zc1zkkmbeRDFbzhKv4N9lTx+LF91M7A3At+MHXhb/d30GckAQsK7/cBnpHENYNp1jo2UZ1PlQH+9MifFgKBBbnmndV8KWsjvUZt/f3Na/EFySeDBKKJtLikNWufZn791psJ+WW7sWETu2Lqv968b2mkypv6qzsxbBZTplMaE2J+4J+cqG4ik0Il5+6dWF93UE/hc619oDhjFRigmkaKE1VGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKh9YBTD2NuCIrXf/m2W4X0svyvtcxjfzUxnNZo7+9o=;
 b=URjWcWuzGs1+BcG+OLZSrd9PPIDZpxo9c2dW2qTVODDd523rOK5r1S6j0uVUdLQ78LHcVbgf6dLGBwWPb//Y8ewnL5GUJ04VEnCLgzDMmD1JtQH+AaKcBhkNwCLjL1VXuOqt/NGdKnmC6h6qFIUQf8yyknLSyClskusRr4UrqvnCdNBCpCtDunf2Oueq+DJJGjVQbJvWpZoU+fkcOLEvH6VZnF1DuX7+IcEIdhOKnl1vkPIFyPzkhmoeFpMYRah20AJve7oQ2QldYP02M4f3zqvP9T2BsMIdc98SbgunArlkAPfW8dyslfPTH+zQH+awTowm+8/wBgwLx+ilFpxNPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKh9YBTD2NuCIrXf/m2W4X0svyvtcxjfzUxnNZo7+9o=;
 b=AG4v0FwxpIg0wZAAtE9zyLcd137cKzDagwzkhczgXC+BoR5tx1evG3vGrp4eGzHNNJmF8PV0qbByhAiuKCS0RHOQXpIy4AwE+aPlSC0nmWGBNjuwh6EOa2P4qW22wHhQWUZyR+Q9ElHM8ea/bnTjDPuTki9wnaT/rhLA1rDvgFY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6006.eurprd08.prod.outlook.com (2603:10a6:20b:29a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:20:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 16:20:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/6] llvm: allow building libllvm in native
 builds, subject to PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH 4/6] llvm: allow building libllvm in native
 builds, subject to PACKAGECONFIG
Thread-Index: AQHZV+uNUB4WLn3YnEWW3LgrQTR+SK8D394A
Date: Mon, 20 Mar 2023 16:20:22 +0000
Message-ID: <347C5B58-FBCF-4A0C-85F7-E8B185506E13@arm.com>
References: <20230316094102.2628727-1-alex@linutronix.de>
 <20230316094102.2628727-4-alex@linutronix.de>
In-Reply-To: <20230316094102.2628727-4-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6006:EE_|DBAEUR03FT030:EE_|AS8PR08MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: 420e2c28-17ba-48f2-919e-08db295f0cfe
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 7MeV824RxhmEI4+L/53S0+aflZhuq5ducixeNx+S8aVZAZafjgrBQde1I6cloOKXf/qQnETBF+VHaBwZAaBYVvvvODqCvRHNz02loWopcQpa+dXSNL37k8j6I2WwUhPnIRHw5iVFitGNALGvvwB+6oawaUdjHV7j38Vo6JpGvNDiicE1YU8wzfXxNUq4Dyqf8VBV4Z5A3U/0vbdLUXFSN9CWccJy0ip+YJwkBUAFDVeLtk7A/sShRx3dHqN8u7Y9rcn81A8H4/cIC2p4mnyg660TDGvm03wqSkv3O7IRDi6Wq/VHxAbCM5LjjT0Pgs9j22XMtNslXZFt0Ne1NXwIfvnBEtfAMPaTO5EH3NmuJpE5Xwobi3L0VWMtGvZmll5OH4iCEGg66TmtkbwuIqdEizo5JimFVKhM07D7yQTDz9Ia9rKD4cvJzI2KbOyvUEx8AYll2Oa+GbShOeMgWFqJoGXkyguOY5JaYdZROG2M7UAVVFTDxgfHEtGwV73OhwKBeuHXlLMz0ak7gPx4GlmI8aiGfsDo+ASqqtIUCu8EeYtuQwWDoOwLcwKucYa+wLR0hGu/XXJ+hxpCSpoFi0+G052p7fmbJtzJKfotUDYFjP+DGPDJNm14lFPwCSe00Shux+3aTbKCS4/ezIjRJYjaIH7S0mal3oJAOZ1Qzsi0iPTfPQQxwFYDQge4UbvHuVpfswdJrJ8yc4+5UKo6mnrYqf+Y+2v6q6VMsBIOIgGwsP8=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(366004)(396003)(346002)(136003)(451199018)(2616005)(38100700002)(38070700005)(86362001)(122000001)(53546011)(8676002)(41300700001)(66946007)(64756008)(2906002)(4326008)(36756003)(66446008)(66556008)(6916009)(66476007)(8936002)(91956017)(4744005)(76116006)(6506007)(6512007)(186003)(5660300002)(478600001)(26005)(33656002)(6486002)(71200400001)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CBB977BD56F67048872513BF9F40D3FD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6006
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2abb5f6b-dbd9-4772-f7ca-08db295f0142
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4VhMAw+KqT8pSjqNWSZFFGaD3tdDnfCGEXUTJDHz535ZMq4Gw8iqNj4eRco00NCS9rQbtBNH42k2ofU6HJw1E3qWaKAaGTRjuI44Zv5H3arCOAr6fW7gTGgEXfi/Qve5C8jZJR+D6SejPwA+hZOrVzB0liHj52yoFiDnyNDdKMuFMrvUAsSKY3eApU3BqB2J04WdV8FzDsJ08hicLyyOL+F3NA9HMqqL02idY90xcKxuSOZ+IHtfVKuL6Rx9ZZAbHnSPfPbpqzySXfPdfH9Up10KyP46NVdYt/FyB2U4sG3sVYkqHE9iLxISJ2sGut7WkBrUWptRQqcQFZGQjW1talMZ8clzCoc5e0+2PM9M0GxThgfy3/MazpET7JHECjUU2HZB//UJv8qIUGYmCWskntHM0WjrpTFi+dpnNrk5PYvyjZXDHzcwYb+NWf7/rUerxgrtgmsm3z3Uiy4MGAugGJYc8+Q2s0ZMwvkc9dh5Js5KZ4rTgtepnynCfS0E0DVMIqOWFSRUBYlsrDHtGMZgzeQKBf4UGN3Vvg4SCKfvGHxy6maSYBqFIjLUKeKZklCndSzWoE4PUqatC8PEZxtXZ0q6xGq5ak49+fuMbkKr6hbIfoHYGskqoyqFta5OwjWW43zy/iPrUVUDPgGOPDx+2zU2M+OP32VBMQr7R3Aqfx6awUwjW87VpQ2geDZbJJIAqOksGVIlgmIq6/FyJY1Enw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(316002)(86362001)(2616005)(336012)(356005)(36860700001)(81166007)(82740400003)(82310400005)(47076005)(40460700003)(478600001)(53546011)(186003)(6486002)(40480700001)(36756003)(26005)(6506007)(6512007)(33656002)(2906002)(8936002)(6862004)(4744005)(41300700001)(70586007)(70206006)(8676002)(4326008)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:20:41.9542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 420e2c28-17ba-48f2-919e-08db295f0cfe
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7339
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Mar 2023 16:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178833

T24gMTYgTWFyIDIwMjMsIGF0IDA5OjQxLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gK1BBQ0tBR0VDT05GSUc6Y2xhc3MtbmF0aXZlID0gIiR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdESVNUUk9fRkVBVFVSRVMnLCAnb3BlbmdsJywgJ2xpYmxsdm0nLCAnJywgZCl9
Ig0KDQpDdXJyZW50bHkgdGhlIGxsdm0gZHJpdmVycyBpbiBNZXNhIGFyZSB0aGUgb25seSBrbm93
biB1c2VyIG9mIGxpYmxsdm0gaW4gb2UtY29yZSwgYnV0IEkgZG9u4oCZdCBsaWtlIG1ha2luZyB0
aGF0IGEgaGFyZCBhc3NlcnRpb24gaW4gdGhlIHJlY2lwZSBhbmQgdGhlIHN1YnNlcXVlbnQgbmF0
aXZlL3RhcmdldCBzcGVjaWZpYyBjaGFuZ2VzIHRvIHRoZSByZWNpcGUuDQoNCldoYXTigJlzIHRo
ZSBidWlsZCBpbXBhY3Qgb24gbGx2bS1uYXRpdmUgb2YgZW5hYmxpbmcvZGlzYWJsaW5nIGxpYmxs
dm0gYW5kIHdoeSBzaG91bGRu4oCZdCB3ZSBqdXN0IGRvIGl0IGFsd2F5cz8NCg0KUm9zcw0KDQo=

