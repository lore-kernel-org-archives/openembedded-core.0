Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D4FC00528
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 18:50:34 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.56])
 by mx.groups.io with SMTP id smtpd.web11.21330.1690915829965743156
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 11:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZUYyeo1l;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ZUYyeo1l;
 spf=pass (domain: arm.com, ip: 40.107.105.56, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+PVvOwOBn3JdKU7Z/Ny0xvOK0Neqj7369K9g8UTdQQ=;
 b=ZUYyeo1lpyqygD1I46BdkHyKI9+uNWZN5JqEYyxfX9C767ETiYy0c3S9qdXZH3dAdLHDUNUG8UZP1FwJdJxYhwzzhMLGYSUfzlTNeyN+sDeDZyN5OooOgluEmSrJmCG4sH56LFyPSVENb1HP3bUf0PzoOzQ9uNJR0nut4xTFxns=
Received: from AM6PR02CA0026.eurprd02.prod.outlook.com (2603:10a6:20b:6e::39)
 by AM9PR08MB6116.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Tue, 1 Aug
 2023 18:50:26 +0000
Received: from AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::b) by AM6PR02CA0026.outlook.office365.com
 (2603:10a6:20b:6e::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43 via Frontend
 Transport; Tue, 1 Aug 2023 18:50:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT015.mail.protection.outlook.com (100.127.140.173) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.44 via Frontend Transport; Tue, 1 Aug 2023 18:50:26 +0000
Received: ("Tessian outbound d7adc65d10b4:v145"); Tue, 01 Aug 2023 18:50:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0a87e996f9544d00
X-CR-MTA-TID: 64aa7808
Received: from 58dfd4c14288.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3DFC71D2-B7C2-48ED-9E05-B022E4A104F7.1;
	Tue, 01 Aug 2023 18:50:19 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58dfd4c14288.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 01 Aug 2023 18:50:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFfmGLcq1wAKFAfFbt81ja/KT+Ybc5wm/j3QRGQlJxAA//3jb0JeAQtQW7j+PnyDQRp0kzll0r3hUvpJTW/pazJz9180WeJuQfv9XCH22mSuXUfGhL0RXerijUXGp1N2GWxiHp3MTTiKaVC8A7rICpQQuXsVeT/G48BSmKX+NZ6Ek+kmxEQULSxp/qz0iXVWM+Uz5ofhzjLMumr+qe2Up+oP71GsB6AbF8upwvRDdk5yyIcek0+0kxcrOdPtmjbs5PvpD/CKgwMpmw5a+eyPIqIBwVjN2PxiTsfI3m+cJScmsQfZULRNoDDo5Xl+Ve8toG7lFBPW26aJEu8z9jku7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T+PVvOwOBn3JdKU7Z/Ny0xvOK0Neqj7369K9g8UTdQQ=;
 b=cb+s+yUVeY5veT5hUnpYNDdpjFWS8RGv36Be/JHAnMoDAk09xb9yOoBnMMZaHnkwjM6OQrX2Cn1be5i2pEwUmu6BmlIrfUYyoGW4Npnv+uPKRSaDzXJrhvJjh/t/bqOx8mQVL/UrMCef7HVd/8dGBuNhSNAPzufRuC1AVyGDNlzJmrFi7TJDB0vpRs7xopB2QCFW3i2Sm9kHnJQ/QVnalaCi3srgKLagxoXvxPabE5wHgyNTSt8IZeh6YE8m/fOJb8Xwi4SZ2eFcUim7O9Jb5qYeSlJLoXQuSR4Es9m/N+rwEV63tMjGP9DbB5TqOvOi32sELGnCSNdT9s4a9JlVSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T+PVvOwOBn3JdKU7Z/Ny0xvOK0Neqj7369K9g8UTdQQ=;
 b=ZUYyeo1lpyqygD1I46BdkHyKI9+uNWZN5JqEYyxfX9C767ETiYy0c3S9qdXZH3dAdLHDUNUG8UZP1FwJdJxYhwzzhMLGYSUfzlTNeyN+sDeDZyN5OooOgluEmSrJmCG4sH56LFyPSVENb1HP3bUf0PzoOzQ9uNJR0nut4xTFxns=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10374.eurprd08.prod.outlook.com (2603:10a6:20b:547::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Tue, 1 Aug
 2023 18:50:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6631.042; Tue, 1 Aug 2023
 18:50:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "chris.sutton@l3harris.com" <chris.sutton@l3harris.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] eSDK is missing native cross-compiler toolchain and
 compiled target libs
Thread-Topic: [OE-core] eSDK is missing native cross-compiler toolchain and
 compiled target libs
Thread-Index: AQHZxF5kTLb6H85utUyUTqg7O1U2da/VyToA
Date: Tue, 1 Aug 2023 18:50:15 +0000
Message-ID: <0D714194-137D-47CB-9401-C7B2DAB33FA7@arm.com>
References: <KF92.1690198680497382322.XSbE@lists.openembedded.org>
In-Reply-To: <KF92.1690198680497382322.XSbE@lists.openembedded.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10374:EE_|AM7EUR03FT015:EE_|AM9PR08MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: bce33bf2-11ff-4928-4e40-08db92c02b61
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4S08IaZAf2TKTd9HkhTeYC50HWKIud9n4BqDgYZw/MQkSH5V8BeaHwSTrC/VUgVa1mM3R3QBAf/WjKvtYEsfP7FQ9RI7AEtzkNYEl45HamJH8xZWK2Z3/387kTmfRqzVbfYs0JCA+esuPzSjfXtSZgs/RlVJkIZdsYU1nMsr5yOTLtmLDNYDgJLSuQmdpaeznzgiYF/bXdrSyDM02H8doOwEY07zJdUNjTPh/bqz/q3jtC1Yl8YtK4v+CkGgLX8ZUaVP7qbZ+2/WSjkZlvnDJCwR8LjAWOuqaX9X8vjZkV6LrhMtlMcy9FaY4tk9PmJAH9JYqNp5mdxd+ehuTcNyq8JnLQIZdenyVaC8YyLNvFu9uaSGYP+2VLfMXYkPRYjbr3XjmvSH0x777Z0qyvkHNgVhkvlPr5NufyzB23umkA9ARNN3bUt6mbsN1Ui3p/1JPhYJ3Oxjjw5lkPGEqjsvcDVtP62i3VYFJTS1ZlC6ZpvEpAiOYy22JGqrNL4YqhjBPG8KHN5tgA8glSuhak7i7Y0D/WxpthhQ9SDkxxseXVofJh66kA/JAwoqNBzJUPynGZh1jIkBSjZSiqcYsJZYJxltkWbaKi4eGTtzqolkhXZcyM8afCcF5Y/xD+CsKLeOzBxPSrjn1boNKRE5+XsibA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(66476007)(86362001)(6916009)(316002)(8936002)(66446008)(64756008)(8676002)(5660300002)(4326008)(41300700001)(122000001)(38100700002)(66556008)(91956017)(76116006)(66946007)(38070700005)(478600001)(4744005)(2906002)(71200400001)(33656002)(36756003)(6512007)(6486002)(6506007)(26005)(186003)(2616005)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B5D013B49F1441498500710F75011222@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10374
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f27d95e2-5fb9-4294-bf6a-08db92c024d7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A7uuHJWir7gcjoojGWszxas9l/qV0baEqMYPbfFfMlhBED8Ws+CS/54dHgGjyM2/9zhh5VWM4W7zyHX2HfiOW6VHnkl5JV7V1+fydpl0MwLl9fD1Su7/jJP4jnPRJVQDOU5lW/ksRvSWtDT2pGvNF2Ou/q/T2G3DQwNakxemABmw9vsJzbk9fQSKePq1i06uYKkhlQ500eoETcatfNDovfAFxt7+urzsKk5K1G6dQg4urrB4e25PE3faYAyhqQN5mTF26yz9sEvbx7TxyrP3G7Mv8COeO7sMKZW40mgp3kwBLdnSDUXNqempXP9ABUDKYpBgkdGsn1U9wY2cU4/oMTuRYzVpQGfz/pQ41qrf1WXH/5/fszvZTMDMrVr3q4q8riXfDec+xNDEsYBqHHUzSM9zIrsnNx5wuZbeo7Se7GwniXsXJ1X0hKcJlJNbbmWUudBZTtI1j/FsSiakxDxyPCIomD4rgw7IwpCj/dhdqUDsJYLGFj4b2OqIEg6R1Ti3qrSy6ms+AV+rOx+/TeAEQ/kyP7fQyHy5I1jpKZy6AKKT6+IjhkQ8pYyjmBw5wIw1zh0kHst2mcNUcqmqEh3Kyim/emc4OYS7hYu6IYlh4YDYWoWobP48enXhAKZTmfZ/kNTdPuBRzlWNI93uaOLe2ynWC5/pCOuReuCqdtYBrU4J1ocbK1XmscQC43yvn57BWHZHpAnI3rKHt4x4Fi3A4iIXflbgIH3lZN4qN6KtkteBu5sDgipV9r1ZwzMRlxXh
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(186003)(8936002)(8676002)(6862004)(26005)(41300700001)(4744005)(2906002)(5660300002)(36860700001)(47076005)(40460700003)(336012)(2616005)(40480700001)(86362001)(81166007)(478600001)(316002)(82740400003)(6506007)(33656002)(6486002)(356005)(70586007)(70206006)(4326008)(6512007)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2023 18:50:26.1605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bce33bf2-11ff-4928-4e40-08db92c02b61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 18:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185361

T24gMjQgSnVsIDIwMjMsIGF0IDEyOjM4LCBTdXR0b24sIENocmlzIChGUCkgLSBJQyB2aWEgbGlz
dHMub3BlbmVtYmVkZGVkLm9yZyA8Y2hyaXMuc3V0dG9uPWwzaGFycmlzLmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gIEnigJl2ZSBidWlsdCB0aGUgZVNESyBmb3IgcG9reSBo
b25pc3Rlci4gSG93ZXZlciwgaXQgRE9FUyBOT1QgY29udGFpbiB0aGUgY3Jvc3MtY29tcGlsZXIg
dG9vbGNoYWluL2NvbXBpbGVkIHRhcmdldCBsaWJzLg0KPiBJIGJ1aWxkIHRoZSBzdGFuZGFyZCBT
REsgYW5kIGl0IERPRVMgY29udGFpbiB0aGUgY3Jvc3MtY29tcGlsZXIgdG9vbGNoYWluL2NvbXBp
bGVkIHRhcmdldCBsaWJzIGJ1dCBvZiBjb3Vyc2UgaGFzIG5vIGJ1aWx0LWluIFFFTVUuDQoNCkkg
Y2Fu4oCZdCBzZWUgYW55IHJlYXNvbiB3aHkgeW91IGNhbuKAmXQganVzdCBhZGQgbmF0aXZlc2Rr
LXFlbXUgdG8geW91ciBzdGFuZGFyZCBTREsuDQoNCj4gSSBhbSBjb25mdXNlZCBieSB0aGlzLiBJ
IHRob3VnaHQgdGhlIGVTREsgY2FtZSB3aXRoIGEgdG9vbGNoYWluLCBidXQgaXQgc2VlbXMgbm90
Lg0KPiAgSSBuZWVkIGJvdGggdGhlIGNyb3NzLWNvbXBpbGVyIHRvb2xjaGFpbi9jb21waWxlZCB0
YXJnZXQgbGlicyBhbmQgUUVNVS4NCj4gSG93IGNhbiBJIGluY2x1ZGUgdGhlIGNyb3NzLWNvbXBp
bGVyIHRvb2xjaGFpbi9jb21waWxlZCB0YXJnZXQgbGlicyBpbiB0aGUgZVNESyBidWlsZD8NCg0K
ZVNES3MgYXJlIHByZXR0eSBtaW5pbWFsIG91dCBvZiB0aGUgYm94LCB5b3UgbmVlZCB0byB1c2Ug
4oCYZGV2dG9vbCBzZGstaW5zdGFsbOKAmSB0byBpbnN0YWxsIHRvb2xzLiAg4oCYZGV2dG9vbCBz
ZGstaW5zdGFsbCBnY2MtY3Jvc3MtYWFyY2g2NOKAmSBvciBzaW1pbGFyIHNob3VsZCB3b3JrIEkg
YmVsaWV2ZS4NCg0KUm9zcw==

