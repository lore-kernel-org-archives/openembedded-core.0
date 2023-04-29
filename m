Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F20C77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 03:04:52 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.39480.1682737492306726731
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 20:04:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@mvista.com header.s=google header.b=akA3TuIH;
 spf=pass (domain: mvista.com, ip: 209.85.216.44, mailfrom: vkumbhar@mvista.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-247122e9845so459835a91.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 20:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1682737491; x=1685329491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fH/Y2st6UAb1IlEehqjoOo0SKDMEGVGFv1WKy11Q8es=;
        b=akA3TuIHm9rjR5ACM2WGZN0k2As3Am6mnCx6lCaU5BqtIedIck4iQtKKU5PqzVB7FH
         lRp5fpVAu6if/+BWEnaje/HiHaHB80lRk+Xw5sO21yyhuuFiN9oYWascD/HyFJOghrDe
         cypZMIDu5juI3VRAruhMItdAmnRex+rhS83vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682737491; x=1685329491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fH/Y2st6UAb1IlEehqjoOo0SKDMEGVGFv1WKy11Q8es=;
        b=G/D6EaXvm65uTyesOL0uBdFeRRbJA9b8t3WkMMrSvj/QXrBrHYRrA7A89hgRAOEYYc
         RMh3X/NmuXz+ol1BKzHH/tmp93rx/qdYmQ6dy6ECmLnEpWlYtsBixxaWdLSl9xkqcOk/
         qbsbZP9sZYGeTX1fy+6ZO73mHT9WUZYsFFeDyC/1P5Ma5rdrgt+f/ArMeFPO1UfZNDug
         /hLoH2YZFvu1XGI9pCnSUllvaxxCawZzAtPQyHs2RIGLqLdQCzSJasVULKv5YtzSJDcr
         zTTu3VL9KBVJ5gLNokGs2jE9EDFS63mhiG4vesp1Yyo40LBDVlnPe9rkrtHffFm0TLcb
         3LeA==
X-Gm-Message-State: AC+VfDxO4YLrLO4JyucCploq5XKSHf5azHY7APlXuADMxH3cc75OU0E2
	Pv60U8bahbhKgiQHYG6uscj/JUKq7iNgKibtrq0=
X-Google-Smtp-Source: ACHHUZ64BLv5m/rw3vg4thEwL42vsTCi372AXb7bqEVs4POaA6N0TEbzeckVm9acUPduIDThXva0uQ==
X-Received: by 2002:a17:90a:1b0c:b0:247:1de8:8263 with SMTP id q12-20020a17090a1b0c00b002471de88263mr7641575pjq.4.1682737491170;
        Fri, 28 Apr 2023 20:04:51 -0700 (PDT)
Received: from localhost.localdomain ([116.74.155.26])
        by smtp.googlemail.com with ESMTPSA id r23-20020a17090a941700b00247bdd05fe5sm2045461pjo.29.2023.04.28.20.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 20:04:50 -0700 (PDT)
From: vkumbhar@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] go: fix CVE-2023-24534 denial of service from excessive memory allocation
Date: Sat, 29 Apr 2023 08:34:36 +0530
Message-Id: <20230429030436.820701-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 03:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180539

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
2.25.1


