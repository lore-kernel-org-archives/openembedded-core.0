Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5795.1795180977627455881
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 05:22:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=RdhwqmLj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.117, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFUoKJvb1cVpcVumd8SWQyvUiN3z3G/ABbvh4TRcQWZpUeW7zL5sw0OqxYKsD4iqKrswLziSN3NxiM1pmS7aNzioB1/8/G6VFJWhrGgO1AuROZ02qLo/8Il+WoRuR/K9N9MJ+p2F5ADwCT5Z5JxLU4XdISPEQ0aHR01ENWMj1JuL17Fg53yhLcRzQ+WSf5PTRTAq9o+CFilR9v1COx10CBFy+ZcDQcbTBhDtX0aLelF/hrwIavQkt5zDRsUGwfzcd8Wy/TriKQpj/UCdQus7/iNA3gz7t6GmUPKw9URR1rVJsFCphfhq8oh6CB2A29TmQA/enGpsJzNh54SNe7gdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNd7nH92QXtDjQKKX1w2eKp8qavOBIcZw/LE4YGQBp0=;
 b=bFsZR9Os/4fF8xvZbQj9L7XGeiAJxIgD3fZSe1BA8ZVp+PQMgfZ2sstPHUjEbBktgJOCc6JL7eTpnIdjebb2rppCJVaHxdvi0ySz+N/io87GPmWL8QN/IKUEOjddVs1mdcqDWfWK/hYP0WIM7z3oT679lV+2Sth24v8oEbGWT2nd+kcbwX6xg9WdKmdPQQh0/1W76Tm7TIfJuNHBjLr1efageJd0Ve4oRDMk0uw5JQC9pShFExatRj9FJ18PZbTO/7sxT6/jjeLMKHCnRmhBsM4Id0IEzo04vuZgXlicfNXzlwFF3wN/rbTdFEfb4eQnRNuuHCZD4m2ykhcTP6MhjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNd7nH92QXtDjQKKX1w2eKp8qavOBIcZw/LE4YGQBp0=;
 b=RdhwqmLjv9VxEwgYNKFAh4yqeoKfpE6yaofkTiiMM8L1Pg4NsDa4t80sKp+8tb6jKYMgAod9cu3bodZC51s7zTnqTv4J86uR8gqIP4kHFKNW8yqFUQeKJkelunY/sLPqV5uEkDYu+l87uMG/NoDWnGaIeFC1vfzL0SxZy5j6R6Me0y1sZuEATyalCffI7vLpMcSWLsj4//a/YwaPhRXmndEiJ7/h1q2f3OhPe/pW2RbLb1JkTT703QPXsFANUod0wIIIzSyC87m7gMZLz7pk/IV9gshMVleAkkt0QeoV8l2jPchkDd0DUluBxIKhWeseop3YapV96xQHGAAApqvfiQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com (2603:10a6:150:1dc::17)
 by PAXPR06MB7773.eurprd06.prod.outlook.com (2603:10a6:102:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 13:22:51 +0000
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc]) by GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc%6]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 13:22:51 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH] archiver: Fix diff mode for recipes without S
Date: Fri, 20 Nov 2026 15:22:40 +0200
Message-ID: <20261120132240.31653-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF0003D7C2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::28d) To GVXPR06MB9766.eurprd06.prod.outlook.com
 (2603:10a6:150:1dc::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR06MB9766:EE_|PAXPR06MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: e80c2fef-5ecd-4eae-ee90-08df4709609f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|52116014|1800799024|376014|23010399003|18002099003|11063799006|56012099006|261026121527099003|261102123227099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info: s+Uc8fg+bqnhPSFjbZGBYMoTMWvpA5dkLL1KiFvin5/4Zmxpt42KCQ6O2adPg7k8Xhpk939TtcADHSnwqN8WaEL5qpA5OK0MJYOLOrAe64QF7T3rDHXINn2PqEkCGJ39tTGU0oQWlTvC+a/FVN5g85dqS98J0tUH1rTlXZ7EdT5bMZ1tftZ5Vrgjwk+6Ip6xQ+UUcPEU99fLZpS/x8C9raZKHcTlRnfeo+R7+lVdn1sJnfLY/TaGgmImdzF/hImIlP5P69oPcYFdOmQu4bHzYHPnZF8jUUjAf5Vuz5DTG6GrR/3ZdAgK8SPNjK5xmM6MggixDa24Yt1ruXBvMYdksTIs5ymxxrsEH5hRnSff3iKfjBdYiMWDLKCRph9oNbkkPC1yZYlcn1k/uqA9BMYl5zm3M6gxmtlwanpUq/jACZsQvaNiKf4n4jU9CcsRBiHo9HMwZPq/t1D4+ZkSJ0kziBNhE96Gz2ao4O0PRoquOezfAgB/CpgkOz7JKmEVWOR3BfwR1QivfJlA63WU7CwHTvWwx7XLMK3+LJv231ILlD8tooI7kidD0xueEd8gTlPdxpNJ6SRQ0oE9IljZayhEcP+XHRRSPePobmmO+aYYDk9d8NZ83tc97VUT+nBr7+tJBR2Z6XPLQD90WhjRjtmsZcmsuNn2KDoafDBe9UpxCKBZGOHUwPszRaUluYV/uMU4nB7brdQJeHydep+bCVwXJQ92L3n6HHfYItaBJfvKQA0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR06MB9766.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(23010399003)(18002099003)(11063799006)(56012099006)(261026121527099003)(261102123227099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(38350700014)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yVI54KkEcedzTEHeD/Vl9J+Cbb/CsYJSYSS+3AJ0zTM20pHoReMvdQGnM2qz?=
 =?us-ascii?Q?pcrfxKG7FozQwZPJEJ097GKsAoNTgcPzBc8kRVxneIbhnz0ELP6Msk0FdIQP?=
 =?us-ascii?Q?+7g08cCGSJAKocKhE6jYzjo1swJJlPK+eNurTe2Jfw34nB0PPqOj4EBPDYLq?=
 =?us-ascii?Q?UqO6MdJ/3KxNlfQJz0OwsAa8Q13sJrp709NRVOu5Wvc6v1JdjmhwGH6Ckrdc?=
 =?us-ascii?Q?geZMCJBplYKrmdKCP5e1rYzKiL2Mw7sWxm+5f+ySoUJ8XQVHlgpQ+113U78M?=
 =?us-ascii?Q?b4H5duiWiEJt8UOV4H8cwWGWUgOMYo5vEXDtbDzcgugyp2b0jzA97x3T38F5?=
 =?us-ascii?Q?nwZMVeFTPDp6y1Vae9ptHQ4wWxqhwHlNSRPNVr6CNXx7tJ/9yiVQtawnpa8u?=
 =?us-ascii?Q?3yjSwQsifkrO8PBBWUukF9VYRKlGUsICPfkjnpPBy72tHHZFl8WAgZoKV3zn?=
 =?us-ascii?Q?AcZCcwMYnurilv9C5tFfLCriWpUfi71XenaRtR2XyNU0aUsO6CO+no5MZodQ?=
 =?us-ascii?Q?i3gTB0VSdcPJH7hobVkHWZnaycdiRUuTCoojM7YgVAXVWJj2c77uZbrfR2/H?=
 =?us-ascii?Q?OZshrE5JxgLqxUJyeIAdM5CvWscD+ngqp7B6yf/nBErQ4qWk4Y/PmycJJ6zd?=
 =?us-ascii?Q?X9fd9g546lagmaIrNzysLk2h3g/dnfheHR5B3h2pjyG7Ikrb1oNWI+Oyfe0o?=
 =?us-ascii?Q?8H5uzi7HJHDNDBogMH/u1z2997C3OApnJDhVcflS6uUTz68Ayxo6ix9bfQwr?=
 =?us-ascii?Q?bLtj0V49VuigjLaTpmYRSLQz6kkUycT76bWENlGPx9b4zQ8uWB22NyKOwkHj?=
 =?us-ascii?Q?0KW8Z0JiPnzUgIUdMoX4igifBbDxn3gQw7VDlVQh9s4icTYTeEwC7Ju3KBPn?=
 =?us-ascii?Q?H05t18XoIt95AY6SA48v+twlsZFzCsxgQT8glioEmLS+9hFfLfoHu5/X76Dv?=
 =?us-ascii?Q?9D7mb4J5Ft/zgsieAMWkyoze40/rRC7X/gMwSAJiBsxAHIk+1PCsRoB2/VxB?=
 =?us-ascii?Q?WrnYknkiUjtQB4QrOF8PzKtrHmKRRILLfeo4bN8H3iesJcTRDSZz1ORNfIRs?=
 =?us-ascii?Q?803msa7wevRS6yrr/x0Hywc0vF3SfyOLhFJ7uq37nl3141xJ0vZWupJjJrI8?=
 =?us-ascii?Q?AfNE2t6/fw3jSRRKQvNQ4b7D00sMRiWV81UZjINTEJb9e0qaX1NvVbIrOhYP?=
 =?us-ascii?Q?VTQHbB/ItOXfs8CYLLGsE2uf5sZnAJ+bbLTpx+eaReby0UOoZ4C7P8eHwpZw?=
 =?us-ascii?Q?tp3NHkr8lA1TMxq6s/6RG8AV38BX9Epso1VfrSezQRxHavwvV6fyFaz09cTv?=
 =?us-ascii?Q?NpAjHtUswUOYJ75rDjp+z0NnY1wOH9JhL+9b0CQCRMppGJbVtBlStm6NogZc?=
 =?us-ascii?Q?dFsMgUqVPaDtwRnY488cidvmmztlaj1Ef5FRXkJIK7RB/W7CoI6XCrKjWiyi?=
 =?us-ascii?Q?mlrxwOQVYQgYsHMHBtWxSpoA7jP0EX6qgb3TlbEXjUkNSGyfHevc89GpeVKC?=
 =?us-ascii?Q?LI0QU2PNK4UjtbFZzCzwJtnz/mtGMJCjoEoRWybDyDkaQShGwD8aV5nQN2sp?=
 =?us-ascii?Q?aRIbjgFc4OE7gDBBNSKQq8dA+oepRgBbsEpfMwhzp4YDG1vQ72b3uoLBN9vq?=
 =?us-ascii?Q?fvH3M8+7dAwUU7cNxTsOFU6/CDuWtuP/kw2LFgrq591l+u/1fG+ySR+KQCrS?=
 =?us-ascii?Q?TyRZVMRWQHQe9lcOE13dgJ6V4/cGwTeUzUFrccwbhek2RLj/n3zaOuy6DvjJ?=
 =?us-ascii?Q?er4/LwW0Xw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80c2fef-5ecd-4eae-ee90-08df4709609f
X-MS-Exchange-CrossTenant-AuthSource: GVXPR06MB9766.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 13:22:51.2848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FesSqNRmgUFuzVqDgyGSTacStN3PEjbqNMyeFOXpICBzHiJHO51eUwtst5qOci3De7LcmnIi2x/5PfYjKxm2Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7773
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 13:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250790
Content-Type: text/plain; charset="utf-8"

With ARCHIVER_MODE[diff] =3D "1", do_unpack_and_patch copies S to S.orig
unconditionally, so a recipe without sources whose S is never created,
such as systemd-serialgetty or perf, fails:

  ERROR: systemd-serialgetty-1.0-r0 do_unpack_and_patch: Error executing a =
python function in exec_func_python() autogenerated:
  ...
  tar: .../systemd-serialgetty/1.0/archiver-work//sources/systemd-serialget=
ty-1.0: Cannot open: No such file or directory

do_unpack no longer creates such an S since
commit b84eec5c4cbf ("base: Switch UNPACKDIR to a subdir of WORKDIR")
changed its cleandirs from S to UNPACKDIR; perf fills S from the kernel
only in do_configure.

Skip the copy when S doesn't exist; create_diff_gz() already returns
early when either directory is missing. A recipe with sources whose S
is missing is still reported by do_qa_unpack after its own do_unpack.
Print the "Creating diff gz..." note only when a diff is created.

Tested with ARCHIVER_MODE[src] =3D "original" and ARCHIVER_MODE[diff] =3D
"1": do_unpack_and_patch of systemd-serialgetty now succeeds on master
and wrynose, as does that of perf on wrynose, and zlib still gets its
diff.gz on master.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/archiver.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 0400d6e373..792e85445f 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -433,6 +433,8 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     if not os.path.isdir(src) or not os.path.isdir(src_orig):
         return
=20
+    bb.note('Creating diff gz...')
+
     # The diff --exclude can't exclude the file with path, so we copy
     # the patched source, and remove the files that we'd like to
     # exclude.
@@ -489,7 +491,9 @@ python do_unpack_and_patch() {
     if d.getVarFlag('ARCHIVER_MODE', 'diff') =3D=3D '1':
         src =3D d.getVar('S').rstrip('/')
         src_orig =3D '%s.orig' % src
-        oe.path.copytree(src, src_orig)
+        # A recipe without sources may have no S
+        if os.path.isdir(src):
+            oe.path.copytree(src, src_orig)
=20
     if bb.data.inherits_class('dos2unix', d):
         bb.build.exec_func('do_convert_crlf_to_lf', d)
@@ -500,7 +504,6 @@ python do_unpack_and_patch() {
=20
     # Create the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff') =3D=3D '1':
-        bb.note('Creating diff gz...')
         create_diff_gz(d, src_orig, src, ar_outdir)
         bb.utils.remove(src_orig, recurse=3DTrue)
 }
--=20
2.47.3

