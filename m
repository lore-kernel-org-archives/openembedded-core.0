Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AE1EE57F4
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 10:58:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.41])
 by mx.groups.io with SMTP id smtpd.web10.36182.1694170695347654682
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 03:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IzR9wWJT;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IzR9wWJT;
 spf=pass (domain: arm.com, ip: 40.107.22.41, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ/dTqJ39W3Q1WRZtKbIQNGEt6grSzEl0xpNM48asLo=;
 b=IzR9wWJTgM33FgKRZuWHlMdlAMwi8OXcdc0EaTp8NAMKbg5lM5pzjchfmhf5jjwCYlZr6+d7ATJi8Ex2Nfj0yKmav8xRv8ygKcNL/tPlRyKYGfKRWjuF/G9FVFzha4TTJq0NaoAXMXhPs/uRX8yhydJqlNKNM15AEtsWPeylvh8=
Received: from DU2PR04CA0203.eurprd04.prod.outlook.com (2603:10a6:10:28d::28)
 by DU0PR08MB9510.eurprd08.prod.outlook.com (2603:10a6:10:44e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 10:58:12 +0000
Received: from DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::7c) by DU2PR04CA0203.outlook.office365.com
 (2603:10a6:10:28d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30 via Frontend
 Transport; Fri, 8 Sep 2023 10:58:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT042.mail.protection.outlook.com (100.127.142.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.10 via Frontend Transport; Fri, 8 Sep 2023 10:58:11 +0000
Received: ("Tessian outbound d084e965c4eb:v175"); Fri, 08 Sep 2023 10:58:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 218cde6b271e0535
X-CR-MTA-TID: 64aa7808
Received: from 07c8588e7407.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 10FE87EA-560E-43C2-BF7E-688FA296DBF6.1;
	Fri, 08 Sep 2023 10:58:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07c8588e7407.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 08 Sep 2023 10:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odM+oOnXkBLjUe6yYrcrFxPpd/vBmUJaF67R3njHimLUgKQSX0EhwhxuPeIQGffG0mnuc6UeDKp+LXPE4qHQ1N97+xhO7rUOC7uLAuhkd609JrV8LqrSKud0b/JzWfejd/Ub+YXZ349pwv3hGiOWGQvm9mgJZyBJnuWVW1N6B6jOPoCsye+DpHDQTV4ibKEhldRoWpFAGJrTumOC0NMa513Bxq8GulHEetztED6bakIJXTgMvaNvkgkYeDa4/Dssv2EwY9IG83xYLim039zxQUOBdRH7WRIcs3CHzN6AzzN6BERYPXNStan3u7NPBdFDR2mcLIwjt1QlIaldMDxZeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ/dTqJ39W3Q1WRZtKbIQNGEt6grSzEl0xpNM48asLo=;
 b=elajd1SBBlWGo6Ei87fOY8BLRS8lqPbDWby6wcFbJyutuui25YHeGDD+i0q1ezTd0/44t1nhOSutJLwW7vX4880XxiEUwUor7/mOe+sHawBbaXATKcwP9EXokAhmgVrKlwUGfJCvABE5s6ZAPkKliHxmWDhugleqJiFV5CwDUgSyKZTWdJL8TmVC6J32hUWu4CKIl4h+WybcTyIQ3vl6ypl6A7OJf5WHCB3ma+CHpxcuOhzitNIjYQAZVnYK+HZocWkg6jdqEsL/ioOKIslabs8fQkiY5gX/Klwd7nBkzcwdNMCyoO0ZncnMlHzAPIW9A1RGU80AknILfpwWrshclQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ/dTqJ39W3Q1WRZtKbIQNGEt6grSzEl0xpNM48asLo=;
 b=IzR9wWJTgM33FgKRZuWHlMdlAMwi8OXcdc0EaTp8NAMKbg5lM5pzjchfmhf5jjwCYlZr6+d7ATJi8Ex2Nfj0yKmav8xRv8ygKcNL/tPlRyKYGfKRWjuF/G9FVFzha4TTJq0NaoAXMXhPs/uRX8yhydJqlNKNM15AEtsWPeylvh8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8672.eurprd08.prod.outlook.com (2603:10a6:20b:55f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Fri, 8 Sep
 2023 10:57:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 10:57:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Yuta Hayama <hayama@lineo.co.jp>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] linux/generate-cve-exclusions: fix
 mishandling of boundary values
Thread-Topic: [OE-core] [PATCH 1/3] linux/generate-cve-exclusions: fix
 mishandling of boundary values
Thread-Index: AQHZ38rneEAaKASlD06cB4kT83ofHLAMFKmAgAD1nICAALHRgIADCu6A
Date: Fri, 8 Sep 2023 10:57:57 +0000
Message-ID: <0C22D829-0D4A-4623-B678-8AB3D4946CFB@arm.com>
References: <20230905072920.615-1-hayama@lineo.co.jp>
 <C799CA2F-53A9-47A7-812A-73DC55F64073@arm.com>
 <5e19b8ff-358e-0b6b-2fd4-f7884ddd280a@lineo.co.jp>
 <097A1A90-C4FA-4D2D-9FBA-193ED9D4D5BF@arm.com>
In-Reply-To: <097A1A90-C4FA-4D2D-9FBA-193ED9D4D5BF@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8672:EE_|DBAEUR03FT042:EE_|DU0PR08MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8c8238-761c-4852-21e4-08dbb05a7e68
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 jQKQHPV5Tz8VCrHEth63o9zF18RWyjzKzFVKFXKPvNmn5OwtJNxeW3ZHtkCs60jnkVat03MWp0T8kMhfDarjlWhjblVGShP8hwqQr4cpwP7DUZpp3CzvWGLKCaMfkcSsQ7e5seOf8zLQh8bLWa/7HH+xbv+HmV7Y7sb/nc0oG392kf+uZ8WlByAh+2uEhO62UceF9QWRWzloQWSq/rK/7qmy5t4b1+R35qLBsi6GaxeBwJgVacssD3hNDkOaBapUe5YVmtonOiiibKsP2OdRdTfaPJi5BHMbA9cwdATxKRJHvEfiebrbSFTE/kCYPchgTuUsy9AAoOT0VMU8hHF3rbPuaVeGHG45O5XK2qyHP/mm/y5hy3z6YcBYwG5qA5b9LKOTuE2FKTvelI3jSjGOFnhX5lPFmC6a5uK042BdY1s+SxyAWjjKY9T9EQiskptEFSpfoJqi1iOa3aDWI7sZRS+APy2OSiLOsuFYNFsMWztrlMSZWeE1uzObsMaapbwcHeEMYwEbL5dNz0KHWsIZBVFxffPwsk7Sfpgvb9T64CYy65/xCol900uky/UD50ty5G8aBzQF2Ym3078q7WcjnrnQi3r5itGzlWvewN/yF1Xt90yOP9k/tAKC5btGLJ9Escn/ZKh0EvSfFFKQnY+xOA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(366004)(376002)(39860400002)(186009)(1800799009)(451199024)(966005)(71200400001)(6506007)(6486002)(53546011)(83380400001)(478600001)(6512007)(6200100001)(2616005)(91956017)(2906002)(26005)(41300700001)(66446008)(66476007)(66556008)(54906003)(316002)(64756008)(66946007)(5660300002)(8676002)(4326008)(37006003)(6862004)(8936002)(33656002)(38070700005)(36756003)(86362001)(38100700002)(76116006)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A74A235197C1BC4A847CD5BB35E153A4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8672
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1c76ea92-0864-46ad-64aa-08dbb05a763c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xrZnBriCxxVfdj6S0KASXntHiQ2FoGtApcz8tvQnxoPOgSiWOaNsUuGj3hyUF0U3VPy3xPyp5W+n68xAVPjpzCaH/mBlZuJn85VwsBvEVnFW58HT4A+1BWGdB/ZEiRNsU+BQV6IOJ0D814NdvkUkXUAIDBgq++SUlVFeh3lNIpE7kZqgDGfFZc8mHvmgVxR0VvcKaIE3wKSO1dW97YucddQZFZYXMYUQOsnlD/clsEkJwQG+6trKWIdTQ5e8NgY2QsF3+7qLvJ6MNqwadAVSGjjcDty6gOUZFZvSW71DQON9fqPQZCQwp2Jc0nDBLdRqy7fb8xhHrxzZDgd2J15hgW6xTWLuSIgaDVM6D076/C2GRRpmu7B+UJyEYyAuaxHIWxYDfmInmyHygKZy0hfTA8tOHKbAOdRSZoQirjJtoA+V9UkKwANf1a/NgIqA7In5ZDflw7VnPiX3tessIJ63nWDRN/48AKguW3K7jD1umXzCvZqllrGLhpRHEVy/kIa0bxCnZtVA9WiCpYfamc9LnllNB/Slj6+XCW4e7KeK1ZSTFco9PmefO9CkU/Tf2MaA7ufH+UI3GhuVeCzq37VuMlIZKzl9DW+Qu0DkVAjJ1/VYYIcXzTmXFhkNhYpkAgV8Rn9BJLQgsM/bRBlXui8WZKwMzCghI7HQDDjcPniI1g3hRsGK6oL7CCEjA9KDk+SWmCdXD1M4CwvJR2NxsbKpVxJhKVFEQ9p0sdruAvq+C0M=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(376002)(396003)(136003)(1800799009)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(6486002)(6506007)(53546011)(6512007)(478600001)(41300700001)(83380400001)(2616005)(966005)(336012)(26005)(6200100001)(2906002)(54906003)(316002)(37006003)(4326008)(70206006)(5660300002)(6862004)(70586007)(8936002)(8676002)(40460700003)(82740400003)(47076005)(86362001)(33656002)(36860700001)(36756003)(40480700001)(81166007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 10:58:11.6887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8c8238-761c-4852-21e4-08dbb05a7e68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 10:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187410

T24gNiBTZXAgMjAyMywgYXQgMTM6MzAsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPj4+IE9uIDUgU2VwIDIwMjMsIGF0IDA4OjI5LCBZdXRhIEhheWFtYSA8aGF5YW1hQGxpbmVv
LmNvLmpwPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IGFmZmVjdGVkX3ZlcnNpb25zIGluIGtlcm5lbF9j
dmVzLmpzb24gZG9lcyBub3QgbWVhbiAiZmlyc3QgYWZmZWN0ZWQgdmVyc2lvbg0KPj4+PiB0byBs
YXN0IGFmZmVjdGVkIHZlcnNpb24iIGJ1dCBhY3R1YWxseSAiZmlyc3QgYWZmZWN0ZWQgdmVyc2lv
biB0byBmaXhlZA0KPj4+PiB2ZXJzaW9uIi4gVGhlcmVmb3JlLCB0aGUgdmFyaWFibGUgbmFtZXMs
IGNvbmRpdGlvbmFsIGV4cHJlc3Npb25zLCBhbmQNCj4+Pj4gQ1ZFX1NUQVRVUyBkZXNjcmlwdGlv
bnMgc2hvdWxkIGJlIGZpeGVkLg0KPj4+IA0KPj4+IEnigJltIGhhcHB5IHRvIGJlbGlldmUgeW91
IG9uIHRoaXMsIGJ1dCBkbyB5b3UgaGF2ZSBhIHNvdXJjZT8NCj4+IA0KPj4gVW5mb3J0dW5hdGVs
eSwgSSBoYXZlIG5vdCBmb3VuZCBhbnkgb2ZmaWNpYWwgZXhwbGFuYXRpb24gZm9yIHRoaXMuIEFs
bCBJIGtub3cNCj4+IGlzIHdoYXQgSSB3cm90ZSBpbiB0aGUgZm9sbG93aW5nIG1lc3NhZ2UuIEFu
ZCB0aGF0IGlzIHdoYXQgSSBoYXZlIGJlZW4gYWJsZSB0bw0KPj4gY29uZmlybSBlbXBpcmljYWxs
eS4NCj4+IA0KPj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVk
LWNvcmUvbWVzc2FnZS8xODY5OTQNCj4gDQo+IEJhc2VkIG9uIHRoYXQgZXZpZGVuY2UgeW91IGFw
cGVhciB0byBiZSByaWdodCwgeWVzLiAgSeKAmXZlIGp1c3QgbWFpbGVkIHRoZSBtYWludGFpbmVy
IG9mIHRoZSBKU09OIHRvIHNlZSBpZiBoZeKAmWQgbGlrZSB0byBtYWtlIGEgc3RhdGVtZW50IGVp
dGhlciB3YXkuDQoNCkkgZ290IGEgcmVwbHk6DQoNCiJUaGUgY29kZSB0YWtlcyB0aGUgYnJlYWtp
bmdfY210IHRvIGZpeGluZ19jbXQuIFNvIGl0IHdvdWxkIGJlIEZpcnN0IEFmZmVjdGVkIHZlcnNp
b24gdG8gRmlyc3QgRml4ZWQgdmVyc2lvbiBpbiB0aGUgbWFpbmxpbmUu4oCdDQoNClllcywgeW91
4oCZcmUgY29ycmVjdC4NCg0KUm9zcw==

