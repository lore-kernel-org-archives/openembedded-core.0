Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.108])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18697.1795529392471411494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 06:09:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=a27Z6SZM;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.66.108, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wojj67aWceOGGqo0lXOD/76gth8SQ5bm8D6UbpmM61bjC0Vw9hXOL6KoWxAIg0AxiMyi17ZTWLCt3uPyTcXuaAEflqFlXP3rbcEGCezyFLYHh4OrwzpsXk5+PnKGgfRQrAJPHM3zn5p7aSUawY6EShqCscX85e84FWw4VEzPCVE/6RtDpc8iu+dD6VEnqWd5BmexTjlS3Oz0o6Q8RWbI1C6biid9pPwu2jkm9illdq1mjj4YFo5ADpTxH2kUKhNgJ0cgThv5euAKgkcYYvz5ELREgxdy8UEpkFLxkzd0Bkbfayw7AqRarAgbykmd9dZZLq4BY9VW474DhDd1azlFgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stOq1W2pNrhpHRAKygnb/ZC3vlFBTBSmMWCHYZfGT4k=;
 b=NtOalPlDWi4EjonheB2zm/UC7OAN+81xB+EfGAcOhg7+jquiQ+jKPrmvEPCA2ZvT6/WtXW2yydXTx6ggDhnTy2EOUqDDagiSxxwg0HaNJUdsNKWb4qyE7wB22SAM0kDnWDCqC0abIyNt0jxDrCohdEHZ5C7V/naCsU2nJqNEzhQq0JIk6syD3g9wQC54mUSQG+S9feHwEYYuhbVkWdeRNG+DXbQ9eRSjLrxo0u0/lpJY4DryDfrkfOGp6ZH9ja5B9qdOi80fRlYUdN2aa/u3IDBu4nEzzTxWTg/QEY/Fwx9TQi8DMiTccCjv3ZfVqh1As+S9aeDYNifBjcdIz7kfRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stOq1W2pNrhpHRAKygnb/ZC3vlFBTBSmMWCHYZfGT4k=;
 b=a27Z6SZMhh59MUREbhDKvX82G/IwzYcCTAR5V/g2jDnMa8cTwPvKBkA5tEe0iRfeJP7LfiDyTwuoHUNZWOT22ws0u38MQ/roGycUbkj73Eh3ypbUe4DHXKV3Ulg9lVX6HgcCB4z9zshUXFg5ycfXdU/gnFjzuRvi9eHDNiNc0C9OgCBzx8ofJHfsvkP/AlKeCIK4BAUHc/80eH4DMQvhhW+9pJshxRY+vAq2PLjLwDYVz3MWeHhrwPCqhK01L+avpgm3+gR3lZ/czLqM410GcetDxoIMIvNy5tGfZPtOcj6cFtUZzkJLBX0KYPanQQEKssZ+PDhkkwWFQAONnnEvxA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com (2603:10a6:150:1dc::17)
 by DB8PR06MB6587.eurprd06.prod.outlook.com (2603:10a6:10:121::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 14:09:47 +0000
Received: from GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc]) by GVXPR06MB9766.eurprd06.prod.outlook.com
 ([fe80::485c:86c9:bd8:53bc%6]) with mapi id 15.21.0615.013; Tue, 24 Nov 2026
 14:09:47 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: yoann.congal@smile.fr,
	Niko Mauno <niko.mauno@vaisala.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [blacksail][PATCH] archiver: Fix diff mode for recipes without S
Date: Tue, 24 Nov 2026 16:09:34 +0200
Message-ID: <20261124140935.20283-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GVX0EPF0009E318.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::4b9) To GVXPR06MB9766.eurprd06.prod.outlook.com
 (2603:10a6:150:1dc::17)
Return-Path: niko.mauno@vaisala.com
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR06MB9766:EE_|DB8PR06MB6587:EE_
X-MS-Office365-Filtering-Correlation-Id: a0611dd4-9fcb-4cd0-b555-08df4a3498c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|261102123227099003|261022105027099003|261022075727099003|261021123027099003|261021121427099003|261028144727099003|261026121527099003|11063799006|38350700014|56012099006|261026140227099003|260925021311599003|260925022911599003|260925021911599003|10067099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: OTU6CFtYGoon1L3/ir4TrvpRJtTt03aLJSOrPmWpdBQpPGe+UC4EY3W417u72B9qBNREROEZsEBkyaFM2iIzLu/Wz0Ya+8IPAbQdO02DLtrgigiRTM6AABps2WDM/Ap1NScUOAwLkK80EslqID/OGUS+Hqe8coM5eiZjAMwx6j076R9J2zRWhInar/L/2GtdFz63pnE0XrXvYbTIHCdfoN4rX3TTYFtY4RssyjS2oftIyQp13DNdcEZag8rOdO7egKng9SF7I/3vFtXsruElUbFHq0WjnnXSygvsO46fLp4iFTcsJ3A7qtdkGas/BFoyTjoya+j5VFyJBdxV1Rzn8k1SAZL3gJzRbU/7/KxSh8eVnf69UqmU5icpTKzPuFOIvEfV6wXq8vTUYfLk1HxPWR3e1Gr4FEXC7VV9nzT0mjGz67wlbmLWHW4n6pqjP4/z91qu/3KqL3MycUNoUdIra1r/YnCSdXQjPyvzZKUZ3PitJfqUpIkvZKx8QVavNJMvhO8h6G7NAvL9wCmPadNeB3Dot9JgEL+plJ7MKrjIuNDW25wqokLelrp8QRpQymQNiK+kbxnoaHz0fhP/oLdm6wTK/vNBCNTaorL2gV/Jy6y2knuLEPfIIhx3bOlfI8HQ9bBa+BJSkBQW3Jwyu6o5JLi3SwyWYe0vJuoxkbox46H6+AojWZe0h3L4OOA+0QoKURttjOdz19KgNY+9zC2ijhEBI98J9qv0J3slH2kBI8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR06MB9766.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(261102123227099003)(261022105027099003)(261022075727099003)(261021123027099003)(261021121427099003)(261028144727099003)(261026121527099003)(11063799006)(38350700014)(56012099006)(261026140227099003)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(18002099003)(261009223027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H6cql4A20B6SqKyBmcZuVkiIfuveTKYo/D7l7rfwbTGttENWkxZhdwDSeIDI?=
 =?us-ascii?Q?sItM51kWLm/cKXgnWChYIn2FpsppeN5u3NIOaKDVam7bWvh0tuIvEkExMYeB?=
 =?us-ascii?Q?BKCeyQinmhh6GCsjfvC3PcVcbCmWQElRwnzD8ha6vQODLYBekEj8XhuJzRcT?=
 =?us-ascii?Q?8OeQE8cjpFGOYgt0LHC2fYCQuwixajm+7Sb+rmg/5pqwUrqgll2HyoObbeVK?=
 =?us-ascii?Q?mIQWHhWtk0fYda6BOPKkVpfYUtJ1MXiytmNjjo1+l3TACIxcT40MF41H7iHT?=
 =?us-ascii?Q?BExzTTPScWRmiRpRoMzoiDVjzYmOJMO0kFA9T1p5/gPRfOhsEoOOnY8yhpMS?=
 =?us-ascii?Q?Ijv7EfogblRFr28ClKhqpHhD3I9MARSvMW9x4eeFIFy65Hh2zH8yF/vb8PC/?=
 =?us-ascii?Q?mWDmvKjJMqrF0g+YqeotbOkrzyMK0GAw9BD9Lt/VY+HckPYmjI/PeBc/GOUF?=
 =?us-ascii?Q?ukH8nhRlCi6hzr5VEQvLjIsJhdwKqSSuMLEXpq3As/saBXg+vTWRFRRZHC1C?=
 =?us-ascii?Q?nO1kNzJfWXLsjWqV4uIaUWPQphbXWnJGckxXHpcg6yGLStyqsKaAqnuq/6Uu?=
 =?us-ascii?Q?44S6ulkOOLKQZf9IkSM3Ayfd1kdIsQYFSnE1SU3WVRzO9qKhHTcs03c9su+/?=
 =?us-ascii?Q?2thoxyVGCvn3mXrJ9moc8uxrQL++m8WWxMHVcTG/DiqEWyEWsqebMD+xKSFj?=
 =?us-ascii?Q?R+oZknAKlg/0GIaxNDqq8is3diete5DyA5wHJdr3sz3phNtXQIYaGvzmmfbx?=
 =?us-ascii?Q?g304vTkG7FkQQUbsE3BLiNGcTrMokKuYTFme6+bHNYCEnAVdowyxRtUuOTsP?=
 =?us-ascii?Q?JA02UlDyU6mUY/nw8EcEZpR/0JJ9f8XW/5DnFGkIPbM79D5cWRNqiBhimd/Y?=
 =?us-ascii?Q?hVXOnBlc2Zi+a1iSPWFCcz7DktrhlY0lJssbXv6F2/mhr6GZK7IHL6+yHVGA?=
 =?us-ascii?Q?C9hAvay6NFYClt2XGnDlcBGNP3cMx9WcwfAz1+/Nk1Vh9xmJpvEwHuWJ/Qcl?=
 =?us-ascii?Q?FDp/A8KDmkR8NuOP6m1ya/YOlj8SOoerLspq0y63lxO+AkBgH4ATqVSbLjPu?=
 =?us-ascii?Q?+6gqlxMiGUkF2ElDxMwe/pfBDjD0Ww2XXfZggdrS+6+bsh4YL6irdkfBsfrs?=
 =?us-ascii?Q?HrDLz22lIkppkRkk0UtBpwl4QhTil/bhT75DZfsHSC6q4TC+VNw7tdT30jTh?=
 =?us-ascii?Q?aj7qvcdVAXwUxcZigWdMtnt6kZo+BLhHtquO6ra6Uefbv+jjiuTlmya+7NGo?=
 =?us-ascii?Q?dMYFAbznC/owjx0bBX9lpwylcvvUVve1h4NSMXIjn6Svr0IsqBNCHKobUlFi?=
 =?us-ascii?Q?WKi8U5TAq3IMmysqZL+4uXhaIm8wLWp9iFowLuYmfPO4OsAXvPiTUwxLiqAk?=
 =?us-ascii?Q?KUTPzc4hjAJ1yrB7gHm3P1zw04Lu/W1Q6Is6xnqlFeYetQNj92W9WA3EvNM/?=
 =?us-ascii?Q?mv8UC6Zi4+fgKb2NsO6gZwX0qW1UlWRfZLv0NnmDnhuN0ZoL/H5iztOji9ya?=
 =?us-ascii?Q?KJ+TE1j7u/uXCtgMUuwrBaXQ9xu5bvsjRDCLJs2JH6sVIVTFvs0R4yX5ArUR?=
 =?us-ascii?Q?uMZkPE1IuMxasTnj2ErtSzPp03pONImS4+VmSu//OzZL04fQ0o7jluQmFwSk?=
 =?us-ascii?Q?PJ45grQTaAqwd8pYIVdipPFgCj+jWdBssoOBBCWwqPWb4AxanuPET8XxPVGr?=
 =?us-ascii?Q?9aLdznl+sa0JKtpSsF8XMvU3XX5LP5ahWDtK1p8IC/WZVjQIgFND2ktZoSIV?=
 =?us-ascii?Q?IVhp6TwANw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0611dd4-9fcb-4cd0-b555-08df4a3498c6
X-MS-Exchange-CrossTenant-AuthSource: GVXPR06MB9766.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:09:47.4482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Vias1icIL5pPBS9WXTItSVZDZ0NlSSYxdrwsz44bRKqzebkZLBjrJHY7IeMXhDyTf7XD3gDXi2k4dlHiMbH0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6587
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 14:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251035
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
index b2b618023b..95cef30c9b 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -435,6 +435,8 @@ def create_diff_gz(d, src_orig, src, ar_outdir):
     if not os.path.isdir(src) or not os.path.isdir(src_orig):
         return
=20
+    bb.note('Creating diff gz...')
+
     # The diff --exclude can't exclude the file with path, so we copy
     # the patched source, and remove the files that we'd like to
     # exclude.
@@ -491,7 +493,9 @@ python do_unpack_and_patch() {
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
@@ -502,7 +506,6 @@ python do_unpack_and_patch() {
=20
     # Create the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff') =3D=3D '1':
-        bb.note('Creating diff gz...')
         create_diff_gz(d, src_orig, src, ar_outdir)
         bb.utils.remove(src_orig, recurse=3DTrue)
 }
--=20
2.47.3

