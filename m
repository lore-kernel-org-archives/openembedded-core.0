Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FDB8C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 11:43:42 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.79])
 by mx.groups.io with SMTP id smtpd.web11.41731.1710935016184236053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 04:43:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GugzeU6p;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=GugzeU6p;
 spf=pass (domain: arm.com, ip: 40.107.6.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=e6wHazMz5iO0R2y3EooFHaUhtgbGUVJ06fBUGXDq5J1g/cRDPKegRwHHZ6JdEz4dOpG5bMp0eeYkV87S6O7MWd4JaLUocZ12ioUhaqgH7n/g2uoHQ2tZ5QtasN4fEp4K67NGxGQ072mrWZ4cEw8jC+JicmnSzyfvuRkZLpo1YRdm9vMiyaGzXcbBTHZmIEZMqd7rumkuvCZRG5d5rmM4wPjYxbLq4HbaEdIiflTB32j/drjIN6IpgBEwDxw6mQ17GMG8i/lhbJP3lySYKasvUW68ywhg9gzAJe1DEQguzsdvR6oH75su+Uk/HaMtWYZX5sNU/S6mI6zGZJJ7uISlhQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9/vzfDhbVYoj/QtSi+oX195mJcjy3fVcLmjg9MWnRk=;
 b=YinMODop826mkOya2QuMDPKXymw4O9e/AeFotBvTp3X7tif2dVpk/CD3lmSJY4WTjUWKJzg+iQmg91084lXp1SJLpdvi6tzR9vIk5EGKge5LjAVgQNwVG42cHexrvYnAJdRExwW83t7tw52VHJhgOnAttqxYnXWhl5xzMFEHM4ZAV07eKoC0/bj20NW3chppRvjDk1x/xGNZjqGrtNh3FL+0ilehQy1vS37kVI9Ti6zYZ9murtO34Q/TZB2sNoBxQzWMJVtHN0c7dkkSGPqlL7vg3STKYQ3o/yRTk25Zyr3z/jbmiVMTfJ9UAQECTYD2yG5xJMqtW1OpeVY3KVVAcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9/vzfDhbVYoj/QtSi+oX195mJcjy3fVcLmjg9MWnRk=;
 b=GugzeU6pkNl0S4vGb7ehSOWhKH6fyS0wRjRU7GMEbX4siKOHS0DChrWuaH4jLy07FOJGD4IX1QDFqZSKx10TrhOjBzqmmMI5bO5Z8zDvDj8BnRsG7G+WktvPa7wAo2tTWuxAu5q1MyTOGnROBaUQmEs1mrC4+obIA5pkgfMhFd4=
Received: from AM7PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:20b:100::37)
 by PAXPR08MB7333.eurprd08.prod.outlook.com (2603:10a6:102:230::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.29; Wed, 20 Mar
 2024 11:43:32 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:100:cafe::56) by AM7PR02CA0027.outlook.office365.com
 (2603:10a6:20b:100::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Wed, 20 Mar 2024 11:43:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 20 Mar 2024 11:43:31 +0000
Received: ("Tessian outbound f0b355493f75:v300"); Wed, 20 Mar 2024 11:43:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c3b800d099d4fc67
X-CR-MTA-TID: 64aa7808
Received: from daaf00ba960c.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id FC273B55-B593-48E9-BDDF-694D4804BC8C.1;
	Wed, 20 Mar 2024 11:43:24 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id daaf00ba960c.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 20 Mar 2024 11:43:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTDjjeW5N1o3SFAPK6yTVbQCAx9NC11+TLVjgHJyUiUSRJEGT18IEDFytjr0y6LZvem9coPCoi3iAuu5dkmwpFKjgIMWdX39/yXSbK5jKl2/IW/n5p6c88OHdxAldsdBGbpIJVwEcPkmFFpG3yvbDZsj/DKphCAwx5neQfWL7JlW6xr7N7SYI7ShOw5JCilLMbWjXgtdLZcQth98oQ9lH+O/BHq050UsMfduZrONT3FrXmTL7v0Uc3iCrywq9GOlA72JxmZI/6l/ORmTk5vSQ9ungPJOUory1fyT+HHsIh663yvcy1MRQ05jjZ47nO0HG8oK17xJEPfQaJvjs6bdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9/vzfDhbVYoj/QtSi+oX195mJcjy3fVcLmjg9MWnRk=;
 b=GRxTYKPC9g0W0lkkLgV3OZ5kIg6P4Gx0cpSaI57V2y8jKVPzu1+p09UdixzHjbcfG7V0+AHThmB5u43zMrKDulQQc62Vlq6v9dvqq/+g+1f8bLQs62nmDQr0kQWqBvTwYm7GcmK7rM9dAos45l7DmrPh2vrWdz1zTR3mqhp4dcRG5RduYfTT1iNezTfClIH2Q9e26KjEh3EWiuwqapR+4fdOcJvXEEj7vLyXb4AKz3yDcL2U6gb7JHOnWYPcjBKCMrJmYsDxDKaWHga1THhy97eYNXsQ+XOA7JmLBYyHL90zrzmNGTDBoBz6NBii9UazX5oLw1q30HodvJ+Umz8SsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9/vzfDhbVYoj/QtSi+oX195mJcjy3fVcLmjg9MWnRk=;
 b=GugzeU6pkNl0S4vGb7ehSOWhKH6fyS0wRjRU7GMEbX4siKOHS0DChrWuaH4jLy07FOJGD4IX1QDFqZSKx10TrhOjBzqmmMI5bO5Z8zDvDj8BnRsG7G+WktvPa7wAo2tTWuxAu5q1MyTOGnROBaUQmEs1mrC4+obIA5pkgfMhFd4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9481.eurprd08.prod.outlook.com (2603:10a6:102:319::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Wed, 20 Mar
 2024 11:43:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 11:43:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "f_l_k@t-online.de" <f_l_k@t-online.de>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][RFC][PATCHv2] glib-2.0: update 2.78.4 -> 2.80.0
Thread-Topic: [oe-core][RFC][PATCHv2] glib-2.0: update 2.78.4 -> 2.80.0
Thread-Index: AQHaerNjPT3JZuGKwk6VYrs32pEDxLFAemcAgAAC4oCAAATigA==
Date: Wed, 20 Mar 2024 11:43:22 +0000
Message-ID: <6796AEC0-9AA0-4672-AF2C-ACEECEFFEBE6@arm.com>
References: <20240320104300.757486-1-f_l_k@t-online.de>
 <70D06732-17CB-4BF3-A35C-96C684E011E2@arm.com>
 <V29NAS.S84U42Y5BCDK@t-online.de>
In-Reply-To: <V29NAS.S84U42Y5BCDK@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9481:EE_|AM2PEPF0001C70D:EE_|PAXPR08MB7333:EE_
X-MS-Office365-Filtering-Correlation-Id: b4c714ba-1c62-402b-75f4-08dc48d2f7eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 RvPgEk/fqHH0s22/V6BcvQ0EdijG0T6MZIhR/DiCTX02sIccY6ifLfJ7+4KvlCvguyshNk49tyHP6wsU5RnHh8mUMwa4XHP8e2zcjEVbHFnGeRlQl4f/Igv2or3z1Xz0eb1+M7jhWCU/D2aQ68Va58YYWHWL+J4Pw8tnC0Smt8AlIY/4iI3/0KDj3YGjuqpbY4ecfo7NlZDZWngK4Ed7jsCAo87G2LXXA4cIQCWS0c+K5LwUlOWQPP4pjFYLebJSNZtoyfXy1eOSN1TA8mouo5vg1NHny8dbKMXunHOq9dcbn7X0EYy29z0lbYWLPoI7qgZEpPRX9gFIlKiJhtjUbnCZ1kCV0UY9VeF+v3UAwtynzr3bF4EPGRS4zFQsR4S1gUcWB0/VztdY4L47B1AQle+ZrbygTjyHJTx9Afts09YtsmtglRfZ5gPXTZ5RsDWZqnSvKv7Pxiu1apcO1R8JWD/hj840P2um3Wncp2ByMr9D1FPfO5Xlo4qnlLXKwrqatfxKnSjJmQbrzDQjsB8pJ9TqmZX3045YUYI+lYpGPPB1Tij/TuPcai8eUdjwJ6dddE3J8LqfBAEy9kY1Q85uX7MYpJxtHb30lfH0HrOq5QmF4EUPmOxeMjnGBMYZxqx89yXOEgCIN83Un8T+l8W+zPaYHRmO+CP2FWJ9azCj8DjInR2Vz9R6bDZlqfhsH03bqlOyJyo2mPrRx5gajdH8HlGTCL7t0ABdEp3JXgabIW4=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <25653E3DDCB9D04CB4F4EDCF1ABD64D6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9481
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cb9d48bb-df69-41d1-6284-08dc48d2f22d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wqzr41MgvqTn5BjdIYu67Z0zhHfboheFQz1KDwrlK+Wm4YwbR0YHZj39u871xHNBRkBVWJV3zhfcXfjXsgTzHPX/gA7D+PH1hkRmQTvGwKAHeipFCk1IIGQ0iEffZMsqxyo4Vb15SH3e60UGhOTcMBZ08W2WCiFtIN4J9bjAsIqNDA0Ms5BqAMqApgL9H85yVPXIq0P5PuM67rP4nJp0SEWyXMNtSd5PwAM0v7lNLWqHP/HocUDh4xe3c/7k4WQfiPVYFkpjDawT5vzzWTWaOaYQaLBsBUHDcLTFJFuF3R9ohzRZ/HtE5EtYX0wX0Tp6FuxBRYdXb/5Gdvlpi7HON//Gro7/I78q43yIYHCcG8PhNF+AgE5lEGhKDBwkgk7UOAO+ho7ESfC7oz3d6WrJQblTGRB0JKMcBwhxFDfhIPMf2SphjmXXArx6fNjeTrP2RLA+0Lk8LxtYYmAyDQgCsE0ZAoFeiQDdMY3q7v1Xoqt6Iy/2pCG2DEz0v82o8dS9X1xjsoRynbZ8zMDzUN5SXftsqvEqYq7oHXPRL5F5RMOHVcUgupY7FM7SKVghHx2gnKSL1kYciPqV4x/ooU68HJyViSkzFcOfMzDQjA6aepizOK87nr2DH+6fya7LdCtdDG0OAM91mN7kvUIaMEUD22h27P/oxqE819PsQMoMvvMdnm4CoLgVQK1SiAiWpi9JO5jAVGcpZfc1rQ7Ox/NK5agJseTocmynQ3wJsv7t2+m3ZU6x887g3fourVAVLlXS
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 11:43:31.9034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c714ba-1c62-402b-75f4-08dc48d2f7eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7333
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 11:43:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197359

T24gMjAgTWFyIDIwMjQsIGF0IDExOjI1LCBmX2xfa0B0LW9ubGluZS5kZSB3cm90ZToNCj4gDQo+
IE9uIFdlZCwgTWFyIDIwIDIwMjQgYXQgMTE6MTU6MzUgQU0gKzAwOjAwOjAwLCBSb3NzIEJ1cnRv
biA8Um9zcy5CdXJ0b25AYXJtLmNvbT4gd3JvdGU6DQo+PiBBcmUgeW91IHRlc3Rpbmcgd2l0aCBn
b2JqZWN0LWludHJvc3BlY3Rpb24/DQo+IA0KPiANCj4geWVzLCBteSB0ZXN0IHdhcyBkb25lIHdp
dGggZ29iamVjdC1pbnRyb3NwZWN0aW9uIGFuZCBJIGVuZGVkIHVwIHdpdGgNCj4gDQo+IHwgUnVu
LXRpbWUgZGVwZW5kZW5jeSBnb2JqZWN0LWludHJvc3BlY3Rpb24tMS4wIGZvdW5kOiBOTyAodHJp
ZWQgcGtnY29uZmlnKQ0KPiB8IA0KPiB8IC4uL2dsaWItMi44MC4wL2dpcmVwb3NpdG9yeS9pbnRy
b3NwZWN0aW9uL21lc29uLmJ1aWxkOjQzOjE3OiBFUlJPUjogRGVwZW5kZW5jeSAiZ29iamVjdC1p
bnRyb3NwZWN0aW9uLTEuMCIgbm90IGZvdW5kLCB0cmllZCBwa2djb25maWcNCj4gfCANCj4gfCBB
IGZ1bGwgbG9nIGNhbiBiZSBmb3VuZCBhdCAvaG9tZS9mbGsvcG9reS9idWlsZC90bXAvd29yay9j
b3JlaTctNjQtcG9reS1saW51eC9nbGliLTIuMC8yLjgwLjAvYnVpbGQvbWVzb24tbG9ncy9tZXNv
bi1sb2cudHh0DQo+IA0KPiBhbmQgYWRkaW5nIHRoYXQgZGVwZW5kIChvciB1c2luZyBpbmhlcml0
IGdvYmplY3QtaW50cm9zcGVjdGlvbikgY2F1c2VkIGNpcmN1bGFyIGRlcGVuZGVuY3kNCg0KSW5k
ZWVkLiAgTXkgYnJhbmNoIGhhcyBhIGdsaWItaW5pdGlhbCB0byBicmVhayB0aGF0IGN5Y2xlLCBi
dXQgaXQgd2FzbuKAmXQgcXVpdGUgd29ya2luZyByaWdodCAoYW5kIHVwc3RyZWFtIHdlcmUgc3Rp
bGwgY2hhbmdpbmcgdGhpbmdzKS4NCg0KUm9zcw==

