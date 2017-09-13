Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 10CDA78662
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:55:36 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id m35so2409379qte.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lZBlVySSNLx1ZFpFaE1eL0qKfDUdGh7qSJ/DwUKivk0=;
	b=DOnexa0zxI5riY2l7vDVP0C5XPFXh29oxXDE4E+sfhtqqRhLnbuZE+xuaDAB09bYTI
	zM4/cSnhXPfv6b+xSQFSoTOsXMojLv90R67WPVoEfEFjyF6NBvbLIvgmXTsvodnPOoth
	rhDLrz80ozQlEh/XlrLfVqpSrsWPqWM/xLGIoBz1AeMK5hDI6Lhg5rs87oyfFMe0G84P
	cZs4v5LgcOmUP4yc8ViVMRE2/yu+4jFt9Ngfn/gihnOZcirrlx/FzbpXR8PE0OeQ7C6j
	+1WQE6zGUcJ3YkFXYp69P+oXb+onm03j2FZdeBedarGK3LNRwTRZoyI0wiTtxbk1wUFn
	Pawg==
X-Gm-Message-State: AHPjjUhsUcwf1XEaCaOT5EDL5XOpNgVf1P1aoQjiGNQKhjLODB7yX8XA
	WALpAMt4r4XVpXim
X-Google-Smtp-Source: AOwi7QDzyHemnNbjkaxe4bb9xqs/xW1p92bQdmoeMZ/3thD16fcd94BtO9wN5gvs27bu16GzE3cRdQ==
X-Received: by 10.237.34.240 with SMTP id q45mr6094104qtc.1.1505325336959;
	Wed, 13 Sep 2017 10:55:36 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n88sm8150176qki.49.2017.09.13.10.55.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:55:35 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:55:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:10 -0300
Message-Id: <20170913175410.23041-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 9/9] go: update to go 1.9
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
X-List-Received-Date: Wed, 13 Sep 2017 17:55:37 -0000

From: Matt Madison <matt@madison.systems>

* Rebased patches
   - dropped armhf-elf patch, should no longer be needed
   - dropped syslog patch which should not have been imported to begin with
   - reworked other patches as needed for the updated code base

* Updated native, cross, cross-canadian .inc files to
  remove some testdata directories that contain .a files
  that strip chokes on during sysroot staging

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9:
- new patch

 meta/recipes-devtools/go/go-1.8.inc                | 22 -------
 .../go/go-1.8/armhf-elf-header.patch               | 23 --------
 .../go/go-1.8/fix-cc-handling.patch                | 50 ----------------
 .../go/go-1.8/fix-target-cc-for-build.patch        | 17 ------
 meta/recipes-devtools/go/go-1.8/gotooldir.patch    | 30 ----------
 .../go/go-1.8/make-goroot-precious.patch           | 21 -------
 meta/recipes-devtools/go/go-1.8/syslog.patch       | 62 --------------------
 meta/recipes-devtools/go/go-1.9.inc                | 18 ++++++
 .../0001-make.bash-quote-CC_FOR_TARGET.patch       | 32 ++++++++++
 ...CC-and-CXX-environment-variable-construct.patch | 67 +++++++++++++++++++++
 ...h-better-separate-host-and-target-builds.patch} | 52 +++++++++++++----
 ...w-GOTOOLDIR-to-be-overridden-in-the-envir.patch | 68 ++++++++++++++++++++++
 ...05-cmd-go-make-GOROOT-precious-by-default.patch | 41 +++++++++++++
 ...d-GOTOOLDIR_BOOTSTRAP-environment-variab.patch} | 26 +++++++--
 .../0007-ld-add-soname-to-shareable-objects.patch} | 20 ++++---
 meta/recipes-devtools/go/go-cross-canadian.inc     |  1 +
 ...ss-canadian_1.8.bb => go-cross-canadian_1.9.bb} |  0
 meta/recipes-devtools/go/go-cross.inc              |  2 +-
 .../go/{go-cross_1.8.bb => go-cross_1.9.bb}        |  0
 .../go/{go-crosssdk_1.8.bb => go-crosssdk_1.9.bb}  |  0
 meta/recipes-devtools/go/go-native.inc             |  2 +-
 .../go/{go-native_1.8.bb => go-native_1.9.bb}      |  0
 .../go/{go-runtime_1.8.bb => go-runtime_1.9.bb}    |  0
 meta/recipes-devtools/go/{go_1.8.bb => go_1.9.bb}  |  0
 24 files changed, 301 insertions(+), 253 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.8.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.8/armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/fix-cc-handling.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/fix-target-cc-for-build.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/gotooldir.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.8/syslog.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9.inc
 create mode 100644 meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
 rename meta/recipes-devtools/go/{go-1.8/split-host-and-target-build.patch => go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch} (60%)
 create mode 100644 meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
 rename meta/recipes-devtools/go/{go-1.8/set-gotooldir-during-bootstrap.patch => go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch} (55%)
 rename meta/recipes-devtools/go/{go-1.8/0006-linker-add-soname-to-shareable-objects.patch => go-1.9/0007-ld-add-soname-to-shareable-objects.patch} (68%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.8.bb => go-cross-canadian_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.8.bb => go-cross_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.8.bb => go-crosssdk_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.8.bb => go-native_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.8.bb => go-runtime_1.9.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.8.bb => go_1.9.bb} (100%)

diff --git a/meta/recipes-devtools/go/go-1.8.inc b/meta/recipes-devtools/go/go-1.8.inc
deleted file mode 100644
index 8c4b71e428..0000000000
--- a/meta/recipes-devtools/go/go-1.8.inc
+++ /dev/null
@@ -1,22 +0,0 @@
-require go-common.inc
-
-GOMINOR = "3"
-GO_BASEVERSION = "1.8"
-PV .= ".${GOMINOR}"
-FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
-
-SRC_URI += "\
-       file://armhf-elf-header.patch \
-       file://syslog.patch \
-       file://fix-target-cc-for-build.patch \
-       file://fix-cc-handling.patch \
-       file://split-host-and-target-build.patch \
-       file://gotooldir.patch \
-       file://make-goroot-precious.patch \
-       file://set-gotooldir-during-bootstrap.patch \
-       file://0006-linker-add-soname-to-shareable-objects.patch \
-"
-SRC_URI[main.md5sum] = "64e9380e07bba907e26a00cf5fcbe77e"
-SRC_URI[main.sha256sum] = "5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6"
diff --git a/meta/recipes-devtools/go/go-1.8/armhf-elf-header.patch b/meta/recipes-devtools/go/go-1.8/armhf-elf-header.patch
deleted file mode 100644
index 3508838e8b..0000000000
--- a/meta/recipes-devtools/go/go-1.8/armhf-elf-header.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Encode arm EABI ( hard/soft ) calling convention in ELF header
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/cmd/link/internal/ld/elf.go
-===================================================================
---- go.orig/src/cmd/link/internal/ld/elf.go
-+++ go/src/cmd/link/internal/ld/elf.go
-@@ -950,7 +950,13 @@ func Elfinit(ctxt *Link) {
- 	case sys.ARM, sys.MIPS:
- 		if SysArch.Family == sys.ARM {
- 			// we use EABI on linux/arm, freebsd/arm, netbsd/arm.
--			if Headtype == obj.Hlinux || Headtype == obj.Hfreebsd || Headtype == obj.Hnetbsd {
-+			if Headtype == obj.Hlinux {
-+				if obj.GOARM == 7 {
-+					ehdr.flags = 0x5000402 // has entry point, Version5 EABI, hard float
-+				} else {
-+					ehdr.flags = 0x5000202 // has entry point, Version5 EABI, soft float
-+				}
-+			} else if Headtype == obj.Hfreebsd || Headtype == obj.Hnetbsd {
- 				// We set a value here that makes no indication of which
- 				// float ABI the object uses, because this is information
- 				// used by the dynamic linker to compare executables and
diff --git a/meta/recipes-devtools/go/go-1.8/fix-cc-handling.patch b/meta/recipes-devtools/go/go-1.8/fix-cc-handling.patch
deleted file mode 100644
index dc9b811b2a..0000000000
--- a/meta/recipes-devtools/go/go-1.8/fix-cc-handling.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Accept CC with multiple words in its name
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/cmd/go/build.go
-===================================================================
---- go.orig/src/cmd/go/build.go
-+++ go/src/cmd/go/build.go
-@@ -3100,12 +3100,24 @@ func (b *builder) gccCmd(objdir string)
- 	return b.ccompilerCmd("CC", defaultCC, objdir)
- }
- 
-+// gccCmd returns a gcc command line prefix
-+// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
-+func (b *builder) gccCmdForReal() []string {
-+	return envList("CC", defaultCC)
-+}
-+
- // gxxCmd returns a g++ command line prefix
- // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
- func (b *builder) gxxCmd(objdir string) []string {
- 	return b.ccompilerCmd("CXX", defaultCXX, objdir)
- }
- 
-+// gxxCmd returns a g++ command line prefix
-+// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
-+func (b *builder) gxxCmdForReal() []string {
-+	return envList("CXX", defaultCXX)
-+}
-+
- // gfortranCmd returns a gfortran command line prefix.
- func (b *builder) gfortranCmd(objdir string) []string {
- 	return b.ccompilerCmd("FC", "gfortran", objdir)
-Index: go/src/cmd/go/env.go
-===================================================================
---- go.orig/src/cmd/go/env.go
-+++ go/src/cmd/go/env.go
-@@ -63,10 +63,9 @@ func mkEnv() []envVar {
- 	}
- 
- 	cmd := b.gccCmd(".")
--	env = append(env, envVar{"CC", cmd[0]})
-+	env = append(env, envVar{"CC", strings.Join(b.gccCmdForReal(), " ")})
- 	env = append(env, envVar{"GOGCCFLAGS", strings.Join(cmd[3:], " ")})
--	cmd = b.gxxCmd(".")
--	env = append(env, envVar{"CXX", cmd[0]})
-+	env = append(env, envVar{"CXX", strings.Join(b.gxxCmdForReal(), " ")})
- 
- 	if buildContext.CgoEnabled {
- 		env = append(env, envVar{"CGO_ENABLED", "1"})
diff --git a/meta/recipes-devtools/go/go-1.8/fix-target-cc-for-build.patch b/meta/recipes-devtools/go/go-1.8/fix-target-cc-for-build.patch
deleted file mode 100644
index 2f6156ecd2..0000000000
--- a/meta/recipes-devtools/go/go-1.8/fix-target-cc-for-build.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Put Quotes around CC_FOR_TARGET since it can be mutliple words e.g. in OE
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/make.bash
-===================================================================
---- go.orig/src/make.bash	2015-07-29 13:28:11.334031696 -0700
-+++ go/src/make.bash	2015-07-29 13:36:55.814465630 -0700
-@@ -158,7 +158,7 @@
- fi
- 
- echo "##### Building packages and commands for $GOOS/$GOARCH."
--CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
-+CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
- echo
- 
- rm -f "$GOTOOLDIR"/go_bootstrap
diff --git a/meta/recipes-devtools/go/go-1.8/gotooldir.patch b/meta/recipes-devtools/go/go-1.8/gotooldir.patch
deleted file mode 100644
index 94670259f2..0000000000
--- a/meta/recipes-devtools/go/go-1.8/gotooldir.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Define tooldir in relation to GOTOOLDIR env var
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-Index: go/src/go/build/build.go
-===================================================================
---- go.orig/src/go/build/build.go
-+++ go/src/go/build/build.go
-@@ -1388,7 +1388,7 @@ func init() {
- }
- 
- // ToolDir is the directory containing build tools.
--var ToolDir = filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
-+var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
- 
- // IsLocalImport reports whether the import path is
- // a local import path, like ".", "..", "./foo", or "../foo".
-Index: go/src/cmd/go/build.go
-===================================================================
---- go.orig/src/cmd/go/build.go
-+++ go/src/cmd/go/build.go
-@@ -1312,7 +1312,7 @@ func (b *builder) build(a *action) (err
- 		}
- 
- 		cgoExe := tool("cgo")
--		if a.cgo != nil && a.cgo.target != "" {
-+		if a.cgo != nil && a.cgo.target != "" && os.Getenv("GOTOOLDIR") == "" {
- 			cgoExe = a.cgo.target
- 		}
- 		outGo, outObj, err := b.cgo(a.p, cgoExe, obj, pcCFLAGS, pcLDFLAGS, cgofiles, gccfiles, cxxfiles, a.p.MFiles)
diff --git a/meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch b/meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
deleted file mode 100644
index 28a7a34773..0000000000
--- a/meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-Prevent GOROOT-resident packages from being rebuilt
-
-Signed-off-by: Matt Madison <matt@madison.systems>
-Upstream-Status: Pending
-
---- go.orig/src/cmd/go/pkg.go
-+++ go/src/cmd/go/pkg.go
-@@ -1496,6 +1496,13 @@ func isStale(p *Package) (bool, string)
- 		return true, "build ID mismatch"
- 	}
- 
-+	// For OE builds, make anything in GOROOT non-stale,
-+	// to prevent a package build from overwriting the
-+	// build root.
-+	if p.Goroot && os.Getenv("GOROOT_OVERRIDE") != "1" {
-+		return false, "GOROOT-resident packages do not get rebuilt"
-+	}
-+
- 	// Package is stale if a dependency is.
- 	for _, p1 := range p.deps {
- 		if p1.Stale {
diff --git a/meta/recipes-devtools/go/go-1.8/syslog.patch b/meta/recipes-devtools/go/go-1.8/syslog.patch
deleted file mode 100644
index 29be06f1bd..0000000000
--- a/meta/recipes-devtools/go/go-1.8/syslog.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Add timeouts to logger
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/syslog/syslog.go
---- go/src/log/syslog/syslog.go	2013-11-28 13:38:28.000000000 -0800
-+++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go	2014-10-03 11:44:37.710403200 -0700
-@@ -33,6 +33,9 @@
- const severityMask = 0x07
- const facilityMask = 0xf8
- 
-+var writeTimeout = 1 * time.Second
-+var connectTimeout = 1 * time.Second
-+
- const (
- 	// Severity.
- 
-@@ -100,6 +103,7 @@
- type serverConn interface {
- 	writeString(p Priority, hostname, tag, s, nl string) error
- 	close() error
-+	setWriteDeadline(t time.Time) error
- }
- 
- type netConn struct {
-@@ -273,7 +277,11 @@
- 		nl = "\n"
- 	}
- 
--	err := w.conn.writeString(p, w.hostname, w.tag, msg, nl)
-+	err := w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
-+	if err != nil {
-+		return 0, err
-+	}
-+	err = w.conn.writeString(p, w.hostname, w.tag, msg, nl)
- 	if err != nil {
- 		return 0, err
- 	}
-@@ -305,6 +313,10 @@
- 	return n.conn.Close()
- }
- 
-+func (n *netConn) setWriteDeadline(t time.Time) error {
-+	return n.conn.SetWriteDeadline(t)
-+}
-+
- // NewLogger creates a log.Logger whose output is written to
- // the system log service with the specified priority. The logFlag
- // argument is the flag set passed through to log.New to create
-diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go
---- go/src/log/syslog/syslog_unix.go	2013-11-28 13:38:28.000000000 -0800
-+++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go	2014-10-03 11:44:39.010403175 -0700
-@@ -19,7 +19,7 @@
- 	logPaths := []string{"/dev/log", "/var/run/syslog"}
- 	for _, network := range logTypes {
- 		for _, path := range logPaths {
--			conn, err := net.Dial(network, path)
-+			conn, err := net.DialTimeout(network, path, connectTimeout)
- 			if err != nil {
- 				continue
- 			} else {
diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
new file mode 100644
index 0000000000..d538f4c3a3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -0,0 +1,18 @@
+require go-common.inc
+
+GO_BASEVERSION = "1.9"
+FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
+
+SRC_URI += "\
+        file://0001-make.bash-quote-CC_FOR_TARGET.patch \
+        file://0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch \
+        file://0003-make.bash-better-separate-host-and-target-builds.patch \
+        file://0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch \
+        file://0005-cmd-go-make-GOROOT-precious-by-default.patch \
+        file://0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch \
+        file://0007-ld-add-soname-to-shareable-objects.patch \
+"
+SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
+SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
diff --git a/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch b/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
new file mode 100644
index 0000000000..7800975e48
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0001-make.bash-quote-CC_FOR_TARGET.patch
@@ -0,0 +1,32 @@
+From d24734ad44006791fd48fc45ea34fe608ff672fb Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Wed, 13 Sep 2017 08:04:23 -0700
+Subject: [PATCH 1/7] make.bash: quote CC_FOR_TARGET
+
+For OE cross-builds, $CC_FOR_TARGET has more than
+one word and needs to be quoted.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/make.bash | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/make.bash b/src/make.bash
+index 71e7531..dcf3256 100755
+--- a/src/make.bash
++++ b/src/make.bash
+@@ -175,7 +175,7 @@ echo "##### Building packages and commands for $GOOS/$GOARCH."
+ 
+ old_bin_files=$(cd $GOROOT/bin && echo *)
+ 
+-CC=$CC_FOR_TARGET "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
++CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
+ 
+ # Check that there are no new files in $GOROOT/bin other than go and gofmt
+ # and $GOOS_$GOARCH (a directory used when cross-compiling).
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch b/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
new file mode 100644
index 0000000000..a4e42261c3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
@@ -0,0 +1,67 @@
+From a7170d32a13aead608abd18996f6dab2e2a631b5 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Wed, 13 Sep 2017 08:06:37 -0700
+Subject: [PATCH 2/7] cmd/go: fix CC and CXX environment variable construction
+
+For OE cross-builds, CC and CXX have multiple words, and
+we need their complete definitions when setting up the
+environment during Go builds.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/envcmd/env.go |  4 ++--
+ src/cmd/go/internal/work/build.go | 12 ++++++++++++
+ 2 files changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/src/cmd/go/internal/envcmd/env.go b/src/cmd/go/internal/envcmd/env.go
+index 43d4334..529d21d 100644
+--- a/src/cmd/go/internal/envcmd/env.go
++++ b/src/cmd/go/internal/envcmd/env.go
+@@ -74,10 +74,10 @@ func MkEnv() []cfg.EnvVar {
+ 	}
+ 
+ 	cmd := b.GccCmd(".")
+-	env = append(env, cfg.EnvVar{Name: "CC", Value: cmd[0]})
++	env = append(env, cfg.EnvVar{Name: "CC", Value: strings.Join(b.GccCmdForReal(), " ")})
+ 	env = append(env, cfg.EnvVar{Name: "GOGCCFLAGS", Value: strings.Join(cmd[3:], " ")})
+ 	cmd = b.GxxCmd(".")
+-	env = append(env, cfg.EnvVar{Name: "CXX", Value: cmd[0]})
++	env = append(env, cfg.EnvVar{Name: "CXX", Value: strings.Join(b.GxxCmdForReal(), " ")})
+ 
+ 	if cfg.BuildContext.CgoEnabled {
+ 		env = append(env, cfg.EnvVar{Name: "CGO_ENABLED", Value: "1"})
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index 7d667ff..85df0b3 100644
+--- a/src/cmd/go/internal/work/build.go
++++ b/src/cmd/go/internal/work/build.go
+@@ -3127,12 +3127,24 @@ func (b *Builder) GccCmd(objdir string) []string {
+ 	return b.ccompilerCmd("CC", cfg.DefaultCC, objdir)
+ }
+ 
++// gccCmd returns a gcc command line prefix
++// defaultCC is defined in zdefaultcc.go, written by cmd/dist.
++func (b *Builder) GccCmdForReal() []string {
++	return envList("CC", cfg.DefaultCC)
++}
++
+ // gxxCmd returns a g++ command line prefix
+ // defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
+ func (b *Builder) GxxCmd(objdir string) []string {
+ 	return b.ccompilerCmd("CXX", cfg.DefaultCXX, objdir)
+ }
+ 
++// gxxCmd returns a g++ command line prefix
++// defaultCXX is defined in zdefaultcc.go, written by cmd/dist.
++func (b *Builder) GxxCmdForReal() []string {
++	return envList("CXX", cfg.DefaultCXX)
++}
++
+ // gfortranCmd returns a gfortran command line prefix.
+ func (b *Builder) gfortranCmd(objdir string) []string {
+ 	return b.ccompilerCmd("FC", "gfortran", objdir)
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-1.8/split-host-and-target-build.patch b/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
similarity index 60%
rename from meta/recipes-devtools/go/go-1.8/split-host-and-target-build.patch
rename to meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
index b0dd95bbe7..ffd9f2359c 100644
--- a/meta/recipes-devtools/go/go-1.8/split-host-and-target-build.patch
+++ b/meta/recipes-devtools/go/go-1.9/0003-make.bash-better-separate-host-and-target-builds.patch
@@ -1,13 +1,26 @@
-Add new option --target-only to build target components
-Separates the host and target pieces of build
+From 31e88f06af7ab787d8fe0c1ca625193e1799e167 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Wed, 13 Sep 2017 08:12:04 -0700
+Subject: [PATCH 3/7] make.bash: better separate host and target builds
+
+Fore OE cross-builds, the simple checks in make.bash are
+insufficient for distinguishing host and target build
+environments, so add some options for telling the
+script which parts are being built.
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-Index: go/src/make.bash
-===================================================================
---- go.orig/src/make.bash
-+++ go/src/make.bash
-@@ -154,13 +154,22 @@ if [ "$1" = "--no-clean" ]; then
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/make.bash | 51 ++++++++++++++++++++++++++++-----------------------
+ 1 file changed, 28 insertions(+), 23 deletions(-)
+
+diff --git a/src/make.bash b/src/make.bash
+index dcf3256..9553623 100755
+--- a/src/make.bash
++++ b/src/make.bash
+@@ -156,13 +156,22 @@ if [ "$1" = "--no-clean" ]; then
  	buildall=""
  	shift
  fi
@@ -35,13 +48,28 @@ Index: go/src/make.bash
  	echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
  	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
  	# use the host compiler, CC, from `cmd/dist/dist env` instead.
-@@ -169,11 +178,20 @@ if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOH
+@@ -171,24 +180,20 @@ if [ "$GOHOSTARCH" != "$GOARCH" -o "$GOHOSTOS" != "$GOOS" ]; then
  	echo
  fi
  
 -echo "##### Building packages and commands for $GOOS/$GOARCH."
+-
+-old_bin_files=$(cd $GOROOT/bin && echo *)
+-
 -CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
+-
+-# Check that there are no new files in $GOROOT/bin other than go and gofmt
+-# and $GOOS_$GOARCH (a directory used when cross-compiling).
+-(cd $GOROOT/bin && for f in *; do
+-	if ! expr " $old_bin_files go gofmt ${GOOS}_${GOARCH} " : ".* $f " >/dev/null 2>/dev/null; then
+-		echo 1>&2 "ERROR: unexpected new file in $GOROOT/bin: $f"
+-		exit 1
+-	fi
+-done)
+-
 -echo
+-
+-rm -f "$GOTOOLDIR"/go_bootstrap
 +if [ "$do_target_build" = "yes" ]; then
 +    GO_INSTALL="${GO_TARGET_INSTALL:-std cmd}"
 +    echo "##### Building packages and commands for $GOOS/$GOARCH."
@@ -53,10 +81,12 @@ Index: go/src/make.bash
 +    fi
 +    GOTOOLDIR="$GOTOOLDIR" CC="$CC_FOR_TARGET" "$GOTOOLDIR"/go_bootstrap install $GO_FLAGS -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v ${GO_INSTALL}
 +    echo
- 
--rm -f "$GOTOOLDIR"/go_bootstrap
++
 +    rm -f "$GOTOOLDIR"/go_bootstrap
 +fi
  
  if [ "$1" != "--no-banner" ]; then
  	"$GOTOOLDIR"/dist banner
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch b/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
new file mode 100644
index 0000000000..180b06a4d3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
@@ -0,0 +1,68 @@
+From 1369178b497b12088ec4c2794606cc9f14cc327c Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Wed, 13 Sep 2017 08:15:03 -0700
+Subject: [PATCH 4/7] cmd/go: allow GOTOOLDIR to be overridden in the
+ environment
+
+For OE cross-builds, host-side tools reside in the native
+GOROOT, not the target GOROOT.  Allow GOTOOLDIR to be set
+in the environment to allow that split, rather than always
+computing GOTOOLDIR relative to the GOROOT setting.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/cfg/cfg.go    | 7 ++++++-
+ src/cmd/go/internal/work/build.go | 2 +-
+ src/go/build/build.go             | 2 +-
+ 3 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/cmd/go/internal/cfg/cfg.go b/src/cmd/go/internal/cfg/cfg.go
+index b3ad1ce..c1dc974 100644
+--- a/src/cmd/go/internal/cfg/cfg.go
++++ b/src/cmd/go/internal/cfg/cfg.go
+@@ -91,7 +91,12 @@ func init() {
+ 	// as the tool directory does not move based on environment variables.
+ 	// This matches the initialization of ToolDir in go/build,
+ 	// except for using GOROOT rather than runtime.GOROOT().
+-	build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++	s := os.Getenv("GOTOOLDIR")
++	if s == "" {
++		build.ToolDir = filepath.Join(GOROOT, "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++	} else {
++		build.ToolDir = s
++	}
+ }
+ 
+ func findGOROOT() string {
+diff --git a/src/cmd/go/internal/work/build.go b/src/cmd/go/internal/work/build.go
+index 85df0b3..7b9a69e 100644
+--- a/src/cmd/go/internal/work/build.go
++++ b/src/cmd/go/internal/work/build.go
+@@ -1337,7 +1337,7 @@ func (b *Builder) build(a *Action) (err error) {
+ 		}
+ 
+ 		var cgoExe string
+-		if a.cgo != nil && a.cgo.Target != "" {
++		if a.cgo != nil && a.cgo.Target != "" && os.Getenv("GOTOOLDIR") == "" {
+ 			cgoExe = a.cgo.Target
+ 		} else {
+ 			cgoExe = base.Tool("cgo")
+diff --git a/src/go/build/build.go b/src/go/build/build.go
+index fd89871..e16145b 100644
+--- a/src/go/build/build.go
++++ b/src/go/build/build.go
+@@ -1588,7 +1588,7 @@ func init() {
+ }
+ 
+ // ToolDir is the directory containing build tools.
+-var ToolDir = filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH)
++var ToolDir = envOr("GOTOOLDIR", filepath.Join(runtime.GOROOT(), "pkg/tool/"+runtime.GOOS+"_"+runtime.GOARCH))
+ 
+ // IsLocalImport reports whether the import path is
+ // a local import path, like ".", "..", "./foo", or "../foo".
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
new file mode 100644
index 0000000000..6e93bcb6ce
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0005-cmd-go-make-GOROOT-precious-by-default.patch
@@ -0,0 +1,41 @@
+From 44f961975dac6cf464a77b5f6dd0c47cc192c4fd Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Wed, 13 Sep 2017 08:19:52 -0700
+Subject: [PATCH 5/7] cmd/go: make GOROOT precious by default
+
+For OE builds, we never want packages that have
+already been installed into the build root to be
+modified, so prevent the go build tool from checking
+if they should be rebuilt.
+
+Also add an environment variable to override this
+behavior, just for building the Go runtime.
+
+Upstream-Status: Pending
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/cmd/go/internal/load/pkg.go | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/cmd/go/internal/load/pkg.go b/src/cmd/go/internal/load/pkg.go
+index 60de666..2660d3f 100644
+--- a/src/cmd/go/internal/load/pkg.go
++++ b/src/cmd/go/internal/load/pkg.go
+@@ -1530,6 +1530,13 @@ func isStale(p *Package) (bool, string) {
+ 		return true, "build ID mismatch"
+ 	}
+ 
++	// For OE builds, make anything in GOROOT non-stale,
++	// to prevent a package build from overwriting the
++	// build root.
++	if p.Goroot && os.Getenv("GOROOT_OVERRIDE") != "1" {
++		return false, "GOROOT-resident packages do not get rebuilt"
++	}
++
+ 	// Package is stale if a dependency is.
+ 	for _, p1 := range p.Internal.Deps {
+ 		if p1.Stale {
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch b/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
similarity index 55%
rename from meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch
rename to meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
index 4b5e424d96..f0f564044b 100644
--- a/meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch
+++ b/meta/recipes-devtools/go/go-1.9/0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
@@ -1,12 +1,23 @@
-Set GOTOOLDIR during bootstrap 
+From aae74d1045ca03306ba4159206ee3bac72bcdfbb Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Wed, 13 Sep 2017 08:23:23 -0700
+Subject: [PATCH 6/7] make.bash: add GOTOOLDIR_BOOTSTRAP environment variable
+
+For cross-canadian builds, we need to use the native
+GOTOOLDIR during the bootstrap phase, so provide a way
+to pass that setting into the build script.
 
-Signed-off-by: Matt Madison <matt@madison.systems>
 Upstream-Status: Pending
 
-Index: go/src/make.bash
-===================================================================
---- go.orig/src/make.bash
-+++ go/src/make.bash
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/make.bash | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/make.bash b/src/make.bash
+index 9553623..2e6fb05 100755
+--- a/src/make.bash
++++ b/src/make.bash
 @@ -172,10 +172,11 @@ if [ "$do_host_build" = "yes" ]; then
  	mv cmd/dist/dist "$GOTOOLDIR"/dist
  	echo
@@ -20,3 +31,6 @@ Index: go/src/make.bash
  		"$GOTOOLDIR"/go_bootstrap install -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
  	echo
  fi
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-1.8/0006-linker-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
similarity index 68%
rename from meta/recipes-devtools/go/go-1.8/0006-linker-add-soname-to-shareable-objects.patch
rename to meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
index 74e1f2459e..6459782d81 100644
--- a/meta/recipes-devtools/go/go-1.8/0006-linker-add-soname-to-shareable-objects.patch
+++ b/meta/recipes-devtools/go/go-1.9/0007-ld-add-soname-to-shareable-objects.patch
@@ -1,22 +1,24 @@
-From 81e9e322297d83f57f02548689c71859bfce10ee Mon Sep 17 00:00:00 2001
+From e957c3458d53e37bf416f51d2f8bf54c195e50f5 Mon Sep 17 00:00:00 2001
 From: Matt Madison <matt@madison.systems>
-Date: Sun, 15 Jan 2017 05:24:49 -0800
-Subject: [PATCH 6/6] linker: add soname to shareable objects
+Date: Wed, 13 Sep 2017 08:27:02 -0700
+Subject: [PATCH 7/7] ld: add soname to shareable objects
 
-Shared library handling in OE builds works better when shared
-libraries are tagged with SONAMEs.
+Shared library handling in OE depends on the inclusion
+of an soname header, so update the go linker to add that
+header for both internal and external linking.
 
 Upstream-Status: Pending
+
 Signed-off-by: Matt Madison <matt@madison.systems>
 ---
  src/cmd/link/internal/ld/lib.go | 3 +++
  1 file changed, 3 insertions(+)
 
 diff --git a/src/cmd/link/internal/ld/lib.go b/src/cmd/link/internal/ld/lib.go
-index 74d79d3..6d03005 100644
+index 0234105..0b9e2d0 100644
 --- a/src/cmd/link/internal/ld/lib.go
 +++ b/src/cmd/link/internal/ld/lib.go
-@@ -1040,12 +1040,14 @@ func (l *Link) hostlink() {
+@@ -1124,12 +1124,14 @@ func (l *Link) hostlink() {
  			// Pass -z nodelete to mark the shared library as
  			// non-closeable: a dlclose will do nothing.
  			argv = append(argv, "-shared", "-Wl,-z,nodelete")
@@ -29,9 +31,9 @@ index 74d79d3..6d03005 100644
  		argv = append(argv, "-shared")
 +		argv = append(argv, fmt.Sprintf("-Wl,-soname,%s", filepath.Base(*flagOutfile)))
  	case BuildmodePlugin:
- 		if Headtype == obj.Hdarwin {
+ 		if Headtype == objabi.Hdarwin {
  			argv = append(argv, "-dynamiclib")
-@@ -1054,6 +1056,7 @@ func (l *Link) hostlink() {
+@@ -1138,6 +1140,7 @@ func (l *Link) hostlink() {
  				argv = append(argv, "-Wl,-z,relro")
  			}
  			argv = append(argv, "-shared")
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index f0315d558a..0068f34d04 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -52,6 +52,7 @@ do_install() {
 	(cd ${S}/src; for d in *; do \
 		[ -d $d ] && cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
 	done)
+	rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
 	install -d ${D}${bindir} ${D}${libdir}/go/bin
 	for f in ${B}/bin/*
 	do
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross-canadian_1.8.bb
rename to meta/recipes-devtools/go/go-cross-canadian_1.9.bb
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index d18d9613ff..234528ab98 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -49,7 +49,7 @@ do_install() {
     (cd ${S}/src; for d in *; do \
         [ ! -d $d ] || cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
     done)
-
+    rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
     install -d ${D}${bindir} ${D}${libdir}/go/bin
     for f in ${B}/bin/*
     do
diff --git a/meta/recipes-devtools/go/go-cross_1.8.bb b/meta/recipes-devtools/go/go-cross_1.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-cross_1.8.bb
rename to meta/recipes-devtools/go/go-cross_1.9.bb
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-crosssdk_1.8.bb
rename to meta/recipes-devtools/go/go-crosssdk_1.9.bb
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index 9eb2b3211f..66b845c633 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -51,7 +51,7 @@ do_install() {
 	(cd ${S}/src; for d in *; do \
 		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
 	done)
-
+	rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
 	install -d ${D}${bindir} ${D}${libdir}/go/bin
 	for f in ${B}/bin/*
 	do
diff --git a/meta/recipes-devtools/go/go-native_1.8.bb b/meta/recipes-devtools/go/go-native_1.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-native_1.8.bb
rename to meta/recipes-devtools/go/go-native_1.9.bb
diff --git a/meta/recipes-devtools/go/go-runtime_1.8.bb b/meta/recipes-devtools/go/go-runtime_1.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go-runtime_1.8.bb
rename to meta/recipes-devtools/go/go-runtime_1.9.bb
diff --git a/meta/recipes-devtools/go/go_1.8.bb b/meta/recipes-devtools/go/go_1.9.bb
similarity index 100%
rename from meta/recipes-devtools/go/go_1.8.bb
rename to meta/recipes-devtools/go/go_1.9.bb
-- 
2.14.1


