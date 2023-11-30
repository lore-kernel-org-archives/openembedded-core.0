Return-Path: <tobias.hagelborn@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D507FC10DC2
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 08:15:41 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.50])
 by mx.groups.io with SMTP id smtpd.web11.67715.1701332136372633723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Nov 2023 00:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=G+3c6CA1;
 spf=pass (domain: axis.com, ip: 40.107.103.50, mailfrom: tobias.hagelborn@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHVhXBfqH9jPqwePjtEaLXcVZ2CMUcr8mZ19POGn5+iOStrToNGEUuGMQSYttx5pbsuc7iHPGWhujp28MrGMCHAv/euRIwgyoUQ19Q0c25h4wFVgNtTWcMH5PEldGWLxZdmsABh5F6XRtCaO8Ysngw6RRKYpalKAvKfdjeKQ2Om5Bojfm3nJJVfrr6uIBnx7GfRskAbLTzkAfDye/wS/rQRfwktPrK1Gzu9IlvxgEsUhjcnG7mso74GrGF9UvRkjx6ZJ+g8mSsnYqGnfridsqB9aPb4EudhRblYfc3zRR8b9UOpsBSXcXSRkN9P8zlCfWNz3skX2ahifc081c2ct/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MILEC+PAJ2rTT3BMtr8lCZWbwhNKGHRM6OMgde0WIFw=;
 b=bGEj5L3tz61ztW/aytBlbzENU1RC699uiwmm2HmTELIlhWby5UdzmNJy98SfpVTxOSdHonwe2qzvAGXCXXeA3LkY8dIqoYg/3niYU3IPDJwbD8wj2NawStsrzFvSFSh9E9Owiapy6FQ9NuyRGdBnxhux6xHXc48ibQ9qVl53T21bu3uR4xmuiRt/fnYTzKwZhVV1lKmtJW9pti2ufngacSefT6SPExSesdUInN3BLIZrkuEIe8KrD3iEUaGl92oXW4OSy+gxDT/UDv7PGLuV/5uboIv2nZcp/xD16kpZPONr/jQ2+9YTWyVwwJMCLk5y8OLyBWiI1+Zy82q80DdDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MILEC+PAJ2rTT3BMtr8lCZWbwhNKGHRM6OMgde0WIFw=;
 b=G+3c6CA1ispGt1KFH/5XAcPfz9Ec22KuVz6lkK3F3WqenpHIIf756QLdRIJHzitx01M/M/OmDIhgZHg5cw64HQCCEPStrrJhDnevzz5B27l9kxN4vLCZWTRBh5ZOn6ilNgwFRDifKt+d8aYL9chcMoh+W9ErYyZLNFuKiTM62B0=
Received: from DUZP191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::10)
 by AS8PR02MB9792.eurprd02.prod.outlook.com (2603:10a6:20b:61b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 08:15:33 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::8c) by DUZP191CA0032.outlook.office365.com
 (2603:10a6:10:4f8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24 via Frontend
 Transport; Thu, 30 Nov 2023 08:15:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 08:15:32 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Nov
 2023 09:15:31 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 30 Nov 2023 09:15:31 +0100
Received: from pc37511-1950.se.axis.com (pc37511-1950.se.axis.com [10.94.62.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id B648BEE9E
	for <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 09:15:31 +0100 (CET)
Received: by pc37511-1950.se.axis.com (Postfix, from userid 11324)
	id AF8DEB257EA; Thu, 30 Nov 2023 09:15:31 +0100 (CET)
From: Tobias Hagelborn <tobiasha@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/1] hashserv unihash cache
Date: Thu, 30 Nov 2023 09:15:24 +0100
Message-ID: <20231130081525.2537624-1-tobiasha@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|AS8PR02MB9792:EE_
X-MS-Office365-Filtering-Correlation-Id: a168de9e-8f61-4227-168f-08dbf17c85a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eplGZ5lHz8G88nwwG6brlXVfVF78D9d+YrpZI+SKEXc/IB79ItebyfZrVeDRyBkRtLJcaonwQUJoCaL+WGAPBPxJiNz2h2Zte6wLPyVWdUjR0dAMfvjv1aEF08NYD2+a1pMq7UadYtiEDSFH1DHOakHaa2ON21ZclLqsIKPuaEzdXkqb6VXEG6ZoekLYC9vjTlmC1o5l7Fg1evjNg4b/t9IJ8rxMA0P87dVRN3cqkHLGwlrfm0Nb2wNPRuar9daOTxvC5tRLFrdQ0O7aUMW8yGTnTutgk/ClQajloUIPHo7UPE7IYpCWaFPrGLP6aStTLLk9FF79JoqZQ+ZxOraJIzzDepZEaKQ7agGp4BWHVk6fhKyBhRowAE96FIsQB1p/Abi1w81bD0t5aTqvnGppGxHl6shQEKWEyYFRt/V1he8SAAnHYXSZV2X6xvWblIuizPXoF0Hw6Ae8yoTop7fMA15Zo8386mETWVUICrAQjQ4NV6K01c8W/NapyMUyqbA1eggzD2GUHO55wlXza4BtAVusTiLOnPVpFn2dRPVBlbdAoqX1/RhYIYF9dh2pRTvDzbqKRxvs+4pmU24Sml537q5YhYY26Kc7E/iztDeLy4ljjSV99Lrlt5hqhdhtBo5u4aii4Z0pQT/wyHdIPETWj1yE5Iei6WjwccR3v6OtTZwYLIKqhUTv7McSMmW5fta43SCudUtTbY/rcYfUKjyIJdTnWmYrQV/7rkZP8bsLpdgKeWjrbieKiEsX4CHUkDkcWZN00cZsSxbCyzkPOOs7uExQVnJVZhlaAbaQqX0ZrMvKYVzy3NxzeZQUWRPmNSvd
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(376002)(39860400002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(202311291699003)(70586007)(70206006)(6916009)(81166007)(356005)(82740400003)(36756003)(36860700001)(47076005)(426003)(83380400001)(1076003)(6266002)(336012)(26005)(2616005)(6666004)(2906002)(42186006)(316002)(478600001)(5660300002)(8676002)(41300700001)(4744005)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 08:15:32.2612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a168de9e-8f61-4227-168f-08dbf17c85a6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9792
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 08:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191479

I saw that the ratio of reads to inserts in our hasherv is ~10:1.
So I have added a cache for unihash reads to somewhat off-load the
hashserver. This since it rapidly becomes CPU bound and also that it
is unresponsive during cleanup operations like vacuum. This goes for
the classic sqlite based solution.

We have run this cache in production now with and it seems to do OK
so I would like to share it either as a contribution or an idea for
improvement.

Tobias Hagelborn (1):
  hashserv: Unihash cache

 lib/hashserv/server.py | 188 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 159 insertions(+), 29 deletions(-)

--=20
2.30.2


