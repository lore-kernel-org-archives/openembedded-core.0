Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47FD4C001B0
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 16:59:53 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.41])
 by mx.groups.io with SMTP id smtpd.web11.38538.1688403585071282336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 09:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=dXPTatgT;
 spf=pass (domain: arm.com, ip: 40.107.21.41, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm1d/dKZzyWLLp67PP3O+ZTaZTiYbDkp7bqJj3o5bIM=;
 b=dXPTatgT1WCIXOW541DYVUXsM8Z35UjAs+V1KZIsS0bgxVyDEvnafdCzE0B1SnR/djyNCGR+2laHbvaAe7J79+jne/uz9Sa3K7S5GaQiMdPrlvuuj4JGgPRfUxFoLM3bxanzZ+CqkN1HWo5EtvbDlqOUv+rZz4tFAjkJg0JIrBI=
Received: from AM0PR01CA0078.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::19) by DBAPR08MB5608.eurprd08.prod.outlook.com
 (2603:10a6:10:1a5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 16:59:40 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:10e:cafe::1c) by AM0PR01CA0078.outlook.office365.com
 (2603:10a6:208:10e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.26 via Frontend
 Transport; Mon, 3 Jul 2023 16:59:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6565.18 via Frontend Transport; Mon, 3 Jul 2023 16:59:40 +0000
Received: ("Tessian outbound e2424c13b707:v142"); Mon, 03 Jul 2023 16:59:39 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 91c62581d2478ed9
X-CR-MTA-TID: 64aa7808
Received: from d202b2b72913.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A527F41D-8028-40C4-88FD-DE8188F8F97A.1;
	Mon, 03 Jul 2023 16:59:32 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d202b2b72913.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 03 Jul 2023 16:59:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f29Pp+CHx+tTaliQvytphOK7kvi2xn7kR5OBoJe5mcpZFsTVlnp9VWznMR0E4YQqJtosNE4qNH5uGIabP58c3YETigw6E4Ele0ycyTYrWxpSqSGRzRc5h2WZwRPmXjVo+N973l+QltdxXFDF21ZxCEfPKFKItjA7Kw5fotvLglvIeiGH161AKZVP6LoZU0jeYy31dbOqi+8YDfLeDtp3ZBzAraG6YfmPHDKHxKFBVZ66W5gWV6Zc0h2tGcF1S3bCBI31ko7qaEX7wloHq3LLW70Dihecutr1hHlHHiCW8EQae7FDB38rvWN26dYS40SOk6Rl4yypHhkXCTW3w24bBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm1d/dKZzyWLLp67PP3O+ZTaZTiYbDkp7bqJj3o5bIM=;
 b=iPIyIdEic1mvYPdHVgI9S8E+7pcX8ygM0pIeRTqK7Qy09RoxKezc7Z5GVH+wsmtGlS9pSUpu24fKL42/LlV225S7JHs8efoXJs+XpKAOKkMnWhMvsDqyO2mkN2eSYHPtxIGiMFzt3i3/q+7wiufJHhyvWyAmpcQ1nVlw+lN9KDB0KseoCOC6JTfN+rH31NCFFlJCzTEW8R10+9jre1rwSwD/Dv8cKPB6kL5N/seBJkumgwZvUv85I6BjuP0P2L5XsUgKRzIkrNSgRIZKTWEsoK3OPXfZqn871LeKGJIVXTwHurBFPHID/DCG/l3tyX6ekWOc0Axa6sCdNFVbqdTiFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm1d/dKZzyWLLp67PP3O+ZTaZTiYbDkp7bqJj3o5bIM=;
 b=dXPTatgT1WCIXOW541DYVUXsM8Z35UjAs+V1KZIsS0bgxVyDEvnafdCzE0B1SnR/djyNCGR+2laHbvaAe7J79+jne/uz9Sa3K7S5GaQiMdPrlvuuj4JGgPRfUxFoLM3bxanzZ+CqkN1HWo5EtvbDlqOUv+rZz4tFAjkJg0JIrBI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB5886.eurprd08.prod.outlook.com (2603:10a6:102:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Mon, 3 Jul
 2023 16:59:30 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::30b4:3110:b02d:7f21%7]) with mapi id 15.20.6544.024; Mon, 3 Jul 2023
 16:59:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "sdoshi@mvista.com" <sdoshi@mvista.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] tiff: Security fix for CVE-2023-25434
 and CVE-2023-26965
Thread-Topic: [OE-core][master][PATCH] tiff: Security fix for CVE-2023-25434
 and CVE-2023-26965
Thread-Index: AQHZqA6dOPGIFAl3AUifXOY5xnCvR6+oT00A
Date: Mon, 3 Jul 2023 16:59:30 +0000
Message-ID: <9314F9CC-FB13-4EE2-977F-2934B8DA991D@arm.com>
References: <20230626091307.78539-1-sdoshi@mvista.com>
In-Reply-To: <20230626091307.78539-1-sdoshi@mvista.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB5886:EE_|AM7EUR03FT005:EE_|DBAPR08MB5608:EE_
X-MS-Office365-Filtering-Correlation-Id: 20828efd-5d7e-46d0-bfd1-08db7be6e40e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4spE6VZ3reqZiaM2lvvlIBTDB7ZMBZtYc0pVVoRMX2YVqrCuXHoRDwFU5PCnoZe5dFtfVCdRRjM//G95bEccaxJH4/xgX5insFowdbtkVYcayVzCJDItMgxclhKUoXZwhyYgaTctctKMbDyqRLt/V+bfaPLFZRcPcK3mXe+Rjto6NB/dN/Zx/kRYUzvr7EQRxV/l8KnQPb5Pd/vV03mK99Gh5Fe3F9tyvFUa0H1ilRDxd/F84T3Y/nJdlOvj/Ka5Y12YownyUBxRqQ9Vfqu+HfJ9lhWQWuiFaZ6oUBJHWp4rxVu5iNkO068mQiw++ndlDWHfHRMebOwRc5Qx2o4BfBy0s3CHIaIpuo58n2NvtESNsuhLJzruji+B3BEKpHICKlePachqeg+okzFP64wLpc9TPWdD/SOE/dfguLK8pEXf2Wa8jMU5LVrBs6SSXWokUElhQL0Qz2q57JLUQClZ0On7c3ICwgy9zaEIhy4iUF7MRgmm4peerJUlEbf8ys6zbj/ytI1Kqov87LQB3PV+eN6wqvaH3pxtgc8ZQM2DBkUl7+Rdwmmd12kdC/EyZYm+TE+UXxo4ptWjwFLEFQdsXFZwx4mIsqAYu+zbOxcIyLwr2c+GGfn6HzhUIpeu9nBi5zgMUDr3dJAn/fmFoUDMekDWpfF4YV5hTDcIz4YAQVqhh15dm3gawqn2MpOYAF0F
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(366004)(396003)(376002)(451199021)(41300700001)(4744005)(6486002)(38100700002)(71200400001)(122000001)(83380400001)(2616005)(186003)(6506007)(53546011)(26005)(966005)(6512007)(38070700005)(86362001)(478600001)(316002)(2906002)(36756003)(66476007)(64756008)(66946007)(91956017)(4326008)(66556008)(76116006)(6916009)(8936002)(8676002)(33656002)(66446008)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C43A27946DDC564EAD89097A0C36C000@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5886
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b7900e9d-919f-49b2-44ed-08db7be6de46
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vifSn7be2/XBdVWHJPKokrn2LAS2Iai6iHUcmtfSTsZvP//Es2l3rJ76gZDEqDNURuVj+7vbuKRjzkLEgNzSumshK+JY90ror9NEd5chXGYK31gH0xg7+HzQF9Y9/4sXSoTRBTo53IS0gCzo8Haq1zJTjDnV0xWOb6zCJW/VtT8u6/qUfRzfQzA7zoIY1xBRvAKReJZpMZafORxQRTG7T7svkAK78qTYkFMfg7/9bBpJMCjt11dtXCBxSs3H+dINX4NX8cKA2/ysr3WZjtqeFI+oxZAsjPx675DSYwAxqPl96A5oTB07bOTYiFyrZrjFnYhVzxJls36aM+MSzs89Pa5/rPNbXZ+GvpliHoUe7QOl9DMnKOEw4p9SqI2zX46awn+PhQECZGjj/wxph2IT9txyFZXqaTai1Gb2afoiRRLtUXpIYm2r1vqJ6RmDUIJd1IlteW3t95nWs6YVoLfiCU3TziZAMdKnD4JSi96M3D4DW08vhF+XxgnZwUzcpGxdzZfRdbRksWCE3f+xQyVDriYRWLFTQSVHMA2zz628pU7HuSqrC2k6xxBWQfxHv6KZpG6LQSE29pRctoq7u4GY/tVuhasaJh/QM29Me4/1Njw3M0056jVxF7+46vJRC4y3XIJRRoeEqccOr4KrDW06Tft2LNa9NTgXcU4/OlMw1cLaHxoeoa6IjAZRbNFZA3SQG5743tMOoKS9ktwcSMflMOSVqd0+P8ewwZrg0HVCb9bQ+yrF3SloKYfze4VKusfkcQmCngZJiULYSD3Uzy5JCQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(36840700001)(40470700004)(46966006)(336012)(40460700003)(41300700001)(86362001)(4744005)(6486002)(82310400005)(2616005)(83380400001)(82740400003)(81166007)(356005)(26005)(186003)(53546011)(6506007)(47076005)(36860700001)(6512007)(966005)(40480700001)(478600001)(2906002)(316002)(36756003)(70206006)(70586007)(4326008)(8936002)(33656002)(8676002)(6862004)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2023 16:59:40.1298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20828efd-5d7e-46d0-bfd1-08db7be6e40e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5608
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 16:59:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183808

On 26 Jun 2023, at 10:13, Siddharth via lists.openembedded.org <sdoshi=3Dmv=
ista.com@lists.openembedded.org> wrote:
>=20
> Upstream-Status: Backport from [https://gitlab.com/libtiff/libtiff/-/comm=
it/69818e2f2d246e6631ac2a2da692c3706b849c38, https://gitlab.com/libtiff/lib=
tiff/-/commit/ec8ef90c1f573c9eb1f17d6a056aa0015f184acf]
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>

For master the easier fix is to just upgrade to 4.5.1 (which I sent earlier=
).  This is absolutely appropriate for langdale etc however.

Thanks,
Ross=

