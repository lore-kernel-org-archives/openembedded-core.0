Return-Path: <Suresh.HA@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A386D29C2D
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 13:32:01 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35113.1768829510193175185
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 05:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=PqPBOHUq;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.18, mailfrom: suresh.ha@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPU3FXzhH4QKCayOeqJr8mlw62JCnnNPirqr8sqR5atDq1WHWXO5+sy2h8op7vTTz6iLnI46s/XDbzY/nAxswJ1gjvV/1mvJfBDtxXzMibnsuOZMdVR+OPP+eJ79rGU39DwAfLMPOK3Lhzpxi36dllQnte4gTV8vie/Uj23enyEmICsKbWhEIOjQsPAUG2HslmB5zIFmBxSTcyU44pIfHQZVuxhjTXEO8s0K6b92IckIBnQIOS0NQB/Ihada35FpZhTJg5SmqiU6UbzdAUIaTWf2oMAbFv+0EkyZLrTvGLrYFaLzDfvCzO+55JFUlNRIY+gFCJvnWGrpxGE7e9VNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfLEjJNRA+Yz48whC0oZ0a4qVAKAG80c1tu+bkbVFO4=;
 b=i9s1VE+dMJ0h6AXP7/6Sl/8csj2rVjUzYESREjdskYTU40igvB4qLPu5LTCBNLG326IVidZNXhmFHS8ypHWnoUWCCApvvZGWytYf94LGhjG706U8LhghjBpjDKDy0dZll+aP6cZQF5kZkr67zvxgLg0iWsiqM06ZGIXhja25uBnvGwt+jASNSdNjcIaS5V0vboF4jSOP0ZaF9lBwJNp1Ll5fMvab1m0TnKLD1JSZ9QQxrxnFYp5M+RFOIPS5NIDKWhnN4oHOpygzr+svse9FFYScd1AzlsFrdk42eXW3tASpGqVHnZ6zTt6S7CSCTfcNyUxhiPUtUEOVb8qJQBuzhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfLEjJNRA+Yz48whC0oZ0a4qVAKAG80c1tu+bkbVFO4=;
 b=PqPBOHUqsvE5QVji0MKYW03v+oFaReYd8/cQlswh3y1ZIZCw90q6Emcs4oAraIL9Iadrb8FYBYAJcchCuDeR0HJFpKtGGZZ4ofrUxLy2MnDlIuUhwtE0ZP+wIfe+2aUlwj+Vby5GGOUlf6sGP0L0Hvaf3YLCnetllrmPM1OnxjLPleqF+OxTzfWCAY8op2pDWX2WyPVqSSG1Kgb0DJCqVoBKncwobVA5GhglsZ+ttN+NXOUPbg4r0kSuq+CfwBL1bkz2TNT7wkbigeCuBGgcDknFoEllU159wLTZ6svHivJz2z194jpACi7hWKPkgYduwY6i7WLOIsX/edIWakJecw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15e::13)
 by MA0P287MB0897.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:108::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.7; Mon, 19 Jan
 2026 13:31:41 +0000
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::7264:345e:328b:b469]) by MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::7264:345e:328b:b469%5]) with mapi id 15.20.9542.007; Mon, 19 Jan 2026
 13:31:41 +0000
From: Suresh H A <suresh.ha@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	suresh.ha@bmwtechworks.in
CC: Daniel Turull <daniel.turull@ericsson.com>,
	Peter Marko <peter.marko@siemens.com>,
	Marta Rybczynska <rybczynska@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [poky][scarthgap][PATCH] improve_kernel_cve_report: add script for postprocesing of kernel CVE data
Date: Mon, 19 Jan 2026 19:01:03 +0530
Message-ID: <20260119133103.1151201-1-suresh.ha@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:269::6) To MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:15e::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXP287MB4240:EE_|MA0P287MB0897:EE_
X-MS-Office365-Filtering-Correlation-Id: dd87cc08-dfad-491b-4c5b-08de575f1452
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XhOpDkR+fn6RuWG3h9JQX49WTTeilDRVN6faNVhgjn0yNmMKBcCgKnV5Mrhh?=
 =?us-ascii?Q?K1UjFI0cg6iy+vU0Yq/iwW4ZP3SDE8K/WpKvGCD5Vyi/nM3pYUZRkRvezPJG?=
 =?us-ascii?Q?aVA/EZ42YzZbnsGbmwWQb5QcekL8aeJs9zDMfK/jVE3ilVcidX5XlDj0L/hg?=
 =?us-ascii?Q?7mSp3P8eKXViCRsbRXVTdypeQuVofOmF21hXrRNUt5LX1dpPX54hdL4B3nOd?=
 =?us-ascii?Q?pslN/0OTqB92r3496eobMVwwv97k55DoYu9B38BAZf2eOWA/0gRSW1BwLwEd?=
 =?us-ascii?Q?k/s909OfRkAC/fB0ikBFFomAVQVTOOOHLQ6PVr9+HynYN1x3slj0dbUGrjKH?=
 =?us-ascii?Q?kLqxaJkqbMatLxUXIAioFtvIrHkJz69vws3Lna8IbbvzWEm18WsmIyb2rEqu?=
 =?us-ascii?Q?m+k+UScn2Zzi+Goa+KWSilbOqDfs04qV+MFD+vgSTiT5U+cJ8ZOGOTjYejz6?=
 =?us-ascii?Q?BNWylqTGN0xs12hrMy+RgF+GCYp/Uqagmg1fcSXaVBc2kj45z9/lDLrCNOSH?=
 =?us-ascii?Q?N4xfxdjU/5pFeU3bXwkWR/C/tNItJKFYDdv8ULPNx+q0yOypFGxIhIJTy+GG?=
 =?us-ascii?Q?Hcn5uFnVUJhPSZVVwcdPzgLUWBx7foNLjcOtT5qI0Xsi4t5lwy+wanW7eg1V?=
 =?us-ascii?Q?CxMEcqv463FDp8Y1SC/Jyf3lKqKn+d/LJzCqfIH5M/8cdfM5f8v70bOmiyQl?=
 =?us-ascii?Q?4xt43YZQuCuKzSNcUqGXWzKxdktZyBe1jfQhAnPB1PXQhZ6XxSI/dy/6y2YF?=
 =?us-ascii?Q?Eb2YcuxqK5YFLUV0tPH4Qq8KJsGVoKoF+zWFw04VTePRAI3L1hLWlCiNM/ms?=
 =?us-ascii?Q?2niIDDUMJRm/+rFzq4cdJ6SVuYEYQBMUPnchy7v6FeS6V3aicavMjEASgjLu?=
 =?us-ascii?Q?GDEAuBEKPJ2uvAJFy+rIXTjze+J+BTL/FEyQxH89ksCIPEiXHepVP+uBz8H9?=
 =?us-ascii?Q?X2Qq18V8FSsER4R9DR8bPDqU7pdM/abfN0zGjBqR9MwPIhHbr8VcCK/gkCbw?=
 =?us-ascii?Q?67IaWi5ZQhtFpKUlIa+8qy+CxCyaYsIfG0LOZOcTQbbpAlZjFdXcTzSWeVFZ?=
 =?us-ascii?Q?S3Cu9YKv22k9c7PV1eEmV+KrymoV2AG475WHYPTuThti9to8cWmJKFtZ/My3?=
 =?us-ascii?Q?5gPuav2h9Pkc1Kls5DIA5+nFJJ3RTTV8MlU4PLSamSpVm6l0XmiLkDyEgEAl?=
 =?us-ascii?Q?bu6d4zN4qh73m30qzPuxDGr6ShM/enw54npMcs8F/Ck795nEUHsmp+OzZRO+?=
 =?us-ascii?Q?3rXCTGNREvm2E/Q/mCD1X7ztem50U+I0Ict+e86UEwo3MMTNh3r4JjYgF/w3?=
 =?us-ascii?Q?4yG7UMcX9KkpH9ir7o0qrK6SpY5ycg987tsD2k/OPI3wcnz55uUw2CqOkLe3?=
 =?us-ascii?Q?bfKuJsBK9tagayn4Qm56fqhHy0HH9fiB/zKDEDdDKdzfjiWwP0+76b4q2Xmx?=
 =?us-ascii?Q?Eub0PuR5FTQcGyG0ZMBBf2+rmadLHhBQycptswRZ6ohCmaCnBmLohbzsesR8?=
 =?us-ascii?Q?amtUjVFuovrO+8IFcgKr537HCVlFj1IV5F9sLyqepn9QAxMhwlQ/ObpnvnUy?=
 =?us-ascii?Q?ZQt14lsWk6izju2Er03yxyhKdrCDgBP1AHUV6kECsnge0WL6rXRjmi0mNuH2?=
 =?us-ascii?Q?zWvKzTQ0pyf/32UnOZbJbyA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4240.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n0pb6PwNWNUSCUSHlqFw4yPkwe+octeiCYmJlcHGp4Qc3LLbDwgkKZXs9CJa?=
 =?us-ascii?Q?4STISxUVIcbTcK/LcgduQ0Al5em31N8LmXqUg5qIBgnEY+7BMqaWC04Nrpa3?=
 =?us-ascii?Q?QnL8eK0Fw+464aIeH6ug2gXIN6+EzbJ3IoLDYipuQlj2S8FYFNNcggm3Zsda?=
 =?us-ascii?Q?nzfMqcJRZ80mO6JLmRpE7YGN3L9YBQC66ehUIB3403Lq7fx/b+xuW92t1M0d?=
 =?us-ascii?Q?4AeM2U4G/3l7jD+xrr1lzldVQ6Q2wNvql2buldYs1o1nxu4L6WjMWT/Hjko9?=
 =?us-ascii?Q?G0+90zpwRJf3ZriV/8ppk3genp+g3LaD6Taage+fiEVi6WMZld/0pLNmkIlh?=
 =?us-ascii?Q?GOC8+o0TQ/ycA+pNtgDShu6ZrCy1yJrgiYZTpRqPY7cUVJkZqa30XwjZ1S1j?=
 =?us-ascii?Q?Jn+s7yQDE4rofcpqlKnR6B4rPiF+SwSbxAmDxSYxiyIC/agrHSi78/MxjLdv?=
 =?us-ascii?Q?3HUwe3HfFkA6FgJFFI5ofVPH4JS9oWxy8z5rPCGz5uyiUSm4b7XxGe2Bn/Fn?=
 =?us-ascii?Q?tzB/ouhZnblednmacEmPP0mT4xhUtC5crTLAFctF4dVP1METlF9ziM7D7r8o?=
 =?us-ascii?Q?uUg1cAYVbUWu2udQy5VCHykwdbBxOSfM4f3QggiIBIFWdn6KQKUJu56JOr+X?=
 =?us-ascii?Q?+sYCkbZ2bYhVklwkLBFZgDJNhPmWAJpcmLQYM3ibREUB0lT3E9HAkvOINJhk?=
 =?us-ascii?Q?rpe9qcdR2038Fpc3/zVnjSagPp2n89uFNlhO8qUsbkB39vxnM6YEW2geCuvX?=
 =?us-ascii?Q?7zKOe5p10TFaA2eIdRT6ZkA2+kRWZC/hYo/r2Ko16IYDhVtHLJVO+/HEicIN?=
 =?us-ascii?Q?PlFTXOUfe06PuS4FngsSaPSKcl30VLR62UrGcjq36RGajCflFGMW3XaQSXW7?=
 =?us-ascii?Q?pWB3OJVP6oMAwzwwiJnYw1iK1JTeR/EbvHDUTfp7YqEGkKbW/5EGP91+Yaqx?=
 =?us-ascii?Q?1vfgR4M9E7/cArwuKjaUcdVtId4OJwoyTDRsjlrXmBCoVKZl2E4tLaPM9iVY?=
 =?us-ascii?Q?Jh5WHnTPbpnrmx2Mf8ozPKlTvBtg/ml2LdKefAwFUlDOuuql6uKJfsp95mx+?=
 =?us-ascii?Q?PWdG78rcIycPh/+nrCmSa6myEewqWj+lv7W9UueiX6ziAmKLjCqD5cUdKaoo?=
 =?us-ascii?Q?LPXE+1lDrSjHwc0+s9ZzRB9b2fXzla3G1BiDMltMO7MQz9fQRyHhoPI/RWia?=
 =?us-ascii?Q?CrWUChc5XE0u9zzvRkPQA9caImKtW4PhUFVS204tMKUXlY8mVaenfuR8JM3b?=
 =?us-ascii?Q?zeVAYqUAbMgFsJbbRBb/fa5JlydzJDdV3JysehuX/4WOU9HiP0pz+1qQ2J9R?=
 =?us-ascii?Q?V1EbzULQO3bCAphZAKdzFvkV8FLd6+62NjG+qa9LSnFXtdoFwhfOfYIbq1vN?=
 =?us-ascii?Q?lBvRlvVi23ME344hbCuxCtFwSbFWEul6Z5rQaq6fVJAtPk0PeI2mexAaOum/?=
 =?us-ascii?Q?cMOGRPvVzs98BQsoyQnSeb1QuKev/iJvvEuxWq6VH/3j/0Cytq7vdLKl54lH?=
 =?us-ascii?Q?Ad3KVAjgIrqFTivCBpO7Nk0EUwJY252RFbSMkU1/pJsRpC2SUqY/+/5ugLAF?=
 =?us-ascii?Q?NVmZDZ1s3tmtenq09XQIx0GAtgyzKfS02hncvQQW0H1M7BJmTBqtQcs1J2jB?=
 =?us-ascii?Q?9zJBdcRMf5uSp1hMRAAJQyFMV49RgtOccNG/7vtxQ2YenPahCgx6ve0MuE7l?=
 =?us-ascii?Q?hcXhIBRpCvzWkQkE6EwQ/6keonFXNPCmfupAg62I5imSpU6NFQxQiXKHDr3r?=
 =?us-ascii?Q?g1M2/Swr2A=3D=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: dd87cc08-dfad-491b-4c5b-08de575f1452
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 13:31:41.0280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HDwMYrVXf2jo/epwsUiVfSFqC/ibIcSaWJoiKIdrCd3CxtT6asF0d+YFfL7NXkhMvxOGuYd6bPLivn0NgkBL5yw1KPB+z4nKbS7OOv+TWuI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0897
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 13:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229620

From: Daniel Turull <daniel.turull@ericsson.com>

Adding postprocessing script to process data from linux CNA that includes m=
ore accurate metadata and it is updated directly by the source.

Example of enhanced CVE from a report from cve-check:

{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
  "summary": "In the Linux kernel, the following vulnerability [...]",
  "scorev2": "0.0",
  "scorev3": "5.5",
  "scorev4": "0.0",
  "modified": "2025-03-17T15:36:11.620",
  "vector": "LOCAL",
  "vectorString": "CVSS:3.1/AV:L/AC:L/PR:L/UI:N/S:U/C:N/I:N/A:H",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/includ=
e/asm/thread_info.h']"
},

And same from a report generated with vex:
{
  "id": "CVE-2024-26710",
  "status": "Ignored",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2024-26710",
  "detail": "not-applicable-config",
  "description": "Source code not compiled by config. ['arch/powerpc/includ=
e/asm/thread_info.h']"
},

For unpatched CVEs, provide more context in the description:
Tested with 6.12.22 kernel
{
  "id": "CVE-2025-39728",
  "status": "Unpatched",
  "link": "https://nvd.nist.gov/vuln/detail/CVE-2025-39728",
  "summary": "In the Linux kernel, the following vulnerability has been [..=
.],
  "scorev2": "0.0",
  "scorev3": "0.0",
  "scorev4": "0.0",
  "modified": "2025-04-21T14:23:45.950",
  "vector": "UNKNOWN",
  "vectorString": "UNKNOWN",
  "detail": "version-in-range",
  "description": "Needs backporting (fixed from 6.12.23)"
},

CC: Peter Marko <peter.marko@siemens.com>
CC: Marta Rybczynska <rybczynska@gmail.com>
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e60b1759c1aea5b8f5317e46608f0a3e782ecf57)
Signed-off-by: Suresh H A <suresh.ha@bmwtechworks.in>
---
 scripts/contrib/improve_kernel_cve_report.py | 467 +++++++++++++++++++
 1 file changed, 467 insertions(+)
 create mode 100755 scripts/contrib/improve_kernel_cve_report.py

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
new file mode 100755
index 0000000000..829cc4cd30
--- /dev/null
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -0,0 +1,467 @@
+#! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# The script uses another source of CVE information from linux-vulns
+# to enrich the cve-summary from cve-check or vex.
+# It can also use the list of compiled files from the kernel spdx to ignor=
e CVEs
+# that are not affected since the files are not compiled.
+#
+# It creates a new json file with updated CVE information
+#
+# Compiled files can be extracted adding the following in local.conf
+# SPDX_INCLUDE_COMPILED_SOURCES:pn-linux-yocto =3D "1"
+#
+# Tested with the following CVE sources:
+# - https://git.kernel.org/pub/scm/linux/security/vulns.git
+# - https://github.com/CVEProject/cvelistV5
+#
+# Example:
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.js=
on --kernel-version 6.12.27 --datadir ./vulns
+# python3 ./openembedded-core/scripts/contrib/improve_kernel_cve_report.py=
 --spdx tmp/deploy/spdx/3.0.1/qemux86_64/recipes/recipe-linux-yocto.spdx.js=
on --datadir ./vulns --old-cve-report build/tmp/log/cve/cve-summary.json
+#
+# SPDX-License-Identifier: GPLv2
+
+import argparse
+import json
+import sys
+import logging
+import glob
+import os
+import pathlib
+from packaging.version import Version
+
+def is_linux_cve(cve_info):
+    '''Return true is the CVE belongs to Linux'''
+    if not "affected" in cve_info["containers"]["cna"]:
+        return False
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        if not "product" in affected:
+            return False
+        if affected["product"] =3D=3D "Linux" and affected["vendor"] =3D=
=3D "Linux":
+            return True
+    return False
+
+def get_kernel_cves(datadir, compiled_files, version):
+    """
+    Get CVEs for the kernel
+    """
+    cves =3D {}
+
+    check_config =3D len(compiled_files) > 0
+
+    base_version =3D Version(f"{version.major}.{version.minor}")
+
+    # Check all CVES from kernel vulns
+    pattern =3D os.path.join(datadir, '**', "CVE-*.json")
+    cve_files =3D glob.glob(pattern, recursive=3DTrue)
+    not_applicable_config =3D 0
+    fixed_as_later_backport =3D 0
+    vulnerable =3D 0
+    not_vulnerable =3D 0
+    for cve_file in sorted(cve_files):
+        cve_info =3D {}
+        with open(cve_file, "r", encoding=3D'ISO-8859-1') as f:
+            cve_info =3D json.load(f)
+
+        if len(cve_info) =3D=3D 0:
+            logging.error("Not valid data in %s. Aborting", cve_file)
+            break
+
+        if not is_linux_cve(cve_info):
+            continue
+        cve_id =3D os.path.basename(cve_file)[:-5]
+        description =3D cve_info["containers"]["cna"]["descriptions"][0]["=
value"]
+        if cve_file.find("rejected") >=3D 0:
+            logging.debug("%s is rejected by the CNA", cve_id)
+            cves[cve_id] =3D {
+                "id": cve_id,
+                "status": "Ignored",
+                "detail": "rejected",
+                "summary": description,
+                "description": f"Rejected by CNA"
+            }
+            continue
+        if any(elem in cve_file for elem in ["review", "reverved", "testin=
g"]):
+            continue
+
+        is_vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected_versions =3D get_cpe_applicability(cve_info, ve=
rsion)
+
+        logging.debug("%s: %s (%s - %s) (%s - %s)", cve_id, is_vulnerable,=
 better_match_first, better_match_last, first_affected, last_affected)
+
+        if is_vulnerable is None:
+            logging.warning("%s doesn't have good metadata", cve_id)
+        if is_vulnerable:
+            is_affected =3D True
+            affected_files =3D []
+            if check_config:
+                is_affected, affected_files =3D check_kernel_compiled_file=
s(compiled_files, cve_info)
+
+            if not is_affected and len(affected_files) > 0:
+                logging.debug(
+                    "%s - not applicable configuration since affected file=
s not compiled: %s",
+                    cve_id, affected_files)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Ignored",
+                    "detail": "not-applicable-config",
+                    "summary": description,
+                    "description": f"Source code not compiled by config. {=
affected_files}"
+                }
+                not_applicable_config +=3D1
+            # Check if we have backport
+            else:
+                if not better_match_last:
+                    fixed_in =3D last_affected
+                else:
+                    fixed_in =3D better_match_last
+                logging.debug("%s needs backporting (fixed from %s)", cve_=
id, fixed_in)
+                cves[cve_id] =3D {
+                        "id": cve_id,
+                        "status": "Unpatched",
+                        "detail": "version-in-range",
+                        "summary": description,
+                        "description": f"Needs backporting (fixed from {fi=
xed_in})"
+                }
+                vulnerable +=3D 1
+                if (better_match_last and
+                    Version(f"{better_match_last.major}.{better_match_last=
.minor}") =3D=3D base_version):
+                    fixed_as_later_backport +=3D 1
+        # Not vulnerable
+        else:
+            if not first_affected:
+                logging.debug("%s - not known affected %s",
+                              cve_id,
+                              better_match_last)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "version-not-in-range",
+                    "summary": description,
+                    "description": "No CPE match"
+                }
+                not_vulnerable +=3D 1
+                continue
+            backport_base =3D Version(f"{better_match_last.major}.{better_=
match_last.minor}")
+            if version < first_affected:
+                logging.debug('%s - fixed-version: only affects %s onwards=
',
+                              cve_id,
+                              first_affected)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "fixed-version",
+                    "summary": description,
+                    "description": f"only affects {first_affected} onwards=
"
+                }
+                not_vulnerable +=3D 1
+            elif last_affected <=3D version:
+                logging.debug("%s - fixed-version: Fixed from version %s",
+                              cve_id,
+                              last_affected)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "fixed-version",
+                    "summary": description,
+                    "description": f"fixed-version: Fixed from version {la=
st_affected}"
+                }
+                not_vulnerable +=3D 1
+            elif backport_base =3D=3D base_version:
+                logging.debug("%s - cpe-stable-backport: Backported in %s"=
,
+                              cve_id,
+                              better_match_last)
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "cpe-stable-backport",
+                    "summary": description,
+                    "description": f"Backported in {better_match_last}"
+                }
+                not_vulnerable +=3D 1
+            else:
+                logging.debug("%s - version not affected %s", cve_id, str(=
affected_versions))
+                cves[cve_id] =3D {
+                    "id": cve_id,
+                    "status": "Patched",
+                    "detail": "version-not-in-range",
+                    "summary": description,
+                    "description": f"Range {affected_versions}"
+                }
+                not_vulnerable +=3D 1
+
+    logging.info("Total CVEs ignored due to not applicable config: %d", no=
t_applicable_config)
+    logging.info("Total CVEs not vulnerable due version-not-in-range: %d",=
 not_vulnerable)
+    logging.info("Total vulnerable CVEs: %d", vulnerable)
+
+    logging.info("Total CVEs already backported in %s: %s", base_version,
+                    fixed_as_later_backport)
+    return cves
+
+def read_spdx(spdx_file):
+    '''Open SPDX file and extract compiled files'''
+    with open(spdx_file, 'r', encoding=3D'ISO-8859-1') as f:
+        spdx =3D json.load(f)
+        if "spdxVersion" in spdx:
+            if spdx["spdxVersion"] =3D=3D "SPDX-2.2":
+                return read_spdx2(spdx)
+        if "@graph" in spdx:
+            return read_spdx3(spdx)
+    return []
+
+def read_spdx2(spdx):
+    '''
+    Read spdx2 compiled files from spdx
+    '''
+    cfiles =3D set()
+    if 'files' not in spdx:
+        return cfiles
+    for item in spdx['files']:
+        for ftype in item['fileTypes']:
+            if ftype =3D=3D "SOURCE":
+                filename =3D item["fileName"][item["fileName"].find("/")+1=
:]
+                cfiles.add(filename)
+    return cfiles
+
+def read_spdx3(spdx):
+    '''
+    Read spdx3 compiled files from spdx
+    '''
+    cfiles =3D set()
+    for item in spdx["@graph"]:
+        if "software_primaryPurpose" not in item:
+            continue
+        if item["software_primaryPurpose"] =3D=3D "source":
+            filename =3D item['name'][item['name'].find("/")+1:]
+            cfiles.add(filename)
+    return cfiles
+
+def check_kernel_compiled_files(compiled_files, cve_info):
+    """
+    Return if a CVE affected us depending on compiled files
+    """
+    files_affected =3D set()
+    is_affected =3D False
+
+    for item in cve_info['containers']['cna']['affected']:
+        if "programFiles" in item:
+            for f in item['programFiles']:
+                if f not in files_affected:
+                    files_affected.add(f)
+
+    if len(files_affected) > 0:
+        for f in files_affected:
+            if f in compiled_files:
+                logging.debug("File match: %s", f)
+                is_affected =3D True
+    return is_affected, files_affected
+
+def get_cpe_applicability(cve_info, v):
+    '''
+    Check if version is affected and return affected versions
+    '''
+    base_branch =3D Version(f"{v.major}.{v.minor}")
+    affected =3D []
+    if not 'cpeApplicability' in cve_info["containers"]["cna"]:
+        return None, None, None, None, None, None
+
+    for nodes in cve_info["containers"]["cna"]["cpeApplicability"]:
+        for node in nodes.values():
+            vulnerable =3D False
+            matched_branch =3D False
+            first_affected =3D Version("5000")
+            last_affected =3D Version("0")
+            better_match_first =3D Version("0")
+            better_match_last =3D Version("5000")
+
+            if len(node[0]['cpeMatch']) =3D=3D 0:
+                first_affected =3D None
+                last_affected =3D None
+                better_match_first =3D None
+                better_match_last =3D None
+
+            for cpe_match in node[0]['cpeMatch']:
+                version_start_including =3D Version("0")
+                version_end_excluding =3D Version("0")
+                if 'versionStartIncluding' in cpe_match:
+                    version_start_including =3D Version(cpe_match['version=
StartIncluding'])
+                else:
+                    version_start_including =3D Version("0")
+                # if versionEndExcluding is missing we are in a branch, wh=
ich is not fixed.
+                if "versionEndExcluding" in cpe_match:
+                    version_end_excluding =3D Version(cpe_match["versionEn=
dExcluding"])
+                else:
+                    # if versionEndExcluding is missing we are in a branch=
, which is not fixed.
+                    version_end_excluding =3D Version(
+                        f"{version_start_including.major}.{version_start_i=
ncluding.minor}.5000"
+                    )
+                affected.append(f" {version_start_including}-{version_end_=
excluding}")
+                # Detect if versionEnd is in fixed in base branch. It has =
precedence over the rest
+                branch_end =3D Version(f"{version_end_excluding.major}.{ve=
rsion_end_excluding.minor}")
+                if branch_end =3D=3D base_branch:
+                    if version_start_including <=3D v < version_end_exclud=
ing:
+                        vulnerable =3D cpe_match['vulnerable']
+                    # If we don't match in our branch, we are not vulnerab=
le,
+                    # since we have a backport
+                    matched_branch =3D True
+                    better_match_first =3D version_start_including
+                    better_match_last =3D version_end_excluding
+                if version_start_including <=3D v < version_end_excluding =
and not matched_branch:
+                    if version_end_excluding < better_match_last:
+                        better_match_first =3D max(version_start_including=
, better_match_first)
+                        better_match_last =3D min(better_match_last, versi=
on_end_excluding)
+                        vulnerable =3D cpe_match['vulnerable']
+                        matched_branch =3D True
+
+                first_affected =3D min(version_start_including, first_affe=
cted)
+                last_affected =3D max(version_end_excluding, last_affected=
)
+            # Not a better match, we use the first and last affected inste=
ad of the fake .5000
+            if vulnerable and better_match_last =3D=3D Version(f"{base_bra=
nch}.5000"):
+                better_match_last =3D last_affected
+                better_match_first =3D first_affected
+    return vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected
+
+def copy_data(old, new):
+    '''Update dictionary with new entries, while keeping the old ones'''
+    for k in new.keys():
+        old[k] =3D new[k]
+    return old
+
+# Function taken from cve_check.bbclass. Adapted to cve fields
+def cve_update(cve_data, cve, entry):
+    # If no entry, just add it
+    if cve not in cve_data:
+        cve_data[cve] =3D entry
+        return
+    # If we are updating, there might be change in the status
+    if cve_data[cve]['status'] =3D=3D "Unknown":
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    if cve_data[cve]['status'] =3D=3D entry['status']:
+        return
+    if entry['status'] =3D=3D "Unpatched" and cve_data[cve]['status'] =3D=
=3D "Patched":
+        logging.warning("CVE entry %s update from Patched to Unpatched fro=
m the scan result", cve)
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    if entry['status'] =3D=3D "Patched" and cve_data[cve]['status'] =3D=3D=
 "Unpatched":
+        logging.warning("CVE entry %s update from Unpatched to Patched fro=
m the scan result", cve)
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        return
+    # If we have an "Ignored", it has a priority
+    if cve_data[cve]['status'] =3D=3D "Ignored":
+        logging.debug("CVE %s not updating because Ignored", cve)
+        return
+    # If we have an "Ignored", it has a priority
+    if entry['status'] =3D=3D "Ignored":
+        cve_data[cve] =3D copy_data(cve_data[cve], entry)
+        logging.debug("CVE entry %s updated from Unpatched to Ignored", cv=
e)
+        return
+    logging.warning("Unhandled CVE entry update for %s %s from %s %s to %s=
",
+        cve, cve_data[cve]['status'], cve_data[cve]['detail'],  entry['sta=
tus'], entry['detail'])
+
+def main():
+    parser =3D argparse.ArgumentParser(
+        description=3D"Update cve-summary with kernel compiled files and k=
ernel CVE information"
+    )
+    parser.add_argument(
+        "-s",
+        "--spdx",
+        help=3D"SPDX2/3 for the kernel. Needs to include compiled sources"=
,
+    )
+    parser.add_argument(
+        "--datadir",
+        type=3Dpathlib.Path,
+        help=3D"Directory where CVE data is",
+        required=3DTrue
+    )
+    parser.add_argument(
+        "--old-cve-report",
+        help=3D"CVE report to update. (Optional)",
+    )
+    parser.add_argument(
+        "--kernel-version",
+        help=3D"Kernel version. Needed if old cve_report is not provided (=
Optional)",
+        type=3DVersion
+    )
+    parser.add_argument(
+        "--new-cve-report",
+        help=3D"Output file",
+        default=3D"cve-summary-enhance.json"
+    )
+    parser.add_argument(
+        "-D",
+        "--debug",
+        help=3D'Enable debug ',
+        action=3D"store_true")
+
+    args =3D parser.parse_args()
+
+    if args.debug:
+        log_level=3Dlogging.DEBUG
+    else:
+        log_level=3Dlogging.INFO
+    logging.basicConfig(format=3D'[%(filename)s:%(lineno)d] %(message)s', =
level=3Dlog_level)
+
+    if not args.kernel_version and not args.old_cve_report:
+        parser.error("either --kernel-version or --old-cve-report are need=
ed")
+        return -1
+
+    # by default we don't check the compiled files, unless provided
+    compiled_files =3D []
+    if args.spdx:
+        compiled_files =3D read_spdx(args.spdx)
+        logging.info("Total compiled files %d", len(compiled_files))
+
+    if args.old_cve_report:
+        with open(args.old_cve_report, encoding=3D'ISO-8859-1') as f:
+            cve_report =3D json.load(f)
+    else:
+        #If summary not provided, we create one
+        cve_report =3D {
+            "version": "1",
+            "package": [
+                {
+                    "name": "linux-yocto",
+                    "version": str(args.kernel_version),
+                    "products": [
+                        {
+                            "product": "linux_kernel",
+                            "cvesInRecord": "Yes"
+                        }
+                    ],
+                    "issue": []
+                }
+            ]
+        }
+
+    for pkg in cve_report['package']:
+        is_kernel =3D False
+        for product in pkg['products']:
+            if product['product'] =3D=3D "linux_kernel":
+                is_kernel=3DTrue
+        if not is_kernel:
+            continue
+
+        kernel_cves =3D get_kernel_cves(args.datadir,
+                                      compiled_files,
+                                      Version(pkg["version"]))
+        logging.info("Total kernel cves from kernel CNA: %s", len(kernel_c=
ves))
+        cves =3D {issue["id"]: issue for issue in pkg["issue"]}
+        logging.info("Total kernel before processing cves: %s", len(cves))
+
+        for cve in kernel_cves:
+            cve_update(cves, cve, kernel_cves[cve])
+
+        pkg["issue"] =3D []
+        for cve in sorted(cves):
+            pkg["issue"].extend([cves[cve]])
+        logging.info("Total kernel cves after processing: %s", len(pkg['is=
sue']))
+
+    with open(args.new_cve_report, "w", encoding=3D'ISO-8859-1') as f:
+        json.dump(cve_report, f, indent=3D2)
+
+    return 0
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())
+
--=20
2.34.1


