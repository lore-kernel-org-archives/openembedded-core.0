Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9258E7FDF5
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 22:36:40 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.38])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3618.1770071799092406490
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 14:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=di0f6Cph;
 spf=pass (domain: est.tech, ip: 40.107.130.38, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8j7v2VyYhz55OgliTb4hOpzisywW1GUwvNB/lFBQkx1qYlAolpJ8DighZ1JHUJMBExjIzxxpqmKW7oItxdFFmJXNfx8ICnq6D4itVC/sNT3ajqJJ54INMe+Bk8N/RMbVRXnixFSP4EZxBGEQjocEbi0tIObgUsJ0LXbdXIxIWcOOfBAQxBjFQOEfTDeiapFqW/C1H5JWzWcOeicJ/zgo9sRtwRzMfErHJfJ2eCXSp1mbHeRqokWLP6rGoDpDcCgkJ9bWTw5uDpmp8ufOc5QtOX3hS3oxx9wJffrBAeiRf5DztJ7HDBni2zutoao5ZzsUfUDjBRQjDftIZbS5B9GSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHApW8Lav1kO0YAVofrRQw8WEWy/1Qdagcbf8i/IBnc=;
 b=tfZEdTb7Ze1JigsMBQ+1f0J7G+yKbh3bK43FRHRGDyHsjbAABOT6itOOSf0ClU1RowtWapp5n6OXep85UpR76Caz/1RJE+G2WDbFO+ay6SgJKHxHZcM8RikU17zKTHL1xlscSESfqxf93ktEHZveliZuBgA4NmXObGO+kHJDaTx+BvFhgsF/FjdMfjzxjGBqDRaTKxOTzZLtrH4mPQt20OefnpJ/8dvckDPxWNeVSwhbT7dc9sjYkWMeAaQu7SCZAukphLdF47lSN1TQnjSERHGR1oTS8WZPSpQYa97iN8p1m23MoPtFsYiF3rOCWRagxQ/x9k+8ukcgfMMuUNaKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHApW8Lav1kO0YAVofrRQw8WEWy/1Qdagcbf8i/IBnc=;
 b=di0f6CphrOHvNTPFPJ5AIepdCGBOKUo5rLsph9/VpkbEVUjDtCxo43dCxOp4WHy8C2KGDTM5vsvopVYJk7xnzKaWUZPipOfhq5V7ST3jJUoKbZRetGeX/vK05WsgYk6mP4CX3BHWigPK9P8bPAFsrZIXN1PPxoEkjlWie/8l3aZko15+tzfiGMQ0XzbY113By2bB9lLOevjmRe4/W3c+kDgVUgHltH9TLQG6IdnQwwmoAHjVBO7EeMRf6+Jm5z1io/46DpUpfAJ30YRo/lj9Vj8lU4wYFz1CwYV9tUWn7GfBEaHzk6ghY5lqVyOATVFSVs0hm8xRiGvcnSxcDoLw+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:26e::16)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 22:36:34 +0000
Received: from GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9]) by GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 ([fe80::481f:ee0d:c0ce:36b9%4]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 22:36:34 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH v1] libsolv: add ptest support
Date: Mon,  2 Feb 2026 23:36:06 +0100
Message-ID: <20260202223606.19978-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0559.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::15) To GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:150:26e::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2P189MB3005:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a391bd-2f4b-4162-9acc-08de62ab84e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jl7Od8NrJTCqkJvqkdg2YT/N3q5kq+cfxdoPRxMK+xsHzyv9+Sjn4XhFxjAJ?=
 =?us-ascii?Q?Px6pBIZs/b+fE4E3Hl/3bFl7W4BOitl/LS3Ppw/AYJvOKL3SuCiiEKP2TfXF?=
 =?us-ascii?Q?Duhpt2z+eV9nAahNoloIRUC3zjXa0LPoID6gO3OZ2heTwAyn4yhJOAcZbmu2?=
 =?us-ascii?Q?vdRid6PMSjW2V4lloSVE+xzU5vi3AdvGskgDPJpHzBE1T5kyJBpc/j/nAObS?=
 =?us-ascii?Q?qrQodIP//iYUn954cGSrijEJW3ILtx4pLq1q/ot5jIZqGdsmmJUOejH/Idqz?=
 =?us-ascii?Q?gHmruRb4eFPHInl0Wuaa3ZbDmGFv3XOVHpElZSEKvs5DYQvMMwTLOB4h5tDB?=
 =?us-ascii?Q?qNl8/7nxMIQI3fFpzMOANLBof8xovOrhiOiyMu55DbCKERHTSlSmK9N2q87N?=
 =?us-ascii?Q?Pl7I30tL+uQiDxewNkbEqUJcpAhYXt6Zoq2n1h/pyX4pljFta4Oxb/wDMgTD?=
 =?us-ascii?Q?o0g3A1ZaBRZh3b9Hv0x4m5f39q6FVW2rS5MhllBcg8Q1Pi73TdUlAwmG5tqN?=
 =?us-ascii?Q?Vw0Z8QzSThQn4ogRj/VTaL/zJ5+8J6cgpMoe/LigAzDE43+tuHYFMEOWEZKB?=
 =?us-ascii?Q?Pd7iCtZnO1uUZCZ5VuttkfKyT0OVOAWuC4CsJQpxxfH8rxejxq8oysyHYA4c?=
 =?us-ascii?Q?ixNdsMPZ0ga3GbjTjjzH43XAbWXoSZNQdUuKH9selavOJrWd58BCLtQTmIeY?=
 =?us-ascii?Q?L4CZrTvZX+mYz4IniJXcgHhZstu/4gvAeyKSYFRPjwiCEMGXk3nnWjKBQxAm?=
 =?us-ascii?Q?N1eI38X+g1yMsIxy76puSdLameX/nKbI/g24zURJgqeXTlx0VHPwQL1NR8GQ?=
 =?us-ascii?Q?aOWcfFgZBq3DztjQLYaMCs7hRXPclnmpIABGwWNZhmVXBhMZGpFZIs6/GPiU?=
 =?us-ascii?Q?brg/Rozuzi4K+RovdewCQRuMEJM1Myx5vrQ/GZm4fMtIOUsepdjxTVOIlq9t?=
 =?us-ascii?Q?mCDvNx0mLtaf4z4F8qTXGr++63b3M4PMmBFIv4qUbwqvGzxrE883k1JofJPL?=
 =?us-ascii?Q?keJjGJ6uu0r4N57HZQRlQRsMFJsuIt7M9CQBo9SOh0jBxbwiTDKfym5fM3Uv?=
 =?us-ascii?Q?lx+eGmnQ7aqtvhzXh2bNlbmaPtdmufJ5Wf3BwQKux4liURJGA3aleaE+xmfo?=
 =?us-ascii?Q?gOftglvpR/s6+6AdNL8dYYSdswYIKrYhwrGPDFMR17hOrwTqrQffTaAd0uT7?=
 =?us-ascii?Q?Xr0/x4y/pp03Ls548kESh/7slsmzG6dOZNXM6nIdFXtt69WWWTy75tlaXOJk?=
 =?us-ascii?Q?+nTodhPpusd8rzN8E+b7qFDVnErYPYKmGuN/QDWOmD0WF0PBH3CtRy9sHXb6?=
 =?us-ascii?Q?qTdoDcWHTNe6ov+XMpxUROYFoer89z5cMVzmYH/as+UNcJugvKAiySSMmh5A?=
 =?us-ascii?Q?Xh0HJbEqaFCRk0RmHQLFAEFKht4n3fuGyfGh3eDITtkqwO+BPoGnRcVREdXe?=
 =?us-ascii?Q?D0LjBgnVdfkHIcTHu+8Yi01/5YOYppSDUwKr4rJsTVj4vpdgAtwXUMDjF2Qr?=
 =?us-ascii?Q?ScUmx+Tss6d+17Dscxuk1dY2WeJV9P4mnehQ87vYH88ItPKuar3nQ8r0IcXu?=
 =?us-ascii?Q?xg6/AFD5mTdO6LuGhrY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2P189MB3005.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6JWuMknfiALXPmv3Ue9bagdy+yWdetNcw1Qb+MphJjIN2U9vOcRrCl+tbjvT?=
 =?us-ascii?Q?DD2a+5NK83Nm1YDBpCg7277MXSoejQrr6S7komjzzkPFlqs7/5aOXKM4p+8t?=
 =?us-ascii?Q?hKCk0mEtsw0Fcf4WKGHfU3GbqAGfj+dk/cfu/8Uh5xLOegkLqJoXI66my931?=
 =?us-ascii?Q?GnhTjIPNQEeVG9JK/JGh8dm+xkWazcnO3YLiNhxSyrOihitw+ZlJDLungCiZ?=
 =?us-ascii?Q?JFkau6sWGheI6Hn652wgZV8Z2PWlFQjGbj5JwNZcjMkL9axuqazzzTBQmERJ?=
 =?us-ascii?Q?NFL/BnQd10YgQYxWcal3RF/v1PWUrMSxw6/YsS5+9BxD6K66LkahOWCIKNVa?=
 =?us-ascii?Q?l5O7kqs+eXctYf4L4D+kyeDAipDLiGGhONRjS77aELb8qvULBL3MzS3R5hZi?=
 =?us-ascii?Q?IrVaj7xdL3hxLZoLqrbEaTqAxO+MrbOX49y+w/RQkhwkGjOQcFEY2+lp7MPO?=
 =?us-ascii?Q?irvX9Ipcsvbi3aBpkiwi9TxJxc6fLuGVCngh27B/KCr7qtNTAlWAvwC2iSuU?=
 =?us-ascii?Q?RmKSsAI0fYbOS5cBr+qZuIKPf4Tgalbj3yXZagkCbphZPsdBzzapY7d4/efN?=
 =?us-ascii?Q?5Rr3X2WRDUY0wBjrTyZ+2XYlH5svg9MkwEVNb7d5W4moxKRflVKWdhemYSrg?=
 =?us-ascii?Q?ABFbmaNfZn2ZkrBhY0oAsYTs5qwluGLiK+A323sru8N7N5SfT1wiZlFLsvme?=
 =?us-ascii?Q?RjSs9SOffFYieIOyu2UO2WuEyXY/iR0G7Fl6sjn69PQRcux2u4bYQTQFL3Gm?=
 =?us-ascii?Q?Q6BSx2V12lSSAX++SL1YBgc9Y263dgFoPvMYVHQ6a6enL/ArHVUH2YL0iPxk?=
 =?us-ascii?Q?IiJNVKZQA0Pdkh6bO8mYyISOom3ygR2LQwR9OyqrF++VFTr5FdRr491CVKD0?=
 =?us-ascii?Q?IEMFuH3Dqrex9XJWtOWrrJMc/Pvi7oYpnpVaW6qSZRgCVtAPkf+cGg8ecSMh?=
 =?us-ascii?Q?wEBu1/oLKhdzYrr0zfq1brNGVHwX75etHbhF0maBylDzU94QZLFbrWZpoCVj?=
 =?us-ascii?Q?bxKvoc0EHLnIiV0rZHOzeeRTaPv/JE4nXeeHQH7aadw8ynL02GqS8V9mRLDT?=
 =?us-ascii?Q?Ds6A6Qf0tPOb9Ao9g54X7zDkM/PvbH3N1oAeJiVXTrdzFY52+uljCSd8MO3j?=
 =?us-ascii?Q?zsxFX2TC8vc7QFG3bbD2l0Dl93bznc4luXDC8ik6BZMjJRKMkv3cQB6tLBS9?=
 =?us-ascii?Q?R/G3UBycz+r8rv+sXlw0EyXVMfthCAoGdf+N2Ir8Z9OoNbP7SPz/Ofm1bCVD?=
 =?us-ascii?Q?Ttztl9UHkOdTWnEBW50o4x2TjTpEcKV92IAVSsR4rPY3tAusV2JEnJ+2Y+Bg?=
 =?us-ascii?Q?6xRMfyKkpg993tK7TLxpwBbJ5uKZjAyTnH4X7hiMkcjeYVUD4BboVGDO9E3y?=
 =?us-ascii?Q?EI5jDPneXK3QBHsJfGlfPWYErMQ7fkBRLiHKP8oC/NrB0XDlHyGvPRxRuACN?=
 =?us-ascii?Q?+CBFjyyTOElfyONvGTUa85Y3nhXWbs7Beyv3qJSqAn4ZePrRe8ngXg1VTytT?=
 =?us-ascii?Q?VCyoWghyctA68I1AdZEaxWcKCE2+gM4BzRRXShKfek87DLH3v2htqwT0qEB+?=
 =?us-ascii?Q?KsJbFz9VM6gYIlJxSHNYPT+5LU/zlhmfmQk2rccqC/VuonOckPGkwWR/YmGZ?=
 =?us-ascii?Q?gyXlfln0RMB01HhrzeafNzRLSH3MmbbvCwib7L11+P1JQQFKxNaGN/PYhXdG?=
 =?us-ascii?Q?18JkOt3PUC5veEy0WH8oEVYqZ+Kldon7PzWVn9cFPvTkn3c3ds59RZHjsxpf?=
 =?us-ascii?Q?+UJK9gpT7Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a391bd-2f4b-4162-9acc-08de62ab84e6
X-MS-Exchange-CrossTenant-AuthSource: GV2P189MB3005.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 22:36:34.3497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfNf6EjdDRrjLkUP79UO1ZM89qcfGpiglE1wk0gT6j5O2FNwx/jBUg0mH1jRPfyHOru7kIwm9BsYJ+3otMSU7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 22:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230408

Add ptest support to enable automated testing of libsolv
using ptest-runner.

The implementation uses upstream's test infrastructure:
testsolv binary, runtestcases.sh script, and testcase data.
The test suite runs 28 test categories covering solver
functionality, package dependencies, and repository handling.

All 28 upstream tests pass successfully on qemux86-64:
START: ptest-runner
BEGIN: /usr/lib/libsolv/ptest
conflict.t .......................................   Passed
forcebest.t ......................................   Passed
PASS: allowuninstall
job.t ............................................   Passed
learnt.t .........................................   Passed
recommends.t .....................................   Passed
requires.t .......................................   Passed
strongrecommends.t ...............................   Passed
update.t .........................................   Passed
yumobs.t .........................................   Passed
PASS: alternative
ptf.t ............................................   Passed
retracted.t ......................................   Passed
PASS: blacklist
choice1.t ........................................   Passed
choice1b.t .......................................   Passed
choice2.t ........................................   Passed
choice2b.t .......................................   Passed
choice3.t ........................................   Passed
choice3b.t .......................................   Passed
choice4.t ........................................   Passed
choice5.t ........................................   Passed
choice6.t ........................................   Passed
choice7.t ........................................   Passed
PASS: choicerules
default.t ........................................   Passed
enhanced.t .......................................   Passed
oldversion.t .....................................   Passed
suggested.t ......................................   Passed
versioned.t ......................................   Passed
versioned2.t .....................................   Passed
PASS: choose
cleandeps_dup.t ..................................   Passed
cleandeps_in.t ...................................   Passed
cleandeps_up.t ...................................   Passed
cleandeps_up3.t ..................................   Passed
mistake.t ........................................   Passed
PASS: cleandeps
and.t ............................................   Passed
andor.t ..........................................   Passed
if.t .............................................   Passed
ifelse.t .........................................   Passed
ifelse_rec.t .....................................   Passed
or.t .............................................   Passed
orand.t ..........................................   Passed
PASS: cplxdeps
dup_allowuninstall.t .............................   Passed
dup_multiversion1.t ..............................   Passed
dup_multiversion2.t ..............................   Passed
dup_multiversion3.t ..............................   Passed
dup_noarchchange.t ...............................   Passed
dup_orphan1.t ....................................   Passed
dup_orphan2.t ....................................   Passed
dup_orphan3.t ....................................   Passed
PASS: distupgrade
caret.t ..........................................   Passed
testevr.t ........................................   Passed
PASS: evrcmp
excludefromweak-obsoletes.t ......................   Passed
excludefromweak.t ................................   Passed
PASS: excludefromweak
recommends.t .....................................   Passed
recommends2.t ....................................   Passed
requires.t .......................................   Passed
single.t .........................................   Passed
supplements.t ....................................   Passed
PASS: favor
best.t ...........................................   Passed
installed.t ......................................   Passed
new1.t ...........................................   Passed
new2.t ...........................................   Passed
normal.t .........................................   Passed
PASS: focus
forcebest_dup.t ..................................   Passed
forcebest_in.t ...................................   Passed
forcebest_up.t ...................................   Passed
PASS: forcebest
best.t ...........................................   Passed
dup.t ............................................   Passed
PASS: lock
infarch_install_best.t ...........................   Passed
lockstep_install.t ...............................   Passed
lockstep_update.t ................................   Passed
PASS: lockstep
multiversion.t ...................................   Passed
update.t .........................................   Passed
update2.t ........................................   Passed
PASS: multiversion
namespaceprovides.t ..............................   Passed
PASS: namespace
pubg1.t ..........................................   Passed
pubg2.t ..........................................   Passed
PASS: proof
recommended_conflicts.t ..........................   Passed
recommended_multirepo.t ..........................   Passed
recommended_oldversion.t .........................   Passed
recommended_targeted.t ...........................   Passed
recommended_version.t ............................   Passed
suggested_conflicts.t ............................   Passed
suggested_multirepo.t ............................   Passed
suggested_oldversion.t ...........................   Passed
suggested_targeted.t .............................   Passed
suggested_version.t ..............................   Passed
PASS: recommendations
assert.t .........................................   Passed
mm-test.t ........................................   Passed
reuse.t ..........................................   Passed
PASS: sat
disable: unknown package 'E-1-1.src@available'
disable: unknown package 'F-1-1.src@available'
selection_canon_rpm.t ............................   Passed
selection_filelist.t .............................   Passed
selection_matchdeps.t ............................   Passed
selection_matchsolvable.t ........................   Passed
selection_name.t .................................   Passed
selection_provides.t .............................   Passed
PASS: selection
strictrepoprio.t .................................   Passed
PASS: strictrepoprio
break.t ..........................................   Passed
disfavored.t .....................................   Passed
strongr.t ........................................   Passed
PASS: strongrecommends
targeted_color.t .................................   Passed
targeted_dup.t ...................................   Passed
targeted_up.t ....................................   Passed
PASS: targeted
nested.t .........................................   Passed
str2dep.t ........................................   Passed
PASS: testcase
supplements_implicitobsoleteusescolors.t .........   Passed
PASS: weakdeps
dup.t ............................................   Passed
dup2.t ...........................................   Passed
forcebest_in.t ...................................   Passed
forcebest_up.t ...................................   Passed
PASS: whatprovideswithdisabled
split.t ..........................................   Passed
split2.t .........................................   Passed
PASS: yumobs
DURATION: 7
END: /usr/lib/libsolv/ptest
STOP: ptest-runner

Note: runtestcases.sh requires bash as it uses bash-specific features.

Change-Id: I408ed9786e2d97c48c08c7ceb43e7bcf91a754fd
Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../libsolv/libsolv/run-ptest                 | 21 +++++++++++++++
 .../libsolv/libsolv_0.7.35.bb                 | 26 ++++++++++++++++++-
 3 files changed, 47 insertions(+), 1 deletion(-)
 create mode 100755 meta/recipes-extended/libsolv/libsolv/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/di=
stro/include/ptest-packagelists.inc
index b9616e9bf4..fbbd118255 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -36,6 +36,7 @@ PTESTS_FAST =3D "\
     libnl \
     libpcre \
     librsvg \
+    libsolv \
     libssh2 \
     libtest-fatal-perl \
     libtest-needs-perl \
diff --git a/meta/recipes-extended/libsolv/libsolv/run-ptest b/meta/recipes=
-extended/libsolv/libsolv/run-ptest
new file mode 100755
index 0000000000..1462aecd61
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+cd test
+
+for t in allowuninstall alternative blacklist choicerules choose cleandeps=
 \
+         cplxdeps distupgrade evrcmp excludefromweak favor focus forcebest=
 \
+         lock lockstep multiversion namespace proof recommendations sat \
+         selection strictrepoprio strongrecommends targeted testcase weakd=
eps \
+         whatprovideswithdisabled yumobs; do
+
+    if [ -x ./runtestcases.sh ] && [ -d testcases/$t ]; then
+        ./runtestcases.sh ../tools/testsolv testcases/$t
+        if [ $? -eq 0 ]; then
+            echo "PASS: $t"
+        else
+            echo "FAIL: $t"
+        fi
+    else
+        echo "SKIP: $t"
+    fi
+done
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.35.bb
index ec74308bb5..53daa36106 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.35.bb
@@ -10,13 +10,14 @@ DEPENDS =3D "expat zlib zstd"
=20
 SRC_URI =3D "git://github.com/openSUSE/libsolv.git;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV} \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
+           file://run-ptest \
 "
=20
 SRCREV =3D "fb4b4340d46108cb365113e432642d6024886c7a"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
-inherit cmake
+inherit cmake ptest
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains('PACKAGE_CLASSES','package_rpm',=
'rpm','',d)}"
 PACKAGECONFIG[rpm] =3D "-DENABLE_RPMMD=3DON -DENABLE_RPMDB=3DON,,rpm"
@@ -29,3 +30,26 @@ FILES:${PN}-tools =3D "${bindir}/*"
 FILES:${PN}ext =3D "${libdir}/${PN}ext.so.*"
=20
 BBCLASSEXTEND =3D "native nativesdk"
+
+do_compile_ptest() {
+    cmake_runcmake_build --target testsolv
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tools
+    install -d ${D}${PTEST_PATH}/test
+
+    if [ -f ${B}/tools/testsolv ]; then
+        install -m 0755 ${B}/tools/testsolv ${D}${PTEST_PATH}/tools/
+    fi
+
+    if [ -f ${S}/test/runtestcases.sh ]; then
+        install -m 0755 ${S}/test/runtestcases.sh ${D}${PTEST_PATH}/test/
+    fi
+
+    if [ -d ${S}/test/testcases ]; then
+        cp -r ${S}/test/testcases ${D}${PTEST_PATH}/test/
+    fi
+}
+
+RDEPENDS:${PN}-ptest +=3D "bash"
--=20
2.43.0


