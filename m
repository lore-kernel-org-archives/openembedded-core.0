Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A66DCCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 19:31:49 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.9252.1760038302901310873
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 12:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=RFmFwZVq;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-78125ed4052so1580436b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 12:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760038302; x=1760643102; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ub870bIuijFJxXA+HTBYweLcV5g/R6yC5Hq/Kw/IPAs=;
        b=RFmFwZVqDAiTUggfkCZkqfSG+4+NKuois1qXunw+KSXQxg5YpjTsE4siqqvL0FgFqe
         MAbbqbzbPvblxUIMF/eqXH70CuO3oLZs0UJur4/XD8LvDM2cBJbUHPC+zGiIWIfHisfZ
         GIYlD27SrmFVUSXg+HP8V5dnh05TTAE13ifxT06axqgiRxKfKGyypgEUzU43IswMdRnK
         XWyup0FyMHIESSxECROuL9WozGVCkB9fxS8atNAuHdRq8RU/YLBsgFw8RF9+rvbwRQ15
         W+6wLTNZD+3bWf6GPb/RaSvCm/ZIinz346zMXMX7g8w1fjZroafiNVuule/mX8/jObmE
         VKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760038302; x=1760643102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ub870bIuijFJxXA+HTBYweLcV5g/R6yC5Hq/Kw/IPAs=;
        b=WPnkcqcGBl4bD3f5E04VuyQv7JwOPh9367B79EiwE//0477adaptOmGzTUGuwXUW7V
         P9H5g60Qma7c7uhw62cbbL/OEhMFrbS3rWY1f2NFh7wL5Atg1IEF/fS/Z4EMAF5ovzuK
         9zJ7SyM17gICXEXINqDgTlBNtpiK0E3a5bYYlS9VdFbkGYug7qbLYQLCtzKoCB+81ZXs
         qkKztr1uHzwUaWTdcEVd9r66XClZUx4/OKaDZvlo91sF9jCyAX/Tv0aZiKn0XOmXWt/P
         vISHJIzrCFy0ka1FtZqT/otZb5fK/ZFuRIM3hHvooV/ms3T96ltTsfKR1Yp5oOD3VWWO
         1S3w==
X-Gm-Message-State: AOJu0Yw+QsQyWLDTAX9V/Afb+kcIAyt08WSDj/Qvx9/kaa981NMxjXfi
	PG+n9theeLos/fe2S6tTI2l67ZXMcI4toFT+frbgYKPgdJa2AmWUXoD8BNbeuy0NN6vlo39kJjb
	ZSxPx
X-Gm-Gg: ASbGncvbPcNYzZ/3yBAxGpukzkv8dTHp97BozWDOURqaNL5e2iLiUKIitz954DFwuox
	vBJtjx1s/MYNomHURWYvmv7gVMo8mxbRRfGNSQkiZbsmxR/5aU5NHo3fxEvOQ8v9PyQj6Ev4N6j
	EG3unAESyl6SfTIzLwWFsumRr8l4m6iunP+cgE80WiRBa3yiesaruA8PZzHQyAhQXfDSso19Lui
	0LGhHAHjupOV99MUL4q+YA6F3cjZ7SCxetm1gga9FFvReFg7baD5eYyGcIZ6HKp4to3EQdbsTET
	FxrBQga7DA2YZKWDz5ae/RNejqYQvBliy2+UkSTm9okbZtkV7tCoJC+qdPWyDRBZfTXuKOG52pM
	gPbcoCSKOWMZ4gMn+l+4qg4WexRwIobWWKjxhvg==
X-Google-Smtp-Source: AGHT+IHy04UWuU23qskqmVVDktE+D2Z/lt6skKxR7QuECqgVMvhMxRXtxHYew4RHLKrFx8Sr+/lMnA==
X-Received: by 2002:a05:6a20:7348:b0:2c7:55a3:6168 with SMTP id adf61e73a8af0-32da83de308mr10945834637.30.1760038301897;
        Thu, 09 Oct 2025 12:31:41 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b96e:4301:8642:779c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2d51sm495864b3a.65.2025.10.09.12.31.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 12:31:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 16/24] go: fix CVE-2025-47906
Date: Thu,  9 Oct 2025 12:31:00 -0700
Message-ID: <c4d81e32ee3fb7d05db2cfbfaaa8081841bc16ce.1760038088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760038088.git.steve@sakoman.com>
References: <cover.1760038088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 19:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224635

From: Archana Polampalli <archana.polampalli@windriver.com>

If the PATH environment variable contains paths which are executables
(rather than just directories), passing certain strings to LookPath
("", ".", and ".."), can result in the binaries listed in the PATH
being unexpectedly returned.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2025-47906.patch           | 171 ++++++++++++++++++
 2 files changed, 172 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-47906.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 2052f4adbc..aab8e85c22 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -67,6 +67,7 @@ SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
            file://CVE-2025-47907-pre-0001.patch \
            file://CVE-2025-47907-pre-0002.patch \
            file://CVE-2025-47907.patch \
+           file://CVE-2025-47906.patch \
            "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2025-47906.patch b/meta/recipes-devtools/go/go-1.21/CVE-2025-47906.patch
new file mode 100644
index 0000000000..272d1ed985
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2025-47906.patch
@@ -0,0 +1,171 @@
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
+ src/internal/execabs/execabs_test.go | 55 ++++++++++++++++++++++++++++
+ src/os/exec/exec.go                  |  9 +++++
+ src/os/exec/lp_plan9.go              |  4 ++
+ src/os/exec/lp_unix.go               |  4 ++
+ src/os/exec/lp_windows.go            |  4 ++
+ 5 files changed, 76 insertions(+)
+
+diff --git a/src/internal/execabs/execabs_test.go b/src/internal/execabs/execabs_test.go
+index 97a3f39..99fd64b 100644
+--- a/src/internal/execabs/execabs_test.go
++++ b/src/internal/execabs/execabs_test.go
+@@ -100,4 +100,59 @@ func TestLookPath(t *testing.T) {
+	} else if err.Error() != expectedErr {
+		t.Errorf("LookPath returned unexpected error: want %q, got %q", expectedErr, err.Error())
+	}
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
+index 505de58..84fd82f 100644
+--- a/src/os/exec/exec.go
++++ b/src/os/exec/exec.go
+@@ -790,3 +790,12 @@ func addCriticalEnv(env []string) []string {
+	}
+	return append(env, "SYSTEMROOT="+os.Getenv("SYSTEMROOT"))
+ }
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
+index e8826a5..ed9f6e3 100644
+--- a/src/os/exec/lp_plan9.go
++++ b/src/os/exec/lp_plan9.go
+@@ -33,6 +33,10 @@ func findExecutable(file string) error {
+ // The result may be an absolute path or a path relative to the current directory.
+ func LookPath(file string) (string, error) {
+	// skip the path lookup for these prefixes
++	if err := validateLookPath(file); err != nil {
++		return "", &Error{file, err}
++	}
++
+	skip := []string{"/", "#", "./", "../"}
+
+	for _, p := range skip {
+diff --git a/src/os/exec/lp_unix.go b/src/os/exec/lp_unix.go
+index d1d246a..1b27f2b 100644
+--- a/src/os/exec/lp_unix.go
++++ b/src/os/exec/lp_unix.go
+@@ -38,6 +38,10 @@ func LookPath(file string) (string, error) {
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
+index e7a2cdf..7a1d6fb 100644
+--- a/src/os/exec/lp_windows.go
++++ b/src/os/exec/lp_windows.go
+@@ -58,6 +58,10 @@ func findExecutable(file string, exts []string) (string, error) {
+ // a suitable candidate.
+ // The result may be an absolute path or a path relative to the current directory.
+ func LookPath(file string) (string, error) {
++	if err := validateLookPath(file); err != nil {
++		return "", &Error{file, err}
++	}
++
+	var exts []string
+	x := os.Getenv(`PATHEXT`)
+	if x != "" {
+--
+2.40.0
-- 
2.43.0


