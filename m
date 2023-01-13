Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760DEC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 12:53:55 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.48])
 by mx.groups.io with SMTP id smtpd.web11.85505.1673614432593730728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 04:53:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WMBtjQKE;
 spf=pass (domain: arm.com, ip: 40.107.15.48, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38LqjKEOABdA8c5ReGgOmWHHVNr9+yaslHGOtqV7CQE=;
 b=WMBtjQKEkQxlRRNM+0mMEHOfEQhw1IYey06RbWhQtbHDHVywqXag4C6q+rosNdDMSP7S53X8mR6NGMJIrXs+nXN6tRnkrroujYPkysjXQ9b5q7oGsLTlP1BbLQhKlvwq5EzFlJZUidLPzz6Gr1AwNToxEE56da6vU7BRfS7Z/Hg=
Received: from FR3P281CA0179.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a0::16)
 by AS8PR08MB8733.eurprd08.prod.outlook.com (2603:10a6:20b:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 12:53:48 +0000
Received: from VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a0:cafe::39) by FR3P281CA0179.outlook.office365.com
 (2603:10a6:d10:a0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.6 via Frontend
 Transport; Fri, 13 Jan 2023 12:53:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT041.mail.protection.outlook.com (100.127.145.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Fri, 13 Jan 2023 12:53:47 +0000
Received: ("Tessian outbound b1d3ffe56e73:v132"); Fri, 13 Jan 2023 12:53:47 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 44283df9d13bedd7
X-CR-MTA-TID: 64aa7808
Received: from abb974a2d817.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5B164513-C357-4F65-BFDB-9F611BABDD09.1;
	Fri, 13 Jan 2023 12:53:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abb974a2d817.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 13 Jan 2023 12:53:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FqM7Shj01d+YNBNeig0L4V4vat6H4BO6CmhdXIQ1IWkAHiSGoF9GwgyPJllRO2fKjAW6PhWiewQMzQaVh7dEYcfA8tB+Mx12+MZYSSpuB21Wefl4mQ3gS+qclGD5L8qa7ZsSKoOptvFamp2RHRw6EREhrEwe0clyUgFvGqIBmbu+AW7SmNtWwAOfdDNujDS16f9T0cZ53hUhnzgxg7xshMakn7bSSwaiHttNXf34jFOhSZ9y2QCGNZbk86WDBO6mieuZ7fQebM5aL6BC+sgdX0v5Al5ywiQKsVfA8Zh5o1YkOSMEa78eQdFC/zO+ymCwxa/Dz3/yti7qk566GdMegg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38LqjKEOABdA8c5ReGgOmWHHVNr9+yaslHGOtqV7CQE=;
 b=CcMtr7mhVGXZleYHnp3JgYVwoWxWklEo0KENNyfRF0o1hHpgj5HwI45CwsmucIVsSHoza31c5BULfZWwYcmddTv6ob5504IOGPG+OH78jyMU5TZHTmqLCVTnJFOQ3ai4Op/o0T9PvPcUWp8EgM5mxEJvwvq29szf7SnUpTvkHS1324P+VcEdiv3d397KmlYFVN02EWgKqk3vdcDoG1qD//GRhIcg/mpFZEzu2fk4l1uCIUU0aksVaqjGpdQIBYDO0N0/mLusrZ08ChjYXQRovMR0bModuW0v1VQe2DiYV1wf+TIvlvkfp2nx88kxYsKwKnxC9/Ly7vMvAOXHCpQw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38LqjKEOABdA8c5ReGgOmWHHVNr9+yaslHGOtqV7CQE=;
 b=WMBtjQKEkQxlRRNM+0mMEHOfEQhw1IYey06RbWhQtbHDHVywqXag4C6q+rosNdDMSP7S53X8mR6NGMJIrXs+nXN6tRnkrroujYPkysjXQ9b5q7oGsLTlP1BbLQhKlvwq5EzFlJZUidLPzz6Gr1AwNToxEE56da6vU7BRfS7Z/Hg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB5925.eurprd08.prod.outlook.com (2603:10a6:20b:23d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 12:53:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::2d3c:c53c:86ba:a3b0%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 12:53:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "s.zhmylev@yadro.com" <s.zhmylev@yadro.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Topic: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Index: 
 AQHZJs2Hr01kt1DJD0u5WHlFtKr37q6bXdkAgAClpoCAAAKwAIAACx6AgAAKA4CAAALNgIAAKamAgAAGtIA=
Date: Fri, 13 Jan 2023 12:53:38 +0000
Message-ID: <B94C4C10-689A-4105-93A1-0DC0EBA92161@arm.com>
References: <20230112213301.11768-1-s.zhmylev@yadro.com>
 <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
 <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
 <ea059c6fd86267376a501008384d57dd9c7f96fa.camel@linuxfoundation.org>
 <CANNYZj-P38yonASaKJFq_r+KvKvX6wj_7j7O=NFR3=SeUt-38Q@mail.gmail.com>
 <2ef83acb208a3e7222b699a6ecf894b184f87444.camel@yadro.com>
In-Reply-To: <2ef83acb208a3e7222b699a6ecf894b184f87444.camel@yadro.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.300.101.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB5925:EE_|VI1EUR03FT041:EE_|AS8PR08MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: 41b3285f-ca97-421a-238c-08daf5653663
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 vEOA533QCv9OanjfhQSGhkG/QiiSfw7O4M5rf38Ug9UFmM2CctPnH0P+T7MWYC7lFufdyd7EDPgfMStuhmnP568aHJwJvlzqNcYHrJ5Af8HlaJiizJTQF0EgRjjWzOokOmPqFZFuRuh6+utql1e+4iixPbmMZOI3qjOR2Hcz0NPK+fxbvxNFUQAgoSTm8ACAoLJ7FbQ1FthyLQDQWjy0vGMhwisOJwbWPlfnLqSgI76y+zdK15Xjx8EUO9nwqroHnQ6SDTXQUwj7/LSsOwR3BWxWvHw9j+QL3iKV01RVdc+pxAoDckGmEUvKOB96Zo1Z5Z/zBmw2RLCUP4iDtwVhbWCYUO1W+tpSq/YdJ3uzrGK+moAvG3OIROLGogJdfp7NMfvMxGPbp2XuzneZXTAOFOc4m5jfI27wM7f7WfHnYEjbmU8D4HqXEQkAAb3BLs4TUVDG38JwnAKuJUhfDr8myD6oWKj6NKY76nWU0VG0V5AR9pW8ym3XcJHoFrtUd8D1u9d4lVDqMwiBWgkMHrB6OLW+qBj/6V4B7PTineJ8q3XvTL/xJR7sX7VF8XSJrsbEhzaoHHF5Lh6RAAgAza5cQWodwqNzE5oQ1GoFIbF4Oar1HBQAgT1bhSNn6QAvINiREMFAujSZ37eHyymsk82I/k8yZN74XWt4hjWm97jxCex2vKmDUtpdtiPXueeHtEMlsPeafqDzlSs4TLOzTQMuZB0T9IxOAVkWfmJ8IvmTLlM=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(396003)(136003)(39860400002)(451199015)(6486002)(66446008)(64756008)(66556008)(8676002)(76116006)(66476007)(66946007)(2616005)(54906003)(4326008)(6916009)(478600001)(71200400001)(91956017)(41300700001)(5660300002)(53546011)(4744005)(6512007)(2906002)(6506007)(8936002)(33656002)(122000001)(38100700002)(316002)(86362001)(26005)(186003)(38070700005)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4FE9623B17D7CB4E918616B83E5ADF40@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5925
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6091a3c3-d395-4259-aa19-08daf56530df
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OEfAkuc7/d32rVRY3ycMJU5+KxMZKSVaTnbjBjTJfuaTRpZPeumyAvviy8l6jKNVQ0dv+nup/oVsYG+W5e285BbqTbNy1nlFBWoU7sLNG1Pe8Z83Xz1sV7/NuG2Glm6AnZWstkSmMY0zkRK/L0N5or/PODZES9P84tNcxU2QwNEZwJ37vB0784oPujwnu1COAHFaLo/whVPyIjCg6QxQMhzAOO47Fx7FUablM4qp7GVy5WTLQGZxOwQx9F9DmiRoA7mp+vlc1GEsBbHSt8Yfsw4kX2VGpdcIyauqta4LjecMFY/OZPJS2bvb+x67oOXUqlqoObslvp6vAQ1kaaDEHHMkY/0AiWrzVBzruYf2PgFbNpA6ZH+4YRSjfkfxCq1SGqncsr83xNdAVcGanRpiCeMyTVgJN1kayjgO93oI6IAZC/KKVo16JWAuV4rPvYkuYqRvtFTomAkwtKRGlYkmQ48YFVjZBqtOUukbwa79ko5Y72ij7IpyJNIS0pdNl6cMLpere03F55VkDk0ITwDSI9b3HycGXDY2V2J7hqOha/Q+de1vhfQgFBVOxWJim28xaP/l8MWg6SjiOYM6AP/UUe2ifyCxP2EL9IXmlHKbhhbZk/DFDvHnSkNhEmf4gbLGuCQ3Sf0+Tq6ZWydQhNeiA1RS1rwkN7aNNE5eImG3MPvAo/ozrwaRLaH3g03Q92ipCnSlNaY7ZdVCyxdr6zeRZg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36840700001)(46966006)(40470700004)(8936002)(70206006)(70586007)(6862004)(41300700001)(8676002)(4326008)(54906003)(6506007)(2906002)(53546011)(316002)(2616005)(82310400005)(336012)(36756003)(40460700003)(4744005)(36860700001)(5660300002)(33656002)(82740400003)(6486002)(86362001)(478600001)(186003)(26005)(81166007)(356005)(6512007)(47076005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 12:53:47.8221
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41b3285f-ca97-421a-238c-08daf5653663
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8733
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 12:53:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175825



> On 13 Jan 2023, at 12:29, Sergey Zhmylev via lists.openembedded.org <s.zh=
mylev=3Dyadro.com@lists.openembedded.org> wrote:
>> So no, I don't think we should be taking a patch which would just
>> confuse things for what seems to be a cosmetic reason.
>>=20
>=20
> The patch proposed is not about a cosmetic change, it's about precise
> control over what packaging system produces.  Given the recipes can
> override variables with a priority over any confs/classes, it looks
> like there is no proper way to overload the values (in particular
> PACKAGE_ARCH) used during packaging process.  Some variables could be
> used to adjust TUNE flags and their values should stay intact prior to
> packaging.

What is the use-case for this level of control then, and why would it be sp=
ecific to RPM?

Ross=

