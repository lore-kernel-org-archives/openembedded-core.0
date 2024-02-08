Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE36C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:03:07 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.87])
 by mx.groups.io with SMTP id smtpd.web10.1001.1707415378350472985
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 10:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DGZgyG3O;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DGZgyG3O;
 spf=pass (domain: arm.com, ip: 40.107.15.87, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VdwMabZqHaLndGKfK9vcqHtZtdmvmnUoBQbZO+4b9uN6mMUhP6uYSw16hB+DIvi3uUm2ivsYdXU6v0s5mECgh6bAYwxXLZV71eJ05dbz3PL+DvXlBVwa/GGM0qL+7Yfe1YwKEdYH5ox4+qa40U8H7FJmTkTdiWPvd6LCvHVmWlChlK59mENuQp5rgu/F2vDEXE65WbDLTiD2wxD+ofAg+mfHl5haNSUDGV0vs5oOYebAXp8ZdTsqvt+9wUs2qFMWqk0xFiORb1R8W8xEvZevSe8co4qm2jY4DCTwu4ET/Ogp2p0ZaDoM8Khw0TXRn8/DEPG6SUcjMeqVTjLypxa+rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8jV99fJ8g+X9q/oX1DpBgKFFTf/+h0wKe2vmduP5Qw=;
 b=Z7zTxnqBlgonfFwPrEzo55qnHeVMZjn8Ha+iEuIMXE/VF5uSad6DVHabJOwHeJDmnEJOrJeQlGVevhMaTtJv8Lu7dpRCmPVWIRdIh/CghsnNvrM2GfPJqCAUieze4nhE7KpPOtOKsykfAnH3zE+7lKXuDQi0Z7vsqhWDqsnz/kS21ACx39wFTMAKBLZvtJYFY75aQv4pV/6rJytGAxPettKwFw4sAHVPnNGDn7OAst+UG6v5zGS+PRfa8KxYb3FrfYc6ip/5cB+M4h1lUOhK0zV1AI8QCuvymScpuK2NMTosoym4ewSX5gs2VlMVxj0KjVhFirAL5/1cJo5aecu7Mg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8jV99fJ8g+X9q/oX1DpBgKFFTf/+h0wKe2vmduP5Qw=;
 b=DGZgyG3O7U17VrGD/v/3IlzRmvoUhCe+4iTpQpkWtL+wClmRNcnNMu9gZQ4u34cvlL6G+XU9Q5tbVoQs7zb1gqOBm+tUM9U+7rv+Lt16jdVt29MsHT+9GzifvWMmwJgxMGVXD+EqSyB4YZmWpfoXK/BY6RxO/rdGFUXeRHfA4sQ=
Received: from DUZP191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::20)
 by GV1PR08MB8107.eurprd08.prod.outlook.com (2603:10a6:150:94::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39; Thu, 8 Feb
 2024 18:02:53 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::7e) by DUZP191CA0008.outlook.office365.com
 (2603:10a6:10:4f9::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37 via Frontend
 Transport; Thu, 8 Feb 2024 18:02:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Thu, 8 Feb 2024 18:02:52 +0000
Received: ("Tessian outbound a297577ee0df:v228"); Thu, 08 Feb 2024 18:02:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee8ded9a0c893606
X-CR-MTA-TID: 64aa7808
Received: from 087035a374a2.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A42548A9-8679-4D15-B7BE-66490C0ADCBD.1;
	Thu, 08 Feb 2024 18:02:46 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 087035a374a2.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 08 Feb 2024 18:02:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOXP71iPZMaqGje0n4h6H5OjOdI1upJsVlniPTpcbDJr2YGI52gfllK1FTkrAySFj5xxTrflTImXw/1xumYA1cUiOQJ3HvgiDIJNGB4Krrh5t0XFc9Z1GdMIQBlr2oRMorzQJdJvf0BE5CucO2sKpzB++n4FyO1R4E99wA5liWdQUxzU4GUqj0EgaHHY7aOBlFP6bo3/HIXpLNXXb3hweYYlxvz5ylQsnRcUh+eDpRc3wRwR5kPvgsBH7BEkmtkBi3S8jxcTHblVsxHXhkHaf9ys0U+BMeVQoUgJjURFl4M4DKs3FTKFbFn2hnB2ke7l6eoZTax+1rDJWJvvU4hhcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8jV99fJ8g+X9q/oX1DpBgKFFTf/+h0wKe2vmduP5Qw=;
 b=cxUsGbqehR5UCIbB3V1EW6i5oc4+PP6CQ7xjUs4Ew1W4Db6ipUqSWb0xcgsiwsTa3lXiDEtcGeSaONM4Cswwk3sm7jNjSQ4ORrzkCEWXJDoGIh+3c9BYPq9VmmDNI3onPGLqA2PDoQWSFMqYB/44OV0V/1eQZcyZZIsru1HUGEuNi2X7zUJqVj60GzKWIdfpZnK7uHil6DzvZmqbHtlgbK2nGtccJoeD3gCq3mVEn0F05llJ7HSXlX+XcbAYlcHmBzSYfe3p3aGEeMpNZY7grJMhDSKkHCU/fi9UTfRmIJy6gzISBQ/NVkiZX6MMOfqpMnTgxjWN7FC4xv2Z2s2isQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8jV99fJ8g+X9q/oX1DpBgKFFTf/+h0wKe2vmduP5Qw=;
 b=DGZgyG3O7U17VrGD/v/3IlzRmvoUhCe+4iTpQpkWtL+wClmRNcnNMu9gZQ4u34cvlL6G+XU9Q5tbVoQs7zb1gqOBm+tUM9U+7rv+Lt16jdVt29MsHT+9GzifvWMmwJgxMGVXD+EqSyB4YZmWpfoXK/BY6RxO/rdGFUXeRHfA4sQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9677.eurprd08.prod.outlook.com (2603:10a6:10:447::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.39; Thu, 8 Feb
 2024 18:02:45 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.024; Thu, 8 Feb 2024
 18:02:45 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Subject: Re: [OE-core] [PATCH v2 4/4] uboot-sign: support to load optee-os and
 TFA images
Thread-Topic: [OE-core] [PATCH v2 4/4] uboot-sign: support to load optee-os
 and TFA images
Thread-Index: AQHaSp+ZPQApeZ7nKkeI6CXS3z7TZbDsXmWAgAeemTWAANKtgIAMDREA
Date: Thu, 8 Feb 2024 18:02:45 +0000
Message-ID: <04A0E909-F115-482B-839F-99547E8CA05F@arm.com>
References: <20240119061937.1368163-1-jamin_lin@aspeedtech.com>
 <20240119061937.1368163-4-jamin_lin@aspeedtech.com>
 <12ffb6f38cba0eacf365bb36806a1bd2f69771d2.camel@linuxfoundation.org>
 <SI2PR06MB50416E075AE969B6C4A9CEC1FC7C2@SI2PR06MB5041.apcprd06.prod.outlook.com>
 <1c46d3bc00ebe9047e5748e4b4c189cbb91a5ba7.camel@linuxfoundation.org>
 <SI2PR06MB504170D87B4DF9C3B8C2A7DCFC432@SI2PR06MB5041.apcprd06.prod.outlook.com>
In-Reply-To: 
 <SI2PR06MB504170D87B4DF9C3B8C2A7DCFC432@SI2PR06MB5041.apcprd06.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9677:EE_|DB3PEPF00008860:EE_|GV1PR08MB8107:EE_
X-MS-Office365-Filtering-Correlation-Id: 407936de-6c8e-47ac-fcf2-08dc28d02b9e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 WTXeyFgLXn+C96Emtd7zFpz/8k+uhcjAj5eYLsO8uGMK8RGOTzxT3QXkoXTkxrRrUoHzFMs1T6U4FSkc41jXZj3XCYfNGHOjisn0vGOZttjAhXlAkDLKPzZ2NdlX14E13wbQVx1lntd8c7g+kwdWe5WWUcoTECP+NQWuioXFDh42ekvXZDXgoYEIyCY5/wccgB8ukR9vXyDsew6C/0u+7jKUyZ7TvZny1RK+ZIMCDlPWtyvhwtLnPGCOj60W4491P+W0AbOvidwPJu5lJuXqiQ64n4Bms6slOrwrhl8+BZb6ZNomvDmOWkSfKqVdRYMZggxy6Ciqm+os7zHjuwF6vjgI2Y5d56iMgheRBzjGNLM3dts4k67taocXyGAPA7kaTz4gYE4b4vbdM1regvBJcFivvP5NS0mEXTr0GG+XfwcFyYyOp9n7ovhMw367sDUehLsJcqHgVvy13nCLOjIAa7rQ1K4xUxDuIah5liVt5jQSWJO/rz3JQ8S55Rvp9ej9h6o/275oGaCdgE15UD/jxeDIjlLbByW7KMWDoWLdGrhnChD9GdhbTjAAz7vWv+Y0OCN+/Edz/ng0VherbSdfhCQDyD0EEOCEWXkG26xofgs=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(366004)(346002)(376002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(33656002)(36756003)(38070700009)(66946007)(71200400001)(53546011)(966005)(6486002)(478600001)(2616005)(6512007)(66556008)(2906002)(6916009)(5660300002)(76116006)(26005)(316002)(66446008)(54906003)(64756008)(66476007)(8936002)(8676002)(86362001)(4326008)(122000001)(38100700002)(6506007)(41300700001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4805A20BDEEB745A84F52B81E4784CC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9677
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a8d815c7-3e46-4ab6-0491-08dc28d026f3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GzPqNLGR9Gn4Afvmole67LPNn3Z2IF7Wzvlwv8bKacakX4qZV3o6xf++nSK41Se8OysYXhqnbx0EZv2cSqZe2wibCL2gjudNECdKn7R26z7zGLvNSn8VI/FE/QgJlaGoagbCObzN+2rW+Zz5OzeKmdCNT2XHVhx74lsJ3gL3pjwVcBHl1L3203fDnKnaD58k8GG6jo3W/b2tHGm9zDrvPggODWlAjDHiItysFFD/0ccGmk6Cr7wfjjyU4MBfaCXWMkLigg45ECbcgvRtkqZfmU+xu0MT41pv1dGQs/H+uG2Pe2cL7n5mbQzxBeTRNMMPNot+7lGTUSOJuxCFmWPCP6RC3RFIbFV0Sdi+bgECtIwjLtWpzCgmA9hel5PXF5W/JWU75DzS+QLYyXvbRC1DJR9XA9j5MrDigqwu/oJp8FYfLcwSYolMn15wt2A5lhgAYthhKpHT1irjvdl+5CWijWaHEWHCgCq2wMvwMzDgqF6m9GY3SiBDe0OSPtP0lVjBilbdqm5nUwwCBRFrAYfh8ch2N9uD2G7oc8uux5QweAn13GDdq1YcsQvvpeCTaaN3j3gVAOxtxNQuspDF2SnwFQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799012)(64100799003)(451199024)(82310400011)(186009)(40470700004)(36840700001)(46966006)(8936002)(8676002)(6862004)(4326008)(81166007)(86362001)(82740400003)(356005)(33656002)(41300700001)(36756003)(54906003)(2906002)(70586007)(316002)(5660300002)(336012)(70206006)(26005)(6486002)(966005)(2616005)(478600001)(53546011)(6506007)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 18:02:52.9916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 407936de-6c8e-47ac-fcf2-08dc28d02b9e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 18:03:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195166

T24gMSBGZWIgMjAyNCwgYXQgMDI6MDAsIEphbWluIExpbiA8amFtaW5fbGluQGFzcGVlZHRlY2gu
Y29tPiB3cm90ZToNCj4gSXQgc2VlbXMgdGhhdCBJIGNhbiByZWZlci9tb2RpZnkgb3BlbmVtYmVk
ZGVkLWNvcmUvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9maXRpbWFnZS5weShvbmx5IGFk
ZCB0ZXN0IGNhc2UgdG8gdGVzdCB1LWJvb3QgZml0IGltYWdlIGZvciBvcHRlZS1vcyBhbmQgdHJ1
c3RyZWQtZmlybXdhcmUtYSkgYW5kDQo+IENvcHkgdGhpcyBmaWxlIGludG8gbWV0YS1hcm0gbGF5
ZXIgaW4gdGhpcyBkaXJlY3RvcnksIGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvbWV0YS1h
cm0vdHJlZS9tZXRhLWFybS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy90ZXN0cy4NCj4gDQo+IFJl
Z2FyZGluZyB0aGUgdS1ib290IGZpdCBpbWFnZSBnZW5lcmF0aW9uIGRlcGVuZGVuY3ksIGNhbiBJ
IGFkZCBvcHRlZS1vcyBhbmQgdHJ1Y3RyZWQtZmlybWVhcmUgZGVwZW5kZW5jeSBpbiBtZXRhLWFy
bS9yZWNpcGVzLWJzcC91LWJvb3QvdS1ib290XyUuYmJhcHBlbmQgYW5kIHRoZSBjb250ZW50cyBv
ZiB1LWJvb3RfJS5iYmFwcGVuZCBhcyBmb2xsb3dpbmcuDQo+IA0KPiBkb19jb21waWxlW2RlcGVu
ZHNdICs9ICIgXA0KPiAgICAke0BiYi51dGlscy5jb250YWlucygnVUJPT1RfRklUX09QVEVFX09T
JywgJzEnLCAnb3B0ZWUtb3M6ZG9fZGVwbG95JywgJycsIGQpfSBcDQo+ICAgICR7QGJiLnV0aWxz
LmNvbnRhaW5zKCdVQk9PVF9GSVRfQVJNX1RSVVNURURfRklSTVdBUkVfQScsICcxJywgJ3RydXN0
ZWQtZmlybXdhcmUtYTpkb19kZXBsb3knLCAnJywgZCl9IFwNCj4gICAg4oCcDQoNCkl0IGZlZWxz
IHRvIG1lIHRoYXQgd2XigJlyZSBzbG93bHkgY3JlYXRpbmcgdHdvIHBhcmFsbGVsIGdlbmVyYWxp
c2VkIGZpdCBpbWFnZSBjbGFzc2VzLCBvbmUgY2FsbGVkIOKAnHVib290X3NpZ27igJ0gYW5kIHRo
ZSBvdGhlciBjYWxsZWQg4oCca2VybmVsLWZpdGltYWdl4oCdLi4uICBTdXJlbHkgdGhlcmUgc2hv
dWxkIGJlIGp1c3QgX29uZV8gZml0IGltYWdlIGNyZWF0aW9uIGNsYXNzIHRoYXQgY2FuIGRvIGV2
ZXJ5dGhpbmcgaW4gYSBnZW5lcmFsaXNlZCB3YXk/DQoNClJvc3M=

