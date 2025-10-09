Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A45CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 03:13:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3768.1759979597976118370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 20:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c+GG4ta9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23773b27ff=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5993DHoS3272289;
	Thu, 9 Oct 2025 03:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=LAED4km7dLKiNQiQHHUi
	hTWYuctzQqdKnz+nmo5OwB0=; b=c+GG4ta9g7hoWmk54zZ3lH7c1dMfq3ASjk7V
	Y9LRl2+2WYd6murWWmYFi1HqKnt/mgn71aHs9ZkHk0WmtahAjPAYzExkZfxbYsCO
	Nkrfd4zImVa4O/+Bs7pKMWw1MhjPjZFkyDhnrbpulpQQXzGKlQ7oZHACGg7Q3Q7m
	PfrkeMc8KHTGYdr4R9krtuB8dP3EsVM53Gty5h8EBL4Q7xCIMYU7Xrs8b+TF3Wl8
	/GR13WGuGYkShfe7YBvG5XaWNFt40dJgm0xADYlL7vqgiUGfwVAWxNov1idV28D0
	AjazjV3+AtCkz+caqfBZz1IHzXhUL5o02ZRv5RzT13Gb9SOd0A==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2yra5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 03:13:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 8 Oct 2025 20:13:15 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Wed, 8 Oct 2025 20:13:14 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH V2 1/1] go: fix CVE-2025-47906
Date: Thu, 9 Oct 2025 08:43:11 +0530
Message-ID: <20251009031311.3718194-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wd8BqkhX c=1 sm=1 tr=0 ts=68e7284c cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=yhUri8FnAAAA:8 a=1XWaLZrsAAAA:8 a=pM9yUfARAAAA:8
 a=A1X0JdhQAAAA:8 a=2-90-CEY0x8OdAcwCrEA:9 a=7KeoIwV6GZqOttXkcoxL:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=8nbOMqh3J4Vhtx036jbE:22 a=YH-7kEGJnRg4CV3apUU-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDAxNyBTYWx0ZWRfXxyeeJrEdn56m
 HVD6nZhqls/r/Kmriy4Qc3Au+qQvCqOpsjr8Px0yDuMpIlzRjd8Pgw4KoI3xizT/+y0MZY9QRnk
 Xcem/vrsfJ8KpU2bDQ5azlCXK3EZrSUwXyK03xm5wxQGcnZgvkRMa7fa7qRUM8Rgf/ouIbgz8T/
 5W/tjiZmRg0fOiM1TTCYeTkF7emnkQv8EeeT2xJy+1AEy+AGQRc/sn2QsL2XiMs/OPBXwNP156s
 YeywsB5xjPm+RF7R6QH4jXbwzcb9kDho81ictR1pqhQDUkOVPag6FQrBYJKOLZUgG3/uqWZBd1E
 jacA30rfUnwdiLW8PMZVswiS5JgJ99g76xP0pYqCB3HRISi4Fm05MHzcTmFDYglklTFJDil0HVq
 gKMj3hCw5rx/ujcSqu1tu4wOvOTB1A==
X-Proofpoint-GUID: _MvhfdIh6DJE8pXJA0sdeYCiYU9wLUSm
X-Proofpoint-ORIG-GUID: _MvhfdIh6DJE8pXJA0sdeYCiYU9wLUSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510090017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 03:13:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224605

From: Archana Polampalli <archana.polampalli@windriver.com>

If the PATH environment variable contains paths which are executables
(rather than just directories), passing certain strings to LookPath
("", ".", and ".."), can result in the binaries listed in the PATH
 being unexpectedly returned.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
2.40.0


