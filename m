Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 22B1E7CE27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 01:31:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9M1VDA5005847
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 18:31:13 -0700 (PDT)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Mon, 21 Oct 2019 18:31:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2019 09:31:11 +0800
Message-ID: <20191022013111.25319-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [master][zeus][PATCH] go: fix CVE-2019-16276
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Oct 2019 01:31:12 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-devtools/go/go-1.12.inc          |   1 +
 ...o1.12-security-net-textproto-don-t-n.patch | 163 ++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 39157ff882..ed14b175e6 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+    file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
new file mode 100644
index 0000000000..7b39dbd734
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/0001-release-branch.go1.12-security-net-textproto-don-t-n.patch
@@ -0,0 +1,163 @@
+From 265b691ac440bfb711d8de323346f7d72e620efe Mon Sep 17 00:00:00 2001
+From: Filippo Valsorda <filippo@golang.org>
+Date: Thu, 12 Sep 2019 12:37:36 -0400
+Subject: [PATCH] [release-branch.go1.12-security] net/textproto: don't
+ normalize headers with spaces before the colon
+
+RFC 7230 is clear about headers with a space before the colon, like
+
+X-Answer : 42
+
+being invalid, but we've been accepting and normalizing them for compatibility
+purposes since CL 5690059 in 2012.
+
+On the client side, this is harmless and indeed most browsers behave the same
+to this day. On the server side, this becomes a security issue when the
+behavior doesn't match that of a reverse proxy sitting in front of the server.
+
+For example, if a WAF accepts them without normalizing them, it might be
+possible to bypass its filters, because the Go server would interpret the
+header differently. Worse, if the reverse proxy coalesces requests onto a
+single HTTP/1.1 connection to a Go server, the understanding of the request
+boundaries can get out of sync between them, allowing an attacker to tack an
+arbitrary method and path onto a request by other clients, including
+authentication headers unknown to the attacker.
+
+This was recently presented at multiple security conferences:
+https://portswigger.net/blog/http-desync-attacks-request-smuggling-reborn
+
+net/http servers already reject header keys with invalid characters.
+Simply stop normalizing extra spaces in net/textproto, let it return them
+unchanged like it does for other invalid headers, and let net/http enforce
+RFC 7230, which is HTTP specific. This loses us normalization on the client
+side, but there's no right answer on the client side anyway, and hiding the
+issue sounds worse than letting the application decide.
+
+Fixes CVE-2019-16276
+
+Change-Id: I6d272de827e0870da85d93df770d6a0e161bbcf1
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/549719
+Reviewed-by: Brad Fitzpatrick <bradfitz@google.com>
+(cherry picked from commit 1280b868e82bf173ea3e988be3092d160ee66082)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/558776
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2019-16276
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/6e6f4aaf70c8b1cc81e65a26332aa9409de03ad8]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/net/http/serve_test.go       |  4 ++++
+ src/net/http/transport_test.go   | 27 +++++++++++++++++++++++++++
+ src/net/textproto/reader.go      | 10 ++--------
+ src/net/textproto/reader_test.go | 13 ++++++-------
+ 4 files changed, 39 insertions(+), 15 deletions(-)
+
+diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go
+index 6eb0088a96..89bfdfbb82 100644
+--- a/src/net/http/serve_test.go
++++ b/src/net/http/serve_test.go
+@@ -4748,6 +4748,10 @@ func TestServerValidatesHeaders(t *testing.T) {
+ 		{"foo\xffbar: foo\r\n", 400},                         // binary in header
+ 		{"foo\x00bar: foo\r\n", 400},                         // binary in header
+ 		{"Foo: " + strings.Repeat("x", 1<<21) + "\r\n", 431}, // header too large
++		// Spaces between the header key and colon are not allowed.
++		// See RFC 7230, Section 3.2.4.
++		{"Foo : bar\r\n", 400},
++		{"Foo\t: bar\r\n", 400},
+ 
+ 		{"foo: foo foo\r\n", 200},    // LWS space is okay
+ 		{"foo: foo\tfoo\r\n", 200},   // LWS tab is okay
+diff --git a/src/net/http/transport_test.go b/src/net/http/transport_test.go
+index 5c329543e2..5e5438a708 100644
+--- a/src/net/http/transport_test.go
++++ b/src/net/http/transport_test.go
+@@ -5133,3 +5133,30 @@ func TestTransportIgnores408(t *testing.T) {
+ 	}
+ 	t.Fatalf("timeout after %v waiting for Transport connections to die off", time.Since(t0))
+ }
++
++func TestInvalidHeaderResponse(t *testing.T) {
++	setParallel(t)
++	defer afterTest(t)
++	cst := newClientServerTest(t, h1Mode, HandlerFunc(func(w ResponseWriter, r *Request) {
++		conn, buf, _ := w.(Hijacker).Hijack()
++		buf.Write([]byte("HTTP/1.1 200 OK\r\n" +
++			"Date: Wed, 30 Aug 2017 19:09:27 GMT\r\n" +
++			"Content-Type: text/html; charset=utf-8\r\n" +
++			"Content-Length: 0\r\n" +
++			"Foo : bar\r\n\r\n"))
++		buf.Flush()
++		conn.Close()
++	}))
++	defer cst.close()
++	res, err := cst.c.Get(cst.ts.URL)
++	if err != nil {
++		t.Fatal(err)
++	}
++	defer res.Body.Close()
++	if v := res.Header.Get("Foo"); v != "" {
++		t.Errorf(`unexpected "Foo" header: %q`, v)
++	}
++	if v := res.Header.Get("Foo "); v != "bar" {
++		t.Errorf(`bad "Foo " header value: %q, want %q`, v, "bar")
++	}
++}
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 2c4f25d5ae..1a5e364cf7 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -493,18 +493,12 @@ func (r *Reader) ReadMIMEHeader() (MIMEHeader, error) {
+ 			return m, err
+ 		}
+ 
+-		// Key ends at first colon; should not have trailing spaces
+-		// but they appear in the wild, violating specs, so we remove
+-		// them if present.
++		// Key ends at first colon.
+ 		i := bytes.IndexByte(kv, ':')
+ 		if i < 0 {
+ 			return m, ProtocolError("malformed MIME header line: " + string(kv))
+ 		}
+-		endKey := i
+-		for endKey > 0 && kv[endKey-1] == ' ' {
+-			endKey--
+-		}
+-		key := canonicalMIMEHeaderKey(kv[:endKey])
++		key := canonicalMIMEHeaderKey(kv[:i])
+ 
+ 		// As per RFC 7230 field-name is a token, tokens consist of one or more chars.
+ 		// We could return a ProtocolError here, but better to be liberal in what we
+diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_test.go
+index f85fbdc36d..b92fdcd3c7 100644
+--- a/src/net/textproto/reader_test.go
++++ b/src/net/textproto/reader_test.go
+@@ -188,11 +188,10 @@ func TestLargeReadMIMEHeader(t *testing.T) {
+ 	}
+ }
+ 
+-// Test that we read slightly-bogus MIME headers seen in the wild,
+-// with spaces before colons, and spaces in keys.
++// TestReadMIMEHeaderNonCompliant checks that we don't normalize headers
++// with spaces before colons, and accept spaces in keys.
+ func TestReadMIMEHeaderNonCompliant(t *testing.T) {
+-	// Invalid HTTP response header as sent by an Axis security
+-	// camera: (this is handled by IE, Firefox, Chrome, curl, etc.)
++	// These invalid headers will be rejected by net/http according to RFC 7230.
+ 	r := reader("Foo: bar\r\n" +
+ 		"Content-Language: en\r\n" +
+ 		"SID : 0\r\n" +
+@@ -202,9 +201,9 @@ func TestReadMIMEHeaderNonCompliant(t *testing.T) {
+ 	want := MIMEHeader{
+ 		"Foo":              {"bar"},
+ 		"Content-Language": {"en"},
+-		"Sid":              {"0"},
+-		"Audio Mode":       {"None"},
+-		"Privilege":        {"127"},
++		"SID ":             {"0"},
++		"Audio Mode ":      {"None"},
++		"Privilege ":       {"127"},
+ 	}
+ 	if !reflect.DeepEqual(m, want) || err != nil {
+ 		t.Fatalf("ReadMIMEHeader =\n%v, %v; want:\n%v", m, err, want)
-- 
2.17.1


