Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE29C77B7C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 17:34:33 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.79])
 by mx.groups.io with SMTP id smtpd.web11.298.1684949666110654451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 10:34:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QJuXzFWC;
 spf=pass (domain: arm.com, ip: 40.107.14.79, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUBudAp3XI78ggOh58nDJIh2LPDNwCM45owt4aSsgdo=;
 b=QJuXzFWCcaZcu4YscACQMYzZmloDz0jZYFAkJKolDuPofi9v0owu9Kej/+kiDc6eXwMuWjhf3NVGBdRasnEnwNO31iAkbXnOAvwW0i86ZM44hnu7DVRuj3oCGGRtj9CXw4vUTdBjFKewDGfZL+UiYVMXxAJQ2QwhYrYty592k/I=
Received: from AS9PR0301CA0007.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::27) by AS8PR08MB6005.eurprd08.prod.outlook.com
 (2603:10a6:20b:298::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Wed, 24 May
 2023 17:34:22 +0000
Received: from AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::7a) by AS9PR0301CA0007.outlook.office365.com
 (2603:10a6:20b:468::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 17:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT063.mail.protection.outlook.com (100.127.140.221) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 17:34:22 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Wed, 24 May 2023 17:34:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1687e8927718cfb
X-CR-MTA-TID: 64aa7808
Received: from 5d0dfebc5f70.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CC8FB745-C778-4F87-9162-7301E1E10F7D.1;
	Wed, 24 May 2023 17:34:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5d0dfebc5f70.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 24 May 2023 17:34:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICUWy5ihMw0zxwy6Yom4kdFBuMPngkBLdlGWl0rgvyKAaJq7qYMXSFy/MRxClIjV7H3TIL+Te+avb6+I0fTkvyBG5M2MOnyCSPeduCWNscvLMuNV56IdaLUUqjARfRsHodxBHbwVKApkUshK39/y7dwH8hk0XIOjxk/VAnG5kDgtX+/C3hdqBF7O5srLGqsoAlOZ7D0jlo4RpTcxP+nKN4gNoCi+TGN02EGXWStLtBP/YUTMHOIDi5l9Unp9u9wxXvkr16NL06a4mQn+lwUhz9hNF2xpG1Td8zQ4nnmNHYK4FE/1gzwAWm2H149ftu+e35hzddfElcjjXuA9AKvm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUBudAp3XI78ggOh58nDJIh2LPDNwCM45owt4aSsgdo=;
 b=juwXDaICLEWzNm4qYJ6XLgN+LwYXWMASPfI+Ars5KHxLpxP7eOVuB9fz/4Mhz9q2wgUFs1BSXyYKnppcpcgmtAWHwvr8nOx90VJyw6GSwYjvNzUyeHjLqy0skoTj8KJ25o+CBx48dW4DqPiXH9TeDrpyFDGTSmFIUaMcTD6Z4t0slE7IWAWMbX/4cIMWInndiSfHn0gd/KxpZukazPlApqjLa3EM0xNiCqoCYbHacyaoiV+3Z/BEZlxgDB+WdtUkTRxHZkTSX/zxJfLO3RGUgTpdmXwG6ImL0uMbuKVHo2drKF8lKRORjw7gPlAtFBB9f32nXqUVLz0tyyGBlRnqKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUBudAp3XI78ggOh58nDJIh2LPDNwCM45owt4aSsgdo=;
 b=QJuXzFWCcaZcu4YscACQMYzZmloDz0jZYFAkJKolDuPofi9v0owu9Kej/+kiDc6eXwMuWjhf3NVGBdRasnEnwNO31iAkbXnOAvwW0i86ZM44hnu7DVRuj3oCGGRtj9CXw4vUTdBjFKewDGfZL+UiYVMXxAJQ2QwhYrYty592k/I=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9748.eurprd08.prod.outlook.com (2603:10a6:102:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.29; Wed, 24 May
 2023 17:34:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:34:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Peter Hoyes <Peter.Hoyes@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
Thread-Topic: [OE-core] [PATCH] rootfs-postcommands: Set vardeps for
 write_image_test_data
Thread-Index: AQHZiNzM5otCvoyuyUS6G/cu21+4U69oIBaAgAGRAoCAAAj/gA==
Date: Wed, 24 May 2023 17:34:03 +0000
Message-ID: <7A137C75-0439-430E-9903-8DB0C65698AB@arm.com>
References: <20230517162906.2395999-1-peter.hoyes@arm.com>
 <F3C8EF1B-E5EA-4357-8977-1FCC0F5E553D@arm.com>
 <5e29f9a6-c6cd-a33d-ecf2-03562ded28d6@arm.com>
In-Reply-To: <5e29f9a6-c6cd-a33d-ecf2-03562ded28d6@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9748:EE_|AM7EUR03FT063:EE_|AS8PR08MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 354c73d2-1eab-49c5-0e94-08db5c7d1c9e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NbLLgm1UG2kP94YLbs+okwTOf185R3tPbjpmGBshOWOig84/H21ypCbllpHK430fig7/uMwMB4PDj/oHJ47/sNx8pDikpKWkQTH1uvxW+9q050BGGuD4UEkD9Q0y2CLJgOJ6EdvSUYPYldJiKC+vUhTXGt+GhsXnm5vM5ocI5LrqzsLGTEBkWlO1SYLlaUMP2ciu6ouYajQiuz4mQ4R67vOkcw4K5c21Dg2I4clsblR3l22iO18vz74UB4TDBJhGeGm5Hi0V+Lo5qCAlc1E0daZKha4t31oQT16eg47+ap3jZVGe+Xc2eVcxlP8Cp3WC0xfxY1XUr4gLxnIwThkUAMZRT0R/AuzIe8dUmWBXHwccsxRETaOux07dqjMnHrCXey8TZnaXwvTOLB65+OhXI8f9+Accuf5yA3xswiMj9toJv8v/P4M/Xr7ZPA4OpOZrgntKOQHfefwJOly70TfK3YJSXDovZ8n04mWxGfTkWhDxDMvfe+bCnIRM9irceMpi+gkYuYhLs9qp7B7wd+8IvGjOdIV7QdYaDkSfA/BmdZRGimdzvPz8tHN/fUfKtxWe1C/rZj4n8E/aJnU5rL5b3AyKtLnWSzIHRSW5kkLwOhxAR7wEAqOojxPOhdIK5/jTsXGQWOSDm9l92LAeK8onrA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(39860400002)(346002)(136003)(396003)(451199021)(86362001)(37006003)(41300700001)(6486002)(478600001)(316002)(91956017)(6636002)(4326008)(66476007)(76116006)(6666004)(66556008)(64756008)(71200400001)(66446008)(66946007)(5660300002)(38070700005)(8676002)(6862004)(8936002)(38100700002)(122000001)(26005)(33656002)(6512007)(6506007)(53546011)(2906002)(4744005)(2616005)(186003)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7746251A4FA6494F89A41983800D6EAB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9748
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1e15c836-7bb5-4dc4-ae4a-08db5c7d1176
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	suF538l2Txn1hHAolfbxqgrP9zQHa8HcQchquJYqv4YPtv1jEkK9mihamktP57V4a15ka78fbII6Pf151akRpgFRrWVWDcteCfDR+4qEC62zYKdtc6uhRDt70dwJSEXXBhEJkk9/e0ibC7UQ2sanEZoRuzxIUWtT50oE5kuzHvk3gw+w/aymxcYe/YW0A5Y71cfK9yhXTS5snlfl+gQ5IfO3N2RmtMRVvBo4/TNllX724OUXHdggzO5Ka2wGigAZRQ4dQyMJV1kUQwrmDVB/7if0V3rsnRRboi6F5HKICarSYy1Ziliv0AMApCgd7mACRzkyg4K5Kndv2uR/EBwC3HdN0cfiLTzCcUC/zz1Q1gDP6Tq10/+Akfq3OcQJ0elYW/BZK+b1v9VXc+z2hBWg2pqfksdOmLvgoYKxoRTiZsMjfaqj7B15hq6hT+slxrAhY9z5K108YN0wkG0vbvrpVxFpUC18IICZQI7BzTl8lLAqghZSbl1cEVO21dubyk+z/nQip1YVFle6yCbZ0QzD20vStW/gc26l638lzeLaSKlluLuuD50P14ia/zp665sl1VtzzWOtFDDfZLQZqobbri2iJ04GmgjtBeHKQ+4eYublwzZ43LUc9CGpMT9K+3x74kVMTTcOrwGECnVsULOFYyHtE42m7JBLumtiepL3Q1I0v2PyDzxrSaRQbLXqqHRiHb05pWpOQp8uzxzYySC5VjEU5NrozT7As3cjQhc++HjFc4X/FbnXo7KTjaizacZ2
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(8676002)(8936002)(6862004)(5660300002)(47076005)(36860700001)(82310400005)(186003)(53546011)(2616005)(26005)(356005)(81166007)(86362001)(6512007)(6506007)(336012)(82740400003)(40460700003)(41300700001)(70586007)(6666004)(40480700001)(6486002)(70206006)(478600001)(33656002)(36756003)(6636002)(4326008)(316002)(37006003)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:34:22.3376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 354c73d2-1eab-49c5-0e94-08db5c7d1c9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 17:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181689

T24gMjQgTWF5IDIwMjMsIGF0IDE4OjAxLCBQZXRlciBIb3llcyA8UGV0ZXIuSG95ZXNAYXJtLmNv
bT4gd3JvdGU6DQo+IFdoZW4gcnVubmluZyB0ZXN0aW1hZ2UgdW5kZXIgYml0YmFrZSwgd291bGQg
aXQgbWFrZSBzZW5zZSB0byBzaW1wbHkgZG86DQo+IA0KPiAtLS0gYS9tZXRhL2NsYXNzZXMtcmVj
aXBlL3Rlc3RpbWFnZS5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvdGVzdGlt
YWdlLmJiY2xhc3MNCj4gQEAgLTM1MCw3ICszNTAsNyBAQCBkZWYgdGVzdGltYWdlX21haW4oZCk6
DQo+ICAgICAgICAgIGQuZ2V0VmFyKCJURVNUX1NFUlZFUl9JUCIpLCAqKnRhcmdldF9rd2FyZ3Mp
DQo+IA0KPiAgICAgICMgdGVzdCBjb250ZXh0DQo+IC0gICAgdGMgPSBPRVJ1bnRpbWVUZXN0Q29u
dGV4dCh0ZCwgbG9nZ2VyLCB0YXJnZXQsIGhvc3RfZHVtcGVyLA0KPiArICAgIHRjID0gT0VSdW50
aW1lVGVzdENvbnRleHQoZCwgbG9nZ2VyLCB0YXJnZXQsIGhvc3RfZHVtcGVyLA0KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW1hZ2VfcGFja2FnZXMsIGV4dHJhY3RfZGlyKQ0KPiAN
Cj4gICAgICAjIExvYWQgdGVzdHMgYmVmb3JlIHN0YXJ0aW5nIHRoZSB0YXJnZXQNCj4gDQo+IChh
bmQgYSBmZXcgb3RoZXIgYXNzb2NpYXRlZCB0aWR5LXVwcykNCg0KSeKAmWxsIGxldCBSaWNoYXJk
IGNvcnJlY3QgbWUsIGJ1dCBJIF90aGlua18gdGhlIGludGVuZGVkIHVzZS1jYXNlIGhlcmUgaXMg
dGhlIGFiaWxpdHkgdG8gcnVuIHRlc3RpbWFnZSBvbiBhIHByZWJ1aWxkIGltYWdlIHRoYXQgc29t
ZW9uZSBlbHNlIGJ1aWxkLCB3aXRoIGp1c3QgYSBtaW5pbWFsIG9lLWNvcmUuICBTbyBzb21lb25l
IGNhbiBnaXZlIHlvdSBhbiBpbWFnZSB0aGF0IHRoZXnigJl2ZSBidWlsdCwgeW91IHB1dCBpdCBp
biB0aGUgcmlnaHQgcGxhY2UgYW5kIGNhbiB0ZXN0aW1hZ2UgaXQsIHdpdGhvdXQgaGF2aW5nIHRv
IGhhdmUgdGhlaXIgY29uZmlndXJhdGlvbi9sYXllcnMvZXRjLg0KDQpIb25lc3RseSwgbm8gaWRl
YSBpZiB0aGF0IGlzIGFjdHVhbGx5IHVzZWQgb3IgdGVzdGVkLiAgV291bGQgYmUgYW4gaW50ZXJl
c3RpbmcgZXhwZXJpbWVudCENCg0KUm9zcw==

