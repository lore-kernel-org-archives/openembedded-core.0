Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32370CCA470
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 08:57:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7403.1760000248182622181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 01:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=pxu8h4xi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23773b27ff=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5994pPqc250456
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Oct 2025 08:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=3ztc+O4W6T8aaW/yXOKt
	odL4qgOhkcdk5JzdRJWEcEI=; b=pxu8h4xicChmtsGSxFFU+lRVQsRu2jSzWm67
	PYgOdMvzVaUDR43pF39YG7Xqp9ONg7U93E6cHub5bABOwA8PAObGBN+72yXp+xKR
	BJDZyRBhvAx3E+IlsR1IVUe8dRIS8BFQPMXUod0ei6lNqvR5VWtd7bD60s6X3BMk
	OuZXFvEacjwkEgAHD5RM0cbzKHf12xDYqZSCo/HMLuOATynpXAHVsAjzZ4HndaVR
	xPbSPMwHyuLQW2nP6jEgVs5TpmFwDoDZw/5pXGbggUQC7lJ6AZh5jGjDqAPcakwE
	hcpSaEC1Du1IBCpVUGTBR6Hti9Ss40h9qyEQeaayupXabnUUYA==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49nx2yrhtf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 08:57:27 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Thu, 9 Oct 2025 01:57:26 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Thu, 9 Oct 2025 01:57:25 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] go: fix CVE-2025-47906
Date: Thu, 9 Oct 2025 14:27:24 +0530
Message-ID: <20251009085724.3191493-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Wd8BqkhX c=1 sm=1 tr=0 ts=68e778f7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=pM9yUfARAAAA:8 a=Oh2cFVv5AAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=yhUri8FnAAAA:8 a=1XWaLZrsAAAA:8
 a=2-90-CEY0x8OdAcwCrEA:9 a=YH-7kEGJnRg4CV3apUU-:22 a=7KeoIwV6GZqOttXkcoxL:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=8nbOMqh3J4Vhtx036jbE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA5MDA0OSBTYWx0ZWRfX5JSzeRcSNcEm
 Bd+3ObsUD669NtIv351rfP8+uKfnD4n8XJ1S8ufmK7riJb6Gsf0BeLRKuRbNz6nkWTZZetlumNt
 hdRsWBRqvQz1XBXe1W6krcZ2cRwpUox8EaZAFMjlQERsQrXBhFmW8v6VcPr8e2l05/K8ypck23d
 ZLgOCcWtazmgVIoXN7sal205Me3xq/0CE9WsFxJZyQrkhgobUjH1zVznCUnLDhozB+C/U6qdhez
 BDSdy2Ev/oqthOtkQTTdNsdvs22D2skHS0qD9aFdxWdRXiFjAkLjB8JdELD80Rzbb/hbluRHu58
 NXXJw1TiyQmP1Hl+oIcvcxYcdvlhL3r8kQyRLvwPeE3ur9Z+Hz8NXqdhkhDINLZgpDkBpZWbmsq
 mCI8DfN3I/GsAAZeGCml6MROjp3Xzw==
X-Proofpoint-GUID: 6ecWrlrOSaBO7N8Ymjp6kfd4GvJSzkZG
X-Proofpoint-ORIG-GUID: 6ecWrlrOSaBO7N8Ymjp6kfd4GvJSzkZG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510090049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224608

From: Archana Polampalli <archana.polampalli@windriver.com>

If the PATH environment variable contains paths which are executables
(rather than just directories), passing certain strings to LookPath
("", ".", and ".."), can result in the binaries listed in the PATH
being unexpectedly returned.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
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
2.40.0


