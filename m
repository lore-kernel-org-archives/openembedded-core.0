Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A37C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 15:46:51 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.71])
 by mx.groups.io with SMTP id smtpd.web11.46761.1670860002589714157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 07:46:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=aDDk2Q95;
 spf=pass (domain: arm.com, ip: 40.107.20.71, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOQQbtyK21FpuMrIFjxgs6AzrOuSuR7l6oKJ0lsN5Ts=;
 b=aDDk2Q95SPb0QDLEW/412DPunvrEUrmFd0vuPWIqC0nNV3hJRXz1W7OGa4IzzprWBSD8Ae1VwfEfC6asPo8GDsfVH9jO6hnJx9o2nKX77VG45t24R4kRps513jBYTMlvkdr9y81EfI9th3/tp595KDBM9jt+/TuX6F2Wh0R8u/Q=
Received: from FR0P281CA0136.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::10)
 by AM8PR08MB5859.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9; Mon, 12 Dec
 2022 15:46:38 +0000
Received: from VI1EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::6c) by FR0P281CA0136.outlook.office365.com
 (2603:10a6:d10:96::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.9 via Frontend
 Transport; Mon, 12 Dec 2022 15:46:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT026.mail.protection.outlook.com (100.127.144.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 15:46:37 +0000
Received: ("Tessian outbound 6c699027a257:v130"); Mon, 12 Dec 2022 15:46:37 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38963784e3e3780f
X-CR-MTA-TID: 64aa7808
Received: from 9534494b685b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id BB1565BE-919D-4A63-AA9F-6AA5C125879C.1;
	Mon, 12 Dec 2022 15:46:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9534494b685b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 12 Dec 2022 15:46:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TUANA+9/6fSeuA3vk1l1gNVMCg5QLeegsOcxXFt1fVZMDw4VJuXUqF/uMBKJF55E/6wHSKH0BT23f6ERmgYpxwvsVGdCVBUj+FqnxQmVsXkLEcKDM8cwppTtA5MoP+s1sYjk5oe56jAQqTsNr2QQHdp2lSxoUAlSnFQwcvOQvtJpLxdy1e+LT3x0NreRfxPP+9C7ze/f65NXgvoRwyr9DZeqTWFTtZKq5SWAzlqk9Pt78lzguiE/DoLBd+an+KqHY6KLlcf+VEXxjAJ9hXboqyP5mS65xLP5pkJM/FPreuPYHKIc83KmfXoEt34k/ygsFuhnob4c1tTSgkRYmpOUGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOQQbtyK21FpuMrIFjxgs6AzrOuSuR7l6oKJ0lsN5Ts=;
 b=a1lfmN6tVIkl+fQahUxp1CbhkCGE3Hl2fY4bx3WSuh5m1n0yDPGoNJEeHFSZlO+xoyTUsLgq4tncjl8AQ1ieIp1fusAcuo44wJEIl6/nxkPvVgg5Tx8IzSGXp5RdcrWYZtDkghZVT1xahPaUo6zfGyBT2YhzjQevgj8dwoFp8WRLO8+KHKFklziu9i7Tnul4wYGqh0DiZKEFImo9WCnHIZ0/F7kUQDzUBQYyvxiWMYcA9LehAjJNh532okmFxaZvEhOk6uAxBNfK0xhHUM0TxFySOFtIZKNmPosxcPAPdEidNCJo+MGPoqwQbgH8oppUmBgE8btTSAoFaK+pMhBQTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOQQbtyK21FpuMrIFjxgs6AzrOuSuR7l6oKJ0lsN5Ts=;
 b=aDDk2Q95SPb0QDLEW/412DPunvrEUrmFd0vuPWIqC0nNV3hJRXz1W7OGa4IzzprWBSD8Ae1VwfEfC6asPo8GDsfVH9jO6hnJx9o2nKX77VG45t24R4kRps513jBYTMlvkdr9y81EfI9th3/tp595KDBM9jt+/TuX6F2Wh0R8u/Q=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5723.eurprd08.prod.outlook.com (2603:10a6:102:89::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.8; Mon, 12 Dec
 2022 15:46:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5924.009; Mon, 12 Dec 2022
 15:46:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] meson: drop redundant is_debianlike() patch
Thread-Topic: [OE-core] [PATCH 1/2] meson: drop redundant is_debianlike()
 patch
Thread-Index: AQHZDj4LAFW5Guc7v0iMU2wMz/98U65qYyeAgAACGgA=
Date: Mon, 12 Dec 2022 15:46:27 +0000
Message-ID: <7D883CA7-E5DA-4EE6-B17A-C619626BBF8A@arm.com>
References: <20221212152542.3762880-1-ross.burton@arm.com>
 <b6e6a28b7a6ca8f283f1a726504f9be9032d9921.camel@linuxfoundation.org>
In-Reply-To: 
 <b6e6a28b7a6ca8f283f1a726504f9be9032d9921.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5723:EE_|VI1EUR03FT026:EE_|AM8PR08MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce0f3eb-8eaf-484d-a986-08dadc580e28
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rUJWcdypvYFSZeMkGIM1mehRAFJWKB0EJXIrZdfMlFgvqqEzd2dERqvdO96LQ7AXvQv+pypKMejbCG186A+M7aNlsXUNYcJtMPmEQzJisAsLlzHcu2IRbHQuDEJF6dWFKcUPCCQWCjwXf987yErQr3H4r6uVpv11JiApWQUBK44MnYYYFlz2XI0v+EoyiaD72TPxuYEsrt39XjUTtpOsjhOvtBykmdf9fKWXCTC16VdLP1Vg4M0V4s4ZttM3P3nNZ974VdIen6R03el8dyViW6FswdQ+8+xpLJ0eyLEhqQZQSuutGGA1tMM2HcE6Qig+ONY/KyGKkWtnVTdnTtNdqersSzwMkWn+nwySJ8DLL/1+sPQpqh3lEf1BbiMR0I5igCvcbLV6qZXkpSyubfuBEy0wXm/19gWnHNGv/ljlg2ejTcnzcfkCNXtsfucH4h6ELRpi8dFs7dqZ07glYyIqfapCkGOiT6+fg9s79p74JuswxSzJMjPamiqma9NHeieCiE9lAHVhzYlRQ8sgBOK0jYuIaoa0fJ2oeQlO65i0CDsGp0Zp00++PfuHigBNe7m3w/O6pejedEfXqMeuhfAF51Moviq3iDdJ+T0KHpFkG413EtTp9ebu6buXL0hZRjHUapLrTYic9m8xg1ipldnDFcsAViXYSLe0rCnkKwEIO+Wi+7Mb3AkiyQPmQ5a5ixpv5gyHyeIlHtVrKEJNWtLgbjKjRQ9BdY0qhRDTzS2U2ak=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(451199015)(2616005)(2906002)(71200400001)(53546011)(6486002)(6512007)(478600001)(26005)(186003)(36756003)(38100700002)(6506007)(86362001)(122000001)(38070700005)(33656002)(64756008)(66476007)(76116006)(8676002)(66556008)(41300700001)(91956017)(4326008)(5660300002)(4744005)(8936002)(66446008)(66946007)(316002)(6916009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <10AFA8E1D5957847A2956FDF9A2BD9BD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5723
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	04baef87-2e49-46a2-0f1d-08dadc5807d4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V85oKZUi0xTZoBjxE+kqQKWuLVhMs5kH1MqXc5ct0+uAlsvD6VmnT1F47/hMZ3iEOAqkouzHqwWSSQ3pLkb+G6v3Ow4Dz7Zo8/z9D1npwzDxULZqXZiWy8GFutsKsVdzPDomPQ6rjIXIFSznj68IXFX+XsH9iMuwCLMe1Hl8/DwsGyi8HACClMfErNrya9uE2CKLIwYPEOurQRsN1EMjtMv4lAfzbLRKbf5iQWcGv37NUy8r+R0Ijho4+wFJ03q4/cvZ8AEI8buap0w+htE+O2cx+ObZ4d+52cAYp0siaFgV/eM0YAgGHvyh16zCZUQk1vJvMWfmwNwNuEr4AMYU4Uimc09LKDknBUaRW6WLRc9gkwvg1EhjgFAV3mMFFrO2ezfKT+NdMeCHN7WXmi6UQKHB3WvU9VeSzTZm4zLCGuVYvsdEYyCZjgyZO3INK2lLezzBF50SzR9qkpydBh/jSZ/NnRuxYGbD2zshkbydXg+OLH+l2Kd/WFNBZ5zLb0x9SwmqiY5U+QKC+pfn5OloZ0T1nGfVrZLFx0p6W0VAC1nzX9XAQDuqE6ZJrnBtXqMvNEiqo0ExMn/nXXaPQm53tAh186sOdE7vD0L70oNi8tHFov72CWqVCyG879Llnhhu/Fr/CAoqyrsLQV0+vdHAXl9r5vH7mYAsNekeXrZx8pWLe3puzYQTS5YU2FYaN+3JvW7ium/lfDgiZ09hK6qjDA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199015)(36840700001)(40470700004)(46966006)(356005)(86362001)(40460700003)(33656002)(6486002)(478600001)(2906002)(40480700001)(36756003)(81166007)(36860700001)(82310400005)(336012)(47076005)(2616005)(82740400003)(4326008)(186003)(5660300002)(53546011)(8676002)(8936002)(26005)(70206006)(6512007)(6506007)(6862004)(4744005)(316002)(70586007)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 15:46:37.7406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce0f3eb-8eaf-484d-a986-08dadc580e28
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 15:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174497

T24gMTIgRGVjIDIwMjIsIGF0IDE1OjM4LCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVA
bGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+PiAtIGRlZiBpc19kZWJpYW5saWtlKCkgLT4g
Ym9vbDoNCj4+IC0tICAgIHJldHVybiBvcy5wYXRoLmlzZmlsZSgnL2V0Yy9kZWJpYW5fdmVyc2lv
bicpDQo+PiAtKyAgICByZXR1cm4gRmFsc2UNCj4+IC0gDQo+PiAtIA0KPj4gLSBkZWYgaXNfZHJh
Z29uZmx5YnNkKCkgLT4gYm9vbDoNCj4gDQo+IEkgaGF2ZSBhIG5hc3R5IGZlZWxpbmcgdGhhdCB0
aGVyZSBtYXkgYmUgbWVzb24gdXNlcnMgb3V0IHRoZXJlIHdoaWNoDQo+IGNhbGwgaW50byB0aGlz
IGFzIGFuIEFQSSBmdW5jdGlvbiA6KA0KDQpJdOKAmXMgbm90IGFuIGV4cG9zZWQgQVBJLCBzbyBu
byBwYWNrYWdlcyBjYW4gdXNlIGl0IGluIGEgbWVzb24uYnVpbGQgZmlsZS4NCg0KUm9zcw==

