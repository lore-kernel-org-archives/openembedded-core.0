Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C956FECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 10:51:01 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.66])
 by mx.groups.io with SMTP id smtpd.web09.8710.1663239055034992267
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Sep 2022 03:50:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=bKPRfRo2;
 spf=pass (domain: arm.com, ip: 40.107.20.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GuSJbtZVaU3wZm4sCaTDhar2VRPOy4rRJK8aBwoABAXycT1sDeaZVZFXgOQSX/ojUZjLSR4XUQk4o93qTd6I1lBUxuH6tj8iHGnIUG9ECfPnaLJ2qzYR/bK6yHbUGk9w4EYPnqMhYAZeGgMWRDwQmR0YvpBCNVs6L4g4UT/FcZdvj2GwZ1LWqQwpwaMk3F0nw+pzsbR830i58LGPU9v33/Y/mIRGB/rRWCDMa64po9z2MbK7n8mJw5yMZ9KsqL1bvqYAbvTeMLIbF2F6jrkPX3wLotlemYrFE7Kbm4gn27Nh2K4YyEO77iFV3PYUgHWzGoUodLFptxtSp3raxIiO4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBseGwn69+UQyaVAH2LlbyApQjv9rpmFRtUPPim55yE=;
 b=D/UeGhR9XBB59PqrmpPzOzSPmOXGnXf0uZwzOm3K0cC1n5TVCxK7mrykc4+2OPuaAPuv1RrdEOsxSamEM72r7XA4pYGzc1DXQljtWxc2104vzM+R1xIu8egD83iBxrhiv81q16hBZ5t5R+iCJDqaniGjmeJjkaqh2eBpua0tikri95cDHJY9KDqLq35FRsC2tb2G3kL/vYJaAxIE+J7XgqRzCaNlXgI6PxR19N+a4+uU4EicXwlQ0s2dRysHTjVJtj/ZPXCr3haxE7sCZw0sqL/ZZW9mgFIZwUEN3AQWY8CiYRxc2fjwReq/pYOeJXcggFOVwp5UXOMKkLZT+FPHAw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBseGwn69+UQyaVAH2LlbyApQjv9rpmFRtUPPim55yE=;
 b=bKPRfRo29Y5JjPo7ULLYexU2DoFTLjSZtADW5YU3GRA0ttaSAGrG+0a65ZvMH+Ju7ao+E/175sYNyceChLy7TThljJomyGZal1BNRQ4kD0goQW2nHbdtvANRtX9tQRqwTVZDXljfinZam64Uko9I4ysJJ4Yf19KydhRHqAuIzgI=
Received: from AS9PR05CA0058.eurprd05.prod.outlook.com (2603:10a6:20b:489::32)
 by AS8PR08MB9120.eurprd08.prod.outlook.com (2603:10a6:20b:5c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 15 Sep
 2022 10:50:51 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:489:cafe::7c) by AS9PR05CA0058.outlook.office365.com
 (2603:10a6:20b:489::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 10:50:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 10:50:50 +0000
Received: ("Tessian outbound 3c27ae03f5ec:v124");
 Thu, 15 Sep 2022 10:50:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ce158c91c1b5824
X-CR-MTA-TID: 64aa7808
Received: from 440008699fbc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 00C94091-2FF1-49D8-9CDA-43E487A33EB6.1;
	Thu, 15 Sep 2022 10:50:43 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 440008699fbc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Sep 2022 10:50:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CUuPIDURrhT9QGLIUDIr12hx4sdwfN6FCaIfK668nbEUbmGFkRWIbbMjqRyiJpPPxRi9chv3mNYOwCJcC3IQ0lnX6rC31iatbE+H9oO9VfTlRIMuruxFwQLw3MyRPOio5oqr9xh1KbihuMi0OS2Ejm7TLZRFTTp61TaJJKy19LDp+29SAtXsUzsFPXw1Dt/etPbrHf94WY9CWuNXZAKZaaf3i7y3nor/ziwPgrECpfO/pnN+XgoY6d2GrkELl+CNFKRfNrkVJAU6V/tS/hopMvjeXRnEQEbITOyOYugnX/zI5IjBI6Aa+SMYeW/h+pI+wHxgBBb0LrxOe0w4kJ38YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBseGwn69+UQyaVAH2LlbyApQjv9rpmFRtUPPim55yE=;
 b=Aw1CbukcJ8RBeImPrH4sbY3tVOqZrEhpELCEQzIR2NrNtJKVjzig+VDpuJ8NpKcI28p6ydClDcI6oZJPducmxk5lnE4bFsbUtCmUGrQGfb/knyWAejGVlXF6PP4JuVats7JxEiTkryPKUADYsrWrj9+ewMXoMFLyoC+bYlq4sucS3oMOz38mf2ZjPLlL0Bl9uNnpR4fQvn+lnqRqoatG3uEjIFqZoH1pCX3wpIhoJRCNp3okC1S6nWJjdm1Y4zuj2W51JdIXao/f33mg0+nRfm6IRXD3RSKgMjLr4DBbMuXx4879HQJEMfWWiyySu5hwD1/tqGZdWEf1Ycv0V9niDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBseGwn69+UQyaVAH2LlbyApQjv9rpmFRtUPPim55yE=;
 b=bKPRfRo29Y5JjPo7ULLYexU2DoFTLjSZtADW5YU3GRA0ttaSAGrG+0a65ZvMH+Ju7ao+E/175sYNyceChLy7TThljJomyGZal1BNRQ4kD0goQW2nHbdtvANRtX9tQRqwTVZDXljfinZam64Uko9I4ysJJ4Yf19KydhRHqAuIzgI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6575.eurprd08.prod.outlook.com (2603:10a6:102:156::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.15; Thu, 15 Sep
 2022 10:50:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::a108:b98f:c57a:1d1b]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::a108:b98f:c57a:1d1b%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 10:50:41 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "ptsneves@gmail.com" <ptsneves@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 1/2] ntirpc: Add ntirpc recipe
Thread-Topic: [OE-core] [PATCH v3 1/2] ntirpc: Add ntirpc recipe
Thread-Index: AQHYuwXLQtW4G6HGoEGIozyJyBa2Zq3ga/OA
Date: Thu, 15 Sep 2022 10:50:41 +0000
Message-ID: <C8950D71-C267-4624-A510-E0F81BFB4FD2@arm.com>
References: <20220828174356.3074391-1-ptsneves@gmail.com>
In-Reply-To: <20220828174356.3074391-1-ptsneves@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6575:EE_|VE1EUR03FT005:EE_|AS8PR08MB9120:EE_
X-MS-Office365-Filtering-Correlation-Id: ee03f44a-c79c-4420-7a25-08da970827a4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 tJBNEwpcT9Dyn2A/fP6O5Hyb+pPB9Uud7Hlvcb6LWsBqO6njiZFNBQqQdeEK/INMZVEd8bjnW9QWE/EhMLY6FOYVO+pxwA8x3mQuvXHygcu3yAHHRJouGO68/0rlqJQ0c3El6X0HHfBaXxZ+AmTOAfp+7d5tMAkN4mXdBWks8pjJxWh3XtUSyI9/E320AXbmgNRngzDpFSywj8g8ryrmDSASRa3CpGYV8e23asry6kB6c53dUv1Lsm/+aIa8cc0ljK0CEEyHp0a5oKUHrIq/RnUnlLVOQ9nCUZQIO8ZHPCCSQWsXp069QdkDOR9VAlkdpwE8EMFNqgUJd9BFhdfpA07aKMacLsRBIismgPboR/CfPAmMaNo1iiPaYagvTapOBDbMQDOa25FWDK1gMs8iwFR+EEEHtqbhfmODE6FuEjS5kfdBQj6rwZ9CijVKIO9BJzm6tVt3sS9mfxiGzSaDQxWT/2tkEST1JLNCmdJ2QqR7TY9NRQ4HvuORdy8Kh5knN5e0AJY5Wn29M7TmmBChWryPng79fhZ11n0SobPc2WIToiQtpYaQaoHu3PnKkgM6Qrlgg20XgUMsYocoBWFSSHr/F0XPcwuE2V9tf350954d+gQOrxUNXjDffnj9oHISf/NGPkIzhJbR0cZhJ4xlCSYTdm+rkSQZkYBRn5sHP8oktcJwO/XY/62hlXgB9h5HlmCkCd4OH74Utcbe5KIYwg4COIRpAwoQdocssSkkJG7KMxpd+slERvbT1wdvgu2vq6netkbW6zR1PGjbu9sX4UCw98mvWhNDB17977LSuFI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(451199015)(316002)(6916009)(26005)(38100700002)(6486002)(5660300002)(64756008)(53546011)(71200400001)(478600001)(86362001)(66556008)(66446008)(83380400001)(122000001)(8936002)(36756003)(6512007)(8676002)(6506007)(66946007)(186003)(2906002)(38070700005)(2616005)(66476007)(76116006)(91956017)(4744005)(41300700001)(33656002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B61DBB7366BCFB45AB4E7AAA29342929@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6575
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	43ea553e-6bf6-4bf7-bd8b-08da97082252
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fejxM0kO5e0el/JpeHLLhS5jNrqY+vxSyWiMpHWWhs2V6/YlQ72uS6sEipUOtOlpegZ1Kpdmlx8N4BuuJNLoAu6aVyy4Q6Kh+jetE/Tfb+ji8zx8b2DCbLUb5k9NOly1g+JXtodf5DxNVmMBNrzW2ZLNurAmKk27uOGA9MdeG8MZ389gkhtUECiwBq5qzWx8oAbLPCxZWwv0CmTl22Ol3gP4oBhBPGKKeiDVHg2nB8nILRew+EdNdV3UpX0qVp/d1/HfGBnPZsuI3n4lU83esJ+bQLZxMEnu6ZFWuldPuPGNSymhQ7i1ydsKwdv3qzjKSPN2ytfG0lKZIaE/6v0G92Wekhb7ga1JdTL9MpLW+uv8xwujh6jyNF4NNRN55cRslwep0R/W8m0CwC/tUviXAanO5K8TVbE3GOTuZDXEy8zFFDZ5JbblbCcAfJFPiVJe+RVNfNGcgnyfn9+8MQKiblxwVyhyrZgG7LqhxOnj0PYcm1pAdsz8eVoueug7t8603tk/EBoxOv+rphM6Pg8fNs9Jt2dOsdsfMQuVNDdymvmAQuxWyKcp71hCyuLm2hYX7Zk6CWcsg/KcjFXY4Z3/Uc7JO1V9sDGkyFl/GNY2QtRH2oXa3jNvSlXt80UtsMc7gloQ8MDvnkY4Yg3rx0Qgs0VY0/dKXe1UrnWquDWte2lc+0nACbeGrK8cza5GWivlsSyM8i8w6tLRe+QBcqj6+J0nVhQYTpoggvMVTtVY4Tqccef00fnG5WUIrf5KCFEq9jtdPQ0pWJkuEA7T5mVzGg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(2616005)(82310400005)(41300700001)(6512007)(40480700001)(6506007)(478600001)(53546011)(33656002)(81166007)(26005)(86362001)(82740400003)(336012)(186003)(40460700003)(83380400001)(6486002)(47076005)(36860700001)(356005)(36756003)(6862004)(2906002)(70586007)(8936002)(316002)(5660300002)(70206006)(4744005)(8676002)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 10:50:50.5875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ee03f44a-c79c-4420-7a25-08da970827a4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 10:51:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170685

On 28 Aug 2022, at 18:43, Paulo Neves via lists.openembedded.org <ptsneves=
=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> ntirpc is an actively maintained rpc implementation. We cannot completely
> remove libtirpc due to arising circular dependencies where ntirpc
> depends on libnsl2, which in turn depends on an RPC implementation.

Can you split this into a series of commits?  Extend liburcu, add ntirpc, u=
pdate the recipes to use ntirpc.

Ross=

