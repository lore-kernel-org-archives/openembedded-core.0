Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFC5C433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 11:19:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.79])
 by mx.groups.io with SMTP id smtpd.web10.8882.1664450369045127209
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 04:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=kpTFhIx8;
 spf=pass (domain: arm.com, ip: 40.107.21.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XkqW+xQvXVI+WxVHRZzogwMtKQhOxKXZYU+YUeb++34o0q5HM78Acooc4m4VOIx+3hxqxwNKJlVbMCY/ySwqg/6ODJF1P+npl3uan4+eOrw05+/xrLq4xoWRtXbEbBhUO9tUHh9gWS/9lEncDS5MVghyYdQ9FgoG24WRGBx2JKHzy40DXH124Zxuib3MW92+P5KORBmNyjrNBdJ2deJceFXDHF5/kK9XmEE1wjjtsgQN2a/57zvV6bAdN6aRrgtD6KBup5BBcZCmrZItJ4bwNXnOk/RzSaFYFlEd13aW45DgcxQG8uFS5fRW9bWDVV9dsOpZ4j3xuQIlkdOt0TOVkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7XRdp/enTkeEHpdDpx1x3vWAQSeDnkAVLesRCFWW+E=;
 b=XmuIy5LLObKT5/ardHr8umERiJQoJXn0FFAA9Q/bokyviVHkQJpB8lwsS+Qyn+mzBEzRZdXaqEWk94aMtJ5N9ACxue3cbl1bINofxtjfgrk06safNmovmj2oSXCiu1rPAHvWEjg+zE5Im/ysE+CvP/XtABSZxJgrShvn5mTrwEqYXJmscnKhdygTwxAoZVHDbkp5IPt57KL015lqFFZynm7jN7QAAQVDZCy9Hxjgk88p8GleEjf8U6TrR6IjEz/wwqOBOrhsxDsrmwl7GhVQhbUY30cX01GV5eegPnZ5WwXJFZ7XJttgfeVGQTpO/SIuEjmK8VOOddbzw9e3P91EcA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7XRdp/enTkeEHpdDpx1x3vWAQSeDnkAVLesRCFWW+E=;
 b=kpTFhIx8BCt3gfiU4gfOFlkM/UdR6M/2jL9U1rOADcT5Zb75yOFgrkUPt7IuIeNFk1cdlxMXCM1DbiN/jkl32wnDKrOI1RwXCFhStF1F1QcfY3lqV1aak1U89H11G5jKc9e5a64ivbJ61gZshfCH36AMQ7/I+eJIqIdx7wG/JXk=
Received: from AS9P194CA0008.EURP194.PROD.OUTLOOK.COM (2603:10a6:20b:46d::27)
 by PAVPR08MB9433.eurprd08.prod.outlook.com (2603:10a6:102:319::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:19:24 +0000
Received: from VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46d:cafe::ac) by AS9P194CA0008.outlook.office365.com
 (2603:10a6:20b:46d::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17 via Frontend
 Transport; Thu, 29 Sep 2022 11:19:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT040.mail.protection.outlook.com (10.152.18.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Thu, 29 Sep 2022 11:19:24 +0000
Received: ("Tessian outbound c2c2da38ad67:v128");
 Thu, 29 Sep 2022 11:19:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 640a8771d5084b05
X-CR-MTA-TID: 64aa7808
Received: from 2e6b2cb78f16.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7197D2A4-E1BC-4D24-A266-467F801C58B0.1;
	Thu, 29 Sep 2022 11:19:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 2e6b2cb78f16.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 29 Sep 2022 11:19:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oP8RtwfbXZjoOSPSzDHJbMNG+3pLJweyLA54Svb87XmpKYFiGJPvL4Xo5rNepuafEh4aT9K/trVVko9icAe+++o8uibdxXbfEgymqdZJAeaCG24k7C4fZgoXe69c6sCmhrWeYLKTTN7bBf2FtakgKiqQQr+qx53ubMsHfWGxj0La8W8BRiM1Mlp8Sb8Z4bY8K/zmX+tCXMVE8a0uMeK9zNs2dBrbW90iON2/AWaSBn+eO0GA+i0Pflye9QUFPei/WmViyKCwEpBqj6LbpNzbYVjvJ5WxGn+6O/xLpZ3+whEh4DWnpmLQaVWPmcx6DuvJwkd17W3/42dDH2sQA05mcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7XRdp/enTkeEHpdDpx1x3vWAQSeDnkAVLesRCFWW+E=;
 b=HGZEeZg1Ru32ajHc5/4YZ59NBnkuDjsLrJilNe6uyqBMTVBC0wGuaIdbOmFB8IGZi1r3PQ2FIqUcBdLxXwv54cEM+utETMYcjNYCn0dUse652gbfzbg8/pTsSKcPHiBWDgcJoE5wicy2f+otS0hdITiXZDGY+LjOdeMGFKdn5Um08LbdIQcW+32+sfiAWZQNaw4DC9B4aHtxKpf4NXnPr9Kfa2pvJDuoATjAc1trByfCVtd7+X2MTEY9RK+s/NFLLUzwqWe2h8ICAcuiSMC55SV+1jCzjKwcjWOOr+Osj7rom7H/PBZbnBPiECpTB1kdvdWOTde5IpCqzU3MxF99KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7XRdp/enTkeEHpdDpx1x3vWAQSeDnkAVLesRCFWW+E=;
 b=kpTFhIx8BCt3gfiU4gfOFlkM/UdR6M/2jL9U1rOADcT5Zb75yOFgrkUPt7IuIeNFk1cdlxMXCM1DbiN/jkl32wnDKrOI1RwXCFhStF1F1QcfY3lqV1aak1U89H11G5jKc9e5a64ivbJ61gZshfCH36AMQ7/I+eJIqIdx7wG/JXk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6213.eurprd08.prod.outlook.com (2603:10a6:20b:23d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.17; Thu, 29 Sep
 2022 11:19:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.017; Thu, 29 Sep 2022
 11:19:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "danismostlikely@gmail.com" <danismostlikely@gmail.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Daniel McGregor
	<daniel.mcgregor@vecima.com>
Subject: Re: [OE-core] [PATCH 2/3] gcc: set the default target arch
Thread-Topic: [OE-core] [PATCH 2/3] gcc: set the default target arch
Thread-Index: AQHY04egleefWE7NP0a5hcNaFxi24a32Q40A
Date: Thu, 29 Sep 2022 11:19:15 +0000
Message-ID: <133AE478-7799-4555-9260-2706CF3E11E9@arm.com>
References: <20220928221320.1763684-1-danismostlikely@gmail.com>
 <20220928221320.1763684-2-danismostlikely@gmail.com>
In-Reply-To: <20220928221320.1763684-2-danismostlikely@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6213:EE_|VE1EUR03FT040:EE_|PAVPR08MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b62a788-17b9-4f76-3db1-08daa20c76e9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 AeXfhaBRFDE2oMoPHleLH3S8jsNvV6AMOTTqU1UxQYfZSAKma4eQdiGvr0NF61Outmle1ilquasEizVL4MtlVXe0OFfgcC2fduInP6ABt/eEzh4Qn43EOeyQp/5Tr870oTejgeO+b73DJLMl+Qjhy3xNWrhWhKw+SH3WfOPPRADo2mG+Tx/A3t/SX2QVxr1mf17D5d5f/agWtB76gKJVt3EgJH+1d8gQvzpQcEMM/PkDFt0r7QEMCRxY/Kmnp7qFtYCnhg4E3TlEzdJbRjRLGLMZq8PwpzbRbkmuH+ejvoxQ2WkAs0mfW00i/qYDa+Jd5ehk+t+6wAAUSjvZmYe76fvUcMNW6LxD71AgVYBExsOxMjpeFb983sFixbnwhmzzRx1EnxiGT6xpHROMG9eUyz80xdVq2ZJcCX+K/cREw5WhnAFKoPGw9npxsBthZzbxi/GMt35TCkUQxiQsaLPy191k+3m1MytPuKC42mV+87kxOZdJBxE1RYxf1kqQxAmElgU6uokTbqwHhxjJaPhZlPaHz0yliX+NxaAZY9ayP5jHND/wvHjqovcW6y4qCULP+efSO+hxkViYh38/OOrHef62CgnKwjPjZHko0lBk3QcyWsVqkhTK9BZbPPUhlFvl6i2AhD6zkQuTeARnQ7F+rQvkCLkrmIQF1kY044S1UybMqN8qq7ddUeKYU/pN6Aku6GMMYPACAVpYP3zOV4ys+EF+JiJfYxH+U4hcyHBv7LA03LcrTQCVPi+hkHax245S+UCLzs90y+qgSDZIb26g75QYsdcjoE+xjs64abGl5FA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(136003)(396003)(346002)(376002)(39860400002)(451199015)(38100700002)(54906003)(316002)(6916009)(53546011)(71200400001)(76116006)(36756003)(478600001)(122000001)(8676002)(6486002)(66556008)(64756008)(91956017)(66476007)(66446008)(86362001)(41300700001)(5660300002)(4326008)(66946007)(186003)(33656002)(6506007)(2616005)(8936002)(38070700005)(26005)(4744005)(2906002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5FEEB0A0BD8B38448B55FED09CFD6C78@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6213
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f21be338-3e54-49e6-e55b-08daa20c71b4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ag4CI0yMrG39me7NAvfC6kB44ei2JbbbMwF/rXNpqsIO/10ozFlupvn+G7ORnHC/itxSq49QNJ7Du2jBp2DcMkasKVcA8g59nWHqm+2zwkqqASRa+w8Q8WwDAtWN5ivFZE/RACe8Hz2A44UsEAuuUSSWVazl0nLhTB8sh4BKHo+O47xd7c5VcyrLPha2OMuzXalkTR6g7CioeQoBK9TTHf8BXUu9nZXBonua4DAVV2voFup3zPFcciDkixLjJSXcukpNZRiqYidM8OkRoBDp1KsCWK8DZ37xHB71z8BJ+7Y10HX04i1tzKvVURS/2AdQXT+EJY11h3105Xvsc3JmPyRunyz63fYr3K9CT2+FIP01bRfTa/UIRhgfYmHWzuApqXKk+RjdS7ABoJ2XtpMmr/gxoXFePFdOUAAY7c+3RsFVoT/WJa9X0SPISmdiEM+ugnSm+icOHtnBUF5SybMi0daBWTwRwPoMLPcDSyqbaSaiYzfVuw/dfDWbDSjA+eEVkIK1M2rBZzfgJz2aUh9V0gZO11x17uTWhskmv1J+f+U3wMAq+UtnAlpudtJKx13OtN3XCet7MZfcnV08zGpAiArZlmv9+4M17+TwpKXo3HCKrXe1XNo6EuTXXhqqQq3j5HQuEPzieZV+SOoAncwhKrrmwmbCUTXP2GQVl0YYcBHzNjevAElZfI4BOAY4mOvSzybtaWZxcOwdGrZrPQ9HFSPSOZrlZV3dxsfvd8iImVSMCJXXcezROO1l2m17ohhcKuoYZhxDELCRLZTaKs6QAQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(47076005)(36756003)(26005)(6512007)(336012)(33656002)(316002)(70586007)(54906003)(2906002)(2616005)(36860700001)(5660300002)(40460700003)(82740400003)(4744005)(6862004)(186003)(356005)(4326008)(8676002)(70206006)(41300700001)(81166007)(40480700001)(86362001)(82310400005)(478600001)(6486002)(6506007)(107886003)(8936002)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:19:24.3557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b62a788-17b9-4f76-3db1-08daa20c76e9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9433
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 11:19:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171183

On 28 Sep 2022, at 23:13, Dan McGregor via lists.openembedded.org <danismos=
tlikely=3Dgmail.com@lists.openembedded.org> wrote:
>=20
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
>=20
> The default x86-64 architecture for target gcc (ie, the one in poky
> build appliances) is native. Since we have a variety of build systems
> it will occasionally produce instructions that don't work on all of
> our development system.
>=20
> Instead, set gcc's default architecture to the one specified in
> TUNE_CC_ARCH, that guarantees that gcc-runtime and any binaries
> produced are compatible with the target machine type.

Can you explain the use-case here?  These are target binaries, so why is th=
e development system relevant?

Ross=

