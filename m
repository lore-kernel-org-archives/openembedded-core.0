Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D767CCA476
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 19:50:21 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.223.1759261819205176116
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 12:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ALOoiZ3N;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-781db5068b8so3227853b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1759261818; x=1759866618; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0dFLo5BxVHB9lu3IgxM6PACZgApJPAPq0BxUF/+Bt0=;
        b=ALOoiZ3NPMjW+ZpRXaAlWkp2T3HD7ifd8QAAyQP+CjCa3BTVfPWSk/X0sZkwxuYsEK
         TBKm0KDpYF5Xl2ncuIEqBXKHuZlLybU43pLRDP07Gwh1itV8WI11+eWWizbieaxU1nFm
         OHV1/vXsnZw1hLlHUJRSamfaccv6nxZMnufNt624H98EZRAby7eXw0xPTImTvG4fGLbt
         p6deMFjRODOEHhMHvhKlbaTs68mwQNdwYYZq1C7MoWkCKqIzKIoTSZKgnEStNv6KtV5l
         afPaKjA6N/SQ+nGdfIF0aEDmat4D2LKpdV9ldIAOhNF8FKjFYtY/cySMgRVjp2VfzU00
         Aw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759261818; x=1759866618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0dFLo5BxVHB9lu3IgxM6PACZgApJPAPq0BxUF/+Bt0=;
        b=atumG+3vnaKoFlOgFj0zv4ymItZpnynsUF8by+kLJUzHOc9aNBhBC57xM+dId2UIBm
         TmMsO3GiT7In4nWRe4Qw4FRS8YBcN77z6bLD+6KycqoUr/GCEMaZO19HpoQk34r7jfZr
         joUr7GioHl4Djw+5AeM+VVGw9t6woyQXOjeOmvyfbUG30xQH6Leu1H1LntWo4DS/q4cy
         gelMt2PlBac3ouegyiPfdGa6Ge/u1tHF1qQlZks2v7CIybr0sdOGU3s9HLPZsszTGghP
         NLCwVg5tv8HCyX6lhqUlLaNtCNWWS9b526H59/kpdeghElIifDN0syohPi+/6wqpJbHV
         L+EQ==
X-Gm-Message-State: AOJu0Yx6MhJ42+FajQxPXyCrx8ztFaPU0cnBUBU50mNXqNjga4lonxLu
	7i+i6A9FghPy8O/DQ/H1sfN5qYTflvBPDV7kGr/RcZl6clhG2OrK8FfPbb6M6+os6Wb3uTSzKpX
	fzzXm
X-Gm-Gg: ASbGncs2qxbZXVd56o+v9x9wIR4rnLRvkx/tJhLEMSFdyt4gcohb/CDb+Zp5iEc2QqI
	ZI/2JQC/Lkq03nuHZ1xhOtRHcGnKBnVl4cFLYzlSQs5ijJ06q5xI1ciUycaWBRucT6xmL7jqOjJ
	VMctf0+avPkWdf1DIIzwvmFC6idVd6mkWK1Co2x0358R/ye0SAwQ6WvOmzvq73qbHZr56De4/5/
	wLdOtv8dWJ/wJbsVeHHEeFutU5EcJIso8bQIoGCm3prfquwsEBjPAO4YOI5vuVSuFthN9IPeM6D
	BOJ7HIMDkGBlb4ufZ0RMbDlijjStsd0WjS368tyDOOb+6EKalD195gpN3JdULVK3fRbiGOhgYJX
	K5qFU/ySBwT76T7Xn+nfcd2U7Imoj6oSq8H9nk/frge3J7W0i
X-Google-Smtp-Source: AGHT+IEVJhhyggrCRqeGNHws1KVnpbMRYRVUteOTyUZQZ7yqW4HyzDBa3omEmRlJQ65bbR41MF8dmQ==
X-Received: by 2002:a05:6a00:b55:b0:781:1f5e:8bc5 with SMTP id d2e1a72fcca58-78af4205d72mr700983b3a.18.1759261817614;
        Tue, 30 Sep 2025 12:50:17 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm14411202b3a.8.2025.09.30.12.50.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:50:17 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/7] go: fix CVE-2025-47907
Date: Tue, 30 Sep 2025 12:50:03 -0700
Message-ID: <af9c43c39764ce9ce37785c44dfb83e25cb24703.1759260542.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759260542.git.steve@sakoman.com>
References: <cover.1759260542.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 19:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224194

From: Praveen Kumar <praveen.kumar@windriver.com>

Cancelling a query (e.g. by cancelling the context passed to one of
the query methods) during a call to the Scan method of the returned
Rows can result in unexpected results if other queries are being made
in parallel. This can result in a race condition that may overwrite
the expected results with those of another query, causing the call to
Scan to return either unexpected results from the other query or an
error.

Made below changes for Go 1.17 backport:
- Replaced `atomic.Pointer[error]` with `atomic.Value`, since
  atomic pointers are not supported in Go 1.17.
- Used errp.(*error) to retrieve and dereference
  the stored *error, Without this, build fails with:
  invalid indirect of errp (type interface{}).
- Replaced Go 1.18 `any` keyword with `interface{}` for backward
  compatibility with Go 1.17.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-47907

Upstream-patch:
https://github.com/golang/go/commit/8a924caaf348fdc366bab906424616b2974ad4e9
https://github.com/golang/go/commit/298fe517a9333c05143a8a8e1f9d5499f0c6e59b
https://github.com/golang/go/commit/c23579f031ecd09bf37c644723b33736dffa8b92

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       | 125 ++++---
 .../go/go-1.21/CVE-2025-47907-pre-0001.patch  | 354 ++++++++++++++++++
 .../go/go-1.21/CVE-2025-47907-pre-0002.patch  | 232 ++++++++++++
 .../go/go-1.21/CVE-2025-47907.patch           | 327 ++++++++++++++++
 4 files changed, 977 insertions(+), 61 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0001.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0002.patch
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-47907.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index b17853035b..2052f4adbc 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -4,67 +4,70 @@ FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.21:${FILE_DIRNAME}/go-1.20:${FI
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 
-SRC_URI += "\
-    file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
-    file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
-    file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
-    file://0004-ld-add-soname-to-shareable-objects.patch \
-    file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
-    file://0006-cmd-dist-separate-host-and-target-builds.patch \
-    file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
-    file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
-    file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
-    file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
-    file://0010-net-Fix-issue-with-DNS-not-being-updated.patch  \
-    file://CVE-2022-27664.patch \
-    file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
-    file://CVE-2022-41715.patch \
-    file://CVE-2022-41717.patch \
-    file://CVE-2022-2879.patch \
-    file://CVE-2022-41720.patch \
-    file://CVE-2022-41723.patch \
-    file://cve-2022-41724.patch \
-    file://add_godebug.patch \
-    file://cve-2022-41725.patch \
-    file://CVE-2022-41722.patch \
-    file://CVE-2023-24537.patch \
-    file://CVE-2023-24534.patch \
-    file://CVE-2023-24538_1.patch \
-    file://CVE-2023-24538_2.patch \
-    file://CVE-2023-24540.patch \
-    file://CVE-2023-24539.patch \
-    file://CVE-2023-29404.patch \
-    file://CVE-2023-29405.patch \
-    file://CVE-2023-29402.patch \
-    file://CVE-2023-29400.patch \
-    file://CVE-2023-29406-1.patch \
-    file://CVE-2023-29406-2.patch \
-    file://CVE-2023-24536_1.patch \
-    file://CVE-2023-24536_2.patch \
-    file://CVE-2023-24536_3.patch \
-    file://CVE-2023-24531_1.patch \
-    file://CVE-2023-24531_2.patch \
-    file://CVE-2023-29409.patch \
-    file://CVE-2023-39319.patch \
-    file://CVE-2023-39318.patch \
-    file://CVE-2023-39326.patch \
-    file://CVE-2023-45285.patch \
-    file://CVE-2023-45287.patch \
-    file://CVE-2023-45289.patch \
-    file://CVE-2023-45290.patch \
-    file://CVE-2024-24784.patch \
-    file://CVE-2024-24785.patch \
-    file://CVE-2023-45288.patch \
-    file://CVE-2024-24789.patch \
-    file://CVE-2024-24791.patch \
-    file://CVE-2024-34155.patch \
-    file://CVE-2024-34156.patch \
-    file://CVE-2024-34158.patch \
-    file://CVE-2024-45336.patch \
-    file://CVE-2025-22871.patch \
-    file://CVE-2025-4673.patch \
-"
+SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main \
+           file://0001-allow-CC-and-CXX-to-have-multiple-words.patch \
+           file://0002-cmd-go-make-content-based-hash-generation-less-pedan.patch \
+           file://0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch \
+           file://0004-ld-add-soname-to-shareable-objects.patch \
+           file://0005-make.bash-override-CC-when-building-dist-and-go_boot.patch \
+           file://0006-cmd-dist-separate-host-and-target-builds.patch \
+           file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
+           file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+           file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
+           file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
+           file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
+           file://0010-net-Fix-issue-with-DNS-not-being-updated.patch \
+           file://CVE-2022-27664.patch \
+           file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
+           file://CVE-2022-41715.patch \
+           file://CVE-2022-41717.patch \
+           file://CVE-2022-2879.patch \
+           file://CVE-2022-41720.patch \
+           file://CVE-2022-41723.patch \
+           file://cve-2022-41724.patch \
+           file://add_godebug.patch \
+           file://cve-2022-41725.patch \
+           file://CVE-2022-41722.patch \
+           file://CVE-2023-24537.patch \
+           file://CVE-2023-24534.patch \
+           file://CVE-2023-24538_1.patch \
+           file://CVE-2023-24538_2.patch \
+           file://CVE-2023-24540.patch \
+           file://CVE-2023-24539.patch \
+           file://CVE-2023-29404.patch \
+           file://CVE-2023-29405.patch \
+           file://CVE-2023-29402.patch \
+           file://CVE-2023-29400.patch \
+           file://CVE-2023-29406-1.patch \
+           file://CVE-2023-29406-2.patch \
+           file://CVE-2023-24536_1.patch \
+           file://CVE-2023-24536_2.patch \
+           file://CVE-2023-24536_3.patch \
+           file://CVE-2023-24531_1.patch \
+           file://CVE-2023-24531_2.patch \
+           file://CVE-2023-29409.patch \
+           file://CVE-2023-39319.patch \
+           file://CVE-2023-39318.patch \
+           file://CVE-2023-39326.patch \
+           file://CVE-2023-45285.patch \
+           file://CVE-2023-45287.patch \
+           file://CVE-2023-45289.patch \
+           file://CVE-2023-45290.patch \
+           file://CVE-2024-24784.patch \
+           file://CVE-2024-24785.patch \
+           file://CVE-2023-45288.patch \
+           file://CVE-2024-24789.patch \
+           file://CVE-2024-24791.patch \
+           file://CVE-2024-34155.patch \
+           file://CVE-2024-34156.patch \
+           file://CVE-2024-34158.patch \
+           file://CVE-2024-45336.patch \
+           file://CVE-2025-22871.patch \
+           file://CVE-2025-4673.patch \
+           file://CVE-2025-47907-pre-0001.patch \
+           file://CVE-2025-47907-pre-0002.patch \
+           file://CVE-2025-47907.patch \
+           "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
 # Upstream don't believe it is a signifiant real world issue and will only
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0001.patch b/meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0001.patch
new file mode 100644
index 0000000000..97e7539dc3
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0001.patch
@@ -0,0 +1,354 @@
+From 298fe517a9333c05143a8a8e1f9d5499f0c6e59b Mon Sep 17 00:00:00 2001
+From: Brad Fitzpatrick <bradfitz@golang.org>
+Date: Tue, 23 May 2023 15:12:47 -0700
+Subject: [PATCH] database/sql: make RawBytes safely usable with contexts
+
+sql.RawBytes was added the very first Go release, Go 1. Its docs
+say:
+
+> RawBytes is a byte slice that holds a reference to memory owned by
+> the database itself. After a Scan into a RawBytes, the slice is only
+> valid until the next call to Next, Scan, or Close.
+
+That "only valid until the next call" bit was true at the time,
+until contexts were added to database/sql in Go 1.8.
+
+In the past ~dozen releases it's been unsafe to use QueryContext with
+a context that might become Done to get an *sql.Rows that's scanning
+into a RawBytes. The Scan can succeed, but then while the caller's
+reading the memory, a database/sql-managed goroutine can see the
+context becoming done and call Close on the database/sql/driver and
+make the caller's view of the RawBytes memory no longer valid,
+introducing races, crashes, or database corruption. See #60304
+and #53970 for details.
+
+This change does the minimal surgery on database/sql to make it safe
+again: Rows.Scan was already acquiring a mutex to check whether the
+rows had been closed, so this change make Rows.Scan notice whether
+*RawBytes was used and, if so, doesn't release the mutex on exit
+before returning. That mean it's still locked while the user code
+operates on the RawBytes memory and the concurrent context-watching
+goroutine to close the database still runs, but if it fires, it then
+gets blocked on the mutex until the next call to a Rows method (Next,
+NextResultSet, Err, Close).
+
+Updates #60304
+Updates #53970 (earlier one I'd missed)
+
+Change-Id: Ie41c0c6f32c24887b2f53ec3686c2aab73a1bfff
+Reviewed-on: https://go-review.googlesource.com/c/go/+/497675
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Ian Lance Taylor <iant@google.com>
+Run-TryBot: Brad Fitzpatrick <bradfitz@golang.org>
+Auto-Submit: Ian Lance Taylor <iant@google.com>
+Reviewed-by: Russ Cox <rsc@golang.org>
+
+CVE: CVE-2025-47907
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/298fe517a9333c05143a8a8e1f9d5499f0c6e59b]
+
+Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
+---
+ src/database/sql/fakedb_test.go | 13 +++++-
+ src/database/sql/sql.go         | 72 ++++++++++++++++++++++++++++++++-
+ src/database/sql/sql_test.go    | 58 ++++++++++++++++++++++++++
+ 3 files changed, 141 insertions(+), 2 deletions(-)
+
+diff --git a/src/database/sql/fakedb_test.go b/src/database/sql/fakedb_test.go
+index 4b68f1c..33c57b9 100644
+--- a/src/database/sql/fakedb_test.go
++++ b/src/database/sql/fakedb_test.go
+@@ -15,6 +15,7 @@ import (
+	"strconv"
+	"strings"
+	"sync"
++	"sync/atomic"
+	"testing"
+	"time"
+ )
+@@ -90,6 +91,8 @@ func (cc *fakeDriverCtx) OpenConnector(name string) (driver.Connector, error) {
+ type fakeDB struct {
+	name string
+
++	useRawBytes atomic.Bool
++
+	mu       sync.Mutex
+	tables   map[string]*table
+	badConn  bool
+@@ -680,6 +683,8 @@ func (c *fakeConn) PrepareContext(ctx context.Context, query string) (driver.Stm
+		switch cmd {
+		case "WIPE":
+			// Nothing
++		case "USE_RAWBYTES":
++			c.db.useRawBytes.Store(true)
+		case "SELECT":
+			stmt, err = c.prepareSelect(stmt, parts)
+		case "CREATE":
+@@ -783,6 +788,9 @@ func (s *fakeStmt) ExecContext(ctx context.Context, args []driver.NamedValue) (d
+	case "WIPE":
+		db.wipe()
+		return driver.ResultNoRows, nil
++	case "USE_RAWBYTES":
++		s.c.db.useRawBytes.Store(true)
++		return driver.ResultNoRows, nil
+	case "CREATE":
+		if err := db.createTable(s.table, s.colName, s.colType); err != nil {
+			return nil, err
+@@ -912,6 +920,7 @@ func (s *fakeStmt) QueryContext(ctx context.Context, args []driver.NamedValue) (
+				txStatus = "transaction"
+			}
+			cursor := &rowsCursor{
++				db:        s.c.db,
+				parentMem: s.c,
+				posRow:    -1,
+				rows: [][]*row{
+@@ -1008,6 +1017,7 @@ func (s *fakeStmt) QueryContext(ctx context.Context, args []driver.NamedValue) (
+	}
+
+	cursor := &rowsCursor{
++		db:        s.c.db,
+		parentMem: s.c,
+		posRow:    -1,
+		rows:      setMRows,
+@@ -1050,6 +1060,7 @@ func (tx *fakeTx) Rollback() error {
+ }
+
+ type rowsCursor struct {
++	db        *fakeDB
+	parentMem memToucher
+	cols      [][]string
+	colType   [][]string
+@@ -1121,7 +1132,7 @@ func (rc *rowsCursor) Next(dest []driver.Value) error {
+		// messing up conversions or doing them differently.
+		dest[i] = v
+
+-		if bs, ok := v.([]byte); ok {
++		if bs, ok := v.([]byte); ok && !rc.db.useRawBytes.Load() {
+			if rc.bytesClone == nil {
+				rc.bytesClone = make(map[*byte][]byte)
+			}
+diff --git a/src/database/sql/sql.go b/src/database/sql/sql.go
+index 68fb392..ef49e70 100644
+--- a/src/database/sql/sql.go
++++ b/src/database/sql/sql.go
+@@ -2879,6 +2879,8 @@ type Rows struct {
+	cancel      func()      // called when Rows is closed, may be nil.
+	closeStmt   *driverStmt // if non-nil, statement to Close on close
+
++	contextDone atomic.Value // error that awaitDone saw; set before close attempt
++
+	// closemu prevents Rows from closing while there
+	// is an active streaming result. It is held for read during non-close operations
+	// and exclusively during close.
+@@ -2891,6 +2893,15 @@ type Rows struct {
+	// lastcols is only used in Scan, Next, and NextResultSet which are expected
+	// not to be called concurrently.
+	lastcols []driver.Value
++
++	// closemuScanHold is whether the previous call to Scan kept closemu RLock'ed
++	// without unlocking it. It does that when the user passes a *RawBytes scan
++	// target. In that case, we need to prevent awaitDone from closing the Rows
++	// while the user's still using the memory. See go.dev/issue/60304.
++	//
++	// It is only used by Scan, Next, and NextResultSet which are expected
++	// not to be called concurrently.
++	closemuScanHold bool
+ }
+
+ // lasterrOrErrLocked returns either lasterr or the provided err.
+@@ -2928,7 +2939,11 @@ func (rs *Rows) awaitDone(ctx, txctx context.Context) {
+	}
+	select {
+	case <-ctx.Done():
++		err := ctx.Err()
++		rs.contextDone.Store(&err)
+	case <-txctxDone:
++		err := txctx.Err()
++		rs.contextDone.Store(&err)
+	}
+	rs.close(ctx.Err())
+ }
+@@ -2940,6 +2955,15 @@ func (rs *Rows) awaitDone(ctx, txctx context.Context) {
+ //
+ // Every call to Scan, even the first one, must be preceded by a call to Next.
+ func (rs *Rows) Next() bool {
++	// If the user's calling Next, they're done with their previous row's Scan
++	// results (any RawBytes memory), so we can release the read lock that would
++	// be preventing awaitDone from calling close.
++	rs.closemuRUnlockIfHeldByScan()
++
++	if rs.contextDone.Load() != nil {
++		return false
++	}
++
+	var doClose, ok bool
+	withLock(rs.closemu.RLocker(), func() {
+		doClose, ok = rs.nextLocked()
+@@ -2994,6 +3018,11 @@ func (rs *Rows) nextLocked() (doClose, ok bool) {
+ // scanning. If there are further result sets they may not have rows in the result
+ // set.
+ func (rs *Rows) NextResultSet() bool {
++	// If the user's calling NextResultSet, they're done with their previous
++	// row's Scan results (any RawBytes memory), so we can release the read lock
++	// that would be preventing awaitDone from calling close.
++	rs.closemuRUnlockIfHeldByScan()
++
+	var doClose bool
+	defer func() {
+		if doClose {
+@@ -3030,6 +3059,10 @@ func (rs *Rows) NextResultSet() bool {
+ // Err returns the error, if any, that was encountered during iteration.
+ // Err may be called after an explicit or implicit Close.
+ func (rs *Rows) Err() error {
++	if errp := rs.contextDone.Load(); errp != nil {
++		return *(errp.(*error))
++	}
++
+	rs.closemu.RLock()
+	defer rs.closemu.RUnlock()
+	return rs.lasterrOrErrLocked(nil)
+@@ -3223,6 +3256,11 @@ func rowsColumnInfoSetupConnLocked(rowsi driver.Rows) []*ColumnType {
+ // If any of the first arguments implementing Scanner returns an error,
+ // that error will be wrapped in the returned error
+ func (rs *Rows) Scan(dest ...interface{}) error {
++	if rs.closemuScanHold {
++		// This should only be possible if the user calls Scan twice in a row
++		// without calling Next.
++		return fmt.Errorf("sql: Scan called without calling Next (closemuScanHold)")
++	}
+	rs.closemu.RLock()
+
+	if rs.lasterr != nil && rs.lasterr != io.EOF {
+@@ -3234,23 +3272,50 @@ func (rs *Rows) Scan(dest ...interface{}) error {
+		rs.closemu.RUnlock()
+		return err
+	}
+-	rs.closemu.RUnlock()
++
++	if scanArgsContainRawBytes(dest) {
++		rs.closemuScanHold = true
++	} else {
++		rs.closemu.RUnlock()
++	}
+
+	if rs.lastcols == nil {
++		rs.closemuRUnlockIfHeldByScan()
+		return errors.New("sql: Scan called without calling Next")
+	}
+	if len(dest) != len(rs.lastcols) {
++		rs.closemuRUnlockIfHeldByScan()
+		return fmt.Errorf("sql: expected %d destination arguments in Scan, not %d", len(rs.lastcols), len(dest))
+	}
++
+	for i, sv := range rs.lastcols {
+		err := convertAssignRows(dest[i], sv, rs)
+		if err != nil {
++			rs.closemuRUnlockIfHeldByScan()
+			return fmt.Errorf(`sql: Scan error on column index %d, name %q: %w`, i, rs.rowsi.Columns()[i], err)
+		}
+	}
+	return nil
+ }
+
++// closemuRUnlockIfHeldByScan releases any closemu.RLock held open by a previous
++// call to Scan with *RawBytes.
++func (rs *Rows) closemuRUnlockIfHeldByScan() {
++	if rs.closemuScanHold {
++		rs.closemuScanHold = false
++		rs.closemu.RUnlock()
++	}
++}
++
++func scanArgsContainRawBytes(args []interface{}) bool {
++	for _, a := range args {
++		if _, ok := a.(*RawBytes); ok {
++			return true
++		}
++	}
++	return false
++}
++
+ // rowsCloseHook returns a function so tests may install the
+ // hook through a test only mutex.
+ var rowsCloseHook = func() func(*Rows, *error) { return nil }
+@@ -3260,6 +3325,11 @@ var rowsCloseHook = func() func(*Rows, *error) { return nil }
+ // the Rows are closed automatically and it will suffice to check the
+ // result of Err. Close is idempotent and does not affect the result of Err.
+ func (rs *Rows) Close() error {
++	// If the user's calling Close, they're done with their previous row's Scan
++	// results (any RawBytes memory), so we can release the read lock that would
++	// be preventing awaitDone from calling the unexported close before we do so.
++	rs.closemuRUnlockIfHeldByScan()
++
+	return rs.close(nil)
+ }
+
+diff --git a/src/database/sql/sql_test.go b/src/database/sql/sql_test.go
+index f771dee..53b38d1 100644
+--- a/src/database/sql/sql_test.go
++++ b/src/database/sql/sql_test.go
+@@ -4255,6 +4255,64 @@ func TestRowsScanProperlyWrapsErrors(t *testing.T) {
+	}
+ }
+
++// From go.dev/issue/60304
++func TestContextCancelDuringRawBytesScan(t *testing.T) {
++	db := newTestDB(t, "people")
++	defer closeDB(t, db)
++
++	if _, err := db.Exec("USE_RAWBYTES"); err != nil {
++		t.Fatal(err)
++	}
++
++	ctx, cancel := context.WithCancel(context.Background())
++	defer cancel()
++
++	r, err := db.QueryContext(ctx, "SELECT|people|name|")
++	if err != nil {
++		t.Fatal(err)
++	}
++	numRows := 0
++	var sink byte
++	for r.Next() {
++		numRows++
++		var s RawBytes
++		err = r.Scan(&s)
++		if !r.closemuScanHold {
++			t.Errorf("expected closemu to be held")
++		}
++		if err != nil {
++			t.Fatal(err)
++		}
++		t.Logf("read %q", s)
++		if numRows == 2 {
++			cancel() // invalidate the context, which used to call close asynchronously
++		}
++		for _, b := range s { // some operation reading from the raw memory
++			sink += b
++		}
++	}
++	if r.closemuScanHold {
++		t.Errorf("closemu held; should not be")
++	}
++
++	// There are 3 rows. We canceled after reading 2 so we expect either
++	// 2 or 3 depending on how the awaitDone goroutine schedules.
++	switch numRows {
++	case 0, 1:
++		t.Errorf("got %d rows; want 2+", numRows)
++	case 2:
++		if err := r.Err(); err != context.Canceled {
++			t.Errorf("unexpected error: %v (%T)", err, err)
++		}
++	default:
++		// Made it to the end. This is rare, but fine. Permit it.
++	}
++
++	if err := r.Close(); err != nil {
++		t.Fatal(err)
++	}
++}
++
+ // badConn implements a bad driver.Conn, for TestBadDriver.
+ // The Exec method panics.
+ type badConn struct{}
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0002.patch b/meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0002.patch
new file mode 100644
index 0000000000..fe0b6a4d9c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2025-47907-pre-0002.patch
@@ -0,0 +1,232 @@
+From c23579f031ecd09bf37c644723b33736dffa8b92 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Tue, 23 Jan 2024 15:59:47 -0800
+Subject: [PATCH] database/sql: avoid clobbering driver-owned memory in
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
+ src/database/sql/convert_test.go | 14 +++++++---
+ src/database/sql/sql.go          | 34 +++++++++++++++++++++++
+ src/database/sql/sql_test.go     | 47 ++++++++++++++++++++++++++++++++
+ 4 files changed, 95 insertions(+), 8 deletions(-)
+
+diff --git a/src/database/sql/convert.go b/src/database/sql/convert.go
+index b966ef9..3a581f6 100644
+--- a/src/database/sql/convert.go
++++ b/src/database/sql/convert.go
+@@ -237,7 +237,7 @@ func convertAssignRows(dest, src interface{}, rows *Rows) error {
+			if d == nil {
+				return errNilPtr
+			}
+-			*d = append((*d)[:0], s...)
++			*d = rows.setrawbuf(append(rows.rawbuf(), s...))
+			return nil
+		}
+	case []byte:
+@@ -285,7 +285,7 @@ func convertAssignRows(dest, src interface{}, rows *Rows) error {
+			if d == nil {
+				return errNilPtr
+			}
+-			*d = s.AppendFormat((*d)[:0], time.RFC3339Nano)
++			*d = rows.setrawbuf(s.AppendFormat(rows.rawbuf(), time.RFC3339Nano))
+			return nil
+		}
+	case decimalDecompose:
+@@ -366,8 +366,8 @@ func convertAssignRows(dest, src interface{}, rows *Rows) error {
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
+index 2668a5e..23a70bf 100644
+--- a/src/database/sql/convert_test.go
++++ b/src/database/sql/convert_test.go
+@@ -357,9 +357,10 @@ func TestRawBytesAllocs(t *testing.T) {
+		{"time", time.Unix(2, 5).UTC(), "1970-01-01T00:00:02.000000005Z"},
+	}
+
+-	buf := make(RawBytes, 10)
+-	test := func(name string, in interface{}, want string) {
+-		if err := convertAssign(&buf, in); err != nil {
++	var buf RawBytes
++	rows := &Rows{}
++	test := func(name string, in interface{}, want string) {
++		if err := convertAssignRows(&buf, in, rows); err != nil {
+			t.Fatalf("%s: convertAssign = %v", name, err)
+		}
+		match := len(buf) == len(want)
+@@ -378,6 +379,7 @@ func TestRawBytesAllocs(t *testing.T) {
+
+	n := testing.AllocsPerRun(100, func() {
+		for _, tt := range tests {
++			rows.raw = rows.raw[:0]
+			test(tt.name, tt.in, tt.want)
+		}
+	})
+@@ -386,7 +388,11 @@ func TestRawBytesAllocs(t *testing.T) {
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
+index ef49e70..e25447c 100644
+--- a/src/database/sql/sql.go
++++ b/src/database/sql/sql.go
+@@ -2894,6 +2894,13 @@ type Rows struct {
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
+@@ -3068,6 +3075,32 @@ func (rs *Rows) Err() error {
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
+@@ -3275,6 +3308,7 @@ func (rs *Rows) Scan(dest ...interface{}) error {
+
+	if scanArgsContainRawBytes(dest) {
+		rs.closemuScanHold = true
++		rs.raw = rs.raw[:0]
+	} else {
+		rs.closemu.RUnlock()
+	}
+diff --git a/src/database/sql/sql_test.go b/src/database/sql/sql_test.go
+index 53b38d1..6aa9bf0 100644
+--- a/src/database/sql/sql_test.go
++++ b/src/database/sql/sql_test.go
+@@ -4313,6 +4313,53 @@ func TestContextCancelDuringRawBytesScan(t *testing.T) {
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
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2025-47907.patch b/meta/recipes-devtools/go/go-1.21/CVE-2025-47907.patch
new file mode 100644
index 0000000000..b2af7df81b
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2025-47907.patch
@@ -0,0 +1,327 @@
+From 8a924caaf348fdc366bab906424616b2974ad4e9 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 23 Jul 2025 14:26:54 -0700
+Subject: [PATCH] database/sql: avoid closing Rows while scan is in progress
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
+ src/database/sql/sql.go         | 26 +++++++-------
+ src/database/sql/sql_test.go    | 60 ++++++++++++++++++++++++++++++---
+ 4 files changed, 90 insertions(+), 45 deletions(-)
+
+diff --git a/src/database/sql/convert.go b/src/database/sql/convert.go
+index 3a581f6..5b0c6f0 100644
+--- a/src/database/sql/convert.go
++++ b/src/database/sql/convert.go
+@@ -324,7 +324,6 @@ func convertAssignRows(dest, src interface{}, rows *Rows) error {
+			if rows == nil {
+				return errors.New("invalid context to convert cursor rows, missing parent *Rows")
+			}
+-			rows.closemu.Lock()
+			*d = Rows{
+				dc:          rows.dc,
+				releaseConn: func(error) {},
+@@ -340,7 +339,6 @@ func convertAssignRows(dest, src interface{}, rows *Rows) error {
+					parentCancel()
+				}
+			}
+-			rows.closemu.Unlock()
+			return nil
+		}
+	}
+diff --git a/src/database/sql/fakedb_test.go b/src/database/sql/fakedb_test.go
+index 33c57b9..9f3d517 100644
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
+@@ -683,8 +681,6 @@ func (c *fakeConn) PrepareContext(ctx context.Context, query string) (driver.Stm
+		switch cmd {
+		case "WIPE":
+			// Nothing
+-		case "USE_RAWBYTES":
+-			c.db.useRawBytes.Store(true)
+		case "SELECT":
+			stmt, err = c.prepareSelect(stmt, parts)
+		case "CREATE":
+@@ -788,9 +784,6 @@ func (s *fakeStmt) ExecContext(ctx context.Context, args []driver.NamedValue) (d
+	case "WIPE":
+		db.wipe()
+		return driver.ResultNoRows, nil
+-	case "USE_RAWBYTES":
+-		s.c.db.useRawBytes.Store(true)
+-		return driver.ResultNoRows, nil
+	case "CREATE":
+		if err := db.createTable(s.table, s.colName, s.colType); err != nil {
+			return nil, err
+@@ -1073,10 +1066,9 @@ type rowsCursor struct {
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
+@@ -1090,9 +1082,19 @@ func (rc *rowsCursor) touchMem() {
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
+	return nil
+ }
+@@ -1123,6 +1125,8 @@ func (rc *rowsCursor) Next(dest []driver.Value) error {
+	if rc.posRow >= len(rc.rows[rc.posSet]) {
+		return io.EOF // per interface spec
+	}
++	// Corrupt any previously returned bytes.
++	rc.invalidateDriverOwnedMemory()
+	for i, v := range rc.rows[rc.posSet][rc.posRow].cols {
+		// TODO(bradfitz): convert to subset types? naah, I
+		// think the subset types should only be input to
+@@ -1130,20 +1134,13 @@ func (rc *rowsCursor) Next(dest []driver.Value) error {
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
+index e25447c..a428e29 100644
+--- a/src/database/sql/sql.go
++++ b/src/database/sql/sql.go
+@@ -3294,38 +3294,36 @@ func (rs *Rows) Scan(dest ...interface{}) error {
+		// without calling Next.
+		return fmt.Errorf("sql: Scan called without calling Next (closemuScanHold)")
+	}
++
+	rs.closemu.RLock()
++	rs.raw = rs.raw[:0]
++	err := rs.scanLocked(dest...)
++	if err == nil && scanArgsContainRawBytes(dest) {
++		rs.closemuScanHold = true
++	} else {
++		rs.closemu.RUnlock()
++	}
++	return err
++}
+
++func (rs *Rows) scanLocked(dest ...interface{}) error {
+	if rs.lasterr != nil && rs.lasterr != io.EOF {
+-		rs.closemu.RUnlock()
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
+index 6aa9bf0..6aec7ec 100644
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
+@@ -4321,10 +4322,6 @@ func TestRawBytesReuse(t *testing.T) {
+	db := newTestDB(t, "people")
+	defer closeDB(t, db)
+
+-	if _, err := db.Exec("USE_RAWBYTES"); err != nil {
+-		t.Fatal(err)
+-	}
+-
+	var raw RawBytes
+
+	// The RawBytes in this query aliases driver-owned memory.
+@@ -4469,6 +4466,61 @@ func TestTypedString(t *testing.T) {
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
+ func BenchmarkConcurrentDBExec(b *testing.B) {
+	b.ReportAllocs()
+	ct := new(concurrentDBExecTest)
-- 
2.43.0


