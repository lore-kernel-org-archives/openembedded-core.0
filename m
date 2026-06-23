Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7033ACDB47C
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20962.1782221729473356181
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xPDkl7VU;
 spf=pass (domain: est.tech, ip: 40.107.162.45, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lY5mWJUiwLZFB1cU4FzQ1cybUYapjmsqbm/4+ld8lj8w9tj4k6lGxXhmnG62knuTeHoWDc4KAWsZHJXIh19rpH6Fz0t4pe4uZevJ5udn8KfgwsnWSObhm460gx5b/MYJGF7uBQP1L3OkDvY/sDH/1ClkeTMMGp9b50jmfoDcCWqyYywn5zfAsyeo+bi7g0NHCTLqIonUxvujdrgaWQEfEBH2Bi9VfjOSlo1+2g1HVYJvlqVTA47P0ERu6846SWgIx5zuTJRmPUieurhR5veH1g7fevQSfgOi1CBNjOIMhMqqjsqZUxm8xyh+soxM8NlKkD7SOoQ+RN7ZdkYP+f6O4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUMXPT0RNMhEGWRcUkOIVpJFUouVpn+8V6eK7zgZnhQ=;
 b=advf2jw4yAtrfxt0ivwAKpkK1WMQNeEE97tUNqlfaRFvCoVs5oDQy9CR5BUpN7JMe9l0vmKBB0VQR7ONGIHRHOM/xxaHpcwoYx1eHHkr/gsx6Zpgtps2vRhdSyQ8uzfnTIh2s94rnEdux3BlFC9jMhWgSJbwAc97LahQaSrtaAwm/cmSvg1SOQ3zg6/eoCfsUAkcCqafKPDjc1HTkBQpnUrr6vMOlV7rZFDH3N6OdjFNflomjePV2Xdndi80giSHIQPlUe2yWc88kJuDInKuHxnPrePIl98a9OiwaEHBYg9EB3jKVQurUQbdcsDLThEHxDduc4bDYy4dJO848dF7JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUMXPT0RNMhEGWRcUkOIVpJFUouVpn+8V6eK7zgZnhQ=;
 b=xPDkl7VU5oBa+IFOt0kZUUJsLeXyK0esY4MO5gNGFrdZs26D6pN2stmNEZ7iQtdQMsfDoy4uhhnjcHAaew1vQFmWnMlb+6ykb1qZhrVRdvt9eXDAFcahk4Mx8sjCUgrnHmeUsZb+c15zaHUbmlAR0zY6k1nzAkFStuLSrSCp0bDlnd130deA9skN/nStFHQ+qxnk8d6gva7wlTxl1wR8tBL6Sttt3mEh41ygrHRTfLnnD9cU/2ANAc819mWo6NSDcDz+EpZbs0P+it4sLpSjEWVbkDlLZYuhN1d6B6ix4kNw9HEfrziG20CPOTCoNCtikbeBeDKrfIcDBFNYln5M+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DU4P189MB2742.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Tue, 23 Jun 2026 13:35:29 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:29 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 3/9] oe/patch: convert simple runcmd shell callers
Date: Tue, 23 Jun 2026 15:35:15 +0200
Message-ID: <20260623133521.17053-4-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0023.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::16) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DU4P189MB2742:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b6a5a6-4ca4-4a78-085e-08ded12c4aca
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: zvM4W3XKHZ1TxVHwMhfIRFJ+u1xppoadaASrkpEXygYNfqtiEvvPNtXAOwiwKuVkLpaFHYGNnSQq1Zl7iWVaQS+igYnHAdv0XvUp2BALHiUcVV1UIq0nG+2YdEru6knT/gt1O8dq5vc8NtGiDT3pXbZO+66r5iO82UYkBYvvwINkLaLrDKdCH6K6VRVFwtHtGWQFF58dKjl3lQE7leIOeu4ce8CcMNSbDBL1MleFiEno0paWzeTTAB8b8ZuEk5RRdhpqu86YJbQws4IlBUl0DjQoUFHY2nnv98bPOOcxIY4uMbCAXpG/zsp5qAIQWT0u236wNWmcsBx0EtQFusHPsnv5w0Qt4l+ke1v4+LnNPlzFj7CrpMGxq1dTWolpmlMQ5kCM2gzYb5Ru1Xdy0SmStuFMv7/HPbPzzNTYfT5J2atIAnYqOcGtPLgQWzkyvzCjjboY84qxLpJIeW/B3cYWZVhHSftr181IM5AKq0gogDqll1C12S8roPIBCYAzKlg0eP+sa5baUjUXnwhhabEVGiMJc6z0PXGP2BgvJ+zPq2fOLH0lqHjSEhI+GJvrqx5X5GrYNKomaX36toUvzF2zU8HPerkh1Psme3DcO1pWk+iDQjB/hxgzhDeDuxRtFDVykB0e21ycetMEgj9+BJw470zTAOvA2EDtPHQ3OKja+Eo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/FFdsMp7E4qxQFt61IrkMXOk81D8wQ5JDkN+LspmlFYrfUQCzGjX2n8/88r/?=
 =?us-ascii?Q?yaRUFY3282te1HodZJZUWHd96kguLjPkB2HiEWJuX0LGTK6RZXsG6gFZ86VX?=
 =?us-ascii?Q?xSmypC9P1EGsWS8gUa9UVpbXoqweOcrker+wDdBj28nIn3IbLR/8ua1OrMpt?=
 =?us-ascii?Q?HbTbiy7Q7SOZdA/Z80suYHplaHAh5aUYdEdO7063CWITcapf8gJUL3VBsrtr?=
 =?us-ascii?Q?v788aHyG24PQdQxrOMH+f7C2boYaJkcPIbeCHyNuiBoPaPHJ0zQF68Cd5TB/?=
 =?us-ascii?Q?LvUOi0YIceOYvl4OPf+BKxf+wOi8+VQZBd4w/IWiPjlKwfE2hq1qNejktVOu?=
 =?us-ascii?Q?FlDZue0/sLlaKl+DbSwrn4yTKbuNM5seK36/Hh12wo5iyMbLrjGVj0PbVh1q?=
 =?us-ascii?Q?wRJN7xDozcGpPbai2r9pio9sYsgoux9thXZ5QV9nrYLagzHLHbOMpbuLqTsh?=
 =?us-ascii?Q?jiT19Is/r2ehLcwgVwVx6KT1Vj95AceS1c5BU3Z1ZVaCUz+gtvFZOzjo3n2k?=
 =?us-ascii?Q?YOxRUHG2/6MrFBELNP9wcoqwUPdPX1rmjMd/mxX3s+O8764lLZzq0YMYW0f1?=
 =?us-ascii?Q?vzHr7IHdnL6F+s5iTezSQgVdkVVDezI8XjlOpj9hG25GOuiM9DmYsTN2EDpd?=
 =?us-ascii?Q?RXhmU2c2D96tIfWt5wU7rM6rC5qjt4Y22wGJ0wyizOy4Uzaubw2rgIZLROuD?=
 =?us-ascii?Q?bOB8hGiX6m+i2Bf/T+G3fCPBZelniIdf/lPu5fgzC0qUEkClENGaRgLW/HQG?=
 =?us-ascii?Q?kSL1seA6XV4+3IJu7ZtatFgjrKUGliTwxVGWJHjDcsRAdmkC4Fn0DDc6T3Xu?=
 =?us-ascii?Q?WSMyWOlixnzAoY5R5P6NGaLz6eEv8JSBuJKMdKiMdFSjVsQcnI3YDXcVen45?=
 =?us-ascii?Q?+aNWUdh80UqZoD3fe2QSrzVdSj0ucO+Jn7+fAoa0TCyoSxujWs3G6Um2TJDW?=
 =?us-ascii?Q?Zhu/T2AYoZAQ4Hil9KlkfLkmUprrSGweWAesdaRQ5+DobDgxgNU/52NHMa3q?=
 =?us-ascii?Q?LBKngw1CHECg/FSSiTY6JQu40Cc2mpJFQKtnaFGU8/NSZnvpOHGEZdQLU2PY?=
 =?us-ascii?Q?k1EsBJtrCNaFqb8/69RfitctqiRT00yUqwMJTrUzwjot+zoVdPc1R8nqy2wE?=
 =?us-ascii?Q?9tbP3DVl3MEAzMYmG09jFLWD79ouT8oAzXn3PpKlcqnGbSgTrzSRrt/0F+Ph?=
 =?us-ascii?Q?8PY+XCS1tNLJgstwHZJZHv4bx8FBVMsVaKJTNvRh4yISEQOapjtNdIsVuj6t?=
 =?us-ascii?Q?el1Ws7bB/RLcW5Uhgbdkk+8zIaEa398ktGdlJxxAK/zzo6Ex/dnFanUkSXSC?=
 =?us-ascii?Q?JR3GhPmaeKLOUnF1jlrAKC94RlYDoNJgdx6kIxgcd+otXuXJyX1dk5TyakBM?=
 =?us-ascii?Q?akiz7pWjD49yVyrRGUpr+rBOrXssdWAkih8Ho+4YsZugbNFePh846lnFFBeX?=
 =?us-ascii?Q?gyb1KTlqL98x1Ucylg6zmNd2I/UF/Chg1iojkO11ZYdKkVluh/P17vPyYvOr?=
 =?us-ascii?Q?ussHFa72Y/QGNc8EwXNhpTPwSq36KqRj15qqRRg9UCA9GctbPf/ZaBuwNQMk?=
 =?us-ascii?Q?WvdSfVzw9qG9CRAv2faOxsBACpruEbs57809S2aAXJuRmfTJjMMSpikwRDJI?=
 =?us-ascii?Q?rC/1sfn/Z7Sm+Dd/Eybf7xH7v771+JlQCjx12glLjeFiSvShBXu57IAMSDia?=
 =?us-ascii?Q?fb4pIEbhg6GkOpp4fpWrFxat/zNz8A2owP4rsLZ76OuI+3JptiyTG/wnQciU?=
 =?us-ascii?Q?hdYXwzpwkA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b6a5a6-4ca4-4a78-085e-08ded12c4aca
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:29.7506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMAm+qWyK3XBYZKKV+TZV9PvRzEl7zsJdKmO/Zjwc91ZWTh+5wYil27vW3OSc34rQlxN3C/HigNs6rLCjAtvVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239396

Replace simple sh -c runcmd() users with direct argv calls where the
commands do not need shell syntax.

Also replace the cat-to-file redirection used when appending patch files
with shutil.copyfile().

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/patch.py | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index b152a2d784..290eb990f1 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -195,10 +195,12 @@ class PatchTree(PatchSet):
         bb.utils.mkdirhier(self.patchdir)
=20
     def _appendPatchFile(self, patch, strippath):
+        import shutil
+
         with open(self.seriespath, 'a') as f:
             f.write(os.path.basename(patch) + "," + strippath + "\n")
-        shellcmd =3D ["cat", patch, ">" , self.patchdir + "/" + os.path.ba=
sename(patch)]
-        runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        dest =3D os.path.join(self.patchdir, os.path.basename(patch))
+        shutil.copyfile(patch, dest)
=20
     def _removePatch(self, p):
         patch =3D {}
@@ -433,8 +435,8 @@ class GitApplyTree(PatchTree):
         outlines, author, date, subject =3D GitApplyTree.interpretPatchHea=
der(lines)
         if not author or not subject or not date:
             try:
-                shellcmd =3D ["git", "log", "--format=3Demail", "--follow"=
, "--diff-filter=3DA", "--", patchfile]
-                out =3D runcmd(["sh", "-c", " ".join(shellcmd)], os.path.d=
irname(patchfile))
+                cmd =3D ["git", "log", "--format=3Demail", "--follow", "--=
diff-filter=3DA", "--", patchfile]
+                out =3D runcmd(cmd, os.path.dirname(patchfile))
             except CmdError:
                 out =3D None
             if out:
@@ -525,11 +527,11 @@ class GitApplyTree(PatchTree):
         patches =3D []
         try:
             for name, rev in startcommits.items():
-                shellcmd =3D ["git", "format-patch", "--no-signature", "--=
no-numbered", rev, "-o", tempdir]
+                cmd =3D ["git", "format-patch", "--no-signature", "--no-nu=
mbered", rev, "-o", tempdir]
                 if paths:
-                    shellcmd.append('--')
-                    shellcmd.extend(paths)
-                out =3D runcmd(["sh", "-c", " ".join(shellcmd)], os.path.j=
oin(tree, name))
+                    cmd.append('--')
+                    cmd.extend(paths)
+                out =3D runcmd(cmd, os.path.join(tree, name))
                 if out:
                     for srcfile in out.split():
                         # This loop, which is used to remove any line that
@@ -585,11 +587,11 @@ class GitApplyTree(PatchTree):
     def _commitpatch(self, patch, patchfilevar):
         output =3D ""
         # Add all files
-        shellcmd =3D ["git", "add", "-f", "-A", "."]
-        output +=3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        cmd =3D ["git", "add", "-f", "-A", "."]
+        output +=3D runcmd(cmd, self.dir)
         # Exclude the patches directory
-        shellcmd =3D ["git", "reset", "HEAD", self.patchdir]
-        output +=3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        cmd =3D ["git", "reset", "HEAD", self.patchdir]
+        output +=3D runcmd(cmd, self.dir)
         # Commit the result
         (tmpfile, shellcmd) =3D self.prepareCommit(patch['file'], self.com=
mituser, self.commitemail)
         try:
@@ -642,21 +644,21 @@ class GitApplyTree(PatchTree):
             except CmdError:
                 # Need to abort the git am, or we'll still be within it at=
 the end
                 try:
-                    shellcmd =3D ["git", "--work-tree=3D%s" % reporoot, "a=
m", "--abort"]
-                    runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+                    cmd =3D ["git", "--work-tree=3D%s" % reporoot, "am", "=
--abort"]
+                    runcmd(cmd, self.dir)
                 except CmdError:
                     pass
                 # git am won't always clean up after itself, sadly, so...
-                shellcmd =3D ["git", "--work-tree=3D%s" % reporoot, "reset=
", "--hard", "HEAD"]
-                runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+                cmd =3D ["git", "--work-tree=3D%s" % reporoot, "reset", "-=
-hard", "HEAD"]
+                runcmd(cmd, self.dir)
                 # Also need to take care of any stray untracked files
-                shellcmd =3D ["git", "--work-tree=3D%s" % reporoot, "clean=
", "-f"]
-                runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+                cmd =3D ["git", "--work-tree=3D%s" % reporoot, "clean", "-=
f"]
+                runcmd(cmd, self.dir)
=20
                 # Fall back to git apply
-                shellcmd =3D ["git", "--git-dir=3D%s" % reporoot, "apply",=
 "-p%s" % patch['strippath']]
+                cmd =3D ["git", "--git-dir=3D%s" % reporoot, "apply", "-p%=
s" % patch['strippath']]
                 try:
-                    output =3D _applypatchhelper(shellcmd, patch, force, r=
everse, run)
+                    output =3D _applypatchhelper(cmd, patch, force, revers=
e, run)
                 except CmdError:
                     # Fall back to patch
                     output =3D PatchTree._applypatch(self, patch, force, r=
everse, run)

