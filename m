Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586E8C10F09
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 19:22:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web11.41992.1701890556623347917
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 11:22:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=A1oUDyHJ;
 spf=pass (domain: axis.com, ip: 40.107.20.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZozAyOUWjb6FnfAac0eMI1epKHfo+8P1Oz9MwE2Qqh0q+XoFtEVnlT6/lI4HUzm8bpTgH7quz2RNhEq/P+Ix0Qssj+cEib2u4/cFk4wqeNZGETZFHTmEM4PelIdSg8m8G89hiohG4doays6IBdXhx9m/9RhFuxq54cHYEmdf3gzIndWDrMsbH6MkfXNxjouQqpDaDh15p1bSIkG5aO/JO8qQSo7N+CXDv2eoB42FoJ+h1yI2xsIrahuiCg4Kng5j1emENSgwgBaaX4ZcQkHtZIIzl6IInUr3wu5cfUx/rmxRGlwm/ZjetJGHU3lXFPHJsemrADm/9x3DXuHj7krNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gW1NnlJ7uU/+duz37OeHq1K9LWtjaT2TTnqmBQUPTlw=;
 b=VerBKOyWOqL35tkjgBrN9zoU1LkcTsijqchvxfuScs8h/WoVcIBCvjZFWjbmwkTj871CACe9fGTZPFAlDoZ9LJGaL5NiKaU87LbDhwwgJxnX6Z7Zlky1QXHd8AGS60Jr5KtPLmgN2gDgR+hH+sdRfwgZnwTaCxn8chcStsoeaLoggLAG/81Xp8FHR9bvaK/rkzyZsNZF7wBgS5OvfWAItO96+cjMCy9JEZ/MnO2wc3H/975aD73s+R/iWLV5mjXfLYSd0UO5oUgQ479M1NZpxRxLd6mOp8zp2DXTFWy/FB+duiOtT4tTVtio59SxL9245hnZ2GDzSieHy0ZXelLSRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gW1NnlJ7uU/+duz37OeHq1K9LWtjaT2TTnqmBQUPTlw=;
 b=A1oUDyHJrw+552SipYHRJ4HrYYBP8BvwrWAab1s5rTZ5+fzZXt+uEn2esZPrR3Irt9gfEIR0zBTKgSxjZR8SBzIYYblbF0eJouo9uKoRGh7G6wSF9eZNd476fX18uu0pOxxawMjPux3s8NTNL/o9ICrsHomCDZBVjh/DGDRvn9g=
Received: from DB7PR02CA0020.eurprd02.prod.outlook.com (2603:10a6:10:52::33)
 by DBAPR02MB6136.eurprd02.prod.outlook.com (2603:10a6:10:184::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 19:22:33 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::da) by DB7PR02CA0020.outlook.office365.com
 (2603:10a6:10:52::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 19:22:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 19:22:32 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 6 Dec
 2023 20:22:32 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 6 Dec 2023 20:22:32 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 40FB9F5C4
	for <openembedded-core@lists.openembedded.org>; Wed,  6 Dec 2023 20:22:32 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 3B6JMWKW2838169
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 6 Dec 2023 20:22:32 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 3B6JMVU52838168
	for openembedded-core@lists.openembedded.org; Wed, 6 Dec 2023 20:22:31 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 0/9] Improvements for devtool/recipetool
Date: Wed, 6 Dec 2023 20:21:58 +0100
Message-ID: <20231206192207.2838077-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B621:EE_|DBAPR02MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 66f4c4c2-efad-4fa0-1191-08dbf690b248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	80Lb9vTocHRn67OgSqUGfVBitBm75ksv71hQhsWFtNJiNhHZm7OkFOcWPpFYpIbWlt7xxfXDKBmpMkaQD0c9sAWY5ydFOCc+m4ItC/G8YAowptOjgcRWy7J3YDRn/vNEKCdbuFwH7PdV41J2C+65KQe7GHiWynD3HEF70muDPScALQPaWQiFwZxAoshrC6k7sPWGlJKxIp2rpo44jmaOgWj+aW9QO3kuEJ5ExiOn47oDWjaSscr9dY5MYrQmvQOULN563Y3ASBRqpQszhTjGyBo/LBc0lQT49DmT6ZtU4+40LiPKC5un8LwKhVkx5O2XXmmPFfD8SNaoqeMl50fKbfLZpsjwTVNhfQvvkUptLVC0pkuU4w9bMrMo40TCnmXbZ6SStfjAyksn0eRaFXJLz2r+R7/VKofn04NmtuaYlDkdNNHXh2uRBC98lFURSzeqMctDHmQrlV8RDDYvlnijtGY+El/dd3DPVh35H2cebJPGyPxZ26IzB7p2yP/h57XvvgkfeW5QqBJnsQieEOcQieH9C2COu6d5sNKZTKBvkUFgjenLcVS5y5HL7hlOyi5Ompcsf/g3FhtN747s7JWCfO9WiO/SIoomtfEpvlhF4snexe+jkUDSacD4JJn5Km1i2WTozl0qCLNoWXkABlQ8AuUrSjpI8omsstPn3Q9p2L3n1NdH9LdH6vY1V/LS8SvcVUkqaOT28gmZbP8xuhZhbrf0xB3KiTr9j36upeLQZMFuwa2YfRBoEbemh8+krftQjE0TyvCGjtsKHqEOjRU2Fw==
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(346002)(376002)(136003)(396003)(230922051799003)(451199024)(1800799012)(186009)(82310400011)(64100799003)(36840700001)(40470700004)(46966006)(41300700001)(36756003)(2906002)(40460700003)(5660300002)(2616005)(26005)(1076003)(40480700001)(82740400003)(83380400001)(6666004)(336012)(426003)(478600001)(47076005)(81166007)(356005)(36860700001)(8676002)(8936002)(42186006)(70206006)(316002)(70586007)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 19:22:32.9223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66f4c4c2-efad-4fa0-1191-08dbf690b248
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR02MB6136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 19:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191909

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


