Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E04C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 13:55:47 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.55])
 by mx.groups.io with SMTP id smtpd.web11.91420.1700747741141438680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 05:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8jn2xlRB;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=8jn2xlRB;
 spf=pass (domain: arm.com, ip: 40.107.21.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Kvc0ZYcUR4kTR0+xBqE2HdIh7ex9d4qtXH5ucJ6wLrpp18iG/YwJyBrb4K5EZvy6kRRrBJdiceaPMFb9VOlIjxYwK4VZd/7bHJ6WySwPpsThygHjpbT5z060UaWksGfYWE2t7g5Vouf3/8e4/qAe9G5uTfeGYwtqA8GdGSWFnSZmuY2kKtNNltCwlsFkSM7euo7jLPEvkE3AKhPAuaZ6duKiao/J5dO85s6TUUT4Ey+mMlPhyskPCIvk4FnZeIcNzpUIHpy4TpmtBwE7YiNWVhBpsxzrLAvvp8Yc8vIKTTnCHlNX2VGtiRcvtPlI2sOX8zBi7uml37ncT61yRtgaaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MkmOV+/s24rDtig0RcuCaJ409+JWMIYMT6OlBVzGi0=;
 b=PQjdH4guw7b95z5IjJT7ZOIb+opTXxXOtEq0HznEYVP13yV5FuHRnBl1VHnVfaCm/4S5V8kbV02tLAzIsoBL9HmJ/HpIe2symWE/z9pq8a7uJz+LsJk3Ui6lKadC5P1rXJ8cWWf2DQJooiHQXOohKs2RYCC97GHVuNy9qDqs0JMrGCfMP6vZal3rpMCzGg+clRIUskkQ1oGc29TzS6SOCaLlE3fv5hauoy/w4gD0yjFQ7EB6Zs7jAFX/Ox/AqFfkccxfLm8TYFnj4L+s60W5ItBItiEIj9dw1PON188etx50lmPRgI2XhL/4Dr+jsn/XMhr6BAGdhROj9dmhHMNsXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MkmOV+/s24rDtig0RcuCaJ409+JWMIYMT6OlBVzGi0=;
 b=8jn2xlRB6LOZQjfV4PH0/iubm1mmwe/jUVnWU8zU9lnVsaLgiyDzzrTvk23eeeMp8et6LpiBroVktnVd5RW37LlrgV7XpXfo8NjvI48iw9SX2tb0SVv77i07OzKlmzKJkY1r1XwmfmA7GqSRXpwqUdL24iAafauZCSd0nlikpUM=
Received: from AM6PR10CA0080.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::21)
 by DU0PR08MB9077.eurprd08.prod.outlook.com (2603:10a6:10:471::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 13:55:36 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:209:8c:cafe::b) by AM6PR10CA0080.outlook.office365.com
 (2603:10a6:209:8c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Thu, 23 Nov 2023 13:55:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Thu, 23 Nov 2023 13:55:36 +0000
Received: ("Tessian outbound 385ad2f98d71:v228"); Thu, 23 Nov 2023 13:55:36 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dd2995639c9803c3
X-CR-MTA-TID: 64aa7808
Received: from da3da591cec0.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 52527C48-B3B4-40EA-B4CC-5877F97B5F8B.1;
	Thu, 23 Nov 2023 13:55:30 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id da3da591cec0.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 23 Nov 2023 13:55:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcVfJ962fLB8v/D82X8VFHZnQOnq5ma/woNQfLXGLU1mP++u6eR9AHXo+h3YFOvYjM3A4jZ+VAZPgPpdBrOc2Wj8qjuEAEQFZ5kCL1ZWHHxHrM9GZW6KHHK6XerdurDgVaZph8wVe+7nywl+x424LRxe9G4+BrspVY8Qw6QtP+x5dmS124WBW5+yxAa/oAy/p+IA4SR5X1TCyKW4Mxevl6lXiKFpRrMvdWPD2W/aiyr2g+BXUd+71AEKw9e4FkuU9dFCRZq/JbrpaktMQVVspShilYQ6QyPYiHhsFZz/SB1ZgdlspKCbnf8BkTNaRNG65U88YuQKZk+yEFcTlslZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MkmOV+/s24rDtig0RcuCaJ409+JWMIYMT6OlBVzGi0=;
 b=ZZSXBRL/zK83AwKOfKraiJztodVFOSlQFieQsUejRFp2nUd+qBrrwU0E3hr6wf7DEqJvsCsQ2SMpDuhAn7xyrcfcsIibFuhweHXyUOgibNdrhB2PZLBjg5BOjwmOGHxRm40/TNjEB7kddaksJas7dCuHvnenGbW0xsSs4clz/j8kjQ/drSPuqrXWwE/NKqQea8j7+8ZGIjUZNaRVb3c2huNqEOp1uB6sFTan4GwG6eti61M4Q2nN+3LAe3FLiAPwINzl6JK0/BQ1twFkHsPUEAkpx0nHqOaHwkEDhuDBr/dc+pQuwu9tS89mrL9WWGpAkK9ItDvxrClCOnhTHp5ZzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MkmOV+/s24rDtig0RcuCaJ409+JWMIYMT6OlBVzGi0=;
 b=8jn2xlRB6LOZQjfV4PH0/iubm1mmwe/jUVnWU8zU9lnVsaLgiyDzzrTvk23eeeMp8et6LpiBroVktnVd5RW37LlrgV7XpXfo8NjvI48iw9SX2tb0SVv77i07OzKlmzKJkY1r1XwmfmA7GqSRXpwqUdL24iAafauZCSd0nlikpUM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM7PR08MB5334.eurprd08.prod.outlook.com (2603:10a6:20b:10b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Thu, 23 Nov
 2023 13:55:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7025.017; Thu, 23 Nov 2023
 13:55:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mikko.rapeli@linaro.org" <mikko.rapeli@linaro.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] cve-check.bbclass: support embedded SW
 components with different version number
Thread-Topic: [OE-core] [PATCH v2] cve-check.bbclass: support embedded SW
 components with different version number
Thread-Index: AQHaAyoJY6wvx9CkjEidoW7NccrKs7CIIwyA
Date: Thu, 23 Nov 2023 13:55:27 +0000
Message-ID: <40A69E24-CE3B-4C57-B341-450454CEFFE7@arm.com>
References: <20231020074926.230734-1-mikko.rapeli@linaro.org>
In-Reply-To: <20231020074926.230734-1-mikko.rapeli@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM7PR08MB5334:EE_|AMS0EPF00000193:EE_|DU0PR08MB9077:EE_
X-MS-Office365-Filtering-Correlation-Id: 38968a65-5eb9-460f-03af-08dbec2bde9a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 hgpOtustSSdXffjFW0s2tahZS90+qU+kVV18CCrKE40Hye7dYWLRex84YMzn7FKArv8jxgDqRBxXKQNyNaAPnXuc5tjMPNRE+HyLOk6Vvuw/isHBi2u1W+dnUrDTyHBbyzhvC7d2Rd4YnoXCHzgCgtDA+0G5BB5dSeQISu6esFjvxYE8pgEqVUTuZwrjxHuIPshqtE/E9CFWJGtOHOXC7oBGg+RnAO5qWdYs9SOrWzXORnpL3eyx8mM3I+jwH64KGGpKaffCMdvljrTbObNgrbgfulY/4LvhdYg+VTPjM/p2Gy6xl2yZXRLj+z850KaJb3pOl4EbdjEFPUYpcu7CQF6adTQpRopUBcrqHguc8YGQG0giQTa6BaVVO/AEH1dK/ED2bLUoX8/FAOC4dVOv1B7bN7ka0uj7lwrd2rNOVTUsBChvqcvFLv9it8HTmp86/XUzc78wnkYaOUs+OQ1s5JNNUQ2p/ZVP3EP6RMb9UcQuK1GwQ4OsItFgF+szNJut0HJeKHln/jh32Awp/QodwNhqjWw1Dzyc9BOp6+exEuZHvepF4jQaIuWYiPnAXPY6h1wbRZwoQBdYSUe6zZJV0KHfPi7lFiq3mNtylg3/VVey3h4tc7E8UZqsKM71y+vBD0CMH2SxtAv/CbOxKwgBhQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(366004)(39850400004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(2906002)(5660300002)(4326008)(8936002)(8676002)(86362001)(38070700009)(33656002)(36756003)(38100700002)(122000001)(41300700001)(66476007)(64756008)(66446008)(76116006)(478600001)(66946007)(91956017)(66556008)(6916009)(316002)(2616005)(26005)(53546011)(71200400001)(6486002)(6512007)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FB44521531C8A4A882CD2118CD177A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5334
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	620dbadb-a48d-4421-441b-08dbec2bd979
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oswMApoFJ78WZucQfoZvEBQYPJWDT+MoiNYYpVa414h/XArp2/gyak7f3YirENw5I0Nw901lRt5mJMpQPLXNR2L8c0M1+EkTWy2qRkkffSTJ4iPa1Ou4tGPOwNxzBnsR4Xq5EIDH/UQ1kZVekk0dDxbIqqnWj5b8qJGLCDQZIlpF6dqUFBRFwsriEo/cIjHGkALfj+nkWksqa8R9Jj51AnPVsCCKxkQbyNLz8qx2ZPvcl6Nxul0J/a24amXPM/1+9DkLMZWvMt0YjBrPpThZIdmPUMYULmBKqXiyrfjcOQOcgr7NoeJYEhoynCehjciAByqQXsGVoXUPHo2Wf/IgYx9gga8i9rwk56FOCVnM0MsTv1SoF3lggAfhMLYocv/yZsuJ7Utw5lg+d2WmOQHJsxQ6qJYH4cWQoSY68SOM9n5pyInoIZsqf4e8Q0YrGWnx4r5aJB+oYUE+/iuTOZ+DuqA+Luiy4VUhfnPahCgL6ZfNSAqsQUy9mgEw2M5XpGMoVa61xv9YUABNcFKJOqIjRSzcKp+zXy06P+7O/XCk9lFILqC12QQKF/0X9nMq49Ilmq2uH/NpiOifh1KyVOAaDMPlA4yA3cAJUHl/zO0mULpMQPkk6Iota6q0BPye0GJclwi0Q4KSp7JEhV/fiUwc1GWzZkQXUAzCwVzgujqGZ31/uCk/faYYuV8hre4Ui/Qvmfb8YoBUBy67zICU6BXhyX/6au9+PTLMdHiHGnpOuH2Whdmhocl0fDfoIMgs8cnh
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(40470700004)(36840700001)(46966006)(5660300002)(2906002)(8676002)(8936002)(4326008)(6862004)(316002)(70586007)(70206006)(41300700001)(40480700001)(6486002)(6506007)(478600001)(53546011)(26005)(2616005)(6512007)(336012)(40460700003)(47076005)(36860700001)(82740400003)(81166007)(356005)(33656002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 13:55:36.4972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38968a65-5eb9-460f-03af-08dbec2bde9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 13:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191156

T24gMjAgT2N0IDIwMjMsIGF0IDA4OjQ5LCBNaWtrbyBSYXBlbGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPG1pa2tvLnJhcGVsaT1saW5hcm8ub3JnQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiBGb3IgZXhhbXBsZSBpbiBtZXRhLWFybSwgdHJ1c3RlZC1maXJtd2FyZS1hIGVt
YmVkcyBtYmVkX3RscyBTVyBjb21wb25lbnQuDQo+IFRodXMgdHJ1c3RlZC1maXJtd2FyZS1hIGNh
biBhZGQgQ1ZFX1BST0RVQ1QgZm9yIGl0IHNpbmNlIENWRSBkYXRhYmFzZQ0KPiB1c2VzIHByb2R1
Y3QgbmFtZSAibWJlZF90bHMiOg0KPiANCj4gQ1ZFX1BST0RVQ1QgKz0gIm1iZWRfdGxzIg0KDQpS
aWdodCBub3csIENWRV9QUk9EVUNUIGlzIHRoZSBzZXQgb2YgbmFtZXMgdGhhdCB0aGUgcHJvamVj
dCBpcyBrbm93biBieS4gIFBhdGhvbG9naWNhbCBjYXNlIGJlaW5nIGN1cmw6DQoNCkNWRV9QUk9E
VUNUID0gImhheHg6Y3VybCBoYXh4OmxpYmN1cmwgY3VybDpjdXJsIGN1cmw6bGliY3VybCBsaWJj
dXJsOmxpYmN1cmwgZGFuaWVsX3N0ZW5iZXJnOmN1cmzigJ0NCg0KU28gdGhpcyBhIGNoYW5nZSBv
ZiBzZW1hbnRpY3MuDQoNCj4gYW5kIHNldCB0aGUgdmVyc2lvbiBvZiBtYmVkX3RsczoNCj4gDQo+
IENWRV9WRVJTSU9OX21iZWRfdGxzID0g4oCcMi4yOC404oCdDQouLi4NCj4gQ1ZFIGNoZWNrZXIg
Zm9yIHRoaXMgdXNlIGNhc2UuIEkgaG9wZSB0aGUgIkNWRV9WRVJTSU9OX3ZlbmRvcjpwcm9kdWN0
Ig0KPiBkb2VzIG5vdCBjYXVzZSBvZGQgYnJlYWthZ2VzLg0KDQpJdCB3aWxsLCBiZWNhdXNlIGJp
dGJha2Ugd29u4oCZdCBrbm93IHRoYXQgdGhlIGNvbG9uIGlzIG1lYW50IHRvIGJlIHBhcnQgb2Yg
dGhlIHZlbmRvci9wcm9kdWN0IHBhaXIgYW5kIGl0IGxvb2tzIGV4YWN0bHkgbGlrZSBhbiBvdmVy
cmlkZS4NCg0KSW5zdGVhZCBvZiB0cnlpbmcgdG8gc2hvZWhvcm4gdGhpcyBjaGFuZ2UgaW50byB0
aGUgZXhpc3RpbmcgdmFyaWFibGVzLCBtYXliZSB3ZSBuZWVkIG5ldyBvbmVzLg0KDQpJZiB3ZSBz
b2x2ZSB0aGlzIHByb2JsZW0gd2UgZG9u4oCZdCB3YW50IHRvIHNvbHZlIGl0IGZvciBqdXN0IGVn
IFRGLUEgZW1iZWRkaW5nIG1iZWR0bHMsIGJ1dCBhbHNvIGFyYml0cmFyeSBSdXN0IGFwcGxpY2F0
aW9ucyB3aGljaCBzdGF0aWNhbGx5IGxpbmsgdG8gbWFueSBjcmF0ZXMuICBJdCB3b3VsZCBiZSBn
cmVhdCBpZiB0aGUgc2FtZSB0b29saW5nIHRoYXQgZ2VuZXJhdGVzIHRoZSBTUkNfVVJJIHdpdGgg
dGhlIDEwMCBjYXJnbzovLyBlbnRyaWVzIHdvdWxkIGFsc28gc2V0IHRoZSByaWdodCB2YXJpYWJs
ZXMgc28gdGhhdCBDVkUgdG9vbGluZyBrbm93cyB3aGF0IGNyYXRlcyBhbmQgdmVyc2lvbnMgYXJl
IGluIHRoZSByZWNpcGUuDQoNClRvdGFsbHkgbWFraW5nIHN0dWZmIHVwIHdpdGggbGl0dGxlIHRo
aW5raW5nLCBidXQgaG93IGFib3V0IHdlIGxlYXZlIENWRV9QUk9EVUNUIGFuZCBDVkVfVkVSU0lP
TiBhcyB0aGUgc2V0IG9mIGtub3duIG5hbWVzIGFuZCB2ZXJzaW9uIGZvciB0aGUgdG9wLWxldmVs
IHByb2R1Y3QsIGJ1dCBhZGQgYSBuZXcgdmFyaWFibGUgdXNpbmcgdmFyZmxhZ3MgZm9yIGVhY2gg
b2YgdGhlIGludGVncmF0ZWQgY29tcG9uZW50cz8NCg0KQ1ZFX1BST0RVQ1QgPSDigJx0cnVzdGVk
LWZpcm13YXJlLWHigJ0NCkNWRV9DT01QT05FTlRTW21iZWR0bHNdID0g4oCcMy4zMOKAnQ0KDQpX
ZSBjb3VsZCBldmVuIGRvIHNvbWV0aGluZyBjbGV2ZXIgYW5kIGFsbG93IENWRV9DT01QT05FTlRT
ID0g4oCc4oCdIHRvIG1lYW4g4oCcYWxsIG9mIHRoZSBjb21wb25lbnRz4oCdLCBidXQgaWYgQ1ZF
X0NPTVBPTkVOVFMgaXRzZWxmIGlzIHNldCB0aGVuIHRoYXTigJlzIHRoZSBzZXQgb2YgY29tcG9u
ZW50cyB0aGF0IGFyZSBhY3R1YWxseSBiZWluZyB1c2VkLCB0byBoYW5kbGUgY2FzZXMgd2hlcmUg
ZWcgbWJlZHRscyBtYXkgb3IgbWF5IG5vdCBiZSBlbmFibGVkIHZpYSBhIFBBQ0tBR0VDT05GSUcu
DQoNCkNoZWVycywNClJvc3M=

