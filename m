Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B16C531CB
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 09:26:57 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19539.1784798811232423025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 02:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Le4z5iYe;
 spf=pass (domain: est.tech, ip: 52.101.72.43, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HWTDGPJjXbtbdOPIiw3RIeJFhB2pRsqJv3YyQWwFv95bW52lzr/1bSGB0eIfVr57WF0mWLI/xs5ALfjjfnO7vX0mOHYTB+8YXSbVwlOox6Z45PKxNsxJN6VbpaYZzlskE3iGvISkeqbyxWd9IPbFQsyFpMKH6iTSuXLsjvYhcTY4cfwm4IM6bW40atfN0iu6i1KyMlDTFCouK6OXKiLPzF58QF2lKOkfYLQ0rLZ2b755VDKUFODX2NuB+rSeKhi6Wr/vPnzJ5ht2grsrGmYu01ILsg9A619+Q8h1JDd6IVQLdCiMFmHBnLLZWgQa+QPcTzsd29L2vVcGG5twX/GO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dHEe2T2sTOFmDlTOvUpqYgR8E0LZJVvPL+P4seKuik=;
 b=fnio1zYHQq0j2Sr986Om3+Zn00iABJPWTffQYcja5jnA/TdTOVMzgkD7CtxDDRh4WGiH6Q/6xHRWVHRTrA92abBWZTOE1NSAaVlf6wXy01Hwq0cgm26yU809pT8OvOFhI7qVZ26LNBUbD2jITfF9YFFzE/6rrA0iD8kSnWgHR6DUP3Htk4j3zqiOzIlPp56ITotni5m0+DgxkRT3yD7PeDgaMSDik3jdvfeYdHDOEvELuBP1CWk3/3S+12oYaV+s6vfM5FnzVB4c7RZGGb3tUrdyhG7Tc7Tlsg1gwrxbVEE5sLTrukPxGwKzOKEW/MIWwqsJmZgS/IX4sqNYDutXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dHEe2T2sTOFmDlTOvUpqYgR8E0LZJVvPL+P4seKuik=;
 b=Le4z5iYe09j2j2LVwWyX7V9V0FVuJPMYM2CWPeQnKryDOCuw4IYgueiOGVlew64C2NHLjvpGmFXMsHwyIQZ3npbqjH97/GKGWxkejGixmUh2gAUHuZYYWtihAoK0EO2n+5ZcjetiXcGX0Hs4X/4OvKw+Tij8GgcdJYHMape857WbhjnEEZazbsi6dxkcjPFwy+1BgQqH3Fn+aXE5EHDqwG/W29gQyIXfUy7WrLUCFkc9tZ6BhXUNIoX8/ZTzSdI3MF7v2CvkeeNfe97Rsp5UdjujGUTuJuNvFH872dciIuTPlilbdVfKTN7r0MIgegzmqhIS6G7BXyZuQ5sib1EXzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DU0P189MB1959.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:34e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.5; Thu, 23 Jul
 2026 09:26:43 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0270.004; Thu, 23 Jul 2026
 09:26:43 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH v2] bzip2: fix 'bzip2 --version > /tmp/aaa 2>&1' hang
Date: Thu, 23 Jul 2026 11:26:42 +0200
Message-ID: <20260723092642.99165-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260716085422.20905-1-jaipaul.cheernam@est.tech>
References: <20260716085422.20905-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::9) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DU0P189MB1959:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bb7e3c9-18d8-4d43-b2c3-08dee89c8243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|12006099003|10067099003|11063799006|56012099006|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	aJDcnUlSUnGb+8tsg03XdcX9gPankErFd356O0Jskp9IqZJCIbCu9pAmXYpvBY2Kyyzug4eL/ZzeUZIZx71H1wojxXPTF4p68t+FA5aQD9mEcSs/60QfS7Xdy2aP4OTJEHJavso+fFq3By6tr3j/s0Yloe+EMdPBbtfXro8xOXfMS7yeUbyCwgSAuSTaFYjOjvlGqdIlEEeTZ5Ash4KvUFREERhBAac7dp8S+zuPlja/BlwrpSCB36X5Zfld6dn6AZZnAhnForn0QAugqIYfI409Iu7sk/4S5A0jIn8HQVGHy7hODWSjcKh4c9h/Ybs2MwZDTBpjEg+B1ksmSnV6Co7XJwgp7xfSi0d9mLkJWVS5eaJl0deV9hs2L5pjy/SJaohuQPokfSY01A8mmeIBVJSzRo5o1e8tSsOkWHIghk0X7TXRcbzEARhTGjhvnRNXs8K+YjmL8JOuhqAUtLg6Ik/5mgpEjqsEyWwqVKUjV1hXwjP6YQrnNqyK3evrSIc1Y2zt7tYdYF1K1LT/GpjPGfIbccvGTcKq7uY72IP3gL+st4xLbaP8Fx2wW1oEeAfR32+emPXxzx4bCGWKIjxDIffoyT0/igc/7wY3TbT6ZMmCYeaoJK2Gzv4xG6jNO7b2Bu4FFM9LkEqLRGVCWohH6spfyQ+Wd5N2Ks9yjSMZNa4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(12006099003)(10067099003)(11063799006)(56012099006)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mMRjoc3tsDZ6DrRGMLvwvibMrKoo3ymlF8gSZlOEoL3ytCTxe8s8xZvm+dIk?=
 =?us-ascii?Q?iQaRNX0ehhrSy18k87O6ZJCAup6CTuhRRoVbXmCOR796s0lLIt4HMCtmfIcP?=
 =?us-ascii?Q?IwQBNsmVbwfOH9v2vnrfSaVYVrwRFUvYViL9Jwfjrrzpj4OaR8GX6fyde/5T?=
 =?us-ascii?Q?Vd2VMaTEd3YFIvf5CCNXRbOzOduzbX2JC1GPxydQ3qO6rLw3Y5rHPYpE8JzO?=
 =?us-ascii?Q?lAXpk11Fldoql4hr9M0tp1wKlMmvsns8HrMOmnwf1WKSTH1EaY04qIZnGDlK?=
 =?us-ascii?Q?+YCjoHas5E3CYCV7as5M3tT8x6+dz/a2G2voyyK0ILgBAA55jGXpGf2Q0y3Z?=
 =?us-ascii?Q?HU2veFtFoE6g0Flx5X0b97xS/W58MvF7VgFWtDIwvbFksHgAhCawLU9T3sC7?=
 =?us-ascii?Q?OthtCL6pCehDc9gTsndZKDjm5tXSuO7JFUDTEUVuiWRbvQmQ1rjVyOUiViwt?=
 =?us-ascii?Q?lks2uSunxVuYAghTYHp8bNFkMdhIrE+kzzYsXjxt23AUamt98ckgInHcg2dJ?=
 =?us-ascii?Q?OPwhi+JlH+Nk6FDk/ptqx6QICQNCs6/ortdhH3k1kXrgTetyH0rFUtKMZCD4?=
 =?us-ascii?Q?J8TnQ53oHsuVYCirlnrhC388FzipzngIIaeHisjxusBh2FQUFfxwgP0RUXji?=
 =?us-ascii?Q?QvJ6wWc81++z1wG6v8QXdo8Eo9BmoKrBsa0qvpvinM3s2lDoDfOeSJOFZSvn?=
 =?us-ascii?Q?yoid24qfgARDOuVjAEOC1/fH5KbOtU31hZGFWhBYd786KG24q0dqyCq3xuUn?=
 =?us-ascii?Q?PYf6XFMUK2tGE33NKhfkBTkav3Ih+XajjhGAptvWZA78r3wvFOCN2hW0AM8B?=
 =?us-ascii?Q?KFuipUxpTKuWALJRE8G/6JeudFf0D6sC3/5pHKZTaciozmTvc0s9SHU5Xp+2?=
 =?us-ascii?Q?HS3CtwsH+CC1bUZWSmNo9q5ZxtDvwMhJvC7kfmu2Kx7RWo+ZOWeiP7Czije5?=
 =?us-ascii?Q?eFQNasQtMybwVJVQi5CX4o38Fc70+ilDmYYB9W5yg6n+3qnhbx6TUtI3hOvK?=
 =?us-ascii?Q?CGwU7dISo4ExheEhGONqNWG4X62BVXccM4N+W5q7DO4bxjMHHSPM9QwXNmCZ?=
 =?us-ascii?Q?Eh2MQTnTe6kIVSEEBpVvnQcKgCIw8Bgg53LGr1BNcGcXb12Jt+4tfzEDmIOj?=
 =?us-ascii?Q?WlQ1dBUZ77vjOTD0Xk4C6AHu2vPuMsFZoN3BIVIy6sXLck9piGoQJolLpOaz?=
 =?us-ascii?Q?LM3BxKUzbFVY0ioy26XqL23dDoAwBzi1qh5b/kdSx3W2e/uUMDfwpQEcfwg6?=
 =?us-ascii?Q?cZoHoorHkZV0v8ewXc2ARyi/1lMdd3oOUVWg+hikbQ4SbDj7M7GGqlkCWB8c?=
 =?us-ascii?Q?PdWqmPRvzSdhLJUshPjs/z/vZswKRSV8GlRAFZiMEH7FHx4NLjYO6vbspHKM?=
 =?us-ascii?Q?0lph4MNWcEe2tbOd9uyBmNgRuAroWIMUqJ0dphCUqzEaS2dhryXVglsjqG9U?=
 =?us-ascii?Q?XjdFcKS90pS9g5LaLVP6yJ4IqnEx94DKK9iSguEQzU6JewiV+pmtdRp5Xg0/?=
 =?us-ascii?Q?tIQaUzUnJGuTUglQbzqDBqW3jqiRA5lNByOQn/+4KOICqdZT4e/binQ1c8UJ?=
 =?us-ascii?Q?bS6yfzRZDS9KabZH/IJjgJamjWCOUv3HIt+Nq2XjXK5aqCOpbzvlwfaLwUpC?=
 =?us-ascii?Q?K1I46uL7520TOltddnKm1n8o+UIfZdnfdF/3+8Cjyn2DoANZrfoQLC/zjEz/?=
 =?us-ascii?Q?J1rRy3tDll3WCFnh9ABSxRt89RMDD7HzEVUyxBkSCm8XZZ/o/QWj1o0aNZM/?=
 =?us-ascii?Q?KVkbi2g/J2d/lMI6wc4C7m7sT2m0MxU=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb7e3c9-18d8-4d43-b2c3-08dee89c8243
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:26:43.2906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YsbVHkQr1al8KHXOGTO6GRvF2MTY7ai6uexSaFt+IkghRZXYXundFfbc4hH3L9i5p/ckWC84KseOZbzllsMLfBbkRayIe6N3na2grOfSo0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB1959
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 09:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241818

From: Hongxu Jia <hongxu.jia@windriver.com>

According to [1]

As of the current version 1.0.8, bzip2 --version will print version
info but it will also continue compressing stdin:

  $ ./bzip2 --version
  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.

     Copyright (C) 1996-2019 by Julian Seward.

     This program is free software; [...]

  bzip2: I won't write compressed data to a terminal.
  bzip2: For help, type: `bzip2 --help'.

This is a long-standing bug, not new to 1.0.8 -- the same code
(license() followed by break, with no exit) exists in bzip2 1.0.6 and
earlier. The upstream bzip2 master branch on GitLab already includes
this fix.

Debian (and its downstreams like Ubuntu) will patch this out [2],
making the < /dev/null unnecessary, port a part of debian patch
to fix the issue

[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a-=
program-like-bzip2
[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.p=
atch/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ae4fe4263ba9d372f9b9e80df4ec4697b51c1f9b)
[Jaipaul: backport to scarthgap -- added commit message context that this i=
s a
long-standing bug (not new to 1.0.8), updated Upstream-Status in patch
to actual mailing list URL in the patch file, this patch is already present=
 on master,
wrynose and walnascar branches using the same bzip2 1.0.8]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-fix-bzip2-version-tmp-aaa-will-hang.patch | 65 +++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb    |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-versio=
n-tmp-aaa-will-hang.patch

diff --git a/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-a=
aa-will-hang.patch b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-versi=
on-tmp-aaa-will-hang.patch
new file mode 100644
index 0000000000..2d02328d11
--- /dev/null
+++ b/meta/recipes-extended/bzip2/bzip2/0001-fix-bzip2-version-tmp-aaa-will=
-hang.patch
@@ -0,0 +1,65 @@
+From a9dd6acbaca836fc4e943e69a31b2e7acda32045 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 13 Nov 2024 19:49:23 +0800
+Subject: [PATCH] fix 'bzip2 --version > /tmp/aaa 2>&1' hang
+
+According to [1]
+
+As of the current version 1.0.8, bzip2 --version will print version
+info but it will also continue compressing stdin:
+
+  $ ./bzip2 --version
+  bzip2, a block-sorting file compressor.  Version 1.0.8, 13-Jul-2019.
+ =20
+     Copyright (C) 1996-2019 by Julian Seward.
+ =20
+     This program is free software; [...]
+ =20
+  bzip2: I won't write compressed data to a terminal.
+  bzip2: For help, type: `bzip2 --help'.
+
+Debian (and its downstreams like Ubuntu) will patch this out [2],
+making the < /dev/null unnecessary:
+
+[1] https://stackoverflow.com/questions/59757176/why-using-dev-null-with-a=
-program-like-bzip2
+[2] https://sources.debian.org/src/bzip2/1.0.8-6/debian/patches/20-legacy.=
patch/
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/bzip2-devel/2=
024q4/000234.html]
+Note: updated Upstream-Status URL to point to the actual mailing list
+archive entry.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ bzip2.c | 8 +++++---
+ 1 file changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/bzip2.c b/bzip2.c
+index d95d280..6ec9871 100644
+--- a/bzip2.c
++++ b/bzip2.c
+@@ -1890,7 +1890,9 @@ IntNative main ( IntNative argc, Char *argv[] )
+                case '8': blockSize100k    =3D 8; break;
+                case '9': blockSize100k    =3D 9; break;
+                case 'V':
+-               case 'L': license();            break;
++               case 'L': license();
++                         exit ( 0 );
++                         break;
+                case 'v': verbosity++; break;
+                case 'h': usage ( progName );
+                          exit ( 0 );
+@@ -1916,8 +1918,8 @@ IntNative main ( IntNative argc, Char *argv[] )
+       if (ISFLAG("--keep"))              keepInputFiles   =3D True;    el=
se
+       if (ISFLAG("--small"))             smallMode        =3D True;    el=
se
+       if (ISFLAG("--quiet"))             noisy            =3D False;   el=
se
+-      if (ISFLAG("--version"))           license();                  else
+-      if (ISFLAG("--license"))           license();                  else
++      if (ISFLAG("--version"))           { license(); exit ( 0 ); }  else
++      if (ISFLAG("--license"))           { license(); exit ( 0 ); }  else
+       if (ISFLAG("--exponential"))       workFactor =3D 1;             el=
se=20
+       if (ISFLAG("--repetitive-best"))   redundant(aa->name);        else
+       if (ISFLAG("--repetitive-fast"))   redundant(aa->name);        else
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-exte=
nded/bzip2/bzip2_1.0.8.bb
index b661bc9546..6c02dc3ed0 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "https://sourceware.org/pub/${BPN}/${BPN}-${P=
V}.tar.gz \
            file://Makefile.am;subdir=3D${BP} \
            file://run-ptest \
            file://CVE-2026-42250.patch;subdir=3D${BP} \
+           file://0001-fix-bzip2-version-tmp-aaa-will-hang.patch;subdir=3D=
${BP} \
            "
 SRC_URI[md5sum] =3D "67e051268d0c475ea773822f7500d0e5"
 SRC_URI[sha256sum] =3D "ab5a03176ee106d3f0fa90e381da478ddae405918153cca248=
e682cd0c4a2269"

