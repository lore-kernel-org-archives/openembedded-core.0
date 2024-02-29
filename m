Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D634C5475B
	for <webhook@archiver.kernel.org>; Thu, 29 Feb 2024 01:21:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14238.1709169704689105334
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 17:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bcYnneR3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=37893041e6=changqing.li@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41T0tJiT028295
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 01:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=alZv8
	g9/ASJbPFoSIZ9EV+78oTq8icbcRf8uHSMmuKc=; b=bcYnneR3cTJSiaVXrFMYr
	23NGifZFuNPalN8Z+kCZiv99aKw+rxcr2qzinWDH3+2cvu+j6rjfJySXvj7jxoR2
	X1UsEFOy2x1lJgtQUKxwWY7MZ8dNIEaV88+dqzaiVHe+9QroNxyf3plS0oTsNzRJ
	qou+pALZgCiECRoJeSRNIeRFjgMT4hG9h3ORGC7PutOPMx0h7lugACJnQ2GGrX7J
	IZ2UR4f6ppDfoHweDo6o5tdxNqVe+VlYK9K1INx3xMFhmPRMrmAdX8vcOQYoPqOb
	7dUuOB2xoeQZMExxES+whrm7bhg83ZWBGiLoZZUEtzJffENnbIzf81fbESydhUHC
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wf7e6cx2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 01:21:43 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 17:21:42 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 17:21:41 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go: filter out build specific path from the linker flags
Date: Thu, 29 Feb 2024 09:21:40 +0800
Message-ID: <20240229012140.1355863-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: JZJqTYnvkD7YxXRgksC8XviUbn1auIEE
X-Proofpoint-ORIG-GUID: JZJqTYnvkD7YxXRgksC8XviUbn1auIEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-28_08,2024-02-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402290009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Feb 2024 01:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196411

From: Changqing Li <changqing.li@windriver.com>

patch 0007-exec.go-do-not-write-linker-flags-into-buildids.patch
removes linker flags from buildids for not breaking reproducibility,
but it seems that this will make go not rebuild when linker flag
changes, Refer [1]. So remove this oe-specific patch, and change to
filter out build specific path from the linker flags

[1] https://github.com/golang/go/issues/63760

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/go/go-1.20.14.inc       |  2 +-
 ...ut-build-specific-paths-from-linker-.patch | 61 +++++++++++++++++++
 ...not-write-linker-flags-into-buildids.patch | 41 -------------
 3 files changed, 62 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
 delete mode 100644 meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch

diff --git a/meta/recipes-devtools/go/go-1.20.14.inc b/meta/recipes-devtools/go/go-1.20.14.inc
index 7e425effe5..0726da100f 100644
--- a/meta/recipes-devtools/go/go-1.20.14.inc
+++ b/meta/recipes-devtools/go/go-1.20.14.inc
@@ -11,8 +11,8 @@ SRC_URI += "\
     file://0004-make.bash-override-CC-when-building-dist-and-go_boot.patch \
     file://0005-cmd-dist-separate-host-and-target-builds.patch \
     file://0006-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0007-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://0001-exec.go-filter-out-build-specific-paths-from-linker-.patch \
 "
 SRC_URI[main.sha256sum] = "1aef321a0e3e38b7e91d2d7eb64040666cabdcc77d383de3c9522d0d69b67f4e"
diff --git a/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch b/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
new file mode 100644
index 0000000000..c5bf28f54a
--- /dev/null
+++ b/meta/recipes-devtools/go/go/0001-exec.go-filter-out-build-specific-paths-from-linker-.patch
@@ -0,0 +1,61 @@
+From 083b5c74b12a1abeb11dd7f58a1cb1593d0000c0 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 27 Feb 2024 18:06:51 +0800
+Subject: [PATCH] exec.go: filter out build-specific paths from linker flags
+
+The flags can contain build-specific paths, breaking reproducibility.
+Filter out options that have build-specific paths.
+
+Upstream-Status: Inappropriate [ Not perfect for upstream ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/cmd/go/internal/work/exec.go | 25 ++++++++++++++++++++++++-
+ 1 file changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index cde867b..e3ce17d 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -1358,6 +1358,29 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
+ 	return h.Sum()
+ }
+ 
++func filterLinkerFlags(flags []string) []string {
++	var newflags []string
++	var skipflag bool
++	skipflag = false
++	for i, flag := range flags {
++		if skipflag == true {
++			skipflag = false
++			continue
++		}
++		if strings.HasPrefix(flag, "--sysroot") || strings.HasPrefix(flag, "-fmacro-prefix-map") || strings.HasPrefix(flag, "-fdebug-prefix-map") || strings.HasPrefix(flag, "-ffile-prefix-map") || strings.HasPrefix(flag, "-fcanon-prefix-map") || strings.HasPrefix(flag, "-fprofile-prefix-map") || strings.HasPrefix(flag, "-Wl,-rpath-link"){
++			continue
++		} else if strings.HasPrefix(flag, "-extldflags") {
++			skipflag = true
++			newflags = append(newflags, flag)
++			var filterd_Extldflags []string = filterLinkerFlags(strings.Split(flags[i+1], " "))
++			newflags = append(newflags, strings.Join(filterd_Extldflags, " "))
++		} else {
++			newflags = append(newflags, flag)
++		}
++	}
++	return newflags
++}
++
+ // printLinkerConfig prints the linker config into the hash h,
+ // as part of the computation of a linker-related action ID.
+ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
+@@ -1368,7 +1391,7 @@ func (b *Builder) printLinkerConfig(h io.Writer, p *load.Package) {
+ 	case "gc":
+ 		fmt.Fprintf(h, "link %s %q %s\n", b.toolID("link"), forcedLdflags, ldBuildmode)
+ 		if p != nil {
+-			fmt.Fprintf(h, "linkflags %q\n", p.Internal.Ldflags)
++			fmt.Fprintf(h, "linkflags %q\n", filterLinkerFlags(p.Internal.Ldflags))
+ 		}
+ 
+ 		// GOARM, GOMIPS, etc.
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
deleted file mode 100644
index 7d9869b536..0000000000
--- a/meta/recipes-devtools/go/go/0007-exec.go-do-not-write-linker-flags-into-buildids.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 0ba747e6a4b251a0d9eed0cfd8f8c491bb508040 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Mon, 23 Nov 2020 19:22:04 +0000
-Subject: [PATCH 7/9] exec.go: do not write linker flags into buildids
-
-The flags can contain build-specific paths, breaking reproducibility.
-
-To make this acceptable to upstream, we probably need to trim the flags,
-removing those known to be buildhost-specific.
-
-Upstream-Status: Inappropriate [needs upstream discussion]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/cmd/go/internal/work/exec.go | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index cde867b..5cb1812 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -1331,7 +1331,7 @@ func (b *Builder) linkActionID(a *Action) cache.ActionID {
- 	}
- 
- 	// Toolchain-dependent configuration, shared with b.linkSharedActionID.
--	b.printLinkerConfig(h, p)
-+	//b.printLinkerConfig(h, p)
- 
- 	// Input files.
- 	for _, a1 := range a.Deps {
-@@ -1626,7 +1626,7 @@ func (b *Builder) linkSharedActionID(a *Action) cache.ActionID {
- 	fmt.Fprintf(h, "goos %s goarch %s\n", cfg.Goos, cfg.Goarch)
- 
- 	// Toolchain-dependent configuration, shared with b.linkActionID.
--	b.printLinkerConfig(h, nil)
-+	//b.printLinkerConfig(h, nil)
- 
- 	// Input files.
- 	for _, a1 := range a.Deps {
--- 
-2.30.2
-
-- 
2.25.1


