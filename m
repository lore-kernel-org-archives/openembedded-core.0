Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA61C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 15:01:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.76])
 by mx.groups.io with SMTP id smtpd.web11.1132.1739286057297610302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 07:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.com header.s=selector2 header.b=jmPagI7W;
 spf=pass (domain: weidmueller.com, ip: 52.101.66.76, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WifE9ZQjEKlWuBWrEpQJF2IuOc8ts4ok9aFrWIxIAs28ScBK7K9NNe/7cscld4jPe8NJ/qBWUcbuylaLI5HI7PLxNwKRQlFIhqVSB7u+WorsDNGwH10A9MiHQb2BxOr/dKJcOicYM1hLbgylRe5VUCj+FGMpaLiHMIeTgsNig5hiWEpEqFJRmyR/1DekgZeeLOe+e0HbB41bWPNahAXOld/YUV0O8DOGUbcL3L+pdWGa+IcE0CWU2gavQ2+ZMsDnXlyoSzoGZF67LBoxEkP1VaRYbTnJboXO9ywJW+19Z0NSPjbRyW1oa0QMyCZHL5iFzPNU2KbXekyEcesxPTsAng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS64VFU91IZ7bMi6ReKYIFCU9H5fDjvr0X5kRqdz/Xo=;
 b=tZitswMxPCYfRxxd7KdduwViI08FvaNTe8ENwMBolliIjEp2xVPNNPVfpxfuZlCBbc3YufzgjPw2Ha+tCtnpgKuhC1tH7RJ5/bpK7wEZOsrJqf1IjcWTmtwoCFf/hcpPqwxER7LTSaGLba1Lx2hztZ/WwPPdmiv5rC4UMJHGoQ7hst/4j6WKdau41o5vcwQlINW0Iq38KgqJRps8ieRaK9jU0y5L/dHcv92+FB+mFd7doQP1ZxQckpeVYEdhBppPDNzyHbHUMuxBPXl0W2j3bL850a9uhQVEzpGZzAc/Cu5XgjZaGAXwodkW7kZaoWGqvU9P6lOYrUw9eV8r2+R9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS64VFU91IZ7bMi6ReKYIFCU9H5fDjvr0X5kRqdz/Xo=;
 b=jmPagI7W4WnJZT1Y/AL+Pbtq2dN1SPxdLVNBuBl4dNYaCVQmif3UcPcSxCug2v3eDHGHA68olqjvhdOFHF5aXLl0RuYJkQbOoN8sNN+Y0YZEdAXW0S+HnBDFooT5SCbpgUXccf2oAxnjdPZljmoNv3BfE24B83BvEu6G3tpzbjcAXgMJWCzo/g0AJJJ6NlUPFyL0JlYC9BmO4rlQGArt6sxomP7HQxri8tmCWJxoKrH+66/l8+pWn2QYvlDLIcMYOLmGNOP+xdX8Ks3JMQjLiSsdU6wUd2/QB52VF659abjd0b+ioYvAGDS9COFs5VrSB4ogmV37dO8+B9LxSboRAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DU0PR08MB9396.eurprd08.prod.outlook.com (2603:10a6:10:423::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.20; Tue, 11 Feb
 2025 15:00:57 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 15:00:57 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [RFC PATCH 14/30] classes: base: add get_src_uris and unpack_src_uris functions
Date: Tue, 11 Feb 2025 16:00:18 +0100
Message-ID: <20250211150034.18696-15-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DU0PR08MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 618a9279-f656-4274-e260-08dd4aace116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NvfKKcsY2fY1lCFJho4przcxYEJv2hPFzDzKDFCJkdPY/2qKkFa4DO4NNkbW?=
 =?us-ascii?Q?jMK+4xyVkYDjP6mVBTMzVBERGsnGe/BsFg3JK73n+HtBlou7MkBxkr5zxvuO?=
 =?us-ascii?Q?I5UBy63BvlmtMe4LNqDm4BfmZcshtqAAqqPNgZT4+yt5xh+y0dCxqoPI1lWC?=
 =?us-ascii?Q?lHwYRNiddhGrk9egXkAEYmh/5uaYrov3efohlJbBNQS60R0jCFkmA4GR2ql2?=
 =?us-ascii?Q?9D0m/zlzupO7+YJ/7T9+AJ0M7vQ+WT82pNx6yVVPrxSOMW491/EbgKpzLPmF?=
 =?us-ascii?Q?JGyi7Fb8Ipx/sRgyVNUWRBxnY8kCGdhFv2FF0pARJE/forNNejocpVEEJxtd?=
 =?us-ascii?Q?ORn/qYA5IYVjsWINChP64gdmfZ0ffUyFmAXwiEfsfIxzPuqv5XSegHYJjQa2?=
 =?us-ascii?Q?ov+qUywKPXGIgo7uVCQNv+7Fp+hDbfx1DFpLhxGLCpI3EfkEo46OXl0SVsYN?=
 =?us-ascii?Q?VyZazgzqDUBb/vQ6Jrf2VUo/9gcTP/u5IloIv1+LFBCQFLJOi+z58suhcoZI?=
 =?us-ascii?Q?Nl/gcgodlFpWVQpBmsAYskzJSJkqjLYTyv+t2C8/vb/DUJKx6klwvH4O3NnC?=
 =?us-ascii?Q?bFlxEIx+hvAtaaB2c32QK/bgEinIMj+RSRIhx25cgdQz0tuADPlly764fGwI?=
 =?us-ascii?Q?O9FTWu7xExYTHwC6OZKgBpvvPPX+W8OaD/3rV84G/p6TXfF5CkeNhjsNrQEX?=
 =?us-ascii?Q?HmewNNnmHTMIudg54tjprpsHbwG+2HWmXeSDxQbhwtyh6Uyu+Cc3YiOvEfWo?=
 =?us-ascii?Q?0/MySdeXdMSd/Z5/NfBKAZ6sMobJx4AbMkJvANHKL5nuujSbZQowdAfm4ffl?=
 =?us-ascii?Q?HVdwMOKJLugO1Njze9paGYIvAMFu/2HlEZIdhZyQzDm+zvgb99prspXy7b8q?=
 =?us-ascii?Q?K1X8jdUw2i52YhpZ2WsIETWz2qUexJCn4NuW2WhRyaOqxqzCrnmx2sLPFSVe?=
 =?us-ascii?Q?IJdeE92lBqOtMQtoEjkZP8v3HreP3aE8sSRY22pt+DyZrBM/o77mrROOVKX7?=
 =?us-ascii?Q?a51DtW7G5IzCO4ZN7ajUInB7fmoQytmCOh9uQvPtsEY+Mm7vrifV8NZR88UI?=
 =?us-ascii?Q?9yhGttHNaR3CQMOwxH/FIv43zoVP++Jmd3C6boSPoHgAVAnumCxaPZNsWjvO?=
 =?us-ascii?Q?jnEs89LRWuFaHViciMJxs1d7VR/lMlJZMrUvt3euDbT/xe3JB06fElQNcbRb?=
 =?us-ascii?Q?pkAIPtKopfrRTeG3rkJ/gAFbazYeX/0Dpaiia4RM3+c0Mu8f2CiwHLcem8ip?=
 =?us-ascii?Q?h9JHJwuDnmGcD7jNBS9yZGlFLrXCRZ/otG0BJCHYUBG1qAlXZLt3iQT5Ucw7?=
 =?us-ascii?Q?nlfYQ4W3XAhKpI4kfvMnr9ciAI+3YS8+PjXwpNvpkCTceia/cxbg+B0yVVbq?=
 =?us-ascii?Q?mhumYZV7OB6mpJLxvFBoE8BcCR2fSuRqQ1eG9KsfIYMJ+hBcB3033RCJgIfh?=
 =?us-ascii?Q?3H++Y3/cMzHlo3THyVqcYWB7JLSvuTUm?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2Cnnyg0e+jZNkg2lGfgl2SS/s6XIdWOJKyTDrtFHsoU7d15J7j290l+ak+ce?=
 =?us-ascii?Q?+M5St9s6yhE+C75J4MzMwHtBuNbKf4t2TGhIONSdlJ1nq9oY8x8cLm/Xdbw1?=
 =?us-ascii?Q?cCo/debQopEb2NBIEaYJgdQTqQ3bmMlvHVCnoDfR4xeycMm2j1PMwGae9J1O?=
 =?us-ascii?Q?GzpdCDLUXIt1V8kKQC5W30qpu4iSO+g19shs9ccAId+O0JvxLJAJM2bRAAM6?=
 =?us-ascii?Q?tbbGxXDwQ2uhsCc/6J2j+UalHHUWnhj5CocmWrB7MSacXjG/XqWJT58mLGpy?=
 =?us-ascii?Q?of9HYVXjOSI/pUs5YvxW/Ka5FU7E3+dquOodBh0Q8gyZdJCTSZv77QAxdRfP?=
 =?us-ascii?Q?gsFkGXFKHb6KPDfaa5Z5wrq2bRPTEeZ4WOJIeQkdxXmRb1MDObrAKRDnnlQW?=
 =?us-ascii?Q?m4LladjyrxIiRCmjbLGilZnmYTV+PevaiZNOdDLNcbjCTYzTVkXuOWf4V1OT?=
 =?us-ascii?Q?Cm2GiUeNvgJlR389IkGyH+dnApt/SngYp+vgrXzcAgZmD+Zj2TXSDXI+VUyK?=
 =?us-ascii?Q?iXS8WB6sQPCMHCWgiQuykv2bsXg4ETcvRMqt1Hf6R4OJF8gYX231ciH/67Wq?=
 =?us-ascii?Q?BTtTcht4+RbMocD7pc2NEhPoPKTgV0tXaY5MMKdxbw4fUKdWarJrOR1TEgsN?=
 =?us-ascii?Q?RSUvBavzmGQLAZ8MJZR2BlRAeASxdViLVayGA6vaUs/KvRorE0/ESgRVEXwC?=
 =?us-ascii?Q?8C9bFr+3e1ktKphMSfiFRKLgXWGoX8RIEbw7nmNWoKViR251hpVCjq+mF7OT?=
 =?us-ascii?Q?5+dOHPsTVBOmLqyM7J9DDpEzdbai78UtZFf8MqTqbvRx9A0vhKTvfhy4NENN?=
 =?us-ascii?Q?xEeHbGQVANTq2t/fqeMPcC/MAe0uq+RpXgt3J1+bSQMAuXZr2ZU02kmKqJDQ?=
 =?us-ascii?Q?543USpxmsLzeLaO4EsQ3kEHRUsvfPTXajgszHX2jn4X0PUjPlBhn4jtmmlMe?=
 =?us-ascii?Q?TPdV/VnmfLvY0r9SAqJJlp1VcUo4NIyMu3GTzeYqNhjmtaYy2A0/s4vL+LLd?=
 =?us-ascii?Q?hTaGCPfefiRxcLGHPFzWUhNhKkOn+Xo3TnlhYdFK7cEsnyW/eN3E9pf9AmAm?=
 =?us-ascii?Q?/oadyXzsM0oYtKzxA86rHmT52fEUbYrJTqJendbwcRwxRGsEJpc8X+vV7BOA?=
 =?us-ascii?Q?XpeC8ll0CUX8HBndmvmLZAkaBigLQkZRCju+PbGlkX3w8FEnT/LvZmU0UiNI?=
 =?us-ascii?Q?GJcB/JYs4Cln0FWzfOkbhzJoasjeEQbgkLjlmL5IKcUEF6fZCk7ijttfb5Ta?=
 =?us-ascii?Q?d1gK6voTBusg/DZvm3iKAN+/5LnB3jETAMGeUtjZalpR7wapzOwf88qzNB7n?=
 =?us-ascii?Q?oRiGrbRIx8K3+Yzic3sg71gEr7mSjehoCk2m0FU5LX7DoPE0aEEJFVPeqBQX?=
 =?us-ascii?Q?yDqhB8VJvmOdnp5rvWZPTZvlFkOiEUrWOIVwam7ZnWU3guwyV8wNpUOWPET0?=
 =?us-ascii?Q?TOE86S/ci5wrw0JamE16Txhv6VtUJlQQMxiMZA7dfXIH1xmLMEmnI/adrqst?=
 =?us-ascii?Q?qLF3JfsgCBKGo//X8yJluQw1Bq57hty0X5LTq4R5KFDBtOL3kHWZiUnqlvFG?=
 =?us-ascii?Q?/zlkJZP7KrLV2xof7UqzzZTSCT6XBte2X1cMuG994YmD1dvn7rz6y6WWLRAd?=
 =?us-ascii?Q?9w=3D=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618a9279-f656-4274-e260-08dd4aace116
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 15:00:52.9332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLzGYsV74h7RrbE7n2aKUfX6aVxYCXTBycXjLLiYJfNvo2gnQtomfWqnw3vYUrTusyVrr4lfoztlPtMubXt/Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9396
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211140

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add get_src_uris and unpack_src_uris functions to share code between the
early and normal tasks. The functions have an early argument to only
handle the recipe SRC_URI and doesn=E2=80=99t parse the SRC_URI_FILES.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/classes-global/base.bbclass         | 47 +++++++++++++++++-------
 meta/classes/archiver.bbclass            |  4 +-
 meta/classes/buildhistory.bbclass        |  4 +-
 meta/classes/copyleft_compliance.bbclass |  2 +-
 meta/classes/create-spdx-2.2.bbclass     |  2 +-
 meta/classes/externalsrc.bbclass         |  2 +-
 6 files changed, 41 insertions(+), 20 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bb=
class
index 924f319999..2571dab3ba 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -139,9 +139,24 @@ do_fetch[file-checksums] =3D "${@bb.fetch.get_checksum=
_file_list(d)}"
 do_fetch[file-checksums] +=3D " ${@get_lic_checksum_file_list(d)}"
 do_fetch[prefuncs] +=3D "fetcher_hashes_dummyfunc"
 do_fetch[network] =3D "1"
-python base_do_fetch() {
=20
-    src_uri =3D (d.getVar('SRC_URI') or "").split()
+def get_src_uris(d, early=3DFalse):
+    import oe.vendor
+
+    src_uris =3D (d.getVar("SRC_URI") or "").split()
+    if early:
+        return src_uris
+
+    src_uri_files =3D (d.getVar("SRC_URI_FILES") or "").split()
+    for fn in src_uri_files:
+        with open(fn, "r") as f:
+            u =3D oe.vendor.load(f)
+            src_uris.extend(u)
+
+    return src_uris
+
+def fetch_src_uris(d, early=3DFalse):
+    src_uri =3D get_src_uris(d, early)
     if not src_uri:
         return
=20
@@ -150,11 +165,25 @@ python base_do_fetch() {
         fetcher.download()
     except bb.fetch2.BBFetchException as e:
         bb.fatal("Bitbake Fetcher Error: " + repr(e))
+
+python base_do_fetch() {
+    fetch_src_uris(d)
 }
=20
 addtask unpack after do_fetch
 do_unpack[cleandirs] =3D "${UNPACKDIR}"
=20
+def unpack_src_uris(d, unpackdir, early=3DFalse):
+    src_uri =3D get_src_uris(d, early)
+    if not src_uri:
+        return []
+
+    try:
+        fetcher =3D bb.fetch2.Fetch(src_uri, d)
+        fetcher.unpack(unpackdir)
+    except bb.fetch2.BBFetchException as e:
+        bb.fatal("Bitbake Fetcher Error: " + repr(e))
+
 python base_do_unpack() {
     import shutil
=20
@@ -162,12 +191,8 @@ python base_do_unpack() {
     # Intentionally keep SOURCE_BASEDIR internal to the task just for SDE
     d.setVar("SOURCE_BASEDIR", sourcedir)
=20
-    src_uri =3D (d.getVar('SRC_URI') or "").split()
-    if not src_uri:
-        return
-
+    unpackdir =3D d.getVar("UNPACKDIR")
     basedir =3D None
-    unpackdir =3D d.getVar('UNPACKDIR')
     workdir =3D d.getVar('WORKDIR')
     if sourcedir.startswith(workdir) and not sourcedir.startswith(unpackdi=
r):
         basedir =3D sourcedir.replace(workdir, '').strip("/").split('/')[0=
]
@@ -175,11 +200,7 @@ python base_do_unpack() {
             bb.utils.remove(workdir + '/' + basedir, True)
             d.setVar("SOURCE_BASEDIR", workdir + '/' + basedir)
=20
-    try:
-        fetcher =3D bb.fetch2.Fetch(src_uri, d)
-        fetcher.unpack(d.getVar('UNPACKDIR'))
-    except bb.fetch2.BBFetchException as e:
-        bb.fatal("Bitbake Fetcher Error: " + repr(e))
+    unpack_src_uris(d, unpackdir)
=20
     if basedir and os.path.exists(unpackdir + '/' + basedir):
         # Compatibility magic to ensure ${WORKDIR}/git and ${WORKDIR}/${BP=
}
@@ -704,7 +725,7 @@ addtask cleanall after do_cleansstate
 do_cleansstate[nostamp] =3D "1"
=20
 python do_cleanall() {
-    src_uri =3D (d.getVar('SRC_URI') or "").split()
+    src_uri =3D get_src_uris(d, True)
     if not src_uri:
         return
=20
diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index df271feddd..c297f6008d 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -190,7 +190,7 @@ python do_ar_original() {
=20
     ar_outdir =3D d.getVar('ARCHIVER_OUTDIR')
     bb.note('Archiving the original source...')
-    urls =3D d.getVar("SRC_URI").split()
+    urls =3D get_src_uris(d)
     # destsuffix (git fetcher) and subdir (everything else) are allowed to=
 be
     # absolute paths (for example, destsuffix=3D${S}/foobar).
     # That messes with unpacking inside our tmpdir below, because the fetc=
hers
@@ -332,7 +332,7 @@ python do_ar_configured() {
 python do_ar_mirror() {
     import subprocess
=20
-    src_uri =3D (d.getVar('SRC_URI') or '').split()
+    src_uri =3D get_src_uris(d)
     if len(src_uri) =3D=3D 0:
         return
=20
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass
index d735dd5fb5..1a6bed8a84 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -289,7 +289,7 @@ python buildhistory_emit_pkghistory() {
     rcpinfo.layer =3D layer
     rcpinfo.license =3D license
     rcpinfo.config =3D sortlist(oe.utils.squashspaces(d.getVar('PACKAGECON=
FIG') or ""))
-    rcpinfo.src_uri =3D oe.utils.squashspaces(d.getVar('SRC_URI') or "")
+    rcpinfo.src_uri =3D " ".join(get_src_uris(d))
     write_recipehistory(rcpinfo, d)
=20
     bb.build.exec_func("read_subpackage_metadata", d)
@@ -933,7 +933,7 @@ def _get_srcrev_values(d):
     """
=20
     scms =3D []
-    fetcher =3D bb.fetch.Fetch(d.getVar('SRC_URI').split(), d)
+    fetcher =3D bb.fetch.Fetch(get_src_uris(d), d)
     urldata =3D fetcher.ud
     for u in urldata:
         if urldata[u].method.supports_srcrev():
diff --git a/meta/classes/copyleft_compliance.bbclass b/meta/classes/copyle=
ft_compliance.bbclass
index 9ff9956fe9..e16427e9f4 100644
--- a/meta/classes/copyleft_compliance.bbclass
+++ b/meta/classes/copyleft_compliance.bbclass
@@ -29,7 +29,7 @@ python do_prepare_copyleft_sources () {
=20
     sources_dir =3D d.getVar('COPYLEFT_SOURCES_DIR')
     dl_dir =3D d.getVar('DL_DIR')
-    src_uri =3D d.getVar('SRC_URI').split()
+    src_uri =3D get_src_uris(d)
     fetch =3D bb.fetch2.Fetch(src_uri, d)
     ud =3D fetch.ud
=20
diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spd=
x-2.2.bbclass
index aa195f5aa7..43db4f6e3b 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -349,7 +349,7 @@ def add_download_packages(d, doc, recipe):
     import oe.spdx
     import oe.sbom
=20
-    urls =3D d.getVar("SRC_URI").split()
+    urls =3D get_src_uris(d)
     fetcher =3D bb.fetch2.Fetch(urls, d)
=20
     for download_idx, f in enumerate(fetcher.expanded_urldata()):
diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bb=
class
index 70e27a8d35..17a0159bc0 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -65,7 +65,7 @@ python () {
=20
         bb.fetch.get_hashvalue(d)
         local_srcuri =3D []
-        fetch =3D bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
+        fetch =3D bb.fetch2.Fetch(get_src_uris(d), d)
         for url in fetch.urls:
             url_data =3D fetch.ud[url]
             parm =3D url_data.parm
--=20
2.39.5


