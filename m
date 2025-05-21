Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B291DC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 13:44:38 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.87])
 by mx.groups.io with SMTP id smtpd.web10.11342.1747835070477980601
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 06:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=NsMrMGBw;
 spf=pass (domain: ericsson.com, ip: 40.107.104.87, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ru35MgQ0qwJzeDV9AyvlnL1TQ6oUciHXpnylSB39KB/Z82fPkn6iDv9PojuSBemicft3jWWghsx2ZcJ/mZCJu/ZP4VvbaPjih/Tti+rQLjVvD5OYF3OqR8+xiAknv8tOYj0fff0lziKamqqh7niW3LM9Jxi6SKrDlrJpRybw2wUZLunj3LBCRAQCYQdQBoX0vvDRDkNsFxIKRA/6YY2vMXpeAHP0KnCOxZRe9y0EA9vhW997s3MySyz9+F/LvrQ2JXc9tFQ2LNOh7CWF31+dqBcZqZ7iYYIWGYVoB2q4aGX4qJAcSVnw5TwnoWQWQBYMjW/fhrvrZIp9imvRnrE2Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tzD4VNnHbbjS2CfyAwZrTozRSwO+gKvY1kJtj3yvBkM=;
 b=Gq1cz0m+W1SATjBtHbd2xWYPJ6tviNL4LYSj74SHzTSsUXDwViFAhcr4TMvhc6Kg9SQdO59U6MMi7uS+Dx32H7h34Hn0ieOO1mBcFwcpd17FVG8WknBjqGzKR3n7xqR0rye2caMmPofkKa4ew9eBimBpiMqnqqDu4lDXHUzLTxx32+vY0PKSlIdRztKB4gsJT1oGtE8jj5PIg32/dxIsHDUaWivYQPX8g/e/S+z/zti+kpYk155GaH2KwunbV0WnBAI/nJJi73GbOvIVMIcnYcvGVX5alwrsgP3qXC4wjyd2r7e2r6yj8EDdPzE9/Ip0NF7kQ3hF8pTj177WyykJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=cherry.de smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tzD4VNnHbbjS2CfyAwZrTozRSwO+gKvY1kJtj3yvBkM=;
 b=NsMrMGBwiPKCP+IOG63wUjh/AWXBIkad0x/NK1kFQjvnwxBXOCIAzsZly7dTv2Ico01xLgT3W2aBCLIMQ1wwOAw6eJAKk9xdE6MaiSS6ZaaUJvf/muUT/+l1pyhZP5r81c4lzLlDKgInzgZ1ivO4II3eiEG0eDTxDCNTepN9IsjsrykHA3wwEm8tF1uJJKF9gAXa6fEzJc8vd9uWn+WLyt+JfikMH108zmT4+RoauWizHyLdNN3SUU9YQux3YpDTUr/3ZjJ7gc2bHVjW8Mm9ORmeFPPBw2mDpwpiVpy/37FDJuCL4e9ukW8ewn+2QJrqaL4FAU1UNKBzq9mfWLmiBQ==
Received: from AM0PR06CA0123.eurprd06.prod.outlook.com (2603:10a6:208:ab::28)
 by AS4PR07MB8460.eurprd07.prod.outlook.com (2603:10a6:20b:4e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 13:44:25 +0000
Received: from AM3PEPF0000A797.eurprd04.prod.outlook.com
 (2603:10a6:208:ab:cafe::f) by AM0PR06CA0123.outlook.office365.com
 (2603:10a6:208:ab::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.28 via Frontend Transport; Wed,
 21 May 2025 13:44:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM3PEPF0000A797.mail.protection.outlook.com (10.167.16.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.18 via Frontend Transport; Wed, 21 May 2025 13:44:24 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 21 May 2025 15:44:23 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 56970AAB10;
	Wed, 21 May 2025 15:44:14 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 4261170B5B03; Wed, 21 May 2025 15:44:14 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Peter Marko
	<peter.marko@siemens.com>, Marta Rybczynska <rybczynska@gmail.com>, "Joshua
 Watt" <JPEWhacker@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v5 0/3] Check compiled files to filter kernel CVEs
Date: Wed, 21 May 2025 15:43:57 +0200
Message-ID: <20250521134400.1733473-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A797:EE_|AS4PR07MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: bbaad12b-726c-497d-0298-08dd986d996b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sClYGweeW4QcTX7no/Li6t7pnPLdxY4A/iHT1QAC7FJuxDBuzTi9yy0HbTyW?=
 =?us-ascii?Q?hHhPj0MZmKGgV2xN6LL15IKTgkj+Bty7uxx9DtwIivuow5l/ElXu0O/pLaQi?=
 =?us-ascii?Q?nMSv5W52GPy/auQCP9xz7gDGTKE2ty7/CsflkcTVXWby+mgh5e24FuZS9vtK?=
 =?us-ascii?Q?8p3ttgbQNDdXpidKZmO2+xij/9BcAQm9FFlocRpU/+SXXiO7URfb/w3XqHG8?=
 =?us-ascii?Q?xOCvFwn7Cfv+/YNGz+EEX+W/U1nnQ7lwGU74EwfimW+L330Uh/lODP7vYbOO?=
 =?us-ascii?Q?7zgAShyNzy1j21Yjq44oh8XC2eo70vRFa6sDzyLEQ29calfVlPl5I+KmEQMJ?=
 =?us-ascii?Q?VgZ728zxhzrF1gHP31vOV7fp004J3eKW18swJ7DYaC/tu2RVv79wdBTXZYGb?=
 =?us-ascii?Q?rhMXQwWp+thxXKlvwAvtTk1jFWkSkkX0AejdvcbzAeowvYTv0ANKHrMYoeQt?=
 =?us-ascii?Q?nURDdVRG9W9SdEa4uEWEnNuwdXzJnGCWAVSQs/t0fmd2VUkLxrWdXylQ8PC+?=
 =?us-ascii?Q?LCxpIcUHbkDKddCdwKHxFmtAtSmF5L1Vnj2u0UUjqWGboB0zM3xOsJbyH5w7?=
 =?us-ascii?Q?1c2rYnRHoDEBfZledDe/UF2rpP2h5TCMHhUEMnkwJSXaNVaeAENDMUF4pYTa?=
 =?us-ascii?Q?V1dSzTSvjUKD/0rWoMz3zDeuXHHA9yoJ9WnGhgF3EgKdWCKwO6E6lucOn8MA?=
 =?us-ascii?Q?uwf/EFWuWFipH9EjNyl/R+5+io28p8jqpavTGDYTPjCKMzsnTxfzSvWGtAQT?=
 =?us-ascii?Q?JrTPTXO9KFttc6I1ddJQXE6mS0tb0M48AfLBEHvb2R1oWVsr54pjYQ4HYrCd?=
 =?us-ascii?Q?Dy1cIKrX4Izzo39qgUJr4utmWFSczs03PE+hUcy0euCYM5JnN92HMMOavbvi?=
 =?us-ascii?Q?L90xW5zcf8obM6LqA+UgD1P2Lygz8kQRTEYZ1uZy5GSxARygUedKwamSOQIS?=
 =?us-ascii?Q?91YGCICD51ieoLQk7prpxTs0tROfj9XD6h2d29izWtCy9hb53PIl8JWn9NG1?=
 =?us-ascii?Q?xwpnKnSgKmjcM2NkzJl1/Jkun776exUtpkys2r079bwUq9pEOCf4Z7qrOaU0?=
 =?us-ascii?Q?iLXQFBzHDrrTwA7Yqluapvj5ew7fxu6rgWH400Mg837acsaEEH1vXcMFRF9e?=
 =?us-ascii?Q?zKZuajC4oZ5NyySWl9iG7S4ze2Qt0seHe05lRTCL2TBC6XGGWtWb1zXp8Tgz?=
 =?us-ascii?Q?X91bhh8eTHSp65v6vk9TPpHDU5/Curik2Pa2erlboPicgDO1kNLvTuW9OBWU?=
 =?us-ascii?Q?WVXBYOr8JjClWi542EJrdQ/Fw0WZP4oQtrkH7OZPZoq4QJlva7quOd2HsHlX?=
 =?us-ascii?Q?hlVAwhA/lMUX2tXa7XK1iLMwa1Mu0gWczqMJRDC1y276j4QujEuDNl7eRJmi?=
 =?us-ascii?Q?ZTF6zNUbzzG2hUd3aDjvsNAJ57eMeDiINlSufrdW5qnnxUZiYBDxs43sahS/?=
 =?us-ascii?Q?2Fz+lA1A/4b0wdypMh3v/mTI5g75s3tfvu/F1GcCBMxkaGHm6YNURuIyaxph?=
 =?us-ascii?Q?Ay4ZiUkmzYKsc1ue+z8qWjsxT/Nh5eXRKKlV?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 13:44:24.8229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaad12b-726c-497d-0298-08dd986d996b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A797.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR07MB8460
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:44:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217024

From: Daniel Turull <daniel.turull@ericsson.com>

Since kernel.org became a CNA, more information is available in the publish=
ed CVEs, including details about which files are affected by a given CVE.

I have rewritten the original patch after the feedback received, including =
only the basic functionality in the build (extracting the sources as a text=
 file and inside spdx) and created a postprocessing script that enrich the =
cve-summary.

To filter out CVEs that are not applicable, we extract the files used durin=
g the kernel compilation and
compare it with the metadata in the CVE.

To enabled, add in your local.conf SPDX_INCLUDE_COMPILED_SOURCES. It will g=
enerated spdx files with only the used sources.
If only the kernel is wanted use in your local.conf: SPDX_INCLUDE_COMPILED_=
SOURCES:pn-linux-yocto =3D "1".

This could use as a base to run the vulnerability check independently and r=
un an external tool to filter the CVEs.

v1: initial proposal
v2:
  - rewrite kernel_vulns to fetch similarly as cve-update-db-native
  - add functionality into cve_check.py, for the classes that uses oe.get_p=
atched_cves function
  - add linux-vulns into the cve-check results
  - add only compiled files in the spdx, so the check can be done outside t=
he build
  - include compiled files into spdx when CVE_CHECK_KERNEL_CONFIG and SPDX_=
INCLUDE_SOURCES is enabled
v3:
  - make inclusion of compiled files generic for SPDX, so other systems tha=
t has knowledge of used files can also make more accurate sboms
  - have the functions to extract files in kernel.bbclass. For other recipe=
s that in the future want to use this feature can add the function in their=
 recipe or in a build bbclass.
  - move order of patches
  - explicitly have the save_compiled_files added only when having the CVE_=
CHECK_KERNEL_CONFIG
  - add first kernel cves in cve_check, so manual CVE_STATUS is preserved
  - add CVE_STATUS for false positives
v4:
 - Refactor and reduce series to 3 patches, one for spdx, one for the kerne=
l, and one standalone script
v5:
 - Use debug information from do_package to extract compiled files
 - Read spdx file from the kernel in the script to process files

CC: Peter Marko <peter.marko@siemens.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>

Daniel Turull

Daniel Turull (3):
  package: change location of debugsources to PKGDESTWORK
  spdx: add option to include only compiled sources
  improve_kernel_cve_report: add script for postprocesing of kernel CVE
    data

 meta/classes/create-spdx-2.2.bbclass         |   9 +
 meta/classes/spdx-common.bbclass             |   3 +
 meta/lib/oe/package.py                       |   5 +-
 meta/lib/oe/spdx30_tasks.py                  |  10 +
 meta/lib/oe/spdx_common.py                   |  49 ++
 scripts/contrib/improve_kernel_cve_report.py | 467 +++++++++++++++++++
 6 files changed, 542 insertions(+), 1 deletion(-)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py


