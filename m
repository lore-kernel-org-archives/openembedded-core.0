Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32B4BC001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 12:14:16 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web11.15544.1691669649627438954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 05:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0zf1T0DZ;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=0zf1T0DZ;
 spf=pass (domain: arm.com, ip: 40.107.20.57, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgIygvmr53YkP7txQ3axGvPvwUcGh9KlKB9jgLSpzJc=;
 b=0zf1T0DZvw/YXRLoejNarWJRpLiQcnX+3FeEhu1iQOIDg33ItiPIW81gOCwB1fbdCHU0BYbojlUGwo4JQTHbtjmqq578KxCUtdm/4hm/2SOGP3AFvfs1v+tJO/RSuUzb2OFsYpISyEiQ7LM3Rk8tCot7HzcwpMbps6mcUxoXEIU=
Received: from DB9PR05CA0022.eurprd05.prod.outlook.com (2603:10a6:10:1da::27)
 by PA4PR08MB7618.eurprd08.prod.outlook.com (2603:10a6:102:273::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 12:14:05 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::94) by DB9PR05CA0022.outlook.office365.com
 (2603:10a6:10:1da::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30 via Frontend
 Transport; Thu, 10 Aug 2023 12:14:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.19 via Frontend Transport; Thu, 10 Aug 2023 12:14:04 +0000
Received: ("Tessian outbound e1fdbe8a48d3:v145"); Thu, 10 Aug 2023 12:14:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5260a9223fb15bb
X-CR-MTA-TID: 64aa7808
Received: from 8a7f1e51fe79.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id DAE9CF47-2223-4E5A-97EF-64EE67402A1A.1;
	Thu, 10 Aug 2023 12:13:57 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8a7f1e51fe79.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 10 Aug 2023 12:13:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8gyZF5MFD8IHz1H73euh3JJ/WtjwkHNPyKg+DCJBLb9DJ+JT8zucBYKSGdj4DY+fALfw7YtKWNY4V1nBmZDZD/1nm4YpCl2X4Dm7c/J/9NLab4dEEJVt58vahgsbC5u3/TZlUsHdtxB6J40GzjnaycWPz5jtOLl73renK4yAibLADm5Sr8wLWkcdV0McIiH8w1jZb2imihnhhSfx87LevHdMckxMir1JNL2Ajukn6OX4sIFZnUlTwP2jVdRJscyEWsIFTflf/r/1n/qWav8ycye5OnSxS3G0uW2i+8nYgLelUXzKq/TRIv2sI0npyexL7aOOwKV3UgB54YNEkT/VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgIygvmr53YkP7txQ3axGvPvwUcGh9KlKB9jgLSpzJc=;
 b=DyHAXihxqjPPPEyeEzHnNItibt7DBvL/EEAZsxLmjpIuhgHT747905tRycljzVZ30rTxjMuUU+MSTRPPw3APzwyshnEG9bMYaF9IAMKZ6uIBs/ssM4+yVXET6aPETGUyXKQxLZAF8MvcHRM7TDi8hWIzpZpnGbLmnA8LSprbuX3CY4g3AOSdE+Jyi/wh9glSCspDhS4+d0HUxUch25W+sgZ7no/Ds0aoNNNPtP8us0/t/p/rHyQ0x/2wdplDBw4zroYSuqDkVDs3sS5SGlMVWvI/zYF4EUXzv2tPKKS3Z/Hencv9C2iOtWo/WdK+JnxerySrw+dRgvbIiL4SaUEJdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgIygvmr53YkP7txQ3axGvPvwUcGh9KlKB9jgLSpzJc=;
 b=0zf1T0DZvw/YXRLoejNarWJRpLiQcnX+3FeEhu1iQOIDg33ItiPIW81gOCwB1fbdCHU0BYbojlUGwo4JQTHbtjmqq578KxCUtdm/4hm/2SOGP3AFvfs1v+tJO/RSuUzb2OFsYpISyEiQ7LM3Rk8tCot7HzcwpMbps6mcUxoXEIU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6375.eurprd08.prod.outlook.com (2603:10a6:20b:31b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.30; Thu, 10 Aug
 2023 12:13:52 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6652.029; Thu, 10 Aug 2023
 12:13:52 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>
CC: Luca Bocassi <luca.boccassi@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
Subject: Re: [OE-core] [PATCH v2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
Thread-Topic: [OE-core] [PATCH v2] systemd: add usrmerge to
 REQUIRED_DISTRO_FEATURES
Thread-Index: AQHZx+TZGkzrIm2vrEKB+3S6K3YeB6/jcdIAgAAGl4A=
Date: Thu, 10 Aug 2023 12:13:51 +0000
Message-ID: <EB7142F9-143A-4759-8E60-88E341AA5D3C@arm.com>
References: <20230805110643.2708376-1-luca.boccassi@gmail.com>
 <20230805213551.2737605-1-luca.boccassi@gmail.com>
 <2023081011500664548dca@mail.local>
In-Reply-To: <2023081011500664548dca@mail.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6375:EE_|DBAEUR03FT018:EE_|PA4PR08MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: ed98df8e-642f-4deb-222e-08db999b4a14
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 llcbo3gfEyNsrd4qBUzmdnO9mkKTG+8kIbWk2r0IcLgjl66hzWS/DO1T6AhuR8rrA3uOy2IW0SjAOGnjgV99CGqoadkCAQL1eflHuaNZEs3Pw2L7UIEoKsfD7MX3RHvTfi4nHyGvMAB3K8YdCfEHJzgQcfhC37aBg404WbWhQJiSGucDDkyw+/EW3LnPkCFDpPI8KA8DmY5WZJkfs1aMh/URRnN5OsaDjdg6HeYYOyifxoBrJpW7Qa7kPHcysToP5fQiITs7Pj14yl5YwH/Kplt9C9908FJNQvqbEArp0z9NQpEkRacTjq4b53X9aNGsiAivqhzXYhyhFqCR3lRMHlWbZaq2uOhsRh+KEbt5pmwt7KhHK2wUBQCmBKid4JaJbwAyUJsdzhoByYo4Wja9XjzcEkdH1OMmr+dZtLxJR708og45nKRMpYAmgCjxeb+iqrwKJsvzdE1aMGCaTKWegYRuoEzJF5+/xhuxW3iDlBC2k3E1mHRSMq64Vnw04IxYxz7BrbAHKsfV/QPWaOhRk0+wOr90ZifaWDeuOOr9Sfi3VygjUQ3jVnL1VUGxYhRbkLNtpf9AhlB/VPIvB1nfQ+qEnoJ7/3W92/AnD/4L2e5ACDhPbONKc8qieHE2PbThyealx7yPm3JLXPcNjZkk+w==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(366004)(376002)(186006)(451199021)(1800799006)(8936002)(8676002)(64756008)(66446008)(316002)(41300700001)(66946007)(4326008)(91956017)(76116006)(6916009)(86362001)(36756003)(33656002)(5660300002)(38070700005)(66476007)(66556008)(2906002)(6486002)(71200400001)(966005)(6512007)(53546011)(26005)(122000001)(478600001)(6506007)(54906003)(38100700002)(83380400001)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E65F0489B85DFD4E81E0FAF30FD599B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6375
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a4a98099-5496-4664-73e9-08db999b42a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d7va8+su5uuYPvhiySXQJ0dTVc1j3edUQ9PK1zzH6qS6ptibxaryEYfRb2ylZGUGqAuzaI0LXrRuILnk4/okCglqRY1yBYsNRMCuqWKGXOw5SsTn5yBA3SD8WAxV4Rvk+pISru1cgth2yPYlVVDTSOs2XZ5Pb3M/4a9CWz764crTd7Wsi1jSQDNKtTPq1gyFNLWkSB14W4P/TGhwV9SU3spAM3Q0zOwnRuxfx49quZnk9bmJi9384nvqHHXqrrHlrfrtHyNmibV+MK48Cbo/wT2mwppfxaZEL0aCqmR1EVDdZI9RduktEsH3ZchdwGcEZnAUtJg+26QokdHJU4N1UbG14IAGXpl9vVzvMxfmjJBH2H4dTm0cluf5rLhcRTS3D4BAHHwuP2HmUl+LqvcGq0ZYCO+NhWYG3Gl78Fq8t++zjqL9TPetr9j18lfK0ywlysNHQzVOruGnldM5D7Wb+4IIZ4yVcO6ZfPUQASPoEyZC3a+c9jtvab4vvM/B4zHeN2ISfZpNCOWnrdWliJgLvc6WEY2XTqIt0ORqbcUBLjxHd5FgC6v2RD2bozT2v8blH5UYAL2ncLirXPiOeOKm6ilnNEy4ilb+4Vmjk5xZuyQ8qjiyUV+lCRdaU9dmJQ88aqo0f4y2TKLvgNqyJB4ilmItsth/xXpJ5QK9kGL/oNSduDDUrqoaaI6uzxu2DdQCOQstkFhhgEVtzRRbeoHW0eESpEGlXjIuSbat4Qn9fnI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(346002)(39860400002)(82310400008)(1800799006)(451199021)(186006)(40470700004)(36840700001)(46966006)(86362001)(26005)(6506007)(336012)(33656002)(356005)(966005)(6512007)(81166007)(107886003)(6486002)(82740400003)(36756003)(2906002)(478600001)(2616005)(5660300002)(8936002)(6862004)(36860700001)(54906003)(47076005)(83380400001)(8676002)(70586007)(70206006)(40460700003)(4326008)(40480700001)(316002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2023 12:14:04.4714
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed98df8e-642f-4deb-222e-08db999b4a14
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7618
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 12:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185739

On 10 Aug 2023, at 12:50, Alexandre Belloni via lists.openembedded.org <ale=
xandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>=20
> Hello,
>=20
> This breaks most of the tests on the autobuilders, I guess you will have
> to also update the distribution configuration.
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3326/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5581/st=
eps/14/logs/stdio
>=20
> ERROR: Nothing PROVIDES 'udev' (but /home/pokybuild/yocto-worker/oe-selft=
est-centos/build/meta/recipes-graphics/wayland/weston_12.0.1.bb DEPENDS on =
or otherwise requires it)
> systemd PROVIDES udev but was skipped: missing required distro feature 'u=
srmerge' (not in DISTRO_FEATURES)
> eudev PROVIDES udev but was skipped: conflicting distro feature 'systemd'=
 (in DISTRO_FEATURES)
> ERROR: Nothing PROVIDES 'systemd' (but /home/pokybuild/yocto-worker/oe-se=
lftest-centos/build/meta/recipes-graphics/wayland/weston_12.0.1.bb, /home/p=
okybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-core/psplash/ps=
plash_git.bb, /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/re=
cipes-core/dbus/dbus_1.14.8.bb, /home/pokybuild/yocto-worker/oe-selftest-ce=
ntos/build/meta/recipes-core/seatd/seatd_0.7.0.bb DEPENDS on or otherwise r=
equires it)
> systemd was skipped: missing required distro feature 'usrmerge' (not in D=
ISTRO_FEATURES)
> ERROR: Nothing RPROVIDES 'systemd' (but /home/pokybuild/yocto-worker/oe-s=
elftest-centos/build/meta/recipes-core/packagegroups/packagegroup-core-boot=
.bb RDEPENDS on or otherwise requires it)
> systemd was skipped: missing required distro feature 'usrmerge' (not in D=
ISTRO_FEATURES)

The poky-altcfg distro uses usrmerge, so the challenge will be adapting the=
 QA so that all of the tests that involve systemd are using poky-altcfg.

Ross=

