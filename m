Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3573EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 10:32:21 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.80])
 by mx.groups.io with SMTP id smtpd.web11.4253.1689157932082725551
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 03:32:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2F4p7P63;
 spf=pass (domain: arm.com, ip: 40.107.241.80, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoLz/o45cN53FbufQMyWbjyMY9wCHpsyyLMLl/rFsDI=;
 b=2F4p7P63LGDtn1S4XoEac0b9IDUhgArQmN1eSnznEbJOLNRUpuxTZR5eUw9QY8XBo09N12QYyiiZpVu+1uV1iJ1kykr4Em/VeiBMOsGqEqZ7yRrI9q33PKDbrwwhpAhzLy/tTQPQjdGQ9lraJtGJ28VAgDP9YYusU23VnfSpmu8=
Received: from DU2P251CA0004.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::14)
 by PA4PR08MB6318.eurprd08.prod.outlook.com (2603:10a6:102:e2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 10:32:08 +0000
Received: from DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::16) by DU2P251CA0004.outlook.office365.com
 (2603:10a6:10:230::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32 via Frontend
 Transport; Wed, 12 Jul 2023 10:32:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT026.mail.protection.outlook.com (100.127.142.242) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20 via Frontend Transport; Wed, 12 Jul 2023 10:32:07 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145"); Wed, 12 Jul 2023 10:32:07 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b906f2ba4d6a1304
X-CR-MTA-TID: 64aa7808
Received: from 02fcaa22e1cf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 80C592CE-4BF5-44F6-B427-01B6AE8B9BA5.1;
	Wed, 12 Jul 2023 10:32:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 02fcaa22e1cf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 12 Jul 2023 10:32:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSbwklVzpu/3NeWH0i1o3Xn6Ky81YwkoRKfCWyVfVXzlc45IEEPeeJLkFuLwIpMXZ2KqnYQnvf1yiKWjWV/2d4K7iUtFkQfVOBoIwQU4IcXltRayoWEmKFmit08LH5ujbUisZuCvAYnO0CsYA8PvGqTisR3cU0O7s953gqdce1ZJNkVV7EKhNOp5wIpYDDwBh8N806xDT7XyHUG69tjB4Z1SZICWobquP+fmEOncPzGx+LsuJ2WeIyXVkl46tVTYO5xqOr+U4VZNr7kxV23Zt8H8/vg8Vzf+k5It7xYcCs7jMWINTy+xNZgBwetimXG58ORwA7R2/XQBubNFOmYXUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoLz/o45cN53FbufQMyWbjyMY9wCHpsyyLMLl/rFsDI=;
 b=ULHNl5Oa/enr88pBdSso0ayU3052LdtayRf81qNqmQ59TGu+mZ1Zk2zzNAEEJsZTvHsFJLTbj18CaN3y6BkgmFe21O0lBzuhBEXjx0XuXTNBaGKg1Tvxy2qTiXNjJDT4diR5A0Du4E1aTKPBEtPalUwyVSc1aTjTnW13lXyLoVtFw9Jbo/dsrRpX++BaqfQeylWVVhaMj+Im5aa4K8o7q0BUWNYgH4xyOCCZvqSW2X6mofqa+MbsSwovvnztAzpfDhqupgkmFU+2N555M6o6jyC1iQTxbWZs1+qFU0ZoHc2hhqOKF6UWk3RPxCeyZT0WudlOy16ZjdloHxjPTQ6jhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yoLz/o45cN53FbufQMyWbjyMY9wCHpsyyLMLl/rFsDI=;
 b=2F4p7P63LGDtn1S4XoEac0b9IDUhgArQmN1eSnznEbJOLNRUpuxTZR5eUw9QY8XBo09N12QYyiiZpVu+1uV1iJ1kykr4Em/VeiBMOsGqEqZ7yRrI9q33PKDbrwwhpAhzLy/tTQPQjdGQ9lraJtGJ28VAgDP9YYusU23VnfSpmu8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9607.eurprd08.prod.outlook.com (2603:10a6:10:449::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Wed, 12 Jul
 2023 10:31:58 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6588.017; Wed, 12 Jul 2023
 10:31:58 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] Revert "site: merged common-glibc from OE"
Thread-Topic: [OE-core] [PATCH 3/3] Revert "site: merged common-glibc from OE"
Thread-Index: AQHZtFFCjJcs9iFApkmohiszgJb1zK+1730A
Date: Wed, 12 Jul 2023 10:31:58 +0000
Message-ID: <0284332C-6CD1-45E4-AB3F-58CFF1916804@arm.com>
References: <20230711234117.2924622-1-raj.khem@gmail.com>
 <20230711234117.2924622-3-raj.khem@gmail.com>
In-Reply-To: <20230711234117.2924622-3-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9607:EE_|DBAEUR03FT026:EE_|PA4PR08MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f70798a-0a7b-407b-8e62-08db82c33e64
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 xgWxUGbjq47AZRNny2dbZdpAmx3Uh53/lHyOBlYkIgqCgVXUl1lr0opYNZfiauPyMIgaA3pIQ2+uA4AyEStwESb8lyuA06NzaMh5w76gs+PMy0wr09kigrNfDPRLJFWdNoMOGtXlbxJP9Ctvmft0sSB7us6Bx36J/eMn9QvAzAHPMUdOjrvgDdGRFTYIB91BvOWnBfSM782H+ixmiVbehDVOSu5Xi1UdASHrsyO1YXRcpkVX/FcTP8qlYY5IGqA7wsMA6Dv7iIHsMtqPf0otY7PuO8ZSJH6OQ6syKXJTGkIqbC5oWlNXJrw8G/480sHOEYT3/HKRhOFngI3CebwZZaVpnahep6Z7p7ctYkz+Y6nSIKpziXYicNOkJ5Ck46EUlP+SWGMgQRzXIlkwoawlNmS9IEGr77moTDPkRvE+ZFyQN9+v7DXFbDzmPyM6WC7zYhoBcAg8p3VIG+LlpamIytPrzqR/M42LUIDgt+2tegwMogUCQ22rV6RpJkdCCVbuVdHI017dMPPyxFqx6eU0gSTKxy4S190yTpyF+beRQI/I5CzRu2U9HrXqbW6ugrQ5iyfLPrJEpM77G6eQfQBtD01/wV9yWG5Z/2WX6IgCrGyGJfC0LRzHWBgi+3X/fNoxx/24/tQmkptQVMe1aaNU0DJDvt6dN8i4oRkUvL4cxdUy+dvSS4th/fOMk8TI32fC
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(66899021)(6486002)(71200400001)(478600001)(122000001)(5660300002)(8676002)(8936002)(2906002)(36756003)(86362001)(33656002)(38070700005)(6916009)(4326008)(316002)(76116006)(66476007)(66946007)(66446008)(64756008)(38100700002)(91956017)(66556008)(41300700001)(26005)(53546011)(6506007)(83380400001)(2616005)(186003)(6512007)(966005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <976B75FDA02AC7428EB665FCFD5B6F4E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9607
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35e1786f-21ce-471e-5ab9-08db82c338ed
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XocashTfBKs+VYSqudnS0WhtCDUHsjD/CxbXO5eGyy0X/LEItoZIaWJmEaXIh2a7KKnE7y98Ir8z33FaLeJT/XRgLavvN5Yx0tcFC7N7hGwrdMtJgAwC8a4UQSphqdYahj3x2LrnQBs2ub3t75s5hJlRqdgdNQ+/jobZBvXSnMVy3MivXe8/aFbU+rGo1SBB1IsoyeC/Gqrsu++DlOpP+10/wE4aO3B61h+HaL/i0KkzWpgSAcTlMR/cGef76pyjfv8oC18v6iY7hCoKv6CtwhxY5b8k1U18nrRAW8ivw+sRxJd4RFBy0LxhFmDa7ktNX3+ucmCtCTiG+pAwRS4nJyDENCMVpwbQgv2KAie0qEY3/O1+mmFq8YdUfLgBxL4TjFF6CUsStFU8eIG/eKuoev4Cn+/I0QiSP4bWdpCFrkBnLSvNAWb5tLGwr+AO3lKKWUw2os/n5x5r1teZx2cryLCxRUi9XvxMKzvCYrXgSqWp/cl5Zl/amC2k05ShvxKS5ZY+JYArhlgogy6u7xL2BmSzJ9ycyQJazFgjKT8KU8gOjErKkoasPT5kmwi78mpw04G1gsdgIpxZDIir6dInTaE1zROX4vale0PIwDzKBN08VbaQ5oC07AgWB95rSwUoDQpiovGrKYmu2dZzg9mhDTBfEDXu6OlPX9EaG/QMcV7zRpb5Rt0+Vo0UB+s6CVvD5KqnzFFjOhxN55K6+g6SgKLAr42/Oo9uoY3rWA3hhA9paPkLTROu8TI9M4WWfvGJcgeT3EkmxlCYo+iTJAN6Tw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(316002)(186003)(478600001)(66899021)(41300700001)(70586007)(6486002)(70206006)(4326008)(6512007)(966005)(8936002)(8676002)(6862004)(40460700003)(5660300002)(53546011)(40480700001)(82310400005)(86362001)(26005)(6506007)(83380400001)(36860700001)(33656002)(47076005)(81166007)(356005)(2616005)(36756003)(2906002)(336012)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 10:32:07.9911
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f70798a-0a7b-407b-8e62-08db82c33e64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6318
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 10:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184174

SW5zdGVhZCBvZiBqdXN0IHNheWluZyDigJxyZXZlcnRpbmcgYSBjb21taXQgZnJvbSAyMDA4LCBw
bGVhc2UgZXhwbGFpbiBfd2h5Xy4NCg0KUm9zcw0KDQo+IE9uIDEyIEp1bCAyMDIzLCBhdCAwMDo0
MSwgS2hlbSBSYWogdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHJhai5raGVtPWdtYWlsLmNv
bUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IFRoaXMgcmV2ZXJ0cyBjb21t
aXQgYTJmOTQyYzIyZTMxZmUxNWZlZjFiNDRhMGU1Y2M1NDhhNjBkNDNhNi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IC0tLQ0KPiBtZXRhL3Np
dGUvY29tbW9uLWdsaWJjIHwgMSAtDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9zaXRlL2NvbW1vbi1nbGliYyBiL21ldGEvc2l0ZS9jb21t
b24tZ2xpYmMNCj4gaW5kZXggN2JhOTFlMDNjMDQuLjk1ODY5OWIxNDNmIDEwMDY0NA0KPiAtLS0g
YS9tZXRhL3NpdGUvY29tbW9uLWdsaWJjDQo+ICsrKyBiL21ldGEvc2l0ZS9jb21tb24tZ2xpYmMN
Cj4gQEAgLTEyLDcgKzEyLDYgQEAgYWNfY3ZfZnVuY19nZXRncmdpZF9yPSR7YWNfY3ZfZnVuY19n
ZXRncmdpZF9yPXllc30NCj4gYWNfY3ZfZnVuY19nZXRwd3VpZF9yPSR7YWNfY3ZfZnVuY19nZXRw
d3VpZF9yPXllc30NCj4gYWNfY3ZfZnVuY19wb3NpeF9nZXRwd3VpZF9yPSR7YWNfY3ZfZnVuY19w
b3NpeF9nZXRwd3VpZF9yPXllc30NCj4gYWNfY3ZfZnVuY19wb3NpeF9nZXRncmdpZF9yPSR7YWNf
Y3ZfZnVuY19wb3NpeF9nZXRncmdpZF9yPXllc30NCj4gLWFjX2N2X3R5cGVfdWlkX3Q9e2FjX2N2
X3R5cGVfdWlkX3Q9eWVzfQ0KPiBhY19jdl9mdW5jX2dldGFkZHJpbmZvPSR7YWNfY3ZfZnVuY19n
ZXRhZGRyaW5mbz15ZXN9DQo+IGFjX2N2X2Z1bmNfc3RydG9kPSR7YWNfY3ZfZnVuY19zdHJ0b2Q9
eWVzfQ0KPiANCj4gLS0gDQo+IDIuNDEuMA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09
LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3Vw
Lg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE4NDE2NCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTg0MTY0DQo+IE11dGUgVGhpcyBU
b3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMDA5MDQwOS82ODc1ODg4
DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9v
cGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0t
PS09LT0tPS09LT0tPS0NCj4gDQoNCg==

