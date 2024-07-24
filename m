Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06890C3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 09:03:59 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.134])
 by mx.groups.io with SMTP id smtpd.web11.6434.1721811830616159038
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=VV22N059;
 spf=pass (domain: weidmueller.com, ip: 40.107.249.134, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rpBvHNw9TtaSHQYqqe+vTmhzh3z5vz66grcncaeRrJq85LSuv0nr1iwfrAdT1DqXV3iAIsXki9C9iGqEzMLVxTbI5cXmX7xHeeS0s9YRTK5xr+rGB1kg9RTnKwwM90EpOh//8vYTy2q7CtP19fHYQ7YFGvY8TIpghs6V+aZojubzz3se3dnDi3ki25vd4QRLxI6NGwCOTYJOzkHpIprMsYsji8pykj7WqgY0KoWr6xh4Y2MzObmsXnD/6L+twQkiuA+Y3UMAc+bkOtSTrO0gQ6wrEmlrIj3jsPKm9dyei7XaBgEnPgivGlS9rZ+eTWNlzMorX7dJP0GYRYK7Jan+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MRu9O/Mni2wFEEQlccAFcntWe8FhFa17EATYcxHr4Zw=;
 b=ZW9LSNBfhe83htXpVoFywd528ig4zrPsPOmDxH7ehdhUdpaJOk74SQWfkInCOystuwt0KB8EdPmUHEjfX5iL/om3s+fguYZVjHxXLzLahzhK9nbBD4tPObQ3/pZbmXtaWWSAnjVklYCxM2mE5Z70J7dTZakcQuSbLHIwVxoZ3DQlZP/Stsfqr9KSKez+6PXgoZumPV2RMtSQcIgK1oCGVORfj8dmM/TdCJF5d+qzOC4ix8VSaaLJ3zObFX1MKdCrEXyP+LApwH4ty9YFEQbST008L2I4Czq4Juz1CnpiHc38P2PifbcJ8ee02mW7lTbsn8Wzy1jO18d/+4d6dt7PFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MRu9O/Mni2wFEEQlccAFcntWe8FhFa17EATYcxHr4Zw=;
 b=VV22N059TkRbtGZxmR4C+lhQtBKSsNCjXDxrVKJeFb5Mx0NKsKxbTo9O4n+zOcNxIUut330Y2KNORb4c16hrH5tbt1F1R3/3tk6B7NoARayKsuZxLtu9B4Q0pL8PxldAylrFHdD/5vCpcGMBa9k621sEHxGhe4IVyV6YPptzOS7mkMnXjoKN9EMqUrCIyljiuYHJvLHOljnHyvhxJevUkf7ITCRnQ1H0qkxzJjQp4goaXWbEQD5qzIBlGvR+WHn3nw7RPmhrD1W7LtNOENvvL8kno05PZ/pR765FAITAcz7HzmJd2CX5bgFtRQ6T2Tr030mAcvrn5wuCyoXTOkl17w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by AS8PR08MB9956.eurprd08.prod.outlook.com (2603:10a6:20b:637::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Wed, 24 Jul
 2024 09:03:47 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15%4]) with mapi id 15.20.7784.016; Wed, 24 Jul 2024
 09:03:47 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core][PATCH] iptables: fix memory corruption when parsing nft rules
Date: Wed, 24 Jul 2024 11:03:38 +0200
Message-ID: <20240724090338.189002-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0192.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::10) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|AS8PR08MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: b628f1e8-3433-45eb-887f-08dcabbf86af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0l+bso/2jtrZ3CaLyn/FYrEg31TVfD3RvKOVbN4TqSJiglkYvtWRBMDBwKU9?=
 =?us-ascii?Q?J2OHZTPobGXVt0dGtQD5NScYlaMPUSjgpXp/DAp5FtUb2JIig+vMl4bPNvI8?=
 =?us-ascii?Q?fmnFr4AuiolL/hCXqDfosHewozWs2KUDSObwkzQilMmK/0DcM7W+98v51kB/?=
 =?us-ascii?Q?1sgfFLKnD8UCl1rpFyTlFRsfpygfxAIMoW0UtynlT9KLdw8EnlR96qifmYCf?=
 =?us-ascii?Q?g3OvE/Au5wERkiMTXbxuverFxksm7t0+DjUUccuCyLzspjFHpo7ejdKhaQpX?=
 =?us-ascii?Q?TcxKiYaq2Ocp7UkDTeqczls3GiqtuVjqNdsLYESoukpBcN1YVegz/pb12kVw?=
 =?us-ascii?Q?JEpQTOvaXAk9CCkY8mHxBfy/93KEoDwLAN2SbhAY89X/tace6xdZpbtP7oFp?=
 =?us-ascii?Q?6JZm/Tw1HRMoS6ZopbFd4+RYVrf79U1zwWwwgT83Y029rMSTZeHE06MGp8VU?=
 =?us-ascii?Q?y4lZl6CVfDJQ1Jk/ourPvafsQeGpEEdN0qzysZAb4G6VVPzemzO6JmdjYOR6?=
 =?us-ascii?Q?IpafsAfgC2O6Hp9c9PH/KrqmWTZKQxLvgYO/whgmsPSN4KkbAOkMVh/CYY+5?=
 =?us-ascii?Q?lA/ybyw4pVzXatTw/OheXrzI4SSnHowcilQROOtEMqBm21v/+3mkDHWZH914?=
 =?us-ascii?Q?3fmGZiNErhe0E4Esbbtebdj1r1iTHWBrkjn3U364Tuf8LdAm9xUoYtivX5/4?=
 =?us-ascii?Q?k/QTR3sZcoaF7GmkDZdUTnxV+s96kA3NJRfGlvoNSL1ZKYtgyVrvJViGAgI5?=
 =?us-ascii?Q?F05LB55eo/XHr/M2gHHTWidXJ9jSPGvcc0NUx502zWhV173Zkwdsvj0eDpNA?=
 =?us-ascii?Q?zdJDsXFR3cuqhjjPRrJZRmJgV6vsuDZIb/szj7/otyje/AbpYZt++zB7J/Sf?=
 =?us-ascii?Q?miLdOqbxWSaBTh1aKADyL0B5LmzKjwv5awrLzl8wF3/17K7+ZrD/Yxi1Xq2P?=
 =?us-ascii?Q?+jrusc9Bm4M+AXFOqXX8yhg3ma124V1filXVjk6HqVWZXzIDQHaoBhw0wZE0?=
 =?us-ascii?Q?PMIzXxVTFtlW5bTJUj69DYkxUcM3BKzTAGfeatjl4odoLjYguqKQCA7jutVE?=
 =?us-ascii?Q?QjuiVVS30YSLv3+5FB9nSzNsF8vNa74jgEWD+TyJ4VSG8WIt+j7TUa7/Ddj5?=
 =?us-ascii?Q?H7NBE3aIxIUzS52jXhNA5FKRgU+loTTXOvXJLcHGbaTW3jC0wOYsZu1P9K2X?=
 =?us-ascii?Q?c2Tse5z7IzaC4f50rTEWvp8RqRz8y8YE/xo2Mba3nr/hBf3P+yyZpBbaWePL?=
 =?us-ascii?Q?7ZOMEynylmzOyjfXhuQdypyZyuBhkdXPJ4HN9lmNj0JL7xl1yraYiuBcw710?=
 =?us-ascii?Q?00BBUFActASsvoBMMS1uZPNmN83S9ZJ66CzOvArhDcayxs7KVdx198zFjyXp?=
 =?us-ascii?Q?nIqw1xM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3DYHTDPZnYFAWIk8XJM4gY6cd99ccUgarpNJxV14+AQgc3m9zJa0W6Z+O6a5?=
 =?us-ascii?Q?u8WANiXzsgyFN2+Wk2KJ3zvS2ddngA4NuD5U1KqgKWbYx0pqsMwm5NXJupHA?=
 =?us-ascii?Q?y/4BGOJ57CcdkAqKgnCBIMtBBMj8vBSACoJN+5HF57Hd9yAbeSnPYvTLVPi2?=
 =?us-ascii?Q?Szvi7d9XmzsDChD/EKdS4KzLgdoA2UM9zPE1N8D7vNK5vNEk+0mw8K9UBxn5?=
 =?us-ascii?Q?KB59OFOw0o/+SV0tFn44NZDlnyVlo9XqKqpjDcte9Hoia9cHXtntqr9l3IpA?=
 =?us-ascii?Q?V8gn50mkmJ4mr4lHCEXswK5N4ZBD3OqL5iDNyAyAooQAPCKbEbiXQnkl2Qn9?=
 =?us-ascii?Q?cgeTolqtwo+v6+zpBOHMCHkkW6EISnIFw/MXE984E0zZG9/iuF/Q4t1VR6dE?=
 =?us-ascii?Q?MqPboEErCF4/i9AZKdOXGePZ4v2hVZmWfTR2Yey1zLhFcYfg/T8UO/XhhvRF?=
 =?us-ascii?Q?T0oJOk+voNorkn9JnC3ulMOBniOhXmAEQDRbimgjNsAsg46vkcdBqv1fKtHA?=
 =?us-ascii?Q?4zgFDyH9ynvU1tlyxCzJTrf7Uww7+uWNsFKYSdkxR9kjlC97x3LLveQ0l67N?=
 =?us-ascii?Q?5xiUGGKOFeUUS6lcGHrhO8LHsRMpm5UlVwSCYvR+WvVo8v+ymf5DElyzHKI8?=
 =?us-ascii?Q?BaN8lswVZEXguGY0ZCKpCqGMXTcnIYdiOaWHWPg1mwVC02isl9QJ2bIbx669?=
 =?us-ascii?Q?B5/388XEBpotI2OUMj7jDEuXeUPBjj6IaQwKmKnysVQ4Fa3G16eKAzXBJmZG?=
 =?us-ascii?Q?i++ipfmgFW2KhXpxrHIoLL7ZNtVQAzfnKlzqmkUJLWTA99sjbuCxwTMjrYUc?=
 =?us-ascii?Q?CFYtCR3khJNVL+cSu5A8HKmCly31ltQodfZc1zr4r+z1G5KCxvAlNPcN4L17?=
 =?us-ascii?Q?sO9fslbUdpC4lGZ41mhy2SapGXj0ke2oe5L6MbV2ClHYs3ge6O9l/3rmnVUD?=
 =?us-ascii?Q?g0G7lh9hJDCujCkMTsBpobR/e77bRYjb79jWNlyhJrSWHGfLknsrJmsE2gpK?=
 =?us-ascii?Q?YPtRr8UsN2ezwap8heCusVxWpTOllhLjsg9EYdnUvIrchOpkCMc1rgAN1lKK?=
 =?us-ascii?Q?KEiXaP1f5lemXpafumTYdizs12xRLFG8OyaO8GXNqJqo4VeS2Myv14UT4VqA?=
 =?us-ascii?Q?KibBskA3ZnJ2If1EXn/JG5LV3VJ1jXtMMCz/sgQTM4SxlYC34lMIjWW11mHf?=
 =?us-ascii?Q?sMqW3KYM9ySKR9Y7VU5k0C1JDs0oKsq8Jm/Pw7IFbDzSgvW//nNPxABHKlML?=
 =?us-ascii?Q?QYEklbbBDB5cTXMNYQnxX85eGh3x1gR2Kn4beDM3HSwQu7ILcQzxqXvPJQuQ?=
 =?us-ascii?Q?wCW4ceHeLI/mIpxo3CGNF9oP18vC0noMtAhH3RPSHG3GFGXkHTotX8zJkto3?=
 =?us-ascii?Q?VW2kA3LxT8+1ie7XATDfeXQ2UbUxxrYc/dPY2riQvzXDEhRwyf5cNjVd2qoL?=
 =?us-ascii?Q?22NsZfgfViqACVZmvysWcdDFYQZ4jl+TqS405CsJZ1TvdtSqU3r9OCJVwS+a?=
 =?us-ascii?Q?wfHsVB4wIzo4vGc7s1MAkqE1LRFWbzVk6gaxj9mS8ZVrkeeB6eDdZF2Ji9p3?=
 =?us-ascii?Q?NFJoYr97GsD9+sW4h7P3odeed5j9zsRB+MATPC5u21o9Dk0tg+wqm4znuIwH?=
 =?us-ascii?Q?8jYqiWEYf2MfpgksqLTJQpoAYfguU3nwwpWDCFjdFNee?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b628f1e8-3433-45eb-887f-08dcabbf86af
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 09:03:47.1914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Htb4y0jm5RdayQbT1fy7EI1YZtSlLAY2ZVRZBtWyOOvhabDbwcceM8d1bDRWKn9LnqdWpBc37BmxT1lbf5x9fZZv+vf7sywN4E7/IMHiOZE338Komjz1XC10qf7KLkQf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9956
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202431

From: Christian Taedcke <christian.taedcke@weidmueller.com>

This commit fixes a memory corruption issue when iptables (with
enabled PACKAGECONFIG libnftnl) is used to access rules created by
nft.

To reproduce the issue:
nft add chain ip filter TESTCHAIN { meta mark set 123 \;}
iptables -t filter -n -L TESTCHAIN

This produced the following output:
Chain TESTCHAIN (0 references)
target prot opt source     destination
MARK   0    --  0.0.0.0/0  0.0.0.0/0     MARK set 0x7b
malloc(): corrupted top size
Aborted (core dumped)

This commit fixes this issue.

Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---
 ...se-Add-missing-braces-around-ternary.patch | 37 +++++++++++++++++++
 .../iptables/iptables_1.8.10.bb               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-extended/iptables/iptables/0002-nft-rulepa=
rse-Add-missing-braces-around-ternary.patch

diff --git a/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add=
-missing-braces-around-ternary.patch b/meta/recipes-extended/iptables/iptab=
les/0002-nft-ruleparse-Add-missing-braces-around-ternary.patch
new file mode 100644
index 0000000000..4cbc8bdaf4
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0002-nft-ruleparse-Add-missin=
g-braces-around-ternary.patch
@@ -0,0 +1,37 @@
+From 2026b08bce7fe87b5964f7912e1eef30f04922c1 Mon Sep 17 00:00:00 2001
+From: Phil Sutter <phil@nwl.cc>
+Date: Fri, 26 Jan 2024 18:43:10 +0100
+Subject: [PATCH] nft: ruleparse: Add missing braces around ternary
+
+The expression evaluated the sum before the ternay, consequently not
+adding target->size if tgsize was zero.
+
+Identified by ASAN for a simple rule using standard target:
+| # ebtables -A INPUT -s de:ad:be:ef:0:00 -j RETURN
+| # ebtables -D INPUT -s de:ad:be:ef:0:00 -j RETURN
+| =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+| =3D=3D18925=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s 0x603000000120 at pc 0x7f627a4c75c5 bp 0x7ffe882b5180 sp 0x7ffe882b4928
+| READ of size 8 at 0x603000000120 thread T0
+| [...]
+
+Upstream-Status: Backport [2026b08bce7fe87b5964f7912e1eef30f04922c1]
+
+Fixes: 2a6eee89083c8 ("nft-ruleparse: Introduce nft_create_target()")
+Signed-off-by: Phil Sutter <phil@nwl.cc>
+---
+ iptables/nft-ruleparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iptables/nft-ruleparse.c b/iptables/nft-ruleparse.c
+index 0bbdf44faf..3b1cbe4fa1 100644
+--- a/iptables/nft-ruleparse.c
++++ b/iptables/nft-ruleparse.c
+@@ -94,7 +94,7 @@ __nft_create_target(struct nft_xt_ctx *ctx, const char *=
name, size_t tgsize)
+ 	if (!target)
+ 		return NULL;
+=20
+-	size =3D XT_ALIGN(sizeof(*target->t)) + tgsize ?: target->size;
++	size =3D XT_ALIGN(sizeof(*target->t)) + (tgsize ?: target->size);
+=20
+ 	target->t =3D xtables_calloc(1, size);
+ 	target->t->u.target_size =3D size;
diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recip=
es-extended/iptables/iptables_1.8.10.bb
index 81eba6c967..a94e4749ae 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -14,6 +14,7 @@ SRC_URI =3D "http://netfilter.org/projects/iptables/files=
/iptables-${PV}.tar.xz \
            file://ip6tables.service \
            file://ip6tables.rules \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink=
.patch \
+           file://0002-nft-ruleparse-Add-missing-braces-around-ternary.pat=
ch \
            "
 SRC_URI[sha256sum] =3D "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c=
30264f3cc59c9c"
=20
--=20
2.34.1


