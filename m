Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649C5C2BBCA
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:56:24 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.166833.1719305780314253582
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mubg6srR;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=mubg6srR;
 spf=pass (domain: arm.com, ip: 40.107.21.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=D7Ox/WI/1a5fa+2Q3gf1dgeW6zP0/Ddq3ep8eW+tsHHOvhFYaRqd+iLi1HC+4xS/x1ixowIYWRSR6vNnVdnvHYXPwJbMNj9EsCxoSUqmuj5baTzUUaBEZs8KJ05IbjRM0Zv4Cxri8ahhC44jmm1sGuSBl54dGfX/x3PTN1LfpGNy2EekeT71EZNCqlbqWuhEVZuCZ8QOVP5Vj125eXnRnxxqp6kcHarcSLVNJik1lVh5skX1HRZo3FIQKS8LCb7SP/iowmf7czqTWqAJVdxsl460/zhVjzB/6pN1PoDQ8gwlPae5gJ8CCh8dzmf0A9o39DNCQ0mf9Q0agng52aeZlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syut+mV9CqtjVFARkLpAurxz4G3SsTLBNEdzNh8FiCk=;
 b=bCl04ajS1Etggevk+ICnu40cUrKHmZleqgXpEbIFQN2rsQRkeETPuWwMjFzlVDTwS3gZVUrEfkrYqGPkfRQ+5At05Y+yRUfOmRWWWVbxU6aRLw09v0+G4/GSiURoLMey9/Hr8rlHEKUQLT0AQiZ9zfcz8tmg7TNQyvxmEUBQxPu4wiTYQigTduLHo0NBFJw1TF55In24g3/lQfP3gTcMvw5DAdd4h7Fik+5eZEHezOgUs+1CkgEXlJmTOyrxs1IhMay1qeJCPTR9X2UTOM3RKULOF1iHfM+J+JVGGLlBEdGNX2UXUgGW5yt6xqPl00kNcj0F641uCV2tdjGyXuRdXQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syut+mV9CqtjVFARkLpAurxz4G3SsTLBNEdzNh8FiCk=;
 b=mubg6srRNnyNi8GikumXhDyuDsZfctW3PESq2cUGzXziLB9108red9+8UN60OACKBP4LynS/7ECTbiMP0gPYpU5Bc4Lod2Ji3bFTvxW+GgJrM5ZAJO6EU4SMtw24dmjRWINu/TWeieVOszVKuEILIfPfmzW/k/d217jwmlwjEBU=
Received: from AS4P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::15)
 by DB9PR08MB9588.eurprd08.prod.outlook.com (2603:10a6:10:45e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Tue, 25 Jun
 2024 08:56:15 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:5da:cafe::59) by AS4P192CA0001.outlook.office365.com
 (2603:10a6:20b:5da::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Tue, 25 Jun 2024 08:56:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7741.0 via
 Frontend Transport; Tue, 25 Jun 2024 08:56:15 +0000
Received: ("Tessian outbound c82ff893d892:v347"); Tue, 25 Jun 2024 08:56:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a949e36303bd08f4
X-CR-MTA-TID: 64aa7808
Received: from b9183c260823.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C7F41D30-A50D-4A9C-AA1C-D1C499909E60.1;
	Tue, 25 Jun 2024 08:56:08 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b9183c260823.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 25 Jun 2024 08:56:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=my48ndCze7Gecg3sNz78FxnpWNBd6CZ7Av3Fx4BZFcUSbRFvc5c7G9rpwaDpPiPOcjeN+RzLyUODASlrOanvPFpO1agJ8YlaiwFGzPt49UH854XzITlJTlGiT5JQZM3xuCAPaz2d9UpRQoU6b2XkfKS7lSwvt7mPVpM9eRhHIX70jXNRAnDDEMty5Cf2+wGTobpRWt1J3Ge4ZYLdQgRwAAf+VOBTnlvv8nW0UU/ChN/MjmJKy5I4VFxJDu8w7mOL98kRxFf2xW5Vkyn5kEJK94aIb8+SP0muwiWrzAdNU7OUQBcuz7y/N4jHWCg6IA8fvltPBP/cafcZHA3u5L6FyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syut+mV9CqtjVFARkLpAurxz4G3SsTLBNEdzNh8FiCk=;
 b=eEdjeHCXw902jACrcsRew7+L4oR6oRIP2ICm4d5s72ughcybzWrux9s2DvLXm3Rfu6nkHYPEk+FJ76JDjp6E+vA4UywyJGyBk1Bg04H/LOONrlEquvKLRBx2IIGd2PVZyeODGYBezCnf3FyAKu6GNJuXVspp0xOMKMoluiRk6PDq9HE/quCveoa1wFRfsPe1Ron84B2Akzf4cBmLbWu5yl0UjxCH9otxsDwqifVwuAYWGkKHlxdsEOUq2UtEPOQ4hjd18Zvd7Bp7BYL1sbc6rd3+4vzwggzUw/X0XUSOh+HN3IT0RCYjc6UoDwg0cu6UF92+V/fqIogCoZd81ZbqpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syut+mV9CqtjVFARkLpAurxz4G3SsTLBNEdzNh8FiCk=;
 b=mubg6srRNnyNi8GikumXhDyuDsZfctW3PESq2cUGzXziLB9108red9+8UN60OACKBP4LynS/7ECTbiMP0gPYpU5Bc4Lod2Ji3bFTvxW+GgJrM5ZAJO6EU4SMtw24dmjRWINu/TWeieVOszVKuEILIfPfmzW/k/d217jwmlwjEBU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10812.eurprd08.prod.outlook.com (2603:10a6:150:153::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.25; Tue, 25 Jun
 2024 08:56:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 08:56:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Zoran Stojsavljevic <zoran.stojsavljevic@gmail.com>
CC: Yocto-mailing-list <yocto@lists.yoctoproject.org>, Stephen K Jolley
	<sjolley.yp.pm@gmail.com>, ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-status@lists.yoctoproject.org" <yocto-status@lists.yoctoproject.org>
Subject: Re: [yocto] Yocto Project Status 11 June 2024 (WW24)
Thread-Topic: [yocto] Yocto Project Status 11 June 2024 (WW24)
Thread-Index: AQHavA8uc232STa4QkKB8j9JcVBMzrHYNiDygAAMvoA=
Date: Tue, 25 Jun 2024 08:56:07 +0000
Message-ID: <DEEF93C6-732C-40B1-8759-0E25B6E2C5E6@arm.com>
References: 
 <CAK5yBb-XZMRnfJuC66B=FoOhOXkvwfpsFDES2FH+Vcp61vR=_w@mail.gmail.com>
 <17DBE622025D9B67.28936@lists.yoctoproject.org>
 <CAGAf8LxiZOtRBWye6i0KMkZ-jBv9T8RM3Mu024naen-M15rAPg@mail.gmail.com>
In-Reply-To: 
 <CAGAf8LxiZOtRBWye6i0KMkZ-jBv9T8RM3Mu024naen-M15rAPg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10812:EE_|AM4PEPF00025F96:EE_|DB9PR08MB9588:EE_
X-MS-Office365-Filtering-Correlation-Id: ac43cfd1-da01-4282-4f6e-08dc94f4abaa
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230037|1800799021|376011|366013|38070700015;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?WGrdjhmoTpetKGquDh/n1GtzQTxJZ2x73alwWhCEzgJqHWfsGUbT1TWLPuAU?=
 =?us-ascii?Q?s5+B0qwuFs8o1iJhSTjQcp/c7JwcpwWxdHShCzXemhpyOjYSMh2K/4DZlBR6?=
 =?us-ascii?Q?joXwOIlzUkSODXmYS15WLp2+kZVnry4JF8hfnFfI+zwJpSIog4ti6LC1D6mK?=
 =?us-ascii?Q?RJYBvNj37me5WNzVD73hraoT7l9bNqYGe4Ie7ZnjxdeW7/ft+N2M828ii2pK?=
 =?us-ascii?Q?jB64OrcM09eVVvE1VdD8GtD27xf1OEhH8m+s3b0tZ4euqevVLGczL93RClBv?=
 =?us-ascii?Q?VhGc2QcilwchKcrRADxZVwOfEdSIZ3qjYWXnF8Or6u/I7SG+zuuFrUAVDWZr?=
 =?us-ascii?Q?GId4Lda0tUyLXmcqCfDkArjiOwiO73RY5RzGDCBXJW25XiwUcedSVgSBvxOw?=
 =?us-ascii?Q?up+b+uFLrGnL8+RmCx0SP7PNpwANBPvJvP8gelgf2wCCaIFf0OkM87bHY6uR?=
 =?us-ascii?Q?lQWkb50wjmcM+0sfEqH5hUHD0wwcu4PqgtPR8JCpQssRTOC6lskQ+6AQHGSt?=
 =?us-ascii?Q?EiZ9uMojVIX29pIn8C4J4WdZZYN4p0SbLMBcSKb1tHG4Od4SBObC53Rbc5vc?=
 =?us-ascii?Q?j/i8uVwWHpv9mcleDUX3v4vBNy3rYAgXkzirKJz1xlvuLusdzqPg34SwfevT?=
 =?us-ascii?Q?yQSDMhMOuOl9lk5PphE8tOoYAL067ZsqOd68BFtlMf2AAVbnoPX+YCkeENkP?=
 =?us-ascii?Q?TyoU3kWemUwHt9b06iarIV/hde4VNaGZabLtw0oz59rG7oTVEYIOcT9ONt0B?=
 =?us-ascii?Q?5DW7MhxWAIpUJm8B4VEchvsYesYyRane6bqDe/sfF6nbN0di4zMwiDAl5aYV?=
 =?us-ascii?Q?q017gvOqGdyRVKztXORRfpAcclpOwjNSCaHmnJbTgTAEa7XFaFMeo1FbdOLa?=
 =?us-ascii?Q?aQKrR54sBr9RYRRPHpOgKVGbvvPFn/0wWIn9o2AIoWGqvSzp63ZL9HaT5EoK?=
 =?us-ascii?Q?Mv6rOXhgiyT7vkYHP3VGCxMF7ORVn9KTm3z6u3tj6edyY+q4JYDg422SzTKh?=
 =?us-ascii?Q?i64OAIwjcn3PxjpX4rZbA1YhSbN+KWNXvfX1a+zyTaJu3Uct6yQJy/4zVHLH?=
 =?us-ascii?Q?lfOWbjOqu3Eb7HXWkdTZibbf8LNLGMKwY1XFzCReNP4cFmV4L3d7FIH1jngf?=
 =?us-ascii?Q?YWrxtDnp8k/LhD1n36IwaOST6D7Xyh5rJPRS9UdbGeVjor4N/+PCriANNlYW?=
 =?us-ascii?Q?yrwt2lwQ2d+zcQmZ9ozmnpoDkPRspTEBYRLYBbMpDKgO8cPOeddPUCIcZGrA?=
 =?us-ascii?Q?HMU+iP39PMATcmoq1xJg6vinmD6tu2U119VlVyqVpJPHFERQW3gGMIVL3k/q?=
 =?us-ascii?Q?sX2TJzlh22vRigIueGZE0ZjmXCb3x/Tq1dFLEpLRPcrROMpItts2mwmqOKJH?=
 =?us-ascii?Q?pjU8Y64=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(376011)(366013)(38070700015);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6A09F4E2EABBE2489979CD125E35959C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10812
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5bda3bcc-a2bb-4417-581e-08dc94f4a6c8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|35042699019|36860700010|376011|82310400023|1800799021;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b0fW6tha6K3z/lvvrSY/1eGh/iqblyZkAocmAGBw2XsUQn7QRckYZ0zA7QSZ?=
 =?us-ascii?Q?O78vFiCXWA2KIBtxkoGyJHPuRfVgpwuQxrL4Kdt6HmAXzcX1/wxGoCjCW0TA?=
 =?us-ascii?Q?5hU0F2fgsUg7vknFV8wNunAooP0caUlO8R9tBaOa6hU4Xuvs2BwVpRdURvZb?=
 =?us-ascii?Q?NyOss/n23/vcr+XUrBedCHxvCNdIautTm2TkCG2yWOgNMsp+mgvIC+yoy5Zl?=
 =?us-ascii?Q?VIGSFs3NBG+JVNnLGhCR5PbjL70lkl0ZEseBKFDERMcyEuKw0bQCnLs8Snq+?=
 =?us-ascii?Q?3qEq9469YdxNN6p4UP29uTSzhmY2u83Bvsw65bAoUa0iPOsKLl45HkvFYIQ5?=
 =?us-ascii?Q?WTV1zY089T1chiaFSVND8FuciWSnBx6dXRNNlKlmAA11dwYncqto2gIF+8+R?=
 =?us-ascii?Q?aGhbgdbAqnsOqcwb8N41EvwQMgY8Mz+XbtWcnsGGId3ZlKjvaVOvx7SMduJz?=
 =?us-ascii?Q?/pGZXsHaMiMLGRXq7TDb5drMxaA3NUORHJ0TtE4yrmjGxjLE86Il8LlZZHGB?=
 =?us-ascii?Q?0fJBcOtatnG/kyMMz/pO4PcFVAkJXrl+NtosT/IZ4eCXBbdsfsLn55qyyggO?=
 =?us-ascii?Q?tkcukPd5v5cVLH2CZ1vBH7NzwVgV03lBOhp9FBUJKlA7j8zS+b6LKgdNGykc?=
 =?us-ascii?Q?E3x3Z1swE5I9rWVONI1WJqe+FsgCOMTYKFgdww3793p7HzmWByRKqm4zsOWa?=
 =?us-ascii?Q?Ed3Xek/MJm0kfvV407C1WLfxBhpKqf3pI2AtPPDBnf2cnAiLciEId0ZqL1zQ?=
 =?us-ascii?Q?gO3xWpkD1ANea6RyMZ1ssAd/s6LYORuKDpAJcRu8xEsMlEGuak4iA8ScmXwz?=
 =?us-ascii?Q?nOipYH7Ae+RUxKy9AKrR5i+UkWPFjLAtTkNqYHvWLRMJ2tDH6vL0f8Trf8o+?=
 =?us-ascii?Q?xbqpZ/PJT4qRn/QnOtCfp/zfTzPjmLSFDqXzrZnOA0BMLgKs+w0cjqYruNub?=
 =?us-ascii?Q?nKeQBNxINXnCUbqPjDaFHUL4pg80IuZNHev/9EYf4Zv9mSYfkkJCTnD1fpKI?=
 =?us-ascii?Q?gRAJM9VLxuJFrZmQz+FRXE6TFHsjLbtI/PMADypBi7eXGU/q8gW+9GDMllrl?=
 =?us-ascii?Q?l0MD6YnJ6JeWhN5KntCdJMAkC7peNfxouTZn+vKbUwcFTV1gTQt7fNbw+OTi?=
 =?us-ascii?Q?5GrDvizD0cOR875uMy1sBCz8WZX9tja3LD6qybhFy21hrW60HLklSBZLCGRL?=
 =?us-ascii?Q?kUbOIc4kyvO6qWivPvXg2nO0wnHi+2c1flyAdth6WGRyh2nE5lPSv98O85Jh?=
 =?us-ascii?Q?szckTnMmg1SxzSL+55L8dy6nae3xI97WER3MIDMMY+bH2kCTEW91NLTEc0zK?=
 =?us-ascii?Q?RgZ8yIA+XdxkeduCTIpImRBSzGgtl/skvLQiS5QFS9IKuCgBeGwT5FRqZbiB?=
 =?us-ascii?Q?UrcFpNR23y4l7L4AeGXsCgjOSo9Cs6fckNbGAobohZcOK4EhFA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230037)(35042699019)(36860700010)(376011)(82310400023)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 08:56:15.2295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac43cfd1-da01-4282-4f6e-08dc94f4abaa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9588
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201121



> On 25 Jun 2024, at 09:09, Zoran Stojsavljevic <zoran.stojsavljevic@gmail.=
com> wrote:
> 13.3.0-rc0 in poky-5.0.2???
>=20
> What about 14.1???
>=20
> I am all scrambled and lost... Or?

As was said earlier in this thread, the 5.0 long term stable release will n=
ot be getting a major upgrade to the compiler.

Ross=

