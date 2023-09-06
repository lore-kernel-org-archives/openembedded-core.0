Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B3BEB8FB7
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:30:22 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.50])
 by mx.groups.io with SMTP id smtpd.web10.7314.1694003417987298462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=v0c9rYkw;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=v0c9rYkw;
 spf=pass (domain: arm.com, ip: 40.107.8.50, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idKjjTB3qHWwkVBoqqg1AjT5bPotetJuLjigH5qWhPQ=;
 b=v0c9rYkweaf4UwFPjjUQ0zxif5QrJrJIjKDRPOsw6s/lygVsx1V/ndWU1XpCgI8ZRT1rBHws8yiFe1yd0Z/qScY3vmCB/O2UWx02+9P/SAXoPRsWed8i5biRTMDzYfU8JuJDpxyWhUhJQiEz7Xcc8LkEqtA18nciGNUefaCLcHg=
Received: from DB9PR06CA0004.eurprd06.prod.outlook.com (2603:10a6:10:1db::9)
 by DB9PR08MB9513.eurprd08.prod.outlook.com (2603:10a6:10:459::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Wed, 6 Sep
 2023 12:30:14 +0000
Received: from DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::af) by DB9PR06CA0004.outlook.office365.com
 (2603:10a6:10:1db::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 12:30:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT025.mail.protection.outlook.com (100.127.142.226) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6768.26 via Frontend Transport; Wed, 6 Sep 2023 12:30:13 +0000
Received: ("Tessian outbound b5a0f4347031:v175"); Wed, 06 Sep 2023 12:30:13 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a59459c744f52731
X-CR-MTA-TID: 64aa7808
Received: from ddc7f7d02482.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 773C985B-686F-4F95-8398-7E5D73E97505.1;
	Wed, 06 Sep 2023 12:30:06 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddc7f7d02482.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 Sep 2023 12:30:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gb8feIpL/yrYTBQj7AUATd237FyjTWSlyfCIGE5JwQ3ENOt7UomJiLnr7IG0TU9tK3Ex9j8XxAV3L9JJZWwJyEeuX5u8pF/30yMnM8PE6tQBGuGt8PZArnJnYIr9W0+pC2h26iHJVNF8s8SroahOqq4rCIYeswY4ou0rMRALQ90Nvun324mXD7Hg4qALD9nBasjy8TPmBoMfED4nNpuei8JiMUzTxJW05NVQ1yjJaa8Icqkqixrf/am38qfQirTj5Z3A7JQZNPZW5md2LDKRGAKAnzJ6Iu6Uz1l56oiT+5jHkWCWqYC3C53knwnlkZXdym+ZlKc/MSXXJijkNriFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=idKjjTB3qHWwkVBoqqg1AjT5bPotetJuLjigH5qWhPQ=;
 b=jxo4lE95sDXcO+P3Wbrro7lenn7U+mhTO2gft25KHRUh3vB4rcZu35JNtsPziZTm2VCv6fUrKATr2wDuWYZwgNR+fS2E9eHa9YmoLTRdgBgUUiH0W+1Ur2pvWKxgGXse0iCnhOAJAmAIbV4m3d0siE7IzJ4fukiKlCGKiaLYe53YED/6HEO76V5/7zNN0DO+ZLp8pTAAXMXBHdb3taEQAG/sPRwIJ3esp3kmlTvhZu2X++9Vo/6rTQh0whcPYtMSgLy0HJ8D/YgSXbqHxoWqmLOCllaEL+zdSdl63/22cCWHYKK2n4NKWvBSICkydh27v1al07fCI1N+1fNKFviI6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idKjjTB3qHWwkVBoqqg1AjT5bPotetJuLjigH5qWhPQ=;
 b=v0c9rYkweaf4UwFPjjUQ0zxif5QrJrJIjKDRPOsw6s/lygVsx1V/ndWU1XpCgI8ZRT1rBHws8yiFe1yd0Z/qScY3vmCB/O2UWx02+9P/SAXoPRsWed8i5biRTMDzYfU8JuJDpxyWhUhJQiEz7Xcc8LkEqtA18nciGNUefaCLcHg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB6029.eurprd08.prod.outlook.com (2603:10a6:102:e7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 12:30:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 12:30:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Yuta Hayama <hayama@lineo.co.jp>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux/generate-cve-exclusions: fix mishandling of
 boundary values
Thread-Topic: [PATCH 1/3] linux/generate-cve-exclusions: fix mishandling of
 boundary values
Thread-Index: AQHZ38rneEAaKASlD06cB4kT83ofHLAMFKmAgAD1nICAALHRgA==
Date: Wed, 6 Sep 2023 12:30:04 +0000
Message-ID: <097A1A90-C4FA-4D2D-9FBA-193ED9D4D5BF@arm.com>
References: <20230905072920.615-1-hayama@lineo.co.jp>
 <C799CA2F-53A9-47A7-812A-73DC55F64073@arm.com>
 <5e19b8ff-358e-0b6b-2fd4-f7884ddd280a@lineo.co.jp>
In-Reply-To: <5e19b8ff-358e-0b6b-2fd4-f7884ddd280a@lineo.co.jp>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB6029:EE_|DBAEUR03FT025:EE_|DB9PR08MB9513:EE_
X-MS-Office365-Filtering-Correlation-Id: b36256a0-eedc-4bbd-cf1e-08dbaed5050f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 EeXr0JxoSdjJtevqMR+rte65jbUW9ac1arYDiS81ogvkzXbFwJWSyEYQbzpRxdtZ1xhrOwlLmemGD0knd6CD0ZsEjQjW3wwp/SHMrOTXZYXwt8g7nV/INvk34hrvC9A4sgEu018YbUh0EF9RiZXbuJet5N+OimVlYZTia4Z5F1ZnUZOEj1rJwwrVQYii5IgexCHNPpxFRARdi0tYeSTxchBbj1x6iLeN3sibIAdY6Jhi5PnMjjqjQci+vtnSysyGYjizeT7nnm7BBNTmAGCi8xgpP61WVdf//VQwBmBZ6roILRhNNd3OSHfq2H1r5lntRR5kkZNU7mr8lPZlJdlusDhnG9HeC3ozKyFIejZFYGU2BqyVRJOhE9IC9UHfZV/npKwI+rVlOtYtdHJrkDTnRgTQk4aJ63V4vMYBhgYiWY9cB5zbOurfubCjfTfpY+lVJFO1jezj12QpNYvso3X4ORI5hs++xPvp5cnhMwPXkabLiBL4JMFwoLkeQgqIN6vEV+ch3b1zsYAJTjkGacgww1RfT3m/5YjetHO+Wr8qztXMyvHC4Igpt/sk9lDAePSJHomWzpr6zaNcPxMizhTezMDkB/QK6gn3PLvAAEepKNAzQo1jOycZPcDSQx68F4PNETX2FNh4lmlaKF02jw+VVA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(366004)(39860400002)(396003)(136003)(451199024)(186009)(1800799009)(53546011)(26005)(5660300002)(66446008)(66476007)(76116006)(66556008)(66946007)(64756008)(6512007)(2616005)(6916009)(6506007)(316002)(91956017)(41300700001)(122000001)(4326008)(71200400001)(8676002)(8936002)(478600001)(6486002)(83380400001)(966005)(2906002)(4744005)(86362001)(36756003)(33656002)(38100700002)(38070700005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <044D9E7A635A294EA032FA4CC5989242@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6029
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dfa4fe37-d6a5-445c-da88-08dbaed4ff41
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IJrrSACJO77vkkKCFtfZVew2kTB+t0iilvetDSTeT7sA6hI3Sd4ueHOiXsD/ZTdsvvO4WFGxDcYQvtxnm7+9Rr2uzBzmL3gGNwzohlIauG9faTmSYGf/GyWNSsJgt+fQ0vUNnFzRbQRXLmJ7Uuyar/wEIFrH+nVHgU3+nIWOF5FkA8/6foqIiVfpD7p5KEZfRr1/fJgoKG4BQi0IDNbV3aCQcSiMvGlcBkJRT6ZvpHOyww9vBXGeRJ205U36rTYw+LyGpdsL+EWpUWO436fAfyZhYSKKt75uoGWpTq6vN6xoNKitChMc5kY6DHTuToTzPwlmDEOOhBBiHkAun65zuHrLvrUbsvcBOCPyJBqCwnBRWEeLbo9uF/9Z+WqOYumm2hfCqcqkgXDdy1SZSoHY1tJqda92/Hqj91y/VXj1PN6RunDznAxzBwv4xz61zv6G0hyicqgDLQ7jfhqVKYz6/TxFVUgUcZ4+WNHpnwwxNxpYcy6ynidnqPdndT1KEmq3UVizLAfwtz2+l3re4r7FF5TqREKe01Rz2bDs1BLXes0NyB3wC2tSwImjiC4bpDddWOg7xg67P5y+0kwi+MxtwcmJNbXVlYT/BBQRdLMI5ffvOyOkdhNzOdTm1vGClektSNcQPlKBcw5jQGOz4nSW/iW6rbC1ZgNuqPjcGJmldDTl5VK8mzyLLUc7lA4fgRYNMSlQNHmSiXSe6aMhkrSwKa2VB47AvfptJOt/Kn4j1y8=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(82310400011)(186009)(1800799009)(451199024)(36840700001)(40470700004)(46966006)(2616005)(82740400003)(81166007)(356005)(40460700003)(26005)(6486002)(6506007)(53546011)(6512007)(47076005)(36756003)(36860700001)(336012)(83380400001)(40480700001)(86362001)(33656002)(5660300002)(966005)(4744005)(41300700001)(316002)(70586007)(70206006)(4326008)(8936002)(8676002)(6862004)(478600001)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 12:30:13.8933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b36256a0-eedc-4bbd-cf1e-08dbaed5050f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9513
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187294

T24gNiBTZXAgMjAyMywgYXQgMDI6NTMsIFl1dGEgSGF5YW1hIDxoYXlhbWFAbGluZW8uY28uanA+
IHdyb3RlOg0KPiANCj4gSGksDQo+IA0KPiBPbiAyMDIzLzA5LzA1IDIwOjE0LCBSb3NzIEJ1cnRv
biB3cm90ZToNCj4+IE9uIDUgU2VwIDIwMjMsIGF0IDA4OjI5LCBZdXRhIEhheWFtYSA8aGF5YW1h
QGxpbmVvLmNvLmpwPiB3cm90ZToNCj4+PiANCj4+PiBhZmZlY3RlZF92ZXJzaW9ucyBpbiBrZXJu
ZWxfY3Zlcy5qc29uIGRvZXMgbm90IG1lYW4gImZpcnN0IGFmZmVjdGVkIHZlcnNpb24NCj4+PiB0
byBsYXN0IGFmZmVjdGVkIHZlcnNpb24iIGJ1dCBhY3R1YWxseSAiZmlyc3QgYWZmZWN0ZWQgdmVy
c2lvbiB0byBmaXhlZA0KPj4+IHZlcnNpb24iLiBUaGVyZWZvcmUsIHRoZSB2YXJpYWJsZSBuYW1l
cywgY29uZGl0aW9uYWwgZXhwcmVzc2lvbnMsIGFuZA0KPj4+IENWRV9TVEFUVVMgZGVzY3JpcHRp
b25zIHNob3VsZCBiZSBmaXhlZC4NCj4+IA0KPj4gSeKAmW0gaGFwcHkgdG8gYmVsaWV2ZSB5b3Ug
b24gdGhpcywgYnV0IGRvIHlvdSBoYXZlIGEgc291cmNlPw0KPiANCj4gVW5mb3J0dW5hdGVseSwg
SSBoYXZlIG5vdCBmb3VuZCBhbnkgb2ZmaWNpYWwgZXhwbGFuYXRpb24gZm9yIHRoaXMuIEFsbCBJ
IGtub3cNCj4gaXMgd2hhdCBJIHdyb3RlIGluIHRoZSBmb2xsb3dpbmcgbWVzc2FnZS4gQW5kIHRo
YXQgaXMgd2hhdCBJIGhhdmUgYmVlbiBhYmxlIHRvDQo+IGNvbmZpcm0gZW1waXJpY2FsbHkuDQo+
IA0KPiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9t
ZXNzYWdlLzE4Njk5NA0KDQpCYXNlZCBvbiB0aGF0IGV2aWRlbmNlIHlvdSBhcHBlYXIgdG8gYmUg
cmlnaHQsIHllcy4gIEnigJl2ZSBqdXN0IG1haWxlZCB0aGUgbWFpbnRhaW5lciBvZiB0aGUgSlNP
TiB0byBzZWUgaWYgaGXigJlkIGxpa2UgdG8gbWFrZSBhIHN0YXRlbWVudCBlaXRoZXIgd2F5Lg0K
DQpDaGVlcnMsDQpSb3Nz

