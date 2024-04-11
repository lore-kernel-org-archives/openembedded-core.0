Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1064BC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 14:20:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.56])
 by mx.groups.io with SMTP id smtpd.web11.19178.1712845256327065317
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 07:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ez0tJn3F;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=Ez0tJn3F;
 spf=pass (domain: arm.com, ip: 40.107.20.56, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=d2GL2nxnRZGgIzXeEFeN15Cvqog1vXWcnKWNuIvkJgst7m1/E6Dyza5JhM2JDJa4KMl2WZ3alGL5cXbwNHABiDmhT4mQO7pzD56+NbqjdDNyILVQ2SOv/MzMd2Gdo2/+rZzbCzZGMT9niTIbuTL9Q9qrHOnqZNXihcz7g2gHKYGWijdNbUi4skQraMO3coYJafla01VKbP/H5a3M/XLCIWWZVUtL+cCu1HUPEiGBvfsmXsfjBiT55ELTJSdzLLTlVXuC7GoAYK1qnWVeT6OTa+6iRlY8oQ2IQN8GuR9sYhmqeHz1da92l7zPyFxQWNUvO8OqmfiVrjc4r1HE6TUGMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v1yQWF/ZlkNDe0WxHZ8asiPJ2POMqKhxuZwRBdroSY=;
 b=dFBwkI9vZAD1UHxBbiUvEaJLKyxeDpj3SYDBUizPwRc/NcOquc/WGaRfVhMVmw/5/JUWFw/+yPMGn5wgj0fgzK1OzMatP4un72Q23lHg0S6vpuT2eOY8qQCu8+QUb2trpEVcGHFHyKej2agCmbIDChLmD7QbVR7gmtZqPSyR0MhTDFWTF4j+zCDs8TvpxdwObVV+rCh3uAIDZvnyquJle4+p9aeYotMUFAjZIDDP6hmYTp0oG4tcOQ7CvLfH1lmeFSchGf090Os8ByfP0WzJjVzrW2W3mY+9n9cxCpR2hr7YxpUee4D5b/SpJHeNgePffN6O9zGh2bvdRL1+vXncsQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v1yQWF/ZlkNDe0WxHZ8asiPJ2POMqKhxuZwRBdroSY=;
 b=Ez0tJn3FhnpRuhmOWU1N1AES8JpOqZY0xmNtWn4O3JoHa3m75xseH9y/Uh9zf209LlEKqbiZcC5R+R/cQhsH2kgajABPp9BQ0DXiiHHJS9yDKPktzHs/AMrkfBoBhJQBZi9oX73Y2NpTNWWzPLS3YNbZUsa+EOQ0WKmZJUKmQvI=
Received: from DUZPR01CA0135.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::6) by VI1PR08MB10103.eurprd08.prod.outlook.com
 (2603:10a6:800:1ce::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 14:20:46 +0000
Received: from DB1PEPF000509F1.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::39) by DUZPR01CA0135.outlook.office365.com
 (2603:10a6:10:4bc::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Thu, 11 Apr 2024 14:20:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F1.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22
 via Frontend Transport; Thu, 11 Apr 2024 14:20:46 +0000
Received: ("Tessian outbound dad50f1992f6:v300"); Thu, 11 Apr 2024 14:20:46 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e730e32b9b1cf0ec
X-CR-MTA-TID: 64aa7808
Received: from d1e18375ac73.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1FE8470D-390E-43E3-BD32-B712E69E21DA.1;
	Thu, 11 Apr 2024 14:20:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1e18375ac73.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Apr 2024 14:20:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rtx517G6MJIlVZ4Yp+/TXrYoBBQSQcrErOf1tM2IfSJNqgrf1JVmKTii6O+4KtBWVNULwj9tNETyt6V9UPFJxTu7lF4dsXLNKGLxzfDtebmwe6lBnct/RhYUy4yhv5zJfoVyqLkPqaWXvHDuSWyEqRncebo8DxfdfSWS7tPmEujIl4BbTo1k0a7KH+kyEhNCxSgpWCFphkfXgX7CdSoB4RmW7ytVlLILlE0cbvXydxyUqUTCQ0ks7lVJsiXnjYKK7demfgCeU4xnnAQMeQKBV3TxjZb2ZxltEWGmyNvfCb2xmf5x9Oq6AlVkgySWgPVerp4sOCtRpnvrXWTSqxBLkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3v1yQWF/ZlkNDe0WxHZ8asiPJ2POMqKhxuZwRBdroSY=;
 b=aaYTZxYN4z0DvhY1skInhebi0Eh7pEtBgOPb5yIE0bzTtSxZDcvsIZC53t1CGSIfmpACcJVvnLygbM2vhj+ZcRhh71pYlWHodG+cwCbcDZ/NhItwP7l9oZZIAv6nK8/1g8J3zowmOJZepGKRyhEsZ547lGnWhUEOuR1sYNg3O45e6o32p3IuPa3zj6SdWsQVUT1LmzFBuHf7xppxTIwqxYDPOsfvggSGs47gs5JRW5ks5kuSqXRYdvKCI1QCi1Ut17pPrUe1k39v9Rc/AXJo1HuBCaVyXJn3VkybCBe/WqkvQZ7yIckzqgGqYshgqMrevVQgZmv5oduRwKjL+nweTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3v1yQWF/ZlkNDe0WxHZ8asiPJ2POMqKhxuZwRBdroSY=;
 b=Ez0tJn3FhnpRuhmOWU1N1AES8JpOqZY0xmNtWn4O3JoHa3m75xseH9y/Uh9zf209LlEKqbiZcC5R+R/cQhsH2kgajABPp9BQ0DXiiHHJS9yDKPktzHs/AMrkfBoBhJQBZi9oX73Y2NpTNWWzPLS3YNbZUsa+EOQ0WKmZJUKmQvI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8076.eurprd08.prod.outlook.com (2603:10a6:150:7a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 14:20:35 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 14:20:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"joe.slater@windriver.com" <joe.slater@windriver.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
	<randy.macleod@windriver.com>
Subject: Re: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Thread-Topic: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Thread-Index: AQHai64q4IT8QmBHuEeHbW+iamxbnLFizyuAgABQQoA=
Date: Thu, 11 Apr 2024 14:20:35 +0000
Message-ID: <767076DA-A341-4508-950D-981ADBF412D3@arm.com>
References: <20240411011745.574202-1-joe.slater@windriver.com>
 <20240411011745.574202-2-joe.slater@windriver.com>
 <6216932520b3db7a6613f284e1c1a77b547c0d66.camel@linuxfoundation.org>
In-Reply-To: 
 <6216932520b3db7a6613f284e1c1a77b547c0d66.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8076:EE_|DB1PEPF000509F1:EE_|VI1PR08MB10103:EE_
X-MS-Office365-Filtering-Correlation-Id: 84065acd-b3db-4a97-fca6-08dc5a32946b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 uKDZWDl/RxEBjcgwvBVCLwPLixjHZtp4xYL26PiHYlldljCkywSrW1tz1R5FfqHQKLioocUBC22shuQbKvgTwnTzxnGQWNbLI57BC1fIbcNj0DVLcasnAh2fnZpCXTkfME81mNEAN2nEbu4y0KkAXUkFtNfPB3IEMGrfGJc9y/9qUTLm7iWLM7/+C1sN6H144yNcjPJamUffwS6S8T3IB5Kxrr5vn/zi1zN+BvHdbSUbDAJ+U0T2cMANIprMZsMycx/tsmoWr/3bgRdsxux5XA4XGIIGUcd6fEJEqGZVDaA7HrWPOfos8i3V7Zk7gwXbWdhTFgWyijngM0CC6eFZho4Nr07H9wSisxjxTZRgmB54GKIK6HHyaePmuLC4RqRFD7WDRobcknxiwXluv3qp+mAGGYvL9QqvQ8paecpiebI+hY45UKNJ2/5zXLyENTIOe/28uA+kYVKp7VE55I8SNS13eV7EzHcrRQnAF7CKCzqdIYl47kfkfL+dg/1CJNH1lTi91bvWNInyYY5XOGX9XMibitLqiNrYZKRquAOsTZDzIBDeQ9ACvvLNUOP9UJuofIM+e0zfdX4TB6LYCYC6qMjrqm2TnW5gIgxF58A+Hb19VBfFZgOQIivLw3vgz5rK1xHbC6F22SN3hr4bk/6C5Ht0c/AqenICAeyc7yapT+o1C3eV9WIABL8woddLeOflX0wudUwhHigypzhbNS39ig==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6914270A5DE9EA45B31D90B52C0950F7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8076
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	93b4ada7-8007-4d60-f43f-08dc5a328dfa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lRnoHCbPGF1VhecZYVja9CSOhQfYImRzgEPFokrYqCo0RPHoUaXe4Tu3cYL4EK1nMJEkD4na9bMMMSbhkkb4XhPF8hL6XYKG3Sbe0m9PBbybIq4OIwyLS9gc02FvMVA95pJlX3itx/CZ+tMtKmoQIrv/LzBmm5OBqvJqy7M2QMiSZLMpycFHIktvsxlr2wTYWtdyruNZfr0zuKXhSO50akMTC0UbcuqaJgzPs72BuFi4cCQ90fDenX/waXiVRQUCed563IfeOEMqHi2pfU9C2uxn3PeZQBE7+ZzJcNHWFg+D5M4uI2Vkd+plqW5ml1NAjsrCR1nh0keSiolc39fSvaDrHtZbKeT+CIyITvq5habSPaLtoMQnstpzyS0n7fS1PGMosk+KxfwjY3UgIrLPYZ6M4CmzzN3LZh0T0Y4Mah9oSjB5ybK+eAVvq2Dy0AbgaCn7yaOI5qGr3KiojPFQTkTSuS0uKPeEVy6igkmHVnpaSfHM7FJxfSyOoyAifIi2J2VVBhRluRpXLn7RWCgpPwELw12dd9XhIP+6yMJEG5223biGqEQnJSuSPhiAOMLgD7DEu7OOx2v/hBtlGqgkadnKXFMV3M3oLU6AYrCCOMUdjaNuzuLfzuF1qC0cO7qekKGayExvdaEUO+Nipxi6wVapy58nB+NV5obBoY0lCaX+FMxzmYb9UKbfiU8ppltj/FBHjy7WHaB5HpdTuOkbtMCnKf01uoXy1dzgk6pSlcw4c5DoNLNzWft7xc8Fh1dZ
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 14:20:46.4737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84065acd-b3db-4a97-fca6-08dc5a32946b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 14:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198135

On 11 Apr 2024, at 10:33, Richard Purdie via lists.openembedded.org <richar=
d.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>> --- a/meta/recipes-core/init-ifupdown/init-ifupdown-1.0/qemuall/interfac=
es
>> +++ /dev/null
>> @@ -1,5 +0,0 @@
>> -# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
>> -=20
>> -# The loopback interface
>> -auto lo
>> -iface lo inet loopback
>=20
> Is this patch meant to touch ifupdown as well as the packagegroup?

I suspect not, given that runqemu manually brings up network devices and th=
e last thing we want is DHCP running again.

Joe, please remove this chunk.

Ross=

