Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CEECD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 13:25:38 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53713.1780922832865838473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 05:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=X+n/JwiD;
 spf=pass (domain: est.tech, ip: 40.107.159.24, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=abzzsiFp1qw9ySl1QKQP8c7IRkqc1dGxgfMGc4nSOesthjwZ6q26OjJkIpsM3oj8y0qorTi3jSq1ki4H2EabaGDaJm4LtpkA38mpo2FeF41Vphji85pApacllUZnsjG0MEMrGLsglFq6LyesseHLAGWOX3RV2i/d325MS5QdAeFlDhCcSRlOvl2XRHvUdiMl02nA3XWBCR4IvFutnF+Llo1LfYgs5Ez4+P2pQSwXWZDdFRK8+Zcx8fQ51IKa9AKJwW3mgvNfxYE7FR9VS2WRL6uSmjp7rj5tx9NbcosbLQ/385/AmdebvNckjFzdpvEm4UorGR3U6pjfIUd7SciTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pf9Nd4u4OFp9DNRuV3ChKZSHtegoNSMIkJD0gz9Q2d0=;
 b=e22ypwCE45DL6aKQ/UYcbgSb27h8Bca4E9gQ77zo04Pk82G8jhbm0ArbSIqXLOcaVQ4d3X2gPFVUez9QaM6Ekvi/KnIE/wWMblDJyn8RdUu1eXJFBglpUL1cKPPzP263jiYSwBgfOmKfNaBHwkufA1/Ig/1aSIy418MMQRcmdeDZL0yoZxgKiDRhJWJXxsvXPiapVQTINk4CXvPJdkNIb8BC0pictKOQREY9UnjyVp0q0AAOrlEdybSw8wBZ1ZI1N6tW/gsIOG4nJ78gN+tez8ZkJbxFHxO7r7lCVr7QJ5JAnrp0xJ7rX1HkPTdjnsOv/UjCJjrCc4K/6P68NEkObw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pf9Nd4u4OFp9DNRuV3ChKZSHtegoNSMIkJD0gz9Q2d0=;
 b=X+n/JwiDutq/8ssZ8a2pMy/dtQsF8XZ3tqxol/hy8Xk79JxF4UKo0mROXCNrY5JMkxue17tOgY8ctuh9LhibWN5iHmK68zFDi/WfZiZT8ybH+uPwJYTCl3jUQyRYgt98ZY2e/2N66weYuq5MA7iEBu0FAxEoCHvlHBB0YFKPMNhAaLMOmG1YOHHgNLj130Gn9EMbJY8fj5acVtYkc7+jumfwK4O+9svvTZbsY6sJpD5TKnqKPMMsF/b7Vtmh7QLuG+U0XyAcF53nPl3/+HwaDIm7R1ss46/Si+HzR18oDP8X4n4gFFkgw+i15JFVkAmJ1KT/yaOukREnCY9ZW1Sxow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by AM7P189MB1041.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:14f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 12:47:08 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 12:47:08 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
Subject: [OE-core][wrynose][PATCH] libsolv: fix CVE-2026-9150
Date: Mon,  8 Jun 2026 14:47:00 +0200
Message-ID: <20260608124704.1216849-1-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DU2PR04CA0077.eurprd04.prod.outlook.com
 (2603:10a6:10:232::22) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|AM7P189MB1041:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb90b83-6f2b-48f4-8e48-08dec55c0d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|11063799006|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	lQHd/ICuVzrhfH+6dauGlA/zNEq5JOCkUTwvx6W3tBBRd0iPZb47m5W5zzdevio64Co2FSTCY7h2r8u3a9x1xf15A+/bzZGmNjbwrSK/RHR715hMFyh2ghguj+6/P1w8XCGUHv5xFEMmPbturA5KVvfPvJ8gJCd5KPTsetjdSeH7Z+kf5137Wpz50UtLJTtB2vdSx/J3H4QTVBlFbP+HeqxfJ4PFSV0HFa12jeMSeQlXdP8coFJFtVpJ2wkBp47Zx3E8w6hGgTAUx2rvf5VLrKeW8j8vKci+vE/Tbxxhwtf7gHZVRYv5yibfS9Rm2ovXwJsIFn11jGhjMw8JT3C1AakPix+IfIpuNDLvZzuAMca7w1jGTCwZG8/pIY7uRNQx1xdNfPBD7yQ7bgzFCASPhdArXi75ZtcfZ5/yrCYEKabYANbZYYlKMckq4if5x2hZUZlBC6hjVsehoHHcxGDFQ5hWQxJb00QthPa3ArXOxcYFdkX4Vd6+KuDVEoX+FpUKlhhteeMr8tW0SFUcpdBpWlL/FbaxcX6GH3TrtzaNx28pSeQIsMtJrDaf8af5s7gp1Lhsfsem9L9Ie2vxbuiF4K9Wj0qgDq8uxXERtMn5YZMzNbkBu3Qz3FyKOtRX8vpKH7dYAoMEmwEMVPn/I77G75blatkELpnyzxL9SqlEHVMgmlE4V4NkNM4EA3ZvRgBs+vsuDu7XtrdQ1bC1V/lY3g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?El2gzOwRbqj59HP++HIx3Gzm2VGhfPUcKoTUAbf5qM+++qZNoGrHW9kDXoLP?=
 =?us-ascii?Q?vXlzZPX7CrjBdBe56O/PnudyZ80Jc+5qu6zn73FlC1XXXVFiHer7v6CG95c4?=
 =?us-ascii?Q?e3pS4BsxG3Zs7+GvZvVkewUGhNLHbeKKfXq4m6ZlGz6O40bx9VXzHcWLZQ7p?=
 =?us-ascii?Q?8yGh2vbmAsfBbqQILychfW2lNL64KCHctcR5OvmBp0739I/t3cGr/BI7Pmi2?=
 =?us-ascii?Q?0MoauJh1C3BbP62+1tRL8eEdAnOo0bpIrwKgm6OBEQZLLimK4JtVQrqBY2CU?=
 =?us-ascii?Q?Q87sNs/P4x88ACBPhYROltgGbII5oo4Q1xsGs9WW7R/VvYLmvMIyseY3cqAn?=
 =?us-ascii?Q?VB5taQBoX6L/+Gbo0k1N9+c13HBa2QHg7P91LPdo63ZBfIjZzyki85B/5vcA?=
 =?us-ascii?Q?xDchdWj/a40gSPWCBvglA3BI+d2BD2kxlknHqdL4jBtQZO+jnalKMchqpzfs?=
 =?us-ascii?Q?JvJrvqPLauNmhm5N1+JU3zOGdTKt+jpnBlobGrC/A27qgUOeC6wLxiuxBZod?=
 =?us-ascii?Q?GFWMXefMZu07diFEZj7d38JLqskodj7BdsygwKmD3ajST4o0F00iwA+27/R2?=
 =?us-ascii?Q?0ATv0QFKuhzaQ2DHicAZIA5b+3PRQ2LQVg5VQSnsY/yAcKV/SpvGkIdQAoES?=
 =?us-ascii?Q?P9MNAzCkRJ0hc/XHDmriA8ygGjmNza5svA00WcTQnlnkfr3srDxVvJQux87L?=
 =?us-ascii?Q?MT1Gj4RZac5iVQx6J4agSCnhf9xH3JBynIcGDyv4hSgbQ4N2ZbvVM9XqdKqa?=
 =?us-ascii?Q?khphuYSG52s1NS31jzhoSPCKoxWdFsgmLK9SIqNVdYdoN7A43lFomTC25YRF?=
 =?us-ascii?Q?sOuHMUh61+89fsNQ7rbgXonusehvk4X++bL4Ka1DVZhyn3hN1T3PDAKxDvDv?=
 =?us-ascii?Q?TRla/mKIZ0qyFHpGiO0cQSlO/2vykEgDXrQvlnIW8vZITJ0SVFTi4q2ABDIx?=
 =?us-ascii?Q?FbcfyhhBXVc96FA9FAcaG+rJd3wWse6OvbNd4DJdzuWdEwHheTDDxN6Y0LR0?=
 =?us-ascii?Q?zpHqLcWnUmYY//RuGPP+Vun52dvpUfGB7KwOjeIDcEyPa6N5qUje1qWjD5kz?=
 =?us-ascii?Q?65H3zp3SJeGEvE96Yb4+S0PJ9rBMambRmSWN90DzcDw0aCiW+yajF9B+/6M4?=
 =?us-ascii?Q?30dAMN+Rfh6UjFvFNHdOZKyx9JX7NBcM72dj256LGsSAf1FnvqhBEHFake6A?=
 =?us-ascii?Q?oT0Far8uevNG1VTTZdjIs3zHF+u/1aPpeWwhARUBAr4JB6pTaDL70zv8eMVY?=
 =?us-ascii?Q?KHWrq9Nm4DI5sy/zqxmS0CokbgA35JfgoCFwjGu37BRMsviCw3jRYcbsNuO+?=
 =?us-ascii?Q?AnLji0E81q+r/JFanbDUpO/c02EjtJ+kHQzpmFy7DerZQW48gJSpXARxdj0M?=
 =?us-ascii?Q?ot0nz16ebyaxXWuYqdY/XQrCbrJmjsVYrs5UT+PLtzmLLMyKVxQedoTyy/IB?=
 =?us-ascii?Q?TlwLLkNlFks/YWyrJw1VdgG+Vp9RZC2a7x9iHhMTBj3IYzrjj+RhNnadXNJR?=
 =?us-ascii?Q?qm8VblScbEw8e9v6ZeE8QyRk2kocy248VaGD24DhhwlT9dQcptowFTVvicyR?=
 =?us-ascii?Q?gpRX7m72jF3E8CWTIzLYmcOCBZukzvuRKAUZCu7laeuCn2KHpyJQqA7WqZl3?=
 =?us-ascii?Q?7UrzFvsT8rip406VcPW0mRaMssLWP7RxdouAJ/HK5nNxjieevrpHfVZ6Etyz?=
 =?us-ascii?Q?0yxGgUkhCF1yMGo2U0sT9YiTtZoaEVtu/wQZBAOCNicbDwkqL9EIxn7mRn3H?=
 =?us-ascii?Q?QZCyw/NUCM8hA29F3sFplgSYfAmGltE=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb90b83-6f2b-48f4-8e48-08dec55c0d3e
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 12:47:08.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0zvweftx0ZsSJLCBjiHzaBe8F3YwgkdBgal4FajForM+KDnJ7Y0nWjzBACEM3MkKDc5mHS4CUs8JOBKVnRiPSyiOmTDhtac01JXitgm34U4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB1041
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 13:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238236

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-9150.
https://nvd.nist.gov/vuln/detail/CVE-2026-9150

Upstream fix:
  https://github.com/openSUSE/libsolv/pull/616

Tested with ptest:
Before: PASSED: 29, FAILED: 0, SKIPPED: 0
After: PASSED: 29, FAILED: 0, SKIPPED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../libsolv/libsolv/CVE-2026-9150.patch       | 68 +++++++++++++++++++
 .../libsolv/libsolv_0.7.36.bb                 |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.pat=
ch

diff --git a/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch b/me=
ta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
new file mode 100644
index 0000000000..76c0c8e258
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/CVE-2026-9150.patch
@@ -0,0 +1,68 @@
+From 360fc223b57d5aa32bf700a94e75a5f49c30437f Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb b/meta/recipes=
-extended/libsolv/libsolv_0.7.36.bb
index 852e79c45e..f3c3738d7c 100644
--- a/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
+++ b/meta/recipes-extended/libsolv/libsolv_0.7.36.bb
@@ -11,6 +11,7 @@ DEPENDS =3D "expat zlib zstd"
 SRC_URI =3D "git://github.com/openSUSE/libsolv.git;branch=3Dmaster;protoco=
l=3Dhttps;tag=3D${PV} \
            file://0001-compress_buf-fix-musl-segfaults.patch \
            file://run-ptest \
+           file://CVE-2026-9150.patch \
 "
=20
 SRCREV =3D "1e377699be108ec82bb798ec9c223d45d84a733c"
--=20
2.34.1


