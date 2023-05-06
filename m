Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D820C7EE2A
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 15:25:06 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.36175.1683386702708759840
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 May 2023 08:25:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=LpkOR9TW;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6436e004954so3108474b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 08:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683386702; x=1685978702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CO86uwMGaZwMIPHkR3fNxjg+D0xfCEECM4SjXxBtVOw=;
        b=LpkOR9TW9IJIO6RWs1+zMzCVzYg2wi7RuNns4rJzo89Z/eYSENVEDZ/4VKNJ1FAkr9
         D9fP2HKpbQaXsLkepdHe+SrVdzVa5N2GKHLNBCK0d5J1yUflWx+kG5wbUFAZUFI1M4ia
         Wb03qVy0ADqevhTOEFXaRyRRfqpGXZ7/xqZQNbgAbH90gjBNgOTC1wyJ2uP+ArYn2oLm
         OqkSTttKC8Zi9yX14uKlbj9GZSKVJ0TIOc5C4IGis4Tgad/mTQ1gBF4WEAE3BrSPFEmm
         lqPppGT8SLAWNLUcp9EtHWKOmkxZv9MEjtGD7fSlP5gqIwL73V3olQWrbbqKW+xAfiCr
         YKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683386702; x=1685978702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO86uwMGaZwMIPHkR3fNxjg+D0xfCEECM4SjXxBtVOw=;
        b=jcxiQAMKQlW9lTXCxVVmzOl60hLnLjPkARxkCvhFS0zdYpvzRjDU0g0LwUq+m9M0M+
         Jz0XGT3GQryltGoxyRUB/NN1BDkI4XQfKIi/rXz/6t8zmlR/r73/qsSyMuPR7q63mupn
         fPoaCN/HI7Ly9LGdLRNUybWJTBaxX2m4vs3M5VkFjw3CktiUHaJwoaa7OM9WE9tsRZON
         hPbuGlCpz3QYhxfDEMNwT/BUbA0MENYlQ4uyFkHQWMarYWfp+VtjXODrj9g9cNkda0z7
         FodqYAjpzNLzR6zccglSZYXpnMOMZwa2mBnCNZ45h+WyXb3GLp7f0bqPpDqZSk9D7qjX
         uwEQ==
X-Gm-Message-State: AC+VfDzPxDjMD1HFpq41nXru//AX4FgsleWJlsTSYTFUjQM84qqiWSRv
	Bu5FbMCIAysiciQGhNGOGS2FjA3PXfC3oRYdoj8=
X-Google-Smtp-Source: ACHHUZ5cInr7gA4rBGFBVRgsDfuI7wRGmbcRNMwYqHPcnU1PVN/2KrHdPsKh3AT7MK1MWX7s3UwkCg==
X-Received: by 2002:aa7:8885:0:b0:643:139d:eb9e with SMTP id z5-20020aa78885000000b00643139deb9emr7911015pfe.6.1683386701589;
        Sat, 06 May 2023 08:25:01 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c8-20020a62e808000000b0063b1b84d54csm3296718pfi.213.2023.05.06.08.25.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 08:25:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/15] go: fix CVE-2023-24534 denial of service from excessive memory allocation
Date: Sat,  6 May 2023 05:24:34 -1000
Message-Id: <28bfa033ce965d7316a8b4296d10f3ad74d711db.1683386547.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683386547.git.steve@sakoman.com>
References: <cover.1683386547.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 06 May 2023 15:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180987

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
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2023-24534.patch           | 200 ++++++++++++++++++
 2 files changed, 201 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-24534.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index cda9227042..c5260569e2 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -28,6 +28,7 @@ SRC_URI += "\
     file://cve-2022-41725.patch \
     file://CVE-2022-41722.patch \
     file://CVE-2023-24537.patch \
+    file://CVE-2023-24534.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-24534.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-24534.patch
new file mode 100644
index 0000000000..c65c7852d5
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-24534.patch
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
+
+---
+ src/bytes/bytes.go               | 14 ++++++++
+ src/net/textproto/reader.go      | 30 ++++++++++------
+ src/net/textproto/reader_test.go | 59 ++++++++++++++++++++++++++++++++
+ 3 files changed, 92 insertions(+), 11 deletions(-)
+
+diff --git a/src/bytes/bytes.go b/src/bytes/bytes.go
+index ce52649..95ff31c 100644
+--- a/src/bytes/bytes.go
++++ b/src/bytes/bytes.go
+@@ -1174,3 +1174,17 @@ func Index(s, sep []byte) int {
+ 	}
+ 	return -1
+ }
++
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
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 6a680f4..fcbede8 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -493,8 +493,11 @@ func readMIMEHeader(r *Reader, lim int64) (MIMEHeader, error) {
+ 	// large one ahead of time which we'll cut up into smaller
+ 	// slices. If this isn't big enough later, we allocate small ones.
+ 	var strs []string
+-	hint := r.upcomingHeaderNewlines()
++	hint := r.upcomingHeaderKeys()
+ 	if hint > 0 {
++		if hint > 1000 {
++			hint = 1000 // set a cap to avoid overallocation
++		}
+ 		strs = make([]string, hint)
+ 	}
+ 
+@@ -589,9 +592,11 @@ func mustHaveFieldNameColon(line []byte) error {
+ 	return nil
+ }
+ 
+-// upcomingHeaderNewlines returns an approximation of the number of newlines
++var nl = []byte("\n")
++
++// upcomingHeaderKeys returns an approximation of the number of keys
+ // that will be in this header. If it gets confused, it returns 0.
+-func (r *Reader) upcomingHeaderNewlines() (n int) {
++func (r *Reader) upcomingHeaderKeys() (n int) {
+ 	// Try to determine the 'hint' size.
+ 	r.R.Peek(1) // force a buffer load if empty
+ 	s := r.R.Buffered()
+@@ -599,17 +604,20 @@ func (r *Reader) upcomingHeaderNewlines() (n int) {
+ 		return
+ 	}
+ 	peek, _ := r.R.Peek(s)
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
+ 		}
+ 		n++
+-		peek = peek[i+1:]
+ 	}
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
+ 	"bytes"
+ 	"io"
+ 	"reflect"
++	"runtime"
+ 	"strings"
+ 	"testing"
+ )
+@@ -127,6 +128,42 @@ func TestReadMIMEHeaderSingle(t *testing.T) {
+ 	}
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
+ 	r := reader(": bar\ntest-1: 1\n\n")
+ 	m, err := r.ReadMIMEHeader()
+@@ -223,6 +260,28 @@ func TestReadMIMEHeaderTrimContinued(t *testing.T) {
+ 	}
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
+ 	in       string
+ 	inCode   int
+-- 
+2.25.1
+
-- 
2.34.1


