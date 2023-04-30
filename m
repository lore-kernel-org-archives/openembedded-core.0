Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6E0C7EE21
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 16:26:32 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web11.72239.1682871985520625194
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 09:26:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=NF2BM0+D;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2470e93ea71so1215294a91.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 09:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682871984; x=1685463984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+Da8MtLlBNuRTkYc/aBGlKmv2eRTCT2UdonhDdZJ1A=;
        b=NF2BM0+DPESy7AtMiaSEMb7ca+TIAUJNyhSCmxJDCRzendvL2Go8Ng3YWfKGKDMsgV
         EvXKzgh59H0XGU/gJfUuer0s/AMyOtuU3MBWc+s4Jj9tDeEgCjo1g2NiPjKPlZee9cf+
         ihCZiDsMAuzfSTq41PdGZnXGDSfUmrMDStCvVRFoOD06sErij4rSbADQiuuwp+t0CcMw
         3B+rEpOjy3cko6BBCBXCly0CpMinCrLcz+m8Qpb2PcrOKY6sBnEqRlMXNKVItWqm6Cpl
         nO5RAFEOzRD8PVWQUJLmokSMZL1U2Tfa6Ac5dy+dAjZQYhbvzg+jeMJcWlD6HrefStWP
         e+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682871984; x=1685463984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+Da8MtLlBNuRTkYc/aBGlKmv2eRTCT2UdonhDdZJ1A=;
        b=Rim/Nlhw7JpjTOASa87RR7OG67vOfxoRBrIorlPB8N0j7cAGUOOrEr4vPtYb1v0WXN
         OTP7a8ig3pql1lmg4HsGkBfzKY7XsFqu9tPqmXSD562AoBzF7t0K7MzRX6ONbgZgiOkE
         lzqjAZRS7iH3xU852pv+WHeIpOBjxLLA6BBQoNjfNWht3Zm2ouds4RELn+q00Gvm+oKH
         uxknKP1gzUPJm+jBlzjLoyX78/39tn/Slr1umb4ocpg1kTTD/rPuX0e+SfenCWGmL2d9
         JYa6C1OzKgUpbQCL6blFnNUPZ8wC/entWVdoceX4agpwCsAPhlAP3jrTtlsDp44hfo7U
         lYEQ==
X-Gm-Message-State: AC+VfDxH9eqNI624wk1WVBGak9eCQj79txnRMWZI7O1SfICxEa2IMorG
	j3pJtYklIu0Q2KvAR+iNFFlgSDi1uLdmFwF/6Y8=
X-Google-Smtp-Source: ACHHUZ4X4UDJB5AygW3cmKfkSdFKcmQsMt4WAWdxyRcAFzS9Agy8mXWNMQ3r+nkhj7/BYyB5d/zCWw==
X-Received: by 2002:a17:90a:e610:b0:24d:ed4b:2e7e with SMTP id j16-20020a17090ae61000b0024ded4b2e7emr3010177pjy.32.1682871984351;
        Sun, 30 Apr 2023 09:26:24 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090abc0800b0024b9e62c1d9sm4443811pjr.41.2023.04.30.09.26.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 09:26:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] go: fix CVE-2023-24534 denial of service from excessive memory allocation
Date: Sun, 30 Apr 2023 06:25:59 -1000
Message-Id: <daa6aa9c7198a07322f1828a9db457fec86191cf.1682871869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682871868.git.steve@sakoman.com>
References: <cover.1682871868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 16:26:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180580

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


