Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D489C7EE22
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 09:42:41 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.48])
 by mx.groups.io with SMTP id smtpd.web10.84653.1684143754607285435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 02:42:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=9md+K38R;
 spf=pass (domain: arm.com, ip: 40.107.21.48, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iluMk/7fIyvIISpUycUIgiX/FgYDWWeb4m6Zxrn6rbw=;
 b=9md+K38RMN9v9z0gYalC1pygfYFk+TSkSeI2XKCt3hJrdSySy9ct8x4sYohPp/cxJ6vmKHHHAvEnkP2BDIcNBff4PY0h9ApZYOq5tbVHRnN/hWqHAB7qBvQ/snTKTRZQnX8qk5gEEvFFjzGBd/wWIO52RgIlLjPuILVHaT8UwD0=
Received: from AS9PR01CA0038.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:542::16) by DU0PR08MB7637.eurprd08.prod.outlook.com
 (2603:10a6:10:31c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Mon, 15 May
 2023 09:42:31 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:542:cafe::bd) by AS9PR01CA0038.outlook.office365.com
 (2603:10a6:20b:542::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 09:42:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.14 via Frontend Transport; Mon, 15 May 2023 09:42:30 +0000
Received: ("Tessian outbound 3570909035da:v136"); Mon, 15 May 2023 09:42:30 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e482f8b220311feb
X-CR-MTA-TID: 64aa7808
Received: from 18bb7fcd5ac8.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A463943F-3B6F-480B-92E1-EE6F992D0883.1;
	Mon, 15 May 2023 09:42:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18bb7fcd5ac8.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 15 May 2023 09:42:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0TEyfb+/JMGL2IxFFD6IcEKSNTTDJgWtp+f5SQ2QcqHMW5fqwGtAF6jZbT1rmeiwPvesBzL9dV7j8mRkDsNj1d0NXKNTRMSAgABOobX9mdEwIBuXJY7XmNfzmQE6kiYpck7AzeWNGOeXg5KmbDsMbffHGXvPTKrI8EXUi7GNlCIrofo8o8+l9GWiJTCzt5197Q/SX17trwRaKCFEFta847vEMPVaQXAgu0s2/bz44C3/V0CUL7ZwQt0hXCGU0dNne2l6VfYr8m9FG7Qjv43nErgcyPSHWcpphS37X7ix9S5ZDW5kg8TQjMDOuMGJ5//NjLYEyjzBNA6bMR2qcGQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iluMk/7fIyvIISpUycUIgiX/FgYDWWeb4m6Zxrn6rbw=;
 b=TiGwcBh6tQuBwutytlZuLXSi+s6kufrTpsHW8mTK3B6azBad41zHMPCMQ45Ezm+UlHCqEG0musHX7wBctBmk2KNnewOfmIjYrF+1EaaKZ1uuT12m/2p95++KAt0vED7iUuXJOhn1u3H1zMv14I3YQaSo2/whUh16reDQNBUqr8VrSqk/kuUSY0nSRnpaIXfdyyk8SEuEQjYRjXb6IN28uBzBttY2G4xBXUkS7mB9RKizwqorpT/0CskKqh4Ys1KkFW8JejRBZAatw3n/WudRDIxGMKjCEE6rijiJyMoar8vHg4bNwNQm/xQiwzN61VC+OOO3D0HSvbadXjWXadAQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iluMk/7fIyvIISpUycUIgiX/FgYDWWeb4m6Zxrn6rbw=;
 b=9md+K38RMN9v9z0gYalC1pygfYFk+TSkSeI2XKCt3hJrdSySy9ct8x4sYohPp/cxJ6vmKHHHAvEnkP2BDIcNBff4PY0h9ApZYOq5tbVHRnN/hWqHAB7qBvQ/snTKTRZQnX8qk5gEEvFFjzGBd/wWIO52RgIlLjPuILVHaT8UwD0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB9244.eurprd08.prod.outlook.com (2603:10a6:20b:5a3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 09:42:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::eb3c:9b42:21c9:494e%7]) with mapi id 15.20.6387.029; Mon, 15 May 2023
 09:42:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH V1] kbd: Add ptest support
Thread-Topic: [OE-core] [PATCH V1] kbd: Add ptest support
Thread-Index: AQHZhv/+6cY0T1EeIECLeMpsdePWNa9bFQiA
Date: Mon, 15 May 2023 09:42:20 +0000
Message-ID: <E1737A70-1D11-48CF-B895-2AA89FC205A4@arm.com>
References: <1684136158-5950-1-git-send-email-qiutt@fujitsu.com>
In-Reply-To: <1684136158-5950-1-git-send-email-qiutt@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB9244:EE_|AM7EUR03FT055:EE_|DU0PR08MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: c104bd4c-b12d-4d79-a77b-08db5528b3f1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 rL6g5RPjYKR3saC8jopq3lS9tLnDHreYUVet4fqn2hOGtiCPxA6FF2O/BBJMQw81cO0dFSR4ZgR9vv8T05IKHu2P1b1yxm5x+Uh0Pp8lqmJRT93ZF6JkP2GH6BoBqUdIBbMHgiN4J0kiN9vwsbE634PtiVJ8OUcXM46J6l9HOWLZ4Q0uroC1FHvUzVjPTVXKeaZJr6IOVy9mGaciREvQcfD+KNGX8kscCFCZfQGT3cA3ElzT9RATrbrRTxId/jGSYkhH+HQXNiOvyT260wG9cacuJFFcIR2eSjc037b1B7dPF5Qhk50HuYZRxP5xQOzl+IravVkBbH8wXVl+msS4hlHc44huKk/N6GfVr6p3RpicpwOCilXRuf3W9vmTBH1/lSp+Uu0ml/NTTZW+kK7NxaitbqGKlfJ9AQ7WDpwGBZL+0BQoom42q0NK+l28Q17AeYHFe3YWahc5MeKQyDZEzEYj2qi6Jnt1M7+MvLY5O6y40lkkg0cEqwVKmBZpBH/p8Q3042ZAdkBfAanvZKEshgSOCmO22F/pxpEHckddx52/EEzVzkIio8QKQdSHFqO953qDMyyAIhRYkyjWZmJ36Fg7GReOtUnuFUrgQcv/9ZYMnuAvF4tWEaclV3kvQEWJyP1Nya3sgWjHTXd+X54jaw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(136003)(346002)(451199021)(4326008)(316002)(6916009)(36756003)(38070700005)(41300700001)(122000001)(38100700002)(6512007)(26005)(6506007)(53546011)(6486002)(478600001)(66946007)(66446008)(66476007)(66556008)(64756008)(2616005)(91956017)(76116006)(86362001)(4744005)(2906002)(33656002)(8676002)(8936002)(5660300002)(186003)(71200400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <71266DFBED156E4CB5DB15266D1B8D0F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9244
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	1a63b28a-b987-4d7b-7ee2-08db5528adb3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CIgox4pMOQiJR0PghgiRo2wOdfX6RgY5T9So+4X5sJKYj9vZrtf1RbAi+oE7ZmHAxq6KnOQugXKXx8ndOpzWOQ8QP9Y+qy2KnU3dcWj2RxyH6GWU7PWwW6oC5YLvk48bSJ7zCYwZcbBitHW4vaWq8NDrkT+TAF/rzgXm7XOED+RaT0mBxex1UIhWfqiAhjaBIo1/S6mJqtpwLpR//mjXy9hvfJveJFO8S8y4CNoh4NvijeDaiiEk8HUSnwxKaGtZwHR4cXt8lCWxzZfX4m5mKf3ovxRTaYDeC7KwseZSFa8JtG+vF4kIfAeme0QGrN7YSTnqGDYkeTv5KKyfIV2iHrou2Pdd99c6uIoyOPxSpCpPTZSCI+wWwPHSPyFI/pfMkkqaSGlD3nO0wmOfs+RUph+P9CLJMSrwHNt5rDjytrzFWy0ATxhEvqxWEVvI2U9DzaCwzk3LnuIFfQl5Y/en6QJYesbBUTyjiyD30jS8DkX2wBQd5ZEYFE2UhnlZuQk1MhJE8mde6MbR0j3Tqu4NMnH6Pe501Lz7RJ+yR5lKz4NUKDTKaiIwTaciwCtMaI67T+Nz+R2sMNYJvOXLsuAhRoGdNMJ9d6QnBDAYyBNuHYFkVbkg6QcCz64LIaB8baBoSPzGRh/EgvsClmFEyDJr7uIbzL0UNct0KnMOxcSSggIY/GF/+4eeOZ7mbEKofjXVgP66cPejFiFlVaY4ZMi3FluTBNewE367dB4ZiYSwihR2QVCPmeyBnr4ERpIEWuna
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(4326008)(70206006)(478600001)(70586007)(186003)(6506007)(6512007)(53546011)(40460700003)(336012)(2616005)(36860700001)(47076005)(36756003)(82310400005)(8936002)(8676002)(6862004)(40480700001)(2906002)(6486002)(316002)(81166007)(86362001)(33656002)(356005)(5660300002)(41300700001)(4744005)(26005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 09:42:30.8443
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c104bd4c-b12d-4d79-a77b-08db5528b3f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7637
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 09:42:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181239

On 15 May 2023, at 08:35, qiutt@fujitsu.com via lists.openembedded.org <qiu=
tt=3Dfujitsu.com@lists.openembedded.org> wrote:
> +# create atconfig
> +if [[ ! -f "atconfig" ]]; then
> +    echo 'abs_builddir=3D"@PTEST_PATH@/tests/"' > atconfig
> +    echo 'abs_srcdir=3D"@PTEST_PATH@/tests/"' >> atconfig
> +    echo 'abs_top_builddir=3D"@PTEST_PATH@/"' >> atconfig
> +fi

You can generate this file when the package is built, surely.

> +RDEPENDS:${PN}-ptest +=3D "bash"

Did you try to port the test suite away from bash?

Ross=

