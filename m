Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 026C2783FE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Sep 2017 01:05:36 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id l188so1310459pfc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 18:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=POVxhkhcLNNQeGhyVhxWtan0z5JSXbVYN5A9fZI9iGE=;
	b=sCbXxuht58E5dn8mCbIl7HPV8ZXmN5uiHdVHe/OUinC/+El+YcUjTYB1zdShZTetRr
	a3y+8c23WqKlaWQnoqx2ERn588KXEQf1IPQc/58PKl972MK773d3GVxG5U9AGKLAGTpw
	qZSiWaRYLvx1zUmnYbOwOb8fYWUewmSCf8zsgAt2XvDWnkIB+b8pL8wOl9oktXqGyFRD
	2q2kcNdJfo6OPGWi5DoJ/b96XnMqlu19ZJkwAqi7OBcRVVT0HVONIcg6mKjMeu5heJNN
	9NE/xIrheqch5TzUNDK1At4JB4wm+HU9nteVzIgMiBoaRqNFTWPcdgXi45fJ+i1iedE1
	YOaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=POVxhkhcLNNQeGhyVhxWtan0z5JSXbVYN5A9fZI9iGE=;
	b=GG+XAmggaRqy5EFFn0Qj5ZzYqPjTshyAAvUiO6NSjiBPKTtBqVX6XOO6/KSnvY46Hy
	Xrd1bxjjYVux9na2bm+oSBTealgtC2u4drlpdtGc4X/DCmCD4TokSMrnXY6VXt5YE6Ba
	/jmutGBRxHvFbeMGlq40genGPNte8ZYnnLSAirU05b+mxrXuc0oyawGG3o5bUgWQ6Q8V
	/biP70E9EhgObxPqFx8Ctp8vtmVjSPJSJZsV32fq4La6edud2XmAc85UdT1XmLKEAwai
	My779H/gL7qjbAmACODMuzj++NItmJrLDXgAMtd2XoaIm+pencPSjLSbmUo03qRL86CF
	usmA==
X-Gm-Message-State: AHPjjUjSDip9LDWorYkCMwNvh9ekmhFzIcpfh8Oc94dH9Ql3a82Jvoh/
	1AIVFKqPAeZu/L2cA1RoEZNYfg==
X-Google-Smtp-Source: AOwi7QB7n1qQ0Vy8mK7GKhlx3KS7UBVQ0tozNrNOor1TcHOUoQ6I4RhUwj1ldVkYxL8XG7yfG4bMCg==
X-Received: by 10.98.28.74 with SMTP id c71mr748074pfc.169.1506128737896;
	Fri, 22 Sep 2017 18:05:37 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	y83sm1161426pff.167.2017.09.22.18.05.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 18:05:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 18:05:29 -0700
Message-Id: <20170923010529.10734-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH V2 4/4] go: Fix build with -buildmode=pie
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
X-List-Received-Date: Sat, 23 Sep 2017 01:05:37 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in V2: Add Signed-off-by

 meta/recipes-devtools/go/go-1.9.inc                |  1 +
 ...dmode-pie-forces-external-linking-mode-on.patch | 47 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)
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
index 0000000000..aa5fcfdd23
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
@@ -0,0 +1,47 @@
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
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
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


