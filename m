Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85F3CDB481
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 12:44:26 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.13])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6140.1782305058372622363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 05:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=nusN2EJf;
 spf=pass (domain: est.tech, ip: 40.107.159.13, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWKnSgtV4Y0C04vUOUYKgjKc884gxs02RezZLCw9F2gZcs+icavThpdyhN069jOk08glTDLVzcEY9XPOHdsrVbp/dVBQ8m4DfkuMtAW8HD0eJAMdLzNS7TkM0HtX5B9atFpf5rw4hKbBUOrt0flvx0acR5AzzBSnLuMK1th/aIqFZceLkJ/un2m4YWfm1+z0oTVJMG88qkK9mn3b1ThoHbADfXc7d1qx6ucyGd3xTJmTVHG+CegXBXikz+AM6LIWoLVA4v4uln7RYgzGWqeYwZv8aupwmn2ulDLLJ2ByssfJ2h1mGAzSk1vVwGU9QnLGtLRJaip/Et5rIj3btcZrfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUMXPT0RNMhEGWRcUkOIVpJFUouVpn+8V6eK7zgZnhQ=;
 b=AXcY6gh8GDYmQhjq4TwlGzO+rwMWN4+bujpsLfbiM3R70PU+fTY0NKJAENePYfiBdej7CxHCZ0GALcJDlEoFaHirazzb1XJKs1wOKEARKvC6z/Z7a8myUWzdPGAePAjLcCu+OpyTQbdaPE61VAU/uvjyb3aKdbm+xitCU//DUHmtbJjTgzXoWNLlf4kmoOYOVUep/7TfsRf7F7etsyPzWNMLcwV9FUThbZNm8hiaiPuKwitrsKrMKyLh/2z6asDaNC1eagNW2F036xh8pcCibMJFNjVc9qCwy9wNBJhtFqjPAXn2Gwt55zMKOm+H9L05pFW1sl1u59JOkQDqgacqcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUMXPT0RNMhEGWRcUkOIVpJFUouVpn+8V6eK7zgZnhQ=;
 b=nusN2EJfpYvtAKUQN3fsd6iVUDtvhJAXU/dmqd5BKb4n3L4JnS5YaqKzZGdBIx9vtu2uuec2hJtN7xJgXLJ8/dNdi+mic0NiKqxSSjLbFlHXsyntpyL6Mp2L26OcjV57WciQunMd/Mu7pxR9mRAbbFm4X+kEPZnwSBBG0FFkZz9wmAxzPuWFPcyzzXhgy08aWFtb41VQgwsJ7f4mPaYtVErYvMtLKQOCa0MFO48tugEUPSzG0o2A9xXMc+KfXhk5OCH0h56zcPa1zhPwpBYS6cc9AK0UABYx/es8nGmTtJKjGcsEpMkrjXO0EzVJjJNJmPGqFIL0MpDU9hPwRyzHmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 GV1P189MB2739.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1c9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Wed, 24 Jun 2026 12:44:15 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 12:44:15 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 3/9] oe/patch: convert simple runcmd shell callers
Date: Wed, 24 Jun 2026 14:44:01 +0200
Message-ID: <80eb96cbb38d155591d6f5eb5281e34ce0821f15.1782304923.git.anders.heimer@est.tech>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1782304923.git.anders.heimer@est.tech>
References: <cover.1782304923.git.anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0086.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::13) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|GV1P189MB2739:EE_
X-MS-Office365-Filtering-Correlation-Id: 35842b75-0e99-4d2c-c9fa-08ded1ee4c82
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: MA89k5yxDmRu8Y+xk/d8VD5vN2Ap9v4NISXXoBUBzFKqwnX2eamkj/YWWaFVsG9O/dQNcJO7WbnKOszxMyDEhHcBEA149DHO3tBQEltFPbkOp15EFh7lBLcf6S9YRidazuHR1Uipv3qbveID6V5THHxX7/nzd0GP5NCngRioFhKHitKIUUnAh1Q0Vz6odaJJUt6fXV/uKkGnr38gSIiAPY4gsbNthOW8SvJ14KHJ7wNlh04y7gw8IJiahH9cigVWUhlZFCihX/CyT0yfDq/Sj8otyE7veOjlbaLfNtOPJUxQYKnagXNLy3xSW4nbTx+WxOHbS/0WPiU58u2BXVqKVxHcmlpeD46luGd9btnpI/vpQ2uOwzv3BmKugohOOLs1ZHNiNMUlPQsy+WvCLzeeKAsq2wwDpuuHsrA5SUcgd/VE95soEm875FAiIghd6tjsH9uJXwce7/Mv/I7DOkd+BAM+N3YQWpIhpxxaOEjFCuhBO8gTXYJDpFhHPyXVuZlYm8FKyIu+UHnldtJU5px1/ZRz674EsLbTheI45rFYNRFmoxiNK8EPBHJ+oOiMUrB04jLQ+OSFNNu2GaSOJVpzydjGrNei5u5Eoogt9pKVXqa5+CTBlNeVquLIzBStmxzeZG8ij2tsGP9JL+epkCBGoBCbbf64SLPyEGOo14HeGW0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+YaceDxvhSAnm4bP3H2et0Cb+KbxFzlVaY0NlyyuoxRb2ulxv2lB2CTCoc2n?=
 =?us-ascii?Q?B/kxTh2g5GA9lRXi8KgqtZj+wB8UT0GGiXTxTSlgq8w5LegL4PTP3+ZhsPF/?=
 =?us-ascii?Q?qPLXtKw+xDqXetT4UYRS2mdWtW4M4vWwY6BP5SRBGeOROdcWSH3KViJK4W+v?=
 =?us-ascii?Q?oHd9Vu/t+VuFeVpbP+JbkYEDo6mQC5UX6udMKut+zYUBhzJxWJgHG4t6elNh?=
 =?us-ascii?Q?6a5EjOTsfzrchWbwmlD+gV5xD4rGtO7xQiH2ukg5/l6YPCa8wQumDAOdQ06E?=
 =?us-ascii?Q?SCuG6IK/WmZVq5PUCkEGR3bVK6TnaKtqDbTziHlATCyAZ/u0qUKZL4mOM4Ab?=
 =?us-ascii?Q?yvwLl3scO3ZoGfqvl8XLlsqoRBVHCk7jtSU4Oc3va/BNRrLC0m03Bv5ww+T4?=
 =?us-ascii?Q?ebMSlqiDYu0VxrIEt8NRg7iTP4SzrJk47NHKAkrUV3kccIKCehFXpbD6PNuw?=
 =?us-ascii?Q?5zwgRCSDybNG1NOal6Kq2a8s5ywzRQhcgL3MoKTmaqcKe27/+FfLWfLTAF7d?=
 =?us-ascii?Q?5iGTLxvj6IsvMgRV/1ybZfxtgwg+raH8/wCFxi8jyea82eu75k6NPSnBbqGn?=
 =?us-ascii?Q?wKjOfe61Sc4lnfAbOgDtaT4IA1IhUTTjdPyRBgzamDp6FNxs5lHFjPBBS+gq?=
 =?us-ascii?Q?vU1CsUkTbbWgqZ8iEHzeaZYuSKvubZ/chCvfx6J0M+oe1ogRp/2RXemMiszf?=
 =?us-ascii?Q?80EbF/OkfoyZ/4jfZ0ucRxO8QzNXJn1DcQZemJQz3ho6JwppklT2ZiLSRfdZ?=
 =?us-ascii?Q?U7HiwRHdRBBygZ3IfiJ30VfpndoavunE3zs1wS5lr/4OsPU5mmxYLhVd9B3y?=
 =?us-ascii?Q?Bn4DDttUCBvB5JMP1S8V4eD+khyAsaHxDvB66mRlxFbV7V1YeOdutw+f36Mg?=
 =?us-ascii?Q?ZKx3ZBot25CXaqyVPYHOB6OiSXPvPmabqyo/Wu3Puv/Whqlfl+toS/2BRC0T?=
 =?us-ascii?Q?CDD4EkrWZXLjECkR/jsiaw6jG5SneKitbPzLXopcAENJf/b5BRBt0Y8YFhdt?=
 =?us-ascii?Q?ckVQcAuuOcMFBg7IOCrJGCDVzFnuhWf8lTS0PbnA/vtBAhUHQUpHExXNJ0AW?=
 =?us-ascii?Q?FYu9bhUL28WsYuDDP9m68AAABuDwus0j3qz8SgYSFYyrjfZN3jdQp+JmYJmw?=
 =?us-ascii?Q?3Puz8eTaIAu917yAQjNVFBdVOvcSmfmTciipzsxqlggoj81HWiyxDH9siXaF?=
 =?us-ascii?Q?MbzfFGXjC6+Fre1Fjx0+4VIpQlxnPYn2opHCHpbZry6kqwaiYuuDA/B7P9Ur?=
 =?us-ascii?Q?vJgzKbJ3w5AhqWYJNkr3LggYIB4ygkEPY+5Y4oUaCyOZXmCCG+G3V+XUHZsk?=
 =?us-ascii?Q?b6saU5CHplWQf/DMOLBlcmiMw1atx/3kYpRTlYKEIIYyBGA7ZynjEh3YGpYf?=
 =?us-ascii?Q?DuEDbszwkCaFgjEl+9E6J+ydtv27jTBtQeUmwY5LKqAp2F1ZN6yCtZNiZyHy?=
 =?us-ascii?Q?ARyEbdOV7Kklt1MxRxImET9ZyvLyLINwuOfFj6w4hUmkz/6woGpIOWFUKbun?=
 =?us-ascii?Q?Mi7MVs3aGr1w3y4uH4kvTjPaTM26GYRP+verIZugt/jxXMpyuB3M2lZfPUlD?=
 =?us-ascii?Q?kucgSAuDjFHGL9g76cq6JMDGg4sW9VnofickNwisnKV9RMIieFUbPTjtkKqX?=
 =?us-ascii?Q?IHzjGa98/zTKmnBXMRybVN8inSNreaGTk89wkAneYQ4MQsTiek5WxGE5m/Vk?=
 =?us-ascii?Q?P33TCbM20gbexXtG8w1GLU7b4cOqNSUJsCuFQDU16N/kCfNd1GDNPly9Engk?=
 =?us-ascii?Q?PczNfka5eA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 35842b75-0e99-4d2c-c9fa-08ded1ee4c82
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 12:44:15.0263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmmt4Ze8FnhXseDGOL20nFMn0MmZvN5p1ofSpkIjrRQBftfQRgRBKk/RSU0WYCiHvau0IsqVM9QY0Yk9FxU3Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P189MB2739
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 12:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239497

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

