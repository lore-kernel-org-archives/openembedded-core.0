Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA72FC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 16:36:57 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.75])
 by mx.groups.io with SMTP id smtpd.web11.22883.1712853407318690649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Apr 2024 09:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qH9Ge0JE;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=qH9Ge0JE;
 spf=pass (domain: arm.com, ip: 40.107.14.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=lEvTc9z9+qLczhmU2CZ8njNQ6ogeqxuMNmEAFpLSvPjWBd0WIR5/+leK8vJtQjiSxqMxRtDFel1YNePeiZ4cVnVQxgMlSMJnyqQEWauFkflyPr3XyHnIxo0q8YXs/9DYGJL8xXQk1vPBFBXiKqsVhNjFateq5499CfR4c1iCeDru22O+8dryMfHDAz+EElNtuXw66Xe14i9zAUFVDmrU8nXdLG0s4psILb9uVGgjgph+U5PYOPpFwLS1XbflyUYmP1NcBuj2LPOSSvlWWiCalBlDgFX5Advuj8RkHXFqN8+VJMZNEf3K2GfMr7iRjXOZgh6sqZ+n5pxlNDRkH5xl4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHP26KiZIsGRLtv2Zpv3Umy2y1uFEAqighR2Q6u5q9w=;
 b=RbibxxDP1VR2QJ4Yb5ehk8XcrleuFCAwWqAQaH7PxpQQOaJ5pqjGVC2zAfyMSUYeuFdayCt3wRtv0nu4fjEUFe56X18G04J70DvDK9nuJcnCYzoY9BBT3jUbw9NAwsg8y07zyUXsIT74lovffxEHWD/0kNnNDKZ5LufuLHvOBNs7VOluCxgT5Di8icSbDQiDaZndHBSbnoHOyJPLFjkFTWwwB/NgiBoLypi4BF++CFctdSW8G2VwlCD1qmkIbSY3wTd1vVTgZFtet8aRIMOQk5BlKaEjwWmkFUynzvy0CASDodJpUel6eK8D+CRhrYmvipQaHn5QI2YF6XgIs5GpGA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHP26KiZIsGRLtv2Zpv3Umy2y1uFEAqighR2Q6u5q9w=;
 b=qH9Ge0JEVz+SU5uWxutTvYVQxSx3cmbl07/v6A1nXR3OoXmiErhbcOGHeBBBpiuA8S4bZiA+ty7YQbobxk03gYg6M3yTaIoKlmKfeQorT1RullARoLzgJk8GMsxYybfZhsuaGek12haD5Q4+6rIePRdh625XJcQUxFuhiAzX+fg=
Received: from DUZPR01CA0144.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::26) by AS8PR08MB8182.eurprd08.prod.outlook.com
 (2603:10a6:20b:54f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Thu, 11 Apr
 2024 16:36:42 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::d8) by DUZPR01CA0144.outlook.office365.com
 (2603:10a6:10:4bd::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.22 via Frontend
 Transport; Thu, 11 Apr 2024 16:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7452.22 via
 Frontend Transport; Thu, 11 Apr 2024 16:36:41 +0000
Received: ("Tessian outbound dad50f1992f6:v300"); Thu, 11 Apr 2024 16:36:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f4b164bf5336f60b
X-CR-MTA-TID: 64aa7808
Received: from a14ba30f513a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C1AA74F6-DB67-4960-B1D6-9A11D7E9FE81.1;
	Thu, 11 Apr 2024 16:36:34 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a14ba30f513a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 11 Apr 2024 16:36:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=enOiMPDmdkOTfIuqz04c4837QbZ61ZQN180KC00JdcrQWdrXydG2FjcOPnc+YKXfHrfZWztX9QFiPZdpDOweQ8XgmWVwkNLmVJNfkNJVdRrk7JzZzx6wWpbYu1X+POctR9G5BngVOEvVXqe0kNGAUMspURNGtae4wmICfpiPPtAPWGdCx2QCqJI0uNPNhQYS61ySz7q6O9RC08FnvNYVLOwzVWEJnajqAURXITc13ReFId97DB4EwJEaRUHtvN3c57u5OzWW7OKoQ1OyJce25v9BRhivwZdkFbUI//Dwj99h974bseXhYeL0OPD89xSuLRfl2keeMVM1iKU8uVOpAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHP26KiZIsGRLtv2Zpv3Umy2y1uFEAqighR2Q6u5q9w=;
 b=Q8nAbFuv6YjBKYcJr5In4QvJcxgscKokkt3GDPrhBJc18zlRCkfr5fpQpb/elUV2on64P7/cbvLFnDye6z5fKQ0tHkP8qb1bK9yM2/gN4PrXofRzVQRqNt4cEYIUhjuCprZU+mfXctW1YWGy6xS0RcYKz/ZCQ9O3tyxTCxWK/JLxJRlvuRijmtU/tC3B8emN0ZW2yuw6NnC+k46APAtVPNDCJG4LwhSsbWE7a8OMxlmMGf86snSdJGsdwmcXZV5hs1QzIcrzQ3GP0tJpUj+ZCmxDn6AVb2Jv0Ugh9bOzqT1EMJYkRrmeVbG5oymzBlcxRRw8ZZnF9jmNbNLc9OxJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHP26KiZIsGRLtv2Zpv3Umy2y1uFEAqighR2Q6u5q9w=;
 b=qH9Ge0JEVz+SU5uWxutTvYVQxSx3cmbl07/v6A1nXR3OoXmiErhbcOGHeBBBpiuA8S4bZiA+ty7YQbobxk03gYg6M3yTaIoKlmKfeQorT1RullARoLzgJk8GMsxYybfZhsuaGek12haD5Q4+6rIePRdh625XJcQUxFuhiAzX+fg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10278.eurprd08.prod.outlook.com (2603:10a6:10:498::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 11 Apr
 2024 16:36:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7409.053; Thu, 11 Apr 2024
 16:36:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "joe.slater@windriver.com" <joe.slater@windriver.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, OE-core
	<openembedded-core@lists.openembedded.org>, "MacLeod, Randy"
	<Randy.MacLeod@windriver.com>
Subject: Re: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Thread-Topic: [oe-core][PATCH 2/2] packagegroup-core-boot: recommend ifupdown
Thread-Index: AQHai64q4IT8QmBHuEeHbW+iamxbnLFizyuAgABQQoCAAAqwAIAAG0uA
Date: Thu, 11 Apr 2024 16:36:32 +0000
Message-ID: <ADB983E1-2C39-42D3-B6A9-C6417A7D553C@arm.com>
References: <20240411011745.574202-1-joe.slater@windriver.com>
 <20240411011745.574202-2-joe.slater@windriver.com>
 <6216932520b3db7a6613f284e1c1a77b547c0d66.camel@linuxfoundation.org>
 <767076DA-A341-4508-950D-981ADBF412D3@arm.com>
 <DS0PR11MB728713383FA86BC36CD515EE88052@DS0PR11MB7287.namprd11.prod.outlook.com>
In-Reply-To: 
 <DS0PR11MB728713383FA86BC36CD515EE88052@DS0PR11MB7287.namprd11.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10278:EE_|DU2PEPF0001E9C4:EE_|AS8PR08MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 26428490-28b7-4113-dbbf-08dc5a45911b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yU29Ppvt7X19qywHtAnSWdwZZgwrIyAC8+Hbz1Yr7yyEbdx4t30bKwNQFGilRC8kRkYAw16oOQ2FBMp0BKp3rK4/Oh5ric9VmK7rQMdYxXetKpwBM3STgInwv4phoM0N1YMJ8cXdv8ViUcWXhxHl/Naem1znWwKbDaQsfUQrLThIxCpSkU2eSGSmud04jC9OCcf2QFCNPbarzFXqJQS1VYorvrJ5fcFhpF2WVkEyZnq1NoAzYXI8C8z33vmtJgX6n5+zfpQyoTfCEbknfXx5efA4ExNt488EdXYtRjd7woQB5spAaU1XrWJ9dwFpmJJTqOFnkM1aVqyAQD3sAKr3G6vbKMdyHSrMi0+4tN5PIcyG38NFOAge7vT1MjenLEMIKaVnZoqJF5+z5YrnEohr1GKQLyEnY9qmTW8nWzlShGW3z3Y52YbKZawh75KW9pVjlQ+1zlWZT+wH/azld3QjJoEfKAuZQidndtUCnSyiFgJaKw8cr1vDzHvEUzGqzfcoA1Gk01Q/ejpsvkbXGd5RQOrEyZqTfLeoxkkDoZfT6E+YP5M6IKn45tDtQeTEI82hF3RNpU17o8a+9Z5cRoZnTGiY9L0Ko9kThxSJeKBkFNzDYitGyJIyQxfGgvvxXo9yEIN6A+KFT4o3sdfBwARyOk6UE28/ZUGL9CzduIs0VsKrYgCwoVDaVb9vk8ocFHL02a9dK1BQYTc02ZzBk2JUNeyWxMDzEUmMX8UAYKAiF0w=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D72DE97E2B6DED468154CBBE8EBA6159@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10278
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	046d9d72-cca7-4790-6b5d-08dc5a458b90
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZwkhKGCVT2QX9EbnROyBLM5M6sguz/9WiyRFMtNMCFnqdNVllfFKC6fp+mXmeozGxLIzyHNsSW/XpM7Q2v4mwWdThWrnpISlhKFViHMQkSqRDbglO7tvueikdGqt4SJifM/3avVdzLaViCiTGKNZ/ZAR5eWUhau7NfoBe/QYJMq64Uwn4clNfAOblnXwhZafpCSrdCkfW2wDIpvO62y6GHGGr0ZoLWkrJt+2RrvuD8Qyqm+WPxWeD4u2hjFseBmKfpMTU+EXiF9lrVAnArQ5DmWwz9TrSvz+iNEJZF+eOpNs9RnK4l/hT1d4StfEk9P/0GaC4H1R6nPzaKToqC6w4ezoYPin+49jYsEsq7iqpBAflBKuq77vVC6qRPBvk6POVt47KnzsgQqtNvb35aFwO7x/3rFnNiearwrJkp62m1T5Mdu8Bi7+7MMuuI+7xccdyb7b6Y6qUOMYkWMjLZttLk9imteFhU3CSx154ScrZ62IZdUHmlwpgdg3zSDG6QO5pX+bTG9eP7Ka0+w+m1lWYsrFL14kG4n/C/on7OqxC0fucPqwVt14BNWDv8QQ12wbB8tOQCa3RugW1UfeTeAmzT1pOxeOaRVLFoy9/YRI4SmBiAU6ZrWCYNz9QBruW1UNSfnZmBO9lLacHNy97gYDNL2p3+FTLd/Wb5o3Qy3npKfYfzRO7bn/OEnt1GxAqpm0n/lySNb4E/bfeUH2q1kZJFXL/fIVeuUAHaiBtPMhgy4stQyl53aKo52Ys6OSRH3b
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 16:36:41.3533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26428490-28b7-4113-dbbf-08dc5a45911b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8182
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Apr 2024 16:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198139

On 11 Apr 2024, at 15:58, Joe Slater via lists.openembedded.org <joe.slater=
=3Dwindriver.com@lists.openembedded.org> wrote:
> This was accidental since I removed the qemuall/interfaces in order to us=
e the main one with qemu.  I'm sending new patches.  Maybe, though, we don'=
t really need the qemuall stuff.

The last time I looked we did need it, because testimage will manually setu=
p the network interface with known IPs via kernel parameters.  The last thi=
ng we need is for ifupdown to decide to take over the interface and reconfi=
gure it.

Ross=

