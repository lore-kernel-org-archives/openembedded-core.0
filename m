Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F546C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 18:37:48 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.75])
 by mx.groups.io with SMTP id smtpd.web11.59995.1695062259349967474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 11:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sdVRTek5;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=sdVRTek5;
 spf=pass (domain: arm.com, ip: 40.107.15.75, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq31HP+Tn1mkYIVVdtVcRBD3tyWN1zo9lHa49jVHFVk=;
 b=sdVRTek5bWCiPaQRsQUNCF7guG9WswsWzYIjhlEPBwf1qeMHOsXP5kMZp6w1EdGx/OojxXFe7oreAWDJZOjXMNgjxmDkQ0v0EF9KatHi+jVyFdNnWqwXOem5R47OO5NveEX5EXVnp0WT43ydv3buv4YdwKvzjH53QAWsbvR9qAw=
Received: from AM6P193CA0046.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::23)
 by DB9PR08MB9753.eurprd08.prod.outlook.com (2603:10a6:10:462::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 18:37:34 +0000
Received: from AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::70) by AM6P193CA0046.outlook.office365.com
 (2603:10a6:209:8e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Mon, 18 Sep 2023 18:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT065.mail.protection.outlook.com (100.127.140.250) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.15 via Frontend Transport; Mon, 18 Sep 2023 18:37:32 +0000
Received: ("Tessian outbound d084e965c4eb:v175"); Mon, 18 Sep 2023 18:37:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4c33ec2cc2c96b82
X-CR-MTA-TID: 64aa7808
Received: from 749fde01f58c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1A585426-0A1B-4D90-BB13-EFF41076462A.1;
	Mon, 18 Sep 2023 18:37:25 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 749fde01f58c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Sep 2023 18:37:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f202LEEF5YcP2PeBUprNC6Kj3MwqBvv7/gno6//805B8IVWSx/D+G2mnqv2HJ/WfOdw9rwbjGAclnwD2RptojAUm+xVQWmCOnILMFlw+9sIV2csU0/E0A921Gx+1bAmiq3tdwmlOKCCneDO2/Rtlp7P1wr4bboSXbajukr6MF0dYCMq2Xke9TYevwiI1byLCn/czYJVDFt1y4OyJD0Kx2bkpUzu79fOrKm3Wv6Q5pUZP0RxtoYDUOR6AhzrRTPPDyyuEXS5EzU4iImly+lVAGOu8hyEHUbvxwblM2+0RGXZtwSYHHOYSIvZGn2BgjW6QVzfgIW7irm3x2oagULGWbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tq31HP+Tn1mkYIVVdtVcRBD3tyWN1zo9lHa49jVHFVk=;
 b=bpAF+N2Zgd4CE/UeaLIUbt+bINSOGCkkSKoVPzaS8FK4dPsTBXi+azHTF8qq9PZcCSTpaHP+fcBI/mcbyo2vHf2HYPvTNlnMXV9isooEE3jrrP0T4YHaPL1hvCm93ViBEA0NpuA2a1NB/zsU/f+UqGG+oNlJVk/xsv+SigandIaJblI7+tfn5IFoNzKdSZ8szge5xVHoXunbrMJO6FqH2XX0Y3u5XeAA8bBAkPt8JC9xNdfmy7i1VmpFCONARUWantwoeYrbXBzWDzpq1ODdDItRKeIXGGl/qG91nzdjyKWg8Pw2yqYggz7hVX8hoSZAkqla79A2pe8xmQuP95oTbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tq31HP+Tn1mkYIVVdtVcRBD3tyWN1zo9lHa49jVHFVk=;
 b=sdVRTek5bWCiPaQRsQUNCF7guG9WswsWzYIjhlEPBwf1qeMHOsXP5kMZp6w1EdGx/OojxXFe7oreAWDJZOjXMNgjxmDkQ0v0EF9KatHi+jVyFdNnWqwXOem5R47OO5NveEX5EXVnp0WT43ydv3buv4YdwKvzjH53QAWsbvR9qAw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7786.eurprd08.prod.outlook.com (2603:10a6:10:3b9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 18:37:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 18:37:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: Steve Sakoman <steve@sakoman.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
Thread-Topic: [OE-core] [mickledore][PATCH] gcc: backport a fix for ICE caused
 by CVE-2023-4039.patch
Thread-Index: 
 AQHZ6BU0duFFuuPDT0OgIJA6icxDsLAgvwgAgAAFbgCAAAlbgIAAB+kAgAADKwCAAAhNgIAADOuA
Date: Mon, 18 Sep 2023 18:37:23 +0000
Message-ID: <C22047D2-9261-4E26-9F80-B85D049F2DE6@arm.com>
References: <20230915204234.3547739-1-martin.jansa@gmail.com>
 <CAOSpxda40yQJrJCXhS-rtQ9T89auc52zwibD6qjCWYKSLZfB5g@mail.gmail.com>
 <DC0F0107-7850-4099-A201-6F6C1DB5D0CB@arm.com>
 <CAOSpxdYY8WWTknuN8Dayi8Q1fF1Q_=gJ67E7W3gJDEbx_eNG3g@mail.gmail.com>
 <CA+chaQeQ5F1HWdrS76XMS3NmTxgOcMUTWzHqrh5wZ3176qKb5A@mail.gmail.com>
 <CAOSpxdZFRS1P4+ZY1jQM=Y02DV+-6+C2drWthBdNJ8u5TxK_cA@mail.gmail.com>
 <CA+chaQd0UnUM9N5omspxTHiU+CSYo3g=8ZkaaAXHZspKdcq9Cg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQd0UnUM9N5omspxTHiU+CSYo3g=8ZkaaAXHZspKdcq9Cg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7786:EE_|AM7EUR03FT065:EE_|DB9PR08MB9753:EE_
X-MS-Office365-Filtering-Correlation-Id: f2837d6a-b99f-4e0c-6aff-08dbb87651fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RvbPeMV4TUol7PhgD5nM5IydDUJz6eHy7dI8lxS2ZUc/HhCAwUE0xRxkD4f9tVWm8Xk0RrdhFzpWokUcThd6xbXTgCXYA5kxNUgo1NqOxq9VSQ3OOMD88TCeJX0QeTG9+26RqpNpREk8MrVGVVXBgSO2lLOrK2Jddn9j9FA+r0tnSmvnoRCJoU7HTuxBzW2AorccyI/VVF0NTRuAQY78rBUkrq+DURjX09caMIoS696eOsVRv2RoINqfq6kRCGljnLX8HkEEOT98zJYHHHp9/54f0hPLFmDmqowPQfE3u+K4tWRznuHpdTskdfkptJ3Pf8IHzZ3rD5M1XhIxlAQO7jELLzEitkwwKtVNFlhxvZX1nLVtJwxjtLNfCy66y9IcXaTC/ATCwpIoYCAYotiheXeV3Fm0Je8C54Qp6qffrSwATeA9JcuhkOvIXnvQGT+yzB4V/gvtnhyDzerGBSoLO482tCJoLSFlFts6A4fXRwxPCmLBYashsXSE1aLwWsFqOkzh8ZjgYzuaR/HKAQG/AUq/hujHdFNXWOhf6TIQwc3Iajk/dHS0yB2QcUF2roIQ1OHLMKXLCqCdthgDBvnwi/LxMqrRxp8AB6nbRlaArOsA4T0XK1fXW/Rv6//w03E7QOj4LyA1QSzKvRltsQjKRQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(376002)(136003)(186009)(1800799009)(451199024)(26005)(2616005)(8936002)(8676002)(122000001)(4326008)(33656002)(2906002)(4744005)(36756003)(5660300002)(86362001)(53546011)(6506007)(6486002)(478600001)(71200400001)(6916009)(316002)(54906003)(6512007)(91956017)(76116006)(66946007)(66446008)(64756008)(66556008)(38070700005)(66476007)(38100700002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <35B0E002E19F254A9552A3D0074E2A90@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7786
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6e9d89d4-e5b4-464c-4b6d-08dbb8764cc9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zW1d1y45qtPCK/q8Bo8WvEUur40DkbRcfSr7G/XrAFsVTLalt6dwRizyHvho+M/qS23qyYct7xpbjj+VzO8+AtiCLAQfaesrpD5yVZ6RY1qtUVaNhayt5Yv68YwOIEbEPkxhD7XdyRL88uMvFLMb87VbjtL5mb8Tnx0WHHTAzfnd8/XHIwThkvGnTd3PQKU4iLPAoMSC2hMrUidEytZwsvVMh0r33+IsapxabFYuHxPmWg+CaISa5TS1fyxCnUKvqy301jI5YBHVEmQaRRp/5FYTfzNCkgxP+1hXPUgQItjyZznfgPsRC03jJiFcxTjKQpxQV5fxj1h+CTjeslUjQdf3e4knd0OvmWbPnKGXe4lbyGQ/zIDE2ORc6nPWONqUz5e1tZp2Mu5Cs7Z/A0ZP+/A1tPOPzYiuymYNry0mV8UQh4i68urXiFkud7RFNjjsvDuNphsqnn+vpWF39ogEIhJPFnwfRMDxLjOHXya4uRdqBBdslCHwPl9lEZ8WPppp/jd/NnAJHAdSKjXAbUsRsaz8IlP3JHaLZIiAwDGEV1SJtNhMrtmUxOnrrhYC2JHE1HIuCgotTBkInESgxBy7bya2oH8oG4G2mWwDetmIAr+grCQzBtDCs0QoH5zqlHmD6M2v+HkJcQB50R9h7nDDfvQtnzkIgJIJzdhD2l8Vl0N6gh8jVmY2ArkWCZs3jKAvNh9VMi/3vy4fFKIZ8ahYMFg/U0zWf1nxdcen7KpCnhahXg8cjHPgYXwyzuDTKIIi
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(136003)(396003)(82310400011)(1800799009)(451199024)(186009)(46966006)(36840700001)(40470700004)(6506007)(53546011)(6486002)(6512007)(478600001)(26005)(2616005)(336012)(47076005)(2906002)(4744005)(316002)(70206006)(70586007)(54906003)(5660300002)(41300700001)(4326008)(8676002)(8936002)(6862004)(40460700003)(82740400003)(356005)(36860700001)(33656002)(40480700001)(36756003)(86362001)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 18:37:32.3515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2837d6a-b99f-4e0c-6aff-08dbb87651fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT065.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9753
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 18:37:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187842

T24gMTggU2VwIDIwMjMsIGF0IDE4OjUwLCBNYXJ0aW4gSmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFp
bC5jb20+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgNzoyMeKAr1BNIFN0
ZXZlIFNha29tYW4gPHN0ZXZlQHNha29tYW4uY29tPiB3cm90ZToNCj4gT24gTW9uLCBTZXAgMTgs
IDIwMjMgYXQgNzoxMOKAr0FNIE1hcnRpbiBKYW5zYSA8bWFydGluLmphbnNhQGdtYWlsLmNvbT4g
d3JvdGU6DQo+ID4NCj4gPiBJJ3ZlIGludGVudGlvbmFsbHkgc2VudCBpdCBvbmx5IGZvciBtaWNr
bGVkb3JlIGFzIHRoZSBnY2MgdmVyc2lvbiBpbiBraXJrc3RvbmUgYW5kIGR1bmZlbGwgaXNuJ3Qg
YWZmZWN0ZWQgYnkgdGhpcyAoYXQgbGVhc3QgbXkgcmVwcm9kdWNlciBpc24ndCkuDQo+IA0KPiBT
bywganVzdCB0byBjbGFyaWZ5LCBpcyBpdCBPSyB0byB0YWtlIHRoZSBDVkUtMjAyMy00MDM5LnBh
dGNoIGZvcg0KPiBraXJrc3RvbmUgYW5kIGR1bmZlbGw/DQo+IA0KPiBJIHRoaW5rIHNvLiANCg0K
QWdyZWVkLiAgVGhlIHJlbGV2YW50IGNvZGUgY2hhbmdlZCBhIGZhaXIgYml0IGFuZCB0aGVyZeKA
mXMgbm8gZXZpZGVuY2UgcmlnaHQgbm93IHRoYXQgaXQgd2FzIGJyb2tlbiBpbiBvbGRlciByZWxl
YXNlcy4NCg0KUm9zcw==

