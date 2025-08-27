Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADEECA0FFD
	for <webhook@archiver.kernel.org>; Wed, 27 Aug 2025 21:29:59 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.6593.1756330198875440829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Aug 2025 14:29:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TMOpu/go;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-327705d0a9bso316048a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 14:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756330198; x=1756934998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ahzeVbPCah3NaWQ2LGYF4J49q3HqY0R3Tkr2ALTcTRs=;
        b=TMOpu/goeouDfoKBlXZ+PjkMMn8lAxjOaA6y5jGBcs4LUNe9KQPGv6vnFaqRbcc8np
         ghw/u9k9+EwD9SHZYzAQGhJEEdwiY9SZRPt6zlN40eMcjSrzvmCDN5K3ewHsLXahgpFb
         WpjD+oXo8HN+ffbWo1upH6EhLrL2W+9Qt5DxTSNz66Y3aiTJPV8VSJxzILn6aWCUbxO2
         ngMpOAoIsg+AFdFGpHIhQu2hiktRnXQfdhHgmOGBIvCeLzQ4xzpVwTF/UU1j+es3e/m0
         AM9cNbLU7WCR+d4pwfHozCDxHWqbi4V90bz95jRCz4RonBq5Sl+y3yMml1egE2USY+N6
         JMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756330198; x=1756934998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahzeVbPCah3NaWQ2LGYF4J49q3HqY0R3Tkr2ALTcTRs=;
        b=jD/uCM5K9OOp4Ta2Mkwcy42qGJRE72zDh7T46Io9o3UafcY102gQwD5ivlyv6UvFev
         fBbV2cCb1JyFdnpa3m4k0aDNcFZbjuWlDMWGXP2nYkF3jj4/a4LAL+wrQ23dhbgrVQRz
         6KqfJALjkOxzvoUwj5CIqJCFCO9IQK0ybMfw4/Zr5pGu4b5ri9YAQ2u2/iv4IYNzfg52
         4ygOJLMdRDsLId9+ByAmU8XdGYaAfxA91VNjqsh/Z+559d3WmHg/w8JQQ1KPMVIDTay3
         fezMJhTvYFK60XWKFbTCOiB7daaqNRAGGvPyjNVyPonrm1O3lWO9AApDjXcF5JiLwDAN
         0AiA==
X-Gm-Message-State: AOJu0YybV+ieuFEXIxO291KOPOpkxZW26v1gNksJEmUBI4iIty9RDcZk
	Rhd1p+7cPLc52JZsqDBkphnCvFyulA375wpdLZBTaMtVUtqbFzwFAZL6YWCscqfsiIt5ZNsDa37
	EHnre
X-Gm-Gg: ASbGncvFZjtSnzp/w+yPWmE2ei8EnLw+GD1Sh9y8OqCpkmgw1BpEVTQh1LE3WiEIktw
	ZbQzUBDysGjQMoBhvvmFojAWdq8+zrbqFqzN2fLavxNvyZixFnFqN+IRB7xDAFiClqhG3zktPaw
	FcDTqTBl7GsimMBAUYZ2GgEXnq2yet2o3MJjf/r4UmzRczFwR+8s3sZW5yGNvw5xiRXRAv4Iu4W
	yiDqJjJYS4GTl3z3HwvIpC0kJorNHS1UVnuajqWbGH7meIUj7EapzkXT0opgSp4iswTKbDOpBb/
	xPrgKTqvpSXU0vmLGzJar6LZehNjONjBAD/BjvLiwDnoTTBElSNQ1WmZ/s+Dnhv8S6FoDD3cibf
	fzPchhCXf0zZaoIrDO7vp6NiP
X-Google-Smtp-Source: AGHT+IGOK2n6sEIZyinDU7uBlxVSC5iVHY8cD5vnd3E2tZ0U5DrpJkhlHPh5AVSiJiuM/VzULNlKaA==
X-Received: by 2002:a17:90b:2683:b0:325:58f6:1f91 with SMTP id 98e67ed59e1d1-32559056397mr18614589a91.11.1756330197800;
        Wed, 27 Aug 2025 14:29:57 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d0c9:1052:20fd:8423])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fce1f30sm2905857a91.23.2025.08.27.14.29.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 14:29:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/33] go: fix CVE-2025-47907
Date: Wed, 27 Aug 2025 14:29:12 -0700
Message-ID: <22d8ac9884208b8f9b2a69ec6a257c62e1f2f8d2.1756329972.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756329972.git.steve@sakoman.com>
References: <cover.1756329972.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Aug 2025 21:29:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222513

From: Praveen Kumar <praveen.kumar@windriver.com>

Cancelling a query (e.g. by cancelling the context passed to one of
the query methods) during a call to the Scan method of the returned
Rows can result in unexpected results if other queries are being made
in parallel. This can result in a race condition that may overwrite
the expected results with those of another query, causing the call to
Scan to return either unexpected results from the other query or an
error.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-47907

Upstream-patch:
https://github.com/golang/go/commit/8a924caaf348fdc366bab906424616b2974ad4e9

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
 .../go/go/CVE-2025-47907-pre.patch            | 233 +++++++++++++
 .../go/go/CVE-2025-47907.patch                | 328 ++++++++++++++++++
 3 files changed, 563 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47907-pre.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47907.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index 12d7539017..d0ce333117 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -18,6 +18,8 @@ SRC_URI += "\
     file://CVE-2025-22871.patch \
     file://CVE-2025-4673.patch \
     file://CVE-2025-4674.patch \
+    file://CVE-2025-47907-pre.patch \
+    file://CVE-2025-47907.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2025-47907-pre.patch b/meta/recipes-devtools/go/go/CVE-2025-47907-pre.patch
new file mode 100644
index 0000000000..dafa878e73
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-47907-pre.patch
@@ -0,0 +1,233 @@
+From c23579f031ecd09bf37c644723b33736dffa8b92 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 23 Jan 2024 15:59:47 -0800
+Subject: [PATCH 1/2] database/sql: avoid clobbering driver-owned memory in
+ RawBytes
+
+Depending on the query, a RawBytes can contain memory owned by the
+driver or by database/sql:
+
+If the driver provides the column as a []byte,
+RawBytes aliases that []byte.
+
+If the driver provides the column as any other type,
+RawBytes contains memory allocated by database/sql.
+Prior to this CL, Rows.Scan will reuse existing capacity in a
+RawBytes to permit a single allocation to be reused across rows.
+
+When a RawBytes is reused across queries, this can result
+in database/sql writing to driver-owned memory.
+
+Add a buffer to Rows to store RawBytes data, and reuse this
+buffer across calls to Rows.Scan.
+
+Fixes #65201
+
+Change-Id: Iac640174c7afa97eeb39496f47dec202501b2483
+Reviewed-on: https://go-review.googlesource.com/c/go/+/557917
+Reviewed-by: Brad Fitzpatrick <bradfitz@golang.org>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+
+CVE: CVE-2025-47907
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c23579f031ecd09bf37c644723b33736dffa8b92]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/database/sql/convert.go      |  8 +++---
+ src/database/sql/convert_test.go | 12 ++++++--
+ src/database/sql/sql.go          | 34 +++++++++++++++++++++++
+ src/database/sql/sql_test.go     | 47 ++++++++++++++++++++++++++++++++
+ 4 files changed, 94 insertions(+), 7 deletions(-)
+
+diff --git a/src/database/sql/convert.go b/src/database/sql/convert.go
+index cca5d15..999b8f1 100644
+--- a/src/database/sql/convert.go
++++ b/src/database/sql/convert.go
+@@ -237,7 +237,7 @@ func convertAssignRows(dest, src any, rows *Rows) error {
+			if d == nil {
+				return errNilPtr
+			}
+-			*d = append((*d)[:0], s...)
++			*d = rows.setrawbuf(append(rows.rawbuf(), s...))
+			return nil
+		}
+	case []byte:
+@@ -285,7 +285,7 @@ func convertAssignRows(dest, src any, rows *Rows) error {
+			if d == nil {
+				return errNilPtr
+			}
+-			*d = s.AppendFormat((*d)[:0], time.RFC3339Nano)
++			*d = rows.setrawbuf(s.AppendFormat(rows.rawbuf(), time.RFC3339Nano))
+			return nil
+		}
+	case decimalDecompose:
+@@ -366,8 +366,8 @@ func convertAssignRows(dest, src any, rows *Rows) error {
+		}
+	case *RawBytes:
+		sv = reflect.ValueOf(src)
+-		if b, ok := asBytes([]byte(*d)[:0], sv); ok {
+-			*d = RawBytes(b)
++		if b, ok := asBytes(rows.rawbuf(), sv); ok {
++			*d = rows.setrawbuf(b)
+			return nil
+		}
+	case *bool:
+diff --git a/src/database/sql/convert_test.go b/src/database/sql/convert_test.go
+index 6d09fa1..f94db8e 100644
+--- a/src/database/sql/convert_test.go
++++ b/src/database/sql/convert_test.go
+@@ -354,9 +354,10 @@ func TestRawBytesAllocs(t *testing.T) {
+		{"time", time.Unix(2, 5).UTC(), "1970-01-01T00:00:02.000000005Z"},
+	}
+
+-	buf := make(RawBytes, 10)
++	var buf RawBytes
++	rows := &Rows{}
+	test := func(name string, in any, want string) {
+-		if err := convertAssign(&buf, in); err != nil {
++		if err := convertAssignRows(&buf, in, rows); err != nil {
+			t.Fatalf("%s: convertAssign = %v", name, err)
+		}
+		match := len(buf) == len(want)
+@@ -375,6 +376,7 @@ func TestRawBytesAllocs(t *testing.T) {
+
+	n := testing.AllocsPerRun(100, func() {
+		for _, tt := range tests {
++			rows.raw = rows.raw[:0]
+			test(tt.name, tt.in, tt.want)
+		}
+	})
+@@ -383,7 +385,11 @@ func TestRawBytesAllocs(t *testing.T) {
+	// and gc. With 32-bit words there are more convT2E allocs, and
+	// with gccgo, only pointers currently go in interface data.
+	// So only care on amd64 gc for now.
+-	measureAllocs := runtime.GOARCH == "amd64" && runtime.Compiler == "gc"
++	measureAllocs := false
++	switch runtime.GOARCH {
++	case "amd64", "arm64":
++		measureAllocs = runtime.Compiler == "gc"
++	}
+
+	if n > 0.5 && measureAllocs {
+		t.Fatalf("allocs = %v; want 0", n)
+diff --git a/src/database/sql/sql.go b/src/database/sql/sql.go
+index 4f1197d..da0f52c 100644
+--- a/src/database/sql/sql.go
++++ b/src/database/sql/sql.go
+@@ -2936,6 +2936,13 @@ type Rows struct {
+	// not to be called concurrently.
+	lastcols []driver.Value
+
++	// raw is a buffer for RawBytes that persists between Scan calls.
++	// This is used when the driver returns a mismatched type that requires
++	// a cloning allocation. For example, if the driver returns a *string and
++	// the user is scanning into a *RawBytes, we need to copy the string.
++	// The raw buffer here lets us reuse the memory for that copy across Scan calls.
++	raw []byte
++
+	// closemuScanHold is whether the previous call to Scan kept closemu RLock'ed
+	// without unlocking it. It does that when the user passes a *RawBytes scan
+	// target. In that case, we need to prevent awaitDone from closing the Rows
+@@ -3130,6 +3137,32 @@ func (rs *Rows) Err() error {
+	return rs.lasterrOrErrLocked(nil)
+ }
+
++// rawbuf returns the buffer to append RawBytes values to.
++// This buffer is reused across calls to Rows.Scan.
++//
++// Usage:
++//
++//	rawBytes = rows.setrawbuf(append(rows.rawbuf(), value...))
++func (rs *Rows) rawbuf() []byte {
++	if rs == nil {
++		// convertAssignRows can take a nil *Rows; for simplicity handle it here
++		return nil
++	}
++	return rs.raw
++}
++
++// setrawbuf updates the RawBytes buffer with the result of appending a new value to it.
++// It returns the new value.
++func (rs *Rows) setrawbuf(b []byte) RawBytes {
++	if rs == nil {
++		// convertAssignRows can take a nil *Rows; for simplicity handle it here
++		return RawBytes(b)
++	}
++	off := len(rs.raw)
++	rs.raw = b
++	return RawBytes(rs.raw[off:])
++}
++
+ var errRowsClosed = errors.New("sql: Rows are closed")
+ var errNoRows = errors.New("sql: no Rows available")
+
+@@ -3337,6 +3370,7 @@ func (rs *Rows) Scan(dest ...any) error {
+
+	if scanArgsContainRawBytes(dest) {
+		rs.closemuScanHold = true
++		rs.raw = rs.raw[:0]
+	} else {
+		rs.closemu.RUnlock()
+	}
+diff --git a/src/database/sql/sql_test.go b/src/database/sql/sql_test.go
+index c38a348..c3b4822 100644
+--- a/src/database/sql/sql_test.go
++++ b/src/database/sql/sql_test.go
+@@ -4531,6 +4531,53 @@ func TestNilErrorAfterClose(t *testing.T) {
+	}
+ }
+
++// Issue #65201.
++//
++// If a RawBytes is reused across multiple queries,
++// subsequent queries shouldn't overwrite driver-owned memory from previous queries.
++func TestRawBytesReuse(t *testing.T) {
++	db := newTestDB(t, "people")
++	defer closeDB(t, db)
++
++	if _, err := db.Exec("USE_RAWBYTES"); err != nil {
++		t.Fatal(err)
++	}
++
++	var raw RawBytes
++
++	// The RawBytes in this query aliases driver-owned memory.
++	rows, err := db.Query("SELECT|people|name|")
++	if err != nil {
++		t.Fatal(err)
++	}
++	rows.Next()
++	rows.Scan(&raw) // now raw is pointing to driver-owned memory
++	name1 := string(raw)
++	rows.Close()
++
++	// The RawBytes in this query does not alias driver-owned memory.
++	rows, err = db.Query("SELECT|people|age|")
++	if err != nil {
++		t.Fatal(err)
++	}
++	rows.Next()
++	rows.Scan(&raw) // this must not write to the driver-owned memory in raw
++	rows.Close()
++
++	// Repeat the first query. Nothing should have changed.
++	rows, err = db.Query("SELECT|people|name|")
++	if err != nil {
++		t.Fatal(err)
++	}
++	rows.Next()
++	rows.Scan(&raw) // raw points to driver-owned memory again
++	name2 := string(raw)
++	rows.Close()
++	if name1 != name2 {
++		t.Fatalf("Scan read name %q, want %q", name2, name1)
++	}
++}
++
+ // badConn implements a bad driver.Conn, for TestBadDriver.
+ // The Exec method panics.
+ type badConn struct{}
+--
+2.40.0
diff --git a/meta/recipes-devtools/go/go/CVE-2025-47907.patch b/meta/recipes-devtools/go/go/CVE-2025-47907.patch
new file mode 100644
index 0000000000..a556c3dd68
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-47907.patch
@@ -0,0 +1,328 @@
+From 8a924caaf348fdc366bab906424616b2974ad4e9 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 23 Jul 2025 14:26:54 -0700
+Subject: [PATCH 2/2] database/sql: avoid closing Rows while scan is in
+ progress
+
+A database/sql/driver.Rows can return database-owned data
+from Rows.Next. The driver.Rows documentation doesn't explicitly
+document the lifetime guarantees for this data, but a reasonable
+expectation is that the caller of Next should only access it
+until the next call to Rows.Close or Rows.Next.
+
+Avoid violating that constraint when a query is cancelled while
+a call to database/sql.Rows.Scan (note the difference between
+the two different Rows types!) is in progress. We previously
+took care to avoid closing a driver.Rows while the user has
+access to driver-owned memory via a RawData, but we could still
+close a driver.Rows while a Scan call was in the process of
+reading previously-returned driver-owned data.
+
+Update the fake DB used in database/sql tests to invalidate
+returned data to help catch other places we might be
+incorrectly retaining it.
+
+Updates #74831
+Fixes #74832
+
+Change-Id: Ice45b5fad51b679c38e3e1d21ef39156b56d6037
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2540
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Neal Patel <nealpatel@google.com>
+Reviewed-on: https://go-internal-review.googlesource.com/c/go/+/2601
+Reviewed-on: https://go-review.googlesource.com/c/go/+/693558
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@golang.org>
+Reviewed-by: Mark Freeman <markfreeman@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2025-47907
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/8a924caaf348fdc366bab906424616b2974ad4e9]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/database/sql/convert.go     |  2 --
+ src/database/sql/fakedb_test.go | 47 ++++++++++++--------------
+ src/database/sql/sql.go         | 26 ++++++--------
+ src/database/sql/sql_test.go    | 60 ++++++++++++++++++++++++++++++---
+ 4 files changed, 89 insertions(+), 46 deletions(-)
+
+diff --git a/src/database/sql/convert.go b/src/database/sql/convert.go
+index 999b8f1..2869a3b 100644
+--- a/src/database/sql/convert.go
++++ b/src/database/sql/convert.go
+@@ -324,7 +324,6 @@ func convertAssignRows(dest, src any, rows *Rows) error {
+			if rows == nil {
+				return errors.New("invalid context to convert cursor rows, missing parent *Rows")
+			}
+-			rows.closemu.Lock()
+			*d = Rows{
+				dc:          rows.dc,
+				releaseConn: func(error) {},
+@@ -340,7 +339,6 @@ func convertAssignRows(dest, src any, rows *Rows) error {
+					parentCancel()
+				}
+			}
+-			rows.closemu.Unlock()
+			return nil
+		}
+	}
+diff --git a/src/database/sql/fakedb_test.go b/src/database/sql/fakedb_test.go
+index c6c3172..95c0fa3 100644
+--- a/src/database/sql/fakedb_test.go
++++ b/src/database/sql/fakedb_test.go
+@@ -5,6 +5,7 @@
+ package sql
+
+ import (
++	"bytes"
+	"context"
+	"database/sql/driver"
+	"errors"
+@@ -15,7 +16,6 @@ import (
+	"strconv"
+	"strings"
+	"sync"
+-	"sync/atomic"
+	"testing"
+	"time"
+ )
+@@ -91,8 +91,6 @@ func (cc *fakeDriverCtx) OpenConnector(name string) (driver.Connector, error) {
+ type fakeDB struct {
+	name string
+
+-	useRawBytes atomic.Bool
+-
+	mu       sync.Mutex
+	tables   map[string]*table
+	badConn  bool
+@@ -700,8 +698,6 @@ func (c *fakeConn) PrepareContext(ctx context.Context, query string) (driver.Stm
+		switch cmd {
+		case "WIPE":
+			// Nothing
+-		case "USE_RAWBYTES":
+-			c.db.useRawBytes.Store(true)
+		case "SELECT":
+			stmt, err = c.prepareSelect(stmt, parts)
+		case "CREATE":
+@@ -805,9 +801,6 @@ func (s *fakeStmt) ExecContext(ctx context.Context, args []driver.NamedValue) (d
+	case "WIPE":
+		db.wipe()
+		return driver.ResultNoRows, nil
+-	case "USE_RAWBYTES":
+-		s.c.db.useRawBytes.Store(true)
+-		return driver.ResultNoRows, nil
+	case "CREATE":
+		if err := db.createTable(s.table, s.colName, s.colType); err != nil {
+			return nil, err
+@@ -1090,10 +1083,9 @@ type rowsCursor struct {
+	errPos int
+	err    error
+
+-	// a clone of slices to give out to clients, indexed by the
+-	// original slice's first byte address.  we clone them
+-	// just so we're able to corrupt them on close.
+-	bytesClone map[*byte][]byte
++	// Data returned to clients.
++	// We clone and stash it here so it can be invalidated by Close and Next.
++	driverOwnedMemory [][]byte
+
+	// Every operation writes to line to enable the race detector
+	// check for data races.
+@@ -1110,9 +1102,19 @@ func (rc *rowsCursor) touchMem() {
+	rc.line++
+ }
+
++func (rc *rowsCursor) invalidateDriverOwnedMemory() {
++	for _, buf := range rc.driverOwnedMemory {
++		for i := range buf {
++			buf[i] = 'x'
++		}
++	}
++	rc.driverOwnedMemory = nil
++}
++
+ func (rc *rowsCursor) Close() error {
+	rc.touchMem()
+	rc.parentMem.touchMem()
++	rc.invalidateDriverOwnedMemory()
+	rc.closed = true
+	return rc.closeErr
+ }
+@@ -1143,6 +1145,8 @@ func (rc *rowsCursor) Next(dest []driver.Value) error {
+	if rc.posRow >= len(rc.rows[rc.posSet]) {
+		return io.EOF // per interface spec
+	}
++	// Corrupt any previously returned bytes.
++	rc.invalidateDriverOwnedMemory()
+	for i, v := range rc.rows[rc.posSet][rc.posRow].cols {
+		// TODO(bradfitz): convert to subset types? naah, I
+		// think the subset types should only be input to
+@@ -1150,20 +1154,13 @@ func (rc *rowsCursor) Next(dest []driver.Value) error {
+		// a wider range of types coming out of drivers. all
+		// for ease of drivers, and to prevent drivers from
+		// messing up conversions or doing them differently.
+-		dest[i] = v
+-
+-		if bs, ok := v.([]byte); ok && !rc.db.useRawBytes.Load() {
+-			if rc.bytesClone == nil {
+-				rc.bytesClone = make(map[*byte][]byte)
+-			}
+-			clone, ok := rc.bytesClone[&bs[0]]
+-			if !ok {
+-				clone = make([]byte, len(bs))
+-				copy(clone, bs)
+-				rc.bytesClone[&bs[0]] = clone
+-			}
+-			dest[i] = clone
++		if bs, ok := v.([]byte); ok {
++			// Clone []bytes and stash for later invalidation.
++			bs = bytes.Clone(bs)
++			rc.driverOwnedMemory = append(rc.driverOwnedMemory, bs)
++			v = bs
+		}
++		dest[i] = v
+	}
+	return nil
+ }
+diff --git a/src/database/sql/sql.go b/src/database/sql/sql.go
+index da0f52c..41130d9 100644
+--- a/src/database/sql/sql.go
++++ b/src/database/sql/sql.go
+@@ -3357,37 +3357,33 @@ func (rs *Rows) Scan(dest ...any) error {
+		return fmt.Errorf("sql: Scan called without calling Next (closemuScanHold)")
+	}
+	rs.closemu.RLock()
+-
+-	if rs.lasterr != nil && rs.lasterr != io.EOF {
++	rs.raw = rs.raw[:0]
++	err := rs.scanLocked(dest...)
++	if err == nil && scanArgsContainRawBytes(dest) {
++		rs.closemuScanHold = true
++	} else {
+		rs.closemu.RUnlock()
++	}
++	return err
++}
++func (rs *Rows) scanLocked(dest ...any) error {
++	if rs.lasterr != nil && rs.lasterr != io.EOF {
+		return rs.lasterr
+	}
+	if rs.closed {
+-		err := rs.lasterrOrErrLocked(errRowsClosed)
+-		rs.closemu.RUnlock()
+-		return err
+-	}
+-
+-	if scanArgsContainRawBytes(dest) {
+-		rs.closemuScanHold = true
+-		rs.raw = rs.raw[:0]
+-	} else {
+-		rs.closemu.RUnlock()
++		return rs.lasterrOrErrLocked(errRowsClosed)
+	}
+
+	if rs.lastcols == nil {
+-		rs.closemuRUnlockIfHeldByScan()
+		return errors.New("sql: Scan called without calling Next")
+	}
+	if len(dest) != len(rs.lastcols) {
+-		rs.closemuRUnlockIfHeldByScan()
+		return fmt.Errorf("sql: expected %d destination arguments in Scan, not %d", len(rs.lastcols), len(dest))
+	}
+
+	for i, sv := range rs.lastcols {
+		err := convertAssignRows(dest[i], sv, rs)
+		if err != nil {
+-			rs.closemuRUnlockIfHeldByScan()
+			return fmt.Errorf(`sql: Scan error on column index %d, name %q: %w`, i, rs.rowsi.Columns()[i], err)
+		}
+	}
+diff --git a/src/database/sql/sql_test.go b/src/database/sql/sql_test.go
+index c3b4822..ee65b1b 100644
+--- a/src/database/sql/sql_test.go
++++ b/src/database/sql/sql_test.go
+@@ -5,6 +5,7 @@
+ package sql
+
+ import (
++	"bytes"
+	"context"
+	"database/sql/driver"
+	"errors"
+@@ -4411,10 +4412,6 @@ func testContextCancelDuringRawBytesScan(t *testing.T, mode string) {
+	db := newTestDB(t, "people")
+	defer closeDB(t, db)
+
+-	if _, err := db.Exec("USE_RAWBYTES"); err != nil {
+-		t.Fatal(err)
+-	}
+-
+	// cancel used to call close asynchronously.
+	// This test checks that it waits so as not to interfere with RawBytes.
+	ctx, cancel := context.WithCancel(context.Background())
+@@ -4506,6 +4503,61 @@ func TestContextCancelBetweenNextAndErr(t *testing.T) {
+	}
+ }
+
++type testScanner struct {
++	scanf func(src any) error
++}
++
++func (ts testScanner) Scan(src any) error { return ts.scanf(src) }
++
++func TestContextCancelDuringScan(t *testing.T) {
++	db := newTestDB(t, "people")
++	defer closeDB(t, db)
++
++	ctx, cancel := context.WithCancel(context.Background())
++	defer cancel()
++
++	scanStart := make(chan any)
++	scanEnd := make(chan error)
++	scanner := &testScanner{
++		scanf: func(src any) error {
++			scanStart <- src
++			return <-scanEnd
++		},
++	}
++
++	// Start a query, and pause it mid-scan.
++	want := []byte("Alice")
++	r, err := db.QueryContext(ctx, "SELECT|people|name|name=?", string(want))
++	if err != nil {
++		t.Fatal(err)
++	}
++	if !r.Next() {
++		t.Fatalf("r.Next() = false, want true")
++	}
++	go func() {
++		r.Scan(scanner)
++	}()
++	got := <-scanStart
++	defer close(scanEnd)
++	gotBytes, ok := got.([]byte)
++	if !ok {
++		t.Fatalf("r.Scan returned %T, want []byte", got)
++	}
++	if !bytes.Equal(gotBytes, want) {
++		t.Fatalf("before cancel: r.Scan returned %q, want %q", gotBytes, want)
++	}
++
++	// Cancel the query.
++	// Sleep to give it a chance to finish canceling.
++	cancel()
++	time.Sleep(10 * time.Millisecond)
++
++	// Cancelling the query should not have changed the result.
++	if !bytes.Equal(gotBytes, want) {
++		t.Fatalf("after cancel: r.Scan result is now %q, want %q", gotBytes, want)
++	}
++}
++
+ func TestNilErrorAfterClose(t *testing.T) {
+	db := newTestDB(t, "people")
+	defer closeDB(t, db)
+--
+2.40.0
-- 
2.43.0


