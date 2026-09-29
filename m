Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3738CA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 09:35:14 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3918.1790674512527998782
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 02:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=NOFqiUc1;
 spf=pass (domain: est.tech, ip: 52.101.84.58, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHtUxK1MTc/pwEQNsFctLPgvcNjkByOk9Lc5cCHkXdMXZvsL04XJL4DDs4Oqh2cjTjU21U5RceaGBoze3+wT61irnBoi/sKzWcQYcdBjK/PZwOPgOXPI1R4jEphMCDD2LIs2ctcRNaAhq4iDgK6gUvXOlshcv6c1lURQpIobV/wk+kL/yb1+H92JOto7abkbeZM9DMkWUEBqebT2y6boBZUamTx7jHZ+GhqDlwT9JnDQxP2ujmu5E/tsDkvMI4RSAHZAwbC6FLYQeHyE/EP0Tfs/WmLFt0Tapl7pegrAESVb1F3GrHGOdxodLqErXMHiQMncNk7L3Cwn++bNHzsLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NprQ8HskERyQaBRJ4WOb7OnjQ80eSGQjCF4nLH+Y9o=;
 b=g/xwCZhSZ/GbpfWU0+bKrcOxTsuGcD4EGqz/jjTiAJMcgj+Ij750r4vjNlOYc/igeBd8kfKY2W+J4UVFNZIisxkQhOzRgHYdNSvB6kQ4om7LAry5Y5vF5VtjeL1qHBRxG2m3cBIzmsoV+JeL8VTkWRS8yqyJEfUhFYe0cC/eRb19ZxFvfqOVYdYKz7C4oIFc16GugTvXqwFQcSu5mn6fjLMu1JkOXsrx5PGvkExWP53AiM6M9StZX8ZyukADuvGH+ClPOaFd4obFIKoUCQ7Nkumdx8+Qf9zi2g3+k7DJ5Clz9S0UG/VXLs4+pnhySZobFqV/fQe5rz9zJeR2cuFoSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NprQ8HskERyQaBRJ4WOb7OnjQ80eSGQjCF4nLH+Y9o=;
 b=NOFqiUc1+HuBce+c4Oqypfm4e1VMRYTmgq4/s/lVrl2oiKNbFbPGqtlwxkc+VAiAH0UaHwBCEJ9som8B1eZ+9smiSG0Jwg/x55iNZCqdP8a0QaIJrNnLoiY7z+HyOLAIqajfrdsjM+FwbQ5EILM6xPGTL9Ax1gzUNG8s0JaZtYQMCsjY9hBDxbJhDLatqoSgbPNU3L+BEzDx/lX1orLQqKbDiXLs1PnXKTgSneG8AJ9jmiV9qdy5tPtHNUTNRBg8exVv32T5zJADQ1ioffN2yKRmrJj+jHvipJNrkv8JVHGlXys7z/W30lrPwxkEV08kIFSjrSGpB+qVyoyv8EA3ug==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM7P189MB0824.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 09:35:08 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:35:08 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdb: Upgrade 17.2 -> 18.1
Date: Tue, 29 Sep 2026 11:35:06 +0200
Message-ID: <20260929093506.88396-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0342.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::20) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM7P189MB0824:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a2b1035-bd74-41d1-3c7b-08df1e0cf331
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	mt+sbr2blURTNlehwpNsO4d3g6UwUR6Sbic/8Hjdkc2Z0B1S+YJ7pSpUrDO1wcS50hVUrgsrxWzTN1LDUxtjE6MtvIn6umC61MypVEdXvTzWyVBJ4OaXaX7Rf7F5+GZqORY15IzvJclQhvKAJNjyJ7wl6krGjhX58bx9J71nY525ALBPO8tVjN+3CRTyY+srqX4GlPdrdrMrrulOmRnOkneUYuzbFCFN7uc5WXHorFzIBiBykv74pfjYmwSaVKtHVh0Vzwuo0AtpzfHgiXEb8Fn+UDnyVGeReDeiEq2R/T80XJLL9SthhdEuzYq6gUwifHVV7zctkWMwM04ePLwX+zr4PxKP+d2LuyQ9lXGYEwDe8yI9ZoQqV4Km0weFfQfk/wwpX/LCQKjh5CayosUtg9ySA1GIcsF3PVh7iuozVrfq8n0NzzIciEAxWnMWWTxA6PotcWg7CH0N1XKtOArKycilqURBRJqo4ZiIy2uSuHp/UaF6UIzhnIJyVIGR3cRekN69SQLV2NwcBMta9aSlAFAP3xnSybJyIpJZwtgFZZuyp4jh1D7CuAMCt9DJ8Gfo9YNo8PdVmg5qqf/fPBvhqBJYd8vDGlDsF5KjJXgThRQKfpRAGAfaVMoLoZxok9vM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fWSyjp1GpPFCaCNUAZQPx0MX4B8rtnk2p0lRhALFbNnVSX70u6Y8IWD+zWp/?=
 =?us-ascii?Q?Q5Uo21zUvqBE1VLmXO7Di7/mAR7cPidiLyv/5SQoqQaMQ8y73/gmOhItMCks?=
 =?us-ascii?Q?cNloN3X4eQ2o6y2NqbQOJoc0aeEdYXG/aJz74Or23AbYXJFY49yuy/Tw+Ld+?=
 =?us-ascii?Q?UfHlTLb529fYKhr30jKMeiuYnuXLEnTgyEWZg/NEw06Fg8VHNJMCbldjVR+O?=
 =?us-ascii?Q?WHafV7lUuZ/AEEd428tOzA4UsN0gGRQ3xPNAuReeU+T3ixJHYvY/n9QWOQTh?=
 =?us-ascii?Q?hV5WkE2SoHuW/WfEjWCyJ9BAymnc02Av1MUs9krHhbyysn2QHLt+MQnlvoy2?=
 =?us-ascii?Q?Nn0mDmpfnggtCj8z3wO2jdmwDmD69Zr3xzp1L52lQ8ypYn90noIJBRjHGkN2?=
 =?us-ascii?Q?ed7Qj8puNRMuBprx9VuVsswXi4CYok11OBCd4FHHMI+/rB/Yn81TLtOXir+E?=
 =?us-ascii?Q?a6c4chO9tTaYK1yidzJXrb/HZLQ/YLtj6c+jV8N/xUjWxPtQLRMv3rrumTlw?=
 =?us-ascii?Q?3/147ucSxJnt1N4RbOgynf60Mum8RUDd0IZs0UmbJWM/xc6oxvQGBMnNb0UE?=
 =?us-ascii?Q?6PEJdP6Q1dW6N+OXkM1ORsVihtOndy9wX3NhImY79IqYYeTLu+B6Aag9Kgka?=
 =?us-ascii?Q?6BjJRtl+broO1j6gBn5lGgzoa8F1EFsvbcli/55RRVCfXLe+AZtQ0HRGtw1g?=
 =?us-ascii?Q?C+3joCClNJKe1CThDd+FtPGqe0WmkTSU/N+BjUQCelZTgYPL/ZC4NSjC8HhO?=
 =?us-ascii?Q?B3pqpHcYcGG7QOQIv8fDpVpFRChZ4AeGUWb3YpiaMb6IU7m0xaQkPJQUhCAL?=
 =?us-ascii?Q?23kqjWD5Hdmfqy1ueUh0TC2Fc6pNH9/JEGEjGk+kxrweyPsJ2+numBZNjVJK?=
 =?us-ascii?Q?E2kTHP45Jp3itqfogl/RvddzvinCr5AbXkDbK71G8XDIs/xz6fCTwfn8+1K5?=
 =?us-ascii?Q?DyoJFffldQm0Ys8oHe46lW6Tw0aw7nPvUM70AF2IIHivsrN3SkgTSzKXY6wW?=
 =?us-ascii?Q?4AVwhEYR3MdA+fCAQSA3oc3OL9uGk47qqt0z02kCxcPwu1x9uWVLFRzv1T5u?=
 =?us-ascii?Q?OUxRh/6G9WTvsVFaCB58YNtRY/xSRagU21yMsBFq124FdhCiK2/c7ct13jTT?=
 =?us-ascii?Q?2DKJetoy99UBSkSpWS/pUJJRlJhTRCFpbgSUUTorIoRzWASvGzPxIOTZ2I8T?=
 =?us-ascii?Q?dan436hff8v6yFGkwlpOB6AG9eKW06yQOxkYscc3V/DgJ9/O74+Lezt7WsES?=
 =?us-ascii?Q?Ep6T2t+ks1XyaYtO1IM8os+6Tcvwp5kzgpraOtXqlOfI+jUETNRRsrb4lPUw?=
 =?us-ascii?Q?R0dasTtI1k36aAt6t1lgEzdNfByQ85Eb8E/O1cf4YLmzHzqgN+KbM5XlQero?=
 =?us-ascii?Q?DcE9pCEhOx+e2sgKc9wkz5bMlQeEhMGJJWVxmm/pCvyQP2F6b0sBgv7uzyHK?=
 =?us-ascii?Q?qS9t3ysKIrEXusIZXq2ZjsUbA1DahcKfF8kebXWxAxW2filhqxlftKj9H6vo?=
 =?us-ascii?Q?RcGhu0d6gez2Cf2QSWyPQcdIHugdPWJus7ld2cAlYU07hrVKAaZjFNvRZOf1?=
 =?us-ascii?Q?GP4EwllfzRpTXVey3vEiO0pFAjrrsxoezhoWz6SvDdmeQ/sWOvw8l5oU+mGa?=
 =?us-ascii?Q?G/FmxnqcAmr3HyN9nzsvF2uIKjC203gyAuuCL14ZnO1xJjVsuEQoo//A0SGm?=
 =?us-ascii?Q?5KBibX7AuuXpJ4amY4lGf9zGHFF4D4SmKNpptIKOEe/nj6DoPFU1kjENaK4I?=
 =?us-ascii?Q?uPIPvo01yw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2b1035-bd74-41d1-3c7b-08df1e0cf331
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:35:07.9759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21k1JbewJ+5jWWLtqhICU58JvIOBO8FgwEUIbaPVUvNjfwbCoxFK4ypsTPZTiWKFbJSWmZWttXpoQOdFWEtyvQZVBCXfQYPtOCVQSm9TlWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0824
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 09:35:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246850

NEWS: https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dblob_p=
lain;f=3Dgdb/NEWS;hb=3Dgdb-18.1-release

- Refresh existing patches

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...-cross-canadian_17.2.bb =3D> gdb-cross-canadian_18.1.bb} | 0
 .../gdb/{gdb-cross_17.2.bb =3D> gdb-cross_18.1.bb}          | 0
 meta/recipes-devtools/gdb/gdb.inc                         | 2 +-
 ...001-mips-linux-nat-Define-_ABIO32-if-not-defined.patch | 4 ++--
 ...ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch | 6 +++---
 ...-disable-libreadline.a-when-using-disable-static.patch | 8 ++++----
 .../recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch | 4 ++--
 .../gdb/gdb/0005-Change-order-of-CFLAGS.patch             | 6 +++---
 .../gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch       | 4 ++--
 ...ne-alignof-using-_Alignof-when-using-C11-or-newe.patch | 4 ++--
 ...fix-for-packages-that-are-not-compatible-with-C2.patch | 4 ++--
 meta/recipes-devtools/gdb/{gdb_17.2.bb =3D> gdb_18.1.bb}    | 0
 12 files changed, 21 insertions(+), 21 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_17.2.bb =3D> gdb-cros=
s-canadian_18.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_17.2.bb =3D> gdb-cross_18.1.bb=
} (100%)
 rename meta/recipes-devtools/gdb/{gdb_17.2.bb =3D> gdb_18.1.bb} (100%)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb b/meta/re=
cipes-devtools/gdb/gdb-cross-canadian_18.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross-canadian_17.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross-canadian_18.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb-cross_17.2.bb b/meta/recipes-dev=
tools/gdb/gdb-cross_18.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb-cross_17.2.bb
rename to meta/recipes-devtools/gdb/gdb-cross_18.1.bb
diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/=
gdb.inc
index 52c6fc531e5..194ee16197a 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -14,4 +14,4 @@ SRC_URI =3D "${GNU_MIRROR}/gdb/gdb-${PV}.tar.xz \
            file://0007-Define-alignof-using-_Alignof-when-using-C11-or-new=
e.patch \
            file://0008-Add-fix-for-packages-that-are-not-compatible-with-C=
2.patch \
            "
-SRC_URI[sha256sum] =3D "1c036c0d72e4b3d1fb5c94c88632add6f9d76f4d7c4d2ea793=
c12a9f19a3228c"
+SRC_URI[sha256sum] =3D "cd9fc3fe2b47743840e42c1592d3d87f8302eb18639c0b8b4b=
a0898002e2348f"
diff --git a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO=
32-if-not-defined.patch b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat=
-Define-_ABIO32-if-not-defined.patch
index 7a3064a14bb..fc1c5b0cc07 100644
--- a/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-n=
ot-defined.patch
+++ b/meta/recipes-devtools/gdb/gdb/0001-mips-linux-nat-Define-_ABIO32-if-n=
ot-defined.patch
@@ -1,4 +1,4 @@
-From 8448967d9cfb09eb11fd3573a72a35ae94a89ba1 Mon Sep 17 00:00:00 2001
+From bb8d6121f63d29184816d8e685c1a7f683a26eda Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 23 Mar 2016 06:30:09 +0000
 Subject: [PATCH] mips-linux-nat: Define _ABIO32 if not defined
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+)
=20
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index 3d072ea935c..ca38caeacc2 100644
+index 9356431c..209c4d2b 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -40,6 +40,10 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-u=
api_pt_regs-on-GLIBC-syst.patch b/meta/recipes-devtools/gdb/gdb/0002-ppc-pt=
race-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
index 56cbacf3848..0c2692f66ee 100644
--- a/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_=
regs-on-GLIBC-syst.patch
+++ b/meta/recipes-devtools/gdb/gdb/0002-ppc-ptrace-Define-pt_regs-uapi_pt_=
regs-on-GLIBC-syst.patch
@@ -1,4 +1,4 @@
-From ec49e6283bc6a4a99596410db9509bee6cd941ce Mon Sep 17 00:00:00 2001
+From a552e69a180bc3d821f469280e03deda0dc8861b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 18:32:14 -0700
 Subject: [PATCH] ppc/ptrace: Define pt_regs uapi_pt_regs on !GLIBC systems
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 12 insertions(+)
=20
 diff --git a/gdb/nat/ppc-linux.h b/gdb/nat/ppc-linux.h
-index 3efc1b9a9bf..635d07486de 100644
+index 26b9af4e..6db93904 100644
 --- a/gdb/nat/ppc-linux.h
 +++ b/gdb/nat/ppc-linux.h
 @@ -18,7 +18,13 @@
@@ -30,7 +30,7 @@ index 3efc1b9a9bf..635d07486de 100644
 =20
  /* This sometimes isn't defined.  */
 diff --git a/gdbserver/linux-ppc-low.cc b/gdbserver/linux-ppc-low.cc
-index 3ce978f4c7c..38534297cdf 100644
+index 6a2c4136..23cb1831 100644
 --- a/gdbserver/linux-ppc-low.cc
 +++ b/gdbserver/linux-ppc-low.cc
 @@ -22,7 +22,13 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-=
when-using-disable-static.patch b/meta/recipes-devtools/gdb/gdb/0003-Dont-d=
isable-libreadline.a-when-using-disable-static.patch
index 024cf34427c..3ebf5d34bce 100644
--- a/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-us=
ing-disable-static.patch
+++ b/meta/recipes-devtools/gdb/gdb/0003-Dont-disable-libreadline.a-when-us=
ing-disable-static.patch
@@ -1,4 +1,4 @@
-From 2fa91dec5f0ec5663861ca53bde8951e48557bb3 Mon Sep 17 00:00:00 2001
+From 16653ccd5f43b12ed29d573ba7e659021958ed82 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:25:03 -0700
 Subject: [PATCH] Dont disable libreadline.a when using --disable-static
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  2 files changed, 3 insertions(+), 2 deletions(-)
=20
 diff --git a/Makefile.def b/Makefile.def
-index 4896c5c692c..17e3256be7d 100644
+index e7f33345..fb182ef3 100644
 --- a/Makefile.def
 +++ b/Makefile.def
 @@ -134,7 +134,8 @@ host_modules=3D { module=3D libiconv;
@@ -33,10 +33,10 @@ index 4896c5c692c..17e3256be7d 100644
  host_modules=3D { module=3D sim; };
  host_modules=3D { module=3D texinfo; no_install=3D true; };
 diff --git a/Makefile.in b/Makefile.in
-index f12c251f9c8..17ea24e8012 100644
+index 0b04b71d..08c829a2 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -31593,7 +31593,7 @@ configure-readline:
+@@ -31618,7 +31618,7 @@ configure-readline:
  	  $$s/$$module_srcdir/configure \
  	  --srcdir=3D$${topdir}/$$module_srcdir \
  	  $(HOST_CONFIGARGS) --build=3D${build_alias} --host=3D${host_alias} \
diff --git a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch b/m=
eta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
index 556f371fee0..ffd19d12c43 100644
--- a/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
+++ b/meta/recipes-devtools/gdb/gdb/0004-use-asm-sgidefs.h.patch
@@ -1,4 +1,4 @@
-From 6d37100388d45185a6e88ea7099a698c2c76b084 Mon Sep 17 00:00:00 2001
+From ed199bfc463ef489eba85c577710a6083abeea0b Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <amccurdy@gmail.com>
 Date: Sat, 30 Apr 2016 15:29:06 -0700
 Subject: [PATCH] use <asm/sgidefs.h>
@@ -19,7 +19,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gdb/mips-linux-nat.c b/gdb/mips-linux-nat.c
-index ca38caeacc2..2f044ca508a 100644
+index 209c4d2b..7849b6fd 100644
 --- a/gdb/mips-linux-nat.c
 +++ b/gdb/mips-linux-nat.c
 @@ -30,7 +30,7 @@
diff --git a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patc=
h b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
index 809cd232aaa..9620291bf3c 100644
--- a/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
+++ b/meta/recipes-devtools/gdb/gdb/0005-Change-order-of-CFLAGS.patch
@@ -1,4 +1,4 @@
-From e7cab417080f3454ea984e19384d9f1bf9e48fba Mon Sep 17 00:00:00 2001
+From 31b6a49ee3b6dc394899224b960be84bb9f18064 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 30 Apr 2016 15:35:39 -0700
 Subject: [PATCH] Change order of CFLAGS
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/gdbserver/Makefile.in b/gdbserver/Makefile.in
-index 365dcf23650..fc16218334f 100644
+index e45c89dc..0fb61097 100644
 --- a/gdbserver/Makefile.in
 +++ b/gdbserver/Makefile.in
-@@ -174,6 +174,7 @@ INTERNAL_CFLAGS =3D \
+@@ -170,6 +170,7 @@ INTERNAL_CFLAGS =3D \
  	$(PTHREAD_CFLAGS) \
  	$(WARN_CFLAGS) \
  	$(WERROR_CFLAGS) \
diff --git a/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-cal=
l.patch b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.p=
atch
index 7c9129b9f57..72f82f5174f 100644
--- a/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
+++ b/meta/recipes-devtools/gdb/gdb/0006-Fix-invalid-sigprocmask-call.patch
@@ -1,4 +1,4 @@
-From 13e61d515b74389e61fa52ca43656f9d1c294683 Mon Sep 17 00:00:00 2001
+From 7a405e07c213b25800eb79fa401c5bb9eccb91be Mon Sep 17 00:00:00 2001
 From: Yousong Zhou <yszhou4tech@gmail.com>
 Date: Fri, 24 Mar 2017 10:36:03 +0800
 Subject: [PATCH] Fix invalid sigprocmask call
@@ -32,7 +32,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/gdbsupport/signals-state-save-restore.cc b/gdbsupport/signals=
-state-save-restore.cc
-index 60724f95c87..8b493271aa6 100644
+index f3b7541a..c1534254 100644
 --- a/gdbsupport/signals-state-save-restore.cc
 +++ b/gdbsupport/signals-state-save-restore.cc
 @@ -37,7 +37,7 @@ save_original_signals_state (bool quiet)
diff --git a/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Align=
of-when-using-C11-or-newe.patch b/meta/recipes-devtools/gdb/gdb/0007-Define=
-alignof-using-_Alignof-when-using-C11-or-newe.patch
index d8816e3bef2..c0f710f7270 100644
--- a/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when=
-using-C11-or-newe.patch
+++ b/meta/recipes-devtools/gdb/gdb/0007-Define-alignof-using-_Alignof-when=
-using-C11-or-newe.patch
@@ -1,4 +1,4 @@
-From 3d3d91ac1db8ee7f624d225734cb5b57b752e00b Mon Sep 17 00:00:00 2001
+From 4076be9abb5f500471f86ecff6f69a5dc888977b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Jan 2023 00:16:25 -0800
 Subject: [PATCH] Define alignof using _Alignof when using C11 or newer
@@ -25,7 +25,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+)
=20
 diff --git a/libiberty/sha1.c b/libiberty/sha1.c
-index 49e8e0b6c2b..72de5cc8ad6 100644
+index 464919d2..90557b90 100644
 --- a/libiberty/sha1.c
 +++ b/libiberty/sha1.c
 @@ -234,7 +234,17 @@ sha1_process_bytes (const void *buffer, size_t len, s=
truct sha1_ctx *ctx)
diff --git a/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-a=
re-not-compatible-with-C2.patch b/meta/recipes-devtools/gdb/gdb/0008-Add-fi=
x-for-packages-that-are-not-compatible-with-C2.patch
index 661eb261c2e..567b7732563 100644
--- a/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-are-not-=
compatible-with-C2.patch
+++ b/meta/recipes-devtools/gdb/gdb/0008-Add-fix-for-packages-that-are-not-=
compatible-with-C2.patch
@@ -1,4 +1,4 @@
-From f71cfa9db1a196f0fadb2090ac04ce3164e171d3 Mon Sep 17 00:00:00 2001
+From 3782818f994e6fdb99b4a5083e178a47d6629fb0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Mar 2025 12:48:46 -0700
 Subject: [PATCH] Add fix for packages that are not compatible with C23
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/readline/readline/rlstdc.h b/readline/readline/rlstdc.h
-index 2aaa30babfb..a7a0ef30428 100644
+index 2aaa30ba..a7a0ef30 100644
 --- a/readline/readline/rlstdc.h
 +++ b/readline/readline/rlstdc.h
 @@ -44,7 +44,7 @@
diff --git a/meta/recipes-devtools/gdb/gdb_17.2.bb b/meta/recipes-devtools/=
gdb/gdb_18.1.bb
similarity index 100%
rename from meta/recipes-devtools/gdb/gdb_17.2.bb
rename to meta/recipes-devtools/gdb/gdb_18.1.bb

