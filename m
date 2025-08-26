Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48103CA0EE4
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 03:58:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.56917.1756180681350406968
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 20:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WhXzddtC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=03338f751b=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57Q3bhuU921577
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:58:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+XeVlATQVwgI5+0kXp/g
	nM3GvF4g6lJcfEuLBM5efTA=; b=WhXzddtCLpflkg8V3UsuWX3MDqNLIlCaHMgL
	0kn4Fjh8xWVq2OSPYVMpjsPJ7P2VrSRfAG9vKM4MMOYUO+wUvUSiMURv7nJr3/xd
	7SlZS0hJJHDMEVAr0UgPOinqwKZVHf7eWIK2tYA1FGzCq9ZTWMlnr77qtJModxGs
	qPoTw10eXSlymPapmccROqCKhJJRfe5UWlz5KDODo3bmBU95MmNO6wgRLdCKs+n4
	ija7wKpZY9Lxd8sB+JoAuia7df65ts57nf77hszUT+DJVGqetUAgiSuFuSkpSVxX
	xBOYK9hKBmriMHZ7tk35JOd9fc+K7eRXUbZza6yTGxiqNHAp7g==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q2v1apcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:57:59 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 Aug 2025 20:57:58 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 Aug 2025 20:57:57 -0700
From: pkumar7 <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][scarthgap][PATCH 1/1] go: fix CVE-2025-47907
Date: Tue, 26 Aug 2025 09:27:43 +0530
Message-ID: <20250826035743.569412-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vuj3h53aUBvabeFkRM_BUr4hQxL32adN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDAzMSBTYWx0ZWRfXwwSI9+ItJRfk
 H+DQ/epmgHUi+bdauDXG5QmWSXaP+aHD7du5VdqhL75eRdAAZm9PAuyTwAcV9GQ+vxWItQVHWPk
 fCIxcQXvrVDTvBF7jHvw96qR8X5ebZv8WottO1WtPydGRXX/pRyxyEg4UL8TQbduGg8rm4wq8JM
 DM4x11sCjF35cvQ1kuxqeubpHyagyJsbyfkJDzwoRjINETPl+J0FseELVNaRYQDjq+YFN88VrZW
 kY0t+FZJmMoW7M7phFAdSfa2NYr9K2bo2vXAGa/u0VhL4mGDiai3wiqhNIax5YWvCD7H3hRBvv9
 F2vxgOv0xtmEs3qpMHRi1mbYLPPeV5Atv364hurq+5YF/aHi+qlH1MJ/T8sg/s=
X-Authority-Analysis: v=2.4 cv=T5GMT+KQ c=1 sm=1 tr=0 ts=68ad30c7 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=2OwXVqhp2XgA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=Oh2cFVv5AAAA:8
 a=t7CeM3EgAAAA:8 a=1XWaLZrsAAAA:8 a=pM9yUfARAAAA:8 a=yhUri8FnAAAA:8
 a=Ltl9m_TsRTjQsgD8Mf4A:9 a=7KeoIwV6GZqOttXkcoxL:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=YH-7kEGJnRg4CV3apUU-:22 a=8nbOMqh3J4Vhtx036jbE:22
X-Proofpoint-GUID: vuj3h53aUBvabeFkRM_BUr4hQxL32adN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222430

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
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   2 +
 .../go/go/CVE-2025-47907-pre.patch            | 233 +++++++++++++
 .../go/go/CVE-2025-47907.patch                | 328 ++++++++++++++++++
 3 files changed, 563 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47907-pre.patch
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-47907.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index af09cb52cd..c5332d5b4b 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -17,5 +17,7 @@ SRC_URI += "\
     file://CVE-2025-22870.patch \
     file://CVE-2025-22871.patch \
     file://CVE-2025-4673.patch \
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
2.40.0


