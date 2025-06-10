Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DCFC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 15:25:17 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.1])
 by mx.groups.io with SMTP id smtpd.web11.89533.1749569109426007997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jun 2025 08:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=lAUEIsJK;
 spf=pass (domain: ericsson.com, ip: 52.101.66.1, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwOOHiW0jfFXPX8Txu6m/wGzLaAIYWDo/DfWQ+Jeft4AWpeor3PgBc74P7BmsEnUKZE1x+3Jz7xiheWaZL69mswDmw5XUM9lVWKyImkEwI29EiRnRbNxbRKx5eDNthsRKLSA/Nt7/4l8SzgmUFWuLUPFVIDJozLLh8MdSG0zI/PivkxK4JWzGF3eiK3BaVaULvNCESSbAokD/MEkyK0nos+BALnM035h7rOBl+TH4ocM6JltGhIPLwbga4qEEbakz2E6QRhW4Gccuv3hyOuJezb7jR9e/1H9h9OlfBTMhO0gjK5yf9Lt+Awm0Pdcg0t08DElkulenE6CwowAkoVD1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJEX6/nVqV4LVk2ods1TQGXt5Y7c8qo8/4BJ9qE9sLc=;
 b=Frsfhyl7ef/yP3VBoFYY9aS+Qc36wcRysRiuHssUoB92psWYEqIKbfsf213g/BkjQzNEcplehFK7dMcD1X34heH8jWaM415ZM3fN9RS2IWhv8HuFPzxr4ZUNlPO7mGPnOGQmKjRux1/Vrgz4xHwyG08DmYwsDB6osspby8epx7gsU4MWTP6oCTLcl+ub5jFfBHBsFkSAen2lJKJ7BKBw1RJNNOitp9GRaIf3+7hdv5nAGriHjwd1H4Nrbn3bfhBw1rzpzAxT/2K4KuALnrRNfLJipdwmnoECIsCfNufSoJTas1dQFvdOx9xu4bQoFHlQ9Uw+vrkvBla0HlT/7LC7cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=cherry.de smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJEX6/nVqV4LVk2ods1TQGXt5Y7c8qo8/4BJ9qE9sLc=;
 b=lAUEIsJK2evuOZiLjI6n1gqM5CCt5+cr+1U5Hvu/8yaEDc1nZuho3HpqdkjVQzYJagBsjOh+d0flFx1Cog5a/ogiWR/DG9jrgZqZnwrQSjDzJA3pGt4BvEryimLkRKxxca/+Z1dJGMNt63IKtqHzT1RAZLlO/2JgwlTYWJ0zVa8SinPDhYJvvj8oW3kyb4qvlmxeVQzrwXETXMkolZhZikTZAOU8WBzHThpNzeVDdYaTKTnQzV7xCa30+aOCVA4VhD+UsjSNCgl7htpJJE/gpGiBS2UYLgDMaouN4t7556dVgz1Weu5Yg0E+Yp7wfA6MLnj3cl4y/cRcZJuZWs9CWA==
Received: from DO0P289CA0005.QATP289.PROD.OUTLOOK.COM (2603:1096:790:20::20)
 by DU0PR07MB8995.eurprd07.prod.outlook.com (2603:10a6:10:40d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Tue, 10 Jun
 2025 15:25:06 +0000
Received: from AM2PEPF0001C70B.eurprd05.prod.outlook.com
 (2603:1096:790:20:cafe::53) by DO0P289CA0005.outlook.office365.com
 (2603:1096:790:20::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.17 via Frontend Transport; Tue,
 10 Jun 2025 15:25:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF0001C70B.mail.protection.outlook.com (10.167.16.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.15 via Frontend Transport; Tue, 10 Jun 2025 15:25:03 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 10 Jun 2025 17:24:56 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 08CCF4020B54;
	Tue, 10 Jun 2025 17:24:55 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id E67957083F54; Tue, 10 Jun 2025 17:24:55 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>, Peter Marko
	<peter.marko@siemens.com>, Marta Rybczynska <rybczynska@gmail.com>, "Joshua
 Watt" <JPEWhacker@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v8 0/3] Check compiled files to filter kernel CVEs
Date: Tue, 10 Jun 2025 17:24:40 +0200
Message-ID: <20250610152443.2162164-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70B:EE_|DU0PR07MB8995:EE_
X-MS-Office365-Filtering-Correlation-Id: 514655a0-307d-4c87-0ae7-08dda832f93c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bXgiMq+3dDQMjhAg4Uvc4UXYfB/spZq+xrY2Zzy/e0weBq6tURQnlwbQHCH0?=
 =?us-ascii?Q?UBETdiY0MTxvYL6wLdX3vrK16guPWZhCeRDgwDvE6uR6Tfsq2rkoB2kkffyW?=
 =?us-ascii?Q?MOF4HarFDSWZ60G6DFSQJHBP9SgcfAFbu4JShZaXs5yoa3ZxlQixJ0iID/pl?=
 =?us-ascii?Q?RnxyIX5jAL94rk3WrK4yA3pcP/gDhjgVA8hdoDxGZIWcxqZOEJ/0JdDSu4p+?=
 =?us-ascii?Q?t0VtINgK5yU+6krlL242YJWCaZ/HyS3JAvIIcCb9W71rxrLdk+KfbU+H1MSF?=
 =?us-ascii?Q?jYTolq0tWp34yHDW4W3OLb9nzyLBzLWeqF8x2q77EEQf+UoCF8OmA2LAsiOu?=
 =?us-ascii?Q?FxLTB2y6CyCm/K9Koq1QJZGPk44c4EQ8eujIIEp+y4D4AWQKREPd9uOXwEvr?=
 =?us-ascii?Q?Roan57rnCH2rLYOkJK8Qj6KGb1Le0/8I9nGGYFSmhD1+bn0PMFurUF4IUbdW?=
 =?us-ascii?Q?kzn7TK1oGbGCt9jcWV5e/VicZ0gXZ7wAnTVAYwLl5OS9R2PSS6y7zuJOxdRW?=
 =?us-ascii?Q?eR4mKesRlPD/bGrIUhSRiiVvUJmW1OC7pzumMbAvrDKrBhFNXw80OvDsFion?=
 =?us-ascii?Q?Gm/ENLsvlVAxxgzLh8KFd42k1ssqaEsE13/1/Hi5dC1K2/vv5c8RSIIDn0SO?=
 =?us-ascii?Q?7UefLwntP9EHzk7xXXrSuspF17CRWFrRSiqw+qrEG0eJ/EaMgr4rJFyk/uoJ?=
 =?us-ascii?Q?CH1k4hL01FFF2pT63aOrTr3lbqh1bWiYDU458DwZWsTR0Ql9gjZhk7ox74vA?=
 =?us-ascii?Q?cDD4fcjICALKLZ69+RobDh1rt824eUirwSE3ULv41Eyy/F3GDQlC37DaYTKL?=
 =?us-ascii?Q?ApgM32M0IsQk1fyNaO+pu/114WjccUxdQtu8jezsun7W1xcmqIpQkfeNBtMI?=
 =?us-ascii?Q?/bbxrLL8igbzDjx0cnT9j3lum5Be5zC68dCGISZCwd9wyUAl7BAjuATZ2Lvb?=
 =?us-ascii?Q?k+EX+NvFDlKuaF/jwAzGbwQODDlM9fs64ByISOhnb7gByhCwMQ/UelDFxf6/?=
 =?us-ascii?Q?kxgnLNLq7dbB/mxffHSQom4Bk0GpmRH+CU7xMBDB3PbZENEdzOGjy94TMce1?=
 =?us-ascii?Q?TrckzANrFZkT+sGS3HVacssNMGShfME2dXpDLh9KB7caBULCbrvS44jxlsiJ?=
 =?us-ascii?Q?XrAZHt2MRuX8y0geYJJMrdeRrIwoYYD5NG1k7CJz8fT5uXZD9k4BnOurn36T?=
 =?us-ascii?Q?1mrRFtaMEhvl/MGmoxJW+DDpl4wCZcFxWxlCo3SdDvhlBFrR8LrlW4wZrtk5?=
 =?us-ascii?Q?Sdy4vBnYtcLqPJkIBwlCEB4HIon9816Qkv6BULRLJwU6mljIuqdlG8ALJEHE?=
 =?us-ascii?Q?ijYUo+uWwy3W8mEzLmP2kOnrIBPr6B3dC6HiN+KYWxZbH7rsLI84sRoWo1hO?=
 =?us-ascii?Q?7584LUPrd7i7j2G39sDrP13VQRUV+L96r+OtWIqNcNHXwqFOaWgxqbgGesyH?=
 =?us-ascii?Q?jQoMvNt7BmibqEp9YipmNGCARf3wfdhNxMmhn0lWp+dIx4mU2J6QtwPGzK4o?=
 =?us-ascii?Q?upa8965a7gffk+94Bk7AMtOCAourjAA5xNId?=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 15:25:03.9102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 514655a0-307d-4c87-0ae7-08dda832f93c
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF0001C70B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8995
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jun 2025 15:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218364

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
v6:
 - Export debug sources as compressed json in pkgdata
 - CVE script is kept intact
v7:
 - Only updated do_package to include better description and add function i=
n bitbake.conf for better sstate utilizationv8:
 - Simply "magic" and align what spdx_common.py is generating. Addressed Jo=
shua comments converting arrays to sets
 - Modify CVE script to use sets for the list of files

CC: Peter Marko <peter.marko@siemens.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
CC: Joshua Watt <JPEWhacker@gmail.com>
CC: Quentin Schulz <quentin.schulz@cherry.de>

Daniel Turull

Daniel Turull (3):
  package: export debugsources in PKGDESTWORK as json
  spdx: add option to include only compiled sources
  improve_kernel_cve_report: add script for postprocesing of kernel CVE
    data

 meta/classes/create-spdx-2.2.bbclass         |   9 +
 meta/classes/spdx-common.bbclass             |   3 +
 meta/conf/bitbake.conf                       |   2 +
 meta/lib/oe/package.py                       |  46 ++
 meta/lib/oe/spdx30_tasks.py                  |  10 +
 meta/lib/oe/spdx_common.py                   |  41 ++
 scripts/contrib/improve_kernel_cve_report.py | 467 +++++++++++++++++++
 7 files changed, 578 insertions(+)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py


