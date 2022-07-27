Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DFDC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 12:26:20 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.70])
 by mx.groups.io with SMTP id smtpd.web11.19131.1658924771107698796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 05:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=8W2ESDvP;
 spf=pass (domain: arm.com, ip: 40.107.8.70, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Z1uckwCkGiMhkZeMWDbtbrIRP4tNWTcFlyNRSydnaB0Jij1ZADLHAujb6bZCYLORNSy7Ak/6HDSS9YUPxBeKt4PLzfwB6dbjjSfDUAcJ0ziyJVvi62TCtkiiQB7ihlGZCS84uVGd4/5epngj+uuG88vpGv2uW6WpyexC4eSh1PDsq+ObbvgmZ75EEwEFDbGC5g6h8sY8sl5LxoFzYOXIXQVuQiPddK9qkskyGx0aOGxgLqKTQHmmDd1zbAlCLKNIpuk6CIoltnEcXqZ4klpPizZg2SeQBl8qJARhbPGTaZDpwzka+MAz+xg2w1R8TSJ0s+2hVEJLFzK+9s7pveK3jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1iOJs7OU3mwCKa6zRW2H7+mJpU4ZJKRy5EGqDvhmAk=;
 b=PJ86c9w0IO4USLaCjkZnGZV6Ps8QgYCDzIEkai3E/d9yd5IDi8EEWuTPk6JDFtYCwdjBrEtAOLb4M7r7DQrUTQPMQogk8fkFWE1+vPUJG6z4Ct6lhZpw+rfGdDUE2T7htuORoLyqLO0OEh22Tmu7q3Le20H5PMpT+iL8PazqSKlnew4o4PjOApsaoq5/hziaPcLQWG8oXsBtaKM/uWkgpxwNmZdrtEbW1VmR3Y4tD1jmvho5PaU8Z29D+AawboXcuQrhsl8dx0Vk2+MFhLK/E1ibazEJil2uymX7zvzS2Nn4A5lJhRlw5tSCB8FFhN7n3ieSSD1F4b3TI80vSpDsag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1iOJs7OU3mwCKa6zRW2H7+mJpU4ZJKRy5EGqDvhmAk=;
 b=8W2ESDvP4uZipklF1QLK0iNhPXgPZ+WCMSgdd26A0Gm8q2TOVFzwPk5dMbqZqbDRBczd+41sTUb7sqYdSgjConRyTfoSeD5PdB7LaQ8lFxNma5sM9EzuhmelMruNSnRQ6779CX95KpHqUBIUXVEtvzEaly8H2fqmh654h6ZxWws=
Received: from AS9PR04CA0154.eurprd04.prod.outlook.com (2603:10a6:20b:48a::17)
 by DB9PR08MB6331.eurprd08.prod.outlook.com (2603:10a6:10:251::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Wed, 27 Jul
 2022 12:26:05 +0000
Received: from AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:48a:cafe::5a) by AS9PR04CA0154.outlook.office365.com
 (2603:10a6:20b:48a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.10 via Frontend
 Transport; Wed, 27 Jul 2022 12:26:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT054.mail.protection.outlook.com (10.152.16.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 12:26:05 +0000
Received: ("Tessian outbound 73dd6a25223d:v123");
 Wed, 27 Jul 2022 12:26:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: aa845041defdd614
X-CR-MTA-TID: 64aa7808
Received: from b1a4677589e4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E64505C7-2D5F-4F62-966E-09C2E52D7611.1;
	Wed, 27 Jul 2022 12:25:58 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 b1a4677589e4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Jul 2022 12:25:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtPSj8tfQ7XU3q62pYEsREknnDANpqImx7ct9/sdz7hl9vhU1N+WFVEsba6IibCOKszyrmyVtV9BDbExTMUbtr5ScmjqAUTvdHdLwJIru01BPMjlgg84AMXcSmP46NDYu3uSCwNLkPIM6yWQS+aFVd3FSA+LJdhjy2vzgvsrVJciqB4WjHCEHfgqcBZleLuYCq8OYiKfXhKOZoBGI7yBqG7sTjaN+j8wv8kRQzqC2SZkPWXIS+yiAIto3kFbK8NkURZNMVhy/XDlzEjerHb3iYBy45w/t6+HFf/BctkeZHwIeGlOOO7D6L9YKJ+V4aWWdTqENDG0HtI3jZgL6bcyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1iOJs7OU3mwCKa6zRW2H7+mJpU4ZJKRy5EGqDvhmAk=;
 b=TfkITnl0zdCExL1+8ETufFhTvlWR5k+WAapu13x3835gXdsxOZsPBlwuamT9obMAHBQz9AP9lpf0jiSbDj9GNEMMc6CIHbLoXQJdxcd369SoHCN14Ufwf+5O0ZMB1g4TylVjEgku+oKr9bsUmNeD+XpMYMs4LjPE8mdBOmhcKHUOwRfNE0LWDfwFy0ykSEhvBEwsCfwpGLeHhwQq6yLvE5pL15DUqCTypP3sBcIOg31xNFk174FtMLgoJg15Tn+N93WvKaBZVGJOLgHmLs7h6V9jBC572YnxXJmGg88pFDGmB2pET0cjEaXv3Ga0MWhoiwkKQrMcUei9doKwIB8KUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1iOJs7OU3mwCKa6zRW2H7+mJpU4ZJKRy5EGqDvhmAk=;
 b=8W2ESDvP4uZipklF1QLK0iNhPXgPZ+WCMSgdd26A0Gm8q2TOVFzwPk5dMbqZqbDRBczd+41sTUb7sqYdSgjConRyTfoSeD5PdB7LaQ8lFxNma5sM9EzuhmelMruNSnRQ6779CX95KpHqUBIUXVEtvzEaly8H2fqmh654h6ZxWws=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM5PR0802MB2499.eurprd08.prod.outlook.com (2603:10a6:203:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Wed, 27 Jul
 2022 12:25:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 12:25:56 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>, Rusty Howell
	<rustyhowell@gmail.com>, OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
Thread-Topic: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
Thread-Index: AQHYoTSanZkPBABEwE69UtQ4pRZAgq2SC9iAgAAPMYCAAAqVAA==
Date: Wed, 27 Jul 2022 12:25:55 +0000
Message-ID: <9DF62C6C-0996-4520-B4AD-F8E579C8931A@arm.com>
References: <20220726211328.2122681-1-rustyhowell@gmail.com>
 <20220727125339.70e1886c@booty>
 <CANNYZj-FJHUQgVb3GXWjEd6mkQE2-wkX2vUky3pJXQLdq6LPVQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-FJHUQgVb3GXWjEd6mkQE2-wkX2vUky3pJXQLdq6LPVQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: d393f75f-ceef-4313-559b-08da6fcb2d0a
x-ms-traffictypediagnostic: 
	AM5PR0802MB2499:EE_|AM5EUR03FT054:EE_|DB9PR08MB6331:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 f6tOgqzjrXOmsK40Ph24fYOg9TqFuiKd+RP68kmauqX8aJjChhf4vLPtTAPATC8TUuQ6QR3tJS5cz9Tj8vFk3LKAhi/jmMGepzRVvGAMV4pACXWvTeY9WuM2JxDQDu39+DQuIo+LHU4gLMgAjkV2E8u4S84iQ2jcQ6/G4Qg9Q1XLw9cE8NDQlCIriSsde/c9B3d9iJ/EIXY1D52SjCO8gm8xe7MUhY6CadKBtFv+RQBHYoTBqIblY/036MHPM+8gv8WvN5gt18fDCeEiIHFCPNFvKleFXuXnpsytgXl0rOoh/ozd4ThnoZoLI2tLZJmdUiOy3mTZNw7nNnmYaXGJFFAwI5O5YY153WPntkxygFKlsTC482trpSgF5FMIWLv7yLQ81UG0Ih9zibXqfntXhM0dKqFRVfBkfxVOSy+9z6RX7EbLiMjdyUki0YEuWRzL7xTM15lt1L8Q7fAfpvgQonnEKllhhVu7h4QHIae8kSB5L636pvBMmxydKaUW9Yb3B+aSiwg1TKd+UWCKBubRgqkm24kEj6xK3m4zMUDzCHEesyP6Fr7UW5SCOEPFLwi2Dyk8KL9+JabVsPo1WXyGuYsddVn65dCDWnhAtzrPkS09rqkemauMdGsoCZ5Q3sGvlbLc0J/v5OcBTVsGr8G87IauSFBJgnw8Qu+kprFUloDepgF8otgTnLqS0M63DxH+ITioiLeVgSgRL4v/F5dQYAuRhH5lzecxM7lxz7jRzVj+GbaQFqHCd4+KN6wKQsR57iDb3qj9rNotH6B9Kh4bzkrph5Py4z8R7ywZ/hCCIYQcvSfhQM2bwO6uC2I+e/64uc3wNvgW6/aitivEROIJtvYlTQln2ykhtQYbQ5EPCQ6Wghw4NjYyWwRAMbRXtEGj3STmlpzT01KGPRJbDV8ayg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(122000001)(33656002)(86362001)(38100700002)(558084003)(38070700005)(36756003)(91956017)(8936002)(5660300002)(478600001)(6486002)(316002)(64756008)(54906003)(4326008)(66476007)(66556008)(76116006)(66946007)(186003)(2616005)(41300700001)(53546011)(26005)(2906002)(6506007)(6512007)(71200400001)(8676002)(66446008)(6916009)(42413004)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8C5DD2B35560649ACABDA218E5021A7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2499
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	79c5cdcd-a60b-427d-8e4f-08da6fcb2756
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t9jW+LKpghlCHz/TxPzGIMSjO7fQaE+yauen6cUGRmg1U1ijt1rrSLM4GlehoKeFwVYT3IUn1WwxvtnzNx3XWhn1Emoym0CMYY6qFS4OgojFTaswDRedZ3YQ4AdH/U+zlAEWDH4G5u51QP1E03XfSSSWWipICk8ybr2kF3/hziF4ILRj40WttXzypTQk/wQ866nAKAXwQ0WJhZJ4ZTvOP2gFV05S8ahKey0PgpGRwxKpsXbF+CAIHj14PsfkMKFByzxZWlzwJ87pZQ32C6DPqFk0xFy/Wkwgq0DOnP+d7XobH+VxlCq+GzOM/GJ63RNnV2OBSl81v9k6s6zigbDJ5JsjSgAZ2zab0r7slYBy97/9BOFJCahGaVBY+OVLC6EpUXwiPgBcP+rOp8pYVpx6QZCpxr45DLYAUaURextK2IIf84743y+92Uy9gn/XfsIzoJr+hmGkdHyLD2vu94k8R/vNfaZUMcW6NAnwbUIKQEOm8VwQCmzGVtqQWsfFK8ikLB9IJ6q5Asf1ikYaFYZ9hv7sBHYCgBV+s+yVSFF6YsKJ4ZUq1WLWvTdAel63YcOMoH0jYaYPln3NXfAfqNCah2BOVNLy6IkcnzUIXXQcWADlkPioGl9w0XLMxYCwxYutfNwpJU8iWpXdsT14j6gDvpv5H6j8TWXrIKbqksR2svMYfZABMuKVT5S2ijNTxD9JrRCX2YMjqM+hZEfPYJUf8xhoUs8wCl6aOg/Vh/G/eSPd4kZKz+3mFsq85u9aKEdcc7dCkq6qLF0UIr99elFiOnA0sQAExciLgcAGWcEBWOwTiuxouWCXebuqdHwVD5lU2idVLvVYg33A/xaKcTObHQzGOjqvstbnh0FuhU6dDfo=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(396003)(39860400002)(376002)(40470700004)(36840700001)(46966006)(26005)(81166007)(316002)(2616005)(54906003)(6506007)(53546011)(40460700003)(47076005)(36756003)(33656002)(2906002)(336012)(478600001)(6862004)(8936002)(186003)(4326008)(82310400005)(70586007)(8676002)(41300700001)(70206006)(36860700001)(4744005)(82740400003)(6512007)(356005)(40480700001)(5660300002)(86362001)(6486002)(42413004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 12:26:05.0574
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d393f75f-ceef-4313-559b-08da6fcb2d0a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6331
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 12:26:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168560

DQo+IE9uIDI3IEp1bCAyMDIyLCBhdCAxMjo0OCwgQWxleGFuZGVyIEthbmF2aW4gdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPGFsZXgua2FuYXZpbj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZz4gd3JvdGU6DQo+IA0KPiBBbHNvLCBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdo
eSB0aGlzIG5lZWRzIHRvIGJlIGZpeGVkIHdpdGggY3VzdG9tDQo+IGNvZGUuIElzbid0IHRoaXMg
c29tZXRoaW5nIHRoYXQgZHBrZy9hcHQgdGFrZSBjYXJlIG9mIHRoZW1zZWx2ZXM/DQoNClllcywg
SSBzdXNwZWN0IHRoaXMgaXMgYSBwcm9ibGVtIHdpdGggaG93IHdl4oCZcmUgZ2VuZXJhdGluZyB0
aGUgREVCSUFOLy4NCg0KUm9zcw==

