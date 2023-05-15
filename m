Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9599C77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 13:58:32 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.65])
 by mx.groups.io with SMTP id smtpd.web10.89338.1684159109257186853
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 06:58:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=tcETygnA;
 spf=pass (domain: arm.com, ip: 40.107.249.65, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZ3Hq1HbdZRreyq3pheuEnswFQjV0fBtxkBSGQlyGlc=;
 b=tcETygnA2EqHF3zy+P+nzrJmG6YVLEz6mbIyizdYIZqMZ8XatSsA9ygeioV/PMRHlGhu1bxWqEShoyg0lY2APrOsDY7AOaf+5tdsmeRzrmNOk2N2U1E6lbufOPfQ+8p1a4PgQBMIPXdUFvA3oA0j5qzEE5oxvZ5L0bFYEVb2K/M=
Received: from DB6PR0402CA0016.eurprd04.prod.outlook.com (2603:10a6:4:91::26)
 by AS8PR08MB9289.eurprd08.prod.outlook.com (2603:10a6:20b:5a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:58:26 +0000
Received: from DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:91:cafe::a1) by DB6PR0402CA0016.outlook.office365.com
 (2603:10a6:4:91::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 13:58:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT008.mail.protection.outlook.com (100.127.142.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 13:58:25 +0000
Received: ("Tessian outbound e13c2446394c:v136"); Mon, 15 May 2023 13:58:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7bf1ce7f899cefe6
X-CR-MTA-TID: 64aa7808
Received: from bb2d85cdf592.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5C5B1C94-9529-45FE-99F0-FB9D6043E997.1;
	Mon, 15 May 2023 13:58:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb2d85cdf592.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 May 2023 13:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PJfrMV1w8KMCAs+Q8+pKSfwDDArLDsDHXeCy5a5M2GC8tA5TR+zAgmdlsC7z8DZrlmmPBoBiZ/7jZZn6Ppqw70vX1y2Sww7T+UcXDzko0efCUQrYu9wmyI03KFRW6IjxUFRkphiwcM9O1sSxaZNpdkAGOdINxOJrAAdKAm8pOaoIlUFNG0vYfsgq7erdWt1hDymfhRQ3ZVK8lf34KVwuG4rTbt3pJTDGLVHAjmWfYKkws33WNwwOTnmmOA3m99jNlUW8Jvht0STdkH0vwwqQwWz/ERZE+DjFZ2QCc4wpn/Ck1fcp+8aqUpr+ZjhVEpTJkgiRcOZd45cwHGd4wB9/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZ3Hq1HbdZRreyq3pheuEnswFQjV0fBtxkBSGQlyGlc=;
 b=Mk1asp3MaveUyNE60EgmnewYw4j9tQuFXXxelIVWTQhOn2z7P02cpfTo+/DmMigRWd5FRvkCaa4UdqTSFNX9iYPtynxDZlInnp48ktDrx9XxGYzQwtpwFoTzqVFH88tOjtEtpGdYs41QDgPsMsRndLLh3waUxve9MO/nLgq9AFS527edWMCSrJQRrHx45upyx3YwawrAGhPj7ogoDdFgnHd9rgtn1N7kYZlFqokArqSK/LzifAcx0UT9T6Y9gfCWPH0kMD+GBIbTxV7etyBpe4ztFzFXcLHH3hre4CONp6y1M+LMgmo0Ksu8+/x0e18lYiCQWguagMcG5fW8JEOc5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZ3Hq1HbdZRreyq3pheuEnswFQjV0fBtxkBSGQlyGlc=;
 b=tcETygnA2EqHF3zy+P+nzrJmG6YVLEz6mbIyizdYIZqMZ8XatSsA9ygeioV/PMRHlGhu1bxWqEShoyg0lY2APrOsDY7AOaf+5tdsmeRzrmNOk2N2U1E6lbufOPfQ+8p1a4PgQBMIPXdUFvA3oA0j5qzEE5oxvZ5L0bFYEVb2K/M=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7716.eurprd08.prod.outlook.com (2603:10a6:10:3bc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 13:58:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 13:58:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Martin.Jansa@gmail.com" <Martin.Jansa@gmail.com>
CC: =?utf-8?B?UGV0ciBLdWJpesWIw6Fr?= <kubiznak@2n.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v5 1/6] gobject-introspection: reduce
 dependencies
Thread-Topic: [OE-core][PATCH v5 1/6] gobject-introspection: reduce
 dependencies
Thread-Index: AQHZZhyefQw3lqmni0emnNBPqDOpWa9bd9qAgAAmeAA=
Date: Mon, 15 May 2023 13:58:17 +0000
Message-ID: <5A51BE7C-AB58-448D-93F2-0AE5EE4C9AA1@arm.com>
References: <20230403110646.2555294-1-kubiznak@2n.com>
 <CA+chaQf7GPW=GZ4yYG+BjbBOYST2O7R7xwQSstRdC=chzaWU0A@mail.gmail.com>
In-Reply-To: 
 <CA+chaQf7GPW=GZ4yYG+BjbBOYST2O7R7xwQSstRdC=chzaWU0A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7716:EE_|DBAEUR03FT008:EE_|AS8PR08MB9289:EE_
X-MS-Office365-Filtering-Correlation-Id: fdf93c06-0b8c-4369-ad2d-08db554c7449
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +iBjv6/rhdd04iKGmuqeyFbf3M/Ei8MU1YWBYV1rAK2pV/l69knRkLEfja6ywLXtu23pQqvGSl5E7M+rYUf0iWk06idbSIoKziP82bmGZRByWSoe4VOQ1Cs/1ukr4IafcnHPQAM9jfc97XGbATiSd3pzWlewYLoMB3zy04ikUQMO7hfSJ8wDqwZMTj8p5PXPCD54Zty0Cbf3kfrSJF9EST/EhMPOooDVWNrt4ubqZEnYsMxW9vdzMObOjvWkjVZcRYxvj8FZjvB6Hxw54Ssydbt1FeLuMCHNItrW1IYgOUUQmQghYv4GUVMvOM+l3+Nnmhc3HRB9kmvUKTqVhuMpWDBD6A9ga419IS769glK2151AM+jgjQLg6LCUGShxs4OeOPx1STFW0vzy2LXdnE0/h8spoz+Ydm6arfZT/G2stX1o/zgW6EIquwl9RbLsmJ8Tr+MEwtLt3xHDF+9pCDDQSe69BPFvDZYDysOtyTrjNzbY5ccUxPt1LcDIvEq2C13MFMkwjOiQcmWAlYDWEs7H7w93se4K2/FmA8xa9hZAx0dVylGE/qVXXwvz0U9CGkWJ1+0LouQijByTl1y4+dOexpw6e9RpQ6iLIGbv5wD7Rn/ZZnn1H+Cm4Pj0ksOVKQGn0dtPqPYgf71b79+7DRVMw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(64756008)(66446008)(6916009)(4326008)(8936002)(71200400001)(8676002)(66476007)(66556008)(316002)(76116006)(41300700001)(478600001)(66946007)(122000001)(54906003)(38100700002)(91956017)(186003)(36756003)(2616005)(53546011)(38070700005)(6506007)(2906002)(26005)(83380400001)(33656002)(6512007)(86362001)(966005)(5660300002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <18894B23F84398498D9D908AC7ABB3AE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7716
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	287d5d6c-06b0-492f-7d1a-08db554c6f14
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	q7S58YX3Q9j7x5BOcB91QUFWtIrBfXzrBPVSBQ664y28yHG0ROrz/UClF7VMZWjp4yMVUxtuc4xzyZLfTdSlyX2fd05tx6rmd69nOLRqIqnC0pCdyAraCi1i/Trrt7UM2qUB8lKxUP5fp+KXG5Yh7wxJOzMZTzMAT5LPnWBVTy4OxiWlckk2mx/iIXMeVGFPnMrPxM+CTXJTMJdFsXagbmuCjIsiFFRTJJbkIP1v4isnAX0eJr5+favO92qwm5ol82tTtfUNxrbY5T3FH+J8CXYjlUKis9KtpTseGd+9Llo8ielDMOMRq56Z+m5qMe1n41RfOQU7HRpLmvEVlYYboLEN7HYiNUxVQyz+eveJ3+HGkEiMagoK0UedbFtRrHVNyXJpFnIhGWCoXt7Iigxi6tafBKH9jtQgcm42LYMA9hbA4gAK5wOS4YbhPgnm445wpraLtSUDhnIV8eePbfzrAjdod7pAjMtjHOBkHCH1vUzahlzSXGcC/I/uCwrxWusRPtvRpNlYs/ZMjoFsFxWT3MsonQkxdJAo5QfS7YiKT5JnsRhznPjwHI3/1AnNSlow93v2HxvngHkCYlSubcLyqtVba39lNABag5Ob5B/WZFASluvINJPSSyGdzmkKPSnYGywyWHvRRkdRWsFhI7W8nosuH18Xlw+z7/fQI4qSEuHpwlrDUg1tJT3IgrqAQjC/EnlbsqDitviYmXNFe6qce59sACkaE9gl4GTewqBy83k=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199021)(36840700001)(46966006)(40470700004)(33656002)(36756003)(86362001)(54906003)(316002)(4326008)(70206006)(70586007)(966005)(478600001)(6486002)(81166007)(82310400005)(40480700001)(5660300002)(8676002)(8936002)(6862004)(2906002)(356005)(82740400003)(41300700001)(6512007)(2616005)(186003)(53546011)(26005)(6506007)(336012)(36860700001)(83380400001)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 13:58:25.9761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdf93c06-0b8c-4369-ad2d-08db554c7449
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9289
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 13:58:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181259

T24gMTUgTWF5IDIwMjMsIGF0IDEyOjQwLCBNYXJ0aW4gSmFuc2EgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPE1hcnRpbi5KYW5zYT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+ICBkb19jb25maWd1cmU6cHJlcGVuZDpjbGFzcy10YXJnZXQgKCkgew0KPiAtICAg
ICMgaW50cm9zcGVjdGlvbi5tNCBwcmUtcGFja2FnZWQgd2l0aCB1cHN0cmVhbSB0YXJiYWxscyBk
b2VzIG5vdCB5ZXQNCj4gLSAgICAjIGhhdmUgb3VyIGZpeGVzDQo+IC0gICAgbWtkaXIgLXAgJHtT
fS9tNA0KPiAtICAgIGNwICR7U1RBR0lOR19ESVJfVEFSR0VUfS8ke2RhdGFkaXJ9L2FjbG9jYWwv
aW50cm9zcGVjdGlvbi5tNCAke1N9L200DQo+ICsgICAgaWYgWyAiJHtAYmIudXRpbHMuY29udGFp
bnMoJ0dJX0RBVEFfRU5BQkxFRCcsICdUcnVlJywgJzEnLCAnMCcsIGQpfSIgPSAiMSIgXSA7IHRo
ZW4NCj4gKyAgICAgICAgIyBpbnRyb3NwZWN0aW9uLm00IHByZS1wYWNrYWdlZCB3aXRoIHVwc3Ry
ZWFtIHRhcmJhbGxzIGRvZXMgbm90IHlldA0KPiArICAgICAgICAjIGhhdmUgb3VyIGZpeGVzDQo+
ICsgICAgICAgIG1rZGlyIC1wICR7U30vbTQNCj4gKyAgICAgICAgY3AgJHtTVEFHSU5HX0RJUl9U
QVJHRVR9LyR7ZGF0YWRpcn0vYWNsb2NhbC9pbnRyb3NwZWN0aW9uLm00ICR7U30vbTQNCj4gKyAg
ICBmaQ0KPiANCj4gV2FzIHRoaXMgZXh0cmEgLm00IGZpbGUgY2F1c2luZyBpc3N1ZXMgaW4gYnVp
bGRzIHdpdGhvdXQgZ29iamVjdC1pbnRyb3NwZWN0aW9uLWRhdGEgaW4gRElTVFJPX0ZFQVRVUkVT
Pw0KPiANCj4gSSd2ZSBub3RpY2VkIHNvbWUgbWF5YmUgdW5leHBlY3RlZCBzaWRlLWVmZmVjdHMg
ZnJvbSB0aGlzIGNoYW5nZSwgc2VlOg0KPiBsaWJibG9ja2RldjogaHR0cHM6Ly9saXN0cy5vcGVu
ZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTAyNTk5DQo+IGdsYWRl
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVz
c2FnZS8xMDI2MDENCg0KVGhhdCB3b3VsZCBiZSBmcm9tOg0KDQotREVQRU5EUzphcHBlbmQ6Y2xh
c3MtdGFyZ2V0ID0gIiBnb2JqZWN0LWludHJvc3BlY3Rpb24gZ29iamVjdC1pbnRyb3NwZWN0aW9u
LW5hdGl2ZSBxZW11LW5hdGl2ZSINCitERVBFTkRTOmFwcGVuZDpjbGFzcy10YXJnZXQgPSAiICR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdHSV9EQVRBX0VOQUJMRUQnLCAnVHJ1ZScsICdnb2JqZWN0LWlu
dHJvc3BlY3Rpb24gZ29iamVjdC1pbnRyb3NwZWN0aW9uLW5hdGl2ZSBxZW11LW5hdGl2ZScsICcn
LCBkKX3igJ0NCg0KQXMgdGhlIGNvbW1lbnQgYmVsb3cgZXhwbGFpbnM6DQoNCiMgRXZlbiB0aG91
Z2ggaW50cm9zcGVjdGlvbiBpcyBkaXNhYmxlZCBvbiAtbmF0aXZlLCBnb2JqZWN0LWludHJvc3Bl
Y3Rpb24gcGFja2FnZSBpcyBzdGlsbA0KIyBuZWVkZWQgZm9yIG00IG1hY3Jvcy4NCg0KZy1pLW5h
dGl2ZSB3aWxsICphbHdheXMqIGJlIG5lZWRlZCBhcyBhIGJ1aWxkIGRlcGVuZGVuY3ksIGJlY2F1
c2UgcGFja2FnZXMgYnVpbHQgZnJvbSBnaXQgbWF5IG5vdCBoYXZlIGFueSBtNCBtYWNyb3MgaW4u
DQoNClJvc3M=

