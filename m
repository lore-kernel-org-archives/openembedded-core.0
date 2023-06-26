Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0420BEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 09:35:43 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.55])
 by mx.groups.io with SMTP id smtpd.web11.4016.1687772139829154509
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 02:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0p3JvWQ+;
 spf=pass (domain: arm.com, ip: 40.107.20.55, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmxC6yHVqZi238dsBhF04bL72vPJ44YhTTDtD3JYJss=;
 b=0p3JvWQ+yurv6rhIcFzGPxOVr8ze/OsyU38kgpacESRD/d8EfOBRAklkRbXZ6K4+VfNw80xEfSA1Z6z2yMsBTdrvLVPLiWr0c+c0Cg5WChU+WvWBMUIJ1owBGMkpH9XMsRLbLjuRxo3yqih/EZhNzBBzw7+bRiehCP3nxERhzxI=
Received: from DB6PR0301CA0080.eurprd03.prod.outlook.com (2603:10a6:6:30::27)
 by VE1PR08MB5565.eurprd08.prod.outlook.com (2603:10a6:800:1b2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 09:35:33 +0000
Received: from DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::1c) by DB6PR0301CA0080.outlook.office365.com
 (2603:10a6:6:30::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 09:35:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT015.mail.protection.outlook.com (100.127.142.112) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.15 via Frontend Transport; Mon, 26 Jun 2023 09:35:32 +0000
Received: ("Tessian outbound c08fa2e31830:v142"); Mon, 26 Jun 2023 09:35:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 456d3b404d88c9a9
X-CR-MTA-TID: 64aa7808
Received: from 069eefc34be3.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id B8A8FD0C-42EC-45BB-ABCC-261B26B8709E.1;
	Mon, 26 Jun 2023 09:35:26 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 069eefc34be3.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 26 Jun 2023 09:35:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPEjAHHgDGdRzyq5mkOhqhBhsSvr/kQJnDD78kMh/EoOx5rRdxOVtY8ByWwfkh9ZVi9UbwoXvqhjWYvD+1gvv81Wvu70AMktKEXxwGdRTKirySnmTxUOapXzm8H/XTjTpMRBgCAMRM0ndn4eQ5/qIt1/M5tOASx4KKWvAmDEhigGZ1Y5uJEpDUOZiKNKwytNok1I7bduGJwyMe4XCVASJOPJIZirf5DiP5LV5sELSF1l92fniBsqlkCoIaiHksrZ16EpomIzieNN4loRngCT488BkL9+cBVr31h4OjWAxfejEl6MQ2/qIGTxb1V4GzXB8rkGKFr/dtmWV6NXSlxW8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmxC6yHVqZi238dsBhF04bL72vPJ44YhTTDtD3JYJss=;
 b=Ha+D/XQbPvntGu8sJBV+cMcKgIxtgvCTIRgh/mdgUt0H9EH4foi1yExyoLrWUZsTf0IGFjP6uhrFpOCu9T8rIB/yPqA2dpqUv7V9Et9NqfM6Uio8UXcIwd+MBdKWxmJ9fd12DqhUJy8BQRGz4HPCBQEFzDr8uBXsRbm8NGV6QxGVACzmdIW+mz7mO/pt+iqy5jzaJ0L/kPetsjuULLOWTHM5bbfYdd/DqWXx5KToEghzC5jpKiyumanT5gIZfPhDCOOmT3D6AY016ahL4gXwtE698ln7oaAcS1O1jIn+Y8yg6p5+S/zCT0yX6JzWAm/V9th7Hj+oHUYSd9N1fj3KQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmxC6yHVqZi238dsBhF04bL72vPJ44YhTTDtD3JYJss=;
 b=0p3JvWQ+yurv6rhIcFzGPxOVr8ze/OsyU38kgpacESRD/d8EfOBRAklkRbXZ6K4+VfNw80xEfSA1Z6z2yMsBTdrvLVPLiWr0c+c0Cg5WChU+WvWBMUIJ1owBGMkpH9XMsRLbLjuRxo3yqih/EZhNzBBzw7+bRiehCP3nxERhzxI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB7347.eurprd08.prod.outlook.com (2603:10a6:150:22::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Mon, 26 Jun
 2023 09:35:17 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 09:35:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "krkapate@cisco.com" <krkapate@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Multiple providers are available for runtime libltdl
 (libtool, libtool-native)
Thread-Topic: [OE-core] Multiple providers are available for runtime libltdl
 (libtool, libtool-native)
Thread-Index: AQHZpObVvpR86lAiz0evk36F2k4EgK+Wjm+zgAYaaVyAADBWgA==
Date: Mon, 26 Jun 2023 09:35:17 +0000
Message-ID: <9059A405-BFD8-4F3F-BDEF-CB5A64145F76@arm.com>
References: 
 <BL1PR11MB539919006E25CD8243EDE31FD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <BL1PR11MB5399A434D9A3B13D1A802A4BD322A@BL1PR11MB5399.namprd11.prod.outlook.com>
 <BL1PR11MB53990B0F5E0ACD4C6A10149FD326A@BL1PR11MB5399.namprd11.prod.outlook.com>
In-Reply-To: 
 <BL1PR11MB53990B0F5E0ACD4C6A10149FD326A@BL1PR11MB5399.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB7347:EE_|DBAEUR03FT015:EE_|VE1PR08MB5565:EE_
X-MS-Office365-Filtering-Correlation-Id: 136ed0e2-f64d-433f-5ba1-08db7628b031
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 OQM9g159MQP8E9GFA5+YoQT0cFAmnEUIVrl5wMbVyvxh4SySzPo+ZrzIq1/k8I+OX6FTvo5xtjNsA5cJn40R3hVTGNB0r4n9jFAzpbgODjLCS7M//hzAyG31vn70z78NzdfLgiWFXOUTYXVLaKVlhOyDM1M2MPcwj6hvx6b4X3Zn66rOX5ePqx96VS2HhdoHSyrUbPgSJ8zvtvTE1lwbo16Kde6dWDY8jjA7ts4OLmXE915mK7dk4mc29L9Gt4ztPwGeOBEU5Th8R523TVPRVIwbsuCpPFgoU/5TALl4dIXWNkxaA+2MWKN1wqbMNQDmqODDnEpudcp6kRuv2bUki4lWQVEHV5B5nyj/fvWnpU0ktwTGFfmV/ZdHBtnLr0oTuQQ1pISotKx9cYjs0jXcjLfIg0L/W0/jx94KUwWswel6DNzu53KpNek0MofTEWpvti04kT7+M5OaATxDZxwYgKBsVREe+L3NPja4kCyscGcGxMQWnT3hbWTgEEYaWfzT1i+cWRs8Tduu7cGIdapHOtzTyv8RdQN/lS5jL/lkJUOdYN7LEaoKb9qIWc+aEAZ31MEZZygjO9YrZ2AYtz36wJld9pnX9TJvwMKgeUt6vHZmBondAl3R12GoruK41lqpGefuaB/u0WcxZileKlJIJw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(2906002)(6916009)(186003)(8676002)(53546011)(26005)(6506007)(6512007)(83380400001)(5660300002)(4744005)(41300700001)(8936002)(4326008)(6486002)(2616005)(316002)(478600001)(66946007)(66556008)(71200400001)(66446008)(91956017)(64756008)(86362001)(33656002)(76116006)(66476007)(36756003)(38070700005)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5A4E40A5E95C944AA218B23749BC46EF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7347
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8bb9f4ce-dc70-48d2-b4cb-08db7628a717
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	g36q3gDMzqSIx6O8XL7FKCxsmnvK2Siz8bRAHhlI0xKvIShM1br5AWHCg4jqlt/Wy6mUYntGCSovBGmskW/S5CC1TM5zTXSl+Y0Y5Jkh0YywBeT3JXGz5ZxlyqF9p1DhnbjBxMtxOMFPgRw5LSMIZ0fNlRhOKrFEBxQyiCnV5DKbup3Eo5JD8cDpAWn8Jrt+KJxmC0XLCDnRwaO9YSSUN43QeGS/XCL+hrWEl16kS2lonVCLJMGMxkwMV7P+2BM8EIZNjLjhBIQw70Jz3iZlOVOXCsvTFSkHg3vL8EDlGt+1jA9Yek6D8gxxe4Ykr15oQmCIwLGtXeVCFcpceuWK1q/MHx+eHRCjmm2quC+b0PazNILl7p2z0jXzJGvYHDZ3v0yXI8EjlAq4XneeOqLry63LqGYIO+Vmg1fszHgKVTYo3iC9H3LmLR3o5Iji8D8nxGt/RXTrq9A37ulYA8FgCJV2tSLbVeFzQmXwmGyBmUIqKgsiEtodjENBAyznUVKbm1Hf4y/6KXlptAN78zs1RslO3gsq9tQr4mR3hhvF1Us6YQ4TKvIvIzwvjrckuvlvJF5K0UIyI9A8qASEefSa5AZjZTteNrneoXZqGNFjExGF22clx4TDuRsYhoFUJZTCwzWhXepKvcLterAQJXZsdxFus6KsMSIaYKAxuFSVKNAnt5iwSZun4FsQMxoBBCyi5g2tNP/Sua4tn5cKDbHpmQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39850400004)(136003)(376002)(396003)(451199021)(46966006)(36840700001)(70586007)(70206006)(4326008)(33656002)(316002)(478600001)(8936002)(36756003)(6862004)(8676002)(5660300002)(2906002)(4744005)(36860700001)(40480700001)(86362001)(41300700001)(6486002)(82310400005)(82740400003)(6512007)(6506007)(26005)(186003)(336012)(47076005)(83380400001)(356005)(2616005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 09:35:32.9851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 136ed0e2-f64d-433f-5ba1-08db7628b031
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5565
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 09:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183409

T24gMjYgSnVuIDIwMjMsIGF0IDA4OjQ1LCBLcnVwYWwgS2EgUGF0ZWwgLVggKGtya2FwYXRlIC0g
RS1JTkZPIENISVBTIElOQyBhdCBDaXNjbykgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGty
a2FwYXRlPWNpc2NvLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEhl
bGxvIFJpY2hhcmQsDQo+IA0KPiBJIHNlZSB0aGUgZm9sbG93aW5nIHdhcm5pbmdzIHdoaWxlIGNv
bXBpbGluZyBhbiBpbWFnZSAoaS5lLiwgY29yZS1pbWFnZS1taW5pbWFsKS4gDQo+IE5PVEU6IE11
bHRpcGxlIHByb3ZpZGVycyBhcmUgYXZhaWxhYmxlIGZvciBydW50aW1lIGxpYmx0ZGwgKGxpYnRv
b2wsIGxpYnRvb2wtbmF0aXZlKQ0KPiBDb25zaWRlciBkZWZpbmluZyBhIFBSRUZFUlJFRF9SUFJP
VklERVIgZW50cnkgdG8gbWF0Y2ggbGlibHRkbA0KPiANCj4gVGhlIGZvbGxvd2luZyBhcmUgbXkg
b2JzZXJ2YXRpb25zL2ZpbmRpbmdzOg0KPiAtIFRoZSBwYWNrYWdlICJsaWJsdGRsIiBpcyBkZWZp
bmVkIGluICJsaWJ0b29sLTIuNC43LmluYyIgZmlsZS4NCj4gLSBUaGUgImxpYnRvb2wtMi40Ljcu
aW5jIiBmaWxlIGlzIGluIHJlcXVpcmUgaW4gImxpYnRvb2xfMi40LjcuYmIiIGFuZCAibGlidG9v
bC1uYXRpdmVfMi40LjcuYmIiDQo+IC0gSGVuY2UsIHRoZSBhYm92ZSB3YXJuaW5ncyBhcHBlYXJl
ZC4gDQo+IA0KPiBDYW4gYW55b25lIGV4cGxhaW4gaG93IHRvIHJlbW92ZSB0aGVzZSB3YXJuaW5n
cyBpbiBhIHByb3BlciB3YXkgb3IgdGhlIGNhc2UgcmVxdWlyaW5nIHRoaXM/DQoNClRoYXTigJlz
IHZlcnkgb2RkLiAgV2hhdCB2ZXJzaW9uIG9mIG9lLWNvcmUvcG9reSBpcyB0aGlzIHdpdGgsIGFu
ZCBjYW4geW91IHJlcGxpY2F0ZSB3aXRoIGEgY2xlYW4gcG9reSBhbmQgZnJlc2ggYnVpbGQgZGly
ZWN0b3J5ICh3aXRob3V0IGFueSBvdGhlciBsYXllcnMgb3IgY29uZmlndXJhdGlvbik/DQoNClJv
c3M=

