Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB65CD98F2
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21385.1782221734290646688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UIDzOxCN;
 spf=pass (domain: est.tech, ip: 40.107.162.14, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vw/XC4yWMZXOf+G8cPDpyKn6LcTn6k8yKgKrxLLKTDUKRhfu4hl84CohkDIs4bIo4rY/+P4wGjo6kDAA5kZKxIYfKtI20/wbb2zeWII7jt4mLbZ8yOLn9Qga2z9XOvALyPOzWwrDG0fDuQXhiG/ml2/KgaRxpoibFy64dq8O5mGEWKq0BqfhM9vpYCMCr5RVIypUi0Rv1V4A9T40uj6fp5ByqPx/UgOpl+hi0KDmOA4BP/X4rAAV9r7LzOGtAEpnQ91P87siwwjasNRK1AQPhEF2Iqx7flvjYAAMfietNe3YO6HzJEx2MnBTG71uGXqpu69J8sDZASSUl6JPCEcyFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9I3SfQXISsedP0k6xDWHzHt7JLusXgN9J/8aDnEj9c=;
 b=BAfkl/t61++fxWtdN5b+uXaJ4bJkX2LuZhJfmogK1im6+uFEBM9KIOTsYT7LhbH+vdFtcIWMBfADfkx7mB+RI/zE5v9mxJ7VA1Pm9XHfNZmPDor0Y5MuhYBmhMwXefC8YJZOZ/vJuHlz/PHi4oJujzMw1W6lG6/voRXxkYfIa21cqwbs+XQga+q8b3rGa2TSuFZHsXtEPPTHPlDnrHMMAyYNdEze+WF7um9rP5/BNA3ZqDdvzpyX9EywJtGHApoUDI+Lz+IXmDeRwFS/HXw8vAIW1ARe+ExoxVL1+SHV7F293GqwchBcFMdoE/mvwcVpwUf7iC7Qc/J63fklcKMWLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9I3SfQXISsedP0k6xDWHzHt7JLusXgN9J/8aDnEj9c=;
 b=UIDzOxCN41Hc0wFkiXRxGrPIf3Hdd3v631+tlYlbTYwjrgviDxDk3cjzSE0AGzripjiE63EsPSfB5X0H5+sNxibS0XCw4qvhrfv3cPi+zclqIuyxrvusL05dH9djQGRGlio4sZNxmB3/LlPKEkC7YUCW00sFv55wkpquz7C1B3Im/zFmvLH4kM7J3fKsX0Ru0Pi7ZSqEB2Bl89Ii8DBNWRjjr/hZjO09cXDTcykJBu9NemMym2dnaBkQBEEudDH+ElcLGonSZcl38erBz6nS8rst2yfjLqudyTqgnEUHLamdy8kueCb13SaAUPZltKOvgYzCD7+rRsn1+JnjmRfuWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DU4P189MB2742.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Tue, 23 Jun 2026 13:35:33 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:33 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 5/9] oe/patch: remove obsolete PATCHFILE assignment
Date: Tue, 23 Jun 2026 15:35:17 +0200
Message-ID: <20260623133521.17053-6-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::35) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DU4P189MB2742:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a42c27c-d24e-4701-07e4-08ded12c4ce6
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 8hMstQWfzN+SUSH30Rl6piNRLvu5jaoDzw3hfzkJIYrrAL+7rL04w3vGX/9DbaEk1sK9rkOtGGuePmgfeLyaK7K64QBnD+yKia1VIHgni5wXMlAI62mn9jRBHDwSRuqLfyQ5FMG0nLWCbVqHfyWMW1boWFVr3RQ6zPx6jngVQ2j7nZ7JG+gTiuNbyYynqlTjt4w9/BBwqssC6+bT8j2UfAXaM96Oya55yBl8Z0nHmFhcRMaP6YBc+4s4+YW0FPb/DLgC2aP2cAPirrc6+3YIxzT2QJ/UPTRdrGc27iUUgrkb+lTcj9UJLzziJuL1RLMO0T1rjRr1PxbYwkIvHOgul2UMnDtetInF5zrXe32iOGbZSu59yNM86xrua75SyHCI2Bnh4KtfhXznuf7Ul7FYY6iqiZouHVZfV2p8R9LGIiPVsD+5WSKlS6nom41mOSbSsZxlVZKkqQbe3tO83pGzlz53rLX+jHiKUo2GEd9OUhlmiYSDhsCNHO7ZfZww9ycR98VKVshi2j7tC8dt20fVY2H1rWz9FApiI42snOy37tRdm9QnKrWPcXgtjbswuMXzIhS8JtxtmnbA9dam6rDBOvPQH2RVooAHVhFV10YBidO0KRnSUK1vGKk3jAvto3EYYuH9p+s/zsoHk2U4LIO9qMGn23blspRRoUM66k1Pk2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?blYTYsaTlPzjDGaxdO2L86OherZ1T0T0KvAZqoo1bTwY4e8BlMdnWaStBuP7?=
 =?us-ascii?Q?2+QkAQ7TfyZC6O5GyQzYCapzQb6ed2rZ88v4nllTEW2OgwB8LKdKUF/iY18o?=
 =?us-ascii?Q?22TbTX84EJC3LhTYPxZTex7wIH5sb90bNPBvKv2ghfRLx2jNe0KDCZ2kvP1q?=
 =?us-ascii?Q?cu4SCw+m+2OAc/2dsAXBbyW0ISaD23ljzshNBPCp5qSobS2LUhQen+skxb/W?=
 =?us-ascii?Q?3a0+LZ0z6Tsk3Ds/Yigw+9ioVuAvNzL+NqymzIiw8/khdNIX7R8TvaYoBLgo?=
 =?us-ascii?Q?gw/IQ8wBvuzLourGMetYGd6VAqFlRstQKYWkSKSMviqXnZxWM8jQ/KoFAp5Z?=
 =?us-ascii?Q?i+9qprL+Tjli/Mp/7XFKr+2wk41KX61KpMW+lwXvygocO11CYejrGIuUY9au?=
 =?us-ascii?Q?ekYJmHCFKdFLiA0kO8dwjNxrZM8J/m6GBvCqdrQ+W0ClhOacaFATAFIABsCN?=
 =?us-ascii?Q?0zSmwMrhlGSfvquUHNlhr4f93mZMjBbHddWPtEEp3WopNfmN12YSxnKlyShy?=
 =?us-ascii?Q?hYZapwcM5QTTjEpSS3SCB+Xy2Y0dWI1JkK3cntF8lglAVrxaex355/vMTSwD?=
 =?us-ascii?Q?qHnpITv7kdR1LXIkvK+4UqNk9xBfl8XqsONzUDKAF8WKmIWMUdU0J2O7PYnb?=
 =?us-ascii?Q?1M7efYnN44YdSR0erpGOLWFWed1f65nOfeLaqR50RPvZVbTXHfSd96mG/PYY?=
 =?us-ascii?Q?zEnfRkv1TAfG8x16+QcYqpGPOfM0f2iVCvWd7/kNGym2kXuU4m0UzbAftPFO?=
 =?us-ascii?Q?3iaM6dprpx/QQ0/twmRLfQvAoaynxhOLiMhshqjrmig5uMTfx1QjmXoQmCNQ?=
 =?us-ascii?Q?8Hh//hFJIz0Hy2j2ySnzTEfFwYGDvYNg6AD8NNCQDQs6SnHTz/8OvUaql3by?=
 =?us-ascii?Q?6BjGdRf+Av12eN/R0YNAOk+AYf3mmVuW9kjuU496mrxPtRC538o7VzMgwVjj?=
 =?us-ascii?Q?VKGuw8iNsN8Fl6il3DbcagCBnhvB5VJ1vAQPiHGme6czRkvliyekIw4K38uw?=
 =?us-ascii?Q?4gP3U4wMo6mXbCtEeOPyLdJ3d9Rmy5H5e2DMLvK1B688U6+e3vm600L7rxt5?=
 =?us-ascii?Q?ZWupQAKhxtFZsXx12n1FvCm/w7KKKxayNv3vIIHJ0/Zs3o4p/mdrJxxUmp++?=
 =?us-ascii?Q?LL1KxZ3lktunsfzYbNpQ81jrjhtjAgdoEzxFMo8ANZeZvl1uOXDBEW3CCfKD?=
 =?us-ascii?Q?Np8R4ipjqjsktk570C4RNNF6od/aqFIlcXkuWiT5qkQcMf+AGWHMdl8k43M9?=
 =?us-ascii?Q?DRHKjZCUGMT4t0oSzWQqwZV4SmRy2eSetr0k+TimcjhOmjEkZKMdsuIcWj4N?=
 =?us-ascii?Q?fHwp3eyLYdh/tpZQAH+74sQa61/KmafZISLSIyfmf4bjoPRmQNyyNMKQ3jgi?=
 =?us-ascii?Q?PF/vThkM6HyqcEcFa+cx6yvDHHjbVjwzqT3d2IiNKovKCiXIYZA6dZalDhog?=
 =?us-ascii?Q?LrWN6OqlscGqVtw862wGXvVerpRhZFhWdTcmAj3t6Suum4BfCw8Myd6cPKtA?=
 =?us-ascii?Q?SyojkHVwgz6mZn6pB85emedW/VBpAmYvsFUSHgveAU/Ine9H62CUhRqsJtLS?=
 =?us-ascii?Q?bcZRprLo6q4BWkGtByJVolgpLTXjMDZ/lNEFj9k4mKHOpG1/DzZyza4sLXD8?=
 =?us-ascii?Q?OGeNPjv1KGOad2cPUvvKh3klHvihLNwsEr2+UOH0KZSmUhQAT2yjfty2z0VD?=
 =?us-ascii?Q?26HcDz/QFk4LzAqqrdE+V40IWD7FPWfRKOXjurcCMjyjdGgFPeTqejDhQbEm?=
 =?us-ascii?Q?8U4xovHCMg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a42c27c-d24e-4701-07e4-08ded12c4ce6
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:33.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KycrTRuBMLaT7hBQFjLKOnhXkePaPeHHO0iAtJDwNqOJ7i8Gx+z5kX9gdA/43diKRJgyhMo+LTUK/u/jhcALbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239398

PATCHFILE was used by an older Git hook to preserve the original
patch filename. Current GitApplyTree records that filename in
refs/notes/devtool and extractPatches() reads the note when recreating
patches.

No current OE-Core, BitBake or installed hook consumer remains, so
remove the unused environment assignment. This to simplify the runcmd
argv-list changes.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/patch.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 1ff57a9f8a..9240637189 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -584,7 +584,7 @@ class GitApplyTree(PatchTree):
                 check_dirtyness =3D True
         return check_dirtyness
=20
-    def _commitpatch(self, patch, patchfilevar):
+    def _commitpatch(self, patch):
         output =3D ""
         # Add all files
         cmd =3D ["git", "add", "-f", "-A", "."]
@@ -595,7 +595,6 @@ class GitApplyTree(PatchTree):
         # Commit the result
         (tmpfile, shellcmd) =3D self.prepareCommit(patch['file'], self.com=
mituser, self.commitemail)
         try:
-            shellcmd.insert(0, patchfilevar)
             output +=3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
         finally:
             os.remove(tmpfile)
@@ -621,7 +620,6 @@ class GitApplyTree(PatchTree):
=20
         patch_applied =3D True
         try:
-            patchfilevar =3D 'PATCHFILE=3D"%s"' % os.path.basename(patch['=
file'])
             if self._need_dirty_check():
                 # Check dirtyness of the tree
                 try:
@@ -633,10 +631,10 @@ class GitApplyTree(PatchTree):
                         # The tree is dirty, no need to try to apply patch=
es with git anymore
                         # since they fail, fallback directly to patch
                         output =3D PatchTree._applypatch(self, patch, forc=
e, reverse, run)
-                        output +=3D self._commitpatch(patch, patchfilevar)
+                        output +=3D self._commitpatch(patch)
                         return output
             try:
-                shellcmd =3D [patchfilevar, "git", "--work-tree=3D%s" % re=
poroot]
+                shellcmd =3D ["git", "--work-tree=3D%s" % reporoot]
                 self.gitCommandUserOptions(shellcmd, self.commituser, self=
.commitemail)
                 shellcmd +=3D ["am", "--committer-date-is-author-date",
                              "-3", "--keep-cr", "--no-scissors", "-p%s" % =
patch['strippath']]
@@ -662,7 +660,7 @@ class GitApplyTree(PatchTree):
                 except CmdError:
                     # Fall back to patch
                     output =3D PatchTree._applypatch(self, patch, force, r=
everse, run)
-                output +=3D self._commitpatch(patch, patchfilevar)
+                output +=3D self._commitpatch(patch)
                 return output
         except:
             patch_applied =3D False

