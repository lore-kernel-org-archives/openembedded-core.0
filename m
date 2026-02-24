Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A00F357DF
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:12 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21679.1771943588453145166
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kF8Ll9kz;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4362197d174so3579310f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943587; x=1772548387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kWtHwzmtvB1+AxR8gnPCaQsHincClg2l4KEuwzqiId4=;
        b=kF8Ll9kzOLduAtbAI2NHwoskDIV4l81AihRYUEMxfFKFpZgHOmGfZYYVaY+lx3W+fQ
         IUXDHwqvqRtEX0+0cNySqiKXkUPQogSN2wyF4JF3hrXuw1Ao0dYfMhnchb5MqaKEek5F
         PNEItjHE4vA1PNtyhEXzks+4Xky5QAG4hoyQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943587; x=1772548387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kWtHwzmtvB1+AxR8gnPCaQsHincClg2l4KEuwzqiId4=;
        b=CYcWl8YQFsF1tStkuoqvYgUDb/70p4ELhW4tipHIbgTU2sI06rYIxNwWYactiSQ0qS
         6llbKayoDiZTtZ+6XjU06UIzoLEjka3uEbibyZQDis+yPd0FXWvHCnocPDag2DeNcTMr
         JaKeRjIM0mDM7/kRTzzPeAFk/gIoBD0jHNXg/328aAkK/l7Pui55g8SYHVZf7MHPr1Fa
         MjlXtPWAqA6ILuoQ14Ep5UW1Ul0d/DuT12Jkq3kazrNdkNcEtg9VriUOUywJ2HijX1M2
         bR4/EqMNeii3AVgp7WddtJbo1D0pSc/b2/wI2rWZ6meibwk3knsYHdKtKSzSZs+c2vXQ
         iBgw==
X-Gm-Message-State: AOJu0YwFaV+8Ec4uHHlsb38fqYCXP2kT1LduhxJjgzIGgvYyF06iAMBy
	d27/KvMcpHVNu45uuJEHSTaj5RhhZiptNuOi97lhlkJYsIUhRp6aRAzf7Rmd11gIRCNIHRvHk8y
	yBTF1
X-Gm-Gg: AZuq6aICjqRAG3Wyox6cEPY0L92ITz41BZBRQTOEZsYbThEIFigJXtPzB1IQOxjlBEq
	skaSg6FsL5/e1tAVsg4St7Vlxk53nsFPMHSBJdNVeTJdNw+sA+rDRqQC7qlQNZTuz8cHd46AqEn
	yR50L1tn3aKMrX2udUuLLDi3OeUkHHeyJm1TrXkTZyUB7nL7JsfO7pN/I3T2jSNyc9L0XU4fyEA
	KrKvlLl98m8KoFZ7Yv1XREOxdN7z5g1abCbkmPhyJru/IHwjiHnI027TGfjNNqUURUdomf1wBeF
	lnJ+mpYIiEKFkPPl8H8as7L43qcoIIrip6flxy5F+EhYDIAB42GkD3jm5cYyKVwpXcQ9+mQ16/J
	btEPYz4lm3EP1SRUfM4RI03Yiao99hZE6/lg2ZUCRhnl4+iHzACxptHhSyzWflUXVMq8V7MPvpU
	Tlnfhh7xqxbWuBc1wBHKrzxbTamXoG8krZ506azLqjqZXS+/EahignHZTE0fcfn7bptXYaPcvwG
	NvDOCCN4lepmgOxGO3pDBLfQ1b+xsgFNQ==
X-Received: by 2002:a05:600c:6206:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-483a95b71b5mr227455325e9.13.1771943585716;
        Tue, 24 Feb 2026 06:33:05 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:05 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 24/44] go 1.22.12: Fix CVE-2025-68119
Date: Tue, 24 Feb 2026 15:31:52 +0100
Message-ID: <d32125f332022084813d5fafd193b1ee84e4f9b7.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231832

From: Deepak Rathore <deeratho@cisco.com>

Upstream Repository: https://github.com/golang/go.git

Bug details: https://nvd.nist.gov/vuln/detail/CVE-2025-68119
Type: Security Fix
CVE: CVE-2025-68119
Score: 7.0
Patch:
[1] https://github.com/golang/go/commit/62452bed4801
[2] https://github.com/golang/go/commit/73fe85f0ea1b

Note:
- First commit [1] is a dependent patch which is required additionally
  in original fix [2] to define ENV variable changes in
  src/cmd/go/internal/vcs/vcs.go file.

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
 .../go/go/CVE-2025-68119-dependent.patch      | 175 ++++
 .../go/go/CVE-2025-68119.patch                | 828 ++++++++++++++++++
 3 files changed, 1005 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68119-dependent.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-68119.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 82019f25dd7..ca0f05f7c86 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -35,6 +35,8 @@ SRC_URI += "\
     file://CVE-2025-61726.patch \
     file://CVE-2025-61728.patch \
     file://CVE-2025-61731.patch \
+    file://CVE-2025-68119-dependent.patch \
+    file://CVE-2025-68119.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-68119-dependent.patch b/meta/recipes-devtools/go/go/CVE-2025-68119-dependent.patch
new file mode 100644
index 00000000000..5875d129ccc
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-68119-dependent.patch
@@ -0,0 +1,175 @@
+From 121b6cb231b5d904c03739495fcda69152d83f88 Mon Sep 17 00:00:00 2001
+From: Matt Harbison <mharbison72@gmail.com>
+Date: Sat, 3 Aug 2024 00:06:30 +0000
+Subject: [PATCH] cmd/go: fix the accuracy of Mercurial vcs.* stamped data
+
+There were a few Mercurial command line uses that could cause the wrong
+data to be used:
+
+* The log command needs '-r.' to specify the currently checked out commit
+* HGPLAIN is needed to disable optional output on commands
+* '-S' is needed to for the 'status' command to recurse into any subrepos
+
+The most likely issue to be seen here was the use of '-l1' instead of
+'-r.', which prints the most recent commit instead of the current checkout.
+Since tagging in Mercurial creates a new commit, this basically means the
+data was wrong for every tagged build.
+
+This also adds an hgrc config file to the test, with config options to
+keep the time and author values fixed.  It's what's used in the Mercurial
+test harness to keep the commit hashes stable, and allows the tests here to
+also match the time and the revision ID, to prevent regressing.
+
+Fixes #63532
+
+CVE: CVE-2025-68119
+Upstream-Status: Backport [https://github.com/golang/go/commit/62452bed4801]
+
+Change-Id: I5b9971ce87c83431ec77e4a002bdc33fcf393856
+GitHub-Last-Rev: 62c9db0a28fee5881d0fe49f7bbb6e1653c7ff60
+GitHub-Pull-Request: golang/go#63557
+Reviewed-on: https://go-review.googlesource.com/c/go/+/535377
+Reviewed-by: Bryan Mills <bcmills@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Sam Thanawalla <samthanawalla@google.com>
+Auto-Submit: Sam Thanawalla <samthanawalla@google.com>
+Reviewed-by: Michael Matloob <matloob@golang.org>
+(cherry picked from commit 62452bed480108623910feace4a5cea5448e6822)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/cmd/go/internal/vcs/vcs.go                | 13 +++++--
+ .../testdata/script/version_buildvcs_hg.txt   | 39 ++++++++++++++++---
+ 2 files changed, 43 insertions(+), 9 deletions(-)
+
+diff --git a/src/cmd/go/internal/vcs/vcs.go b/src/cmd/go/internal/vcs/vcs.go
+index 89d9f0e94e..60f76d77cf 100644
+--- a/src/cmd/go/internal/vcs/vcs.go
++++ b/src/cmd/go/internal/vcs/vcs.go
+@@ -37,6 +37,7 @@ import (
+ type Cmd struct {
+	Name      string
+	Cmd       string     // name of binary to invoke command
++	Env       []string   // any environment values to set/override
+	RootNames []rootName // filename and mode indicating the root of a checkout directory
+
+	CreateCmd   []string // commands to download a fresh copy of a repository
+@@ -154,6 +155,10 @@ func vcsByCmd(cmd string) *Cmd {
+ var vcsHg = &Cmd{
+	Name: "Mercurial",
+	Cmd:  "hg",
++
++	// HGPLAIN=1 turns off additional output that a user may have enabled via
++	// config options or certain extensions.
++	Env: []string{"HGPLAIN=1"},
+	RootNames: []rootName{
+		{filename: ".hg", isDir: true},
+	},
+@@ -189,12 +194,11 @@ func hgRemoteRepo(vcsHg *Cmd, rootDir string) (remoteRepo string, err error) {
+
+ func hgStatus(vcsHg *Cmd, rootDir string) (Status, error) {
+	// Output changeset ID and seconds since epoch.
+-	out, err := vcsHg.runOutputVerboseOnly(rootDir, `log -l1 -T {node}:{date|hgdate}`)
++	out, err := vcsHg.runOutputVerboseOnly(rootDir, `log -r. -T {node}:{date|hgdate}`)
+	if err != nil {
+		return Status{}, err
+	}
+
+-	// Successful execution without output indicates an empty repo (no commits).
+	var rev string
+	var commitTime time.Time
+	if len(out) > 0 {
+@@ -209,7 +213,7 @@ func hgStatus(vcsHg *Cmd, rootDir string) (Status, error) {
+	}
+
+	// Also look for untracked files.
+-	out, err = vcsHg.runOutputVerboseOnly(rootDir, "status")
++	out, err = vcsHg.runOutputVerboseOnly(rootDir, "status -S")
+	if err != nil {
+		return Status{}, err
+	}
+@@ -689,6 +693,9 @@ func (v *Cmd) run1(dir string, cmdline string, keyval []string, verbose bool) ([
+
+	cmd := exec.Command(v.Cmd, args...)
+	cmd.Dir = dir
++	if v.Env != nil {
++		cmd.Env = append(cmd.Environ(), v.Env...)
++	}
+	if cfg.BuildX {
+		fmt.Fprintf(os.Stderr, "cd %s\n", dir)
+		fmt.Fprintf(os.Stderr, "%s %s\n", v.Cmd, strings.Join(args, " "))
+diff --git a/src/cmd/go/testdata/script/version_buildvcs_hg.txt b/src/cmd/go/testdata/script/version_buildvcs_hg.txt
+index fbbd886102..13904fae12 100644
+--- a/src/cmd/go/testdata/script/version_buildvcs_hg.txt
++++ b/src/cmd/go/testdata/script/version_buildvcs_hg.txt
+@@ -6,6 +6,8 @@
+ [short] skip
+ env GOBIN=$WORK/gopath/bin
+ env oldpath=$PATH
++env TZ=GMT
++env HGRCPATH=$WORK/hgrc
+ cd repo/a
+
+ # If there's no local repository, there's no VCS info.
+@@ -29,24 +31,43 @@ cd ..
+ env PATH=$oldpath
+ rm .hg
+
+-# If there is an empty repository in a parent directory, only "uncommitted" is tagged.
++# An empty repository or one explicitly updated to null uses the null cset ID,
++# and the time is hard set to 1/1/70, regardless of the current time.
+ exec hg init
+ cd a
+ go install
+ go version -m $GOBIN/a$GOEXE
+-! stdout vcs.revision
+-! stdout vcs.time
++stdout '^\tbuild\tvcs.revision=0000000000000000000000000000000000000000$'
++stdout '^\tbuild\tvcs.time=1970-01-01T00:00:00Z$'
+ stdout '^\tbuild\tvcs.modified=true$'
+ cd ..
+
+ # Revision and commit time are tagged for repositories with commits.
+ exec hg add a README
+-exec hg commit -m 'initial commit'
++exec hg commit -m 'initial commit' --user test-user --date '2024-07-31T01:21:27+00:00'
+ cd a
+ go install
+ go version -m $GOBIN/a$GOEXE
+-stdout '^\tbuild\tvcs.revision='
+-stdout '^\tbuild\tvcs.time='
++stdout '^\tbuild\tvcs.revision=71eaed52daeaafea83cb604f75b0a0336ef2c345$'
++stdout '^\tbuild\tvcs.time=2024-07-31T01:21:27Z$'
++stdout '^\tbuild\tvcs.modified=false$'
++rm $GOBIN/a$GOEXE
++
++# Add an extra commit and then back off of it to show that the hash is
++# from the checked out revision, not the tip revision.
++cp ../../outside/empty.txt .
++exec hg ci -Am 'another commit' --user test-user --date '2024-08-01T19:24:38+00:00'
++exec hg update --clean -r '.^'
++
++# Modified state is not thrown off by extra status output
++exec hg bisect -v -g .
++exec hg bisect -v -b '.^^'
++exec hg status
++stdout '^.+'
++go install
++go version -m $GOBIN/a$GOEXE
++stdout '^\tbuild\tvcs.revision=71eaed52daeaafea83cb604f75b0a0336ef2c345$'
++stdout '^\tbuild\tvcs.time=2024-07-31T01:21:27Z$'
+ stdout '^\tbuild\tvcs.modified=false$'
+ rm $GOBIN/a$GOEXE
+
+@@ -88,4 +109,10 @@ go 1.18
+ package main
+
+ func main() {}
++-- $WORK/hgrc --
++[ui]
++# tweakdefaults is an opt-in that may print extra output in commands like
++# status.  That can be disabled by setting HGPLAIN=1.
++tweakdefaults = 1
++
+ -- outside/empty.txt --
+--
+2.35.6
diff --git a/meta/recipes-devtools/go/go/CVE-2025-68119.patch b/meta/recipes-devtools/go/go/CVE-2025-68119.patch
new file mode 100644
index 00000000000..d3f17244536
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-68119.patch
@@ -0,0 +1,828 @@
+From 204e2fdacfbdb72a0b85fb526c8599128e430e94 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <bracewell@google.com>
+Date: Wed, 10 Dec 2025 08:13:07 -0500
+Subject: [PATCH] [release-branch.go1.24] cmd/go: update VCS commands to use
+ safer flag/argument syntax
+
+In various situations, the toolchain invokes VCS commands. Some of these
+commands take arbitrary input, either provided by users or fetched from
+external sources. To prevent potential command injection vulnerabilities
+or misinterpretation of arguments as flags, this change updates the VCS
+commands to use various techniques to separate flags from positional
+arguments, and to directly associate flags with their values.
+
+Additionally, we update the environment variable for Mercurial to use
+`HGPLAIN=+strictflags`, which is the more explicit way to disable user
+configurations (intended or otherwise) that might interfere with command
+execution.
+
+We also now disallow version strings from being prefixed with '-' or
+'/', as doing so opens us up to making the same mistake again in the
+future. As far as we know there are currently ~0 public modules affected
+by this.
+
+While I was working on cmd/go/internal/vcs, I also noticed that a
+significant portion of the commands being implemented were dead code.
+In order to reduce the maintenance burden and surface area for potential
+issues, I removed the dead code for unused commands.
+
+We should probably follow up with a more structured change to make it
+harder to accidentally re-introduce these issues in the future, but for
+now this addresses the issue at hand.
+
+Thanks to splitline (@splitline) from DEVCORE Research Team for
+reporting this issue.
+
+Fixes CVE-2025-68119
+Updates #77099
+Fixes #77103
+
+CVE: CVE-2025-68119
+Upstream-Status: Backport [https://github.com/golang/go/commit/73fe85f0ea1b]
+
+Backport Changes:
+- In file src/cmd/go/internal/modfetch/codehost/git.go, Replaced the
+  function call runGIT with RUN. This changes is not present in current
+  version v1.22.12 and this changes were introduced in version v1.24 by
+  this commit https://github.com/golang/go/commit/8aa2eed8fb90
+
+Change-Id: I9d9f4ee05b95be49fe14edf71a1b8e6c0784378e
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/3260
+Reviewed-by: Damien Neil <dneil@google.com>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/736710
+Auto-Submit: Michael Pratt <mpratt@google.com>
+Reviewed-by: Junyang Shao <shaojunyang@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+(cherry picked from commit 94a1296a457387d1fd6eca1a9bcd44e89bdd9d55)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/739421
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+(cherry picked from commit 73fe85f0ea1bf2cec8e9a89bf5645de06ecaa0a6)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ src/cmd/go/internal/modcmd/edit.go           |  10 +-
+ src/cmd/go/internal/modfetch/codehost/git.go |  20 +-
+ src/cmd/go/internal/modfetch/codehost/vcs.go |  20 +-
+ src/cmd/go/internal/modget/query.go          |   5 +-
+ src/cmd/go/internal/modload/build.go         |  12 +-
+ src/cmd/go/internal/modload/list.go          |  30 +-
+ src/cmd/go/internal/toolchain/select.go      |   7 +-
+ src/cmd/go/internal/vcs/vcs.go               | 331 +------------------
+ src/cmd/go/internal/workcmd/edit.go          |   5 +-
+ 9 files changed, 96 insertions(+), 344 deletions(-)
+
+diff --git a/src/cmd/go/internal/modcmd/edit.go b/src/cmd/go/internal/modcmd/edit.go
+index db131b0881..330603fe32 100644
+--- a/src/cmd/go/internal/modcmd/edit.go
++++ b/src/cmd/go/internal/modcmd/edit.go
+@@ -284,7 +284,10 @@ func runEdit(ctx context.Context, cmd *base.Command, args []string) {
+
+ // parsePathVersion parses -flag=arg expecting arg to be path@version.
+ func parsePathVersion(flag, arg string) (path, version string) {
+-	before, after, found := strings.Cut(arg, "@")
++	before, after, found, err := modload.ParsePathVersion(arg)
++	if err != nil {
++		base.Fatalf("go: -%s=%s: %v", flag, arg, err)
++	}
+	if !found {
+		base.Fatalf("go: -%s=%s: need path@version", flag, arg)
+	}
+@@ -318,7 +321,10 @@ func parsePathVersionOptional(adj, arg string, allowDirPath bool) (path, version
+	if allowDirPath && modfile.IsDirectoryPath(arg) {
+		return arg, "", nil
+	}
+-	before, after, found := strings.Cut(arg, "@")
++	before, after, found, err := modload.ParsePathVersion(arg)
++	if err != nil {
++		return "", "", err
++	}
+	if !found {
+		path = arg
+	} else {
+diff --git a/src/cmd/go/internal/modfetch/codehost/git.go b/src/cmd/go/internal/modfetch/codehost/git.go
+index 9996be7af7..45727ae3fb 100644
+--- a/src/cmd/go/internal/modfetch/codehost/git.go
++++ b/src/cmd/go/internal/modfetch/codehost/git.go
+@@ -246,7 +246,7 @@ func (r *gitRepo) loadRefs(ctx context.Context) (map[string]string, error) {
+			r.refsErr = err
+			return
+		}
+-		out, gitErr := Run(ctx, r.dir, "git", "ls-remote", "-q", r.remote)
++		out, gitErr := Run(ctx, r.dir, "git", "ls-remote", "-q","--end-of-options", r.remote)
+		release()
+
+		if gitErr != nil {
+@@ -509,7 +509,7 @@ func (r *gitRepo) stat(ctx context.Context, rev string) (info *RevInfo, err erro
+			if fromTag && !slices.Contains(info.Tags, tag) {
+				// The local repo includes the commit hash we want, but it is missing
+				// the corresponding tag. Add that tag and try again.
+-				_, err := Run(ctx, r.dir, "git", "tag", tag, hash)
++				_, err := Run(ctx, r.dir, "git", "tag","--end-of-options", tag, hash)
+				if err != nil {
+					return nil, err
+				}
+@@ -554,7 +554,7 @@ func (r *gitRepo) stat(ctx context.Context, rev string) (info *RevInfo, err erro
+		// an apparent Git bug introduced in Git 2.21 (commit 61c771),
+		// which causes the handler for protocol version 1 to sometimes miss
+		// tags that point to the requested commit (see https://go.dev/issue/56881).
+-		_, err = Run(ctx, r.dir, "git", "-c", "protocol.version=2", "fetch", "-f", "--depth=1", r.remote, refspec)
++		_, err = Run(ctx, r.dir, "git", "-c", "protocol.version=2", "fetch", "-f", "--depth=1","--end-of-options", r.remote, refspec)
+		release()
+
+		if err == nil {
+@@ -597,12 +597,12 @@ func (r *gitRepo) fetchRefsLocked(ctx context.Context) error {
+		}
+		defer release()
+
+-		if _, err := Run(ctx, r.dir, "git", "fetch", "-f", r.remote, "refs/heads/*:refs/heads/*", "refs/tags/*:refs/tags/*"); err != nil {
++		if _, err := Run(ctx, r.dir, "git", "fetch", "-f","--end-of-options", r.remote, "refs/heads/*:refs/heads/*", "refs/tags/*:refs/tags/*"); err != nil {
+			return err
+		}
+
+		if _, err := os.Stat(filepath.Join(r.dir, "shallow")); err == nil {
+-			if _, err := Run(ctx, r.dir, "git", "fetch", "--unshallow", "-f", r.remote); err != nil {
++			if _, err := Run(ctx, r.dir, "git", "fetch", "--unshallow", "-f", "--end-of-options",r.remote); err != nil {
+				return err
+			}
+		}
+@@ -615,7 +615,7 @@ func (r *gitRepo) fetchRefsLocked(ctx context.Context) error {
+ // statLocal returns a new RevInfo describing rev in the local git repository.
+ // It uses version as info.Version.
+ func (r *gitRepo) statLocal(ctx context.Context, version, rev string) (*RevInfo, error) {
+-	out, err := Run(ctx, r.dir, "git", "-c", "log.showsignature=false", "log", "--no-decorate", "-n1", "--format=format:%H %ct %D", rev, "--")
++	out, err := Run(ctx, r.dir, "git", "-c", "log.showsignature=false", "log", "--no-decorate", "-n1", "--format=format:%H %ct %D","--end-of-options",  rev, "--")
+	if err != nil {
+		// Return info with Origin.RepoSum if possible to allow caching of negative lookup.
+		var info *RevInfo
+@@ -705,7 +705,7 @@ func (r *gitRepo) ReadFile(ctx context.Context, rev, file string, maxSize int64)
+	if err != nil {
+		return nil, err
+	}
+-	out, err := Run(ctx, r.dir, "git", "cat-file", "blob", info.Name+":"+file)
++	out, err := Run(ctx, r.dir, "git", "cat-file","--end-of-options", "blob", info.Name+":"+file)
+	if err != nil {
+		return nil, fs.ErrNotExist
+	}
+@@ -723,7 +723,7 @@ func (r *gitRepo) RecentTag(ctx context.Context, rev, prefix string, allowed fun
+	// result is definitive.
+	describe := func() (definitive bool) {
+		var out []byte
+-		out, err = Run(ctx, r.dir, "git", "for-each-ref", "--format", "%(refname)", "refs/tags", "--merged", rev)
++		out, err = Run(ctx, r.dir, "git", "for-each-ref", "--format=%(refname)", "--merged="+rev)
+		if err != nil {
+			return true
+		}
+@@ -865,7 +865,7 @@ func (r *gitRepo) ReadZip(ctx context.Context, rev, subdir string, maxSize int64
+	// TODO: Use maxSize or drop it.
+	args := []string{}
+	if subdir != "" {
+-		args = append(args, "--", subdir)
++		args = append(args, subdir)
+	}
+	info, err := r.Stat(ctx, rev) // download rev into local git repo
+	if err != nil {
+@@ -887,7 +887,7 @@ func (r *gitRepo) ReadZip(ctx context.Context, rev, subdir string, maxSize int64
+	// text file line endings. Setting -c core.autocrlf=input means only
+	// translate files on the way into the repo, not on the way out (archive).
+	// The -c core.eol=lf should be unnecessary but set it anyway.
+-	archive, err := Run(ctx, r.dir, "git", "-c", "core.autocrlf=input", "-c", "core.eol=lf", "archive", "--format=zip", "--prefix=prefix/", info.Name, args)
++	archive, err := Run(ctx, r.dir, "git", "-c", "core.autocrlf=input", "-c", "core.eol=lf", "archive", "--format=zip", "--prefix=prefix/", "--end-of-options", info.Name, args)
+	if err != nil {
+		if bytes.Contains(err.(*RunError).Stderr, []byte("did not match any files")) {
+			return nil, fs.ErrNotExist
+diff --git a/src/cmd/go/internal/modfetch/codehost/vcs.go b/src/cmd/go/internal/modfetch/codehost/vcs.go
+index 5bd100556b..425f61269f 100644
+--- a/src/cmd/go/internal/modfetch/codehost/vcs.go
++++ b/src/cmd/go/internal/modfetch/codehost/vcs.go
+@@ -162,20 +162,20 @@ var vcsCmds = map[string]*vcsCmd{
+		branchRE:      re(`(?m)^[^\n]+$`),
+		badLocalRevRE: re(`(?m)^(tip)$`),
+		statLocal: func(rev, remote string) []string {
+-			return []string{"hg", "log", "-l1", "-r", rev, "--template", "{node} {date|hgdate} {tags}"}
++			return []string{"hg", "log", "-l1", fmt.Sprintf("--rev=%s", rev), "--template", "{node} {date|hgdate} {tags}"}
+		},
+		parseStat: hgParseStat,
+		fetch:     []string{"hg", "pull", "-f"},
+		latest:    "tip",
+		readFile: func(rev, file, remote string) []string {
+-			return []string{"hg", "cat", "-r", rev, file}
++			return []string{"hg", "cat", fmt.Sprintf("--rev=%s", rev), "--", file}
+		},
+		readZip: func(rev, subdir, remote, target string) []string {
+			pattern := []string{}
+			if subdir != "" {
+-				pattern = []string{"-I", subdir + "/**"}
++				pattern = []string{fmt.Sprintf("--include=%s", subdir+"/**")}
+			}
+-			return str.StringList("hg", "archive", "-t", "zip", "--no-decode", "-r", rev, "--prefix=prefix/", pattern, "--", target)
++			return str.StringList("hg", "archive", "-t", "zip", "--no-decode", fmt.Sprintf("--rev=%s", rev), "--prefix=prefix/", pattern, "--", target)
+		},
+	},
+
+@@ -215,19 +215,19 @@ var vcsCmds = map[string]*vcsCmd{
+		tagRE:         re(`(?m)^\S+`),
+		badLocalRevRE: re(`^revno:-`),
+		statLocal: func(rev, remote string) []string {
+-			return []string{"bzr", "log", "-l1", "--long", "--show-ids", "-r", rev}
++			return []string{"bzr", "log", "-l1", "--long", "--show-ids", fmt.Sprintf("--revision=%s", rev)}
+		},
+		parseStat: bzrParseStat,
+		latest:    "revno:-1",
+		readFile: func(rev, file, remote string) []string {
+-			return []string{"bzr", "cat", "-r", rev, file}
++			return []string{"bzr", "cat", fmt.Sprintf("--revision=%s", rev), "--", file}
+		},
+		readZip: func(rev, subdir, remote, target string) []string {
+			extra := []string{}
+			if subdir != "" {
+				extra = []string{"./" + subdir}
+			}
+-			return str.StringList("bzr", "export", "--format=zip", "-r", rev, "--root=prefix/", "--", target, extra)
++			return str.StringList("bzr", "export", "--format=zip", fmt.Sprintf("--revision=%s", rev), "--root=prefix/", "--", target, extra)
+		},
+	},
+
+@@ -242,17 +242,17 @@ var vcsCmds = map[string]*vcsCmd{
+		},
+		tagRE: re(`XXXTODO`),
+		statLocal: func(rev, remote string) []string {
+-			return []string{"fossil", "info", "-R", ".fossil", rev}
++			return []string{"fossil", "info", "-R", ".fossil", "--", rev}
+		},
+		parseStat: fossilParseStat,
+		latest:    "trunk",
+		readFile: func(rev, file, remote string) []string {
+-			return []string{"fossil", "cat", "-R", ".fossil", "-r", rev, file}
++			return []string{"fossil", "cat", "-R", ".fossil", fmt.Sprintf("-r=%s", rev), "--", file}
+		},
+		readZip: func(rev, subdir, remote, target string) []string {
+			extra := []string{}
+			if subdir != "" && !strings.ContainsAny(subdir, "*?[],") {
+-				extra = []string{"--include", subdir}
++				extra = []string{fmt.Sprintf("--include=%s", subdir)}
+			}
+			// Note that vcsRepo.ReadZip below rewrites this command
+			// to run in a different directory, to work around a fossil bug.
+diff --git a/src/cmd/go/internal/modget/query.go b/src/cmd/go/internal/modget/query.go
+index 498ba6c2ff..0d33a52677 100644
+--- a/src/cmd/go/internal/modget/query.go
++++ b/src/cmd/go/internal/modget/query.go
+@@ -139,7 +139,10 @@ func errSet(err error) pathSet { return pathSet{err: err} }
+ // newQuery returns a new query parsed from the raw argument,
+ // which must be either path or path@version.
+ func newQuery(raw string) (*query, error) {
+-	pattern, rawVers, found := strings.Cut(raw, "@")
++	pattern, rawVers, found, err := modload.ParsePathVersion(raw)
++	if err != nil {
++		return nil, err
++	}
+	if found && (strings.Contains(rawVers, "@") || rawVers == "") {
+		return nil, fmt.Errorf("invalid module version syntax %q", raw)
+	}
+diff --git a/src/cmd/go/internal/modload/build.go b/src/cmd/go/internal/modload/build.go
+index 5cf1487c3e..08acf3aa2b 100644
+--- a/src/cmd/go/internal/modload/build.go
++++ b/src/cmd/go/internal/modload/build.go
+@@ -12,7 +12,6 @@ import (
+	"io/fs"
+	"os"
+	"path/filepath"
+-	"strings"
+
+	"cmd/go/internal/base"
+	"cmd/go/internal/cfg"
+@@ -88,7 +87,16 @@ func ModuleInfo(ctx context.Context, path string) *modinfo.ModulePublic {
+		return nil
+	}
+
+-	if path, vers, found := strings.Cut(path, "@"); found {
++	path, vers, found, err := ParsePathVersion(path)
++	if err != nil {
++		return &modinfo.ModulePublic{
++			Path: path,
++			Error: &modinfo.ModuleError{
++				Err: err.Error(),
++			},
++		}
++	}
++	if found {
+		m := module.Version{Path: path, Version: vers}
+		return moduleInfo(ctx, nil, m, 0, nil)
+	}
+diff --git a/src/cmd/go/internal/modload/list.go b/src/cmd/go/internal/modload/list.go
+index ef93c25121..e9efb1918e 100644
+--- a/src/cmd/go/internal/modload/list.go
++++ b/src/cmd/go/internal/modload/list.go
+@@ -149,7 +149,11 @@ func listModules(ctx context.Context, rs *Requirements, args []string, mode List
+			}
+			continue
+		}
+-		if path, vers, found := strings.Cut(arg, "@"); found {
++		path, vers, found, err := ParsePathVersion(arg)
++		if err != nil {
++			base.Fatalf("go: %v", err)
++		}
++		if found {
+			if vers == "upgrade" || vers == "patch" {
+				if _, ok := rs.rootSelected(path); !ok || rs.pruning == unpruned {
+					needFullGraph = true
+@@ -175,7 +179,11 @@ func listModules(ctx context.Context, rs *Requirements, args []string, mode List
+
+	matchedModule := map[module.Version]bool{}
+	for _, arg := range args {
+-		if path, vers, found := strings.Cut(arg, "@"); found {
++		path, vers, found, err := ParsePathVersion(arg)
++		if err != nil {
++			base.Fatalf("go: %v", err)
++		}
++		if found {
+			var current string
+			if mg == nil {
+				current, _ = rs.rootSelected(path)
+@@ -308,3 +316,21 @@ func modinfoError(path, vers string, err error) *modinfo.ModuleError {
+
+	return &modinfo.ModuleError{Err: err.Error()}
+ }
++
++// ParsePathVersion parses arg expecting arg to be path@version. If there is no
++// '@' in arg, found is false, vers is "", and path is arg. This mirrors the
++// typical usage of strings.Cut. ParsePathVersion is meant to be a general
++// replacement for strings.Cut in module version parsing. If the version is
++// invalid, an error is returned. The version is considered invalid if it is
++// prefixed with '-' or '/', which can cause security problems when constructing
++// commands to execute that use the version.
++func ParsePathVersion(arg string) (path, vers string, found bool, err error) {
++	path, vers, found = strings.Cut(arg, "@")
++	if !found {
++		return arg, "", false, nil
++	}
++	if len(vers) > 0 && (vers[0] == '-' || vers[0] == '/') {
++		return "", "", false, fmt.Errorf("invalid module version %q", vers)
++	}
++	return path, vers, true, nil
++}
+diff --git a/src/cmd/go/internal/toolchain/select.go b/src/cmd/go/internal/toolchain/select.go
+index 14a8d3c21d..838ebae6a7 100644
+--- a/src/cmd/go/internal/toolchain/select.go
++++ b/src/cmd/go/internal/toolchain/select.go
+@@ -614,7 +614,10 @@ func goInstallVersion() bool {
+	if !strings.Contains(pkgArg, "@") || build.IsLocalImport(pkgArg) || filepath.IsAbs(pkgArg) {
+		return false
+	}
+-	path, version, _ := strings.Cut(pkgArg, "@")
++	path, version, _, err := modload.ParsePathVersion(pkgArg)
++	if err != nil {
++		base.Fatalf("go: %v", err)
++	}
+	if path == "" || version == "" || gover.IsToolchain(path) {
+		return false
+	}
+@@ -650,7 +653,7 @@ func goInstallVersion() bool {
+		allowed = nil
+	}
+	noneSelected := func(path string) (version string) { return "none" }
+-	_, err := modload.QueryPackages(ctx, path, version, noneSelected, allowed)
++	_, err = modload.QueryPackages(ctx, path, version, noneSelected, allowed)
+	if errors.Is(err, gover.ErrTooNew) {
+		// Run early switch, same one go install or go run would eventually do,
+		// if it understood all the command-line flags.
+diff --git a/src/cmd/go/internal/vcs/vcs.go b/src/cmd/go/internal/vcs/vcs.go
+index 60f76d77cf..55bf25ff62 100644
+--- a/src/cmd/go/internal/vcs/vcs.go
++++ b/src/cmd/go/internal/vcs/vcs.go
+@@ -17,7 +17,6 @@ import (
+	"os"
+	"os/exec"
+	"path/filepath"
+-	"regexp"
+	"strconv"
+	"strings"
+	"sync"
+@@ -40,20 +39,10 @@ type Cmd struct {
+	Env       []string   // any environment values to set/override
+	RootNames []rootName // filename and mode indicating the root of a checkout directory
+
+-	CreateCmd   []string // commands to download a fresh copy of a repository
+-	DownloadCmd []string // commands to download updates into an existing repository
+-
+-	TagCmd         []tagCmd // commands to list tags
+-	TagLookupCmd   []tagCmd // commands to lookup tags before running tagSyncCmd
+-	TagSyncCmd     []string // commands to sync to specific tag
+-	TagSyncDefault []string // commands to sync to default tag
+-
+	Scheme  []string
+	PingCmd string
+
+-	RemoteRepo  func(v *Cmd, rootDir string) (remoteRepo string, err error)
+-	ResolveRepo func(v *Cmd, rootDir, remoteRepo string) (realRepo string, err error)
+-	Status      func(v *Cmd, rootDir string) (Status, error)
++	Status func(v *Cmd, rootDir string) (Status, error)
+ }
+
+ // Status is the current state of a local repository.
+@@ -156,40 +145,16 @@ var vcsHg = &Cmd{
+	Name: "Mercurial",
+	Cmd:  "hg",
+
+-	// HGPLAIN=1 turns off additional output that a user may have enabled via
+-	// config options or certain extensions.
+-	Env: []string{"HGPLAIN=1"},
++	// HGPLAIN=+strictflags turns off additional output that a user may have
++	// enabled via config options or certain extensions.
++	Env: []string{"HGPLAIN=+strictflags"},
+	RootNames: []rootName{
+		{filename: ".hg", isDir: true},
+	},
+
+-	CreateCmd:   []string{"clone -U -- {repo} {dir}"},
+-	DownloadCmd: []string{"pull"},
+-
+-	// We allow both tag and branch names as 'tags'
+-	// for selecting a version. This lets people have
+-	// a go.release.r60 branch and a go1 branch
+-	// and make changes in both, without constantly
+-	// editing .hgtags.
+-	TagCmd: []tagCmd{
+-		{"tags", `^(\S+)`},
+-		{"branches", `^(\S+)`},
+-	},
+-	TagSyncCmd:     []string{"update -r {tag}"},
+-	TagSyncDefault: []string{"update default"},
+-
+-	Scheme:     []string{"https", "http", "ssh"},
+-	PingCmd:    "identify -- {scheme}://{repo}",
+-	RemoteRepo: hgRemoteRepo,
+-	Status:     hgStatus,
+-}
+-
+-func hgRemoteRepo(vcsHg *Cmd, rootDir string) (remoteRepo string, err error) {
+-	out, err := vcsHg.runOutput(rootDir, "paths default")
+-	if err != nil {
+-		return "", err
+-	}
+-	return strings.TrimSpace(string(out)), nil
++	Scheme:  []string{"https", "http", "ssh"},
++	PingCmd: "identify -- {scheme}://{repo}",
++	Status:  hgStatus,
+ }
+
+ func hgStatus(vcsHg *Cmd, rootDir string) (Status, error) {
+@@ -252,25 +217,6 @@ var vcsGit = &Cmd{
+		{filename: ".git", isDir: true},
+	},
+
+-	CreateCmd:   []string{"clone -- {repo} {dir}", "-go-internal-cd {dir} submodule update --init --recursive"},
+-	DownloadCmd: []string{"pull --ff-only", "submodule update --init --recursive"},
+-
+-	TagCmd: []tagCmd{
+-		// tags/xxx matches a git tag named xxx
+-		// origin/xxx matches a git branch named xxx on the default remote repository
+-		{"show-ref", `(?:tags|origin)/(\S+)$`},
+-	},
+-	TagLookupCmd: []tagCmd{
+-		{"show-ref tags/{tag} origin/{tag}", `((?:tags|origin)/\S+)$`},
+-	},
+-	TagSyncCmd: []string{"checkout {tag}", "submodule update --init --recursive"},
+-	// both createCmd and downloadCmd update the working dir.
+-	// No need to do more here. We used to 'checkout master'
+-	// but that doesn't work if the default branch is not named master.
+-	// DO NOT add 'checkout master' here.
+-	// See golang.org/issue/9032.
+-	TagSyncDefault: []string{"submodule update --init --recursive"},
+-
+	Scheme: []string{"git", "https", "http", "git+ssh", "ssh"},
+
+	// Leave out the '--' separator in the ls-remote command: git 2.7.4 does not
+@@ -279,54 +225,7 @@ var vcsGit = &Cmd{
+	// See golang.org/issue/33836.
+	PingCmd: "ls-remote {scheme}://{repo}",
+
+-	RemoteRepo: gitRemoteRepo,
+-	Status:     gitStatus,
+-}
+-
+-// scpSyntaxRe matches the SCP-like addresses used by Git to access
+-// repositories by SSH.
+-var scpSyntaxRe = lazyregexp.New(`^(\w+)@([\w.-]+):(.*)$`)
+-
+-func gitRemoteRepo(vcsGit *Cmd, rootDir string) (remoteRepo string, err error) {
+-	const cmd = "config remote.origin.url"
+-	outb, err := vcsGit.run1(rootDir, cmd, nil, false)
+-	if err != nil {
+-		// if it doesn't output any message, it means the config argument is correct,
+-		// but the config value itself doesn't exist
+-		if outb != nil && len(outb) == 0 {
+-			return "", errors.New("remote origin not found")
+-		}
+-		return "", err
+-	}
+-	out := strings.TrimSpace(string(outb))
+-
+-	var repoURL *urlpkg.URL
+-	if m := scpSyntaxRe.FindStringSubmatch(out); m != nil {
+-		// Match SCP-like syntax and convert it to a URL.
+-		// Eg, "git@github.com:user/repo" becomes
+-		// "ssh://git@github.com/user/repo".
+-		repoURL = &urlpkg.URL{
+-			Scheme: "ssh",
+-			User:   urlpkg.User(m[1]),
+-			Host:   m[2],
+-			Path:   m[3],
+-		}
+-	} else {
+-		repoURL, err = urlpkg.Parse(out)
+-		if err != nil {
+-			return "", err
+-		}
+-	}
+-
+-	// Iterate over insecure schemes too, because this function simply
+-	// reports the state of the repo. If we can't see insecure schemes then
+-	// we can't report the actual repo URL.
+-	for _, s := range vcsGit.Scheme {
+-		if repoURL.Scheme == s {
+-			return repoURL.String(), nil
+-		}
+-	}
+-	return "", errors.New("unable to parse output of git " + cmd)
++	Status: gitStatus,
+ }
+
+ func gitStatus(vcsGit *Cmd, rootDir string) (Status, error) {
+@@ -366,62 +265,9 @@ var vcsBzr = &Cmd{
+		{filename: ".bzr", isDir: true},
+	},
+
+-	CreateCmd: []string{"branch -- {repo} {dir}"},
+-
+-	// Without --overwrite bzr will not pull tags that changed.
+-	// Replace by --overwrite-tags after http://pad.lv/681792 goes in.
+-	DownloadCmd: []string{"pull --overwrite"},
+-
+-	TagCmd:         []tagCmd{{"tags", `^(\S+)`}},
+-	TagSyncCmd:     []string{"update -r {tag}"},
+-	TagSyncDefault: []string{"update -r revno:-1"},
+-
+-	Scheme:      []string{"https", "http", "bzr", "bzr+ssh"},
+-	PingCmd:     "info -- {scheme}://{repo}",
+-	RemoteRepo:  bzrRemoteRepo,
+-	ResolveRepo: bzrResolveRepo,
+-	Status:      bzrStatus,
+-}
+-
+-func bzrRemoteRepo(vcsBzr *Cmd, rootDir string) (remoteRepo string, err error) {
+-	outb, err := vcsBzr.runOutput(rootDir, "config parent_location")
+-	if err != nil {
+-		return "", err
+-	}
+-	return strings.TrimSpace(string(outb)), nil
+-}
+-
+-func bzrResolveRepo(vcsBzr *Cmd, rootDir, remoteRepo string) (realRepo string, err error) {
+-	outb, err := vcsBzr.runOutput(rootDir, "info "+remoteRepo)
+-	if err != nil {
+-		return "", err
+-	}
+-	out := string(outb)
+-
+-	// Expect:
+-	// ...
+-	//   (branch root|repository branch): <URL>
+-	// ...
+-
+-	found := false
+-	for _, prefix := range []string{"\n  branch root: ", "\n  repository branch: "} {
+-		i := strings.Index(out, prefix)
+-		if i >= 0 {
+-			out = out[i+len(prefix):]
+-			found = true
+-			break
+-		}
+-	}
+-	if !found {
+-		return "", fmt.Errorf("unable to parse output of bzr info")
+-	}
+-
+-	i := strings.Index(out, "\n")
+-	if i < 0 {
+-		return "", fmt.Errorf("unable to parse output of bzr info")
+-	}
+-	out = out[:i]
+-	return strings.TrimSpace(out), nil
++	Scheme:  []string{"https", "http", "bzr", "bzr+ssh"},
++	PingCmd: "info -- {scheme}://{repo}",
++	Status:  bzrStatus,
+ }
+
+ func bzrStatus(vcsBzr *Cmd, rootDir string) (Status, error) {
+@@ -489,45 +335,11 @@ var vcsSvn = &Cmd{
+		{filename: ".svn", isDir: true},
+	},
+
+-	CreateCmd:   []string{"checkout -- {repo} {dir}"},
+-	DownloadCmd: []string{"update"},
+-
+	// There is no tag command in subversion.
+	// The branch information is all in the path names.
+
+-	Scheme:     []string{"https", "http", "svn", "svn+ssh"},
+-	PingCmd:    "info -- {scheme}://{repo}",
+-	RemoteRepo: svnRemoteRepo,
+-}
+-
+-func svnRemoteRepo(vcsSvn *Cmd, rootDir string) (remoteRepo string, err error) {
+-	outb, err := vcsSvn.runOutput(rootDir, "info")
+-	if err != nil {
+-		return "", err
+-	}
+-	out := string(outb)
+-
+-	// Expect:
+-	//
+-	//	 ...
+-	// 	URL: <URL>
+-	// 	...
+-	//
+-	// Note that we're not using the Repository Root line,
+-	// because svn allows checking out subtrees.
+-	// The URL will be the URL of the subtree (what we used with 'svn co')
+-	// while the Repository Root may be a much higher parent.
+-	i := strings.Index(out, "\nURL: ")
+-	if i < 0 {
+-		return "", fmt.Errorf("unable to parse output of svn info")
+-	}
+-	out = out[i+len("\nURL: "):]
+-	i = strings.Index(out, "\n")
+-	if i < 0 {
+-		return "", fmt.Errorf("unable to parse output of svn info")
+-	}
+-	out = out[:i]
+-	return strings.TrimSpace(out), nil
++	Scheme:  []string{"https", "http", "svn", "svn+ssh"},
++	PingCmd: "info -- {scheme}://{repo}",
+ }
+
+ // fossilRepoName is the name go get associates with a fossil repository. In the
+@@ -543,24 +355,8 @@ var vcsFossil = &Cmd{
+		{filename: "_FOSSIL_", isDir: false},
+	},
+
+-	CreateCmd:   []string{"-go-internal-mkdir {dir} clone -- {repo} " + filepath.Join("{dir}", fossilRepoName), "-go-internal-cd {dir} open .fossil"},
+-	DownloadCmd: []string{"up"},
+-
+-	TagCmd:         []tagCmd{{"tag ls", `(.*)`}},
+-	TagSyncCmd:     []string{"up tag:{tag}"},
+-	TagSyncDefault: []string{"up trunk"},
+-
+-	Scheme:     []string{"https", "http"},
+-	RemoteRepo: fossilRemoteRepo,
+-	Status:     fossilStatus,
+-}
+-
+-func fossilRemoteRepo(vcsFossil *Cmd, rootDir string) (remoteRepo string, err error) {
+-	out, err := vcsFossil.runOutput(rootDir, "remote-url")
+-	if err != nil {
+-		return "", err
+-	}
+-	return strings.TrimSpace(string(out)), nil
++	Scheme: []string{"https", "http"},
++	Status: fossilStatus,
+ }
+
+ var errFossilInfo = errors.New("unable to parse output of fossil info")
+@@ -661,7 +457,7 @@ func (v *Cmd) run1(dir string, cmdline string, keyval []string, verbose bool) ([
+		args[i] = expand(m, arg)
+	}
+
+-	if len(args) >= 2 && args[0] == "-go-internal-mkdir" {
++	if len(args) >= 2 && args[0] == "--go-internal-mkdir" {
+		var err error
+		if filepath.IsAbs(args[1]) {
+			err = os.Mkdir(args[1], fs.ModePerm)
+@@ -674,7 +470,7 @@ func (v *Cmd) run1(dir string, cmdline string, keyval []string, verbose bool) ([
+		args = args[2:]
+	}
+
+-	if len(args) >= 2 && args[0] == "-go-internal-cd" {
++	if len(args) >= 2 && args[0] == "--go-internal-cd" {
+		if filepath.IsAbs(args[1]) {
+			dir = args[1]
+		} else {
+@@ -735,99 +531,6 @@ func (v *Cmd) Ping(scheme, repo string) error {
+	return v.runVerboseOnly(dir, v.PingCmd, "scheme", scheme, "repo", repo)
+ }
+
+-// Create creates a new copy of repo in dir.
+-// The parent of dir must exist; dir must not.
+-func (v *Cmd) Create(dir, repo string) error {
+-	release, err := base.AcquireNet()
+-	if err != nil {
+-		return err
+-	}
+-	defer release()
+-
+-	for _, cmd := range v.CreateCmd {
+-		if err := v.run(filepath.Dir(dir), cmd, "dir", dir, "repo", repo); err != nil {
+-			return err
+-		}
+-	}
+-	return nil
+-}
+-
+-// Download downloads any new changes for the repo in dir.
+-func (v *Cmd) Download(dir string) error {
+-	release, err := base.AcquireNet()
+-	if err != nil {
+-		return err
+-	}
+-	defer release()
+-
+-	for _, cmd := range v.DownloadCmd {
+-		if err := v.run(dir, cmd); err != nil {
+-			return err
+-		}
+-	}
+-	return nil
+-}
+-
+-// Tags returns the list of available tags for the repo in dir.
+-func (v *Cmd) Tags(dir string) ([]string, error) {
+-	var tags []string
+-	for _, tc := range v.TagCmd {
+-		out, err := v.runOutput(dir, tc.cmd)
+-		if err != nil {
+-			return nil, err
+-		}
+-		re := regexp.MustCompile(`(?m-s)` + tc.pattern)
+-		for _, m := range re.FindAllStringSubmatch(string(out), -1) {
+-			tags = append(tags, m[1])
+-		}
+-	}
+-	return tags, nil
+-}
+-
+-// TagSync syncs the repo in dir to the named tag,
+-// which either is a tag returned by tags or is v.tagDefault.
+-func (v *Cmd) TagSync(dir, tag string) error {
+-	if v.TagSyncCmd == nil {
+-		return nil
+-	}
+-	if tag != "" {
+-		for _, tc := range v.TagLookupCmd {
+-			out, err := v.runOutput(dir, tc.cmd, "tag", tag)
+-			if err != nil {
+-				return err
+-			}
+-			re := regexp.MustCompile(`(?m-s)` + tc.pattern)
+-			m := re.FindStringSubmatch(string(out))
+-			if len(m) > 1 {
+-				tag = m[1]
+-				break
+-			}
+-		}
+-	}
+-
+-	release, err := base.AcquireNet()
+-	if err != nil {
+-		return err
+-	}
+-	defer release()
+-
+-	if tag == "" && v.TagSyncDefault != nil {
+-		for _, cmd := range v.TagSyncDefault {
+-			if err := v.run(dir, cmd); err != nil {
+-				return err
+-			}
+-		}
+-		return nil
+-	}
+-
+-	for _, cmd := range v.TagSyncCmd {
+-		if err := v.run(dir, cmd, "tag", tag); err != nil {
+-			return err
+-		}
+-	}
+-	return nil
+-}
+-
+ // A vcsPath describes how to convert an import path into a
+ // version control system and repository name.
+ type vcsPath struct {
+diff --git a/src/cmd/go/internal/workcmd/edit.go b/src/cmd/go/internal/workcmd/edit.go
+index 8d975b0b3d..c1252cc95e 100644
+--- a/src/cmd/go/internal/workcmd/edit.go
++++ b/src/cmd/go/internal/workcmd/edit.go
+@@ -242,7 +242,10 @@ func allowedVersionArg(arg string) bool {
+ // parsePathVersionOptional parses path[@version], using adj to
+ // describe any errors.
+ func parsePathVersionOptional(adj, arg string, allowDirPath bool) (path, version string, err error) {
+-	before, after, found := strings.Cut(arg, "@")
++	before, after, found, err := modload.ParsePathVersion(arg)
++	if err != nil {
++		return "", "", err
++	}
+	if !found {
+		path = arg
+	} else {
+--
+2.35.6

