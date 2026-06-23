Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04E7CDB47F
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 13:35:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21385.1782221734290646688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2026 06:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=ar0pSyOh;
 spf=pass (domain: est.tech, ip: 40.107.162.14, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ThQkuRsZNrbuXJojGCL5b2T9HuFPf9HpQ2suYBa7ZbmhyfEDNexwalEdjD0JyYCUKntntWJUpIrTSL6LXCVKgXbiMV7g1w6kgKQ+2ld2/4D0pi0TiH/qG3VVZFXwpZ4+Ef8SrSq8DeEYLGkVwucXs6n2357JNUCCaeYvgMPgJ+GDMCKTU4suhkNYbS2Zo15trGXKJTS3v6ith3vE3gn1+CddHtR/3eCFUQDx8RjSO4tcsfvpPJ/klDip/2ptYH4DO0dS76MCaLtHEoSlpg+MKRq3QYs447xh2yb61qKwMOGT6fu+CRhc5ct2sBNjOcCRTh/RpO/rMEr27NOIf4/Wiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3aNbZD9yqBs2QmY2M+rzdRbHVVQJHdwQyD1YSHPK2E=;
 b=QNhfV7WxcfjHxcwFdBnxaecmjilhyddSAvfHN7j6d1gTMJx4naGCHID+EMKBij4l2YugAKJUZgy6/4e4HS7TpRiza43yPVLoOXDlrO63+IkF+CgzBoAQ9AoBIQUwsR7gd/Zo1IHCEuk53dZ1yNFEfr4B/4WA4qZwQ1991L+K1vfjO8cgyWTSCdq9bOgXpwWJWTUwmepOlEdpKqaD6YqWA+7SZq2xdcEM8bP9z2GIK0q2//mR2S7zQSvTIhi9xBCjdt+xq2o23zxJ8Ls3yPDxQvc0BDZB2vibyYufOaOSc/OQud+e22Lvi52TejkMjZBMgQHMdf6ikMo5uJMgLSbYnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3aNbZD9yqBs2QmY2M+rzdRbHVVQJHdwQyD1YSHPK2E=;
 b=ar0pSyOhqdq7ZFTo/5RhWEPt+QOBI2p+6ACUsjGHhOzgLGkhuOPoLdIsPhOk45fOBVVWQNf1x+SKI7CSL34FZezGKCV78OSlod8vALuFBpkvYnE+WiLit7s1etXHE2aNHnAHenkYJr46spums+nawWyLzILGWnyl6cVGg/RaAaf/6G4I+7WltPNpZPfwMN52vCoiQmr5lSbpmnVHXgg6iF8Rn+ag/3di0b5Ip6ikhEUJshHsqzJZlYLetG3HrE9p5y4SzhV5G05XCVpUiycDwK2TADeTbiye9CBA3RMtqhg+qZHwGzuCI/+SGuuji4M+hPWpXzixvlQ2w9+oOPQhXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 DU4P189MB2742.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:566::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.20; Tue, 23 Jun 2026 13:35:32 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0139.018; Tue, 23 Jun 2026
 13:35:32 +0000
From: Anders Heimer <anders.heimer@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Anders Heimer <anders.heimer@est.tech>,
	Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 4/9] oe/patch: avoid shell pipeline in _applypatch
Date: Tue, 23 Jun 2026 15:35:16 +0200
Message-ID: <20260623133521.17053-5-anders.heimer@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260623133521.17053-1-anders.heimer@est.tech>
References: <20260623133521.17053-1-anders.heimer@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0283.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::17) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|DU4P189MB2742:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f246553-e16e-4e34-586e-08ded12c4c1c
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|56012099006|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: wPNxg4xg42XQHkIKmhLFYWKC15HFFOJP4j8rxFzmFRWx4a87oAh4eeiGpcah36UzsceGNnIbe9/w26TeuLOqQgs/VBH81skkyILsLT+esn7awfHG6sCo29+cTWzYV04G+9Gh6cqDZAu4XiT3yyA4ECX15ls1wgXBK6nQPkl8PRbj1x07duOdbghB3HHN5FuETsmH3fMk2HxAwqPYutuefVAG5Q98/9h9+rsDMSElmGe8my6pVGlGZZOeI0b5k0oCsmQPQS6vHLbwjnQthpaU00Me69p5n4ue6wiPZYe0/I9irCPR32xfpYG7IJLBKyotLLRNjdUg2bEsdcpvljMhvaCG//JaoZgyJAfI1BKKYJDiJssQim92GO1lGpOEVyjE3OVfrwo4TRhK0mg4j85XkpCUQiiFdW/h2yve7D4zmusbw3FCcKgGZ54XyLTRI+t8q9NDhowJA1CTfHo4v//WNNJKsYrzQSfStKGk7Qa6Rhf6/duOW6GAfZdmYaCwYOpG9+pW3vDRWPyGt2z1SyQ1sSn5qlaOs/fVhxKgSPyIVEw+MvWRKmSjZpzGEdgsiNs1s0mAwv2c4fZUyh8Nk9cxNJBXL3Z3DbEGmWKZCTHLmjO1D5cuJifwxJFi41jOFqM+jiMWYPDaNnjshljsx0NTsU1Y+POKiQcpbQEXM6/ZcQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xJbZPugVvLPtrQ0VbfZwlfCe/7vtyiSTFbgCB5B8Z6xtrL8LL/CqPxKEoIcw?=
 =?us-ascii?Q?CG/ucEvwC1iuyfEyfxl/u3MccFvnzGqsoUsFI4G+eQJ2TZrRa6ByHJDHCZbw?=
 =?us-ascii?Q?kFatwCZ51SHGV+75MEvmJGYp3UWRvpzjsPFZhoCJogoH5Um3YKDvMrXfR2tU?=
 =?us-ascii?Q?wxffyxrhFEJNygDqTOhghllmtDajxh88UemxFaCSEXARd8H5VL3BO3UsiAG1?=
 =?us-ascii?Q?/vO/G25nXafULrDovbWVz+pWDlp2vwGCS+oRK1wj69tUydDfPoD5NA4+Xn+d?=
 =?us-ascii?Q?I+SZZ+XMaun4oia/JDs3re5kwe9H6y40t1r1IXneRUKy7OFla54TvQ3yV9dZ?=
 =?us-ascii?Q?O4DGV4SNYC1ziJdpg7V2XV7r5+h+JWxQkw59Vigmy0697bY7YBsTbesjXd6v?=
 =?us-ascii?Q?yuq42lOfIPlgjKYqtzJTvVUNh/gRW6L6bhrwoNrbSucgEDz21m91tWl/XItk?=
 =?us-ascii?Q?aXuDTBQmOqNDNhbt4crpdDEeml/IeTf5SeJrt/FJtOlyhApWo0+8G160ChAV?=
 =?us-ascii?Q?tUU/qKevpLzX+rSBYGXp2YVtV9lIR96d66mWuQ32b3tT+O6xn9pOR2WKQH8U?=
 =?us-ascii?Q?b+9V8jwOA9fDgeISt8uePKFgsMyL3PhRVH9opxXAWogdzPdwbo4K40L7+EMX?=
 =?us-ascii?Q?mK/HOU8EXqRNgGd6thVJGHYRgSzSO8bexTN3hUgqhCjgY4HiN4yVy9wUtQGj?=
 =?us-ascii?Q?Ftqbec6sYENraqQ3IR/8H2ZQ0SGaNsxvQjE09IOUViQr4teUmC+b3S+1iRgs?=
 =?us-ascii?Q?iJDLoPCkyXSPXLugl1pyPu80IUZfu7RQRQw8b5djHppCYKNN6J3t5dUd7MNu?=
 =?us-ascii?Q?wUPbIxXQ8Vqb+rmX4pfPEaQCD28sHK1lzy2jnm5mM0JVZYRYTEyteb5wKdiV?=
 =?us-ascii?Q?d9spJAvxCNyHNlhV7QD4mEExdHZJ/4XpVSYGb/wEKkyb/Ukyji7RizBgu9gi?=
 =?us-ascii?Q?fhceMDYYk15XtCwZRrhSfZjsY/AKIWpYZTNs4pif954GEcSn7W8auJ0fwhbV?=
 =?us-ascii?Q?2XZ9eSexjyX2rt6ZCzl2aofd3/EEG17BO9N4yfflgq+iZJRyposk8AdBCaRq?=
 =?us-ascii?Q?PCiacc68cwX3zAN0caoJmk+2y71ivvbyePUjNN6D5Xj+Oib0UC0HQ7N2rZdJ?=
 =?us-ascii?Q?GuYYGOXaml7NIxj+ctVfr+Cjk+HN0GJCD+mia7M1rTLbw6trgxHYjuw7tfgV?=
 =?us-ascii?Q?ttdSxhbOUMLu2k/vge3tPRbpyQYPHVcJ9X3GHXA/zSlFY4nSugjYqQ04SZXK?=
 =?us-ascii?Q?BVfHKa60e/EIj8Gq8jIuZjNQhbPwhNe/Y44MFCBxClsB1zqBst9FEzFjXNWm?=
 =?us-ascii?Q?1usLlDOxEyYwBiHR9vusGQWVC0X+7OqmKQvNKLOZzRg7hovU4G+s7BVxqMwM?=
 =?us-ascii?Q?fq/0HB6+HVyyEaa5cwDoXCT10rf55A09LYUyn38kQk0af5f1OehiEm42siMS?=
 =?us-ascii?Q?xbrCAO/Dgcq4w8gXeSM1d9dNpwF2dck0yfflJcvgish/owHgsB2onqmcrDh6?=
 =?us-ascii?Q?TtBOsozwU1nW3kQ0/VDgg9bub7rw5Fj7LZNpadVTBGbJH5Ya4meWYrg+RRnp?=
 =?us-ascii?Q?gyVLYbQrlK3TIHAtjL3Hs+gxlXuJDxNJGoCepXFPipfl2qe7hz6vAS+m8s6v?=
 =?us-ascii?Q?X9rT7oLTtA/g4+wFc/iu4+qXYguObe1FKnNUF4Q7gLHu7bQppCyLxu2T3mMH?=
 =?us-ascii?Q?Vpa1F8ULI5G9B1qQcKs+XTJlu/Tyk0kyyjVspIkG+F89PPI9sOcCfYHIqL+m?=
 =?us-ascii?Q?w5AkEY696A=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f246553-e16e-4e34-586e-08ded12c4c1c
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 13:35:31.9595
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: giaos9o09d/lAJXdRozaqyVki4qNEnuyyHk/ckTcL0N3cMNjt7pJx6vzWa79vyWtkd6t0R6NutkyVuGm+AIjMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4P189MB2742
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2026 13:35:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239397

Use patch -i to read the patch file directly instead of running
cat through a shell pipeline.

Reviewed-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Anders Heimer <anders.heimer@est.tech>
---
 meta/lib/oe/patch.py | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 290eb990f1..1ff57a9f8a 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -235,24 +235,24 @@ class PatchTree(PatchSet):
         self.patches.insert(i, patch)
=20
     def _applypatch(self, patch, force =3D False, reverse =3D False, run =
=3D True):
-        shellcmd =3D ["cat", patch['file'], "|", "patch", "--no-backup-if-=
mismatch", "-p", patch['strippath']]
+        cmd =3D ["patch", "--no-backup-if-mismatch", "-p", str(patch['stri=
ppath']), "-i", patch['file']]
         if reverse:
-            shellcmd.append('-R')
+            cmd.append('-R')
=20
         if not run:
-            return "sh" + "-c" + " ".join(shellcmd)
+            return cmd
=20
         if not force:
-            shellcmd.append('--dry-run')
+            cmd.append('--dry-run')
=20
         try:
-            output =3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            output =3D runcmd(cmd, self.dir)
=20
             if force:
                 return
=20
-            shellcmd.pop(len(shellcmd) - 1)
-            output =3D runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            cmd.pop(len(cmd) - 1)
+            output =3D runcmd(cmd, self.dir)
         except CmdError as err:
             raise bb.BBHandledException("Applying '%s' failed:\n%s" %
                                         (os.path.basename(patch['file']), =
err.output))

