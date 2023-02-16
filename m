Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29E6C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 15:05:10 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web11.12168.1676559908992412639
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 07:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2kGwc4z5;
 spf=pass (domain: arm.com, ip: 40.107.7.70, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y0Bi6gIBXv0rv3vySf7LuX5O1CbW/QxcOnOndn3CgA=;
 b=2kGwc4z5WYP+LzIi98KlbwBG6w9GTCM/xJbLtXa6ueDrlY7pApn4UxrLLB9LhJEzmX59JxruH5ZuqiRn5KnTzC7J/qi5Ke6nfxNf5p9Ym1kaCVM7iy5r4HAEhZtskdzgXHAXbPFFIt288pjDXChAlhkEd7/Fz2TKBN6c0pEzuME=
Received: from DU2P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::18)
 by AS8PR08MB7767.eurprd08.prod.outlook.com (2603:10a6:20b:527::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 15:05:05 +0000
Received: from DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:230:cafe::77) by DU2P251CA0016.outlook.office365.com
 (2603:10a6:10:230::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 15:05:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT054.mail.protection.outlook.com (100.127.142.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 15:05:04 +0000
Received: ("Tessian outbound 0d7b2ab0f13d:v132"); Thu, 16 Feb 2023 15:05:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d08cde617f6238ad
X-CR-MTA-TID: 64aa7808
Received: from 2047980bf309.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 3C2CBD93-9909-43FF-A0E5-E87E8EA0716E.1;
	Thu, 16 Feb 2023 15:04:57 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2047980bf309.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 16 Feb 2023 15:04:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmTbhQztoeleHjkRwwMkoHi3ac8ybWmRGR0vr+x5q+Era3ijeVTjCh9JDqrhVyuuDaxu8O25NhgbZD1OOjP9fnXscoTrJQ3zI164RkPcqH3rtFwRdgh1iqW7/7vbLztLTpISv98lPCBZXbQuH23aH4p6Dq9OOqs4ZI6wR9zUnt+lJaVmJ+BWDIqnO0a8+OrcwacR4kLMx+0FTc36j6r37ExlRJWe7vxO4GCn/lviJJtR9WGHHMziTJbdoZ+/8ohI4stRyJy0QuB0eDDcZWhloD6Kh4Xotm9nNWv5YHgP5+BJMm/9Hv+s3bJZVPh/5AWU0McIz2A3TuzQ1IwA8C/jsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2y0Bi6gIBXv0rv3vySf7LuX5O1CbW/QxcOnOndn3CgA=;
 b=H9j+UDZw6eQ/CKZwzSoXcdOK//zvzeTF7Drl7Ffs2Kkw90IuFLRqoyyioOVYPma2O6uu6+IETyjW5j90f5izyIo4iBhC7+msbyBhWCiVZZt4/YLKaVJJvpMxeR2nQUnTWv/Qj4yiPV3ELV/1tddfcF8eNnyoI+GuWLyxUQRQCwcdetAHl+dSKJl7UC9a4cruc2O5jQw2yXjIZmyzweMPcJ7Qd08WeZ6PR67yb2UShu87uNQb5Wb64pLcEN66Jfmer4cXgGEB3n528+1LPKgzSsII+ix1RJmpbbMG++FHkZBq5vB+wylj1wmjdDJzKmtq8KdjKic1kC83zgCimVLr8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y0Bi6gIBXv0rv3vySf7LuX5O1CbW/QxcOnOndn3CgA=;
 b=2kGwc4z5WYP+LzIi98KlbwBG6w9GTCM/xJbLtXa6ueDrlY7pApn4UxrLLB9LhJEzmX59JxruH5ZuqiRn5KnTzC7J/qi5Ke6nfxNf5p9Ym1kaCVM7iy5r4HAEhZtskdzgXHAXbPFFIt288pjDXChAlhkEd7/Fz2TKBN6c0pEzuME=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7307.eurprd08.prod.outlook.com (2603:10a6:20b:442::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Thu, 16 Feb
 2023 15:04:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%6]) with mapi id 15.20.6086.026; Thu, 16 Feb 2023
 15:04:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] site: remove glib site values
Thread-Topic: [OE-core] [PATCH 1/2] site: remove glib site values
Thread-Index: AQHZQIzk2QutFnBQ90GNjOXSg+sK067PF72AgAJWoYCAAECKgA==
Date: Thu, 16 Feb 2023 15:04:55 +0000
Message-ID: <95B2CB4A-E287-4962-8BD6-F215A7C62F0D@arm.com>
References: <20230214155603.2390194-1-ross.burton@arm.com>
 <Y+wZv+VfY7CatrUu@mail.local> <80BB828E-03F0-4A32-B424-D453749A4A45@arm.com>
In-Reply-To: <80BB828E-03F0-4A32-B424-D453749A4A45@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7307:EE_|DBAEUR03FT054:EE_|AS8PR08MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e2aef53-e40b-4d29-8e89-08db102f2f6b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 q0OV8XEhV/4gqJLyRI3SW6IpuGjHc1TjvIzzEv3OJR009Hg9dNZNyXmXJbcUo0M/GXEPJDdYg+5FDHKjay5PpQ46jTO5eIKK6opVqmVrqNNjc3ZfUHB3btvsnHzZ6pqiLkzPvJJ7GgNUiS4UYTERMxSTFV4eWznCNP7S1ozvlswC1gQLhykNqjiGEp+HamO83XtFe3AJ1mEwycxVdRRu7Kzl7SyYY6OgNt78P7e+vnFoFYt61iSIw8FoQK3v9gO0EIMgNfS8c7WlrH27s53GcfC2jKsEgxI5ZvhDCyWnT1nD6wtNwBzx84zjGMpj3Em8V7QfDu7mQJiHseHbVPfMoTcHpd79E+7F4IeR2seTcViwetr7+VgIPn0JGOQ6wguy72kQsOLA7yj1A5Nz6YeKnpBM66cgQURTNUUqTS4PQur3eEVTkweo8Gbjw6eGltRBexMQRie/g8NyvVYRyi31wwNaFZi2oLA8237N9Q81ip9ef0tKGAbQvsiANHqLSM8Lk+76cfykw/hpMsIyCCerWNbapIPVAg9sWDkHtf8jugjZKEHK8MPzO8mZiQA4zWXx6n9S/aPzrWNCkw3RDCL8ploNDZsqW1bSjtkQD2SyayvyiJ6OJNEBMO5Gwpau+uC6dWBonRO+Kwa37rPN15cWd6vpxyFthLCHeH8k1+bBmMWCESSUGNXL10ZNRhicSoFf4naqdPFI8xwGkRdkQ22KKthm8EHKNYnbovuUqNM15SQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199018)(6200100001)(36756003)(2906002)(83380400001)(86362001)(2616005)(122000001)(38100700002)(38070700005)(66476007)(91956017)(8676002)(64756008)(76116006)(66446008)(66556008)(66946007)(54906003)(316002)(6862004)(5660300002)(8936002)(37006003)(4326008)(4744005)(41300700001)(6506007)(6512007)(186003)(53546011)(26005)(71200400001)(478600001)(33656002)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F3696D37647B34E89256DF31C776984@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7307
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	bc5e4912-1dfe-4351-7165-08db102f29e9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FIQqaHJZb0fvSnB0Tc1iO+T2r+KSwLjypXu9HTqTPZWkX8ij714FP5QA8EjEnWkB81p9kUn2xwgR7qy9ZAUUKa3d/4m4QY09pbthGU10vG5zRVkZcuOutSFqgybATWh9ks11T/gZdVMCGJIUHJRullU5tJJjlz077xkQDaLlrIqGglSe9WrW7dc2bfmg/vDWorbBaaagCVzwiS6smeRVu4IMugFRYjO7d5pF7bFzFy0qQDLv5HlCs3IZQEL2Zym3T7X7optmhTT34rRLFvHjmwD6qa1fvNt0o8Rdc9BHxGlgxOnSH4hfvfjIlgzbMnrNQWT+bi5+cfPnDKJhyOftuN5xbtr58SElJHjNXwAcKATunvgW2idEFF7gdhwwh5IQ/vORv30VkomypYUTjlsW8Mwk2H6EQUJSMxbjQ+wQFJoO3MhwGYwWRdgYFhByf5Cklx8GVwVT5YhEeGeBxqFhG9qWeHb0W2bfKSu9GNw0HRzE/neCE6sDyz/5ucDBJbYZD2A2ABUWpqwYmB+36JKiTovACPWwEsbKagKJS66KvpdgJPRkUw8qdPm0/MdqvOwZoyiMzUxxSAADHwhz5WYpH0xbZ9vTHqUYjQKfILg1C2Zv+3FDTyEUevGz6MJW+Jt7yLKkA3jKYLUj5ssOHIHlK7g259plWA5f+FxPSZKwyl7PwNkj5RVxF3bwaRXyYkurp5qfU2PawC2y0a0e3GsN6g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(6862004)(54906003)(6200100001)(316002)(8936002)(82310400005)(8676002)(356005)(37006003)(70206006)(70586007)(4326008)(47076005)(40480700001)(6486002)(2616005)(478600001)(36756003)(336012)(40460700003)(86362001)(33656002)(83380400001)(41300700001)(6512007)(26005)(186003)(2906002)(4744005)(82740400003)(36860700001)(5660300002)(53546011)(6506007)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 15:05:04.8142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2aef53-e40b-4d29-8e89-08db102f2f6b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT054.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7767
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177290

T24gMTYgRmViIDIwMjMsIGF0IDExOjEzLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IE9uIDE0IEZlYiAyMDIzLCBhdCAyMzozMSwgQWxleGFuZHJlIEJlbGxvbmkgPGFs
ZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPiB3cm90ZToNCj4+IGlJIHRoaW5rIHRoaXMgaXMg
Y2F1c2VzIGZhaWx1cmVzIG9uIHRoZSBBQiB3aGlsZSBidWlsZGluZyBuYXRpdmVzZGstcGtnY29u
ZmlnOg0KPiANCj4gSG93IGFubm95aW5nLiAgKGxvb2sgYXQgaGlzIHBrZ2NvbmYgYnJhbmNoIHdo
aWNoIGRvZXNu4oCZdCBjb250YWluIGEgZm9yayBvZiBnbGliKS4NCg0KVGhlIHBrZ2NvbmZpZyBw
YXRjaCBJIGp1c3Qgc2VudCBzdG9wcyB1cyB1c2luZyB0aGUgaW50ZXJuYWwgZ2xpYiBmb3JrIGZv
ciBuYXRpdmVzZGstcGtnY29uZmlnLCBzbyB0aGF0IHdpbGwgc29sdmUgdGhpcyBwcm9ibGVtLg0K
DQpSb3Nz

