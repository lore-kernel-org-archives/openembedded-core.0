Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955D3C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 11:27:09 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.68])
 by mx.groups.io with SMTP id smtpd.web11.19528.1684841221869930943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 May 2023 04:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=HJN6g67f;
 spf=pass (domain: arm.com, ip: 40.107.6.68, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbPFNte8csntkhTdeAw9wYz5YpZookMuDOmmrmOFEp4=;
 b=HJN6g67fzFfJ8LGbU+SNNdd5GZJAOMc9IAGTgfq0TgOJKI5mqJRROgeoSOUls/kmUoowYP1CQZe/9AxWarm9dIeSE5WL55S97QqIKuqXgz36s8d4uwLQbBj6ZP9FFAJ9OxzI5J2r6RDpjmI6CVX2g3/o3CM0cHrx1dnJG8vGRJQ=
Received: from AM5PR0701CA0002.eurprd07.prod.outlook.com
 (2603:10a6:203:51::12) by GV1PR08MB8691.eurprd08.prod.outlook.com
 (2603:10a6:150:85::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 11:26:57 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::76) by AM5PR0701CA0002.outlook.office365.com
 (2603:10a6:203:51::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.14 via Frontend
 Transport; Tue, 23 May 2023 11:26:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.14 via Frontend Transport; Tue, 23 May 2023 11:26:56 +0000
Received: ("Tessian outbound 5bb4c51d5a1f:v136"); Tue, 23 May 2023 11:26:56 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3b7752191d27659d
X-CR-MTA-TID: 64aa7808
Received: from 967e824e130c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0ABD5852-5358-47DC-BAB0-1D664B88E762.1;
	Tue, 23 May 2023 11:26:45 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 967e824e130c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 May 2023 11:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdvpK+3DcwBju8vO5SVo0MYgVoX7D1iSQJ7WEecpsGpg8HWbk62NSJxa/WhDGod6qa/ACvF4WGVwpELzlvpCTPQ7POPHMaqjWj4X4/TiDfgt0etGuOPh3SuS3E0h8K8gbH9Zb33qllKoNkNQXJ8Fg1rsP/q4VL4QRZAxJQu40LwzWi5C5FP/LMrjJLg6HLs+c7pNu6AAp/a3QgM1eIK4TqCZc6V3v4yz0/7hrMWlKpIU/luSNa+FqQZwKwA5BA5SI0vnJNWtDqEJcV1LZRkfOxJxSwvbGqx+Jw2wiunTP+j86cBYO+SFHGuLy969HJLIcpZtFRE1Kc/NBSYTTL0igA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbPFNte8csntkhTdeAw9wYz5YpZookMuDOmmrmOFEp4=;
 b=DjNlWuJLK8X7d5rFFflTKbshj9oKZoZV+IiHZcCL41qHFoWCFrMheefpjFCDW9Xvt6nI1OYPz4gVH0vL8AJG68FxcWlXywLV8xHgCKHaHmRmB8KJmqsYo3LNkJEO/udU8YUN+C0XHjsX2IqjpgzThMEhhi8nbtlDv1U6fLc0HRBJOQiiJ1eroWA82LHJdjKmp6UTuLUqMaE+e3cdpGR9x0fc5N735iLwwyXbG9CbjGheeQLB9ach5KGOq+UrtAoLF/+GKTOfbZnqYbidCJlMVO8UiJUdCpfRrcJ0gT5ZGygFjHdUe9rl3CrB+kdixemxDgaVMspnEtN0aTjPW/VjwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbPFNte8csntkhTdeAw9wYz5YpZookMuDOmmrmOFEp4=;
 b=HJN6g67fzFfJ8LGbU+SNNdd5GZJAOMc9IAGTgfq0TgOJKI5mqJRROgeoSOUls/kmUoowYP1CQZe/9AxWarm9dIeSE5WL55S97QqIKuqXgz36s8d4uwLQbBj6ZP9FFAJ9OxzI5J2r6RDpjmI6CVX2g3/o3CM0cHrx1dnJG8vGRJQ=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7830.eurprd08.prod.outlook.com (2603:10a6:20b:51a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 11:26:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 11:26:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>, Markus Volk <f_l_k@t-online.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/8] Remove usage of /var/volatile/tmp
Thread-Topic: [OE-core] [PATCH 5/8] Remove usage of /var/volatile/tmp
Thread-Index: AQHZjNKxgGfMqoMILUS67yDOTI9SJq9njgGAgAADmQCAABPtgIAAE6uA
Date: Tue, 23 May 2023 11:26:41 +0000
Message-ID: <F72B3BB3-4041-4E97-83B4-E5D15652C4E2@arm.com>
References: <20230522172503.1651374-1-alex@linutronix.de>
 <20230522172503.1651374-5-alex@linutronix.de>
 <CBE8C9FE-27D0-437F-8CCF-5F13C0DBFE3B@arm.com>
 <CANNYZj9V73Dd0hTquGLNn1W_A0oDF52eMQE124D5UWZWMF_zDg@mail.gmail.com>
 <120CEE6E-6835-467C-9A0B-20960B333984@arm.com>
In-Reply-To: <120CEE6E-6835-467C-9A0B-20960B333984@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7830:EE_|AM7EUR03FT005:EE_|GV1PR08MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a03abf7-6864-4164-b2db-08db5b809e02
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +zgBAc7LchO5BF4x0Uuu0W+JTNEJzqGVxGyodSTfbojbLUmy8VdN4E+MbRwj33nbZe2B+61746ix79WknOk97t1mEcV/UfAlk9Ff34wz+UWFLEWXZOhL/ngTuzij++T/WRtsH3SWGBI9Ri13oTHy0TBQSdjzhiLeKSEtpp0bFWixOOlVSgQ75YmJOeMjzp0ItLqxCJz8PZhpmR0mho3xZxzV3dWiPCiCRyg9oZt4XO88HKYjGMAHgCZecE+j/oWf5PIIKGGM03BeHu4r19yjE2UDyA43uHFEhMAv9Ltu8Rpdc+ABRDyK/iVSdKHgJynxGvAnkmbDyNTbaLty6zeWGdVOiX6riFyxYyxRfA8/7ksw2vR4VoQJEO1cjNt1ae5XzH3nnBtAd3f3HCZYXqNkchY9HbJzX+cnS6Z1fORxSEVnR2TYF4g5v4Pd+bibiQ4holfaU/aNYL6D3AhDaGkounlyMlR0aMF/o6wa6Sj1Gfs/mTf2hEuGcWQvDqtXrXK7CDUYji2FmVlyRr0XYH0EF6TvCA75DJxf48VRIT+ZDHqi87s6MVN8bvt78Cxe7zbY9iSfxlB3Y2ZCnVdIzfiFJjA0E23ZU7ta8fQwiX3yqwqCN4GcZfJifOSyYEXRmhZbe//rmDX/7vcSo8cop6jByw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(366004)(376002)(451199021)(37006003)(54906003)(71200400001)(38100700002)(41300700001)(6486002)(316002)(66476007)(4326008)(66556008)(66446008)(64756008)(91956017)(76116006)(66946007)(122000001)(5660300002)(33656002)(8936002)(8676002)(86362001)(478600001)(38070700005)(6862004)(83380400001)(6506007)(26005)(6512007)(2906002)(4744005)(53546011)(186003)(36756003)(2616005)(6200100001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AF8F7F858172547814BEA2DDB39F437@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7830
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	2920289f-a327-41bc-5bd3-08db5b8094f5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Zo6V3Ft2z+iKqPE5XTQNRTcsVvKYcVZHCAO5yhpjnkZVXIsEgxoEqmTuV/krVEsZYIQ983oTIlUcAJScGpUpZgcQfcUfQpxPzKNAmU/VrbF2iqcPnx4h84qXE8krZy240gfep26CkoW5HiPHYPkmn7YSNDfqEmNFGpGbUDloaTA1Mpaly08QngKSum2gKXrKn9EDQ13+/20Kikois5z8j2qLCH2YjKWJBvp9AKZS/C2QDvUogMl7NtanNnN7hcRTtdzyuY8P2Y8sJIyjcfZQBaGUPXyb7WyJIwLlytMFK3xVJdB4aTwTuBtaHZof9c7jRNgE2AieB7vSX39lSLF/MISQrQszioOIY8FnlNYpih9dXHZxqXPzxTcNmwvELGyzVlg2l5l7vrgFfR/TbbN2Qz7B3sKeq9eodB6fkh4zWmxOH4Ef+D7CnpTSRVzAt08YCR2BgNLzST8E/I+yo+7a1Be13p98xSv6xaf1Wap43Rj+EpGZAnDpQ/DbD4VCZuoX6wesjFvfA5PEO6IQwyznZE4bTT1s5XUPu6aOAKFzRc0VOjCatvWnZbDSZMSTAlsUXF7pTes1jHuQudl6HZmqxnVMo1axW2iuk+kUDS6yA5CpgqfbHIdxl3HEir9+ecSZd1bHkLiFSUT0TVY4tQDe6iup/qsdJnSHZ9OBLv9U4O8cLECqPn6Z9lN4tSqov2R8NPjfnr9wo5VMerjgThdu+fe90uc01zBg/NZdFhgw/95AdvDkc4f194isNhTdXgAk
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(37006003)(54906003)(82310400005)(41300700001)(6486002)(86362001)(478600001)(316002)(4326008)(70586007)(70206006)(8936002)(6862004)(5660300002)(8676002)(107886003)(6506007)(82740400003)(6512007)(81166007)(26005)(33656002)(40460700003)(186003)(356005)(53546011)(336012)(83380400001)(40480700001)(2906002)(4744005)(2616005)(36756003)(6200100001)(36860700001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 11:26:56.7350
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a03abf7-6864-4164-b2db-08db5b809e02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8691
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 11:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181635

T24gMjMgTWF5IDIwMjMsIGF0IDExOjE2LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IE9uIDIzIE1heSAyMDIzLCBhdCAxMDowNCwgQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+IHdyb3RlOg0KPj4gDQo+PiBOb3RoaW5nIGRlcGVuZHMgb24g
dGhpcyBwYXRjaCBhbmQgaXQgY2FuIGJlIGRyb3BwZWQgZm9yIHRlc3Rpbmcgb3INCj4+IG1lcmdp
bmcuIEkgcHVsbGVkIGl0IGluIGJlY2F1c2Ugb3RoZXJ3aXNlIGdsaWIgdXBkYXRlIHRvIDIuNzYg
d291bGQNCj4+IHN0YXJ0IGZhaWxpbmcgaXRzIHB0ZXN0LCBidXQgSSBzZWUgdGhhdCBnbGliIHVw
ZGF0ZSBsYW5kZWQgaW4gbWFzdGVyDQo+PiBidXQgdGhpcyBwYXRjaCBkaWQgbm90LiBOb3Qgc3Vy
ZSBob3cgdGhhdCBoYXBwZW5lZCwgYXJlIHB0ZXN0cyBwYXNzaW5nDQo+PiBhcyBvZiBjdXJyZW50
IG1hc3Rlcj8NCj4gDQo+IEluIHRoZSBwcmV2aW91cyBpdGVyYXRpb24sIHRoZSB2YWxncmluZCB1
cGdyYWRlIHdhcyBkZXBlbmRlbnQgb24gdGhlIGNoYW5nZXMgKGFsYmVpdCB0cml2aWFsIHRvIHJl
c29sdmUpLg0KPiANCj4gVGhlIHB0ZXN0cyBhcHBlYXJlZCB0byB3b3JrIGJ1dCBJ4oCZbGwgZG8g
YSBydW4gbG9jYWxseSBqdXN0IHRvIGNoZWNrIDopDQoNClNVTU1BUlk6IHRvdGFsPTI3MjsgcGFz
c2VkPTI3MTsgc2tpcHBlZD0xOyBmYWlsZWQ9MDsgdXNlcj0yODkuN3M7IHN5c3RlbT0xNDMuMHM7
IG1heHJzcz0xNTQ3NTYNCg0KU28geWVzLCBwYXNzZWQuDQoNClJvc3M=

