Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE51EC77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 15:52:17 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.79])
 by mx.groups.io with SMTP id smtpd.web10.21091.1684425128182913125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 May 2023 08:52:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=26LOoRLg;
 spf=pass (domain: arm.com, ip: 40.107.241.79, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecnS+AAvFvhXSZNdWkRO7doftOpbYfLYo4QfLU8pseQ=;
 b=26LOoRLgjuOwaJLFp66yJBK9Qmc9buRAvxzhECXEvH0ToAGPAI4AGmbxl7yXfXB8eT1zJ1tDHG4ng50Gt9NFDcoWViOeKOMp+U5lH1oc+IaJUv7+v0zM3YrOUZx1z0twk8eGrzjRpdb9q+oqLl90wJC/qDbg4TL92j2FicCmJIU=
Received: from AM7PR03CA0004.eurprd03.prod.outlook.com (2603:10a6:20b:130::14)
 by AS2PR08MB9809.eurprd08.prod.outlook.com (2603:10a6:20b:606::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Thu, 18 May
 2023 15:52:04 +0000
Received: from AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::6) by AM7PR03CA0004.outlook.office365.com
 (2603:10a6:20b:130::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 15:52:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT021.mail.protection.outlook.com (100.127.140.243) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19 via Frontend Transport; Thu, 18 May 2023 15:52:04 +0000
Received: ("Tessian outbound 99a3040377ca:v136"); Thu, 18 May 2023 15:52:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a0437bacb2a0ebb
X-CR-MTA-TID: 64aa7808
Received: from e8543e98d55e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4AD84ADB-DD27-4428-A5E9-A0003BA18267.1;
	Thu, 18 May 2023 15:51:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e8543e98d55e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 18 May 2023 15:51:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLexbYLqTzpnCwAUwKRBvC8ZqYeBfaDq4M2xHI4P4e+0Toi80rRxd83WYdSqMQxKYsj5TKo076TSH7bKictnwVnoSME5acJGUkj9lTfK0BrqQbgqW/NT3dMQbS5Xt0v6+nniy3c6RMdDfWCKeNCO3X/d3Ld2YSI1dToDvqOp26aptGQbNSdMt2JFxJXA1t3//RUCVTshXQkFIEhynfZAm8KKG0kLZFRtO+bYXj2jOObjPS5xe7+QZfaVNwPDIxML04acmXggqoy+1WgB4IaVtMf8PT2/GLSfcRN9LkUkOFFkelS+O6AAOFXG0l94HI0h6g7kml2RlCPez4+8jZdesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecnS+AAvFvhXSZNdWkRO7doftOpbYfLYo4QfLU8pseQ=;
 b=RIxdbEUnv4oPki4WdAaxZSVoTtRKLSyIa30w1njiomZW37hm1RHc5cJkm8hBd2+fC8s16SsZax9tXxXjnRSCDAlQfq/NRiHWxp9GxSIJRf/B4XpEb+JcTt9c3ZPgtE1n/QgFWLcc7cEsLoYhAeOcyxQHL1IJmmB6JoCeYH/zDRQPLfPGYU/lJFQi4QRTaEWH8NcFzwJ/ehR7f6dlqleqY9dOtBSfrIRC9bYdphzD+n1F2a7elIcoebatkCSED3NWnOGBQ5kH+H2UgCId/tDDosQITi2ZEFFZoaH6Q17PvZIWaDoOYQXunuaEiH38lPy7twhJh7830zdB4dpuLIjR6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecnS+AAvFvhXSZNdWkRO7doftOpbYfLYo4QfLU8pseQ=;
 b=26LOoRLgjuOwaJLFp66yJBK9Qmc9buRAvxzhECXEvH0ToAGPAI4AGmbxl7yXfXB8eT1zJ1tDHG4ng50Gt9NFDcoWViOeKOMp+U5lH1oc+IaJUv7+v0zM3YrOUZx1z0twk8eGrzjRpdb9q+oqLl90wJC/qDbg4TL92j2FicCmJIU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6431.eurprd08.prod.outlook.com (2603:10a6:102:157::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.37; Thu, 18 May
 2023 15:51:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Thu, 18 May 2023
 15:51:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 25/27] gdb: enable python PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH 25/27] gdb: enable python PACKAGECONFIG
Thread-Index: AQHZgpt7geQju7Z+uEmqMvFIArsr9a9gPBMA
Date: Thu, 18 May 2023 15:51:55 +0000
Message-ID: <88BC9F83-117D-4E32-84A4-8AAAFFFC5C99@arm.com>
References: <20230509172344.1516743-1-alex@linutronix.de>
 <20230509172344.1516743-25-alex@linutronix.de>
In-Reply-To: <20230509172344.1516743-25-alex@linutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6431:EE_|AM7EUR03FT021:EE_|AS2PR08MB9809:EE_
X-MS-Office365-Filtering-Correlation-Id: c3e231ef-abd6-485b-fa12-08db57b7d3a6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mPi1kz1iJc1j7zjDnrJVms0UHRPFsPbtdoj8Gedp+1oSzq0WY0WS/x+iiFkvgWpWw0UyQRlcbggk++gufU/VNt2G6m1xzG6ltK8EsUy+3XbZyl6aZB57RuY8Dlx64Jl1b1SaDHX97IL6z3Wi1D9B8HX4C5v7InK/lVT3VMfI4uXa5Y8TEFyYgsJWMHgNG7uE5TKMSI5JEvBdBe1MIjhFoCE2P94eBwTHUY4aDQ2Knh1r87GrBuwvlz4FxD7LPut0whXG7PyymQGlUy/f8Qi7AwXcm0gGsnDajt427rnpIMLACOVxKo5Nl6nnVpYCpKs2lC1eOA7zO6CCI7Pkrzbwjhnhwo1Y7LnUHLxYRHRRG354QFIe6SkEVR+tUWM3nsQUSpNZ9LU0g++dI1Ly8PCDnLK7PRWT+YqjJIdNBQmkJzkmrf+FYEyusWwXKnZMrwEP18jKMZdReTsS+MX+cbhNOd0NM2L/fzIweUkRn4WwVvOnDWJCzThotPvq8MWo3ViGvq7oCS7PyaMpr1ss9h6+5QS2zpwfD44X6Se8fJgfB/wQ+hR1ur9VQVFRwU5llvNQOAlpjBJJkvJAMsLB359QEjxgdw8KAnccvjymMKRhOYvOQyTruJwfi+r+2N9ubRdsV4VP/2tKRofiXUhcac7Klg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(451199021)(86362001)(6916009)(8676002)(41300700001)(66476007)(8936002)(33656002)(4326008)(66556008)(122000001)(38070700005)(66946007)(38100700002)(66446008)(76116006)(316002)(64756008)(91956017)(36756003)(4744005)(2906002)(83380400001)(478600001)(2616005)(71200400001)(6486002)(26005)(5660300002)(6512007)(6506007)(53546011)(186003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <47119B8ACD2C734FA7F8AFC31E8A331A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6431
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8401bd81-535a-4e99-181c-08db57b7ce44
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mJY3juF5mTqFDrskI30Vic1NUqUAEhpDwZW3ZXCH7f9lsY7HLBFmY50beFEPrqz3/qNYsQslnZkPU/i9aOXet67TpJdj9+sxfyg1DBY3bLXRlqMTdGT0nRasJ9Oi0Xne83YV5dUdE2Rh1Ql+tyfmYd0AzFr+4X/T/syrKDq+zeJTn6TLDoUMOT+0eJap2HU6+b0D96jsOzfFG3koZACbFZaJSeeR1HoBoVSouc+TjHXxy66sqSk9o/V8VbLXR99HRQ0+GBkMXh5Izd4wDOByMyp9vZVMgY0Wai/+vvWSKOkUA3YT+GlrL+Gj6n3Occo+c21t5gkPhyPjegfFyhYvjS88EgoiXtt8K3LSbRA1d6XqHA2dL27cMN69IHWUy2q+Usm6r1cgTioshGD30Rp/Bd6QsebqZFXemdnLI32AgjboN6ezhM4PX2b1OPeqo6fzMYSik+TfYbRlxo8/OeKRx+StFGE8ZHcXX7Gv2Com7ZFuVXM5W2eNmBNDPV1MGh5KFZ6kX/Z4mYByn2S2NDG+phCeNNYKp5ldp194cZMKrjpOs9q0lxzDHbj7/aw3sl/6i8hhZcEGYKcKCLVGbu1wKgYdUk+jq5+rbSeWzARWAMyNUYUIwghV2zUUdO3djgBwHuvCxE48w+CUtIUA7bZW4wm1EwwbeCSpC2U7jNYuyhdI9qmmekK9hOUfi73rA6aeqRuO882IhAXcznZeX2dmGtqVTsuv4Lnc924Y2RdbJts=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(40480700001)(8936002)(5660300002)(6862004)(8676002)(82310400005)(53546011)(6512007)(47076005)(26005)(6506007)(186003)(36860700001)(86362001)(82740400003)(356005)(83380400001)(336012)(81166007)(2616005)(478600001)(6486002)(70586007)(40460700003)(41300700001)(33656002)(70206006)(316002)(36756003)(4326008)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 15:52:04.3999
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e231ef-abd6-485b-fa12-08db57b7d3a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9809
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 15:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181524

T24gOSBNYXkgMjAyMywgYXQgMTg6MjMsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gVGhpcyBpcyByZXF1aXJlZCBieSBsYXRlc3QgdmFsZ3JpbmQgcHRl
c3RzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRy
b25peC5kZT4NCj4gLS0tDQo+IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNvbW1vbi5p
bmMgfCAyICstDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9nZGIvZ2RiLWNvbW1v
bi5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ2RiL2dkYi1jb21tb24uaW5jDQo+IGluZGV4
IDlkYjYxYjc4NWYzLi41YTQxY2QxN2RjNiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2dkYi9nZGItY29tbW9uLmluYw0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
Z2RiL2dkYi1jb21tb24uaW5jDQo+IEBAIC0zMCw3ICszMCw3IEBAIEVYVFJBX09FQ09ORiA9ICIt
LWRpc2FibGUtZ2RidGsgLS1kaXNhYmxlLXggLS1kaXNhYmxlLXdlcnJvciBcDQo+ICAgICAgICAg
ICAgICAgICAtLXdpdGgtbGliZ21wLXByZWZpeD0ke1NUQUdJTkdfRVhFQ1BSRUZJWERJUn0gXA0K
PiAiDQo+IA0KPiAtUEFDS0FHRUNPTkZJRyA/Pz0gInJlYWRsaW5lICR7QGJiLnV0aWxzLmZpbHRl
cignRElTVFJPX0ZFQVRVUkVTJywgJ2RlYnVnaW5mb2QnLCBkKX0iDQo+ICtQQUNLQUdFQ09ORklH
ID8/PSAicmVhZGxpbmUgJHtAYmIudXRpbHMuZmlsdGVyKCdESVNUUk9fRkVBVFVSRVMnLCAnZGVi
dWdpbmZvZCcsIGQpfSBweXRob27igJ0NCg0KVGhpcyBtZWFucyB0aGF0IGdkYiBoYXJkLWRlcGVu
ZHMgb24gcHl0aG9uLCBjYW4gd2Ugc3BsaXQgdGhhdCBvdXQgaW50byBhIHNlcGFyYXRlIGdkYi1w
eXRob24gcGFja2FnZSBzbyB3ZSBkb27igJl0IHB1bGwgdGhlIHdob2xlIFB5dGhvbiBzdGFjayBp
biB3aXRoIGdkYj8NCg0KUm9zcw==

