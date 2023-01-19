Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82BBC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 14:56:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.82])
 by mx.groups.io with SMTP id smtpd.web10.47098.1674140205935977080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 06:56:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=jYZ2dCI5;
 spf=pass (domain: arm.com, ip: 40.107.22.82, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD+GzrjAMa7h6carDjROjK85hYynDrIn5AjlPqDM2KQ=;
 b=jYZ2dCI5e2mvSoOHhtno0LjVdvmx9G8JmA7n0bCsBClXw1zs2tWFD+tSsMsbLTZrWLceG10EWn4/13p4BKCCkW9IpKxi5KIoToxNIeWRhnOf5VADf5MHOndwtADt7kUhzB1GJEpx23e8cC7DLrSAkyi/mdfGeqGgX/w+izMZCqE=
Received: from DB6P18901CA0001.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::11)
 by AS4PR08MB8242.eurprd08.prod.outlook.com (2603:10a6:20b:51e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 19 Jan
 2023 14:56:42 +0000
Received: from DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::9) by DB6P18901CA0001.outlook.office365.com
 (2603:10a6:4:16::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26 via Frontend
 Transport; Thu, 19 Jan 2023 14:56:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT024.mail.protection.outlook.com (100.127.142.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Thu, 19 Jan 2023 14:56:42 +0000
Received: ("Tessian outbound 333ca28169fa:v132"); Thu, 19 Jan 2023 14:56:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8ecc485283179b62
X-CR-MTA-TID: 64aa7808
Received: from ae6871d4f606.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2DDC92F3-E1F4-4B31-86CF-07B0357090AA.1;
	Thu, 19 Jan 2023 14:56:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae6871d4f606.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Jan 2023 14:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SENGH2TxpJh7IJ9cR0G0A79D1cjDPcpHyOR8RqF8oWHC6q16RBHUW+2RhUdqkGzfclxlI/yJIRvkSb1sJY/2Q/iH9N/GYw28aYzWNyFD93sLhdpf5NO6PjO8iFNm3576QDiMIm89GSIYJzoX9O68Dh3V8PcgMO3S/ozl/Bj/HwEnHKAMzAx6TPvLtkqNG3MmLR67eADTUIj+Llk7ziSTbNt3gr7cVkgdoMtoWZHeVRvMxI94XkULzAJ+DekK34q5BoSjFjt5ldoXh/gMPJMqkXAcQDgOuJtALts/U1jZxrdCdGeGj/tF09vjaDKBs3Cd1I6e8s+mc/UBSfN82mkRYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iD+GzrjAMa7h6carDjROjK85hYynDrIn5AjlPqDM2KQ=;
 b=bXjSlJLtih1+ErptNLWZZZaBMsLzlcfx9e/KwvH76Qg0av1ca8sM8OQxX3HL8frSyp7orNS0dgkktCDXOMlEAak49TAhA4s0FcrKevX/9lymVyXWj6ck3pEewddhOqKmZR8KlW6MF2MHZuJKvyXe2WEHKsDCL20jphywjSisV5B1qSkQP5bqF37GqmTdTFAUrFb9mif0SF0jEP1q8WzOL0Iy8R0b4vP92YojRIQGMOdVodRQ43/4MTw9FfESKWIRNBIPUQ5x6H43EMul91JrtsePcXUZKJUmu64+0LAv7xwKklk70pKXcw+0wb/0t9UDII2sFnaBL8OsNaujk/XF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iD+GzrjAMa7h6carDjROjK85hYynDrIn5AjlPqDM2KQ=;
 b=jYZ2dCI5e2mvSoOHhtno0LjVdvmx9G8JmA7n0bCsBClXw1zs2tWFD+tSsMsbLTZrWLceG10EWn4/13p4BKCCkW9IpKxi5KIoToxNIeWRhnOf5VADf5MHOndwtADt7kUhzB1GJEpx23e8cC7DLrSAkyi/mdfGeqGgX/w+izMZCqE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM0PR08MB5457.eurprd08.prod.outlook.com (2603:10a6:208:180::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.24; Thu, 19 Jan
 2023 14:56:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%5]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 14:56:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
Thread-Topic: [OE-core] [PATCH 1/3] insane: Improve patch warning/error
 handling
Thread-Index: AQHZK0haLu7JtYepT0m8iedrM8aX566leRGAgAAJJYCAAEKOgIAAEQ2A
Date: Thu, 19 Jan 2023 14:56:33 +0000
Message-ID: <CA6755AF-3664-435C-8078-E730AF0F57C2@arm.com>
References: <20230118142221.1926666-1-richard.purdie@linuxfoundation.org>
 <20230119102423.3493565d@booty>
 <81854d8c638c80866a3bbdd6fe0776de245c3acb.camel@linuxfoundation.org>
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
In-Reply-To: 
 <CADkTA4PZ4p7H2cKh3+zab8-bs8nznW=v+3Cd5KZEMdkeBTZivw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM0PR08MB5457:EE_|DBAEUR03FT024:EE_|AS4PR08MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 06cd8eab-86c8-46e3-3f37-08dafa2d6046
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zDzFMwWCJfAObdTNwzzRVVKOL4n5zHM2Cx9Vef8jCSX4xjd/ZUDlnWLvgL0LkV7gF3oxN7eTYJMBXarEtuINgJFl8RQDTn6j3dTIEqkvEwzi7htSavDNEvBo7/46pVwiVilceaHVd1oZhkz0WGXMin0uWeKLl+1ng1ynWQqxP0cHYjaO37fDoiL6q4nn0cENAatxBtD+Fgpluer7vfW3CD895VXBR9gOpp55nFWyDH0Vo/Sz2kV5cLPj+ErZXzTam5ItCuOrKDmO745oaesxqdF4uZnufMmsOjrP3l/fp8L2IUVl0AxRUsDs9+5r2VlBprNg+s2M4sjMLKohXr6t8ByYBX4HHysuaVlhjOGOfliBspT0HTsZTu2U+LW+4rVUrtBTJINjofJepUd5PoHSVb+kHpcgHadIz5z3hCvNHEA0wcYTplED26equRmjW3rdIC7hHKKQDMbfLYhgTuU/DcXGBnMXFY0+CW/mRsGrQ5An1eHeC4zv+0V/DlSQ1CP/KBNkPcOSH0+Zurv6IzEVibDASsDVh0rU6KLEDgR/vCc3CVT0/XLU8QEIoN1IwlmFk0vqS/Nuxc7fONoO1y5SPvKRkKS63mUrQgx14HXFYuurbMyumIzSzl2V0k1tn4o3kER0T/XmPRWLFWM3KGFtnQJrpSBBfq1wrIX/sPOaBJB4nVwZj14OZVFigomDbhr+M5xIWoH6YxA2KAAwkgR7M0MI0HsqsxKJvtwtK/y3Qgk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(396003)(136003)(346002)(376002)(451199015)(36756003)(6512007)(33656002)(66946007)(186003)(6916009)(41300700001)(66446008)(478600001)(6506007)(66476007)(76116006)(2616005)(53546011)(64756008)(4326008)(66556008)(8676002)(91956017)(26005)(6486002)(86362001)(2906002)(83380400001)(54906003)(8936002)(122000001)(71200400001)(316002)(38100700002)(38070700005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA8066C2B72E2B4ABC4673601686A0F4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5457
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ee6367d5-f04d-4f2c-dd54-08dafa2d5ad8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KdLW4P3cCQOqiy2uRqC0SkaF/uxnkJpYSUJuP66/shP0n0jzyrs5BMOJrWBcNC0vp3PHuY204hdoBANV78T5tRr1Keifsb7q7B6RBt8F3bjaM2hbdJCNsxzaMLhK+XFlPM5PBgoIoMldHh3CJ7Me4sd8CbCWxsC6sL5hkKYRdCpTbQhFHWvH2m1fxvKIRvcWtKF/sP1V0ATTQn3xdkwz8XWS5Rvnp71o7sJ73PtUzF/yQnJvMpJt9bVQxLq2l8HEfKt/EW8H67r1joRVxthgoD2w1nx0Yo+H+xa8x1FQnQ3QljmnY3nAFSoxySUc8ls10ow7vyneG99SFyQVI5BMCaPszLkfTh/+ux70vTGVwkImkZaw2e/ICZe+hEnxPNigiDodvt2muWerGf/YMgCtBXwYlPX02OL12xxvykjg6t+ovUrqDLG4NMQSyEaFv3cEg7dQeQ9ldPrYqkAFgLALcRHme69mi6v2i7SF5F2jhulgg1yL/zoh4miocZC/Kpgd5AG/n0NmaA5/g0nkEoxHQz4GdUIep1x72QTxTiIQzJyPmJ4P/+wycZyFo/NQX8Z7ArT0T+XjnSFgJA5OI4yYyUl42U/IOssRI1VUAbALwwbfLz92xy3iwBr1izdnpV41cs5x0csPE9ctjZHi16PoR0s+lipLWyPZcCf1fNEmR8F1u2VtphtI37HY01Eb6mpcUxvRKLeFw5p/93TYPWL2Og==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(4326008)(336012)(36756003)(70586007)(40460700003)(70206006)(41300700001)(47076005)(54906003)(316002)(8676002)(2616005)(86362001)(81166007)(356005)(83380400001)(82310400005)(6862004)(5660300002)(82740400003)(8936002)(40480700001)(478600001)(6512007)(186003)(26005)(6486002)(33656002)(53546011)(36860700001)(6506007)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:56:42.2035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06cd8eab-86c8-46e3-3f37-08dafa2d6046
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8242
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 14:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176144

T24gMTkgSmFuIDIwMjMsIGF0IDEzOjU1LCBCcnVjZSBBc2hmaWVsZCB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8YnJ1Y2UuYXNoZmllbGQ9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiBJJ2QgcHJlZmVyIHRoZSB1cHN0cmVhbS1zdGF0dXMgY2hlY2sgdG8gYmUg
ZGlzYWJsZWQgZm9yIG1ldGEtdmlydHVhbGl6YXRpb24uDQo+IA0KPiBUaGlzIGlzbid0IHNvbWV0
aGluZyB0aGF0IEknbSBzdHJpY3RseSBlbmZvcmNpbmcsIGFuZCBub3Qgc29tZXRoaW5nIHRoYXQg
SQ0KPiB3YW50IHRvIHN0YXJ0IHN0cmljdGx5IGVuZm9yY2luZy4NCg0KV2l0aCBteSBtZXRhLWFy
bSBsYXllciBtYWludGFpbmVyIGhhdCBvbiwgSeKAmWQgbGlrZSB0byBicmllZmx5IGV2YW5nZWxp
c2UgZm9yIHRoaXMgY2hlY2suIFdl4oCZdmUgaGFkIHBhdGNoIHN0YXR1cyB0cmFja2luZyBpbiBt
ZXRhLWFybSBmb3IgYSB3aGlsZSBhbmQgaXQgaGFzIGEgbG90IG9mIGFkdmFudGFnZXMgZm9yIHRo
ZSBtaW5pbWFsIGZyaWN0aW9uIGl0IGFkZHMuDQoNClllcywgdGhlcmXigJlzIHRoZSBpbml0aWFs
IGhpdCBvZiBzcGFtbWluZyBVcHN0cmVhbS1TdGF0dXMgdGFncyBpbnRvIGFsbCB0aGUgZXhpc3Rp
bmcgcGF0Y2hlcy4gIFRoaXMgaXMgZmFpcmx5IHNpbXBsZSAtIGVzcGVjaWFsbHkgaWYgeW91IGFz
c3VtZSBQZW5kaW5nIGFuZCByZXZpZXcgdGhlbSBBdCBTb21lIFBvaW50IC0gYnV0IHRoZSBhY3Qg
b2YgcnVubmluZyB0aHJvdWdoIHRoZSBwYXRjaGVzIGFuZCBtYXJraW5nIGJhY2twb3J0cywgcGF0
Y2hlcyB0aGF0IHdpbGwgbmV2ZXIgYmUgc2VudCB1cHN0cmVhbSwgYW5kIHBhdGNoZXMgdGhhdCBf
c2hvdWxkXyBiZSBzZW50IHVwc3RyZWFtIGlzIHVzZWZ1bCBmb3IgZXZlcnlvbmUsIGJvdGggdGhl
IGxheWVyIG1haW50YWluZXJzIGFuZCBvdGhlciB1c2VycyBvZiB0aGUgbGF5ZXIuDQoNCklmIHVw
c3RyZWFtIGFyZSDigKYgdHJpY2t5IHRvIGVuZ2FnZSB3aXRoLCBpdOKAmXMgdXNlZnVsIHRvIGJl
IGFibGUgdG8gbWFyayBhIHBhdGNoIGFzIHN0cnVnZ2xpbmcgaXTigJlzIHdheSB1cHN0cmVhbSBh
bmQgbGluayB0byB0aGUgcmVsZXZhbnQgdGlja2V0cy9tZXJnZSByZXF1ZXN0cy4NCg0KSG93ZXZl
ciwgdGhlIGJpZ2dlc3Qgd2luIGZvciBtZSBpcyB0aGUgbGV2ZXJhZ2UgeW91IGhhdmUgb3ZlciBw
YXRjaCBjb250cmlidXRvcnM6DQoNCi0gVGhhbmtzIGZvciB0aGUgY29udHJpYnV0aW9uLiAgSSBz
ZWUgeW914oCZdmUgbWFya2VkIHRoaXMgcGF0Y2ggYXMgUGVuZGluZyBidXQgaXTigJlzIGEgZ29v
ZCB1cHN0cmVhbWFibGUgZml4LCBjYW4geW91IHNlbmQgaXQgdXBzdHJlYW0gcXVpY2tseSBzbyB3
ZeKAmXJlIG5vdCBjYXJyeWluZyBhIHBhdGNoIGZvcmV2ZXI/IFRoZSBwYXRjaCBjYW4gdGhlbiBi
ZSBtYXJrZWQgYXMgc3VibWl0dGVkIHdpdGggYSBsaW5rIHRvIHRoZSBwdWxsIHJlcXVlc3QuDQot
IFRoaXMgcGF0Y2ggaXMgYSBiYWNrcG9ydCwgcGxlYXNlIG1hcmsgaXQgYXMgc3VjaCBhbmQgaW5j
bHVkZSB0aGUgU0hBIHNvIHdlIGtub3cgd2hlbiBpdCBpcyBpbiBhIHJlbGVhc2UNCi0gWW91IHNh
aWQgc2l4IG1vbnRocyBhZ28gdGhhdCB5b3Ugd2VyZSBnb2luZyB0byByZWZhY3RvciB0aGlzIHVn
bHkgcGF0Y2gsIGhvdyBpcyB0aGF0IGdvaW5nPw0KDQoodGhlIGxhc3QgaXMgZGVmaW5pdGVseSBt
eSBmYXZvdXJpdGUpDQoNCkp1c3QgbXkgMmMsDQpSb3Nz

