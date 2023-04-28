Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B73C77B61
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 14:44:59 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.21721.1682693087617842874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 07:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=cv+mGRKL;
 spf=pass (domain: mvista.com, ip: 209.85.210.171, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-63b78b344d5so52121b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 07:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682693086; x=1685285086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m8i5B4G4/biYtEhpbj8dTM/N2pI3NGGbfmX833lk1TQ=;
        b=cv+mGRKLsToKNwinL0LQ/O7sxoOoEcsEa1KYrre5lylGudvUQYziDj63wYx/e+1yO0
         ebFdZzfTH1JtPeuuneeayTSZqo7JJ66p+g+1Lie7o6DJXhp3iFKNdylSxQOTPQJ/vQFT
         ybShGRf3cQ1djwqAL5Bn8fzKkEO5BbhnF5Vx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682693086; x=1685285086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m8i5B4G4/biYtEhpbj8dTM/N2pI3NGGbfmX833lk1TQ=;
        b=b9mLQfo8OQSVnjvwAGWUEX0v032Mk7Tp6OFluK7Jq+Ok91bQj020vD/GNpYB+DzgD7
         YeC5RZW4d3UpyFY6y3OYdotL01x0jrYGaI2/Vgb8WL9Vemw9TIyRogEoAYEqlzn8QZ0Z
         l/0wO3CV2bOdSXeHhDBGJtPKbmUwSCy4lD2DU4XnPak2YSKOBPDnEYokPfVulnwc9g1y
         VsgYynSlCJggSq6IO8b05aNyslxuKW+WymAgFllI4xxUbaeG8tCEFYbbL6KTjUTBJ7a9
         5Gr9MLJDK3IT8j+CTzKmuVqMMQ6Wxx/AANoz6xBjTn19Mv5oUGM+kvSHpdhe9UJVgKI8
         upSw==
X-Gm-Message-State: AC+VfDwqIPqtZ/W9EtHMlkxvi+FgONfFq9SWAqXmiCdFcDMVZpGuOgHp
	FgTLVYlVlqcKApFMWDZQaGziHCtxiiDV0abMRB0=
X-Google-Smtp-Source: ACHHUZ5OstQyhWmGy4cmKSVP0Psmo99O/Et6xjHD6zRKnUGfiMncHEHoPqD6JfDPaT0XFjbVSMPfew==
X-Received: by 2002:a05:6a20:12c3:b0:ef:f7a4:a67e with SMTP id v3-20020a056a2012c300b000eff7a4a67emr6953463pzg.0.1682693086464;
        Fri, 28 Apr 2023 07:44:46 -0700 (PDT)
Received: from localhost.localdomain ([116.74.155.26])
        by smtp.googlemail.com with ESMTPSA id r78-20020a632b51000000b00520f316ebe3sm13087708pgr.62.2023.04.28.07.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 07:44:46 -0700 (PDT)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: fix CVE-2023-24534 denial of service from excessive memory allocation
Date: Fri, 28 Apr 2023 20:14:30 +0530
Message-Id: <20230428144430.630975-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 14:44:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180531

From: Vivek Kumbhar <vkumbhar@mvista.com>

A parsed MIME header is a map[string][]string. In the common case,
a header contains many one-element []string slices. To avoid
allocating a separate slice for each key, ReadMIMEHeader looks
ahead in the input to predict the number of keys that will be
parsed, and allocates a single []string of that length.
The individual slices are then allocated out of the larger one.

The prediction of the number of header keys was done by counting
newlines in the input buffer, which does not take into account
header continuation lines (where a header key/value spans multiple
lines) or the end of the header block and the start of the body.
This could lead to a substantial amount of overallocation, for
example when the body consists of nothing but a large block of
newlines.

Fix header key count prediction to take into account the end of
the headers (indicated by a blank line) and continuation lines
(starting with whitespace).

Thanks to Jakob Ackermann (@das7pad) for reporting this issue.

Fixes CVE-2023-24534
For #58975
Fixes #59267

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   1 +
 .../go/go-1.14/CVE-2023-24534.patch           | 200 ++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24534.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index b1d7bc155a..3b99b8fe7e 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -57,6 +57,7 @@ SRC_URI += "\
     file://CVE-2022-41722-2.patch \
     file://CVE-2020-29510.patch \
     file://CVE-2023-24537.patch \
+    file://CVE-2023-24534.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-24534.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-24534.patch
new file mode 100644
index 0000000000..d50db04bed
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-24534.patch
@@ -0,0 +1,200 @@
+From d6759e7a059f4208f07aa781402841d7ddaaef96 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Fri, 10 Mar 2023 14:21:05 -0800
+Subject: [PATCH] [release-branch.go1.19] net/textproto: avoid overpredicting
+ the number of MIME header keys
+
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802452
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+(cherry picked from commit f739f080a72fd5b06d35c8e244165159645e2ed6)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1802393
+Reviewed-by: Damien Neil <dneil@google.com>
+Run-TryBot: Roland Shoemaker <bracewell@google.com>
+Change-Id: I675451438d619a9130360c56daf529559004903f
+Reviewed-on: https://go-review.googlesource.com/c/go/+/481982
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Matthew Dempsky <mdempsky@google.com>
+Auto-Submit: Michael Knyszek <mknyszek@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/d6759e7a059f4208f07aa781402841d7ddaaef96]
+CVE: CVE-2023-24534
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/bytes/bytes.go               | 13 +++++++
+ src/net/textproto/reader.go      | 31 +++++++++++------
+ src/net/textproto/reader_test.go | 59 ++++++++++++++++++++++++++++++++
+ 3 files changed, 92 insertions(+), 11 deletions(-)
+
+diff --git a/src/bytes/bytes.go b/src/bytes/bytes.go
+index e872cc2..1f0d760 100644
+--- a/src/bytes/bytes.go
++++ b/src/bytes/bytes.go
+@@ -1078,6 +1078,19 @@ func Index(s, sep []byte) int {
+	return -1
+ }
+
++// Cut slices s around the first instance of sep,
++// returning the text before and after sep.
++// The found result reports whether sep appears in s.
++// If sep does not appear in s, cut returns s, nil, false.
++//
++// Cut returns slices of the original slice s, not copies.
++func Cut(s, sep []byte) (before, after []byte, found bool) {
++	if i := Index(s, sep); i >= 0 {
++		return s[:i], s[i+len(sep):], true
++	}
++	return s, nil, false
++}
++
+ func indexRabinKarp(s, sep []byte) int {
+	// Rabin-Karp search
+	hashsep, pow := hashStr(sep)
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index a505da9..8d547fe 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -486,8 +487,11 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
+	// large one ahead of time which we'll cut up into smaller
+	// slices. If this isn't big enough later, we allocate small ones.
+	var strs []string
+-	hint := r.upcomingHeaderNewlines()
++	hint := r.upcomingHeaderKeys()
+	if hint > 0 {
++		if hint > 1000 {
++			hint = 1000 // set a cap to avoid overallocation
++		}
+		strs = make([]string, hint)
+	}
+
+@@ -562,9 +566,11 @@ func mustHaveFieldNameColon(line []byte) error {
+	return nil
+ }
+
+-// upcomingHeaderNewlines returns an approximation of the number of newlines
++var nl = []byte("\n")
++
++// upcomingHeaderKeys returns an approximation of the number of keys
+ // that will be in this header. If it gets confused, it returns 0.
+-func (r *Reader) upcomingHeaderNewlines() (n int) {
++func (r *Reader) upcomingHeaderKeys() (n int) {
+	// Try to determine the 'hint' size.
+	r.R.Peek(1) // force a buffer load if empty
+	s := r.R.Buffered()
+@@ -572,17 +578,20 @@ func (r *Reader) upcomingHeaderNewlines() (n int) {
+		return
+	}
+	peek, _ := r.R.Peek(s)
+-	for len(peek) > 0 {
+-		i := bytes.IndexByte(peek, '\n')
+-		if i < 3 {
+-			// Not present (-1) or found within the next few bytes,
+-			// implying we're at the end ("\r\n\r\n" or "\n\n")
+-			return
++	for len(peek) > 0 && n < 1000 {
++		var line []byte
++		line, peek, _ = bytes.Cut(peek, nl)
++		if len(line) == 0 || (len(line) == 1 && line[0] == '\r') {
++			// Blank line separating headers from the body.
++			break
++		}
++		if line[0] == ' ' || line[0] == '\t' {
++			// Folded continuation of the previous line.
++			continue
+		}
+		n++
+-		peek = peek[i+1:]
+	}
+-	return
++	return n
+ }
+
+ // CanonicalMIMEHeaderKey returns the canonical format of the
+diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_test.go
+index 3124d43..3ae0de1 100644
+--- a/src/net/textproto/reader_test.go
++++ b/src/net/textproto/reader_test.go
+@@ -9,6 +9,7 @@ import (
+	"bytes"
+	"io"
+	"reflect"
++	"runtime"
+	"strings"
+	"testing"
+ )
+@@ -127,6 +128,42 @@ func TestReadMIMEHeaderSingle(t *testing.T) {
+	}
+ }
+
++// TestReaderUpcomingHeaderKeys is testing an internal function, but it's very
++// difficult to test well via the external API.
++func TestReaderUpcomingHeaderKeys(t *testing.T) {
++	for _, test := range []struct {
++		input string
++		want  int
++	}{{
++		input: "",
++		want:  0,
++	}, {
++		input: "A: v",
++		want:  1,
++	}, {
++		input: "A: v\r\nB: v\r\n",
++		want:  2,
++	}, {
++		input: "A: v\nB: v\n",
++		want:  2,
++	}, {
++		input: "A: v\r\n  continued\r\n  still continued\r\nB: v\r\n\r\n",
++		want:  2,
++	}, {
++		input: "A: v\r\n\r\nB: v\r\nC: v\r\n",
++		want:  1,
++	}, {
++		input: "A: v" + strings.Repeat("\n", 1000),
++		want:  1,
++	}} {
++		r := reader(test.input)
++		got := r.upcomingHeaderKeys()
++		if test.want != got {
++			t.Fatalf("upcomingHeaderKeys(%q): %v; want %v", test.input, got, test.want)
++		}
++	}
++}
++
+ func TestReadMIMEHeaderNoKey(t *testing.T) {
+	r := reader(": bar\ntest-1: 1\n\n")
+	m, err := r.ReadMIMEHeader()
+@@ -223,6 +260,28 @@ func TestReadMIMEHeaderTrimContinued(t *testing.T) {
+	}
+ }
+
++// Test that reading a header doesn't overallocate. Issue 58975.
++func TestReadMIMEHeaderAllocations(t *testing.T) {
++	var totalAlloc uint64
++	const count = 200
++	for i := 0; i < count; i++ {
++		r := reader("A: b\r\n\r\n" + strings.Repeat("\n", 4096))
++		var m1, m2 runtime.MemStats
++		runtime.ReadMemStats(&m1)
++		_, err := r.ReadMIMEHeader()
++		if err != nil {
++			t.Fatalf("ReadMIMEHeader: %v", err)
++		}
++		runtime.ReadMemStats(&m2)
++		totalAlloc += m2.TotalAlloc - m1.TotalAlloc
++	}
++	// 32k is large and we actually allocate substantially less,
++	// but prior to the fix for #58975 we allocated ~400k in this case.
++	if got, want := totalAlloc/count, uint64(32768); got > want {
++		t.Fatalf("ReadMIMEHeader allocated %v bytes, want < %v", got, want)
++	}
++}
++
+ type readResponseTest struct {
+	in       string
+	inCode   int
+--
+2.25.1
-- 
2.25.1


