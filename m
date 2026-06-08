Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BFACD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 12:36:56 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53264.1780921510401770141
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 05:25:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=J0I23G7S;
 spf=pass (domain: est.tech, ip: 40.107.159.22, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2FfGXEojJJ4lLbYO6xxtKNxZZARWgKUd7cZVThM7zdFo+qdXo+gKphiustMjhspR/AnKCtQgnI/82s51eG94P9/YQLn/edY1wyervo6t6cf3qaE1k7DuIHL0LYFtGnU8KLn3FtfkDkMnUNaZfRhO1GlU3kZl3qOOgYTudNCO0GQ6kY3pO56LXfWyeQvtN4FYsd3rgYbruCizD1y44BnUr3EhvqOG5kiQhmStIGhjX9svzoVV5NfRYASwL+ILr4r05TWetoE2dH4Orv6ftSBMSz2WzZ+3eUE6Ul50eqwQZRc8WoqLHNrWCBiTMvlx16GCIzr3XA++Mn0FL7D6s5OAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZ/8x/Xs6m+/sjlYQCHYg5kRpVXcVgKNi7tR7xhyYIg=;
 b=JpUd5cuEjpTwNG45xwPmKiufCwJgYNAdSV/d09hjjI/dfwJGzGya+klMTLOWeFUBSLpbLAdR65cYX7x0V4sId/AlunxQvNDvE9XBznUBkjBAqqxx1jRQAAO1xNbKteEO5NsQ/c/WE9OX0qXiTSDddNo9bCqxT99QrpDXGzScO6Hcti29qnhpwQ3fFWlqDGXsky8jjikYfjQEO39ATQtEN89Nfto0q9uYXAS4iFhQMCkqFjYBjsKLAglsHB2+XFl67m3fAiuP//qwHnnHwhtEijwgep/8GHgNgN1Kr9BPBCR2ExhthAGCj3wLhsT1WKlQykLNcTqqA87nyosE1e4WRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TZ/8x/Xs6m+/sjlYQCHYg5kRpVXcVgKNi7tR7xhyYIg=;
 b=J0I23G7Sb8uMgZ92FKU264vNnPx3JItbMWH2WLCxy8jvKMtEE6xkvIqUbGHeNRK1K548+l8ADWGyZV063j0HcA4e7aiMbAdaBWulSQJz/a0gCfbTuMqSTax/gH/IBXHp3N5cw0tIki1sAhRPDKApBh2IK2bPl73hVvOUkdFQtWw47gkbf57OclhTWpITnbNyzW23DGymgPezGbe0I+iTZvz9uzJSid5NgUvFTdAjNJugJGZF/uWO/2dKE9+QfQnHCAd6F3JC9cSHA+X4BEYTgM6eRVr91xXHfoHaJ9mNNB/lx5iSGLeA9NO2I+6Wc6mu4dIgHz5ZJR30iKUuAck1Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by PAVP189MB2620.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:2fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 12:25:05 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 12:25:05 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][scarthgap][PATCH] libsolv: fix CVE-2026-9150
Date: Mon,  8 Jun 2026 14:24:58 +0200
Message-ID: <20260608122501.1210542-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU6P191CA0055.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53e::26) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|PAVP189MB2620:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0d4164-1aa2-4736-2064-08dec558f89d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|11063799006|3023799007|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	GOVp17GqKqyT/3L3kg+CK5tN/KnaIqZyYtWXMPZgTnjOi8OVIRa+R0QXXjUzxd1q7R9ndnryxBLu9gb2vr67o6b4//7Y0Kd82wjNx7n3vUpLArzQ39WJ6kk3UKomp11qaTWkOHN7979OowJIHswJZQV802ECfdLSRdDh765yhpveyRZVejNExN/scfsQKZi3XD3RH9nSutWBLPLGvwXdizXSVzuU7zP5KMUUTk/qy0zeEwDwRbKNBighk/h1n0aVE8gsqaxIGODTYSBmjvcANSNONU3tcu5n318c5cu/kmCh6L1T4SUIsVwoMnast2fEKK4fsVtm0LRkoQOFHkB4ZMmp97oRHyjFJgc+J/UGRfIdK9jfUPBv0u+/c5wOBwQ34aU2qc4J4Pmcv0yS3NC5aF64lOtZ06N9zOYdkuMe+NrBDvupkb7PCmlZfuoVOwiQwU7yYnBYBUB+LSh6FAL7ZjP6w/gpwQiYpbRr6mlalrBE4iSY6DlNh7S2DTWhUP5vdOeHHLwaaFERPzbRsHSiwsvlwHPnOLc1ekGYgzqimgGytWxlx3GqkXYQNEaMPVPMJRZKCb839/ZuRB9mFhHqPbJ1pDEwbvjwC5HR4QUWQKZyjxBLUBUDViMs4Wyyd/mE1FZMwen0iipP8tSRjuIiuRnf9vGf2LpQwdlPhqWg5Z23kL08hYsmu+/JjqGdZkxCcnrIjRjoL5YbWKYE3JFQ9A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(11063799006)(3023799007)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VLuD+DQh22/mi+uk9dnAp0FkwGcJprXipCat8io3QUicjs60JhhRHYjIrmLh?=
 =?us-ascii?Q?CtvOkUckhDxZeABm87m5In3njTeGTrIvccj++bUbg2x3EdZCivf3cbZmLpt/?=
 =?us-ascii?Q?7VsEiU2zACp9nKOSDIj7BZNrjSi1leiT0aFT0YoTodqqBeRigB7aVNGJvnjj?=
 =?us-ascii?Q?cIluKCJrjFca3fRa5+7bN1Ua/NtAFz0hhLLxguaT66bp/OWcqrW+sMvSMWIN?=
 =?us-ascii?Q?h+WaNBq8GwS1lomyrh8XbcwJhZ/ju0vfW+jv8d2gCyPQUBM0tq8WL/i3pJmy?=
 =?us-ascii?Q?WXMiDKULWIwM8acLeZ0YFnUkSHGZCRwRAXL8IjkYoRujgW3bU29z1ISStNPP?=
 =?us-ascii?Q?zouogobnrtw+2Y7UY5BycOjbSY2KkhrA8Qgu/VwTF8WrnWuCAp4f7JgsaS28?=
 =?us-ascii?Q?qKtfOqg7ib2iBv3bNLyURwvFBvU5iBUET2nKzM/KLFVgj7DGUE0UHdB2KPzJ?=
 =?us-ascii?Q?eKuRtET3ddGk2+UUS/+CEZY7KvpbUFUieNWPrUptk6ZKt8MPSVOPZglYtHqA?=
 =?us-ascii?Q?WEsrmj2gW4zbcTkHXlHhi5f0Wvjz97flGyl9Vl+eaTQFKxwhv8nLzo1Oow/h?=
 =?us-ascii?Q?+7hLWBxGNjn32OcliidCAjImVmlcyiNlDpUqVHZ5l34J2Ubh0VlkeY85JDf3?=
 =?us-ascii?Q?PVjjEjS6EJMK+FHfG+i5YqAiGnfyQHL0jGrdWUkSzu6hnX9095ILnIDQjrqB?=
 =?us-ascii?Q?ahbjob2WCcfRTBHDvvh1zIqEWfSzJvt/bpYxxjbRWvY2SOeCp7L0H4nH9l2L?=
 =?us-ascii?Q?5GfKSwb6gR1hCdnC1Tk5wgtNADktE9BgKyldMjR6otxskcg98EpdvrajWUtm?=
 =?us-ascii?Q?qv6Wq+tESglb4pEK2C65J29xdlP6N9QbiJLfWd0oAiY8OS1unwKCLVRmM/yJ?=
 =?us-ascii?Q?c+RqKwuJLQERQAqgjJD9iuBdrUFtTcZA8kKx8yadiWCJd5coLueo19Jhz80e?=
 =?us-ascii?Q?Hy1djsGeIBbL6CLsYbL3L4RRJ6vmOTqtmaKNudY6pmaK45m9pWTcTgoh854m?=
 =?us-ascii?Q?tpw2rGJ0WE+rtbjspJ9HM68e03SrbFTFdQslE/vBnN/Mj9BNJVdpYQu088ox?=
 =?us-ascii?Q?WwEMXg5iQu8J1dwbfMQ4t33bsi+k1ttz+2hRXIFEfni2cHdRH+Yw+M7ZCduj?=
 =?us-ascii?Q?GrfmrLzV5Oz+qrf6Ph9w7sUV9Nz7CFZxw4czh9SpvnYgPT6lS6Um39KhjveV?=
 =?us-ascii?Q?zrJJGR5OkX7wk02AiJwSH7UDugS1yi57yoqJSbE/GYBJSVz2KZRHeZ8Q4a7e?=
 =?us-ascii?Q?nazk8sfkYW+FyHSTkiLdazKYuXSH+kpid5/l/UG+LHnqMrgd0xBCCCwEKu+n?=
 =?us-ascii?Q?MxCacFikefd6SqweGfKNjJT5ju+WoltKdCjVyTvkDlODZ/uSBYCF7pAEkC37?=
 =?us-ascii?Q?O0ivd6n86TzgyuTkTglr/5aE2gHkI4mOCa1LK1fI/M1trWJS3yYSFXaIJ7me?=
 =?us-ascii?Q?fX2wHnWJ1C6GayCYqqyHzp3auKDd7N8K1qh3CA52qy6benly/JlN6O1UABgI?=
 =?us-ascii?Q?rVR/qotaOOmQKh3VP+zs31iLE4U/dJL57HAIUkbzah2LyxdYi84265GNKVbf?=
 =?us-ascii?Q?mdCyCoDDSku97ExRJgctz3VLwJ717AKOiIPQkaQ4rTJDBRE3WJjAndXLL/dS?=
 =?us-ascii?Q?ZQj2LhCxmewJb5VHz7b2cNRxSc/WVrf99WfQ22ZWxqU8dWe+1hyZlWVN4XMs?=
 =?us-ascii?Q?LL2tHvyv8dOfW6O8pwDaI08H5Bl31aYqM7pNw3+chreOYnVCbyQW6AJtLmrQ?=
 =?us-ascii?Q?xb5XCHerTTNQECCVW5Cq2ITwd8b5v5s=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0d4164-1aa2-4736-2064-08dec558f89d
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 12:25:05.3114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /od5pXnpewTbkgVwuPz3e5hMBeS++X/h7uzMOn2ho8aenWfD5YlUYtGdHSAz8BLLTLI6wfMNj4L1WOzo57AZP1RlxMyJtEsdueOnr2OBsNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2620
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 12:36:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238232

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-9150.
https://nvd.nist.gov/vuln/detail/CVE-2026-9150

Upstream fix:
  https://github.com/openSUSE/libsolv/pull/616

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../libsolv/libsolv/CVE-2026-9150.patch       | 68 +++++++++++++++++++
 .../libsolv/libsolv_0.7.28.bb                 |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.pat=
ch

diff --git a/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch b/me=
ta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
new file mode 100644
index 0000000000..4903edb599
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
@@ -0,0 +1,68 @@
+From bea261fd0924ecd5c7e5579f460133ec023c6def Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Petr=3D20P=3DC3=3DADsa=3DC5=3D99?=3D <ppisar@redhat.com>
+Date: Wed, 22 Apr 2026 09:18:29 +0200
+Subject: [PATCH] Fix a buffer overflow when copying SHA-384/512 checksum f=
rom
+ a Debian repository
+
+When parsing Debian repository, control2solvable() copies a package
+checksum string from the repository into a stack-allocated "char
+checksum[32 * 2 + 1]" array.
+
+If the repository defined a SHA384 or SHA512 tag, a buffer overflow
+occured (as can be seen when compiling libsolv with CFLAGS=3D'-O0 -g
+-fsanitize=3Daddress') because those tag values are longer:
+
+    $ cat /tmp/Packages
+    Package: p
+    Version: 1
+    Architecture: all
+    SHA512: 00000000000000000000000000000000000000000000000000000000000000=
000000000000000000000000000000000000000000000000000000000000000000
+
+    $ /tmp/b/tools/deb2solv -r /tmp/Packages
+    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+    =3D=3D3695=3D=3DERROR: AddressSanitizer: stack-buffer-overflow on addr=
ess 0x7b685ecf0071 at pc 0x7f6861683722 b
+    p 0x7fff37e3e7a0 sp 0x7fff37e3df60
+    WRITE of size 129 at 0x7b685ecf0071 thread T0
+        #0 0x7f6861683721 in strcpy.part.0 (/lib64/libasan.so.8+0x83721) (=
BuildId: 80bfc4ae44fdec6ef5fecfb01e2b57d28660991c)
+        #1 0x7f6861d7f34d in control2solvable /home/test/libsolv/ext/repo_=
deb.c:491
+        #2 0x7f6861d804ea in repo_add_debpackages /home/test/libsolv/ext/r=
epo_deb.c:622
+        #3 0x000000400fd5 in main /home/test/libsolv/tools/deb2solv.c:134
+        #4 0x7f686123c680 in __libc_start_call_main (/lib64/libc.so.6+0x36=
80) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+        #5 0x7f686123c797 in __libc_start_main@GLIBC_2.2.5 (/lib64/libc.so=
.6+0x3797) (BuildId: c04494d63bca865bedf571a4075ef8867ccf9fa9)
+        #6 0x000000400694 in _start (/tmp/b/tools/deb2solv+0x400694) (Buil=
dId: a3350337819a51edd0c75293970d3458b5033bc9)
+
+    Address 0x7b685ecf0071 is located in stack of thread T0 at offset 113 =
in frame
+        #0 0x7f6861d7de2a in control2solvable /home/test/libsolv/ext/repo_=
deb.c:365
+
+      This frame has 1 object(s):
+        [48, 113) 'checksum' (line 371) <=3D=3D Memory access at offset 11=
3 overflows this variable
+
+This patch fixes it by enlarging the buffer to accomodate the longest
+supported digest string.
+
+This flaw was introduced with c8164bfecf2ba8bcf4c24329534d3104f19da73c
+commit ("[ABI BREAKAGE] add support for SHA224/384/512").
+
+Reported by Aisle Research.
+
+CVE: CVE-2026-9150
+Upstream-Status: Backport [https://github.com/openSUSE/libsolv/commit/c5b5=
db52aebde00bdeacecf4d0569c217ab3187d]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ ext/repo_deb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ext/repo_deb.c b/ext/repo_deb.c
+index d400f959..25eaf8cb 100644
+--- a/ext/repo_deb.c
++++ b/ext/repo_deb.c
+@@ -368,7 +368,7 @@ control2solvable(Solvable *s, Repodata *data, char *co=
ntrol)
+   char *p, *q, *end, *tag;
+   int x, l;
+   int havesource =3D 0;
+-  char checksum[32 * 2 + 1];
++  char checksum[64 * 2 + 1];
+   Id checksumtype =3D 0;
+   Id newtype;
+=20
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.28.bb
index 201059323a..63534dce26 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.28.bb
@@ -10,6 +10,7 @@ DEPENDS =3D "expat zlib zstd"
=20
 SRC_URI =3D "git://github.com/openSUSE/libsolv.git;branch=3Dmaster;protoco=
l=3Dhttps \
            file://0001-utils-Conside-musl-when-wrapping-qsort_r.patch \
+           file://CVE-2026-9150.patch \
 "
=20
 SRCREV =3D "c8dbb3a77c86600ce09d4f80a504cf4e78a3c359"
--=20
2.34.1


