Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFFBC4332F
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 16:47:01 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web08.26.1665593217174346636
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 09:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ysXn4z46;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GU4Agnm3Wnr+6OeHuwtJAHOy6+JK1nNsGolhTQNrFql9ZNLbEo3ccCqyFvd9p+HwERoNWxI48Y3sH9jfAECSGjxrQ11ZsnXbD8ckFRBLx7I60DbQOTrz52xI04iZRCzeAEQXPNQluZz0YbMsEK9+DXAMtI693STN+Qf74O4gqJAWe7CpXBEMvUihy9cAtCXLxlh9FZ+AQ0WKfxqBIFIr97s+ygdOw9+V5FNkGp6iWV56T8JE/Tw1NH6qrBdPuxHG4rByhSJqNqMISGd9G7TzekSx1jxQyNF4jisF7v6rQI8fDQo1VI5P8tNHu/k8LmKbL45CNp+kcneZfI/vgH2KmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wS1oRcGsAxulbcQIFZiYQ+2CXcTBOyP1T9J3UjIPTc=;
 b=BmyBmkvSWQ4j2/Oz6bW6+ejX2J2uBurny1vtSy/f7dmk9v8Lfut/BxO4zE96UZQc5LD8+yebPqTC+6imqeOGWi1L4aQIkmGdBWmHxmegb+rvRBvJuLO0EQKwShKEH76NK0CXBdtepDoyro1NtfyaSYoJ9FgvNCk7OTQ784cU1Vbkwh5LhoQTVYaGTtmuxRZE47aXHhbOMn5GLk4Mx5Fhq+EdYh4NNWA2Cp4kBnwmYFCwRICcAOHEeAe/6CKqR16ii04n0MMZX/iFxSQgNqkR+0vbwvM9thcPch9qhSqhRkXfW8WpolFy16Vjiv1dSTlu8fHUwaHJd/W4t3aQqqe1Cw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wS1oRcGsAxulbcQIFZiYQ+2CXcTBOyP1T9J3UjIPTc=;
 b=ysXn4z46Y7LG5el4Bi1TsCt8fzKsuqe3aj/RUO5hWlGDm//DxcIEB5ZJ7AgGRIOk5fruSR3IldfqMEqZ1BOkxXMtEc310lO/0EPM9YYoly2jGljL21rK6oelvkKgbg9HzKzsM5qQNFwSlIYXqkZRNteK7cQY/7MksytD9YNKpkU=
Received: from AS9PR06CA0302.eurprd06.prod.outlook.com (2603:10a6:20b:45b::17)
 by DB3PR08MB9058.eurprd08.prod.outlook.com (2603:10a6:10:430::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 16:46:52 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::70) by AS9PR06CA0302.outlook.office365.com
 (2603:10a6:20b:45b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21 via Frontend
 Transport; Wed, 12 Oct 2022 16:46:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Wed, 12 Oct 2022 16:46:51 +0000
Received: ("Tessian outbound c2c2da38ad67:v128"); Wed, 12 Oct 2022 16:46:51 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a2ca2481d438e0d4
X-CR-MTA-TID: 64aa7808
Received: from e6a8a14fa26f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 81C47DA4-A13F-4798-B9DF-F53B90F1321A.1;
	Wed, 12 Oct 2022 16:46:45 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6a8a14fa26f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Oct 2022 16:46:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBfW2NH6aydw8F4sG3/VnK7/Qc6GZE//sXkmL1H3m6M7lAEntZsGnl1ZPSOnV9WFSem1rEOdi4pgCGKyETWiGZLTVbtsMSJcTpwiE/vXEtZjh5OkpaMJRuDSoNliJMww85k4jx9HzWpVWbLo2TK2WRwN4pX3N0GpJgwgkp3gzWVjAyaSx8eCnFGAXBzefsjRfC2p8Vc1N6LlKwGYYkdcjiZY5H2j8C0i3HeTuggMh4vXNHCtpx/GcKk+XTNO0miCvi7foJ8O6K9a7jagYyevviFnWSnk9hN1SSmy1+k38kJnOP6qkr0/qKyGyaBM7txcW4gEn6OkLyR2ZOn6CruOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wS1oRcGsAxulbcQIFZiYQ+2CXcTBOyP1T9J3UjIPTc=;
 b=aFDhh9z7/w8IrIE1074OgKp8IaHjT+r/HSfDO+DRnV7EUzstZd2zrGFiiE1Wv6H1l64a50tvLGNK5lQGm207V1UToLc0xfWIUwtlVuVtS6U/9BMuCPhRzHVuTvmfWm01Fb0rTKpRZfc/GF7XIFKMIX2Du9nlvF+dno7r8JMcikmW3ilPG/V5RA6ZpRApQYdep9gj0VnA8tmoNiZ/eyBVxLUGqD2zdISDucrDr6381Pd6Cyai9RSDZ/KpgPXxsXA8m3NUX7cq2kRWlZ2VgsawquklHlcOyi3+q74OsrzbJy74+naN1fS2Ylh2FIeZTKO1YbueR1su5aL2/GxPbtPaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wS1oRcGsAxulbcQIFZiYQ+2CXcTBOyP1T9J3UjIPTc=;
 b=ysXn4z46Y7LG5el4Bi1TsCt8fzKsuqe3aj/RUO5hWlGDm//DxcIEB5ZJ7AgGRIOk5fruSR3IldfqMEqZ1BOkxXMtEc310lO/0EPM9YYoly2jGljL21rK6oelvkKgbg9HzKzsM5qQNFwSlIYXqkZRNteK7cQY/7MksytD9YNKpkU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6411.eurprd08.prod.outlook.com (2603:10a6:10:261::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Wed, 12 Oct
 2022 16:46:44 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5709.021; Wed, 12 Oct 2022
 16:46:44 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pango: upgrade 1.50.10 -> 1.50.11
Thread-Topic: [OE-core] [PATCH] pango: upgrade 1.50.10 -> 1.50.11
Thread-Index: AQHY3Uh4OElc0GKfD0uxv/MLLYlCYq4K+doA
Date: Wed, 12 Oct 2022 16:46:44 +0000
Message-ID: <D47A4D61-C059-4AE3-A08F-89D4BC7F429B@arm.com>
References: <1665475558-16409-1-git-send-email-wangmy@fujitsu.com>
 <1665475558-16409-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1665475558-16409-4-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6411:EE_|VE1EUR03FT007:EE_|DB3PR08MB9058:EE_
X-MS-Office365-Filtering-Correlation-Id: 96afc51f-6f5f-4915-f4d8-08daac715d34
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 1/Pvp13DpCYmOu38hFOdzQS9QoKpB8eeP0dsrr8thkiqGqH2RK9w7sSxB7lH36lYNTLWWtjACUbBbe9sWTHVvGG+061jIPzYCdcnBX17lzW3ErkdVOz5mPys2MiSGbYfZ2AzPtEaXhUSzs+APtrhBeuxZ44Wo2ZaPssBdC1JnrSjXq8lM61z4cZRKvRozFJdWSSOAWQDAdVC/AoUrxVtfaV8gfrM/kMgJgfZI3nkM8cQ71WfQnUTclyyDC/VcudGvhcRUKjVycSmOze1iyFVz/6A7m1BGvnRXVB+1SYG6uzBGKBoD2Oc6luLLjt1dt3KUfxByxpKZoQDcd0rAui2KcIg/HvwPI2MmrG0A6ZijFEgIJJnNZgq8D4981kwMbSYyCbi7V/+IYZLv2dU6b/ia6dnbiBvt3TQ5oQM77p7Gszyo7++2CZ9wBm/lrkvjQ4Lnz7CCHSnQEJBhISEgguOQVr2tc4qCSDBKpU8djQUw0Qu6M3PGKQuzjr7AOTD/3eumXW9PDbnXcbXeJrtA/hPYveD9GSL6ujVo+sfhxCLxXGm/vqWg+5MCsjv9c8jCzz4YVgcIucPCE4Fb1yHShy7Fp47lmljcoh1sGVhN4QdxbvE9zgQjT/iNJOR2IUt30vVXFsGRzqoc05bclklkL9MjzW3GFFEaMYxvuHX4tOAepJChMU8gypo3CNdTozsAhEq4ZgHeRugmjxQJAnOLbuVFCpn7m6VU/BAV78V1rSMdnKdagIb3Ar2V3Ie5w/0zm3HSUuXdfBgLAyXOsndlhUZvGOsmzpAZJoULbksNe3XEotQo1pxUZZl4GrO1Z4FRN4Ff4E9Fgo1gVGX9XC4WbIBiw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(451199015)(8936002)(66899015)(2906002)(6916009)(41300700001)(66446008)(66556008)(76116006)(4326008)(64756008)(33656002)(316002)(66946007)(8676002)(36756003)(71200400001)(66476007)(966005)(6486002)(91956017)(86362001)(5660300002)(53546011)(186003)(83380400001)(478600001)(38070700005)(26005)(38100700002)(6512007)(2616005)(122000001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6AEDF01C72D98149B74B53CB40564E75@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6411
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d9a6b1da-0e0a-4f41-4172-08daac71589a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	35lj8oENYWJeE2QUvxJ/2PRq1uJPuDQPCTvTfzAqKPJu9Ti5xBtB1/F8HwbErl1zymv/kmntu0ZCyCfSSx7UGrSkXsebFQ+Ct/chKmY7bgcTXIom5H6dUlQaadHIHWvyo641nZ1Lx2CgK8BuQZlq3IKgZ1xsyM9fZiwdwq/a+NQo38SbkScxybANLBSxbW9gFPEhILY0/+FthXbwR+RfT/yD3R2fWVDdGXfuKLnGL9PhwbpMcjs/TPjXQpCarjDG5EsbbGCpFx1IyQyJ66Aa/decP7cheExT+jKLutTDbEb65kAOTN7MWzLHVuwJzCOVrbywshMgGSEXBDWGsMw1HuTKiKthkdm31apyotFT2NiVO2OqnGqQluJNynjCaZLjd+JpaPbDs7LV4C+ZHPiAB5R3WuRrZu/RBgiazMO0bCSMco4K7ckRh5gAp0RraUMw6nkiqXoVt5JvXV2YmJLuy5sZEP2qrBOxtSHnIti1tKUNl2wRl21dMBVtS1irXja/XTs+zYGA9wcansuzl7cKY8vyb50v9tgJAS2ESrQhpMb0vv7FfYurkVPrp+aNBwMgEFwLhDf21kf35nGwXSJxKYWHyn+4jfBHqqCcb8zvCX9i2BuaUfPS+J5xUroZuXpOD7ya/mVUcimftSNSciTrrNtPZAnBlJSkL6zEi3bscj3uyzx9ZT9lAF9IcDMStQiuYqNlA1yWfodj3ZPvSeVEpKHIKx/+1kYpSJj9QHG2MaiBy3rxpHDCv02Zlcmtmh+j1RFDiIKDrJulfZR/IzIO+GqFllXLSnXG4b5bTQKg3fc=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(66899015)(40460700003)(70206006)(70586007)(36860700001)(8936002)(6862004)(6506007)(47076005)(53546011)(6512007)(41300700001)(5660300002)(2906002)(86362001)(2616005)(316002)(26005)(8676002)(82740400003)(33656002)(4326008)(6486002)(966005)(82310400005)(356005)(336012)(36756003)(186003)(40480700001)(478600001)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2022 16:46:51.9192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96afc51f-6f5f-4915-f4d8-08daac715d34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 16:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171672

V2Ugb25seSBoYXZlIDEuNTAuOSBpbiBvZS1jb3JlIG1hc3RlciwgcGxlYXNlIGVuc3VyZSB0aGF0
IHlvdSBzZW50IHBhdGNoZXMgYmFzZWQgb24gbWFzdGVyLCBvciBpZiB0aGV54oCZcmUgYmFzZWQg
b24gYW5vdGhlciBzdGFnaW5nIGJyYW5jaCBwbGVhc2UgbWFrZSB0aGF0IGNsZWFyLg0KDQpSb3Nz
DQoNCj4gT24gMTEgT2N0IDIwMjIsIGF0IDA5OjA1LCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+
DQo+IC0tLQ0KPiAuLi4vcGFuZ28ve3BhbmdvXzEuNTAuMTAuYmIgPT4gcGFuZ29fMS41MC4xMS5i
Yn0gICAgICAgICAgICAgICAgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQ0KPiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3tw
YW5nb18xLjUwLjEwLmJiID0+IHBhbmdvXzEuNTAuMTEuYmJ9ICg5NCUpDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTAuMTAuYmIgYi9tZXRh
L3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29fMS41MC4xMS5iYg0KPiBzaW1pbGFyaXR5IGlu
ZGV4IDk0JQ0KPiByZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvcGFuZ28vcGFuZ29f
MS41MC4xMC5iYg0KPiByZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3Bhbmdv
XzEuNTAuMTEuYmINCj4gaW5kZXggOTUyMDk4ODlhOC4uMTEyMGUwNTNiOCAxMDA2NDQNCj4gLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTAuMTAuYmINCj4gKysrIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL3BhbmdvL3BhbmdvXzEuNTAuMTEuYmINCj4gQEAgLTI0LDcg
KzI0LDcgQEAgU1JDX1VSSSArPSAiZmlsZTovL3J1bi1wdGVzdCBcDQo+ICAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLVNraXAtcnVubmluZy10ZXN0LWxheW91dC10ZXN0LnBhdGNoIFwNCj4gIg0KPiAN
Cj4gLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjdlNWQyZjFlNDA4NTRkMjRhOWEyYzRk
MDkzYmFmZTc1ZGNkYmVjY2RmMWRlNDNlNDQzNzMzMmVhYmVkNjQ5NjYiDQo+ICtTUkNfVVJJW2Fy
Y2hpdmUuc2hhMjU2c3VtXSA9ICI4ODAwZjgxMmQ4OWVlNjEzODgxODg3MDMyMDNmM2E3ODc4OTYz
YzIyZjg2OTVhYWYxZmEwYTFhMTQyOGQxN2FlIg0KPiANCj4gREVQRU5EUyA9ICJnbGliLTIuMCBn
bGliLTIuMC1uYXRpdmUgZm9udGNvbmZpZyBmcmVldHlwZSB2aXJ0dWFsL2xpYmljb252IGNhaXJv
IGhhcmZidXp6IGZyaWJpZGkiDQo+IA0KPiAtLSANCj4gMi4yNS4xDQo+IA0KPiANCj4gLT0tPS09
LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50
IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25saW5lICgjMTcxNjAzKTogaHR0cHM6Ly9s
aXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzE2MDMN
Cj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTQy
NTQyMTUvNjg3NTg4OA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1i
ZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jvc3MuYnVydG9uQGFybS5jb21d
DQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQo=

