Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C94D7C7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 16:56:54 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.87])
 by mx.groups.io with SMTP id smtpd.web11.851.1684429013263699788
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 09:56:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LzBH+BiQ;
 spf=pass (domain: arm.com, ip: 40.107.249.87, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yPX+tchECqvwamdpeD3kh789HUIjCgXt5rMfQuR1ow=;
 b=LzBH+BiQGMsh2YGNmAsi449rx586Lq+rgroCS/A/jGNDPI92pmt76iZPiYMClUh54U2IefxaPQQ5fTSNzMqTHzGW4o7ri1bgeXYTPMPJt2N103e22Os/pSx9NMvK+6ruo8GNUKJjzWwjJUpZ63OTsFn7b6+tXAgI809HbQievkc=
Received: from DB6PR07CA0118.eurprd07.prod.outlook.com (2603:10a6:6:2c::32) by
 DB8PR08MB5484.eurprd08.prod.outlook.com (2603:10a6:10:111::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.17; Thu, 18 May 2023 16:56:50 +0000
Received: from DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2c:cafe::86) by DB6PR07CA0118.outlook.office365.com
 (2603:10a6:6:2c::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.15 via Frontend
 Transport; Thu, 18 May 2023 16:56:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT053.mail.protection.outlook.com (100.127.142.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 16:56:49 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136"); Thu, 18 May 2023 16:56:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14cf878d604fcc13
X-CR-MTA-TID: 64aa7808
Received: from 8f817e3beeed.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CE4BB7F9-72D8-4B80-802B-C72F20ECE923.1;
	Thu, 18 May 2023 16:56:42 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8f817e3beeed.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 May 2023 16:56:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8i+1+c8d9ct0cuLCphMNbB1C9X98a9bkKphiDt1hc3Zx1qjhCUhy87JJ44RA5UudXIqkHywixqCc35rZoqvvB0Zov1DWoxI9lVEWzi+vBtSiiGijNFy/VGp6J0ePCId2zx8Af/jQi//g03EWCAURtmqZ+FD2qLI0tunGoEdmP3YOMT+8Ghk1aZYXvnLLan2IY/RL/riLcews8Cx6iO/p+ICpZbO8zfsVnCS/hnx29GMbqioPNGH5yoW7dRG7by16B0EAjstqsWne4YXV0PaOxSHNIifxknXMZrn7OYmhprb+i4CKOxNCPUQFGGeC7uow5JphHyFoiHS4vIj/VLTHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yPX+tchECqvwamdpeD3kh789HUIjCgXt5rMfQuR1ow=;
 b=ht8PKeXM2IIViaqYRbxrRcqUCcO7wO146SMnS5pKy72pHbgab2KefHayxAadb7FsipD8FCu9LuRtAx0R5UkwIFbaS4IfQ3PVz8DWhjN69/gEGz7LlO700g/qxQjMSqCT1Vl8l5JzE+ZlSV6HcXFBEm1LzRkPz+l2HjPU3Kh7EMiCtrcE9CuyOUMzT23wdNd4MATyCiZWKUJU8T8tE/VF9ysEz3xaeH4kSaZkg1b+InhC9o3qolqyHe8zUqjHGOd4SNYBQSEI665S+8poJZmBJ8SVNaiTpOBepaZnM3pnazjaPQTtTmq/ZP+8TK5wbRwfcZ7vPqdOxWAAf/CN2DrOkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1yPX+tchECqvwamdpeD3kh789HUIjCgXt5rMfQuR1ow=;
 b=LzBH+BiQGMsh2YGNmAsi449rx586Lq+rgroCS/A/jGNDPI92pmt76iZPiYMClUh54U2IefxaPQQ5fTSNzMqTHzGW4o7ri1bgeXYTPMPJt2N103e22Os/pSx9NMvK+6ruo8GNUKJjzWwjJUpZ63OTsFn7b6+tXAgI809HbQievkc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5610.eurprd08.prod.outlook.com (2603:10a6:102:91::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 16:56:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Thu, 18 May 2023
 16:56:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>, Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>, Trevor Woerner <twoerner@gmail.com>
Subject: Re: [OE-core][PATCH 06/20] python3-libfdt: new package
Thread-Topic: [OE-core][PATCH 06/20] python3-libfdt: new package
Thread-Index: AQHZiJasPnQeupoNRUibv1v3Aax3+K9eqSiAgAGZC4A=
Date: Thu, 18 May 2023 16:56:40 +0000
Message-ID: <63C660BB-CE31-473F-A9B6-62A87D0F72C9@arm.com>
References: <20230517080639.9336-1-brgl@bgdev.pl>
 <20230517080639.9336-7-brgl@bgdev.pl>
 <CADkTA4M_vy+E_nqxMMHDVi4bmw7OdNyRTwBDiNvLRQ8ydP-2cQ@mail.gmail.com>
In-Reply-To: 
 <CADkTA4M_vy+E_nqxMMHDVi4bmw7OdNyRTwBDiNvLRQ8ydP-2cQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5610:EE_|DBAEUR03FT053:EE_|DB8PR08MB5484:EE_
X-MS-Office365-Filtering-Correlation-Id: e79bd347-e844-4f01-e96e-08db57c0df63
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 2UsX5tj+2BtCr6gxvSxL7QzxY7wbEzeX9AkQRHB1lAeRPnUoaDktR9SEX5WV8QMUTO05emvfrebMSw7g0jXgfTQ3lZw0UkBisdXqlAl3j3nhBj64AP75eHnNPgE8d2JAASYMGLmPRlfD64ZTlXMtnfe1kgOuOh0c1kAZ5TvF9W0EQALdTU+8sRL+oIiO23pa+9M6ucReH2mM0oD+h2MiNMCyZiO0EPABytQ01CHJvuRMs/6+jONepHD4dWJRyZdbh+b255t2s6An933axATsnujg5Edaq5wNNueGF3m1QA1eWEwWWqaI1PtOGjnD+rxMkagPWElpRyK0Q+ujLfopHfEkJagky89O9B5vPWjVHY3dulL2+Xy/m5Ql9Tml+87wPvvcNBx7puSLboFrm3fXEPli7nXpfT9DItGLpPNR5l0D4n7NJTmwBOmR+oxiyADNFtga2FKT1tXKbee8fDCK6Et7K6p3yN0HNYj1NYsN5hBvgMt91ySCkOpDySq6VujXE1EPKr3weKV8nplxPLtpk6qJrKbpeSfL78rZ3NO3qKo/uhrrw37h3cghOxOzJQ9GMCSa7GX9YKVc7v5WG40XR0NIXGRNvwpHWVpPTDPiLsriFmoOnE1g2++LSds/DqbTWVU9Ba/+SrwPSj+qT3XvSw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199021)(316002)(4326008)(6916009)(76116006)(66446008)(66946007)(64756008)(66556008)(478600001)(66476007)(54906003)(91956017)(38070700005)(86362001)(33656002)(36756003)(83380400001)(6506007)(26005)(6512007)(2616005)(53546011)(186003)(41300700001)(6486002)(5660300002)(8936002)(8676002)(4744005)(2906002)(71200400001)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <A022C301D664124087F7C5E1129AE09F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5610
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e3a11678-7e1a-4d66-f3eb-08db57c0d9c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0oKkFG9inm/YVad4j9DBaSapxiHwd1I3MF3w2qyhUQlzsOKQv0C5IjdHZK5AAOhlvo28SA8hh6UdkLDYwjV27SNrUHSFrlecStjszRRo0e0s0XO7PwYVunj1/MsyMxorUEZgQyQVCIqqHEMSThAiS9lEP4nUcLreKPEEwAC12x3HJHNaeVByamDxttOVMbAaq34lrpiRtb+ln3tjcTWgRvUWIfkybWAbe+f+1dxSWSvcbaTr5d4z4f6GK9DrqmglRX3nf2BCt97Mjjrr11RH8GXrZ6u51KYGeLxULosr6tpFPlKU4MsA08gIsxbeDlG5y2MyaglSEbDOsuPcm0n+fMe4uWYadO4QIdLPe3J9PUbBu5VWfShJJRHlZxYTJr6sxhr6xVZ06WfJPkbXjA5dYHawySWg8im0E4IsRHDQ/Q7SKCc6wyJsfDvHQp385lNrBT2DzWD4B+3PT7cTKAbLuIyFDHhxMAhvXDxnY50G3VcyEPJb/mwzjUgfHw14hYAN8SW0bFct3vAGQZncA27xxh1wTf5NzClUQM+OPB5HICD15OsaVLUty4g+PDVXZwQIVkLuvH8RtF+/g2SBEy9hKDrPqFhNS4GVAEtwGcYwdNQSJ+3a3HUD0TrMkTTw3F2Q5qoEJrOnei6UHYxFfg1HeBN2dWKJeRkQX7c/PwZ5zVlToLiF2Qw5gEyEqeolIjL7RfMEL7WtcCXXZV8ac2CR/fhZ0vNcP4lcK7iMPYApV68v1QXwvMQQ2ss0OzLQDWCn
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(46966006)(36840700001)(40470700004)(70206006)(2906002)(4744005)(70586007)(54906003)(336012)(82310400005)(83380400001)(47076005)(8936002)(5660300002)(6862004)(8676002)(36756003)(4326008)(41300700001)(316002)(40480700001)(6486002)(33656002)(40460700003)(36860700001)(186003)(86362001)(82740400003)(53546011)(107886003)(6512007)(6506007)(26005)(356005)(478600001)(81166007)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 16:56:49.6105
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e79bd347-e844-4f01-e96e-08db57c0df63
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5484
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 16:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181527

DQoNCj4gT24gMTcgTWF5IDIwMjMsIGF0IDE3OjMyLCBCcnVjZSBBc2hmaWVsZCB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyA8YnJ1Y2UuYXNoZmllbGQ9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gSSdtIG5vdCBzdXJlIGlmIHlvdSBzYXcgdGhlIG9sZCB0
aHJlYWRzIG9uIHRoaXMsIGJ1dCB3ZSB3ZW50IHRocm91Z2ggdGhpcw0KPiBiaW5kaW5nIGluIGRl
dGFpbCBpbiBmZWJydWFyeToNCj4gDQo+IFNlZSB0aGUgc2VyaWVzIGZyb20gVHJldm9yVzoNCj4g
DQo+IFtQQVRDSCB2MyAxLzRdIGR0YzogdmVyc2lvbiBidW1wIGFuZCBhZGQgcHl0aG9uIHdyYXBw
ZXINCj4gDQo+IFRoZSBweXBpIHJlbGVhc2VzIG9mIGxpYmZkdCBiaW5kaW5ncyBhcmUgbm90IGtl
cHQgaW4gc3luYyB3aXRoIHRoZSBkdGMNCj4gcmVsZWFzZXMgYW5kIHJhcmVseSB1cGRhdGUuIE5v
dCB0aGF0IHRoZXkgY2hhbmdlIGEgbG90LCBidXQgdGhhdCBpcw0KPiBzdGlsbCB0aGUgY2FzZS4N
Cj4gDQo+IFRoZSBzdWdnZXN0aW9uIGZvciB0aGUgYmluZGluZ3MgaXMgdGhlIHNhbWUsIHRoZXkn
ZCBiZSBiZXR0ZXIgb2YgYnVpbHQNCj4gZnJvbSBkdGMsIHZlcnN1cyB1c2luZyBweXBpLg0KPiAN
Cj4gVGhlcmUgbWF5IGJlIHNvbWUgaXNzdWVzIHJlbWFpbmluZyB3aXRoIHRoZSBidWlsZCwgYXMg
VHJldm9yIGhhc24ndA0KPiB1cGRhdGVkIGhpcyBzZXJpZXMgaW4gYSB3aGlsZSBub3cuDQoNCkFn
cmVlZCAtIHRoYXQgc2VyaWVzIG5lZWRzIHRvIGJlIHJlc3VycmVjdGVkIGFzIGl04oCZcyB0aGUg
Y2Fub25pY2FsIHNvdXJjZSBvZiB0aGUgYmluZGluZ3MuDQoNClJvc3M=

