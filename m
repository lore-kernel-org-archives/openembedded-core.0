Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2542DCCD18C
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 02:51:11 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.2331.1760064664037315084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 19:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P4Gdh3Vx;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-77f1f29a551so2189510b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760064663; x=1760669463; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NO73NEqThYryOCLXwO9TUEsy8kyBsvyn59ApjluQ9Tk=;
        b=P4Gdh3Vx7ufgDk11OysWzh/bXg31ztx+lpCltzv579Zod3nS8/Ez5CsmVU3n4QuiNb
         wEt0o4giECcjlSVidTgWa1MS7XLTmbfMsSrSZAfCM3T8w80HLlJWQRCTHU7KmJvVyGeR
         ssArCTPJUBnbKk5GdndTrQEdzi3DF3ntdqGv+EqyUn/P2MC63MZa5FPAkXLF0QyJI/KN
         0vOITb9685QzmijfZhkCh2WRJJIi5IZCMVsGSZm4m1hOsu9xdNLqaEYsywqvibWnH9nk
         Cv36tVHuMoS10dlyh9W/uiGBnISahLCXb2fTnpPXNjqJDlL3gSk4nWsRJg4JiBLHswvW
         QT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760064663; x=1760669463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NO73NEqThYryOCLXwO9TUEsy8kyBsvyn59ApjluQ9Tk=;
        b=r8o9zmM13fsdjRoBY2kZFlHAxHcInOS0GPJe9L2ATmX3Bfyz9VYqIdJmvaNFisU47Y
         bseym2A89DtmhHln9lcLP7F6mih7gcSMd0mwjF/aQ2j/TXKS2jOK8RYnkp0WDfnrimFC
         UebIwsQlyNj0nbLFglhe/JcmWADkqzCKMqFBz84WOvuUCVO9nER1FzlC1MCGNeiG6qfy
         Fm8RJsvqduryoaht/xLOLKumOK3I68vS/yX0SC91jUpUkriIOtxUSFOQZhHWNXk6jagK
         sWtdzHDIxtuPxRueN2N0MPVs3l+bLE6kZkm10+ICD452kJ+qnpCw/XVnZggwjzcPPDvG
         Kopg==
X-Gm-Message-State: AOJu0YwNksuu90bqPGbMj336Zf35BuFQzJEXhg+yt4+NTuul/x6Jz+eV
	g07aVUbI38TT+8kjIZqXLVOvzhlYAsh0zr0wBvfofKhwGhTdlDv0EsHr9HUif+1mMxmz1M9SyUH
	hgItU
X-Gm-Gg: ASbGnctbdGNlk170xrzoLKh/IU3DbpW9w+lLHmp55SS9uoJM2uTBO39lXWY938gZK6s
	VSXl7t2d6RpSQLDTXx76PHmq8nQafvXs/fqcMKEPdStiYmjZag39HUlcPgPZ9jhgMrRZPOQzife
	IJQsjTyGt/ccpXC/VTgqBdW7p14v7ClcphhfZgGDicAdlH72qOAg9SBtv4dcFAKl/VWR6MxP44L
	WgBtk6nft8aCgf8j4rCO/9U8H/FDrP3DRqTBxFUURTrQV0osLdOyXbbJ73rpACGAcXgJbAzz++W
	Kz/55padhbuPBSj4TJ/vDAHn/o9XUrQqGBIhdFz32G0eqHPSb4AOBPElIRpdovF7f3C7RG52Llv
	V5vusqQq+ZqgGmZ9taO6CT/laxsftqYxg
X-Google-Smtp-Source: AGHT+IFbVpT6V1+G9js0ABZEP6ni4VByqL3WShxcho9rrG3COZ+LAKgo9l9Z+YXpw56pFRwBTMPKtg==
X-Received: by 2002:a05:6a00:a8f:b0:781:f1ee:a9cd with SMTP id d2e1a72fcca58-793858fb683mr12772534b3a.13.1760064663073;
        Thu, 09 Oct 2025 19:51:03 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:abff:bce5:2cb1:3b46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb116basm1215764b3a.30.2025.10.09.19.51.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 19:51:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/18] go: fix CVE-2025-47906
Date: Thu,  9 Oct 2025 19:50:31 -0700
Message-ID: <ed6df1883225ec08e637a0d7a15a6a5da4665d8d.1760064493.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760064493.git.steve@sakoman.com>
References: <cover.1760064493.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 02:51:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224656

From: Archana Polampalli <archana.polampalli@windriver.com>

If the PATH environment variable contains paths which are executables
(rather than just directories), passing certain strings to LookPath
("", ".", and ".."), can result in the binaries listed in the PATH
 being unexpectedly returned.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-47906.patch                | 183 ++++++++++++++++++
 2 files changed, 184 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47906.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index d0ce333117..a364e1aae8 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -20,6 +20,7 @@ SRC_URI += "\
     file://CVE-2025-4674.patch \
     file://CVE-2025-47907-pre.patch \
     file://CVE-2025-47907.patch \
+    file://CVE-2025-47906.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-47906.patch b/meta/recipes-devtools/go/go/CVE-2025-47906.patch
new file mode 100644
index 0000000000..88895f496d
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-47906.patch
@@ -0,0 +1,183 @@
+From 8fa31a2d7d9e60c50a3a94080c097b6e65773f4b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Olivier=20Mengu=C3=A9?= <olivier.mengue@gmail.com>
+Date: Mon, 30 Jun 2025 16:58:59 +0200
+Subject: [PATCH] [release-branch.go1.23] os/exec: fix incorrect expansion of
+ "", "." and ".." in LookPath Fix incorrect expansion of "" and "." when $PATH
+ contains an executable file or, on Windows, a parent directory of a %PATH%
+ element contains an file with the same name as the %PATH% element but with
+ one of the %PATHEXT% extension (ex: C:\utils\bin is in PATH, and
+ C:\utils\bin.exe exists).
+
+Fix incorrect expansion of ".." when $PATH contains an element which is
+an the concatenation of the path to an executable file (or on Windows
+a path that can be expanded to an executable by appending a %PATHEXT%
+extension), a path separator and a name.
+
+"", "." and ".." are now rejected early with ErrNotFound.
+
+Fixes CVE-2025-47906
+Fixes #74803
+
+Change-Id: Ie50cc0a660fce8fbdc952a7f2e05c36062dcb50e
+Reviewed-on: https://go-review.googlesource.com/c/go/+/685755
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Auto-Submit: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Damien Neil <dneil@google.com>
+(cherry picked from commit e0b07dc)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/691855
+Reviewed-by: Michael Knyszek <mknyszek@google.com>
+
+CVE: CVE-2025-47906
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/8fa31a2d7d9e60c50a3a94080c097b6e65773f4b]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/os/exec/dot_test.go   | 56 +++++++++++++++++++++++++++++++++++++++
+ src/os/exec/exec.go       | 10 +++++++
+ src/os/exec/lp_plan9.go   |  4 +++
+ src/os/exec/lp_unix.go    |  4 +++
+ src/os/exec/lp_windows.go |  7 +++++
+ 5 files changed, 81 insertions(+)
+
+diff --git a/src/os/exec/dot_test.go b/src/os/exec/dot_test.go
+index ed4bad2..86e9cbb 100644
+--- a/src/os/exec/dot_test.go
++++ b/src/os/exec/dot_test.go
+@@ -178,4 +178,60 @@ func TestLookPath(t *testing.T) {
+			}
+		}
+	})
++
++	checker := func(test string) func(t *testing.T) {
++		return func(t *testing.T) {
++			t.Helper()
++			t.Logf("PATH=%s", os.Getenv("PATH"))
++			p, err := LookPath(test)
++			if err == nil {
++				t.Errorf("%q: error expected, got nil", test)
++			}
++			if p != "" {
++				t.Errorf("%q: path returned should be \"\". Got %q", test, p)
++			}
++		}
++	}
++
++	// Reference behavior for the next test
++	t.Run(pathVar+"=$OTHER2", func(t *testing.T) {
++		t.Run("empty", checker(""))
++		t.Run("dot", checker("."))
++		t.Run("dotdot1", checker("abc/.."))
++		t.Run("dotdot2", checker(".."))
++	})
++
++	// Test the behavior when PATH contains an executable file which is not a directory
++	t.Run(pathVar+"=exe", func(t *testing.T) {
++		// Inject an executable file (not a directory) in PATH.
++		// Use our own binary os.Args[0].
++		testenv.MustHaveExec(t)
++		exe, err := os.Executable()
++		if err != nil {
++			t.Fatal(err)
++		}
++
++		t.Setenv(pathVar, exe)
++		t.Run("empty", checker(""))
++		t.Run("dot", checker("."))
++		t.Run("dotdot1", checker("abc/.."))
++		t.Run("dotdot2", checker(".."))
++	})
++
++	// Test the behavior when PATH contains an executable file which is not a directory
++	t.Run(pathVar+"=exe/xx", func(t *testing.T) {
++		// Inject an executable file (not a directory) in PATH.
++		// Use our own binary os.Args[0].
++		testenv.MustHaveExec(t)
++		exe, err := os.Executable()
++		if err != nil {
++			t.Fatal(err)
++		}
++
++		t.Setenv(pathVar, filepath.Join(exe, "xx"))
++		t.Run("empty", checker(""))
++		t.Run("dot", checker("."))
++		t.Run("dotdot1", checker("abc/.."))
++		t.Run("dotdot2", checker(".."))
++	})
+ }
+diff --git a/src/os/exec/exec.go b/src/os/exec/exec.go
+index b8ef5a0..2c7f510 100644
+--- a/src/os/exec/exec.go
++++ b/src/os/exec/exec.go
+@@ -1310,3 +1310,13 @@ func addCriticalEnv(env []string) []string {
+ // Code should use errors.Is(err, ErrDot), not err == ErrDot,
+ // to test whether a returned error err is due to this condition.
+ var ErrDot = errors.New("cannot run executable found relative to current directory")
++
++// validateLookPath excludes paths that can't be valid
++// executable names. See issue #74466 and CVE-2025-47906.
++func validateLookPath(s string) error {
++	switch s {
++	case "", ".", "..":
++		return ErrNotFound
++	}
++	return nil
++}
+diff --git a/src/os/exec/lp_plan9.go b/src/os/exec/lp_plan9.go
+index dffdbac..39f3d33 100644
+--- a/src/os/exec/lp_plan9.go
++++ b/src/os/exec/lp_plan9.go
+@@ -36,6 +36,10 @@ func findExecutable(file string) error {
+ // As of Go 1.19, LookPath will instead return that path along with an error satisfying
+ // errors.Is(err, ErrDot). See the package documentation for more details.
+ func LookPath(file string) (string, error) {
++	if err := validateLookPath(file); err != nil {
++		return "", &Error{file, err}
++	}
++
+	// skip the path lookup for these prefixes
+	skip := []string{"/", "#", "./", "../"}
+
+diff --git a/src/os/exec/lp_unix.go b/src/os/exec/lp_unix.go
+index 3787132..2543525 100644
+--- a/src/os/exec/lp_unix.go
++++ b/src/os/exec/lp_unix.go
+@@ -54,6 +54,10 @@ func LookPath(file string) (string, error) {
+	// (only bypass the path if file begins with / or ./ or ../)
+	// but that would not match all the Unix shells.
+
++	if err := validateLookPath(file); err != nil {
++		return "", &Error{file, err}
++	}
++
+	if strings.Contains(file, "/") {
+		err := findExecutable(file)
+		if err == nil {
+diff --git a/src/os/exec/lp_windows.go b/src/os/exec/lp_windows.go
+index 698a97c..e0b74e3 100644
+--- a/src/os/exec/lp_windows.go
++++ b/src/os/exec/lp_windows.go
+@@ -68,6 +68,9 @@ func findExecutable(file string, exts []string) (string, error) {
+ // As of Go 1.19, LookPath will instead return that path along with an error satisfying
+ // errors.Is(err, ErrDot). See the package documentation for more details.
+ func LookPath(file string) (string, error) {
++	if err := validateLookPath(file); err != nil {
++		return "", &Error{file, err}
++	}
+	return lookPath(file, pathExt())
+ }
+
+@@ -81,6 +84,10 @@ func LookPath(file string) (string, error) {
+ // "C:\foo\example.com" would be returned as-is even if the
+ // program is actually "C:\foo\example.com.exe".
+ func lookExtensions(path, dir string) (string, error) {
++	if err := validateLookPath(path); err != nil {
++		return "", &Error{path, err}
++	}
++
+	if filepath.Base(path) == path {
+		path = "." + string(filepath.Separator) + path
+	}
+--
+2.40.0
-- 
2.43.0


