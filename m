Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5703BEB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 10:49:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7790.1687344575081733432
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 03:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=iCjYCVuN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5536330915=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35LAEYaA008458
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 10:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=LOpZbaJba4JnlgDyX8jdRPstaLabo+4D/RgXoyXpW3I=;
 b=iCjYCVuNnBmEJ9FvAMDbnVuw7TrhSc9hFG2V5DAChN/IY9lpcJZa4wtYJ6V7hshrdUPn
 WxHNP8lbnfQyq1wM+7Kqc+A3XnxHwEfyQKscMFugWYdf5lIgHNm1lIDNdnD91hrKjyhy
 f3O47AEy6by9Ko4w53iYSMVnhEjLlEibhj3+cJIYiW0j1BgjbqnevO3moxGwhNDZvshQ
 YbNQ6rC44m7oX6aXbo9AQkH0TiONvZ063lafQ9HJjoUV1GgQKxDupvVExmAvpT4rzk1Q
 piuZg5wr8MGHzEUNBJsXfewkk7pQqGJppCdyVCnAKIMEdBYjBAhpKMKLrpQyNrpC1Gvt Pg== 
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r9220kj5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 10:49:34 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 21 Jun 2023 03:49:31 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] go: fix CVE-2023-29405
Date: Wed, 21 Jun 2023 10:48:29 +0000
Message-ID: <20230621104829.1370292-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230621104829.1370292-1-archana.polampalli@windriver.com>
References: <20230621104829.1370292-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: vIycdUVq3EZLLS5h4V1mxVAq2g7rULfj
X-Proofpoint-ORIG-GUID: vIycdUVq3EZLLS5h4V1mxVAq2g7rULfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 10:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183180

The go command may execute arbitrary code at build time when using cgo.
This may occur when running "go get" on a malicious module, or when running
any other command which builds untrusted code. This is can by triggered by
linker flags, specified via a "#cgo LDFLAGS" directive. Flags containing
embedded spaces are mishandled, allowing disallowed flags to be smuggled
through the LDFLAGS sanitization by including them in the argument of
another flag. This only affects usage of the gccgo compiler.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-29405

Upstream patches:
https://github.com/golang/go/commit/6d8af00a630aa51134e54f0f321658621c6410f0

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.19/CVE-2023-29405.patch           | 109 ++++++++++++++++++
 2 files changed, 110 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 2c1febfe9c..9af9eb2752 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -33,6 +33,7 @@ SRC_URI += "\
     file://CVE-2023-24540.patch \
     file://CVE-2023-24539.patch \
     file://CVE-2023-29404.patch \
+    file://CVE-2023-29405.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch b/meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch
new file mode 100644
index 0000000000..d806e1e67d
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.19/CVE-2023-29405.patch
@@ -0,0 +1,109 @@
+From 6d8af00a630aa51134e54f0f321658621c6410f0 Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Thu, 4 May 2023 14:06:39 -0700
+Subject: [PATCH] cmd/go,cmd/cgo: in _cgo_flags use one line per flag
+
+The flags that we recorded in _cgo_flags did not use any quoting,
+so a flag containing embedded spaces was mishandled.
+Change the _cgo_flags format to put each flag on a separate line.
+That is a simple format that does not require any quoting.
+
+As far as I can tell only cmd/go uses _cgo_flags, and it is only
+used for gccgo. If this patch doesn't cause any trouble, then
+in the next release we can change to only using _cgo_flags for gccgo.
+
+Thanks to Juho Nurminen of Mattermost for reporting this issue.
+
+Fixes #60306
+Fixes CVE-2023-29405
+
+Change-Id: I81fb5337db8a22e1f4daca22ceff4b79b96d0b4f
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1875094
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/501224
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+Run-TryBot: David Chase <drchase@google.com>
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/6d8af00a630aa51134e54f0f321658621c6410f0]
+CVE: CVE-2023-29405
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/cmd/cgo/out.go                            |  4 +++-
+ src/cmd/go/internal/work/gccgo.go             | 14 ++++++-------
+ .../go/testdata/script/gccgo_link_ldflags.txt | 20 +++++++++++++++++++
+ 3 files changed, 29 insertions(+), 9 deletions(-)
+ create mode 100644 src/cmd/go/testdata/script/gccgo_link_ldflags.txt
+
+diff --git a/src/cmd/cgo/out.go b/src/cmd/cgo/out.go
+index 94152f4..62e6528 100644
+--- a/src/cmd/cgo/out.go
++++ b/src/cmd/cgo/out.go
+@@ -47,7 +47,9 @@ func (p *Package) writeDefs() {
+
+	fflg := creat(*objDir + "_cgo_flags")
+	for k, v := range p.CgoFlags {
+-		fmt.Fprintf(fflg, "_CGO_%s=%s\n", k, strings.Join(v, " "))
++		for _, arg := range v {
++			fmt.Fprintf(fflg, "_CGO_%s=%s\n", k, arg)
++		}
+		if k == "LDFLAGS" && !*gccgo {
+			for _, arg := range v {
+				fmt.Fprintf(fgo2, "//go:cgo_ldflag %q\n", arg)
+diff --git a/src/cmd/go/internal/work/gccgo.go b/src/cmd/go/internal/work/gccgo.go
+index 1499536..bb4be2f 100644
+--- a/src/cmd/go/internal/work/gccgo.go
++++ b/src/cmd/go/internal/work/gccgo.go
+@@ -283,14 +283,12 @@ func (tools gccgoToolchain) link(b *Builder, root *Action, out, importcfg string
+		const ldflagsPrefix = "_CGO_LDFLAGS="
+		for _, line := range strings.Split(string(flags), "\n") {
+			if strings.HasPrefix(line, ldflagsPrefix) {
+-				newFlags := strings.Fields(line[len(ldflagsPrefix):])
+-				for _, flag := range newFlags {
+-					// Every _cgo_flags file has -g and -O2 in _CGO_LDFLAGS
+-					// but they don't mean anything to the linker so filter
+-					// them out.
+-					if flag != "-g" && !strings.HasPrefix(flag, "-O") {
+-						cgoldflags = append(cgoldflags, flag)
+-					}
++				flag := line[len(ldflagsPrefix):]
++				// Every _cgo_flags file has -g and -O2 in _CGO_LDFLAGS
++				// but they don't mean anything to the linker so filter
++				// them out.
++				if flag != "-g" && !strings.HasPrefix(flag, "-O") {
++					cgoldflags = append(cgoldflags, flag)
+				}
+			}
+		}
+diff --git a/src/cmd/go/testdata/script/gccgo_link_ldflags.txt b/src/cmd/go/testdata/script/gccgo_link_ldflags.txt
+new file mode 100644
+index 0000000..4e91ae5
+--- /dev/null
++++ b/src/cmd/go/testdata/script/gccgo_link_ldflags.txt
+@@ -0,0 +1,20 @@
++# Test that #cgo LDFLAGS are properly quoted.
++# The #cgo LDFLAGS below should pass a string with spaces to -L,
++# as though searching a directory with a space in its name.
++# It should not pass --nosuchoption to the external linker.
++
++[!cgo] skip
++
++go build
++
++[!exec:gccgo] skip
++
++go build -compiler gccgo
++
++-- go.mod --
++module m
++-- cgo.go --
++package main
++// #cgo LDFLAGS: -L "./ -Wl,--nosuchoption"
++import "C"
++func main() {}
+--
+2.40.0
-- 
2.40.0


