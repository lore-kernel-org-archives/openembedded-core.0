Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E6EC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 14:09:00 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.69])
 by mx.groups.io with SMTP id smtpd.web11.20165.1658930937212227440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jul 2022 07:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=t6IAeQcZ;
 spf=pass (domain: arm.com, ip: 40.107.20.69, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UWc/QMFaeerw7cKY+ET4BDjwP8cbvzKshsBUfb+qJzC/R5y3r82heMj8/G15YB8t9QtuF17Ur76IKw7Rb+hTdo6pKcsfnKdFwaxzNGXIcPgwSskrGZRk1gWxJUTkH6xCikeXD46Kl6zTM6O0BgcIn5b/pL3FIdsJLFl71vA6FSsgGJqpBh80SPWsxTex6w7CjTFeZMSYijA1Cb1yCwdZLbssQMpOL88wGaKobrGZdNOe9BQ4M9NmiX6sj/gpC0J6H475/beMBanGrMsBpfBSFLCuWwxjiHzC25yevrKuJLoprFCHUX162GuzugBm0DleG0GJpfqMFKE/KIe9807HIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUyQrkCkQNg3hPHzHpP8o3TlPlGysWKviK4edc0HYpU=;
 b=PEBhAD0N7K+uXqkcPLPllOzKmqNWpjHheJj0UcRjq/6ikxXklC/OHcbPl7eYGp2FpJ8HbUzhIgVR0SNZVq3F6SaxtxchRYOe5a3d2LxB3ah+qUECf2qMdJm5cMT+rMunlIbkLaWZMWasUObPh8veQqEJqMefrnD4mV6ySsS7xlCpUDn9o3boTEQGYByp4eQ2M3cWVkyMDKWwHbJhXIvmP3BoOkoTY7aRzbOO0tzN3r/9OnvzDjJH74FjsxAMlK2qeXzebE0tGYtewJGWLkQu5UxfyyYno9vVElo632onQOrK6BgykSeWMrbKFrFgcsP650eyWA0VjRZxO/VQQ1g1PQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUyQrkCkQNg3hPHzHpP8o3TlPlGysWKviK4edc0HYpU=;
 b=t6IAeQcZg3SS69348EOuMU9baAOsEDDu3s6I/CbNVSUuKEEHy218ml6hDjZZB/dpTRuEnE+DlGxD20L/WUPJOwYdtj6KEUJt63J1ijHCPyr6PG+EQKAfbbCjpsdCxOT8HUWlaBPVCqjhi6jb/69hnGO8g7AqYYXLFKq6/NVHU1E=
Received: from FR3P281CA0028.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::19)
 by AM7PR08MB5301.eurprd08.prod.outlook.com (2603:10a6:20b:dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Wed, 27 Jul
 2022 14:08:53 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::19) by FR3P281CA0028.outlook.office365.com
 (2603:10a6:d10:1c::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.4 via Frontend
 Transport; Wed, 27 Jul 2022 14:08:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Wed, 27 Jul 2022 14:08:53 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Wed, 27 Jul 2022 14:08:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 236031fff1760c88
X-CR-MTA-TID: 64aa7808
Received: from 030b2ffe1f5e.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 18626115-3610-4140-85C0-2656DB6573B3.1;
	Wed, 27 Jul 2022 14:08:42 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 030b2ffe1f5e.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 27 Jul 2022 14:08:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHcplgqFoyx8p6MjJUS1gGidHN9xudmbMt8H+wrWUU1/XL4WeaXtZmXIHxkzDXl60sHcvYKOoywEyCwVqOhY6IfRzuJzsgo+cHRRFYFsojRxv8+RO/tXZtrExLS8/BjGWz04IhAz93tsIXtYOULYZ+F/qPtnDNF2br/UVc7l/eVpYX/JCMXMzlBR9gb650s04j7nXZt0mMnXlfQ1TjAo4epynUlFyuQ4BnmqjzFr0NSVI4clMTH3rPzWXQQ3GtWFsLP0ZYSfz7TwJAmD4Abj4kGdLIKFkF5uzFz84tt5fmKdssqbQ1qAyMw4sD4tF/000RvfJ1b2U6r0Urb7e9rxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUyQrkCkQNg3hPHzHpP8o3TlPlGysWKviK4edc0HYpU=;
 b=gWGgYrlA+AV4cGO1SfAkpLsS2Ojm6X5JACeTOOy6KkLMFuRQ4sHDPYO/ReuX1Q/S+dgbCdjI3fSPhr3YrMJqaH3M4WmUj3kpp5uo8JBlBZqHlAGiWKRJMTfaWaZVqw3HFCiRLrvzBWtropSJbvCqrQFIwTUERVyEJcSseMI6VQ8pgu9iC+xWx2dp9/3tTuBeK38orIUFJYKV6zPNlgmauC1By4CbOXrL/KAIUMe/5rbVRMmUnTsIRJ+NL7YbR7LAUdLAzp5siaA/ewZOpjWOgsDRLvO3XUmZd9FvRfKhONL+puiaxun7sJKOirSO/fxpizVPc1Zw08RM9LjTFD/nFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUyQrkCkQNg3hPHzHpP8o3TlPlGysWKviK4edc0HYpU=;
 b=t6IAeQcZg3SS69348EOuMU9baAOsEDDu3s6I/CbNVSUuKEEHy218ml6hDjZZB/dpTRuEnE+DlGxD20L/WUPJOwYdtj6KEUJt63J1ijHCPyr6PG+EQKAfbbCjpsdCxOT8HUWlaBPVCqjhi6jb/69hnGO8g7AqYYXLFKq6/NVHU1E=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM6PR08MB5112.eurprd08.prod.outlook.com (2603:10a6:20b:ee::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Wed, 27 Jul
 2022 14:08:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e147:1bb6:acd3:5110%7]) with mapi id 15.20.5482.006; Wed, 27 Jul 2022
 14:08:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Rusty Howell <rustyhowell@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
Thread-Topic: [OE-core] [PATCH] debian packaging: set md5sums for conffiles
Thread-Index: AQHYoTSanZkPBABEwE69UtQ4pRZAgq2SC9iAgAAPMYCAAAqVAIAAGXIAgAADQgA=
Date: Wed, 27 Jul 2022 14:08:39 +0000
Message-ID: <7536019F-34C9-44D8-9380-425C4FE67207@arm.com>
References: <20220726211328.2122681-1-rustyhowell@gmail.com>
 <20220727125339.70e1886c@booty>
 <CANNYZj-FJHUQgVb3GXWjEd6mkQE2-wkX2vUky3pJXQLdq6LPVQ@mail.gmail.com>
 <9DF62C6C-0996-4520-B4AD-F8E579C8931A@arm.com>
 <22FA8BA8-2F9D-4914-9C05-5385EBA4D90A@arm.com>
In-Reply-To: <22FA8BA8-2F9D-4914-9C05-5385EBA4D90A@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 670de468-8486-491a-1301-08da6fd989a2
x-ms-traffictypediagnostic: 
	AM6PR08MB5112:EE_|VE1EUR03FT006:EE_|AM7PR08MB5301:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PWvMGdgGN+IwjwAYaEyejQpIIOJgomDmpLzwAWp3vstoEZPvImQ9vkJpOZBphG1oW/4yG63CJSCw7xIylywFMFNa1vmlgRSd5XCf9ZZ2wmvZEWxqtRNqdtJhng118WCoHeN+Wvu6KeozqPL3xlLNUND1qW0UlOH9vUlEqh2SL82dalqm71g8Uxp2+FGJGEmGqQuQNVqFLTVZwTtPTN/0fycbAYlZurONv5nmGmySYqNQenEHgKFQ4drdowbfdY6fo0RqiDw+TxRmSkDFjMKg4Q6Vs9tZeIpdR0x6HScmh66zQUvRXITaTeNXzKLNlUjoaqikYXjU+zt0aQLwDGzOBZhODX9OcaCF8FiuzdpVgVM/+7/Kzaixc7/TpeMA1nRHAcCgJhrYV4EVBIGXytMVNlrmeNtiQ71i8i5nSTunKQc5G2ba2yHAnikU4j44mKberpIha/O6zaKJ1PpmtEb90d0grEBlCyIcwAczxYL883IXE57atIcJ0OTyLUm5EZifrjJMXB8JxQQWlyvN6kbuauCHTE+9ecOPomyjJORsuJ6R93zQaEHTgfO+bIaiXrXjo3hRIbTHn69eaGuOG8BC++hsEIpXDrPCBAYuUH5dL8az+NsDdOIo/Roi065yWHQut04Zn9UhJOfM7H+YiqkYjhFY9bkDnPWm497wb10fx5eAHWy9aqBtLtYybogn6q3yhnPEnSs3I/gKUFMVL+gvSb/uvqWXo8TukiQPWXjPKCwODbrx4OR6zf2KkIcJkB8PWIW1obNizgNtxvbZ2kalORE9mP12qYgyB4fwORy6yG/23fuXJok2UimJp66KNkvgR87uD5nWD09zoaAt7rHfatbR9t3ffx4JsBWk9IeBFHNuYUCep0CFheHRBDsOrXj7/nYGJt0MOmq3Y0Nb/jr/zw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(136003)(396003)(346002)(366004)(4326008)(66446008)(6200100001)(66476007)(66556008)(6506007)(64756008)(122000001)(76116006)(8676002)(4744005)(8936002)(66946007)(54906003)(36756003)(38100700002)(86362001)(91956017)(2616005)(6862004)(5660300002)(83380400001)(41300700001)(478600001)(33656002)(2906002)(316002)(6512007)(71200400001)(26005)(6486002)(37006003)(38070700005)(186003)(42413004)(32563001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4BFC8FC9BA6BB42B55C8EC51AAFCC67@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5112
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	742cb9de-d77f-4611-fa52-08da6fd9814a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	USAKRGLCDNpNfRxRLM6yiKtuujtvpZedyN0Q84lEL7+vkYS13zehecpM5XOiKp4ZOqsXTSffkMk8/ZvQf0uc54clSWGQebxe17LyMEU0+7IOHmlY2UNBzokM+HgtVFxwsTHBqpxC9bPaZTpUWwTEI523kJBy/0BSskA9zwkZRNEUA4g62LueVp3jpPQEujiBRzu/NGMnzyk6yxma3F7sS5l5bFLFTKDku7O6uIPRWxRULNPWpWqKEFBV272x0D5GOXKqQU8jxQSGO5UyyyLBPJcpx75QhD3983vXHgY3CGspHItwMja1H63qeB3wxqnsg+kLgKMRxK44ZfQdw2MJLU8sECHT/IfpMMoXockvo6GvoTqBkL9dvLfv6TfSW4+KTNAh4cHVj9+4X3g2DJ28QxWwty2McQcDoo2EI4MlL8xt/rQ7hQs5eE7FgQkcNxb+7cp848m1Xd49kPPaqFKy1IlBP0MFaEd8/mcsMZc031S7PqEthI0vokw4DNxEwbNQWno/2rJRDBKpNid60eUKQ621ABMwTDjFf3V7RaA5rOHcGgQkZXWyOHr6vERrZZe1p91+fL+g98WAuSlZZcLn8TtWGaL6fzEszIkSUNFJRZ4hC5Dtbie0j4R4FgysROMCEY6huPnIMoQ0wkV1QlU8xDpjp7EHp+fx61phgT+6yU1GIAiMNiXrCydEt59ufr4pti2ciwQ5RZ6JsHkHhFjpT3IcRuglXKKSm87XLIKdVI/Ieb5dTfiYwX5hKeijQT/3fTB25O7nTn6wWwnQavyf0SXjis2GcRcsiQ6gtX6Af2efEzBn9FTD6aji1q6d6Pv2SpsEYOO6QtusjePa9uP1qRWvCqoVULhdqZ1BWwpl5AU=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(376002)(396003)(36840700001)(46966006)(40470700004)(26005)(4744005)(8676002)(5660300002)(8936002)(4326008)(6862004)(70206006)(70586007)(356005)(40480700001)(81166007)(36756003)(316002)(6486002)(37006003)(478600001)(54906003)(2906002)(6506007)(86362001)(6512007)(336012)(2616005)(33656002)(47076005)(186003)(82310400005)(36860700001)(82740400003)(83380400001)(6200100001)(40460700003)(41300700001)(42413004)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2022 14:08:53.2783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 670de468-8486-491a-1301-08da6fd989a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5301
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 14:09:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168563

PiBTbyB3ZeKAmXJlIGRlZmluaXRlbHkgbm90IGdlbmVyYXRpbmcgdGhlIERFQklBTi9tZDVzdW1z
IGZpbGVzIHRoYXQgZHBrZy1kZWIgbGlrZXMgdG8gaGF2ZS4gSG93ZXZlciwgdGhpcyBmaWxlIGlu
IHByb3BlciBEZWJpYW4gcGFja2FnZXMgZG9lc27igJl0IGNvbnRhaW4gaGFzaGVzIGZvciB0aGUg
Y29uZmZpbGVzLCBzbyBJIGNhbiBvbmx5IGltYWdpbmUgdGhhdCBkcGtnIGdlbmVyYXRlcyB0aGVt
IG9uIGluc3RhbGwsIHdoaWNoIGxlYWRzIHRvIHRoZSBxdWVzdGlvbiBvZiB3aGVyZSB0aGF0IGlz
IG1lYW50IHRvIGhhcHBlbi4NCg0KZHBrZyDigJRjb25maWd1cmUgZG9lcyB0aGlzLCBidXQgd2Xi
gJlyZSBuZXV0ZXJpbmcgaXQgYnkgcmVuYW1pbmcgYWxsIGZvby5kcGtnLW5ldyBmaWxlcyB0byBm
b28gaW4gdGhlIGRlYiBpbnN0YWxsKCkgZnVuY3Rpb24uDQoNCklmIHdl4oCZcmUgZ29pbmcgdG8g
cmVuYW1lIGZvby5kcGtnLW5ldyB0byBmb28sIHRoZW4gdGhhdCBpcyB3aGVyZSB3ZSBnbyBhbmQg
dXBkYXRlIHRoZSBzdGF0dXMgZmlsZS4NCg0KQWx0ZXJuYXRpdmVseSwgd2UgZG9u4oCZdCBkbyB0
aGF0LCBhbmQgZXZlcnkgcGFja2FnZSBuZWVkcyB0byBydW4gaXRzIGNvbmZpZ3VyZSBzdGVwIG9u
IGZpcnN0IGJvb3QuDQoNClJvc3M=

