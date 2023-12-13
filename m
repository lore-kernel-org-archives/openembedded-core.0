Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3D9C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 10:56:41 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.40])
 by mx.groups.io with SMTP id smtpd.web10.33541.1702464999251831582
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 02:56:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xVaWe+vS;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=xVaWe+vS;
 spf=pass (domain: arm.com, ip: 40.107.8.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WVX24y/+DsXwmaLaL+XRsNyzq1pkf8ai3lcR4O8rrRSKUA0yUzqYZJ+g74c7/R5x86aromREd3aD7wXuy7TslLLDInum3eGtNdZUx4FVvQBK164w4Py65VMep4yytdgk58J/zCRtdYiTGByLXkoTgArObJ7bP2NwIc7clVQlG31KoHp/fPKQHqawN6XOTj48NpzdkRjJgfd4sXlavqiQRNEpHSl1xecDjPHInbE8420/kXm6YKkogvl0uxSdHKpIboPDE1+lhidBFXT+7UJKALsRjKmHQcDdDSoMqdCghqTFj14a7f7pIVfL/kxsfmKoOGOPT7qPqn55VzyPTK7xeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofUYk3EDKl8KSoS9QlfVrsVahVKc1tP5j3M4Vyo9enc=;
 b=mQfA5OHnn9MTTv3H/V4xOvXLFnVH7Rex9tGF4+c1p3pbjk1f8kAePu2BjCMlarSho4ma3Ryzeqx+HWfbrzFMWwtc9vpw+ekJVXzfTSTkYLwLpDJXsNSa2Gmt7s428zsd036UdJ+vombLo1GJ6I4mKpYcO+T/pXSHJduR8ItV/I2MpaeAX+bXb5rxE0vJk3YaP6wkPYtC3iqYzB3gTcBDhQtHybuVWzL/X+fxxLjDvtxJgxWMLuBPGxYl2YwWH9QkNg0tPE/7+/fVo9lED7r4w2oZwN/0wOnN7ZiUSs/K6+eBk7brzyEB67TDeg6xdYEZtIFiQnOD3d9DJKT32KSRVg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofUYk3EDKl8KSoS9QlfVrsVahVKc1tP5j3M4Vyo9enc=;
 b=xVaWe+vSessJkcSH5HWZlUy+cvVOIMRQMXt13NDnquFYNKMIxmtlpNNGqKSrW0hqVEF5ofj5JUAMkCCPgTns419U0RV7CJU8XrSHH5r10Ah0PHIL1B21pUP4NMhkIFNBruExxU6E/ByK0GC4vnujkWF4Ttm1gdmm+7O7zE977BU=
Received: from AS4P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::18)
 by DU0PR08MB9848.eurprd08.prod.outlook.com (2603:10a6:10:443::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 10:56:35 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::97) by AS4P195CA0012.outlook.office365.com
 (2603:10a6:20b:5e2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32 via Frontend
 Transport; Wed, 13 Dec 2023 10:56:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26 via Frontend Transport; Wed, 13 Dec 2023 10:56:35 +0000
Received: ("Tessian outbound 385ad2f98d71:v228"); Wed, 13 Dec 2023 10:56:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a168841dc912b184
X-CR-MTA-TID: 64aa7808
Received: from cb7ef8543028.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id C5D43741-FAD3-4F11-B5BB-036555632B38.1;
	Wed, 13 Dec 2023 10:56:28 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cb7ef8543028.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 13 Dec 2023 10:56:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAb7CsmE3WKKMTovSOcFCi6bA21a2NwEz8cTMsHFIulwXcC5xlwAexp66CSB4/waKJkWRiQIvcEeLg+ebNue/HbzrMt6rEB1+zz8ta/NeEmC0ulKEqZK8ouvJdosAJ5Vm2mYwSzu9IMJ96zBEbC/HPi/l/9inO3c9aHevktqoOthqA25wYubxwcHnkThhZfCriw+Fw/qBpc9s6qwnITznM+B5ukVNGS7ZZSeurLvDqJfmZlqZwj/TMl3ETJ56EOuMswD84fJABMN1oxqm7BO3IkzocV8a7wpX5JZul9pJ+doXReL/VR0dp1H/ENCAVWtP3NGe5O55AQGiqrN6i/Ulg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ofUYk3EDKl8KSoS9QlfVrsVahVKc1tP5j3M4Vyo9enc=;
 b=gER0MAfxyqjo6wt0w0nSWHDP2VGfAmBbSa4ppCOOylC9XeD6Nh1N2ypiA6rutj/TvuFx9CpsTVblBOcao1WkeG/CBX4+gDKHpeIhrcF15zbOEYTtRJn2Xt2VbgiP4nv2hPSMe5jnsVE+PU0sN9VrICXLIMtK0POvJFfhPhYgnahuihXjYjigJWfSaQdkAea8Q5o4lo8BwkcJGXeT8vFPNhO+fsXBlcA5LKIHyP8XEWhaRA+3A6R7Dz0r4nqfR4YghRnh43hy1sqULRoQLM+M8Tp6YTFUl7MP1pgwCPvgw2rey2e4dhfDVU0bY1cLWQ1NNB+1krC35HGip3s3szidhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ofUYk3EDKl8KSoS9QlfVrsVahVKc1tP5j3M4Vyo9enc=;
 b=xVaWe+vSessJkcSH5HWZlUy+cvVOIMRQMXt13NDnquFYNKMIxmtlpNNGqKSrW0hqVEF5ofj5JUAMkCCPgTns419U0RV7CJU8XrSHH5r10Ah0PHIL1B21pUP4NMhkIFNBruExxU6E/ByK0GC4vnujkWF4Ttm1gdmm+7O7zE977BU=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA6PR08MB10568.eurprd08.prod.outlook.com (2603:10a6:102:3ce::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 10:56:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 10:56:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "xiangyu.chen@eng.windriver.com" <xiangyu.chen@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] lttng-tools: add a flag to test the userspace
 only
Thread-Topic: [OE-core][PATCH] lttng-tools: add a flag to test the userspace
 only
Thread-Index: AQHaJFyP7T4EPP2jaEyebCMW8ePRPLCnHUQA
Date: Wed, 13 Dec 2023 10:56:26 +0000
Message-ID: <DE373712-4DD5-41A8-AB9C-5D4B0BC083F8@arm.com>
References: <20231201140430.792362-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20231201140430.792362-1-xiangyu.chen@eng.windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA6PR08MB10568:EE_|AM4PEPF00027A6C:EE_|DU0PR08MB9848:EE_
X-MS-Office365-Filtering-Correlation-Id: dde68bb5-1a45-4d1e-17b6-08dbfbca2c86
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 6Hj6aRDIo1Rxm03AhNA9wbc3DrLfmU2uBJHIHMx9uAqw6OTHO/wVgyS7knw9O7iSlhU//Xefk4l2zGyUmmCoGR8pNNhF9/aykH1RHDbZQ8a7VCQvP7hVfcQwNZ9T/o94oQNj0tdHKpRDUOLus7AH3Cq6lcrddj/gSyjfSTaAOc7wvvbi8iLrU22ptPa3l7WUAkN3JqMHr6Inqin+2Jj1I4uHnxB8pxJahQ4WAap1noZXWSdSpTgKclPJqVEE2UvXDMRVvp5ESDrKmnCVO0fjIl3fnRr9OisS0wSwhpVXE6vOqPSKQv4VLX2TWVPVhYr4BVicFlbMtMTCuMJ31PsEkKv5jQR1NED3DXTizrAhLFMsbaPcE36CYhc7hwTr6s/G++A2fJAs+m0Dql7c25AhoFw5Aaaj1knCe2m8VvAvhPEacaZapJTGQInvDENDamS0WxQTeFdwcVS6gnyKkQv+YQljFAGX/iUjCj42K9jvm4/WDjOS7VkRaZa/9xYemWDaPaQBqlOkEydAIF2wHbD9xrsN8n8WtoHcuIitGKpRm0YceeUEDbWUTJc+fs1l2kpUV2V30hdy03HefYAae8spfsq4dgpNb9rIurOR62CnEjmh0H2mICC0RjN3dMaWpmVZ0PkeUTujrikLWbuoMxmMng==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(396003)(366004)(376002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(38070700009)(76116006)(66476007)(66446008)(66556008)(64756008)(6916009)(91956017)(86362001)(36756003)(33656002)(66946007)(122000001)(6506007)(2616005)(6512007)(53546011)(8676002)(4744005)(2906002)(316002)(71200400001)(38100700002)(6486002)(478600001)(26005)(5660300002)(41300700001)(8936002)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9346BE1007043C4A8DABBFB301B4AEDD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10568
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	17e8d287-0db6-49d1-1b66-08dbfbca2749
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HmzEfxAEVV53ExONrb5pEgJZxTIOKbCFockwMGX2MaY+iTRH++DZf8pqiqrxELgqYHnbrYRE1odRapViPGKrCplxHu2OwwFlhIMuyx7JeAr9CsJNu4ga2MmE2aV0kdQQJygI618Gm+QoNaWnuy3eBENHW+kSWRRRykaFrREmxaPeTAsnM293twqdE54OILWP76ZpbfRoGK/fjdUBgGiGX5x1xWX1INhurSgHNKz2odgF5ziroUKAxbp6ARrb1i2V6ZqCNWb8646ro/DmoNKvjYTjWimVdu9//6VX6OhaumFW8sMO0NY01VfB3nduL1Q0H0vHoHnIPyomzOLQaZfs5Kbrkxj3+OKsw+2gEtuBKzpU4tmiBo3NSU8a8C8Y5LVJtpb3NUNoKuoqqfGqufqVdN5f37UqwoROn3YW9whzXtNECRpGsGwX22OB1qL8cjnoKhHfz2qCvl063//220bGfkR904hb/mGdVwE88f7A1VI/9aM7mgL3dHUKWE/36rCGH7haW6ctQtzIXbtyUYKD2YBFRCdiYOHLExdhp9BjNSxFmKt+0zZFOCgXPS96oIRoMtq+ezhiLJ/B2icMQgADbU3gVUw+vvwxPZeBWbXI3cq3VYExBAByTvygGcnFvv3TQP36PIMyXkRManLOcMY3XdfaXf4raJBkuQo23d7vOjPgqpyvaFGINh1lirOV+S2grO52H8GcZkfkpy/JttSKGCnFVORaLa+RygsajDAxI1w=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(186009)(82310400011)(451199024)(64100799003)(1800799012)(46966006)(40470700004)(36840700001)(40460700003)(336012)(26005)(6506007)(6512007)(2616005)(36860700001)(47076005)(4326008)(8936002)(5660300002)(6862004)(8676002)(41300700001)(2906002)(6486002)(4744005)(478600001)(316002)(70586007)(70206006)(82740400003)(36756003)(33656002)(86362001)(356005)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 10:56:35.1539
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dde68bb5-1a45-4d1e-17b6-08dbfbca2c86
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9848
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 10:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192281

On 1 Dec 2023, at 14:04, Xiangyu Chen via lists.openembedded.org <xiangyu.c=
hen=3Deng.windriver.com@lists.openembedded.org> wrote:
> If running the userspace test, just raise an environment variant
> "export SKIP_KERNEL_TEST=3D1" before running the ptest, it would skip
> lttng modules related test. Without SKIP_KERNEL_TEST=3D1, the ptest
> would run all test cases.

Is this something we want to automatically do?  Checking if the module can =
be loaded before running the ptest, or something.

Cheers,
Ross=

