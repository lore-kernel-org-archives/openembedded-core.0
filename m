Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E393ECD5BA3
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 10:13:06 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.135])
 by mx.groups.io with SMTP id smtpd.web10.5956.1725531184896865526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 03:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=EbQSFSa5;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gbf5OQ03E9GBgXDzAMuFLK3L2+DOsOURBNG3/xJrfO5FovvW6xYXMevUj/iHfDVlmXZlzM7vRouji4ipBqJSUYKko2ZL/K1M2qOaJFEAn2zjAMKRXyd5r04s2vgomqyoNvMnn35FlKqANHNNp/uLDe25MW2N7c286VfKYc8a7kRUsrjCJe5OOsQfbp7EOhM2N9yLXGerXlBJumjbvsgfztQHP/yXTqt3VWc64nort2Fzgy8dBKpDGD8z/LuYHkYuXMZ04SWiUzZs783cnbNylO/oHwR/Zmj6B3si2hJg2a+rDRI+50skntnHLwp/nC5oN1Dr/LvF+N5x6yYx+2hgmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppVwvigqQCcKjh5osvk6TnMEupTdP/PENaCU8BRw33I=;
 b=tlIGfF1jJwNbfBG5SSsmpoDAbhFvGJcBzQZRhOy3ybwNZYm7KonRrZPMB3I3+IpUxkV/6HmlsGpTGMnIX3NVd/OWChB5neVvpMt1X4JGSLSCvtEitzlf/3aw1/RKfW8E/fPWVhTe72sCMEIEYDiJThLAVShHHq+pG3qh1OrA2vNzPHk+LIsEb6roxVGLOqLgIuYFNS3UIxb0Ky4RKgN9N3abOmd53s22Ej2qqSQWbsvwIW3pVCPPvVrKTTPMnvfPkK1GTPYqFP7JYMlg7fl7/ThpjFG6xchIvKfyIyT4yL4YVoKFvDOeLkFry870kn194jFZEmyTRwJyHdqiTDbJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppVwvigqQCcKjh5osvk6TnMEupTdP/PENaCU8BRw33I=;
 b=EbQSFSa5ZK0njyzq6/AWFaKQ7c1KrBtJImJcZ1PQRJBrrzvGRHbkxh9FHhJJM2XaQtIqV5xJ08fs2pheLNA8grUlLJNK+2uY3B+EHfwUmFCP/aPGI29HXwvty4ZUfVXMb0kQUBF/NAmM4pj4TzMNThjLOzsZ/3DDG4/vRrfjS/iqHgpaDLU0eZMm1/vAjEblcQkDrRNLreHo/AhKwfwmJ7PwubH/bm/TaPazhpyBfUPLF/Wzm80P1xBGbmAgKCeAAlBRIQPFhVpZ2eFweLE86tHTb7Y1Uqdsaif0DSg6xAYICsO66RmdQOTv63D+bY4S0CPxdnVUXTOTFSs8OPXvCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GV1PR06MB9412.eurprd06.prod.outlook.com (2603:10a6:150:1a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 10:12:59 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 10:12:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>,
	=?UTF-8?q?Vesa=20J=C3=A4=C3=A4skel=C3=A4inen?= <vesa.jaaskelainen@vaisala.com>
Subject: [PATCH] python3-maturin: Fix cross compilation issue for armv7l, mips64, ppc
Date: Thu,  5 Sep 2024 10:12:38 +0000
Message-ID: <20240905101238.2925086-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P191CA0048.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:657::17) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GV1PR06MB9412:EE_
X-MS-Office365-Filtering-Correlation-Id: 7923eeb7-08e8-4160-d9c0-08dccd935152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HZ2o69TwbZyBAd+SMAleAva77Hholmqz04dBp3q2tA0cxjveiL/dz0YAQtMw?=
 =?us-ascii?Q?SrZM1ek8tGRVW8YhnYg6tsHUZ6/giYiKrWn8d140VqSqC9rjc6KDIfxf2Bz+?=
 =?us-ascii?Q?cWSMJhTy0k5dQubXukg3Y8ut7KtgsQtwOd/lz+WSojdyVR5rIsJ/LQLVUjR9?=
 =?us-ascii?Q?Heea2hYOu+pya+Nw7ZP8NMi8h2XVgCxKNnVY2xmNL8/FIVbfSLRLyUA9VcVr?=
 =?us-ascii?Q?fcnlXzOF7MSnkDc3hcLrnWZsbB7dSnzjsgQoVOA7D+njkm79DQavrnB9vfus?=
 =?us-ascii?Q?IPBU2wzu+wUwwOWtzg7skZztZBVr0VvsggoZahnMEbQlvj7Gi7r5+kcbPElu?=
 =?us-ascii?Q?V+WFbuYPXhIqnKezzPPDnPcTumFKJO2FPXnpS3mhEhgpvvWqptDz336tZVJc?=
 =?us-ascii?Q?KE4x1lQ6a1Md8lqd96wTA9STV3EOu06dj4YNFbY4TNx25Qk8e2kRlAt4YXpn?=
 =?us-ascii?Q?k95wWenSOAvPNZY7GObqXGESZ9aw7PmJEwpkN8pNyqwI3K9aXM64uZLeFU4x?=
 =?us-ascii?Q?myvnAaYh7HqI6GYpTO/xmLXTTeXqyWU2LgJXj/4ZbsB9d+LGF38bLxntJKKO?=
 =?us-ascii?Q?kUwGdlOY3jWDJLMTrwoq7rEuIl6LahNwXHmuXI4WS2bD4hFoZj1FzJtqHDZ5?=
 =?us-ascii?Q?GA3HQ4OUAoGO/4Yf8/gHVch4Mm/Z8nBJJYJmtuw5wK8qw9jhqJns4XrQo76q?=
 =?us-ascii?Q?cdjRjhgiRXuttrsN1VJ4hkkHqTK+F2a9ysiQVz4aCv7wfC5EELb7fA5gW089?=
 =?us-ascii?Q?k1Eos8CTFFFwkVUh41zB0Y9B9M2W61f0OjPtiOahdG9Bnj6L6j4OJir7R35I?=
 =?us-ascii?Q?Ex47C5pGztjwEGJGv/W/NJUH4cN39bias5txEm5GZVSQ3nKlXuXEjdeBzBkU?=
 =?us-ascii?Q?6/jZ8zsjCGhyM1g8xbnaRmOPSlEVVs6lj54isBpetoXW2ciV1h826VUskGxY?=
 =?us-ascii?Q?j5O1B42AbbNqBQuKdhwYRFTkDK5cIJdDUnvTnBkZU+577+SqbpgvYp/CrNZJ?=
 =?us-ascii?Q?vbtSnW2CIDHyeadLboDpxA2ITyokoZjYEfNhmPjVEz924GSn8rgtw9ZtPyi5?=
 =?us-ascii?Q?zBUGp3gxMViA5X/YM0U4f/2LV50MZflgo7IrmnnoevWjCdqhJ9Rcj+mFPKHs?=
 =?us-ascii?Q?kQBoFnheKAW1NBwUvzZMVrF7hbpWmFNzHM1xlGcnnk48EstpLg/rN9bUHl1e?=
 =?us-ascii?Q?xKWVKT49eoZf74vXHyshIOKTtZ7EdkfSy0NnziSiBfntThulOOf5NSdbzah3?=
 =?us-ascii?Q?gFSQMbVjNx0v7mBKlMSGohReGxxqbCvYf3LoAwWCVP2cvoAloM37XjKYAlqx?=
 =?us-ascii?Q?rMAzYqDR17G9aMQNJMS8B2Cj8X9FkeYMnglwy4Wl2DhGuD952lB++auodqvU?=
 =?us-ascii?Q?Kva8hUYiCdNyoKZ+b97gJ40uE2VeTgO0xDYVyJUMHd8VRy2kdg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FnCq9d1CfzZefXTfvHbQ1Ctx9t7Et1cMscas1QReSUFsiOH7cC/n8431Lu5Y?=
 =?us-ascii?Q?D2YK26AeM4TyApL27ByKBbKtvVDIjn0teYgOousroVFDGGjxmf+acBNDpkDR?=
 =?us-ascii?Q?V1FtuNDNBeRPrm/aD61/DIkyAri94VQFHzAT8LIxVDqVFfNBxeYq+Cs+cZ+H?=
 =?us-ascii?Q?dJ3OvWIasom6BXBh8++TFsqDCtI9evBpvaOwz7MjYxWVZ21KaranFbY9ce27?=
 =?us-ascii?Q?62C4LdBvdMT1d5fpoGp3o/BAAE6EgjdViwO/FPuCdpNbFL2zZKQOJbWYM1uU?=
 =?us-ascii?Q?JepmS2lVILlB2bWEa/x5akDGdA6pwUG9sfS+l2nfiKaWHp5TdY+r/ggWwpSB?=
 =?us-ascii?Q?6xPcat69I4fYk1LK+zuLMinvAcTx8VaHXf4xmozQ65NTs0mSz+oyHOVZXDvd?=
 =?us-ascii?Q?6MJ8OIJVdBUcQ/78mjZU/Ow0q64AdoWyezMDYVcWcThmhe78t6S5vL8Afdtp?=
 =?us-ascii?Q?4T/4eF7qWsjznIu4ZPXqsZKSPPeFqOmXl0RDXXXVbCfrBMXZC0ppnuR4liOi?=
 =?us-ascii?Q?RxtlRdmLkXsDFUIfWGTQh6GqKhPsqDOckzfEPAwafHJd8RICXVyGLrw2GD54?=
 =?us-ascii?Q?6vVXuDhNydTg45rb5g/mW+5Gvi2wrnsaE7ItcSNp3Ux4knvH/vCrBAwkJQce?=
 =?us-ascii?Q?9BeiG51Di8VrqsPl5L7SOZoH+TQoFvX6Y5S6YzHpC1cmLXKBhU+gMOlxu8X3?=
 =?us-ascii?Q?5upxsVn3C5MXoDfhPjFqW9HBgeb0mSACab5pNmIw51R2y3sJVHX3EVR0QOE/?=
 =?us-ascii?Q?wI0mEAKwtT4Tjh5KpWfe+0tsd8ehD5mMGZ83NxIwQqDV3Z+d86vtAQ1QSQG6?=
 =?us-ascii?Q?hWrNgsntK6B54CMlqnRjjpgO2+GY4mx277S8Oko8p8gt7mEOGq5XQsg2c3eg?=
 =?us-ascii?Q?EODLzEd8JLxI62gC+h8q82Trju7SLDhgNX1VUI6fburb5AFnfgMdiXBEUT0J?=
 =?us-ascii?Q?Vf943NUXcbb26VGzOR4B9Jltcdy/e/k+WYAXx3fdSirXoyCXx46FSlc732Zb?=
 =?us-ascii?Q?XebCii2pXxxSxncnyKxpUXV0MqJNIViE9kUgbXhaCMjDvmdyDzECYloKzT/3?=
 =?us-ascii?Q?TIBVjF69EliBfJR1Iy2jtE2opU2o00pm9uahq4ks5jmKOTJX3eSamLcREKAA?=
 =?us-ascii?Q?y6tSoUe6YIcIpPP7C80wlXQKiNAcvxffvBSl8lQvFn/PyYP90wZQ+j5OUHAK?=
 =?us-ascii?Q?0ru5OryKVVR5FbGYDmTttwRD6guXQFMpHObTr5zWVOp5DbhzbpRgrppZKgWp?=
 =?us-ascii?Q?iPBfIu9EkUXjNJqbniO+abKs21NfHi8uaVkeO99Jc+7pc0YkgShZqv9uGx6F?=
 =?us-ascii?Q?FAWjloYlmmmOsQ238Y5dqbJXbCgW4i1mIRpPjkBJ0yLULdiIDVf5BzAY7jUc?=
 =?us-ascii?Q?WOxwrrMMQijC0hYBa/XwjxEX+pSQym/4zijTBKKewBlJMLoRJJer6pRp3d2m?=
 =?us-ascii?Q?qNzrzqU61VWwOxPHd3baieDmF+r5/QFtmsOPxHfLTBXABcIj/rKgJx9rl6gp?=
 =?us-ascii?Q?K2OSSUG25AjZmoGxhDm5U8mLD0ujPRcq5BWiMEPpy/K4BYyEKFTn816jpBrV?=
 =?us-ascii?Q?AoSItqfwQnDojs276UppEO3GPThBpPwVRYUgOXMLrucYy3N6fBTVSYo8O/7f?=
 =?us-ascii?Q?rw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7923eeb7-08e8-4160-d9c0-08dccd935152
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 10:12:58.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgq/ChZqGWXIXpV6TiU4WPG7jg4ATrw7Idldr6q3MFhPHxHXCBYmbfJdLptkPetI3q3KyBU1zcX2sE59WbuYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB9412
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 10:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204230

When bitbaking python3-rpds-py it built extension module as:

  site-packages/rpds/rpds.cpython-312-armv7l-linux-gnueabihf.so

Which caused error on target:

  root@qemuarm:~# python3 -c "from rpds import HashTrieMap, HashTrieSet, Li=
st"
  Traceback (most recent call last):
    File "<string>", line 1, in <module>
    File "/usr/lib/python3.12/site-packages/rpds/__init__.py", line 1, in <=
module>
      from .rpds import *
  ModuleNotFoundError: No module named 'rpds.rpds'

Where as it should have been:

  site-packages/rpds/rpds.cpython-312-arm-linux-gnueabihf.so

Associated upstream bug report:
https://github.com/PyO3/maturin/issues/2203

Associated upstream pull request:
https://github.com/PyO3/maturin/pull/2204

Note - mitigation has not been tested with musl:
https://github.com/PyO3/maturin/pull/2204#issuecomment-2323952320

Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala.=
com>
Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 ...n-architecture-name-resolvation-code.patch | 107 ++++++++++++++++++
 ...ation-issue-with-linux-armv7l-archit.patch |  76 +++++++++++++
 ...n-ABI-name-resolvation-code-as-helpe.patch |  98 ++++++++++++++++
 ...ation-issue-with-linux-ppc-architect.patch |  68 +++++++++++
 ...ation-issue-with-linux-mips64-archit.patch |  82 ++++++++++++++
 .../python/python3-maturin_1.7.1.bb           |   7 ++
 6 files changed, 438 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0001-Extra=
ct-extension-architecture-name-resolvation-code.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0002-Fix-c=
ross-compilation-issue-with-linux-armv7l-archit.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0003-Extra=
ct-extension-ABI-name-resolvation-code-as-helpe.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0004-Fix-c=
ross-compilation-issue-with-linux-ppc-architect.patch
 create mode 100644 meta/recipes-devtools/python/python3-maturin/0005-Fix-c=
ross-compilation-issue-with-linux-mips64-archit.patch

diff --git a/meta/recipes-devtools/python/python3-maturin/0001-Extract-exte=
nsion-architecture-name-resolvation-code.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0001-Extract-extension-architecture-name-resolvation-cod=
e.patch
new file mode 100644
index 0000000000..f75d5a1ba8
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0001-Extract-extension-a=
rchitecture-name-resolvation-code.patch
@@ -0,0 +1,107 @@
+From 42a97ee7100ad158d4b1ba6133ea13cc864a567f Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 09:23:10 +0300
+Subject: [PATCH 1/5] Extract extension architecture name resolvation code =
as
+ helper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit introduces helper InterpreterConfig.get_python_ext_arch() that
+can be used to determine the extension architecture name python uses in
+`ext_suffix` for this architecture.
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/42a97ee7=
100ad158d4b1ba6133ea13cc864a567f]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 18 ++++++------------
+ src/target.rs                    | 16 ++++++++++++++++
+ 2 files changed, 22 insertions(+), 12 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index 912f9218..d76606f2 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -47,15 +47,7 @@ impl InterpreterConfig {
+             // Python 2 is not supported
+             return None;
+         }
+-        let python_arch =3D if matches!(target.target_arch(), Arch::Armv6=
L | Arch::Armv7L) {
+-            "arm"
+-        } else if matches!(target.target_arch(), Arch::Powerpc64Le) && py=
thon_impl =3D=3D PyPy {
+-            "ppc_64"
+-        } else if matches!(target.target_arch(), Arch::X86) && python_imp=
l =3D=3D PyPy {
+-            "x86"
+-        } else {
+-            target.get_python_arch()
+-        };
++        let python_ext_arch =3D target.get_python_ext_arch(python_impl);
+         // See https://github.com/pypa/auditwheel/issues/349
+         let target_env =3D match python_impl {
+             CPython =3D> {
+@@ -77,7 +69,7 @@ impl InterpreterConfig {
+                 let ldversion =3D format!("{}{}{}", major, minor, abiflag=
s);
+                 let ext_suffix =3D format!(
+                     ".cpython-{}-{}-linux-{}.so",
+-                    ldversion, python_arch, target_env
++                    ldversion, python_ext_arch, target_env
+                 );
+                 Some(Self {
+                     major,
+@@ -90,7 +82,8 @@ impl InterpreterConfig {
+             }
+             (Os::Linux, PyPy) =3D> {
+                 let abi_tag =3D format!("pypy{}{}-{}", major, minor, PYPY=
_ABI_TAG);
+-                let ext_suffix =3D format!(".{}-{}-linux-{}.so", abi_tag,=
 python_arch, target_env);
++                let ext_suffix =3D
++                    format!(".{}-{}-linux-{}.so", abi_tag, python_ext_arc=
h, target_env);
+                 Some(Self {
+                     major,
+                     minor,
+@@ -204,7 +197,8 @@ impl InterpreterConfig {
+             }
+             (Os::Emscripten, CPython) =3D> {
+                 let ldversion =3D format!("{}{}", major, minor);
+-                let ext_suffix =3D format!(".cpython-{}-{}-emscripten.so"=
, ldversion, python_arch);
++                let ext_suffix =3D
++                    format!(".cpython-{}-{}-emscripten.so", ldversion, py=
thon_ext_arch);
+                 Some(Self {
+                     major,
+                     minor,
+diff --git a/src/target.rs b/src/target.rs
+index dc7df0cf..84bae559 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -1,4 +1,5 @@
+ use crate::cross_compile::is_cross_compiling;
++use crate::python_interpreter::InterpreterKind;
+ use crate::PlatformTag;
+ use anyhow::{anyhow, bail, format_err, Result};
+ use platform_info::*;
+@@ -368,6 +369,21 @@ impl Target {
+         }
+     }
+=20
++    /// Returns the extension architecture name python uses in `ext_suffi=
x` for this architecture.
++    pub fn get_python_ext_arch(&self, python_impl: InterpreterKind) -> &s=
tr {
++        if matches!(self.target_arch(), Arch::Armv6L | Arch::Armv7L) {
++            "arm"
++        } else if matches!(self.target_arch(), Arch::Powerpc64Le)
++            && python_impl =3D=3D InterpreterKind::PyPy
++        {
++            "ppc_64"
++        } else if matches!(self.target_arch(), Arch::X86) && python_impl =
=3D=3D InterpreterKind::PyPy {
++            "x86"
++        } else {
++            self.get_python_arch()
++        }
++    }
++
+     /// Returns the name python uses in `sys.platform` for this os
+     pub fn get_python_os(&self) -> &str {
+         match self.os {
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-co=
mpilation-issue-with-linux-armv7l-archit.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0002-Fix-cross-compilation-issue-with-linux-armv7l-archi=
t.patch
new file mode 100644
index 0000000000..4366dde111
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0002-Fix-cross-compilati=
on-issue-with-linux-armv7l-archit.patch
@@ -0,0 +1,76 @@
+From 0c6b8cc84eff72ed21098029aaba079b899dbee2 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 09:23:40 +0300
+Subject: [PATCH 2/5] Fix cross compilation issue with linux-armv7l
+ architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-armv7l target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-armv7l-linux-gnueabihf.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-armv7l'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-arm-linux-gnueabihf.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-arm-linux-gnueabihf.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/0c6b8cc8=
4eff72ed21098029aaba079b899dbee2]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index d76606f2..5736aedc 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -306,7 +306,7 @@ impl InterpreterConfig {
+                     format!(
+                         ".cpython-{}-{}-{}-{}.{}",
+                         abi_tag,
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         target_env,
+                         file_ext,
+@@ -319,7 +319,7 @@ impl InterpreterConfig {
+                         major,
+                         minor,
+                         abi_tag,
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         target_env,
+                         file_ext,
+@@ -330,7 +330,7 @@ impl InterpreterConfig {
+                     format!(
+                         ".{}-{}-{}.{}",
+                         abi_tag.replace('_', "-"),
+-                        target.get_python_arch(),
++                        target.get_python_ext_arch(interpreter_kind),
+                         target.get_python_os(),
+                         file_ext,
+                     )
+@@ -341,7 +341,7 @@ impl InterpreterConfig {
+                 format!(
+                     ".cpython-{}-{}-{}.{}",
+                     abi_tag,
+-                    target.get_python_arch(),
++                    target.get_python_ext_arch(interpreter_kind),
+                     target.get_python_os(),
+                     file_ext
+                 )
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0003-Extract-exte=
nsion-ABI-name-resolvation-code-as-helpe.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0003-Extract-extension-ABI-name-resolvation-code-as-help=
e.patch
new file mode 100644
index 0000000000..b4a7f69492
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0003-Extract-extension-A=
BI-name-resolvation-code-as-helpe.patch
@@ -0,0 +1,98 @@
+From fa64426f3a98a0455721c23ec86bd2240708b45e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:07 +0300
+Subject: [PATCH 3/5] Extract extension ABI name resolvation code as helper
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This commit introduces helper InterpreterConfig.get_python_target_env()
+that can be used to determine the extension ABI python uses in
+`ext_suffix` for this architecture.
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/fa64426f=
3a98a0455721c23ec86bd2240708b45e]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 19 ++-----------------
+ src/target.rs                    | 20 ++++++++++++++++++++
+ 2 files changed, 22 insertions(+), 17 deletions(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index 5736aedc..938e9955 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -48,17 +48,7 @@ impl InterpreterConfig {
+             return None;
+         }
+         let python_ext_arch =3D target.get_python_ext_arch(python_impl);
+-        // See https://github.com/pypa/auditwheel/issues/349
+-        let target_env =3D match python_impl {
+-            CPython =3D> {
+-                if python_version >=3D (3, 11) {
+-                    target.target_env().to_string()
+-                } else {
+-                    target.target_env().to_string().replace("musl", "gnu"=
)
+-                }
+-            }
+-            PyPy | GraalPy =3D> "gnu".to_string(),
+-        };
++        let target_env =3D target.get_python_target_env(python_impl, pyth=
on_version);
+         match (target.target_os(), python_impl) {
+             (Os::Linux, CPython) =3D> {
+                 let abiflags =3D if python_version < (3, 8) {
+@@ -294,12 +284,7 @@ impl InterpreterConfig {
+         };
+         let file_ext =3D if target.is_windows() { "pyd" } else { "so" };
+         let ext_suffix =3D if target.is_linux() || target.is_macos() {
+-            // See https://github.com/pypa/auditwheel/issues/349
+-            let target_env =3D if (major, minor) >=3D (3, 11) {
+-                target.target_env().to_string()
+-            } else {
+-                target.target_env().to_string().replace("musl", "gnu")
+-            };
++            let target_env =3D target.get_python_target_env(interpreter_k=
ind, (major, minor));
+             match interpreter_kind {
+                 InterpreterKind::CPython =3D> ext_suffix.unwrap_or_else(|=
| {
+                     // Eg: .cpython-38-x86_64-linux-gnu.so
+diff --git a/src/target.rs b/src/target.rs
+index 84bae559..ad8ebaba 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -1,5 +1,6 @@
+ use crate::cross_compile::is_cross_compiling;
+ use crate::python_interpreter::InterpreterKind;
++use crate::python_interpreter::InterpreterKind::{CPython, GraalPy, PyPy};
+ use crate::PlatformTag;
+ use anyhow::{anyhow, bail, format_err, Result};
+ use platform_info::*;
+@@ -384,6 +385,25 @@ impl Target {
+         }
+     }
+=20
++    /// Returns the environment python uses in `ext_suffix` for this arch=
itecture.
++    pub fn get_python_target_env(
++        &self,
++        python_impl: InterpreterKind,
++        python_version: (usize, usize),
++    ) -> String {
++        match python_impl {
++            CPython =3D> {
++                // For musl handling see https://github.com/pypa/auditwhe=
el/issues/349
++                if python_version >=3D (3, 11) {
++                    self.target_env().to_string()
++                } else {
++                    self.target_env().to_string().replace("musl", "gnu")
++                }
++            }
++            PyPy | GraalPy =3D> "gnu".to_string(),
++        }
++    }
++
+     /// Returns the name python uses in `sys.platform` for this os
+     pub fn get_python_os(&self) -> &str {
+         match self.os {
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-co=
mpilation-issue-with-linux-ppc-architect.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0004-Fix-cross-compilation-issue-with-linux-ppc-architec=
t.patch
new file mode 100644
index 0000000000..bda5dca8f6
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0004-Fix-cross-compilati=
on-issue-with-linux-ppc-architect.patch
@@ -0,0 +1,68 @@
+From f2c892109a05db144e8b18bcbcf9c24fe8d977c4 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:16 +0300
+Subject: [PATCH 4/5] Fix cross compilation issue with linux-ppc architectu=
re
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-ppc target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-ppc-linux-gnu.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-ppc'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-powerpc-linux-gnu.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-powerpc-linux-gnu.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/f2c89210=
9a05db144e8b18bcbcf9c24fe8d977c4]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 8 ++++++++
+ src/target.rs                    | 2 ++
+ 2 files changed, 10 insertions(+)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index 938e9955..8f883887 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -424,6 +424,14 @@ mod test {
+             ".cpython-310-powerpc64le-linux-gnu.so"
+         );
+=20
++        let sysconfig =3D InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("powerpc-unknown-linux-gnu".=
to_string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(sysconfig.ext_suffix, ".cpython-310-powerpc-linux-gnu.=
so");
++
+         let sysconfig =3D InterpreterConfig::lookup_one(
+             &Target::from_target_triple(Some("s390x-unknown-linux-gnu".to=
_string())).unwrap(),
+             InterpreterKind::CPython,
+diff --git a/src/target.rs b/src/target.rs
+index ad8ebaba..93afd9bb 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -380,6 +380,8 @@ impl Target {
+             "ppc_64"
+         } else if matches!(self.target_arch(), Arch::X86) && python_impl =
=3D=3D InterpreterKind::PyPy {
+             "x86"
++        } else if matches!(self.target_arch(), Arch::Powerpc) {
++            "powerpc"
+         } else {
+             self.get_python_arch()
+         }
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-co=
mpilation-issue-with-linux-mips64-archit.patch b/meta/recipes-devtools/pyth=
on/python3-maturin/0005-Fix-cross-compilation-issue-with-linux-mips64-archi=
t.patch
new file mode 100644
index 0000000000..b24196d5dd
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-maturin/0005-Fix-cross-compilati=
on-issue-with-linux-mips64-archit.patch
@@ -0,0 +1,82 @@
+From 5fe643579bcc63d824f6a0f0936fff451c622903 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Vesa=3D20J=3DC3=3DA4=3DC3=3DA4skel=3DC3=3DA4inen?=3D
+ <vesa.jaaskelainen@vaisala.com>
+Date: Sun, 1 Sep 2024 15:55:54 +0300
+Subject: [PATCH 5/5] Fix cross compilation issue with linux-mips64
+ architecture
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+When compiling under Yocto project for linux-mips64 target architecture
+.so files were generated incorrectly as:
+
+  rpds.cpython-312-mips64-linux-gnu.so
+
+Where as platform and EXT_SUFFIX are defined as:
+
+  >>> sysconfig.get_platform()
+  'linux-mips64'
+  >>> sysconfig.get_config_vars()['EXT_SUFFIX']
+  '.cpython-312-mips64-linux-gnuabi64.so'
+
+Which should have caused the .so files as:
+
+  rpds.cpython-312-mips64-linux-gnuabi64.so
+
+Upstream-Status: Backport [https://github.com/PyO3/maturin/commit/5fe64357=
9bcc63d824f6a0f0936fff451c622903]
+
+Signed-off-by: Vesa J=C3=A4=C3=A4skel=C3=A4inen <vesa.jaaskelainen@vaisala=
.com>
+---
+ src/python_interpreter/config.rs | 19 +++++++++++++++++++
+ src/target.rs                    |  4 +++-
+ 2 files changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/src/python_interpreter/config.rs b/src/python_interpreter/con=
fig.rs
+index 8f883887..ef656010 100644
+--- a/src/python_interpreter/config.rs
++++ b/src/python_interpreter/config.rs
+@@ -432,6 +432,25 @@ mod test {
+         .unwrap();
+         assert_eq!(sysconfig.ext_suffix, ".cpython-310-powerpc-linux-gnu.=
so");
+=20
++        let sysconfig =3D InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("mips64-unknown-linux-gnu".t=
o_string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(
++            sysconfig.ext_suffix,
++            ".cpython-310-mips64-linux-gnuabi64.so"
++        );
++
++        let sysconfig =3D InterpreterConfig::lookup_one(
++            &Target::from_target_triple(Some("mips-unknown-linux-gnu".to_=
string())).unwrap(),
++            InterpreterKind::CPython,
++            (3, 10),
++        )
++        .unwrap();
++        assert_eq!(sysconfig.ext_suffix, ".cpython-310-mips-linux-gnu.so"=
);
++
+         let sysconfig =3D InterpreterConfig::lookup_one(
+             &Target::from_target_triple(Some("s390x-unknown-linux-gnu".to=
_string())).unwrap(),
+             InterpreterKind::CPython,
+diff --git a/src/target.rs b/src/target.rs
+index 93afd9bb..25fc6c07 100644
+--- a/src/target.rs
++++ b/src/target.rs
+@@ -396,7 +396,9 @@ impl Target {
+         match python_impl {
+             CPython =3D> {
+                 // For musl handling see https://github.com/pypa/auditwhe=
el/issues/349
+-                if python_version >=3D (3, 11) {
++                if matches!(self.target_arch(), Arch::Mips64 | Arch::Mips=
64el) && self.is_linux() {
++                    "gnuabi64".to_string()
++                } else if python_version >=3D (3, 11) {
+                     self.target_env().to_string()
+                 } else {
+                     self.target_env().to_string().replace("musl", "gnu")
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-maturin_1.7.1.bb b/meta/r=
ecipes-devtools/python/python3-maturin_1.7.1.bb
index 1a8581e594..b9279f5ab5 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.7.1.bb
@@ -6,6 +6,13 @@ LIC_FILES_CHKSUM =3D "file://license-apache;md5=3D1836efb2=
eb779966696f473ee8540542 \
                     file://license-mit;md5=3D85fd3b67069cff784d98ebfc7d5c0=
797"
=20
 SRC_URI[sha256sum] =3D "147754cb3d81177ee12d9baf575d93549e76121dacd3544ad6=
a50ab718de2b9c"
+SRC_URI:append =3D "\
+    file://0001-Extract-extension-architecture-name-resolvation-code.patch=
 \
+    file://0002-Fix-cross-compilation-issue-with-linux-armv7l-archit.patch=
 \
+    file://0003-Extract-extension-ABI-name-resolvation-code-as-helpe.patch=
 \
+    file://0004-Fix-cross-compilation-issue-with-linux-ppc-architect.patch=
 \
+    file://0005-Fix-cross-compilation-issue-with-linux-mips64-archit.patch=
 \
+"
=20
 S =3D "${WORKDIR}/maturin-${PV}"
=20
--=20
2.39.2


