Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 5843178477
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 00:58:34 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id r71so1297344pfe.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 17:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1DATQQ64B8Z0/lIAY5SbSSTZ1AitA0d/Lb50Th0RVjk=;
	b=KsLpeJnGikPmsHIfY94mZBZNhukdcYfU1sBX3ehtvJo8Y5YK9ZW3BIhksh+70cuGL3
	q+wKGM1XIVThnpbERNJFXC36nPqXhNCCT4QC0vpxWc/32qCuHhXyYa0B4NX+i9uuNL2m
	PZzvscHR2v8OD/hzANl7fZ/Nlq47CMv/Vf8Jp4JVHMKOzBImdE0g5rHMcMhBMC/Y93IJ
	inIa+WVpE29rBXn8/c/xUNOXkwDWSJmUJOd2lY/9kTexOP1oTPVj2MiEZhRRM2oIkq4x
	BLDrqKAilCSzde1ghEfucTLvLviSlvlfEr8OyInbovqtfpRAZN5rCDpg97X/4UMWjoaN
	aREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1DATQQ64B8Z0/lIAY5SbSSTZ1AitA0d/Lb50Th0RVjk=;
	b=D9iLuavEJtsWii5Qo7Zd1ysc/XNg8zHE9n+ZBHBuBE60drztiEY8OEAXFxvowHp4kQ
	1gDWoCVknWvbrOO8Nz/UUlG/Ja6/JveL+jetG9SQwRr9T428/aCds+UVThtxM0lWfZLg
	nP/UDSAAbDovr2UYgIFAAemzQAelMV1qdQN97fcUFDMgonVEUHVubqWdURskWlGLJXtl
	gEPtO3tbU1CMzJoFrs7ot76FXKHlC7biwa4pgDIiYFF2YjgXGZzmfn6g5ietjrWauS9S
	BjVrqLVANdmuFyJR9Tr2TjO5H3k4C02LhrMidxIZHj0sEWkjf8EPPFgUqLARA28cqGe6
	pnSA==
X-Gm-Message-State: AHPjjUhadFOTBjREe1KdYNGPnSGcXalQIUR9wO7jmJS34u9KrQ5abaTg
	bqxpNBmJSPgMyA0ormYdvti7Jg==
X-Google-Smtp-Source: AOwi7QCHSJ2o7X2FxVntUvLbCAzmtFGmdqbKMAR5JqTg1h8o3QfDFu+uTqaaGNBuFT1GfzO3TbSX0w==
X-Received: by 10.98.236.17 with SMTP id k17mr730761pfh.191.1506128316360;
	Fri, 22 Sep 2017 17:58:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	b66sm1151521pfe.165.2017.09.22.17.58.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 17:58:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 17:58:23 -0700
Message-Id: <20170923005823.10278-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170923005823.10278-1-raj.khem@gmail.com>
References: <20170923005823.10278-1-raj.khem@gmail.com>
Subject: [PATCH 4/4] go: Fix build with -buildmode=pie
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Sep 2017 00:58:35 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.9.inc                |  1 +
 ...dmode-pie-forces-external-linking-mode-on.patch | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 0b0aca3fbe..65adaa8d72 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -14,6 +14,7 @@ SRC_URI += "\
         file://0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch \
         file://0007-ld-add-soname-to-shareable-objects.patch \
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
+        file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
 "
 SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
 SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
diff --git a/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch b/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
new file mode 100644
index 0000000000..7475d9338a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
@@ -0,0 +1,46 @@
+From aae44527c8065d54f6acaf87c82cba1ac96fae59 Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Fri, 18 Aug 2017 17:46:03 -0700
+Subject: [PATCH] cmd/go: -buildmode=pie forces external linking mode on all
+ systems
+
+The go tool assumed that -buildmode=pie implied internal linking on
+linux-amd64. However, that was changed by CL 36417 for issue #18968.
+
+Fixes #21452
+
+Change-Id: I8ed13aea52959cc5c53223f4c41ba35329445545
+Reviewed-on: https://go-review.googlesource.com/57231
+Run-TryBot: Ian Lance Taylor <iant@golang.org>
+TryBot-Result: Gobot Gobot <gobot@golang.org>
+Reviewed-by: Avelino <t@avelino.xxx>
+Reviewed-by: Rob Pike <r@golang.org>
+---
+Upstream-Status: Backport
+
+ src/cmd/go/internal/load/pkg.go | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
+index 2660d3f..d40773b 100644
+--- a/src/cmd/go/internal/load/pkg.go
++++ b/src/cmd/go/internal/load/pkg.go
+@@ -954,11 +954,12 @@ func (p *Package) load(stk *ImportStack, bp *build.Package, err error) *Package
+ 
+ 	if cfg.BuildContext.CgoEnabled && p.Name == "main" && !p.Goroot {
+ 		// Currently build modes c-shared, pie (on systems that do not
+-		// support PIE with internal linking mode), plugin, and
+-		// -linkshared force external linking mode, as of course does
++		// support PIE with internal linking mode (currently all
++		// systems: issue #18968)), plugin, and -linkshared force
++		// external linking mode, as of course does
+ 		// -ldflags=-linkmode=external. External linking mode forces
+ 		// an import of runtime/cgo.
+-		pieCgo := cfg.BuildBuildmode == "pie" && (cfg.BuildContext.GOOS != "linux" || cfg.BuildContext.GOARCH != "amd64")
++		pieCgo := cfg.BuildBuildmode == "pie"
+ 		linkmodeExternal := false
+ 		for i, a := range cfg.BuildLdflags {
+ 			if a == "-linkmode=external" {
+-- 
+2.14.1
+
-- 
2.14.1


