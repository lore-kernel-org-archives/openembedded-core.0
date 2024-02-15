Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBEE4C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 12:12:36 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web10.12347.1707999146450644663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 04:12:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WpKvCstx;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WpKvCstx;
 spf=pass (domain: arm.com, ip: 40.107.8.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h3OO69USONW/Sg165aOMsjbl4liIrNbrTqje0F/UWqdUHKUjjhBTJ/7jakvp3YI8eSMs83f+smh7QTBKfg7DsvydeCZH88+NEEQemWEWCEGknIfbNQjiDNA/HyU4LKoW4HoH7sI8oajaTlSi/rjG2h9M3Moiy2Er1z1XaesFeVMsEVmUQ2hWjr3JSop/pB4VLrlXYtQbX+upDN69gpumweKv7OcKZwBCXifP2hAM8eKYERH8JvzBxpF6/6FNhLZmEmjogSVC9/lFbrMCAapiFimc0lNqswD01xCiEK3CoOpMF17HwTv27uu6tzIaHNCXpK1a129HvAtUwjPx6jrPmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEJyW5sqS2P0JucJfKCX7tXaJsjh5PgCfRrgJuFVyGw=;
 b=AUTTPTR3xxWNasHnrkDyvytIjFwaMFfJgTWGCNz/IvWSfwy/IQfU/WVR3ERunT7jvO5uImKyVQQbiSp9tJN0RDKR+wwJRJDAd46miHHygFj5eUexuqpuR2JvmDRAdJD9ra5spADQXVtzaJ+VvFun7WAkBa6c2rQNGfaXxoaG0jIv83UrUqkHVb03ih/q3dFVdemaBsYqCnpwcrqnnw73npGNW2pC06BuOchARN1Svn/AWEosT4l0w/qibwy0PEMdAj795aUeMFnmSYat97J77dNxggFEkQTctaEG9LK5I7WTPMiKQPlN9VMQ4n3CF4SNAht/PU7Ggy9wpAuHYcliHQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEJyW5sqS2P0JucJfKCX7tXaJsjh5PgCfRrgJuFVyGw=;
 b=WpKvCstxWNUbQDhGNk80/bBzLj8Us25pdwvcEmSmzRst8khkmv2OnIcNcJFWRff+bjxUc31eQiRBnU+RcK78dI1KwP4JBf65qyt1NOmIFujh2f+H7CHH0cH3mGCE4J/19kK2A4RjeNTGjxmiP38ZqvsBl8o7b16gn1KGCLJT/Nk=
Received: from DU2PR04CA0171.eurprd04.prod.outlook.com (2603:10a6:10:2b0::26)
 by DB9PR08MB7675.eurprd08.prod.outlook.com (2603:10a6:10:37e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 12:12:20 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::c2) by DU2PR04CA0171.outlook.office365.com
 (2603:10a6:10:2b0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Thu, 15 Feb 2024 12:12:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Thu, 15 Feb 2024 12:12:19 +0000
Received: ("Tessian outbound e358842a0ad8:v228"); Thu, 15 Feb 2024 12:12:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f513b743e6ad3ab
X-CR-MTA-TID: 64aa7808
Received: from afd7adab3002.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 08520077-2735-423A-9F21-DC84DF1D0005.1;
	Thu, 15 Feb 2024 12:12:12 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id afd7adab3002.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Feb 2024 12:12:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhbbLdZ8gsI2b4q98nUolfEGgDkxEhiu+qTeHJ3htimaRf+NHoHcpNs6e3varUARPXuSsjfv7kFod2IA90RRgO6NonvPr0EjpEr02Pnqu4HK6/vOTdIURkDNlSWGWh+yPB1k9SFSWYdOyGZDt/e0epIkc1mlSDBeQpKIOz29kjKMhHs1fuPLmNRj0wx1mUySViu5Fz/eT/DS02EW3FU94GDtJZhh3BaAhqX3bDxsAQpYioNY4SzrZjejoSy0GbGcgvbf1chyAOaC3k7HqjWlITiWhDFwygKiLxwPD+NUI/MIXRo97bU3y9LT5hK/S1O55dA+xi6C4OPwdSDIpLIy6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEJyW5sqS2P0JucJfKCX7tXaJsjh5PgCfRrgJuFVyGw=;
 b=GH+92xaa9ita7keqbSysVJvdN3fJ2JZBUbByHU6yTCMhtluMeeupHUHNVt+3mPQ+9yoECCLQLJglIH9mxVztf6pdEGkcK80sXk+M5zyfrslnyXXU8qrZWHUpEVAn57lUHBoXOiozT4z/u6QPmSwvctxrDjvTKHWmnNDkWrMOR8TrrxQQMsd0/yE6ZQrlSDHLgFfiG8IH73bwxvLjo9t+/2e6YjLOCd9QVyoYU00iAWtoB5Z1mfa41wXc36M1qO+gAPC42mFMeFjvSTULIspGVUhyEXf4jTlkObQesfIfAG5wgVaRoYC4OhIUWCLs/usZig3X+UIH4A5C6cPUT4ThwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEJyW5sqS2P0JucJfKCX7tXaJsjh5PgCfRrgJuFVyGw=;
 b=WpKvCstxWNUbQDhGNk80/bBzLj8Us25pdwvcEmSmzRst8khkmv2OnIcNcJFWRff+bjxUc31eQiRBnU+RcK78dI1KwP4JBf65qyt1NOmIFujh2f+H7CHH0cH3mGCE4J/19kK2A4RjeNTGjxmiP38ZqvsBl8o7b16gn1KGCLJT/Nk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7405.eurprd08.prod.outlook.com (2603:10a6:20b:4e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.43; Thu, 15 Feb
 2024 12:12:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::740e:ab01:e66a:61c9%3]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 12:12:10 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] qemuarm64: maximise the emulated CPU
 capabilities
Thread-Topic: [OE-core] [PATCH] qemuarm64: maximise the emulated CPU
 capabilities
Thread-Index: AQHaXpuskZjEfk3qxEW4sPUWQUmuQ7EJrfSAgAAAcoCAAAYUAIABQi2AgABcfAA=
Date: Thu, 15 Feb 2024 12:12:10 +0000
Message-ID: <DAC0858C-24A6-403E-B160-08EA99B444C1@arm.com>
References: <20240213164223.263232-1-ross.burton@arm.com>
 <ZcyeP_-leKRqfafa@nuoska> <0337531C-A455-4011-8641-F892DA243B81@arm.com>
 <e766df8fcfd7a1dd0b8452df9ad0257006ae1be8.camel@linuxfoundation.org>
 <Zc2x-zmJVO-F4IXm@nuoska>
In-Reply-To: <Zc2x-zmJVO-F4IXm@nuoska>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7405:EE_|DB1PEPF000509F6:EE_|DB9PR08MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: b15abba2-7f8d-4715-9b09-08dc2e1f5b98
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 p6GbyqBu6ybqnrN9HUqfODNGKvlLtBSCY+lco1C/MugwIsHPMy1MNtc6laDw/fE6Rx3pE4GVRr+I8qmQ1ERlnZp4bMu+FMrarjXG4+AYr29otLVfi4jU7GyxyhkfcbXeVeETmugudNj4qYNVTE8/j4nRYEyl+LOuE+IcPIqxW4d0FVd9cDL9FENaraH7xmM0HznX2L7F81w+smREQRuZqMz+4ppzGexvNHmG2ROXT2WTfzZsFechggUU9z9IvADwFTHHTgQ1mPkdMk6Tkmsr0AoyUrryDQIwNf4AFzdMHWq7dvw9oW11AOFCDJIecZdjfjuPeoR2cLxgd5bQ+VVFI3K9MBSjGKrDZsKtLuXjceo9I7qIqy0PW4Z7Kv2ec3QNJTXgTxHJeowPkXaSNI4AWpBuRPKS2SKYETGU9msvZCoJGONoRDsk306FS7VQcpPcPCI00+Z70C4ZIpsb4WHGKyHR7ZV4HLgI+nJY4kvdr9MudTvvdUs4NycSM6GhqKJEWm3jlqi1uiP+61l7mV/koPKWYA4ryVrDsZiCoDdUmvJz0KlJrcHIRLSaJ1qGWH7zTefOsNprz6Qej1fF6XgbgdDJHRyE7XEdJl25d8f2Px5i+2aexVgmh0+QtE+nePJc
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(396003)(376002)(366004)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(71200400001)(316002)(54906003)(4326008)(5660300002)(2906002)(4744005)(66476007)(8676002)(8936002)(76116006)(86362001)(6512007)(6916009)(6506007)(6486002)(66556008)(66446008)(64756008)(66946007)(478600001)(53546011)(38070700009)(36756003)(2616005)(26005)(41300700001)(33656002)(122000001)(38100700002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <564C218357EAC0489E2BCC9307FDD29C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7405
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	327e3118-6d3d-4772-f1a1-08dc2e1f5656
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vcfDgZkyBf5ZOzA7I8KM3CpKwcFXRThtaPWcTpX5kUFJzoYqPn4E2Oc0fX9C868QVzt0GyhuokztFNqTlSUlxJyVWXh/0Ew/9FernqiLrXuihFTtdWYtKFPnoT5Cd48n3pwCwe5Xjp4M4ko7DaLajh/elZoY6nIHNwE1xRUu3FjW7yLgwprc2/XjCpL8tTJmT+rrJlbR+YAU+TPTxQ5gCHJm6+CiEOgEFdUc+ba6ZXCUZsSeMEmht8cKjIJcZdTBhDdXEVEINFhCPlw+YEg2UZvoIvsOcLERNOwjzKgSVbvMS9ZXlWUq7lXX6SmymplvlCsg8MKhQ5keaQDjd0EoI/O9YvT0Oolwv8AKLH1bzuBx01VzIT+D5aNXZ+eIqD7ZPqVpIIHua9GFarPpRAOErjhoG0d8T7CmYglbpkVNdnIIPnS50Ebd8W3sf9K+612P+zMbz+gkiCQHlZg559Epgc0aQw4Avgqo4+D8kNd9jcLUViHx/D4N8SCl9RDPCs/K/JPLcpYdvPW13iJb1iLHuwZQ3xN/QXNO7NrlXBhe6XXDcN/OfkoNLq9wHmPyO8g89lISJ3u1R3GUNkLjef//RaliTsRk7LZpjdxvjezKpmMEAdpYMEpAvbVtvxD732qkaBromUORPTs3sPfrfbV9lVhmEzuc5Ax3H7TYvURm8xs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(64100799003)(82310400011)(451199024)(36860700004)(186009)(1800799012)(46966006)(40470700004)(4744005)(2906002)(5660300002)(36756003)(2616005)(53546011)(6512007)(6486002)(478600001)(6862004)(6506007)(356005)(81166007)(336012)(82740400003)(26005)(33656002)(86362001)(8676002)(8936002)(4326008)(316002)(54906003)(70206006)(70586007)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 12:12:19.5359
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b15abba2-7f8d-4715-9b09-08dc2e1f5b98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 12:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195514

On 15 Feb 2024, at 06:40, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> optee xtests are triggering a reproducible RCU stall in our testing with
> --cpu max,pauth-impdef=3Don and qemu-system 8.2.1 from Debian unstable.
> This does not happen with --cpu cortex-a57 on this qemu-machine version.
>=20

[sigh]

Can you file a bug against optee about this?

Cheers,
Ross

