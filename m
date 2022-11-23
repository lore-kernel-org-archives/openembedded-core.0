Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FB0C433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 10:07:03 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.44])
 by mx.groups.io with SMTP id smtpd.web10.16680.1669198013616354475
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 02:06:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=CNL1wQeU;
 spf=pass (domain: arm.com, ip: 40.107.6.44, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7DzHz0ugABjnMOLorCt7SoATnAkhnQNEaFs88qYE1k=;
 b=CNL1wQeUXDk9uLfh+K15SVDap35LpLSknOuGrBvPAAliIUOOCchp2v+u2lyM8kDMr3m5/2m/s8l7BUDURy+heTiC0ba0js8KhgMiwatihb9k9Bc62PVoqNQ6AZ4ZtK5JqGth9xuKt2oCkjTIwwYkZAvOxDO0G72kQx9y99wdvgs=
Received: from DB8PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:110::14)
 by PR3PR08MB5563.eurprd08.prod.outlook.com (2603:10a6:102:89::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 10:06:50 +0000
Received: from DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::6e) by DB8PR04CA0004.outlook.office365.com
 (2603:10a6:10:110::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9 via Frontend
 Transport; Wed, 23 Nov 2022 10:06:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT062.mail.protection.outlook.com (100.127.142.64) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.18 via Frontend Transport; Wed, 23 Nov 2022 10:06:48 +0000
Received: ("Tessian outbound 0800d254cb3b:v130"); Wed, 23 Nov 2022 10:06:48 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d3f2d78eff910ec8
X-CR-MTA-TID: 64aa7808
Received: from b6fcc2a4e34f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 535FEF04-95D7-4828-A5FD-A65E692F9F54.1;
	Wed, 23 Nov 2022 10:06:40 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6fcc2a4e34f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 23 Nov 2022 10:06:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/Oqvsnr5ZQwiYxZ1i8Buq0JAdTv4VIrdCpFUQTEb6IoU5JhpB1KHnnpBAqr0W58m9FXex/eYDT/gpRPyJiOW0o/gxT7PaMMhiQPhNtQc8oPoRNcPik0b6UxbaVdMLtMOPFgf+GV8//Y6IXo15RLGDFRDz+EoRZ6ECSZrTtO0Z0EI01/AtK+DtKyQYlRXaC57TtdEZgAUWaX0Y5YAI1EiBtosF2Uj9gfAaB9WtQyHWltRLBCi1w5kmjN4atSUw9SlUGEVH+nHW6fkGQSojBaym2BSvdaruscuVRoV674KTFhdiywTvsap7U3cCz+VwMOnwlAz0Q7RidcUTGtRgu32g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7DzHz0ugABjnMOLorCt7SoATnAkhnQNEaFs88qYE1k=;
 b=XaUsVPspGe4sKO1TamQDW/HpsyfMzgIgDG8jQZN4uyZBeLpD3KxKxAE6BTuMaJ2vVek/79jiYAZBzGLGO7oVei1w65g6YOti09uWVhON6fvJtUqaWWs1tSdp01koylmkGg3oYgf3bYeYEeiazIuA4RGcODHG/Vz+s3wxpfQsubfo5zeVzhp/m7oe3oE3Cm0ZDSapCfg0DOQCV3Zu3Cil58t3+omW6OFDHYEVUVfTkkb3sevRd4sHNYITWJCB/sU8UKPecgDopVm4YhovsRi2dYbU0Fb+POrwHuqsJHvvcQDEAq5qJR8WmXBHBB+G+7nCPB7A4bwwh+aI1Zw7YWKz0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7DzHz0ugABjnMOLorCt7SoATnAkhnQNEaFs88qYE1k=;
 b=CNL1wQeUXDk9uLfh+K15SVDap35LpLSknOuGrBvPAAliIUOOCchp2v+u2lyM8kDMr3m5/2m/s8l7BUDURy+heTiC0ba0js8KhgMiwatihb9k9Bc62PVoqNQ6AZ4ZtK5JqGth9xuKt2oCkjTIwwYkZAvOxDO0G72kQx9y99wdvgs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6482.eurprd08.prod.outlook.com (2603:10a6:20b:367::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Wed, 23 Nov
 2022 10:06:39 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%7]) with mapi id 15.20.5857.013; Wed, 23 Nov 2022
 10:06:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>, Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Topic: [oe-core][PATCH] python3: add ${bindir}/python symlink
Thread-Index: 
 AQHY/Qj3NOSdoWEgPkKI+DKTOAmX9q5IcnWAgAAK0oCAAQE0gIAAKmwGgAC2yoCAANl2AIAABl6AgAAC0oCAAAUWgIABBQGA
Date: Wed, 23 Nov 2022 10:06:38 +0000
Message-ID: <291C9C48-3DD6-4237-9018-C49CECBA83BB@arm.com>
References: <20221120175237.194899-1-f_l_k@t-online.de>
 <CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
 <CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
 <CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
 <1729A925BA1D06C8.25787@lists.openembedded.org>
 <CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
 <HRFQLR.NFABK2KMZ9XR2@t-online.de>
 <4BF25A91-3F02-49A2-A546-A9CF7881E0ED@arm.com>
 <CANNYZj9uxKov0vrox7N3kv-HdQJ9VDbLu7Jsn_SuVUTz_Nbrzw@mail.gmail.com>
 <d945c2d89848932cd437ab8ae0a4f41a6f76ef19.camel@linuxfoundation.org>
 <CANNYZj9ukvo3YE5Aj+cCPUR-ut6ZCKyNK77TRk_bytsV2ArgwA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9ukvo3YE5Aj+cCPUR-ut6ZCKyNK77TRk_bytsV2ArgwA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB6482:EE_|DBAEUR03FT062:EE_|PR3PR08MB5563:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9fe75e-cd9a-4d22-fb7a-08dacd3a6f2a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 4+tKWYOzX5gEVJqFzgHzbyXnYZP9r4aeJ7VrInjeAz3kL1GxfZDiKU72E+kaJTWRJLoqQohKzq2QYXDgfurs8k8MI9ZEfpc2DkTT+syYBnahf0JAF+toqPygDnRKYtXv5TKs3Tqr3jEIREE43R8Tx7hWdyUTSTtP9YE9SaYpvBzwhfEdqyRIQzhS22LpC8pbZI631UXlOXE3A8tBE3UyD+s6Ka5McO5s24qBTXoDXWh9g+Wx+FybWC5G6BZk5OMJfGWJutMaLFB6c7tEQ1nmsxhVG4rUCIkEVSZkIe5XD27X/CcPdT2Jmdz4GRwaDsp1XGkxUtWtPVzuApwQ88PHMSLVS3zTakuQk1nsQLPZUo84a+zxqN6+ATR2qIzkZIvOuiZyqSBf2BALFRMLNUWxFgzZi0OgFUYXvIlEYtdwRSL/sgKWGN62c8UZBtC7itppz1sY1EMmEcxiWKDzrLfZ2BXSZaw1j9GEUWHiq73H+8W3kyphkK45sb5Y2EulHWomfJFCmKM6Ein3cIVNm0vVRBVmzat5oqLfFYPFUyOAiRmYslyzSngRbdapLIUmmnmd0H/CQIdxGW27Fm5BKCeMq/BAks+6As1h2L4TO40GQpIYbXgI/O+4zqdLU6+OUhBoRUjm4UVBS1XSvR2ikXJZ8Mvl+OF968+4CeTHsP+N5WjwuodSJckDDFVfJTGm4e/uoC4/SACEc/zWP4jIfChLf/bAogRGXn438qC5IJAawnBYAym2t6vMVugHEiAGmwxi2I6ohNXfkZjvi/cC65rtjw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199015)(122000001)(66476007)(86362001)(91956017)(41300700001)(38070700005)(2906002)(4744005)(38100700002)(478600001)(8936002)(6916009)(6512007)(6506007)(5660300002)(53546011)(2616005)(6486002)(76116006)(4326008)(186003)(66556008)(8676002)(66446008)(66946007)(316002)(71200400001)(54906003)(64756008)(36756003)(33656002)(45980500001)(228453006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <10FFD4E472518B45BA3DBB7B95074FE1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6482
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b6d435d3-da21-486b-7822-08dacd3a6972
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zF9tPoulDv/ynun8+QdSGLDdHMFqCdgluoGTBcPyfd7OhMYrxTOPtRGaXEFLCuHRzVPGz6sbXhjUClf2/rcAu7sSRxio5hNAHcYdTIxJlKT/zvZJXCeCDjeSz2puSvhhCAbxnobYc08JbG8bF0iukSh0ITak4yUlTHtttw6y3YE/5SkxC+Hnrd4m+tn5nC68ayvWQpfMDdRVHlQQLC9ivK2Hz/+ftbUXjateUDFEdqc8QIrltdNTezgWKMP2GM5q9EoCiJ6A+sEZ0WJ0/8K8z+lL4cRERJACJf5pMB0VKhJErdWkD7Iohw1RuKrtvU2KRp98rOYsjxeGZAjgsLepB411Vzgy1AQfme0erZeHIbKgEBuPtokvF4fomouEYVjvijz46IGshZPm6QESqCD7eMVoTc+p1HguIs+XkuAFjJ7nB1LJquLJ5QqzmNg0xnyVpP+QYLfHeIQQlG8DOOFKZ66HTux4ugYlnOcvAS1qFj5MlYEuXhhGz/NrwIUvlLresh8UAFTAk1XFWZfNz12xM7qAfn7UP+Cxuj9oOdSZBFlOarr06Cf6Qn+Y6pFu8wNZtqyIA+j7X3y5XomT+P5bpQJrMXOufh6cnJxc6UtNhmEedJvm6dOjqFD50ial7+Umj1niqGhJBlcgL77vDrvTKcvMU6BopMf43zHVHYqLXdLcaQeofs/6g94ZIDmAukNdvvNSjCn0lLhXSoYVn7Ccr74sIiqKjH76Rh817IpkjjA=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199015)(40470700004)(36840700001)(46966006)(33656002)(36756003)(86362001)(40480700001)(36860700001)(4326008)(70586007)(82740400003)(70206006)(81166007)(8676002)(356005)(40460700003)(316002)(41300700001)(82310400005)(47076005)(6486002)(54906003)(478600001)(4744005)(5660300002)(6862004)(8936002)(6506007)(2616005)(336012)(6512007)(26005)(53546011)(2906002)(186003)(228453006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 10:06:48.3075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9fe75e-cd9a-4d22-fb7a-08dacd3a6f2a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5563
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 10:07:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173711

On 22 Nov 2022, at 18:32, Alexander Kanavin via lists.openembedded.org <ale=
x.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> While this might be 'too soon' to conclude that python2 is truly dead,
> maybe a year (or two, or three) from now it won't be. Fedora has
> already made the switch, Debian will follow, and honestly, I just
> can't muster any sympathy for python2 users anymore. You can't push
> back paying off technical debt forever and expect others to
> accommodate you.

I absolutely agree with you here, which is why the one true binary should b=
e /usr/bin/python3.

Ross=

