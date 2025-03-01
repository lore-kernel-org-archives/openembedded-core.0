Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3843EC282D0
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 07:56:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5117.1740815762616818717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 23:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5155a5e946=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5217txsr020589;
	Sat, 1 Mar 2025 07:55:59 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 453qf108w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 01 Mar 2025 07:55:59 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Fri, 28 Feb 2025 23:55:58 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Fri, 28 Feb 2025 23:55:56 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <jose.quaresma@foundries.io>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [poky][PATCH 2/3] go: fix buildpath issue for go-runtime
Date: Sat, 1 Mar 2025 15:55:51 +0800
Message-ID: <20250301075552.354661-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250301075552.354661-1-hongxu.jia@windriver.com>
References: <20250301075552.354661-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: x0nu9iIjLdVZM2dslLI_URWlEu8w0sql
X-Authority-Analysis: v=2.4 cv=Yon1R5YX c=1 sm=1 tr=0 ts=67c2bd8f cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=Oh2cFVv5AAAA:8 a=t7CeM3EgAAAA:8 a=C9ArJovFf5j5W3SOmiYA:9 a=7KeoIwV6GZqOttXkcoxL:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: x0nu9iIjLdVZM2dslLI_URWlEu8w0sql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-01_02,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2503010060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 07:56:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212088

In upstream commit [cmd: remove support for GOROOT_FINAL][1], it clear
GOROOT for func ld when -trimpath is used

But it missed to do the same thing for share libarary linking which caused
building go-runtime failed with buildpath issue

|ERROR: go-runtime-1.23.4-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/
linux_amd64_dynlink/libstd.so in package go-runtime contains reference to
TMPDIR [buildpaths]

This commit applied a patch to clear GOROOT for func ldShared when
-trimpath is used and add option -trimpath to go-runtime build

[1] https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98
[2] https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98#diff-cab5921f94f2667bb0bc1b935d2d46b4c03541b4351b33438ab7290b94dea212R669

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/go/go-1.24.0.inc        |  1 +
 meta/recipes-devtools/go/go-runtime.inc       |  2 +-
 ...OOT-for-func-ldShared-when-trimpath-.patch | 51 +++++++++++++++++++
 3 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch

diff --git a/meta/recipes-devtools/go/go-1.24.0.inc b/meta/recipes-devtools/go/go-1.24.0.inc
index 26a4947caf..a52dd19e76 100644
--- a/meta/recipes-devtools/go/go-1.24.0.inc
+++ b/meta/recipes-devtools/go/go-1.24.0.inc
@@ -14,6 +14,7 @@ SRC_URI += "\
     file://0007-exec.go-filter-out-build-specific-paths-from-linker-.patch \
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
+    file://0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch \
     file://6d265b008e3d106b2706645e5a88cd8e2fb98953.patch \
 "
 SRC_URI[main.sha256sum] = "d14120614acb29d12bcab72bd689f257eb4be9e0b6f88a8fb7e41ac65f8556e5"
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 413cf6d33f..e5f17337bc 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -34,7 +34,7 @@ do_compile() {
 	if [ -n "${GO_DYNLINK}" ]; then
 		export GOTOOLDIR="${B}/pkg/tool/native_native"
 		CC="$CC_FOR_${TARGET_GOTUPLE}" GOARCH="${TARGET_GOARCH}" GOOS="${TARGET_GOOS}" GOROOT=${B} \
-			$GOTOOLDIR/go_bootstrap install -linkshared -buildmode=shared ${GO_SHLIB_LDFLAGS} std
+			$GOTOOLDIR/go_bootstrap install -linkshared -trimpath -buildmode=shared ${GO_SHLIB_LDFLAGS} std
 	fi
 	cd ${B}
 }
diff --git a/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch b/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch
new file mode 100644
index 0000000000..2c2f0cbfb5
--- /dev/null
+++ b/meta/recipes-devtools/go/go/0010-cmd-go-clear-GOROOT-for-func-ldShared-when-trimpath-.patch
@@ -0,0 +1,51 @@
+From c4215b5ca69a7626d97cf9b7ebc460c2b5b9148b Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 28 Feb 2025 19:13:18 -0800
+Subject: [PATCH 10/11] cmd/go: clear GOROOT for func ldShared when -trimpath
+ is used
+
+In commit [cmd: remove support for GOROOT_FINAL][1], it clear GOROOT
+for func ld when -trimpath is used. [2]
+
+This commit do the same thing for func ldShared, otherwise run go_bootstrap
+with -trimpath does not remove build path directory from the generated share
+libarary
+
+  $ ./make.bash --target-only --no-banner std
+  $ go_bootstrap install -linkshared -buildmode=shared -trimpath std
+  $ grep "$(pwd)" ./pkg/linux_amd64_dynlink/libstd.so
+  Binary file ./pkg/linux_amd64_dynlink/libstd.so matches
+
+[1] https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98
+[2] https://github.com/golang/go/commit/507d1b22f4b58ac68841582d0c2c0ab6b20e5a98#diff-cab5921f94f2667bb0bc1b935d2d46b4c03541b4351b33438ab7290b94dea212R669
+
+Upstream-Status: Submitted [https://go-review.googlesource.com/c/go/+/653895]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/cmd/go/internal/work/gc.go | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/src/cmd/go/internal/work/gc.go b/src/cmd/go/internal/work/gc.go
+index 3a173efee8..8b7a44e031 100644
+--- a/src/cmd/go/internal/work/gc.go
++++ b/src/cmd/go/internal/work/gc.go
+@@ -728,7 +728,14 @@ func (gcToolchain) ldShared(b *Builder, root *Action, toplevelactions []*Action,
+ 	// the output file path is recorded in the .gnu.version_d section.
+ 	dir, targetPath := filepath.Split(targetPath)
+ 
+-	return b.Shell(root).run(dir, targetPath, nil, cfg.BuildToolexec, base.Tool("link"), "-o", targetPath, "-importcfg", importcfg, ldflags)
++	env := []string{}
++	// When -trimpath is used, GOROOT is cleared
++	if cfg.BuildTrimpath {
++		env = append(env, "GOROOT=")
++	} else {
++		env = append(env, "GOROOT="+cfg.GOROOT)
++	}
++	return b.Shell(root).run(dir, targetPath, env, cfg.BuildToolexec, base.Tool("link"), "-o", targetPath, "-importcfg", importcfg, ldflags)
+ }
+ 
+ func (gcToolchain) cc(b *Builder, a *Action, ofile, cfile string) error {
+-- 
+2.25.1
+
-- 
2.34.1


