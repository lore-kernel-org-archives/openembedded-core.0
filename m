Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F6DAC04AA5
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 12:20:39 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.73])
 by mx.groups.io with SMTP id smtpd.web10.23057.1661430029071883702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 05:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=Iok2Knt5;
 spf=pass (domain: arm.com, ip: 40.107.6.73, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SUwTL696G3htpDki5g6Xcl/6CsuuB7Rhe1vEoOSPY9lss4et2A9SMyaRWM71WHYX7vE9SNwDigJGdi1TrMkchPi2pEvxSUzCrzDmEDSOvm6CgJSE2oaNN/iGwk7ufv7dMaF3LuptPh8Vy2vd33KpJeKH0Sb6LkmJhiLdAq4rlPdpzUfuMf0sTXDiZdwNCQUcSdlSSoGAmQxRlxNPe4BPGGYO6v51FR81YoEnsCl5ODbzN8l553OEELbFlfTQpZL7mQsrA7rxodUdv9r5XGRngJcRlqojhxyJp6nXmiBo5Z4jqFoUrvwDaZP1yNWtk1Emhc/iOgJqw/w6iXmZUyVt7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwuGzpuOqeDbpsiCx/zGgvQxbdmNv+3x3ykfh//L2yo=;
 b=Hg/5+DN9oPpcNmJAeHuVkjRrVBtebEIWfcW7AdKevd9ymrYNvkoGuYBKWL9tysiRD0upbg+jYvAJAqzdkOKWFwt6A1B6IVNrv9KQottxaLLjcQFtHKQFCUfc4HELip2r9ttNLEaZOUWeTqNJ6iJEucfVlOOnx1VUArjAxHdvjZmEfar37r+ozyqdpbGPBGBZZ94lD65gfsQO/iRd7Qb3uKEnYHx9w265WpygmS7aTQN7jKwdaPa2m1AQLDC8BFRP70RJzwUynIfumOCB1txtVPgRD0Mmbrw6Gr3OEx+col33xhBa0U0nJ4Wz/mB8JGee89CG9KMuKcoq/AdNmqNxCg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwuGzpuOqeDbpsiCx/zGgvQxbdmNv+3x3ykfh//L2yo=;
 b=Iok2Knt5kLttzxScmkspZfNpugB5rzBFfXn+Q0hvnHLJgDq4Df5OZiepYMXBk6qykfQDaXRb6IM6IFbSFW7B/2YVNdlTiKHzS5BJr+7+/RgPO4L6Bdg8uYZnWPqS8IiwGNC4a7g71tlJuKC6Mow/IzAes5UNixoK/gyZLcSDFrk=
Received: from AM6P194CA0032.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::45)
 by AM6PR08MB4248.eurprd08.prod.outlook.com (2603:10a6:20b:b5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Thu, 25 Aug
 2022 12:20:25 +0000
Received: from AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::bc) by AM6P194CA0032.outlook.office365.com
 (2603:10a6:209:90::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15 via Frontend
 Transport; Thu, 25 Aug 2022 12:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT059.mail.protection.outlook.com (100.127.140.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5566.15 via Frontend Transport; Thu, 25 Aug 2022 12:20:24 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Thu, 25 Aug 2022 12:20:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: cced3382bf7d432c
X-CR-MTA-TID: 64aa7808
Received: from 4a73d6e13957.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 509FEE53-C24F-42FD-A811-A33C081B3735.1;
	Thu, 25 Aug 2022 12:20:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 4a73d6e13957.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 25 Aug 2022 12:20:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CODlKtl6W/AVb+6KqjKXz1xiK0uI1DXTMVA0FqVtNygqhfy+TD5+mA7X856BnhK2XRfb+qEoekP0/+QAdlBOeNGxCi0kP3Kz62tzFRiBnxZZY+zEGYtELI8EMvmotCwR56SVOT++xurWD+cPi8exNR1RwAfB5SFvfiGcFB+Jju5UoGQbYBdCxdcXwy7p3CN0+5dFznedjLvB5M4wEyd0W7Hxp+bEyHULuSEKcFqNIE0mzOH8ZjOFekJVtFupJnE0c/L2yi7ZixxWXKGFAQxunYeMFUwo+5s/l0cAT5PS2RWIIzYBeep6tOBmS6/0C+0Xczjyq1VV/PgwKe+gT3vNWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwuGzpuOqeDbpsiCx/zGgvQxbdmNv+3x3ykfh//L2yo=;
 b=mEjjxeIVl1fcLqWCBeKHHovICOuZEo2PQa7V59NfoCd/bndS2sfpjVRADOtlYCCbqP+K5tuTm5J/+QSGpL6HLzPMC+6lw6pahkhGzeI6iU5+Hc7peeOHDrdegal8qjkFoEJverYziY3lI2pP7qd8KSraqVaFqyA/MRCDi5Sd/pGcf/VPfioROhbwbuTTT4BYVsrWp5tKEbU5oBG87dVUN3bH/ml92fUhkYBqj7TMqC5ggzlnIpL6INafGvq1dSjrPITqj36FD+DaEX6o/OEUlIgyjVF9J/7BNF5krGxcTYtymFmTBkXgiVvBpoi9RcY168LrpMM6U5DAUaxcCTT1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CwuGzpuOqeDbpsiCx/zGgvQxbdmNv+3x3ykfh//L2yo=;
 b=Iok2Knt5kLttzxScmkspZfNpugB5rzBFfXn+Q0hvnHLJgDq4Df5OZiepYMXBk6qykfQDaXRb6IM6IFbSFW7B/2YVNdlTiKHzS5BJr+7+/RgPO4L6Bdg8uYZnWPqS8IiwGNC4a7g71tlJuKC6Mow/IzAes5UNixoK/gyZLcSDFrk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM6PR08MB4056.eurprd08.prod.outlook.com (2603:10a6:20b:ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Thu, 25 Aug
 2022 12:20:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::6cbd:62ea:4be4:aa4c%9]) with mapi id 15.20.5566.015; Thu, 25 Aug 2022
 12:20:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] wpa_supplicant automatic installation
Thread-Topic: [OE-core] wpa_supplicant automatic installation
Thread-Index: AQHYt4mWyCBW20dUIEqBlKL6crVToa2/ivYA
Date: Thu, 25 Aug 2022 12:20:11 +0000
Message-ID: <450071BC-9A09-40B4-B1EA-174EC3CC812B@arm.com>
References: <3WY3HR.RNOTS1HY3V0T@t-online.de>
In-Reply-To: <3WY3HR.RNOTS1HY3V0T@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: deec2dbd-c5b9-41b2-1e02-08da86942fc3
x-ms-traffictypediagnostic: 
	AM6PR08MB4056:EE_|AM7EUR03FT059:EE_|AM6PR08MB4248:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 mxpL4MPAqbjjSDb9lh+dkGHo+2LTI8JWukyCEd3sn7IDKsl61cWZqSupSuwqHdBYgK/6NUtT8VzEIE8+fMlYOBxHq9Zi3Lsl1zIPkYhOT/VkX8fbMDYmCDudkCZ4OD5ACp9C0sADjf0CGG4Q2eHfM/nMFxnmuXLLQBi2oxeqUbOKySL08bTD12Kro32tAYjutW+xA1WLO6XVYwmNDyFTYxKUaz6LpBI8pueeK6B5s/QIJ0pwL14SIygRev3dl0RZT5i5hU5Rw3sJS9R6EFBRRiRLkaKlKdTzsh8sw8zH+YHj/20Ta56F1+ou3wusT2fm589izH2ZB9n6myjzD6+OKIM0l0Ao9jPyjNjgXfVKE2Ldou48WqKTuC93U9JAGwu/LRNMY6zJyqu5K5hZnNdQUr1AJ4xn9WCTdfWR9jPHe/naxS7IclJketu/lQA0cdumRoWGRlgOS8O5kuUiCVEwwSHPAIi3AToBKpRXTd1d3i6zQbAOryjXvT9rbFRmmucTUcHnSzOmlXWXc4IvjaTPXWMVwwePRXTlLrU86sdQFjqQhSCjIkM9ZtmLpiLQeSCcmqap5t+LT7uw0MQvNKFpwQCA0tAmwTwBlsaNcSGnItAk0bpEgszfnOQLRsMDVnE8D9mSMpOo3VY+DKioyrKpQMFGQbpxx91lR53DZY00cwX4nKqFrNzHFa9a6znI6eM0C8QWbkE25kCCVW84Vayqb6WR+NLcOhMfnSqYCwLmQGOixVJDRQ2darNRz0mSLs19pQ2m4rrWvXdWFwlbjdnPcAx8F5jiwvW3lTAot6KA+0E=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(396003)(376002)(39860400002)(136003)(71200400001)(4744005)(41300700001)(91956017)(5660300002)(38100700002)(8936002)(122000001)(316002)(66476007)(6916009)(4326008)(8676002)(64756008)(478600001)(6486002)(76116006)(36756003)(66556008)(66946007)(66446008)(26005)(6512007)(2616005)(53546011)(2906002)(33656002)(6506007)(186003)(38070700005)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <83AB5E02B83D9748A0723C1878294F41@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4056
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c0c4940b-0a69-4540-30bd-08da8694281f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zPgK3K7XpPW/GJa8xD0Zak5PeR81DcwO1X+QCJROwGFS+Jx3Ddpq5kj6N3VSNI/FfWfgjGS2exuaXc0POfXfIGGclba/aId5LKFAG+AdKJfkdlSBzKYproFcYPGKW4RWMtSMt/N38rDpyGUW2zOzJh7ZM3ixb+BPMuunfS3vuXBRBBhpKEI8/LAT1uhsgXwpZnNi1F2+wPXHAIRyeAJ4lgKQLsCu0h2vbBW/CCD7B5ROD7w1iGoBUIj7OPc9vMZJbYUzn0Z5wnuhA7o3le8hyurmKj8Gj3EQUs+m+zUD2oi/T+fPPGV/LKVTFlaK3AdxfntJJPs3BJ872malH+1jppT5gMsYvgrOtp8ge39goy/NtxZbGZndlPhe9JitMKKKVA3EiHFxdV3dZveKdSG373fbxolf2m0suiQxDMKYxJpP4AHvQpIDe4YGPTnsjvqTXjCm8nFn7Ts3l6ISuYpuPdD2tcn8677u5agYNqMqNxinnHlOYXEFAd9aclMGPQkHby4eY47wvCpCbBS9bFRb7a2lQ9NLg70tLiHVfGZdv7lSTlq8T4qXJcCqYpXtjCVxg7O70RPBpWTV/2/By3Q+HRBN0X+jN8xwzCxugpHJQoadX0rpNs65qiCQLygWp3lRDB5ezcthSTOdeipKIjKh9FVamapKV9uFXwCDY6q1VVDaYuOlzq4v3a7OG1NgUoAXxLOfrCTBarVByVmq1DcS40QwqFLU99u0IxC16IocXbA5SeTuaRYDVE411yoSy87hebWDpHMzHHYD1m0waduhgg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(136003)(346002)(396003)(376002)(36840700001)(40470700004)(46966006)(356005)(81166007)(2906002)(6506007)(36756003)(186003)(336012)(316002)(82740400003)(82310400005)(36860700001)(6862004)(6512007)(8936002)(33656002)(6486002)(41300700001)(478600001)(5660300002)(26005)(83380400001)(4326008)(70206006)(40460700003)(70586007)(8676002)(4744005)(40480700001)(2616005)(86362001)(53546011)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2022 12:20:24.0319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 deec2dbd-c5b9-41b2-1e02-08da86942fc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4248
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 12:20:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169858



> On 24 Aug 2022, at 08:16, Markus Volk via lists.openembedded.org <f_l_k=
=3Dt-online.de@lists.openembedded.org> wrote:
>=20
> Hi,
>=20
> one question regarding this part of packagegroup-base.bb:
>=20
> SUMMARY:packagegroup-base-wifi =3D "WiFi support"
> RDEPENDS:packagegroup-base-wifi =3D "\
>     iw \
>     wireless-regdb-static \
>     wpa-supplicant"
>=20
>=20
> wpa_supplicant gets installed on every system, that has DISTRO_FEATURE wi=
fi set, which gets problematic, once you want to replace it. Would it be co=
nceivable to remove wpa_supplicant from RDEPENDS:packagegroup-base-wifi and=
 instead hand over the responsibility for the wireless daemon to be used to=
 the recipes in particular the network managers ?
>=20
> Otherwise choice would be broken.

Sure.  At least it should be a recommends and then iwd/wpa_supplicant can c=
onflict with each other.

Ross=

