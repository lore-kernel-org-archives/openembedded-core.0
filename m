Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18213.1795528759943818782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 05:59:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=fB2t9+RF;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImziwXNnYH0IOnIdAc3Q/N8tbLLskvkl7tuE7pqOJTmOF9EMjyzZbEuw6sTEMDjee6/fv/MiCuALqlegAtM/kd2fgpc75S81nrG33O2OB4mQSKGcCdfSwAazQUZU8ocH6kuxbBfF3Jq2kaVl/IVIazhM6s/KybyIil1CB6yNpG8Qxrrd87+ogtnk0bU3GAQxnTz4UDoySqgTccyrtHeBm8ZKOP/rlCSP0Nz5JBVJaz6f98EscWTidqS9xSwazVpWZ+aEIlR49yaEHNJfTViZS2f18iQ9hrSRVaAYyLCnkCu9dMURScPUSAReNbwOQAyPWLAnHxoOVKZj9U53vZ5s7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGgk9pcPo4W+mV4T+O26kZq6BVdF8i4N+dlCck/bams=;
 b=hUCfJnVp9AMNfaHtix7b1ylDWYoOXs4tA5othd/2UJlZL76W+xFfdEdI4zq9hmOvo/N/l4Df6eq2deGnYzkH1DqCoOwLNZ2VnD2fRd+mrAGdtR0T2MqZkRDH9Rfm7LeK2ejMinjCZ6b+cNkoLq/5584DNFNLIalkfFYAeYQB292GB+gi7jPBt6tGrKtb87BjjHyBjWB2ibZMCPurfME7W/gp+fV+owwRgGCTm7OZ8aWowLaYEmmWCSzTvCPE3Mh7uD+fM2uLsVPAokFYzripPTgc/ZkNOJA3ABDtIF4bHTzJJeNZM2O66F6NAtTmQTHK1/NGzmRiFgkMORLluo0qHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGgk9pcPo4W+mV4T+O26kZq6BVdF8i4N+dlCck/bams=;
 b=fB2t9+RFlo1SgcCbCyuy1CnpOyg/ce4cFIDuTsZoN5fWfl577SNz+g8Ee2s65o97iWJop8VIPgnJ8ebYcDriJJdxXF07bl/zhfjcgtNtwQvnVUXK2DndcQ/zsYC5XNCs2hPFyApzVSsmtubgWi4EzSOFztfJ9zbnP0znW5i94T27hfn24bYQXXoX5/dxNKD9uvh899StSgcRqM+ZWvEo6nf7IHCHAAVKUugPGFXMIDcryEMD+fDdFCDErAWYghzP+ZAPkxkNqgqsAyTBq77hmVkK7cohRFf2/UPRCu+w/wm+jw8a18rAmotO3bFjpyKMDmfjg7lD6PzzdN6YW8Pq2A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com (2603:10a6:150:1dc::17)
 by DU4PR06MB10176.eurprd06.prod.outlook.com (2603:10a6:10:627::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 13:59:14 +0000
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc]) by GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc%6]) with mapi id 15.21.0615.013; Tue, 24 Nov 2026
 13:59:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: yoann.congal@smile.fr,
	Niko Mauno <niko.mauno@vaisala.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH] archiver: Fix diff mode for recipes without S
Date: Tue, 24 Nov 2026 15:59:00 +0200
Message-ID: <20261124135900.30439-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: OS6P279CA0116.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3c::18) To GVXPR06MB9766.eurprd06.prod.outlook.com
 (2603:10a6:150:1dc::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR06MB9766:EE_|DU4PR06MB10176:EE_
X-MS-Office365-Filtering-Correlation-Id: 4415dba0-87f5-41ff-3343-08df4a331f7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|38350700014|10067099003|261022105027099003|11063799006|56012099006|260925021311599003|260925021911599003|260925022911599003|261021121427099003|261026121527099003|261026140227099003|261021123027099003|261009223027099003|261022075727099003|261028144727099003|261102123227099003|18002099003;
X-Microsoft-Antispam-Message-Info: y5qoWmYU1LewDAK8V7rLScux8ROt6eE7Rem4yKw+7m1S8SUnxAxsPYBP0o+/PabSgp/ucfSQNd65LE2ig/kF5q99JHd4tgcDMRXAgUOliUdizz45TNjkXkIBMzHVnP5mmhqZnc99OiJTJkNaBEjGwVcBm9/Lb6Dpm3WW5eqPcCTOSVCIVajc963BPHOZPGxCYBvZ8gkM557ksAKK7ezIFReQlFPHmtOthYxWOyUTQPq4kYeXxsdvs3SMXIWITIjLdI6+iJGcfGon2HHRj5bMAGxxjum+3Edq/RTRymh+0JICFdAEsUsVdxfzO7FwIaohvO1X/ttaeEHArMDV1AxZSgNJ4QTVxVfQGbcFnsz0EDfRXicEp0hfYcPWJPEQloR9W11vI8xh18hBrt1PezmvijfsD0w1xNhIR5WoGtd5sGGo669BPGTzfDQsvxsLvg8Xp6NvDUj5D1EFBCJegoJdJ7mpX+r9+4rbdHXiKe7DCWMF1Hd0weLWNuIBp6SPSHfYTDcKrUupK2bRl90i/inunFEaws7XWkl3LJhe1nfWSeA6xZEwALU2tMHNN969cYIkC5kRD5eGSefgx4q/y7lzzJyea6xeBWPcNGVMs9IkehVDBmIz5OjdZPFpySo0ohi974rW7DsqSYEFBP/ZyNByaxZGGviOAhwrR/rBKeOY6kjRQi5VM6M8V986YyPcWORwY5boHtcF459DcWiKWxtqb9vgDBDwpme9R8OCcYHkuBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR06MB9766.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(38350700014)(10067099003)(261022105027099003)(11063799006)(56012099006)(260925021311599003)(260925021911599003)(260925022911599003)(261021121427099003)(261026121527099003)(261026140227099003)(261021123027099003)(261009223027099003)(261022075727099003)(261028144727099003)(261102123227099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdeHjH34BJMNKgSkZGyxl5AazW4c8lB+MpOB+Gac1rb3Cli/R2icoA0Uqtzg?=
 =?us-ascii?Q?qch0JqeQjzdn6cZtnkuwRIdAtl7WaY06BvUkiv5xJl5Ee/EILdRL9KopwWuD?=
 =?us-ascii?Q?1KQhWZAj+7dyuJQU7GKCwUlQS1oMclkPAFDdgQ+ig+kkskpG5CvzfbJxC5T/?=
 =?us-ascii?Q?HDh7hhl4LZs0mhmWLSTZebcI/PbTDXn2bDbugxLUGNSigW9b6ib8llXwZOEV?=
 =?us-ascii?Q?w64nXQCgbqP5K27fjU+tiPeYQChGLN/3JGEjILBY2O7R7/ZMGbDzJ1Hrg/OM?=
 =?us-ascii?Q?T41qIDHWEYHIUBTFaEKhjsWZ2qOuzzlSTM/dYOhWKNhgo+nhvzIrhklEpsL+?=
 =?us-ascii?Q?b3MvwjIwunsHXlSR1J0s7Ez58yE6xdQuvJgfcvXEd0nySEQiTReXCm1AOdCi?=
 =?us-ascii?Q?DhnrL0RhRLRam7wBcGveqosV7QSj8wnxZpDbXE6AYYUJIgS7BGwSYMKxColU?=
 =?us-ascii?Q?A8WlsGQ7HmknG0ExuIep/A1hDTCYcaI/8NTecC4lJIrDN52FVPYfrX0hhANZ?=
 =?us-ascii?Q?xeJS5Vt1mPMonNslBpkxnv+ClQWDLiLStEfO1J5MN8WX3/MkABH4530kpkGG?=
 =?us-ascii?Q?QqgwTHW7cLxhEjnnN97Wto4weQWS1Wd7qe5W5xBf87FY2IkZcnlHnA2d6oQR?=
 =?us-ascii?Q?rggr70lC7zd2LTpTvNejgmq+J758zpSxeosrNiybyEhx5eiJSJ5Xx0GjQhu9?=
 =?us-ascii?Q?39yLfPYHvZ8xYRDb0Zhf8Snw6TJr2oLVsN/l3FoCjxWwBlycLMkLgVsC/KTH?=
 =?us-ascii?Q?gpu5hwLpczuHUUSVinMul0F+Gd2sXoMtXUJ8BSJuCWR0+3adf0+8zYSAvr7U?=
 =?us-ascii?Q?fO/fTu28rG2OcPnXONQ1Xg3KTlg+VX6LQOqJTUFDs1+4QLr5/uGUPimgzC/O?=
 =?us-ascii?Q?mOnB8viwlou3MOYReJeyYTvpEv3x0ds6QFc+tLWgTpXrbcS9qhyV4pOcW8g6?=
 =?us-ascii?Q?xXgqBMzS/I0dTE7vOFTlYifwC5y27XcBrtH6F2Az1Uhz/DTgJMV5wtC+Xv3a?=
 =?us-ascii?Q?ZgtjunOh1OCuwPj0MKkcdRCVtrLWJxWwvrrx/8ESf4W6xG65FdjxoYC2YdJH?=
 =?us-ascii?Q?QCWwiQergLDeHJkrlwYaF6fx2EsXQ6NlbKhdsACiJr7iEH1TIjbU5zgFgOzJ?=
 =?us-ascii?Q?tKeFRomNHmyka4DHW/U/mz9oXK7aBdYVxtnzP7VZ2ueq58qCO1QaHTc4dyQJ?=
 =?us-ascii?Q?E6YtTrll1TiyICx3bSZ2Y7ML2AnX1qZU1SsmOEv+AA8KlWO7OWHrrYaM3Ef7?=
 =?us-ascii?Q?i4oiv8awjTdKXP6u8LiYy4p2bZdy4qG/JqJC0dYQgqbj+HrEJz9q2or5La+D?=
 =?us-ascii?Q?CE3pDB+Tb1kygDCJZCPU7bOePKqKDaQ7qkDw5kmaaBbIas5K8Rn0QbuhaevR?=
 =?us-ascii?Q?jYN+jPbq05MldkXpZzBo05iyaaefmX0qU4LhQsd0tQjvwO1mb1fQrUiXe98S?=
 =?us-ascii?Q?5LP6RzOAF2+TRgw2Tbc5TrqRZWmXmBEGxD3Ko6gRzd+v+ggGX6RzmMQt5fxX?=
 =?us-ascii?Q?g3PUO0FXTKJym1gqcZGlHDVpZXqy9ad2qwPWdPpaYCRlfjfOgslt/S/ZTFCo?=
 =?us-ascii?Q?Cbci1wZcc5pwP7zB3UYqb3EJjynIvxIu01HaUrpzeNCEuawsCAVM6SVIccOp?=
 =?us-ascii?Q?hQs9gBjKk9yRtcoDFisRQahuQCmRVZgv+XBtkMhwMJLymIBKZYi8jp9v+JGk?=
 =?us-ascii?Q?vIYugyNm4/WRFF0OzDSM6IMQcjpvfTZPNeyT6qCy18ZYMdPJCQsi0FcGawb7?=
 =?us-ascii?Q?K13kWxPQNg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4415dba0-87f5-41ff-3343-08df4a331f7b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR06MB9766.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:59:14.4819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OgPAa9hAigjCOtKeCEmLiU4xbvwz2L29GvgWjmHm2d549MW0zHRBTCiGPPNRmNMgdkcJH2EH1FAT/pDPudENYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10176
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 13:59:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251034
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
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5bfcb79bb3fc784619f3d90cc4e5891388312b17)
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/archiver.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 1f1ee45bd7..e8e2a9e6e1 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -450,6 +450,8 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     if not os.path.isdir(src) or not os.path.isdir(src_orig):
         return
=20
+    bb.note('Creating diff gz...')
+
     # The diff --exclude can't exclude the file with path, so we copy
     # the patched source, and remove the files that we'd like to
     # exclude.
@@ -506,7 +508,9 @@ python do_unpack_and_patch() {
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
@@ -517,7 +521,6 @@ python do_unpack_and_patch() {
=20
     # Create the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff') =3D=3D '1':
-        bb.note('Creating diff gz...')
         create_diff_gz(d, src_orig, src, ar_outdir)
         bb.utils.remove(src_orig, recurse=3DTrue)
 }
--=20
2.47.3

