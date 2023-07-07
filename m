Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 188ACEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 10:10:59 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.57])
 by mx.groups.io with SMTP id smtpd.web10.9105.1688724656721538004
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 03:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=oDJDUZoe;
 spf=pass (domain: arm.com, ip: 40.107.241.57, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzR8XU43xgTHlRtsihmk0gs3++vzQR91cThaKzYPSj4=;
 b=oDJDUZoeSJDorJESMnPaiXfyRkM+GRHO4Ijs5xxctygBFkA3AW9dEAQMaybhhzEd4yAdJ+8kgvW4lPIx/LhLTMf6fw/h5+dFvv3vTjtOPWdq1zw8mRrh/9mVLIa7OjUB5ktJy7MfUJ12VqdNBKF5A5ltOcKwLkdkhKpmNS9rFbY=
Received: from DU2PR04CA0272.eurprd04.prod.outlook.com (2603:10a6:10:28c::7)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 10:10:50 +0000
Received: from DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::18) by DU2PR04CA0272.outlook.office365.com
 (2603:10a6:10:28c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25 via Frontend
 Transport; Fri, 7 Jul 2023 10:10:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT063.mail.protection.outlook.com (100.127.142.255) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.13 via Frontend Transport; Fri, 7 Jul 2023 10:10:49 +0000
Received: ("Tessian outbound 997ae1cc9f47:v145"); Fri, 07 Jul 2023 10:10:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 31f48b5282aa2c1f
X-CR-MTA-TID: 64aa7808
Received: from b3ce2596c7d1.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id AA15913E-16A6-47D7-9899-B0B54A5D9FD9.1;
	Fri, 07 Jul 2023 10:10:42 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3ce2596c7d1.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Jul 2023 10:10:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUdY1BTBURgyt0cxyN0QwpDd+ttCfBveoHrtUgTAGIAO4Dm2UQ8YMF/MLnDD2fqJyliXDoOPg4JRc7AFmWeMtqmv+9VXEJmtDl8mJznmHp7b8J68ime5G0JpKUfy3dECKnmGkt+MNIaDohQ4AaS9oxSzrIk/K6c64jA0uVLLS4NCxTkHaqzzATFsX70sJiqWjCZ6Icl5AEi7ztAkJj8TDG3Up49JXGgYY+ZD2MiKYBOoKCbuxMZosORCmzBz2iA1mmIDs6HrodD6/NZi61kr1eCibb0NR91FT2gyXvFrKp1NVrDRnrXQ1GBw/TYxzZA8qX3lTYsim66qxEXmEBedHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzR8XU43xgTHlRtsihmk0gs3++vzQR91cThaKzYPSj4=;
 b=AADeX4d+OX0YPUIOqDfzuWjh71Mm9lYXktdCCjpq/LvZ26cx8uviUZ/M5u+57dMGcyoh+hSJy/pNyRncx7ciZLBKwZ6uuSE82Is2CAGkNxEK+gL56jTkRhV2jhkX3UtvZMrf1l5sKylaFUDUTJ6hqKjL9lGckn8O993HiBllyotDqTOsHyYtTmcnedDPBpg8gzjVVUO5RGLRjMMSYJfWsqhGebr52XZsrBPPuTjriVt6P8iW4azDpVPl4HO8e95ou0nuw1Uzc4lPpjEB8l+K1JRREmK2IbXHsYhGODTHemCnkOAo05BHKtm8wjvnubqKTUBNj/LLVeSeMEr5bGJJ3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzR8XU43xgTHlRtsihmk0gs3++vzQR91cThaKzYPSj4=;
 b=oDJDUZoeSJDorJESMnPaiXfyRkM+GRHO4Ijs5xxctygBFkA3AW9dEAQMaybhhzEd4yAdJ+8kgvW4lPIx/LhLTMf6fw/h5+dFvv3vTjtOPWdq1zw8mRrh/9mVLIa7OjUB5ktJy7MfUJ12VqdNBKF5A5ltOcKwLkdkhKpmNS9rFbY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBAPR08MB5670.eurprd08.prod.outlook.com (2603:10a6:10:1a6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 10:10:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 10:10:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Lincoln.Ramsay@digi.com" <Lincoln.Ramsay@digi.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta][PATCH] systemctl: allow instance names starting
 with numbers
Thread-Topic: [OE-core] [meta][PATCH] systemctl: allow instance names starting
 with numbers
Thread-Index: AQHZsGDFkafe/ODSKE+7pToaake+Y6+uFcGA
Date: Fri, 7 Jul 2023 10:10:39 +0000
Message-ID: <71CEDDCA-E03A-437E-AD39-C33C537E1D6F@arm.com>
References: <20230706232157.3602573-1-lincoln.ramsay@digi.com>
In-Reply-To: <20230706232157.3602573-1-lincoln.ramsay@digi.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBAPR08MB5670:EE_|DBAEUR03FT063:EE_|GV1PR08MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 060d48e8-ba8a-41e9-0aa6-08db7ed2705c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6vK65LKzsIE2Lx2NkjQVwPKlZ5bDGJyMqGATo9j/Ly1E6ZLlCujf4l0G5dLlEwTPxxftax3cGeGYBSBiMsJkzILBiZaSLHbLg/Xfe0FQpPno7vVQ6XS2ILOXTtgykASg7gmNXihrGdBcuYzhNPBIMuDnuNUdYZKgydmjfZKvhudTDNS9wVuZq4rulV47kmPQTTWw/wQM6Ve+WN3QfduKleETIIvdPp74o+zWaGvYROa8HwNDgMRZh65qKnkBykiMArH6Sm/ekjXMFTOYXKpir+XPxQ0jDRS/a7IpW6OMUIK133tNjUuHGihKo44vADDxlQYYgpVdsXCSGirtCy/1rLYwBMu5PKt9fKTKLIwsaS6tArm/BrGJpTGrhD69wJmmz6CD1iFm1z0OhQ/2e1Q0ayluu7tffuvz/M6EcAp6OWtcSZ2Nep47FwjU3fFz/18sgtiIg6x61rLte4Mg1O09TUadbVEXhmI87vg1QifaRWz7gwScohi/PStp1xR0WMcyKJ625tXXx8Hxz4mDNPufbswMdSlwar81bbv3YRsTQJy7Yz7xasi/ngaQt29g/+tJ6pDKn+H0gmSRVROVwC4Cod++Sj8PR+kLiZWiBa++h3lzl+d79gLowsIcrcwB9GOVXVTIqrgIwRUlO9+h1yxpEg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199021)(6486002)(6512007)(71200400001)(33656002)(186003)(6506007)(26005)(53546011)(36756003)(2616005)(38070700005)(86362001)(122000001)(38100700002)(5660300002)(91956017)(66946007)(76116006)(4744005)(41300700001)(8936002)(8676002)(6916009)(64756008)(66446008)(66476007)(66556008)(4326008)(2906002)(316002)(478600001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5490F336AB8830448F1E7CB1C8DF116A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5670
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e6b9eae0-ab11-4b55-b951-08db7ed26a8f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	N0Ol97tLzHUY5sgDqDoZcKrDxisMCAxoAl6B/bbllJwNO5vgzh6BO+dqt4TrQkZ18vYzFse46mrZ8h+7IgPCpDWqOBVle9Ke8SW+dyzsFx8555deFMRL30/U1xH32sttHxM2+a1dkKpby1Cw6WlchPA7z+gAFyTiiqGyoA1WMd+1k5hOj61Pi0ozhPCcgANW8bFlgEMWtvMHPErIbOsBmWS3UMlF0I0r0+50RM6k099UBOhFC0/HiVppSUB6KN7d12dSU7MX6JYq4bVQx0M3j8NGjzqrM+sDkw1gjUMHrrdkZd120zWZY9M3/E3CH3hY97afwnM67UIdJBkUxLcT05H6Q4ieo0CVrANuq02EPL1l7ng1i31sJnS5Xo3tWF7nCC9gmvTOiO9CMy6q4px3T1jMw2sm60JAF8ymYZb8UeeH64nhs8pb0ZVuUC8+fYtRuCmR7lDmD0AGl6XGqvxTXQyhcUSrIEuNelCb3yxG5KpED8PHgATUoUDMGls8gok/gtyvx0G2skhKd426BUzoOTQK05JKq3Uxujmp0Ywk+Rx5GJKvFK9ji12vGKxvLOKoR6YiTQvMpCUGl3TK4FYF3MBlaCHkF1vW1Puh9vhmy/nJvPrntrJpsWpDPnixbt+o+GBXI4LWpeFLAAuy7pf+FSKwtKIKRHXseOVgl83i9KfqWvhx414mwTHzOZRv8teuU5+sI69nyzpOPFoN8hTp4k0kFnUefQJK9o8Hjv6pb/hFoGvfL7u9ZKqPfGRXhJYm
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(46966006)(36840700001)(40470700004)(36756003)(86362001)(4744005)(33656002)(82310400005)(2906002)(5660300002)(40460700003)(40480700001)(6512007)(336012)(186003)(36860700001)(6506007)(53546011)(26005)(81166007)(82740400003)(6486002)(356005)(47076005)(70586007)(316002)(70206006)(6862004)(2616005)(4326008)(8676002)(478600001)(8936002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 10:10:49.6213
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 060d48e8-ba8a-41e9-0aa6-08db7ed2705c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7313
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 10:10:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184004

On 7 Jul 2023, at 00:21, Ramsay, Lincoln via lists.openembedded.org <Lincol=
n.Ramsay=3Ddigi.com@lists.openembedded.org> wrote:
> -                dependent =3D re.sub("([^%](%%)*)%i", "\\1{}".format(ins=
tance), dependent)
> +                dependent =3D re.sub("([^%](%%)*)%i", "\\g<1>{}".format(=
instance), dependent)

Interestingly, Yuta submitted the identical patch last week (queued for mas=
ter).

Ross


