Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E793EC54E58
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 17:15:43 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.47])
 by mx.groups.io with SMTP id smtpd.web10.2841.1711041336928215627
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 10:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yoSDfZbS;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yoSDfZbS;
 spf=pass (domain: arm.com, ip: 40.107.104.47, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nwI328WZ/INOr6uRn0P8fF+UT0qgy2fEop412miQihjbw8CxHRCP9G5COKJLG2FdHhHB76pq2sdElzyY6I5653Yag1CLm4OmAERzDAtiGm3/lB155MCMXNeG9Z4tGHM3AwaHv7DYt8B3oz8uINbmuMbTPLB/xfV5VomJQKdtlhoaitKhLcUhWWR/B/Z7HIigiwnmS39rbVED2fqBgLOkF0r9uoZcMQ+WpNCKwlbSMiZDoKbVdpWVJL+PxEORIsAPIcMbXCaa5NsrN5VFWHfR/3orVZpRCwIuX+qTqSlCcE8PFzdRRyq7mxcgLBQcTzNyoJ0635S+XNJs3mTIFyt4OQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX3BJvpGVtYwaUYA0e2I1DqQ9MVF/ytQvK2SHtalvu8=;
 b=nnIOaj4m4j1BwDvHzsYJADxa3jnpji61dkW28Gp89zyW9sQSPfubBxMuFJUOTkSIZ14fZr7ThOwoEINImlS70G0k44Hq/mnB0WO1huDeLNQsCR/97AG9nJDFiodn3bQP6SrkN5BjQjpJFMksawrFJ8WxeuAoYrWjU4DqlfNCmpSrKvq30cFVlGbcJIH5B/zsG0bRlVLqsgZfY0eM3ctIRVNcc1zJ9ZSHhDxuEBky3YbxdL4QNTxcryIXzlQl4cJCshzvKyOscg30kVtQxFPlcA02itUpzUN+7Yf8rii7M1m5zv404PgUb+lc2EmdIMBTi795YZMLClViR3SsQ1iEfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX3BJvpGVtYwaUYA0e2I1DqQ9MVF/ytQvK2SHtalvu8=;
 b=yoSDfZbSiT1M5EA1zl4i+Rgp2nHm32iyiOqcxLIvExOJ0olxrq0lcw2g8HW3o8yCpJnvSMlYHUiQkB3Em2I7Nfl20ZYBwn+7w0CjoQ3RLHd5UCaAT+ofdOY0FlJSTD+de1q8mHRv8cBR2IO/ebR6Wiyaq/ifvu7lnbTMfCyRNIo=
Received: from AS9PR06CA0771.eurprd06.prod.outlook.com (2603:10a6:20b:484::26)
 by GVXPR08MB10517.eurprd08.prod.outlook.com (2603:10a6:150:156::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Thu, 21 Mar
 2024 17:15:33 +0000
Received: from AM2PEPF0001C710.eurprd05.prod.outlook.com
 (2603:10a6:20b:484:cafe::3b) by AS9PR06CA0771.outlook.office365.com
 (2603:10a6:20b:484::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Thu, 21 Mar 2024 17:15:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C710.mail.protection.outlook.com (10.167.16.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 17:15:32 +0000
Received: ("Tessian outbound 1b0f2681ce6f:v300"); Thu, 21 Mar 2024 17:15:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bcdc0d4ace7f8917
X-CR-MTA-TID: 64aa7808
Received: from 4dc54d6af618.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4AD07F4A-ABF1-49FC-9A20-1ED9162E7F40.1;
	Thu, 21 Mar 2024 17:15:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4dc54d6af618.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 21 Mar 2024 17:15:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TG/C87DR6YS7Ic8dGHhBpYi8T9oLXtTtYgQJquZDjNGTpv2GqLqgl/e7DgOt4BDzB5vTMeM650Xe/7d2kxEWtEq12cCCE+/GC2mZUP5q6cuswFTuBPq6P+0lITfqQ5ZKVsd9PtsVShakJiQr0AhCpFxa7GJCAYKh3jQG4JQrrvOIvxxp751Ma2OSI51impq1tUDPQwXaEKiiQ0eMKRr/hWd+cbI/V/XE40URclGeFbfOlvAQh3PVm2AgrJse+2OeXNfM2BvD26m8wrTkr2L0YcJjjL4VVCgzy4SX/bt9qrWnnqIcyTUw8ThRUlrRglTq8zfodIb01GevLC+1jgcBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zX3BJvpGVtYwaUYA0e2I1DqQ9MVF/ytQvK2SHtalvu8=;
 b=fyZ7W6uaLs+rWTjRfrPhd81KK6Z99XTAvOfB/2ajjRC9hoTPYtXWmRIbUmw5oLpgSlg5Q8OkjFML127Tru8boKbXH9he8T+at9QopfWK2z5D3+BfhzVuXY3WeyGc4952LfyOQjZ/CuhaJDBMWGg8suGc0bVY2Sv3UtgRPWXj+aeRsN4QFO6lZaeyGm2qQf+plCnFXE6dnc44kUMpes4AqHv7E0T+pf5BPmb49UUhwJWG1OkrEq4GQmoF6vGkGM1ikR6IypPYgoq/LUn26nB5hy48y9J5oKbeOjw1lkk3HIcs9aypeAvaXJQoj1XgBhzJEYUoKQXVlk0HUipaw7xVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zX3BJvpGVtYwaUYA0e2I1DqQ9MVF/ytQvK2SHtalvu8=;
 b=yoSDfZbSiT1M5EA1zl4i+Rgp2nHm32iyiOqcxLIvExOJ0olxrq0lcw2g8HW3o8yCpJnvSMlYHUiQkB3Em2I7Nfl20ZYBwn+7w0CjoQ3RLHd5UCaAT+ofdOY0FlJSTD+de1q8mHRv8cBR2IO/ebR6Wiyaq/ifvu7lnbTMfCyRNIo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV1PR08MB8377.eurprd08.prod.outlook.com (2603:10a6:150:a6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Thu, 21 Mar
 2024 17:15:22 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7386.025; Thu, 21 Mar 2024
 17:15:22 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "emil.kronborg@protonmail.com" <emil.kronborg@protonmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>,
	"rasmus.villemoes@prevas.dk" <rasmus.villemoes@prevas.dk>
Subject: Re: [OE-core] [PATCH v2] file: add CVE_PRODUCT
Thread-Topic: [OE-core] [PATCH v2] file: add CVE_PRODUCT
Thread-Index: AQHaeuD4owCEDxAQmUylWIWFV4DCabFCcOeA
Date: Thu, 21 Mar 2024 17:15:22 +0000
Message-ID: <2018B03D-33C8-444C-90A1-4C79C39B7010@arm.com>
References: <20240320160849.231211-1-emil.kronborg@protonmail.com>
In-Reply-To: <20240320160849.231211-1-emil.kronborg@protonmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV1PR08MB8377:EE_|AM2PEPF0001C710:EE_|GVXPR08MB10517:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c89b33-208e-492a-7e8a-08dc49ca8438
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 wIFM0DC2CpH5DFMhm6wCJ5tnWjiMYIrFmUtL+jc0dYHFMNDS1Le1bf1TnNXMtFm4VhzV/sbrPLUO6ua74rd7BDawXgjzFOJiyrjOEwluYn7+eFMK/JngeZ7hvrpqmePXK+gxPh+0w3NajCpcqm35wPMcZYYodheBNKM4Bsfc8p7K+RZ3GUU+O5o8PylSwW8r2B/XtwgSbM9pOVcTgigSXK8H48Mq4yqvxP7BANGIwBzO2wAfHpVH4v4KnLMpZX1BkaxBToYmhGdVwf5NN+cNgqrhQzXwuzx7UH6fENcYXZaGFlGnkVpPsZlezpLG7cOhEsABT5XssoG6oqR2kP9nwVJX2Xx35vTpFJrNOSlyBCmUVE4mdBPumvU2sq3wZrSlSOUzrnIHFZ78kT762OlH6NM9JE/rkJTZxAUvrJjAroFzi/K9JvcCVMt/iVwHsXwGBPzKQFEqRqO/t0Fhl/jMXtXFG5NS0Jf8+SH0zJp6WMoelyhoM9vGXckT/zszootnlxStZegC6zP6sSEEcHaiKINWpH0AYbla7EqDGl3SZZNRzthUq+N0tmK9prrbpZAU4HFRxiMnoFg9nCrs44OOO0WYYOK6CnTeOpbSQAwmZj3LQ/C0vtLeI5sEg/IirSPPnFTGxV6+/wD+Xj3oULNiaF1nOJ6BUF7d49IiP65IdW0=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B7D0A5EF6FAB64489FCB27A062B79C3A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8377
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6accff62-2248-40a9-2d41-08dc49ca7dbb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	RviSMvy8UgV5h9GIemIoa7GLIlnA+Mw6faVu6JYoYg3ydBLSZStY6YmdgkPR1tS8tLNo9AbukgQmUSGzyypLoWoVUeSo9FSo8thdTeAvWVB7eOZB9O92leTHwFw/fu/TO/3/ngirgH9PNqfInYcNPPIiis2I/0AmLPzhZF0oHRh5ki3hd7ER6HvXdWwWQOeUFKB8YMwWs/Xks1BhOxYjG7VUXeqOrxunfAXcYj8C49PeoGQlvoPISTRIMyt8rnoT4oW/T1o+n1xRSD8mU0VY2ydzoN8H9tof8/KXpaPnYa1iNRg6VoWamG2VtLqH0cijDy6EPrB1OxcEtuYF/o5gH1848FmsJ6z3kTADJuX+tYh19I9VeB7f2lG6Iw83KJ7U3L5NlacKP6uQB25JY+vhe674JyAEX7UR9HfrFXgfa6waT3hbg9suXPi/ELfxt55oQoi4RPi1gwUxQLnO2DSWSBKF/owTiqUzqZRsTMirc7G6u8c7P/PHF6TMKMhru0N+NTMtbJfD1FztRxLCLY1i2rXLUzkl3s7OCHxHpc8LHSBcROE7jV9H2lb9To+fvpBm1vw24bVKMvqXBZXsJX77v6sDziA2t2w+p1114LU/y3DRDkR0/PArIkRVHk7OcaU0K2qhZ1l8c38Vw4gKyq4j+BUxycNTnwUZ0KboK2av7g3WAYPIC7v0wr9KNy3caY6mMc+7iysZM88kUHXG3y13dQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 17:15:32.9659
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c89b33-208e-492a-7e8a-08dc49ca8438
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C710.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10517
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 17:15:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197420

T24gMjAgTWFyIDIwMjQsIGF0IDE2OjA4LCBFbWlsIEtyb25ib3JnIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxlbWlsLmtyb25ib3JnPXByb3Rvbm1haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+IHdyb3RlOg0KPiANCj4gSGF2aW5nIG9ubHkgZmlsZSBhcyB0aGUgQ1ZFIHByb2R1Y3Qg
aXMgdG9vIGdlbmVyaWMuIFdoYXQgd2UgYWN0dWFsbHkNCj4gd2FudCBpcyBmaWxlIGZyb20gZmls
ZV9wcm9qZWN0IHRvIG1hdGNoIHRoZSBjb3JyZWN0IENWRShzKS4NCg0KVGhlcmXigJlzIGFsc28g
ZmlsZTpmaWxlLCBmb3IgZXhhbXBsZSBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9D
VkUtMjAwNy0yNzk5Lg0KDQpSb3Nz

