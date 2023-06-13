Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE6DC77B7A
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 10:30:26 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.51])
 by mx.groups.io with SMTP id smtpd.web10.9782.1686652221966289964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 03:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=fr5OjvYV;
 spf=pass (domain: arm.com, ip: 40.107.7.51, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S5ZC6fa62bSA86PTKdzGgjsKO/7E+z7R8l8Fk37nlg=;
 b=fr5OjvYViXN4lhRtA/oTk+d3LqnhlW2PtwuKTxV10ZwDrCowmX+2hy+ygLLus8Uqt6E01K52uqOYXu4c5JBPQEJvJPRCsygTGtF9Z/XcH/DceCTs1dNe1LcxWrWbtr2B1GrbYOvpVsM+GinC0+7s27Oljy86etMD+c+UaKOhEns=
Received: from AM6PR04CA0023.eurprd04.prod.outlook.com (2603:10a6:20b:92::36)
 by GV1PR08MB8452.eurprd08.prod.outlook.com (2603:10a6:150:84::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 10:30:15 +0000
Received: from AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::3f) by AM6PR04CA0023.outlook.office365.com
 (2603:10a6:20b:92::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22 via Frontend
 Transport; Tue, 13 Jun 2023 10:30:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT057.mail.protection.outlook.com (100.127.140.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.23 via Frontend Transport; Tue, 13 Jun 2023 10:30:14 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Tue, 13 Jun 2023 10:30:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d7cdb7844ca5f522
X-CR-MTA-TID: 64aa7808
Received: from 4fee1b15fbc7.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D02C2FE8-11FD-4483-9767-F2AE4D2A6BAF.1;
	Tue, 13 Jun 2023 10:30:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4fee1b15fbc7.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 13 Jun 2023 10:30:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MVzkFjplsJ9BIoywekLtlE9tvUJg+DiZmICNCJEMY5sg3G5xnOJyv66oERSPybvUJfZJW+yZmCPpSkomLatQPfQHpjfLqYEwgy7ZV7e2yzAtWK+ifyDuoPtFgVkM2C2O7p7s6q/EN+XnLEklU1N2HjUUjxvkzxSl1nxOaQs4k8QLZHq2bsG+/zwSMhHHhTtyjdJQwSAlOoxxOTyft55iMAxxphDNSScBGKBpnhssri+Z6Rs/VKnkvVnXAFQdaiYI3nv+fJfA/LUsHdIrT9cjuihYyefg/1Qcq5KW/CfoJJ1h2/+kfM4TzszebBtVRl+/D0VGcEO/7IeeYLBCpmDtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5S5ZC6fa62bSA86PTKdzGgjsKO/7E+z7R8l8Fk37nlg=;
 b=S+qRhD4X9urSU5ofX9GMo+frqjXwbZBUpxHuEAM2S7ySpWkoTV/QcmjwKOA3dMsxdlNXpqXVtgWWpS7mQV2M/5UYx5UmIRXQO38KmOohKHXn8YJce5XvJ9Pj5xoqEop1coziiVAuV+EIw0yBuOPRelWO/Nv7kaCFu59/j5QJvXOtBapErRG9Z0L1lnarCgNpH/hSUUuXFRNjU69slzHs1/5b97MmeT9de+UQFcypqFj62pg90FP88RQb/unDEHjkY4nV2wAMOkhQqvHNjPUd5gAVCRPI0XWPcsIaFbkr/IRXbmg3v9uoHCcVa0VZHWNHzkJKrNj5DWoBb1t+R5zKoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5S5ZC6fa62bSA86PTKdzGgjsKO/7E+z7R8l8Fk37nlg=;
 b=fr5OjvYViXN4lhRtA/oTk+d3LqnhlW2PtwuKTxV10ZwDrCowmX+2hy+ygLLus8Uqt6E01K52uqOYXu4c5JBPQEJvJPRCsygTGtF9Z/XcH/DceCTs1dNe1LcxWrWbtr2B1GrbYOvpVsM+GinC0+7s27Oljy86etMD+c+UaKOhEns=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9661.eurprd08.prod.outlook.com (2603:10a6:102:2ec::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 10:30:06 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:30:06 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] parted: Add missing libuuid to linker cmdline
 for libparted-fs-resize.so
Thread-Topic: [OE-core] [PATCH] parted: Add missing libuuid to linker cmdline
 for libparted-fs-resize.so
Thread-Index: AQHZnVlHlDF07hvvQUSoXRhsB3gkqq+IiUsA
Date: Tue, 13 Jun 2023 10:30:06 +0000
Message-ID: <A617FA16-34E1-4971-90D8-E696887211D0@arm.com>
References: <20230612181054.674846-1-raj.khem@gmail.com>
In-Reply-To: <20230612181054.674846-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9661:EE_|AM7EUR03FT057:EE_|GV1PR08MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: f9dfc4d5-41cc-4973-86fc-08db6bf92cf4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 K4dDEjDs3/5y8h1hd1ha8d1WWz3ISJDoGeyi36ZUPZp9GXPn5v/qgfoMw+z79kVaI17u7wPcCl/edcR0k8ZQOP4QuIXTO0tP5wehr/v7kyRcxcPTYnMrRGIFkmSgIcQ2FB6cjpq+HSDZcLHezZvlktsX+XNTwX3/qUHLghuWJ/2sGbBLQ8FmGfs+3l1cEeFzogrcyYS0N0gHGEHMNE0/G8Vz8dhQLG2LDpIGZxP+i8QrS8a2dvlp3smfUD5rW0pp270MYtVkwMAbqsl6EO5AXgaZZgCNF3Vrqs62kakeTtzv1929Iedp5IYo98YGvCCSjM7jYaXSnBuUIrUYjLp0V5fRkIznCxsVrikJbxezTNJgfoAcVJNFWMAsBqCXfMQOh5ER3FaVaIgV9/K6ch1CtQc23tURZy7n9iVE+c1ONSr9gt6xD+mPc2O13B6Ns1twzx2XKREP+GxKf6q0j/JdhWfx/KcApOhxZgx5Ee17Qu/zUv91vMBa+cz1crT5Ky2IXDdLVzMKhOeRyhrEXN284vOpjoNXyPH+xe3sQN+qaKEIuiwgoGPVe9dJFR1W5xrTfxU6VG0yVhaR8ADAZHAFa5SipyDWGEoUolQh6+Z5d3jRCkam/b2fSlyGaqIsXWJJO2hmAKLqc5X6H5N7Bdpi0g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(451199021)(66556008)(66476007)(66446008)(66946007)(316002)(91956017)(64756008)(71200400001)(76116006)(478600001)(6916009)(4326008)(36756003)(33656002)(86362001)(38070700005)(6512007)(6506007)(26005)(53546011)(186003)(5660300002)(41300700001)(4744005)(2906002)(8676002)(8936002)(6486002)(2616005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <29125A4BFB2B9046BCAF9C4C043C253B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9661
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	db2bcc0a-1c0e-417a-d535-08db6bf927f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rPQEpNiUNrNiRll7MrmeAKQeahiE9hn6ws9pmFePhJao2Vt/Pf39SdGDyZU1Ejrp9Ygl8OCFefwNk1NPtxtTPIorBpcKfev362sA++O8FfL1JtBbZibhpdK39vhz3uRL53ge6yH95AbcGAmBPbzPJWRDkWXZPF8fpi6PCE/QRgODYAz6DRwqP7PfjOeXYGj/Fg3UeVv7pCFXGeEYoQIReqTHKZthFpYtDco/W/TvbTMA54Zfq5le376vH+1JwbB+t/GsYMXUOHrzxonjreFPdhekOsARiW7murojRpFkewA/Av+h/TM+LcCWSmH7H0/0X8+weC8gMiH9QNOsQM8n9t6WpkBA4Zw5XESCz65EqLANj91CLOvl2xI3xeW58MI014JvvecQK5vodQFgBsF834MJwBzoOW2WEwwVC0UYfAVjEkKpT2HvV9Pq6acu2OadEfwnH7OaDFOVy/0PcU3EUvwHGX50akIj1bX0oEn3XIjJEfwztMnMiTUlWzvkHIWrNB/PoXLcLaVykzZ3GYc8G/GBP66QaznHUjKUyinQNIbKDNGISczL6FarhAl3rP5lwxuPH+toVh9djIDpW36EOxD1qrKx481THe/XRBKQDnFmaTpThKu/N6OEbSqh5Lw1DX7ePgtsuFryBP4nY6vgez4SImRf0fJJhYIA6s76cE7wdLFX8KNq/ew5C7hzWZXOcBW9V6W7cQl+el1RaGD5+0KsmGQXXn7YOdQP0IFI0lmkJwuFKLk+aihm1dfFP5w9
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(356005)(81166007)(82740400003)(86362001)(40480700001)(82310400005)(36756003)(33656002)(40460700003)(6486002)(2906002)(4744005)(186003)(53546011)(6512007)(6506007)(26005)(316002)(70206006)(70586007)(4326008)(8936002)(6862004)(8676002)(478600001)(5660300002)(41300700001)(36860700001)(47076005)(336012)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 10:30:14.7683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9dfc4d5-41cc-4973-86fc-08db6bf92cf4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8452
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 10:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182707

T24gMTIgSnVuIDIwMjMsIGF0IDE5OjEwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMu
NS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuNS5iYg0KPiBpbmRl
eCBmNDAzODQwZDNjMi4uYjI2OWMxNDNiNDEgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9wYXJ0ZWQvcGFydGVkXzMuNS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvcGFydGVkL3BhcnRlZF8zLjUuYmINCj4gQEAgLTksNiArOSw3IEBAIERFUEVORFMgPSAibmN1
cnNlcyB1dGlsLWxpbnV4IHZpcnR1YWwvbGliaWNvbnYiDQo+IFNSQ19VUkkgPSAiJHtHTlVfTUlS
Uk9SfS9wYXJ0ZWQvcGFydGVkLSR7UFZ9LnRhci54eiBcDQo+ICAgICAgICAgICAgZmlsZTovL2Zp
eC1kb2MtbWFuZGlyLnBhdGNoIFwNCj4gICAgICAgICAgICBmaWxlOi8vYXV0b2NvbmYtMi43My5w
YXRjaCBcDQogIF5eXl4NCg0KRG9lc27igJl0IGFwcGx5IGNsZWFubHkgYXMgdGhpcyBwYXRjaCBk
b2VzbuKAmXQgZXhpc3QgaW4gbWFzdGVyLiAgSSBndWVzcyB0aGVzZSBidWlsZCBvbiB0b3Agb2Yg
YSBzZXJpZXMgdGVzdGluZyB0aGUgbmV3IGF1dG9jb25mPw0KDQpSb3Nz

