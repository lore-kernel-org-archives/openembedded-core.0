Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59442EB64DC
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 10:49:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7788.1687344572547636611
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 03:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YspDVhew;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5536330915=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L5dwm3008343
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 03:49:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=dVkfFS0PuAehwL5/VxWE5jRkY5x+2z2m3i0qsObNXxQ=;
 b=YspDVhewBJortPdpZPaug/d78Kp2RI9P4Hb3MLqu2d3DwB2WK73My5LaPm6rjfayWaqa
 sMPDsvRkwLckw7WEzOAsJ7cwzc+mJ0D2IdjqlZlGgTy2oIyMcUefNuKGSL3oh1zV+YsZ
 OgsCTjOc00sgGRs1N7fPsS6c3ahToQIXEwsojV3/C2ZnIr/QvTuXfnbdUbJ6SL7Igz9p
 n2A/GFp9byxyHMrbd+1C8paK8wmkJcB18ogxzSAYyMLHSguZhG/vPTuHgfACiSA29JM5
 D8z8TUKeGxH2tGf2ZeSB4+79ThG334wDedqzt76a/zTJcIsvWoByc774BvT/aUfTnQxh gQ== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9cbhu7p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 03:49:31 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 03:49:29 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] go: fix CVE-2023-29404
Date: Wed, 21 Jun 2023 10:48:28 +0000
Message-ID: <20230621104829.1370292-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: A_eGvvA8USVQZlWhPa6LoP79qE9hsYb9
X-Proofpoint-GUID: A_eGvvA8USVQZlWhPa6LoP79qE9hsYb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183179

The go command may execute arbitrary code at build time when using cgo.
This may occur when running "go get" on a malicious module, or when running
any other command which builds untrusted code. This is can by triggered by
linker flags, specified via a "#cgo LDFLAGS" directive. The arguments for a
number of flags which are non-optional are incorrectly considered optional,
allowing disallowed flags to be smuggled through the LDFLAGS sanitization.
This affects usage of both the gc and gccgo compilers.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29404

Upstream patches:
https://github.com/golang/go/commit/bbeb55f5faf93659e1cfd6ab073ab3c9d126d195

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.19/CVE-2023-29404.patch           | 78 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index d430e0669d..2c1febfe9c 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -32,6 +32,7 @@ SRC_URI += "\
     file://CVE-2023-24538.patch \
     file://CVE-2023-24540.patch \
     file://CVE-2023-24539.patch \
+    file://CVE-2023-29404.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch
new file mode 100644
index 0000000000..c6beced884
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29404.patch
@@ -0,0 +1,78 @@
+From bbeb55f5faf93659e1cfd6ab073ab3c9d126d195 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Fri, 5 May 2023 13:10:34 -0700
+Subject: [PATCH] cmd/go: enforce flags with non-optional arguments
+
+Enforce that linker flags which expect arguments get them, otherwise it
+may be possible to smuggle unexpected flags through as the linker can
+consume what looks like a flag as an argument to a preceding flag (i.e.
+"-Wl,-O -Wl,-R,-bad-flag" is interpreted as "-O=-R -bad-flag"). Also be
+somewhat more restrictive in the general format of some flags.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes #60305
+Fixes CVE-2023-29404
+
+Change-Id: I913df78a692cee390deefc3cd7d8f5b031524fc9
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1876275
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501225
+Run-TryBot: David Chase <drchase@google.com>
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/bbeb55f5faf93659e1cfd6ab073ab3c9d126d195]
+CVE: CVE-2023-29404
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/cmd/go/internal/work/security.go      | 6 +++---
+ src/cmd/go/internal/work/security_test.go | 5 +++++
+ 2 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/go/internal/work/security.go b/src/cmd/go/internal/work/security.go
+index e9b9f6c..91e6e4c 100644
+--- a/src/cmd/go/internal/work/security.go
++++ b/src/cmd/go/internal/work/security.go
+@@ -179,10 +179,10 @@ var validLinkerFlags = []*lazyregexp.Regexp{
+	re(`-Wl,-berok`),
+	re(`-Wl,-Bstatic`),
+	re(`-Wl,-Bsymbolic-functions`),
+-	re(`-Wl,-O([^@,\-][^,]*)?`),
++	re(`-Wl,-O[0-9]+`),
+	re(`-Wl,-d[ny]`),
+	re(`-Wl,--disable-new-dtags`),
+-	re(`-Wl,-e[=,][a-zA-Z0-9]*`),
++	re(`-Wl,-e[=,][a-zA-Z0-9]+`),
+	re(`-Wl,--enable-new-dtags`),
+	re(`-Wl,--end-group`),
+	re(`-Wl,--(no-)?export-dynamic`),
+@@ -191,7 +191,7 @@ var validLinkerFlags = []*lazyregexp.Regexp{
+	re(`-Wl,--hash-style=(sysv|gnu|both)`),
+	re(`-Wl,-headerpad_max_install_names`),
+	re(`-Wl,--no-undefined`),
+-	re(`-Wl,-R([^@\-][^,@]*$)`),
++	re(`-Wl,-R,?([^@\-,][^,@]*$)`),
+	re(`-Wl,--just-symbols[=,]([^,@\-][^,@]+)`),
+	re(`-Wl,-rpath(-link)?[=,]([^,@\-][^,]+)`),
+	re(`-Wl,-s`),
+diff --git a/src/cmd/go/internal/work/security_test.go b/src/cmd/go/internal/work/security_test.go
+index 8d4be0a..3616548 100644
+--- a/src/cmd/go/internal/work/security_test.go
++++ b/src/cmd/go/internal/work/security_test.go
+@@ -227,6 +227,11 @@ var badLinkerFlags = [][]string{
+	{"-Wl,-R,@foo"},
+	{"-Wl,--just-symbols,@foo"},
+	{"../x.o"},
++	{"-Wl,-R,"},
++	{"-Wl,-O"},
++	{"-Wl,-e="},
++	{"-Wl,-e,"},
++	{"-Wl,-R,-flag"},
+ }
+
+ func TestCheckLinkerFlags(t *testing.T) {
+--
+2.40.0
-- 
2.40.0


