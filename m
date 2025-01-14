Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9BBE77188
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 15:38:36 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.102])
 by mx.groups.io with SMTP id smtpd.web10.48044.1736869106533705878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 07:38:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=A2Thq7xG;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.247.102, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6XW5LFEIaqrMh4oYSmOndj5v0S0tsYCvKPE45bkqR4visQ4++77VS5u01OQe9U/EzMvQ2QhUaNjwyTqsnrz8PzM0pW9K7RO2j2C2rRyHjfIHNS65VuSIKrlHPceefWtuACfVb2sPRIgNpsR2m2jZqhHxteHL1DeOeTZv34f3P0e4qQfdXHIfYndK5bCSb+OScY+N8G7lJmhJLU22k6h5IjGzHyHyOsMuuz76yWoOuPYWNeU/HbViJFp9NDwcPtvtrDnL7MBnXPr2aaFotxqEGl34A8ZEmCdkLe4YZ+8JkzjWskTWjUGWysMroMWBvX8ORKOhpvoDiQemYK94A/nrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emK0hbnSmSOOQbUSujsUMa0S5DbstZw66ZM+JEKXR7o=;
 b=fIC6Rli6+Y34xtyeoVEt6HJJZ+mo+dJGhjzdiyJP6WayFIybKXXLzZJ3mYLLSstlUwJcXCcZRjAnCq5CQ3xexMqOUTy9u0NQ8j+9JijXkkTb2FZ4Jud3YEo3+lRWXDOtO8Ki0xHFDfuK368lGuoIHEW3zKovbtqUGkb7Th2W5/ByofI+gsksV96YQAk/6xtDqpelUjvv386jMClfu84v+YtpFGHoggpKCYyyi5chYtj4/OFS0Guopy0iq077XofSmR/tJfUag+nK5ocEKe8X8IEHkb8UtAByiOs9qNNlSIMo6O2tCmk9alM5Sg1suaqcZJc+whvhgxNrv3w0wim5ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emK0hbnSmSOOQbUSujsUMa0S5DbstZw66ZM+JEKXR7o=;
 b=A2Thq7xGk0WWjtpuOemno9qGQNIwhjPVsv1efUOnJk+0cCi5SnBNNSDEc9eGFRuI6cpkcuMPsg9+I0uLukwCly8E+1JEOULH+Sx7i33Jty2DuuAiMHgtu9p+6yjrUu4jZe5vO/sb91GXZ3Uj+Tfqqorhm+ZjWuZ9RBrH/7NPrCZXrt7gsAzK8nTvxCCCiDvsXKfgKk6H3sW+pTCwJ0w4fvv5ki9ZnyHvvi9rUiTtlsnMTtlXW907CRlwgVu+WfIYcGNWA5AvjVa+9+AqXsqS+PE62N/shuwr44fH6DOW8EwLyNTmLj2vv0M4oeSQpgULRI58Zl8yTQ2ZOZGaSkacnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9178.eurprd06.prod.outlook.com (2603:10a6:150:1c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:38:21 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%4]) with mapi id 15.20.8356.010; Tue, 14 Jan 2025
 15:38:21 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 3/5] cve-check.bbclass: Drop redundant import update_symlinks
Date: Tue, 14 Jan 2025 15:37:46 +0000
Message-ID: <20250114153748.2358116-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250114153748.2358116-1-niko.mauno@vaisala.com>
References: <20250114153748.2358116-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P195CA0001.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e2::8) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: 79a3fa59-d1a2-4e25-fe54-08dd34b17980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ey0YFrUf+vpLs9VMVPqccpBEH9DOTDfAgSY4n7BXz7NLhilNckCApCQRrUnT?=
 =?us-ascii?Q?Rvb3bLXGSRmExlcwoCeutFPHYK79kDXoI5CwBEOw6cqjLMWm15Z9JZK/hVZ2?=
 =?us-ascii?Q?2Z4cPzRCcd2mKHSKQvB3MmQXKnOfHlvgXgPJvB4hSn70srzta+4DDkaMh337?=
 =?us-ascii?Q?yTUsrixE6fUGSCk1rT+SMjVAcjGIk4FDdWZ6+lVxQ8s8QF21MDJuLW8FzqmH?=
 =?us-ascii?Q?TIjgTZGmPYvZ4Pauyk1+co5MsPKvCmtjI/KwsCLCBLTfOVxtQznQvdlv9sw+?=
 =?us-ascii?Q?Uso6SoGAt01P0OLpX82/8lsQaDcPYwe5LHGXtvi742iCNY/F1wWcEaPnQBro?=
 =?us-ascii?Q?26N65iyeULHLF4Mp7L48SoapCn8u603wck4lSmet8kOUCarxGhVOnsFa13qH?=
 =?us-ascii?Q?OVhOkV2PRtZbuW6Mt/NsJLrHDUFmOvW9xdocSX7ec3uIB8gYdHJOBBR4be/7?=
 =?us-ascii?Q?+itydfZnlWLyb5PsOS6q2lNVrUTJ0oURy3LVZPASxBlCpvbXvhFrKoGL7ucG?=
 =?us-ascii?Q?HyJjUbRAtYBjbouBLZUEGlR6foWcdSmvMBDyJMPQN+IrRMo2vC8zpv1WSjmZ?=
 =?us-ascii?Q?AvWNKVUJvrr77GPUj3ymVTQOttA1oNn4Oso6WZwqfz/9lSoTlF82oigCp8Ml?=
 =?us-ascii?Q?ixwG+XAzLApbTAoZHfxBD7MRVD7mwR31JQoxyIcG8V9XFJ6UYVLS8VetJfaP?=
 =?us-ascii?Q?qvCmzz65Gqq0YiK/LozEtr0dDhZOSkb5T9LdI9Pr8FjWGAgw0bzMpDsybSSq?=
 =?us-ascii?Q?NkDQOrESxfWnKV9Cpj1Z4GMBh0mATTa5IWLdWDUoGIObEBCOjszXApTuNFiC?=
 =?us-ascii?Q?Rr5/vLKeMXUPKp3b49fmXEnG+z8N8WR/JQaB0ucOolg5Ab3Bs53KbUOg7CdS?=
 =?us-ascii?Q?dW0PwcgiO5I9c/rTiBy/6t3HP4hjVhQifbGLHUydHlBzKCgj38PUQFtnGceu?=
 =?us-ascii?Q?tyoHu1AucYPyvX2zq6OV11mmLMoZpidZGUx24LyzI4zKYsiLuRTN1pWJ4Nfc?=
 =?us-ascii?Q?JEPKE4gC4PjMtFNG9FN+KeZjYqX+oaiBsY0ZzepOjb3wxiHlzQ6J5Sdiim+x?=
 =?us-ascii?Q?Rl2YcHldvMvr0SEg/gRCJ7fIqXcyHl6rnbh3KPMQV5EiVRRLxjIoRh08WjQA?=
 =?us-ascii?Q?XloxmYz7TW5kbt1AWZcfzz6SOOoem0lo/WSzzTBhGV8KJy3HyNqnaT4koRvS?=
 =?us-ascii?Q?54ilGYTaEuxT6S/s35bFL5pNKG7liKOy74BF7cL6qcXcGtD1XG5bofezpAd6?=
 =?us-ascii?Q?IUGO1n3TlFOw6CkqoO8W9JpZ0B2BmsP2BXgHJEdWNs444B41E6DI4pTgnIvc?=
 =?us-ascii?Q?iE9qmDqjm+SuexSg1Ue7xUfKdwYhBJ+GEypFMq0VzCORSEETElrSj+AiOtRQ?=
 =?us-ascii?Q?a0oPlVnmblyL4vBq+BFlFJSHvcwyHD//3TUKk5j24LGMA0fakm0vAAaxn8r+?=
 =?us-ascii?Q?Z8M6rzcsJADsNkN8HCesmr1jbq46GWf9?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bbZW2vH2nfDIdrjDpAdrTcVxZkBbxPbrQE5EZtpgicB8NtM6OLvnbi3nkCue?=
 =?us-ascii?Q?pFzVZyrO1hE8V2EDXgzltPSs1dISRFs5OkFx3MrIxaTWKbcDZD1ki2Vad2DJ?=
 =?us-ascii?Q?jqLwAYFPml4edPYv59wnKRjWY5yWkQuHhsoEGPYcTVsFuk7dzWK//cgnmFq2?=
 =?us-ascii?Q?uoJYSMGkgKTznEIMCtE6+4KOmUCmjwHBSLR57iiMbdUOVWR7KPcmO8tifY0f?=
 =?us-ascii?Q?CJkrIhlFX5yccgPUJ5dVQ2/g3SUtPooqjjdg9nMu4hMrVnKkTfIwkqN28dLs?=
 =?us-ascii?Q?/tF7PqjcXaQ85bEw8FRXqiSBjUSqJ4h838YM6QYL8F5jTIiMnlIQd7M83WQT?=
 =?us-ascii?Q?217VzG7NwH5bA6V4+tHnNIrtn+VU4qzQZPaoygxTovpHee/9QhZTf69Tmsc9?=
 =?us-ascii?Q?sLscJcy36FuJk88J5KT/jAQFfFPVTnVWiZ3YMI59EgwzZ5ZfmhXgdSP/Nj7h?=
 =?us-ascii?Q?eYW3VpAft+bK2rkI7D+eIeHyPm9/zERdNPkTh4Vxy1DVYHPkRvy+kk2AlZGL?=
 =?us-ascii?Q?LFgVYq/wxmLMOxbXnbaBjyQ7V6mo/rZCc5obzh4SNCh0oKsOOH75iIaM/sK/?=
 =?us-ascii?Q?CaE6YFs7rR4zRoMrRYnASLhz7A+ygsNrDXDJk20Atr10FZvxJSOmLc8fqiC/?=
 =?us-ascii?Q?iAKNMDHf8yCTdh0NZlCYUijiDQFIzIKr/vwD+n1CvGqSJEZnfLx7Fx2HClmg?=
 =?us-ascii?Q?QNTkk6JqsuLzQtRYdkqV7o6xO3lgCBEatPGYtnCt/6g70XumhgXS8G2GQ/Am?=
 =?us-ascii?Q?McXTMbEaHF+RYw9uBZqSFH9ysl0BLE2je2Y1dvBNxcq5tJU3G8WbaNII+kLB?=
 =?us-ascii?Q?tmfSiDwyeODURksWy0m8jlEQX0HeWuSvl0d8ywTpn5fF7WqC33FXxx/ELjFO?=
 =?us-ascii?Q?pfDTHnvnRxZeqmRYdQ5EYD+XiWEr6UzClJ8vAFsrg52KShEFTJnueUk8LgP0?=
 =?us-ascii?Q?Y+1Kqk4ebIu+vk+ouaWDuGYRP9AZblJqylo5SHipIaqRvHYvtnsiI6H1IPri?=
 =?us-ascii?Q?Ro3Z5X5MtElEeVLOiCoeZ1uUnHuvnlpZtbIn/PPnNUxbTdg2h3Qmt3oumJ0a?=
 =?us-ascii?Q?yYZoUQJiZulMY8tgk3fmvziCNhzymDQGw+gdV4gjYejZbstxrYf72WXophFF?=
 =?us-ascii?Q?CF9yNRpVjtaat4KvTUt989OKGu+TQ/Qo79RwCvdJ/pCn9IomZUbIdYDeczN5?=
 =?us-ascii?Q?wNlEgiwy4HDbC5qWQkyx39xAO884NxKBuuF/5XpXlIHa6bzSV+B0NBkZKdV8?=
 =?us-ascii?Q?g5+p99OxlROS47BPbgeg4GYFs4QiPiI8/arFRCqsf0+FZDsy0UJCFjSiVi9q?=
 =?us-ascii?Q?jPfTw9abTQjne/Qn/FcI6H6sXm41S6Cqyqj0Yteg+jgoOt58o7M42nHV1yGK?=
 =?us-ascii?Q?WfnH06tB0t5Xu5299CEpAvefwBFJjLA3x+xTxQE9p3XGsaDIRYmOEhQBRLz1?=
 =?us-ascii?Q?r31xNoouhAQzpnRtoIByvh9SxOT9ivknhFUMqs94fN5fNGXPpkKNy6hS6Pah?=
 =?us-ascii?Q?TuEkAW/vTGt6aB2Uf1lhGq4DTqsK44PNgaxwFvEdop0nQSTUD7WnuinnPPP8?=
 =?us-ascii?Q?SMSnoWpX7A5AwYQ9/gV7AoDCQQnYuH5YznQr3eDrIbxsdL6fBsPLyEVkMovb?=
 =?us-ascii?Q?aw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79a3fa59-d1a2-4e25-fe54-08dd34b17980
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:38:21.0357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 00rz2BxtqHCksb1gSusSYX++PemOPrzzc3/gpzU/Eg6x8/U1mSFjxCwUtF3SjZyrG9B6eSuSozucd34LtObr7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9178
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 15:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209806

Remove import from context where it is never used.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/cve-check.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index 4bd9af4abf..9f0a08becd 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -151,7 +151,6 @@ def generate_json_report(d, out_path, link_path):
 python cve_save_summary_handler () {
     import shutil
     import datetime
-    from oe.cve_check import update_symlinks
=20
     cve_summary_name =3D d.getVar("CVE_CHECK_SUMMARY_FILE_NAME")
     cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
--=20
2.39.5


