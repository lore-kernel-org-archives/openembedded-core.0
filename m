Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECCBC7EE23
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 16:11:40 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.72])
 by mx.groups.io with SMTP id smtpd.web11.328.1684771894104811071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 09:11:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=TqGUdUWm;
 spf=pass (domain: arm.com, ip: 40.107.14.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWtpxLgkvO9eZSZZba1+m3EhRd+elQBiUNmiYVJ8LPM=;
 b=TqGUdUWmnZuJeSI6nx93mGOu+Os2DTK2Bj0Szz5kdyaHfKgkHnpD2cc13qEVukKMpvnVdpxPyL/BNSiVFuePwM6OJbUhOY8hgzT+JLI+lyJ6NRhBqo/V8N5koMBSNcI9qD9Esesx+VFoxTw1LTijuIHkPVcceUKo1NpviGjYQ0g=
Received: from AM8P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::35)
 by AM9PR08MB6276.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 16:11:30 +0000
Received: from VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:218:cafe::84) by AM8P189CA0030.outlook.office365.com
 (2603:10a6:20b:218::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Mon, 22 May 2023 16:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT062.mail.protection.outlook.com (100.127.145.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.12 via Frontend Transport; Mon, 22 May 2023 16:11:28 +0000
Received: ("Tessian outbound 945aec65ec65:v136"); Mon, 22 May 2023 16:11:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3ec021809b4224b4
X-CR-MTA-TID: 64aa7808
Received: from 34c0718bc2bf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 82F46EFC-FD69-40FA-A571-ED0E7FD19E9F.1;
	Mon, 22 May 2023 16:11:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34c0718bc2bf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 22 May 2023 16:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPi2BUGsZN8SjU2N1JYGC3rD9oHnk6K0WnmgsP/VL8PnAbydffIQtuRdbTFBSaYXyohRSkGsuZHFiWXPR8nd1e/P3CvroE6lrvoyEYPv8hr9OyJd9D3VuyfAlCUkS0pfNBd/gdXAk1Aj7W4VHHLaTIo0l5xUsjkPuGYRoNy1kQGSC90JVt1wB7KUMStvvvGrhxKrqm2VOQaL+8xTDUikNnHnWDjj1+LUBNpeHnsT/jAJ8KpjW8e+dKDAYqZBez8xZCRKH9R5K8no90W+OZiBYizb5VWE58wPalKTdCtFY1+nYmyiRGquKBPo+jwUnAGB+Tb8H08QQtwu1gxDkIXksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWtpxLgkvO9eZSZZba1+m3EhRd+elQBiUNmiYVJ8LPM=;
 b=kk/TYsAFIK5oEp0LWfr4mwTZka+pA7a+gcUl9LW6cmK/uYpDV5qq4FjkYCMy1MDnbqRNkKetfjKSiZHwi79tmjlJ5fpcXSUJVO9VDYslFJOQIDss936dNxB9hyZxknkyRyX7/mFFRLOqiQ4tgvzCDB3NsIrPzHdqXqWb+lH3fOgdv45qZEL3f5rqhfSqEm0Kw/xHZnBuiFVWNjf2xTjmLzTDvg8PKlDB7xWKNEUpKoOvn/twoXthz+hrTMOl8VCOMgTA4JF52/cLmZwdAP4oiHMaCjg9xe5zUjqKskRFL5Nim3lCYCJ7WpdW7vmSkMLgslY+D0c94PfvC2VL0YK0/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWtpxLgkvO9eZSZZba1+m3EhRd+elQBiUNmiYVJ8LPM=;
 b=TqGUdUWmnZuJeSI6nx93mGOu+Os2DTK2Bj0Szz5kdyaHfKgkHnpD2cc13qEVukKMpvnVdpxPyL/BNSiVFuePwM6OJbUhOY8hgzT+JLI+lyJ6NRhBqo/V8N5koMBSNcI9qD9Esesx+VFoxTw1LTijuIHkPVcceUKo1NpviGjYQ0g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8995.eurprd08.prod.outlook.com (2603:10a6:20b:5b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 16:11:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6411.028; Mon, 22 May 2023
 16:11:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?UGV0ciBLdWJpesWIw6FrIC0gMk4=?= <kubiznak@2n.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [PATCH 6/7] python3-pygobject: mandate gobject-introspection-data
 DISTRO_FEATURE
Thread-Topic: [PATCH 6/7] python3-pygobject: mandate
 gobject-introspection-data DISTRO_FEATURE
Thread-Index: AQHZiXZnFHWEE1r4bkewuvls4BZNeq9mfRcA
Date: Mon, 22 May 2023 16:11:15 +0000
Message-ID: <9FD419B3-F0FF-444B-9277-C8D34460427F@arm.com>
References: <20230516184031.2255171-1-ross.burton@arm.com>
 <20230516184031.2255171-6-ross.burton@arm.com>
 <DB4PR02MB10030D5405A91EAD95AC68552E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB4PR02MB10030D5405A91EAD95AC68552E27F9@DB4PR02MB10030.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8995:EE_|VI1EUR03FT062:EE_|AM9PR08MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: c1fc6d77-44f2-4257-51a3-08db5adf3322
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AQCsPFaTidTek0JC8wBJdCyJLJnPkqMj0MrNSqAWx2ddso1hq1xUvwW3QGDF0a00GwYRuBsIVvxsg5/32ZIJ50ynUG3fKAvCdezzgMeA7zfJETgljzvjEatQ95n6MTd1WTbpXISfo8SIUl+F1eindD7kCYRIa0EjeMNO2kghgssd5gGfsHsuTInKNjH10xYBLGj1WFiBXaYmdsW3k96zKkJE1LwZKyDi9hZN/ke9dA3b8kFg89Xz82AIvz6Gk6MUOriPz259h4sprImNNZyJly/GDw7F6/MbOqHSJKoXrY5BjKn4mM1yXR0jLtQ29mv4NMyvMS3cYyOPxgch42PdrpW3h0SACKjVo9XIAu8BwKDLmrsWXLzV8I7K7agZ0zmbPBhjjzWhsWHzhdv4Kvb/GghYhHrEd+iYZBZwfEfdQ/kgCoHF9gaQnLjouRKtpF+CZLuAbQ3LHnkHnS9muIhJJhuzEVcL85eHsNEMisgL6Caar9rx8G55AcoJbt5FEzPuF4p2Qh2h3esKWX/eBGmHBPLa9HIw3CphF4BUjpwUT9BBXqyYxW+kB1SpdwcexmVp2h0F/DIVH0aCzbqb/6jcYSXr12n1iG6jnPjGDS8A7JdppbeHGDF/7LuPkR3/yffI/AqagFldWAtww9SkoYxYKg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199021)(122000001)(38100700002)(8936002)(8676002)(38070700005)(5660300002)(53546011)(6512007)(6506007)(26005)(186003)(2906002)(4744005)(2616005)(36756003)(33656002)(86362001)(71200400001)(54906003)(316002)(6666004)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(66946007)(91956017)(76116006)(478600001)(41300700001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <53ED01BC37D9C344AA02471AB3C9B9D5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8995
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f3518ef7-b290-407a-e521-08db5adf2b49
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pCdOfi78HEyM84/J5ulOizZv7EL+fPPEmceNppPrdsIASGVevITKKsixSBmillA6DwfE6GidIbyHFf1KG08RSLnnKLK2rbePxk+E/FtbbFTgR1bDVdPuDN5mEV1ZQGUPAawgU/DRdPwCKuPff3TT8n30mRgEEjomOYDLL5M6Oble8+PJrQObDm0bvFvFbkoKeg6QrothSJWio5MTTI71fBKzoidz0pgtA1FmoeUXn4cgIzrYKTyTDp+WacNEzk5NuybIhptrU+a2qjxjK/jXoXS+LMLfCj0YRQfOInOtlgiDndWWf+ZeVVlu1lPpTYcOawYesh9YlaRIypuDT9waDXgnaMryF52xmQBNw9A8mAq4q2STJlsFUaanCDfXULgL8jHliFQ6p518mW0FyzflgBATP13K7MIW3UaRw4zZDbo1TklL0vIjnCERmgjp5XNxnuepjR1e1o4jwgUqsLe7H9L5VqQYRGEBDKA9yAMIdJM+Ysxtuo7qwZ+KaumAFihqnja3TTiMqUzOdEeDSjcgOzND+Vw+eT5+qcFE9HBWuKMr2QZKvgOPD2xvPRSNuRo9/8pr3EMo6H/T01OF4QrRzOFpogviW6Vng9r2fabFq6XtswNhxiWHlbTepxRAWPJ46WBH9scE8EpapSM0IsZh/YWHAPGJiMXBrejibmyfI5JHH5IHvOhZFtkpGhaZtG05ifqiJfS1hpXai5k97IvZiak4rb6SQRSCKbMcmi+MII8vuKdak4XzjRmbNMyAvZHN
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(5660300002)(6862004)(8676002)(33656002)(36860700001)(47076005)(36756003)(4744005)(186003)(2906002)(336012)(86362001)(2616005)(356005)(81166007)(82740400003)(82310400005)(40480700001)(107886003)(8936002)(26005)(6512007)(6506007)(53546011)(41300700001)(478600001)(6666004)(316002)(4326008)(70206006)(70586007)(6486002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 16:11:28.4213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1fc6d77-44f2-4257-51a3-08db5adf3322
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6276
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 16:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181598

T24gMTggTWF5IDIwMjMsIGF0IDExOjQ5LCBQZXRyIEt1Yml6xYjDoWsgLSAyTiA8a3ViaXpuYWtA
Mm4uY29tPiB3cm90ZToNCj4gDQo+IFdpdGggZ29iamVjdC1pbnRyb3NwZWN0aW9uIGluIERFUEVO
RFMsIFB5R09iamVjdCBidWlsZHMgYWx3YXlzLCBldmVuIGlmIGdvYmplY3QtaW50cm9zcGVjdGlv
bi1kYXRhIGlzIG5vdCBpbiBESVNUUk9fRkVBVFVSRVMuIElzIHRoaXMgY29uZGl0aW9uYWwgYXBw
cm9hY2ggYmV0dGVyPw0KDQpCdWlsZHMgaXMgbm90IHRoZSBzYW1lIGFzIGlzIHVzZWZ1bC4NCg0K
UHlHT2JqZWN0IHVzZXMgRy1JIHRvIGludGVyZmFjZSB0byBHT2JqZWN0IGl0c2VsZi4NCg0KV2l0
aG91dCBxZW11LXVzZXJtb2RlLCBnb2JqZWN0LWludHJvc3BlY3Rpb24gaXMgYSBzdHViLCBhcyBj
YW4gYmUgc2hvd24gYnkgY29tcGFyaW5nIGdvYmplY3QtaW50cm9zcGVjdGlvbiB3aXRoIGFuZCB3
aXRob3V0IHFlbXUtdXNlcm1vZGU6DQoNCkNoYW5nZXMgdG8gcGFja2FnZXMvY29ydGV4YTU3LXBv
a3ktbGludXgvZ29iamVjdC1pbnRyb3NwZWN0aW9uIChzeXNyb290KToNCiAgL3Vzci9saWIvZ2ly
ZXBvc2l0b3J5LTEuMCB3YXMgcmVtb3ZlZA0KICAvdXNyL2xpYi9naXJlcG9zaXRvcnktMS4wL0dp
by0yLjAudHlwZWxpYiB3YXMgcmVtb3ZlZA0KICAvdXNyL2xpYi9naXJlcG9zaXRvcnktMS4wL0dJ
UmVwb3NpdG9yeS0yLjAudHlwZWxpYiB3YXMgcmVtb3ZlZA0K4oCmDQoNClRoZSB0YXJnZXQgZ29i
amVjdC1pbnRyb3NwZWN0aW9uIHJlY2lwZSBzaG91bGQgYWxzbyByZWZ1c2UgdG8gYnVpbGQgdW5s
ZXNzIEdJIGlzIGVuYWJsZWQuDQoNClJvc3M=

