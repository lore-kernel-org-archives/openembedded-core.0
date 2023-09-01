Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E75CA0FE1
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 10:19:57 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.70])
 by mx.groups.io with SMTP id smtpd.web11.3201.1693563590193901982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Sep 2023 03:19:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hYRzfVqY;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=hYRzfVqY;
 spf=pass (domain: arm.com, ip: 40.107.7.70, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKgHRhYKNF+CpIJU1xGV3pGXl1mNi/c1iiuPmgpKwNE=;
 b=hYRzfVqYsBRim/1QvGQwGND2EqNvoG0h/mxmmZYqk1z+lkDuv4hb3NIVCZO62ApXYUJ/CD+8udE3K6uGWERJdtxapuI7o2/n0XpJxDhLJB4WbA0I/ucKewhvWLBvMTYJCvWJGRujPGvSYrVwn8BKX68zMBywp9cv4C7K5dc0uUA=
Received: from AM7PR03CA0027.eurprd03.prod.outlook.com (2603:10a6:20b:130::37)
 by AM9PR08MB6097.eurprd08.prod.outlook.com (2603:10a6:20b:280::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Fri, 1 Sep
 2023 10:19:44 +0000
Received: from AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::20) by AM7PR03CA0027.outlook.office365.com
 (2603:10a6:20b:130::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 10:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT025.mail.protection.outlook.com (100.127.140.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.22 via Frontend Transport; Fri, 1 Sep 2023 10:19:44 +0000
Received: ("Tessian outbound c99fbc01d472:v175"); Fri, 01 Sep 2023 10:19:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4de4ee39dad1fb1
X-CR-MTA-TID: 64aa7808
Received: from a196dbf4a0b4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A7873BAC-FF49-49AD-A585-83D6BF0F95DA.1;
	Fri, 01 Sep 2023 10:19:38 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a196dbf4a0b4.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 01 Sep 2023 10:19:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVrpUsK0BJJvv/GlrjcAm2vpx64Y4S2ALKppfhhdjELAPgfGbV738l2VBGYd7itCmldZgJUsyK9gT8lJBT1+Q0pBu1C6ieG2SZAxuhh2WYczmreymkXz8fO3WxjbDAAFcClxuDratL8rei9+UX7Rp5K8XSR+edr2fJbwuUX2mhHRhSobb7+VweN21D3BTBC/BusmP8UQ4KFJ/WkZo/IHzImgkfLqmmCe53/5fwzo8QlOqWrUOjWGq9YSLE+SjNLKGgtWWqPecjoX+1r3xJV92smB4wrESHwQGEOvDtfzm5r24ONDagh0A3EjBIoroejyl+VEZ948Ce5apDAQBpzJqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKgHRhYKNF+CpIJU1xGV3pGXl1mNi/c1iiuPmgpKwNE=;
 b=CsVA6YbR7h0wSvc1u1ewCRVC1NPlalDo+24R+YipUWDee4gAAv5Qt5eVigs6Qwf6c9QFIEArGgW4NhTampik4+s4zcSg0SNdTsWhLDOkquBFWUVf/ElBZ2pY2KL70WIqlLIxN0xuyTL7GRI4361ImtcKcyGwruMcxvSnwIoFaSYsyIQwXCASjqvznVueEUBcIBPQwooSKMic/A05LmG2rHHgQyOm9mVi27+daP7/iuRcgbv3sg7aZ8lb9agxZikZ/OOp0zX0QI+UabMGm6xj4sgpUEjSihWD86Mi8QZe58zT1y646wFwoOpPW23Wq/++9rVtXIFda/BVyVcR3BFSyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKgHRhYKNF+CpIJU1xGV3pGXl1mNi/c1iiuPmgpKwNE=;
 b=hYRzfVqYsBRim/1QvGQwGND2EqNvoG0h/mxmmZYqk1z+lkDuv4hb3NIVCZO62ApXYUJ/CD+8udE3K6uGWERJdtxapuI7o2/n0XpJxDhLJB4WbA0I/ucKewhvWLBvMTYJCvWJGRujPGvSYrVwn8BKX68zMBywp9cv4C7K5dc0uUA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8134.eurprd08.prod.outlook.com (2603:10a6:20b:54f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.23; Fri, 1 Sep
 2023 10:19:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::4b8a:7518:c642:5727%7]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 10:19:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "bbara93@gmail.com" <bbara93@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Benjamin Bara
	<benjamin.bara@skidata.com>
Subject: Re: [OE-core] [PATCH] insane.bbclass: introduce SIGILL finder
Thread-Topic: [OE-core] [PATCH] insane.bbclass: introduce SIGILL finder
Thread-Index: AQHZ2+vgPcTHh9ICLUu1NA76xtfawLAFw7cA
Date: Fri, 1 Sep 2023 10:19:35 +0000
Message-ID: <0E234875-B7BC-46F4-B830-2DB4A9230955@arm.com>
References: <20230831091618.3715995-1-bbara93@gmail.com>
In-Reply-To: <20230831091618.3715995-1-bbara93@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8134:EE_|AM7EUR03FT025:EE_|AM9PR08MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: a5ca86c6-250e-476e-4b55-08dbaad4f65a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 iPiddLW3iau+HoQfgffJuqM6ePECfJUJ6y7uwDH2/w7v1Xb1bmuwkA/6DaKL1PNici/21Z20lRpvr2opwr/NnIca/JtFaNkVTraMesmH/Ygec5p4P+1zV81SAkWysan19VXaNNlWh8scQcZK9Cgv6CRBlifuEfJyWLwW9giwLUuyuyY2u8GGhxcGTanEy1bU8ozfwB0zSj3okgjNzayw9JfSy0N6AMnG0zI3rwPlBlyocgBFjn9nxbAs4npFnPY5HCjGYKpX1w0CVUCcPX75FQQbl8wz5VpEAUvD9AEsQ6JPVvEENnT8auMA1cOrW8IxVzWJw7pBhTz62j85S2E4Z7cf6z861H1QSyiyBUUjtbDNH1aaqiMosUeTzan0k5JMCb1G/kwrNf0Zns6GeiZOyVQ9SApcaM2B79EvW1q7+Wab3cqakKf9+Yer20OG+Bw/pvr4uJ0pVAKPkTeD9V6K3uZMjMm4r92iu6YTCV25UzKuQL3P5+4L29xAKEh694UFjSv8a8auTmzXd7QL30PKmhEFb91yRcdi9t3SbALHhqw9ntLQCfBNX06t2Wl9tiegFYm684idoaLfYyqBu3OO3WZkagzNAUZ3STT2qp5Z/fDVUhpIpP6MWauVsOTXyDDQJu99hF9BgjpT7g6taVHq0g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(366004)(346002)(136003)(186009)(1800799009)(451199024)(6486002)(6506007)(71200400001)(6512007)(53546011)(478600001)(2616005)(26005)(4744005)(2906002)(6916009)(54906003)(64756008)(66446008)(66476007)(66556008)(316002)(41300700001)(66946007)(76116006)(91956017)(5660300002)(8676002)(8936002)(4326008)(36756003)(33656002)(86362001)(38070700005)(38100700002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB031D579C155347BFF22560CB76A93D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8134
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	78ad1614-03bb-42a1-edd1-08dbaad4f107
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SrAGGqGqTzwlQUCIg97abB4yNOh0zsGGwewyLyRbr+pP3jq2sVwIlRa9dMyY5ZGvc2tdr2xun3EelRTNDaUovZS7rxS2bzvw5zK7VlRSpg1HseDprM2y6I+MqgplXhnqvTZFWRk8q2qRLExyv0dtJCA5iPfHYdXIMzZIsZA3xuNTOe9WNBEujLxfOb8BkDP8jm4Fck2DCfRtKn3zOi5bhOYt60xWOc4gCW+TJuCRj7qTP7OWJDW/SjhTD1BvOKrScwEGCcz76ML6H8rAOK78yyIlwIG7+bchxobEqAVhnMcEdZ8QKIPgmZSt882XhbkdgGwaF9ZSFi/ofgM4ImfL2IYT+AkGnmYtF+nS0Id9Xr4fWS9XlDumQT4klbMOY5OY963Q5OVm4O9lfGKhVB2t8b9PMjiFH43nRpNumaZ9h+8NcHhdWmMlqDA/AnR9g7A54pLNyrkz94OvzFd8qv3V6eV7QktKnDdA8/q5UgKrL5U0Hypw7lemd2SV/lkFQO41ZSBhk1P36gGrONl2bodhH+GCNxSBKq6rjFvYayNorF6p6J5Dm8o+aaGvmLI1rTC+UJkmRr4pFEsrLte8VjTp+GxJJ9emAQvSNYlfldVsflazhJfR1Q72BjNAmxjdAE8xVz81+90x6eMOpNyStQG1cKgvtKCZdpWwApUuqC4NnVUHMSAMOupTgxBO8dSmP1zsEfuUvWNSH6WqPjexy/wEbimdaSs7T8uEaiiPJQ4+LgoQxqO7llvanaijBhARZ4xi
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199024)(1800799009)(186009)(82310400011)(46966006)(36840700001)(40470700004)(6862004)(4326008)(8936002)(8676002)(5660300002)(316002)(36756003)(54906003)(2906002)(70206006)(70586007)(41300700001)(40460700003)(6506007)(53546011)(6486002)(36860700001)(107886003)(336012)(26005)(6512007)(40480700001)(4744005)(81166007)(82740400003)(356005)(478600001)(47076005)(86362001)(33656002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 10:19:44.5333
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ca86c6-250e-476e-4b55-08dbaad4f65a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Sep 2023 10:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187002

On 31 Aug 2023, at 10:16, Benjamin Bara via lists.openembedded.org <bbara93=
=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> From: Benjamin Bara <benjamin.bara@skidata.com>
>=20
> This commit should look for unsupported instructions depending on the
> active tune features. For now, it checks for vfpv3d16 and other non-neon
> machines, but it can be easily extended for other architectures/checks.
>=20
> Reason for this check is that a couple of packages assume neon support
> for armv7, but it is actually optional.

Presumably this will trigger on recipes which generate the code for all the=
 extended instructions (neon, sve, etc) and pick and runtime what functions=
 to run?

Ross=

