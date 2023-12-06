Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 110E1C10F07
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 20:55:51 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.72])
 by mx.groups.io with SMTP id smtpd.web11.44677.1701896149791029595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 12:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=KUZw3gqq;
 spf=pass (domain: axis.com, ip: 40.107.21.72, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xf2gpUSvAwS2J2NwRVzJLlo2vR+c++sbwMeRyKALZX97Cif2OyRm3rBzvDJg7xpVOUnbIfZj/CxonKTmSlj1jk+R64b8Q2IOJkbHRs1NFG+HoSm2ozdMWSDk5z1566U7ee8Ywx6soPvChjlYzThyE2ii7EfIknu5yg+GnVjL69GDC1yY2nb3a58vlfMMgGwNxm0tSv/6EOoznxQv6Ypyy8XmwQDrIgbAfwM8ExcBPW5osmWx0i07uohUHj70z4TaaSjzPHFaH+CR9B/QifIJDpNBu2/Wu2VF0V+IMP9UMAMqumGiKgqN/MSuxMJgnGLbPD4h6bqPKg4Tu0IslQqI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=888AbVcLWgq8mkVVWIXKELCnnYxkecPSD9zg8cwMB9Y=;
 b=QzK4jvNfqISUF3kSdmU7zdT31f4ufKEjTwBDM17gNOVpnAej/jXvoa6k/h8LixjPVpK9PhfA07o5m5MmAQ+TKXaVF0D5zZe7UQFvnRG2GzCQGpbv4qiZztxkWDRL+aMdsgECe5SwDzou4aPmiDInG8JClgIMMJ8UUG5PGwEzUccus78qV0YK/WQaJ+J+TIKrkdcQsAIjIRo03l7ZJ+Vfl69CK0ty0T+CT1fXzJ/6/ypV3VWwr9ep9eE1OdS/2dlBBNA6H6js/NgGFv4W/T2irdlfDhCwjTQphy3q07IW1/R9uP85njcCgpVDfEG8Beg3LPuesL/yZh+l4EMPd2cRtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=888AbVcLWgq8mkVVWIXKELCnnYxkecPSD9zg8cwMB9Y=;
 b=KUZw3gqqFfQaA7YqGLzlU2MTPolm9ZC4UBSOkoZVZDXFVdZngf3nEU+X7Uh7je8wgeHXjdwTywFKgv/I/VcIXYD9duUzKykW2EBUlIG9UaKCAeF95gTjTAXS6J40rX6McvDy7PziuVQAS+7E/rwHS5I1nyBJXffbCoIwvPcvGrw=
Received: from AM0PR02CA0112.eurprd02.prod.outlook.com (2603:10a6:20b:28c::9)
 by AS4PR02MB8503.eurprd02.prod.outlook.com (2603:10a6:20b:582::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 20:55:46 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:20b:28c:cafe::db) by AM0PR02CA0112.outlook.office365.com
 (2603:10a6:20b:28c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 20:55:45 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:44 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 21:55:43 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 21:55:43 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id D57DAF686
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 21:55:43 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6KthRQ4037585
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 21:55:43 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6Kthgv4037584
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 21:55:43 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 0/9] Improvements for devtool/recipetool
Date: Wed, 6 Dec 2023 21:55:22 +0100
Message-ID: <20231206205531.4037549-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000041:EE_|AS4PR02MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dc9414-9234-4451-776c-08dbf69db805
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lucuIBLD6vSUmBES6u/bx8Vlj2Q+01FiT65M/blBMOqyaQd0248YPrDI+8rQumR+9X2s79EPVEk0kuwWfxqWilxRo8HG89ROfX/A1yEYunSRZu0Jv7Oi57KuHVnZxZaMP64/7AP6sky5p2s00bKPUumYCXp2QhOCSWSawHhrBvk0rVvAJBnnMCPHwGO5tEy8BlM9EvQ8ltq2a9e25+M2Jz4cvsaVg5boWYIHnBc5SnYzDawEPSLQ049khdFtWWeJz9uhlUsNKlekFu9t3Q0Q/op8/H5hBkhQVPM81tLvEgmjnLYRvr3ISjkoL0NjFUVcSH4xZwnijd7AxJHyXcwxwgtTx5qjeMKtNqHaHKFvCusqz9vD4U0Ucj4c21ORj0QSb22tbgbkffnOwlL+OumtlSwLyCt5rFbgsXTWUc9vM6wtukCVt6NQsBNdceZW13dxAQG3cDIozkkBN+4SYP19uMGRbcCBZKHFCH0udF839TnztVg/P0uMFlPnm3haLwfF2WGuL5BoY+StZ+kM94LvCVOXrIrdo5QloKVxtxVwPgQsJU115QMjWeNxTyX+jV7/LRPqa2Y0yYYgkvAHV4Y59g7o37lqi+XXmQDjXNDjIoNOuAb0F+ToJwvpvouaLltN744PH9RaJsh4x13ordR/dBD093gkDGlP9nuoyBoWXcno3ozZyCptKhrO4+bFJFm+6dJA07lw4JKU342UzUnhPPaMdla66SSa/lxymfjEXRg4qUX0JqErfQkoWyBQmLIE8+V7EjSr1IEzeWLU0mz6TQ==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(346002)(136003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(40470700004)(46966006)(36840700001)(40460700003)(2616005)(26005)(1076003)(336012)(426003)(6666004)(82740400003)(83380400001)(8676002)(5660300002)(8936002)(478600001)(42186006)(6916009)(316002)(70206006)(70586007)(356005)(36860700001)(81166007)(47076005)(2906002)(41300700001)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 20:55:45.4783
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dc9414-9234-4451-776c-08dbf69db805
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8503
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 20:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191926

The recent Yocto Project Summit and the devtool hands-on class triggered
a couple of questions for me, and when I investigated them, I stumbled
upon a number of problems. This series of patches solves them.

The first four patches are needed for me to be able to execute the
devtool and recipetool selftests in our environment. The next four
patches improve the identification of the license(s) used by a recipe,
and makes the SRC_URI checksums used by devtool and recipetool
consistent. Finally, there is a patch to make `devtool --no-extract`
work again (it regressed with the recent devtool changes that improved
git submodule support).

[PATCHv2] Update the commit message for patch 8/9 to make it clear(er)
that md5sum is still being removed when updating recipes.

//Peter

Peter Kjellerstedt (9):
  oeqa/selftest/devtool: Correct git clone of local repository
  oeqa/selftest/devtool: Avoid global Git hooks when amending a patch
  oeqa/selftest/devtool: Make test_devtool_load_plugin more resilient
  oeqa/selftest/recipetool: Make test_recipetool_load_plugin more
    resilient
  lib/oe/recipeutils: Avoid wrapping any SRC_URI[sha*sum] variables
  recipetool: create: Improve identification of licenses
  recipetool: create: Only include the expected SRC_URI checksums
  devtool: upgrade: Update all existing checksums for the SRC_URI
  devtool: modify: Make --no-extract work again

 .../devtool/devtool-upgrade-test3_1.5.3.bb    | 16 ++++
 .../devtool-upgrade-test3_1.5.3.bb.upgraded   | 15 +++
 .../devtool/devtool-upgrade-test4_1.5.3.bb    | 22 +++++
 .../devtool-upgrade-test4_1.5.3.bb.upgraded   | 19 ++++
 meta/lib/oe/recipeutils.py                    |  2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 77 +++++++++++++--
 meta/lib/oeqa/selftest/cases/recipetool.py    | 44 ++++-----
 scripts/lib/devtool/standard.py               |  3 +-
 scripts/lib/devtool/upgrade.py                | 51 +++++-----
 scripts/lib/recipetool/create.py              | 95 ++++++++++---------
 10 files changed, 241 insertions(+), 103 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
3_1.5.3.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
3_1.5.3.bb.upgraded
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
4_1.5.3.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade-test=
4_1.5.3.bb.upgraded


