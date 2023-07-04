Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2ACEB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 10:54:48 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.73])
 by mx.groups.io with SMTP id smtpd.web11.55881.1688468083728754575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 03:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=E5ZsKgrv;
 spf=pass (domain: arm.com, ip: 40.107.15.73, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv2diSeLHPwhm+RIJQl9w3VsCjvaaSPohR938R81Lx4=;
 b=E5ZsKgrv0JW1jIus+Ha4hVZyx7GrieD2xVXQ64oGCkoSxZhLWIHViAh2oYFJIeAoHMZv2VtNMswmFDKJiW36znhh8CDsyEWwAc1J5XhuC4IkSKDHJ6mQrKgXXZ7fhIse4BQcMHYw7gaDHL6xI7vl/DXMoDelUWeXekfCB4H7Sp8=
Received: from AS9PR06CA0649.eurprd06.prod.outlook.com (2603:10a6:20b:46f::25)
 by DU2PR08MB7358.eurprd08.prod.outlook.com (2603:10a6:10:2f1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:54:39 +0000
Received: from AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::e8) by AS9PR06CA0649.outlook.office365.com
 (2603:10a6:20b:46f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.31 via Frontend
 Transport; Tue, 4 Jul 2023 10:54:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT043.mail.protection.outlook.com (100.127.140.160) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Tue, 4 Jul 2023 10:54:37 +0000
Received: ("Tessian outbound 546d04a74417:v142"); Tue, 04 Jul 2023 10:54:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cc03ac6d62980481
X-CR-MTA-TID: 64aa7808
Received: from e3fe81f7ecaf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 64C86EAB-6210-4B45-962A-E01E32298807.1;
	Tue, 04 Jul 2023 10:54:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e3fe81f7ecaf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Jul 2023 10:54:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YBDb0u+Zpla4yVUpsdDm+YuKd/O5maqbTPLfKCCmmwx9x5sfMEGp/euMC7PbaUOHTmbywJUgWvCpvSnVXRWC4/0rs8uPciV6oC3k+mZGWqf3aFhOfSSyz108XoXGD/dFpdY7TeksYTrGuRSJ1LPlpWO+SJv/7Vs1VQGpXm1QiN9dz6onvLVTsSUqjveVQnS78abbDJy+duBbIjHlzN9BFxLCW3Gkzen7pZc0TbmrgxvTABxFSVi38tcKuw9Xc6OBWTH+jv7u8EvZ6+BLPhDqWZdV1XhSB4Hggv8TWJHO6ObdWpTJGENNUj+yRGfPXXDkOlC7UXYObYK+TKpwgn9PJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zv2diSeLHPwhm+RIJQl9w3VsCjvaaSPohR938R81Lx4=;
 b=kC7dl0/TUuhgkrVEhWr5u5Q4d7hi1KktDYuWAlmpy8QjsIbo0KU+fBkVRguUhmsieV10HF9GgKXvKSRHrFQLhYg9ULC5K8IJgPakgSy66WMN5Jb2JtnGorGsPdGiZpdRi8OiY3mZBhczKqWKtyQv+CivhFyyv/61eKJ7fJIAW5IKn5SXF4/Er72iVbHVpoqLXuX/dwYNR/Qe+dWESgd5qxgrK/46R4dTILQXPaT1fy2WqAFPYLYlnqHenLnc6cfR9kKE+jH0bo1YP8PPVLgPYKLjJVNw3wAz+F0PH9Wg+aini3SrPppWcOARV5y42Q3mpMCvs69uEeB6v1Y2vebwmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zv2diSeLHPwhm+RIJQl9w3VsCjvaaSPohR938R81Lx4=;
 b=E5ZsKgrv0JW1jIus+Ha4hVZyx7GrieD2xVXQ64oGCkoSxZhLWIHViAh2oYFJIeAoHMZv2VtNMswmFDKJiW36znhh8CDsyEWwAc1J5XhuC4IkSKDHJ6mQrKgXXZ7fhIse4BQcMHYw7gaDHL6xI7vl/DXMoDelUWeXekfCB4H7Sp8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9063.eurprd08.prod.outlook.com (2603:10a6:102:32c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:54:28 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 10:54:28 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/3] libxcrypt: Limit to enabling strong hash
 algos only
Thread-Topic: [OE-core] [PATCH 2/3] libxcrypt: Limit to enabling strong hash
 algos only
Thread-Index: AQHZpl1NXQ8+cB970EatL4kwUnXKpq+jYXKAgAYdlgA=
Date: Tue, 4 Jul 2023 10:54:28 +0000
Message-ID: <47BAE092-A229-4277-9452-309EB327B0E8@arm.com>
References: <20230624053223.228117-1-raj.khem@gmail.com>
 <20230624053223.228117-2-raj.khem@gmail.com>
 <20230630133051db39352e@mail.local>
In-Reply-To: <20230630133051db39352e@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9063:EE_|AM7EUR03FT043:EE_|DU2PR08MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: b3f76cd1-195a-4676-e463-08db7c7d0fbf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 GgtE3V9oQ48/3PjEuxGzXbMK7rk8lRWWF3KSejb6ojl1jCaIVAtWmz6LTbnHPFtmV2YeD91vkcEbs8ao1SXorSnuaXGo1bS1OiKmJn2QP8ufhBT8d59dGYyL2Wky7XjGEC6r0nirQ4yEaQtqTpFSfoYLeLWNgJZdYvbqrLmdOL5QXqEE48BS0bQWuX47uYeSVRPC+xzCkzzD3rv4clDbJnUJ74VEVGHFZkFaBJhLN4x/JS4GwQ8e7krplROUCPEYc+vB2fVvRF8fc5F+NkhuVZy4qXZ4z35A6EMIAX7TxJzHLLDZ1/QqhmHHUl3tRY06ONXYwG8zLLgZ/xxbhvmXkE/exrk3mc7O6mq3AZTuLvKbGOioOY/2rXPLrjNfzffr9lSVXOw7VyLuF9ADUlhXOoMdPWqfU4Ddja8hwc9b32ENY7ncB6IjK7nia/FReGfPcZniOPil5XeneQ+OPJWFUocyv+dYuw0IfmR6nBlsPyLls0pGoBo+AvbXZley9EvfPZCulK4c2G3Erpcn/pypAE+J4IK/0XpQltXdro02o908hYlfBsMpaWHXpItrd2Kk6Shwn8sU3+gCD0Vk7akv5cgViStZ2fb7OPZpu/XHjczFCMMyfWArU4WXxntA8ZB0EPNw3BWvh/UruQdRq1Qk+w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(54906003)(2906002)(4744005)(478600001)(26005)(41300700001)(33656002)(6486002)(86362001)(36756003)(8936002)(8676002)(71200400001)(5660300002)(316002)(6512007)(66556008)(66476007)(66446008)(66946007)(4326008)(64756008)(38100700002)(122000001)(6916009)(38070700005)(53546011)(6506007)(91956017)(76116006)(2616005)(186003)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D6EC8D49FDC1AB45A5CE73C7834D1910@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9063
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	121b39d0-9620-4315-f15d-08db7c7d0a34
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tIrTwKv1VtnvMZmDHPnunORgXbID8UU5KVhxIJjLqQLsNu0P/5J5ZssAIkUfH1CdcoLygElZTPQ92WsGNZW2M3Fx3Q9jL6YupoSxIpSqR5ynFy9KbzyPaQImCAZVld/+5QvLXoFaq4PY6GKr5gF03qyG6eYm3qzTyJlax7atSMrIGvnpCtS3AShU+q1Ovxl1HWAldQi4pucNbRM364URrzW6fDhEB3ELyCT169QwgDCeGNXD3Z7ggs87blcmJ83AlnM9OBr+tL8JaWtwZCLJvhA/t5Z7pRh8disuru0OLmnv6IxkoDxXjEXvcKieU3NN0EiPBxhAZXdyITfNKEKzF8uDuvuom4IOxOaeVLVAbQQ0vzYulW18AJ6ZMx/D8RPR1Fx9o+IUWvfeXQPC70jq6rbmN/jfLsreux1Vp78ly/UENvZpd6Trd5l4lHiWhn2ubZwRrcxCZ3xBoTHf5nY80BAh7fHj6yCH6qh3Vm9WxS0IyVzgQSwxxyD7xK5BKPh1P1OZauZXvOpVfX3RGnsNub5J8k5yjhGfI6xsTR5RKAehcWFoAA1kIKMBiYepCNyZPwzWWZrk/2KUiq4VAeVutHR5EDDF+NYHgqQeO7ZitIQM+jMx7kEQOVU9kYn1jl+e4zEAV8w80jfxd+X4W58xgRYgAdfDpf9ibdWiS6UIJRoEZFbv4WrjNZLld8MK3j/e9k98qXYP9uv6A5/DJFlc5BoEEHXmEThptVv4wpT1TujDYLrnfYeFS3+9cS69hpl6
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(4744005)(2906002)(41300700001)(6862004)(5660300002)(8676002)(8936002)(82310400005)(33656002)(36756003)(40480700001)(86362001)(186003)(2616005)(478600001)(26005)(6512007)(6506007)(82740400003)(6486002)(70206006)(47076005)(316002)(70586007)(4326008)(36860700001)(81166007)(54906003)(336012)(83380400001)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:54:37.9422
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f76cd1-195a-4676-e463-08db7c7d0fbf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7358
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 10:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183825

T24gMzAgSnVuIDIwMjMsIGF0IDE0OjMwLCBBbGV4YW5kcmUgQmVsbG9uaSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleGFuZHJlLmJlbGxvbmk9Ym9vdGxpbi5jb21AbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBIZWxsbyBLaGVtLA0KPiANCj4gVGhpcyBjYXVzZXMg
cHl0aG9uIHB0ZXN0IGZhaWx1cmVzOg0KPiANCj4geydweXRob24zJzogWyd0ZXN0X2NyeXB0Jywg
J3Rlc3RfbWV0aG9kcycsICd0ZXN0X3NoYTJfcm91bmRzJ119DQo+IA0KPiBXZSBzaG91bGQgcHJv
YmFibHkgZGlzYWJsZSB0aG9zZQ0KDQpJIHdvdWxkIHNheSB0byBzZW5kIGEgcGF0Y2ggdXBzdHJl
YW0gdG8gbWFrZSB0aG9zZSB0ZXN0cyBub3QgZGVwZW5kIG9uIHRoZSB1bnNhZmUgYWxnb3JpdGht
cyBleGlzdGluZywgYnV0IHRoZSBlbnRpcmUgbW9kdWxlIGhhcyBiZWVuIHJlbW92ZWQgaW4gdGhl
IG5leHQgcmVsZWFzZSBvZiBQeXRob27igKYNCg0KUm9zcw==

