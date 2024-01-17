Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C522EC47258
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 17:26:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.73])
 by mx.groups.io with SMTP id smtpd.web11.9402.1705512366994740607
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 09:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1V6elaEi;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=1V6elaEi;
 spf=pass (domain: arm.com, ip: 40.107.20.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=FXCVSVAWCBr10k+rn+GwQzHU3KTLJdH7dBXbYEddxk0ctoZZua6z/cpIQjmOM0gE2BDb9UwocEOavoDQbdW49gYzUOdH9K5pTCraxIQ4s1+bgkq9ffwHRovPaE8yWVb8cx3ONN5LVZKMJqkW/81AobXMZP+NcfOTVjR/owyl90oAJsa8aQ8mNsXLQgIhrbb604ps9vYGtzmK7Jn0OzO95UbWs6SduNMjh51KHOsePovkzsfK6vDbrc6ywMocF88MF5UQ124fFQx4oEeRnF1nqO9tVgnzYs6YtM36vciTRQ6ImADVz43YTY/UJL/eaKajeAiHr3zBWL1ATYscqC3CDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VAKv/oosQTrwCts9EUiPr9qKAfJpnjhdXOpIZX8csI=;
 b=B0MFKAqIEeTsiOUjWyiIw/aTUOuUufejPLRZ4yxgvH8j2qzoszcLDIMzKnrddpxoWvrBO51lqZTxxa7hjcEJ6F73EA+b/5eVsb9vbXc8zopw7Upfl1wpUsxuX6ZUkQ1kEzEkeEU51lwXkF2uVniJCKSmm2x4yYEdAKMtkyw2ycTxKH28PVybJksl2nnIjqCsUTaqHlpcftIC40VYvMo4fB0S0v7o9zRrIeLcHU3Sfp9qT6ttT/LabrWeLL4qGXgZLOp71d/JkmtLL7sH5DNTDKmIrQOvpqNFkw1yyWdf6JIEudnBLHsZe9NwWfvme8YAcUWoZ/5IWWS+fEm3XSV9nA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VAKv/oosQTrwCts9EUiPr9qKAfJpnjhdXOpIZX8csI=;
 b=1V6elaEiApe++9U7zXBibMzGKxVspyaTLHi1zw0Mal/IwhKiazeYlcZpL95ro8oEplk5uLGyhVtmAK7UEcH8k+6g0qA6WOmpGeVApUSnnjc/KloGxoP0M6VL3QNYNL6ZaadEkpUmZPXeOSgmmmjBWMAMBNRrN8B9ZLXxlIpMoDY=
Received: from AM0PR02CA0220.eurprd02.prod.outlook.com (2603:10a6:20b:28f::27)
 by DBBPR08MB10433.eurprd08.prod.outlook.com (2603:10a6:10:52f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.29; Wed, 17 Jan
 2024 17:26:00 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:28f:cafe::ff) by AM0PR02CA0220.outlook.office365.com
 (2603:10a6:20b:28f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Wed, 17 Jan 2024 17:26:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 17:26:00 +0000
Received: ("Tessian outbound a297577ee0df:v228"); Wed, 17 Jan 2024 17:25:59 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 81ceef9fead98663
X-CR-MTA-TID: 64aa7808
Received: from 0ffb5757fcbf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 23AC04B5-DD0E-4265-A5A7-DDEE839ADF80.1;
	Wed, 17 Jan 2024 17:25:54 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0ffb5757fcbf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 17 Jan 2024 17:25:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7vWzBHHSsIVmiOKbcCuJHA1nnaEgSPJhUJTlSZTR4juR2y6cucLv1vvzNqgpxlUQioA9/JwJ+Ut2UaDYPbDkLLsY6BPqL8L1hckOXoy/KuIt3B8A3cV6HvrivmOaaNtUog8nPveNhg761ifm4wEZCjchnwPxhfHTAIP9l8MVxRD8PmwnG/RQuugoBgsTINAZwsYsYu8uMT7rehQQvDGC+IamJ39KcE6tMDijqsQ47yNlR7K5sIKONti7djzX1A3BF0kTD3//epPX3r0wHG9TWGT8Qhe78112h8oICmxc+A5gzn0/fw3QCNCiZHLsYWSKSvV31mvsoR15wS5atByCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VAKv/oosQTrwCts9EUiPr9qKAfJpnjhdXOpIZX8csI=;
 b=kbvAZBQAtniymLSR2DnPljRo9DoGCiPn0qjm1ZJObIoLTKnXSqkFgKp/QMxF3Ea+qE/yz+XH8JtHubdRN6IzpzarXHTm3fHzwZPOqzUexE5LH9zF+tNqECp5PLbJBkoE1rMBz41jdTkc559hL5/yQ4kVz3VKjWEvW5oY/kyEAwgP5J6amMy5AbhPRVzg1QUkncPoJ9ieow0IxCKuKEk3+/MPTkXnhGEMu6onBtkq6CDtlTceZVQj67oTsldtf/bhqbeBEfF1OVsCm3byaNMmRBmfqXEKGwMiBRepsDQ8uDSDsjnYsVtiHAsKlESAxgFtWgbEkG4Fjw5tpPTzgwDSpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VAKv/oosQTrwCts9EUiPr9qKAfJpnjhdXOpIZX8csI=;
 b=1V6elaEiApe++9U7zXBibMzGKxVspyaTLHi1zw0Mal/IwhKiazeYlcZpL95ro8oEplk5uLGyhVtmAK7UEcH8k+6g0qA6WOmpGeVApUSnnjc/KloGxoP0M6VL3QNYNL6ZaadEkpUmZPXeOSgmmmjBWMAMBNRrN8B9ZLXxlIpMoDY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7892.eurprd08.prod.outlook.com (2603:10a6:10:39f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 17:25:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7202.020; Wed, 17 Jan 2024
 17:25:49 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Etienne Cordonnier <ecordonnier@snap.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/4] libunwind: merge .inc and .bb
Thread-Topic: [OE-core] [PATCH 2/4] libunwind: merge .inc and .bb
Thread-Index: AQHaSVbzszO/51uXL06B4BSqiuCvNbDeQAiAgAABqIA=
Date: Wed, 17 Jan 2024 17:25:49 +0000
Message-ID: <9515FA52-1B65-4356-86DD-29279498CA5A@arm.com>
References: <20240117150720.3585669-1-ross.burton@arm.com>
 <20240117150720.3585669-2-ross.burton@arm.com>
 <CAHUKmYZVhp9gsE0xoe0sZqgxuh8ayJhUz70Wo_0UefcLfD1+uw@mail.gmail.com>
In-Reply-To: 
 <CAHUKmYZVhp9gsE0xoe0sZqgxuh8ayJhUz70Wo_0UefcLfD1+uw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7892:EE_|AMS1EPF0000004C:EE_|DBBPR08MB10433:EE_
X-MS-Office365-Filtering-Correlation-Id: b25a1982-2ebf-4196-35c9-08dc17815f95
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EjxYYdpSh/5Sh/NhByHtQM7q7+soc+Tx8Mz3kCTRLHt4O0wNVqZHEtR7HPr6wDPSc4AyDgMhJg23QLCos0OuqWRCZAiu6qzc5SHhxew4TH4eVfLO5M9MFKSPkQuy3G7VeUcw7Cf1TX+NW4wmKTDd9D+56k3dg2h6com2uiQ/8QDhl0dp44Bx19tns5Ao63V9fzedaYcttzbSFL5pdGU5fdevjVe6bCEOE1vxtT0as0Eg4WeyrR7KHoEUXzbvftObyt0DRF6psbUw8kbYjThBZdlBs9c8YV3dKUKN2eB3Wqdkc2xO+Lvkis9KDbA4bYPHfw+RHPheVwChhCZQaoswSwzl5QsStXZXB8dPKorP9Biws4WeTCe1duUJ/lh6EoYtNCyS/u0XeBLF0DPHP2UA4tWBlGKji3Py+KU8TSvpvfkjPA4M5llnS5n/K93scWcEeTJk+A3LhcjNzc9Na19wjGJoydomRCVopUdOTV/btVX6bTWM5quQl4Q4IkgzUjX5xa/1UYA28JeHaBix+js77aFTAyTPj1BIPHYLzCRyXG4Ez2T7Hxa93ONVvF93NbDK9QJ1UiYM8hmJRYswoBmvj9RDb6XTY14CLYk8OR9qBBxCTkCcsSb13GY8eYhM9PB2DIzHHiH7mG7kUs/GjZ+1kUZ9HwElfsR3VIkO2gbl1zdarnHQP2Wmhp7S2WzcKt3K
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(2906002)(38100700002)(122000001)(4744005)(36756003)(33656002)(41300700001)(86362001)(316002)(76116006)(6506007)(66446008)(66946007)(66556008)(66476007)(64756008)(6512007)(91956017)(53546011)(2616005)(6486002)(478600001)(71200400001)(5660300002)(83380400001)(4326008)(8676002)(8936002)(26005)(6916009)(38070700009)(142923001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <24D2E2854A81AB4B9BFD1ACFAB00A071@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7892
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8b9394a7-f278-42ff-e9d3-08dc1781596d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9KfpAMAKRZMprrdueD2o4YzV4U7QYsJymHpvua+UGS6MaXaWSBoGPOBHTETVGfi60mRd9uG2jQ99VqfJzQJg8noXsnL+nhe+tLedtHSt+jWLeqwj8GjHZWPWtIihzO46+9zMtunATmhhetej56bLLSCpFNwosDMtmUSEqUoUxjUIBOPYdKpbpDZny+LAQ0qeCu0vSnor/tIGOt3AnUyKTs4ka80H1OMolX0v/JWcCVA0B2G34F5CPa7BJ/faCggr6WL9UiDDWOdpo6JTScNZ0r5kIyOLjnd+nHOtnNV2m+MU5g2ji5a1/F4G4JOXNXttfmuLHUUuw3CiXoTUhaQrrOc50v75BLNwXOYhfaUbHlIcRMzeb5330LC36lZHUeCF5q7lBahDCQPzik78JfHeCYXUfIBm0x/1WWBjBK724Tq+/DEY3cIrtVtoqEeZf4PSHzm9wVEdcMneImzHtZslQWCysY+xfHokL7KBz8K2MURaH+8ADEQ7Sx0e/Wk275BI7lC25Md/p5DHOhPFxj344MDEzRdm3kwq/iOWEYDR0Qk1Tai2ZhflrA+3oRk88X/ZzXMgN33qr2ddTclfrgQ7Qx/eOC+msU2TbZplZ8cgc5WKNnU+PFiTb2EMqSi0VsG/i1f1ovqkiZqMhu4M2y22rHEGWIBiu0bj9pySsggs8qm9fEESk1CuAiZT7EUEvK8GXZkq05iatqtWIG8mfx37wy/llnKl4fnI9/5ZPIEWNaszMvdcGAVHBoztiHRHIRj04/b9ITppl3mYp4HCVa9x/g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(53546011)(6512007)(6506007)(2616005)(336012)(26005)(36860700001)(81166007)(47076005)(83380400001)(5660300002)(4326008)(6862004)(2906002)(4744005)(6486002)(478600001)(41300700001)(8936002)(8676002)(70586007)(70206006)(316002)(33656002)(36756003)(86362001)(82740400003)(356005)(40460700003)(40480700001)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 17:26:00.1133
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b25a1982-2ebf-4196-35c9-08dc17815f95
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 17:26:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193940

T24gMTcgSmFuIDIwMjQsIGF0IDE3OjE5LCBFdGllbm5lIENvcmRvbm5pZXIgPGVjb3Jkb25uaWVy
QHNuYXAuY29tPiB3cm90ZToNCj4gDQo+IEhpIFJvc3MsDQo+IEkgdGhvdWdodCB0aGUgbWFpbiBy
ZWFzb24gb2YgaGF2aW5nIC5pbmMgZmlsZXMgd2FzIHRvIGhhdmUgYSBzdGFibGUgZ2l0IGhpc3Rv
cnksIHNpbmNlIHRoZSBiYiBmaWxlcyBnZXQgY29uc3RhbnRseSByZW5hbWVkIHdpdGggZWFjaCB1
cGRhdGU/IFRoZXJlIGFyZSBtYW55IHJlY2lwZXMgdXNpbmcgYSBzcGxpdCAuaW5jIGZpbGUgd2l0
aG91dCBhIG5lZWQgZm9yIGl0LCBzbyBJIGFzc3VtZWQgdGhpcyBpcyB0aGUgc3RhbmRhcmQgY29k
ZXN0eWxlIG9mIHBva3k/IElzIGl0IG5vdCB0aGUgY2FzZT8NCg0KSXQgb3JpZ2luYXRlcyBmcm9t
IHdoZW4gb3BlbmVtYmVkZGVkIGhhZCBtdWx0aXBsZSB2ZXJzaW9ucyBmb3IgZWFjaCByZWNpcGUs
IHRvIHNoYXJlIGxvZ2ljLg0KDQpTb21lIHBlb3BsZSBzYXkgdGhhdCBpdCBoZWxwcyB0cmFjayBo
aXN0b3J5LCBidXQgdW5sZXNzIHlvdSBwdXQgX29ubHlfIHRoZSBjaGVja3N1bXMgaW4gdGhlIHZl
cnNpb25lZCBmaWxlIHRoZW4geW91IG5lZWQgdG8gdHJhY2sgdGhlIHJlbmFtZWQgZmlsZSBhbnl3
YXksIGFuZCBnaXTigJlzIOKAnOKAlGZvbGxvd+KAnSBvcHRpb24gZG9lcyBhIHJlYXNvbmFibGUg
am9iLiAgSSBkb27igJl0IGNvbnNpZGVyIHRoaXMgYSBzdWZmaWNpZW50IGFkdmFudGFnZSBjb25z
aWRlcmluZyB0aGUgaW5jb252ZW5pZW5jZSBvZiBoYXZpbmcgYSByZWNpcGUgc3BsaXQgYXJiaXRy
YXJpbHkgYmV0d2VlbiB0d28gZmlsZXMuDQoNClJvc3M=

