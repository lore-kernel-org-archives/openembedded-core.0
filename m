Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB6CC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 07:54:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.91])
 by mx.groups.io with SMTP id smtpd.web10.51340.1722239665399712991
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 00:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=fGdp4sOp;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.91, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5GyhzCwSQmL6utqAakmNlaSgyHBTdzayL7EXlayWSNs4aGqcwj5cWYbeMIjF7cHdiRFlcxWRP2OYj5ewcd1BMxeZ5xcgK3yTrhm052aDtL5ey78pw0gkbvaCNvRec//8F+kXH77VAFKyVu+aH2sIhAF+s9jrNoz1dlDyUCfG0oD4ozOdkITkrMX/7VA5rqC0OPXGBjJ23qwUk4cY6Smjk2fAoQDrISj/iRj/cKdqZwaPJ2dCMKDWfgXCFvrl5muNy670WFr9gdRsx9rAyyeITWX8Kye+ajHF2ARETCIRKEVSQduwYiYuQgNVgartpCGJX9k+iuFovQMtKJ+wdltMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnUxUUunkf/WQUJATTX2TbhHhJ6fUyMkSEA7zksQrqg=;
 b=x5MVpb6IlNy8c0dSc7e61NnPcqRpuA8P/b1vZsRlffIO3UeyaVg/JWr2B/689ffuJL18mVgyBOlQj/dJqLgG7BNdatrVuomeI4HviHvxxUg3UMR+TQmSipHf5vyUMoCJWID6s9x1hD6l7DZUuNqi636tdpwPEZUxrax3zk6nkgGKKjdFL6bOiKFxE0J7aBL2kQ5pTbvXuZwH9sMiET+WkC8kkzr/Ix941QSHED1tOYYa+HLtYSAEe9FJ1n+JiyWrrhHEKs67cUnQV5p/O18dCd15YsPtUzYnSQpDpXlvPFagmygyVCf+e3EISyTpHArawabCkzM3guLO9iTTTmdxxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnUxUUunkf/WQUJATTX2TbhHhJ6fUyMkSEA7zksQrqg=;
 b=fGdp4sOpVuT6KSfB8EIl416im0OX0NS/fEe0lgdJNWRhM4/tPm22HKMJrWpcQ27myWBl27FCHqw6CeWjtohMGwheB3ITrozRX+FDjOTGBqibiekTIdoPRfiBsfwp9vBVmGke+U03dk4lWxFTmCKUbuQYEODnhFhdCyWd9rjtsKvfjtaHAgZrelPPaYGFwgjiDdHPVYDF56FkSitQaxJ+Y4SZBEM6PTgie0oL6adGwk/kqk5kWhvsj867+A+l46Qoyz/s6riWIbbKIoN2c6LOT6nM/2Ue8g3cT2HUQaEJ5QU9FOYJJ1ElqDuQbVLSrJal8QNniz+/LHpHxOl9LxpaYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by GV1PR08MB11091.eurprd08.prod.outlook.com (2603:10a6:150:1f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.23; Mon, 29 Jul
 2024 07:54:19 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::7254:707b:b5d3:ef15%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 07:54:19 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core][scarthgap][PATCH] iptables: fix memory corruption when parsing nft rules
Date: Mon, 29 Jul 2024 09:54:03 +0200
Message-ID: <20240729075403.15533-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0189.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::12) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|GV1PR08MB11091:EE_
X-MS-Office365-Filtering-Correlation-Id: cf664bed-82e9-4594-97eb-08dcafa3a70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hFN/EAYl3R2ziEDAxjjLu5pe3XzgoF4/q986kWU8xL0Fq1IshjvlLfxrqN46?=
 =?us-ascii?Q?STrmKEFe854ODSQWmmW5TP5TufrzU+bJtTJW9Zh3xr148QLuE537R71qzTZv?=
 =?us-ascii?Q?MsazIi89ZB3mKsoL45CZ0xHNI4IHbMVknDJYzuCtEvnac7rbODTK4rlT/lJR?=
 =?us-ascii?Q?bPNN3wN8irRGI/Tyf6t3nY6hkFSY4fBIe2Oz225Zn9EgoCkXTGKcmBlPz+Xl?=
 =?us-ascii?Q?qMd3Oiqo1lnA5ld/PqCPhI+xtznczAp2GS9mqn8kfpFo5Bpel23Wcs74SHV1?=
 =?us-ascii?Q?fOKK2py98WHtXb5yELyA1eq7+I+g6RZSw7pWQOCUS4maIJULQcfDVbFwicKU?=
 =?us-ascii?Q?dtjJJEvQvg8vhAX7mI+DDWMcDxM5h7rpk417/zMbTBqvDSX/uxIZrxnmXddH?=
 =?us-ascii?Q?YFSShBjiqBTuEl5HcNS7nI4iud9u72/JaXb9jrfQR5u+inpagDEtttG91qi+?=
 =?us-ascii?Q?v3BWCWHOjDFzIqotZj1C0N/F28AjboBBL6dK9KblhxnyvLnSxrFW+2tccp3x?=
 =?us-ascii?Q?NlNbZm4YWxH7BHr6z/fgIGmtAjC8qFJAZuM5WGY+6PAI5JR64JfWA0dqMMt+?=
 =?us-ascii?Q?s8ZVEG+9z3DElTg6tipfRKB/uCORYQR1kNL5A3eF1e66PLyYp2mbwrK7TM7S?=
 =?us-ascii?Q?947Wo8hcyTkUeRCAEUOEVse9Vr9lTX04g16mRIZ8bJDxu229838wqOrZaAtN?=
 =?us-ascii?Q?ki/DXiJlLlkIHNW30zSbbKmQCKG1Z0BsOBT9LC2IzrNZ+Kzpqkg72v8AMb2H?=
 =?us-ascii?Q?wqFNMPuTWQZ6s90t5YPuxFQLDNCdwhDaBg0V2B2wgSe8pgF2nXspUdJEnOXd?=
 =?us-ascii?Q?ZpUfYoTtqFxiIUBlQ6/4F12g+KD8+g6dZ0bnECu+OHbGPgByuHPRWfGGiRNN?=
 =?us-ascii?Q?hUDDlylg69nBpu7v8BDquiYk5Xu0wiCjYucvrLqDZxNcd5NzMGcM0gIkLleW?=
 =?us-ascii?Q?mdR5FvNflE6o/FFYIwWugqc4JD9sHA1PiFaeKBjGbbfmFGeRe/DdbRxyVndD?=
 =?us-ascii?Q?y/9gPc1IHP37elTITctOlNb7He4+PGJeD2VNlcfiizqLh20I4ROp3FUNL7CX?=
 =?us-ascii?Q?XKJ6Wlv1LeG+A9ZPJ9PInXkEG0w3k6F0u+8WwBcw8u+u9ph+f/ZcOnI+sImO?=
 =?us-ascii?Q?GYhTfGxePCXldPugINwwQeJPCzKY85caJVP7MPdLV0UdTs84KDrh0eZEKX18?=
 =?us-ascii?Q?KMuTD/fiFrld+tj7UHgD96QOq6whLlNRBIk1pmVeRi0+69WkEcqRN9gF5mV4?=
 =?us-ascii?Q?NBINJHyAgegy2//0uadaxZBBOLqdqeGz3e4etmqWA1lMmygtpBqdM37o8RhW?=
 =?us-ascii?Q?YS5XFqdrFmy8S86GqyY3eN53A3wWvy9lDkleQSHyH9OyArGd0qs2rd7aQa9U?=
 =?us-ascii?Q?1IeXXqY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lDNKmQzptHVIFeEPt5xjew5zE73DFisRsQAdkggUAdcOwkBcpYFN2PFuSpLJ?=
 =?us-ascii?Q?2nuxaLIrrt1soZcW86ZPbzsI2nhs4M3+T0WI7q8nL5QLg/gclqejW96J5sUZ?=
 =?us-ascii?Q?3qtDhIHJmm0DCZY7G5oGo2YU+faDDzkPr+Z58d/vTiRhVgg+s9egNVzr/yyW?=
 =?us-ascii?Q?wpkcjm1WwaCqTkZwvfbwc7VSNU1j/1WvJSWZ/AodvnFSkMdBe6GbYgZOwDZM?=
 =?us-ascii?Q?LrnkbPa2CeQyRYPIcZBVSygwjvE6p2Qv+BZWBduXZwu6DR756Z55WLwnK+IH?=
 =?us-ascii?Q?RO/LQH3iEpLb5CPGzNuWDlQpCmjhNCZvZKsZFS3UDsE2tnXFFMvXBcxjc5uL?=
 =?us-ascii?Q?1iM8ezX2D2PKrTAib3r9st2Az8IHBQo1FCAZAKZsMyXS7hXwggbhKxYE7sAe?=
 =?us-ascii?Q?WlhFsBnUUgwwUMjwYMbrAOaWqBRGkomamR4lC8zm2SXE7GScE74N1O78AjgC?=
 =?us-ascii?Q?uCJPmkO4XrzhnKfS84ttDfjVedQGJA8RD1j0LaR0qNQwzWwfwSeTsJ8RIBS0?=
 =?us-ascii?Q?Ww8wUk809fqIKeNJKFe2qxuZhTPE5QiXMJDElhWhFfO2s8wgnBP9+BxS9IZX?=
 =?us-ascii?Q?JPuupCiaPlJZ5uJ2IeAruhjZLXJ72Srj1qD9mvASgXH+zMxZrkMQynzJ3nlg?=
 =?us-ascii?Q?7Zm+3C//O910gqqFzaeq/oyTwsiuAWavX8eEQoOcXG1JrNmMUOeOBw8zKHRS?=
 =?us-ascii?Q?3Z9gLNamOyDQKiHaRXZcYrl9cRmaYJ2UCZV/1yHqLhTuILjalQ8lqOVHDHcH?=
 =?us-ascii?Q?Ndu7VxRpxWoj+S//kjKNF4A3TpzK2wVZbzfcx0JLrkBJndgi4opjumfBwPgK?=
 =?us-ascii?Q?/ujwPCs/jfLdMpMIXRWl1jNBnvdQf4BoxR0XYgnC01Dp2NXAFKl+LBDIEnF8?=
 =?us-ascii?Q?ztJ0pIByT7LzqEkK8kyytv6uH/yDnLeb3K5tZLYjadBCokDefmBOGFrGxpBL?=
 =?us-ascii?Q?+mNA0Vn9qEyR3/EZjEf7FqFhBUaTRU3ZVFb8l8OdDp4t2om1dLl7kcAcTnOl?=
 =?us-ascii?Q?fZ6MltuFxUPRIvRSvnCp4FovX/dxaktgJUDLK0PnhvfUNeHg6gaUHYr7LS1W?=
 =?us-ascii?Q?WXwIdAtOiztiBKS11R6wOUVkSAQqcNhPc+Sf3wQ9ie5j/xUWsy1bMS99qyUo?=
 =?us-ascii?Q?YVsZ/JcOAQOKFNhCh7c2YEKuAEW207Z9FUY9g+7GkzonZ1j+eDoF7v7HgC8l?=
 =?us-ascii?Q?wI3HYMdRFxH1BzBo2DmKdQJMY6Ob9Ewb9ekCEQ9haMu5oOfvN3P474JVztJ2?=
 =?us-ascii?Q?mEsq0CEBcGPqffliClLuCKQ2K2D5CW0MHzl85aSkYCGzcmNye/j6iydmSjab?=
 =?us-ascii?Q?Rrn46Ya86ZxaQc8vS8WEThgf6Wcy8uXTbjgHXTaLR9RZ5zcvmBMvjacYmMqN?=
 =?us-ascii?Q?0fSGjmlr4mOpoYg3KfmOCpi3ReihiyG5G0KWLOdA/1/U/RByblplY6xheiiT?=
 =?us-ascii?Q?yXrmJb1LpWfH8paAivv+KOJ7ANl4+Kqwc9oqDzJxiDusrST8vhndj2xd5Z1I?=
 =?us-ascii?Q?P556ivAuM5qYkVFyZmwI7Udeuu9EMqB7RVGUxhDa75s0O42O7JG6vu3WJK+n?=
 =?us-ascii?Q?I6/fshw9kdrcPraTvq1+iJGxCQZqv/5JkfkPhPGRIUoxfBFkxSMYGgra0hhf?=
 =?us-ascii?Q?Ut4urskDD2ptt9qfyK7mxNC67aHy4V8qtDEU040g+aqE?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf664bed-82e9-4594-97eb-08dcafa3a70a
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 07:54:19.7757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDcrvDjdxzi1STCm0vvjf0aMkt/uqNtxRxHtl+sLkxrUKqzwEyPrVNMGoeox0EzVRlSEoXPWoi+A7lODMSf2WptMP3zpFeGx6voBNAU7pv140sF1vPuKi1j6Ynb1pDst
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB11091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 07:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202608

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
 create mode 100644 meta/recipes-extended/iptables/iptables/0005-nft-rulepa=
rse-Add-missing-braces-around-ternary.patch

diff --git a/meta/recipes-extended/iptables/iptables/0005-nft-ruleparse-Add=
-missing-braces-around-ternary.patch b/meta/recipes-extended/iptables/iptab=
les/0005-nft-ruleparse-Add-missing-braces-around-ternary.patch
new file mode 100644
index 0000000000..4cbc8bdaf4
--- /dev/null
+++ b/meta/recipes-extended/iptables/iptables/0005-nft-ruleparse-Add-missin=
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
index cd2f3bce0b..4d116d2f14 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -16,6 +16,7 @@ SRC_URI =3D "http://netfilter.org/projects/iptables/files=
/iptables-${PV}.tar.xz \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink=
.patch \
            file://0002-iptables-xshared.h-add-missing-sys.types.h-include.=
patch \
            file://0004-configure.ac-only-check-conntrack-when-libnfnetlink=
-.patch \
+           file://0005-nft-ruleparse-Add-missing-braces-around-ternary.pat=
ch \
            "
 SRC_URI[sha256sum] =3D "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c=
30264f3cc59c9c"
=20
--=20
2.34.1


