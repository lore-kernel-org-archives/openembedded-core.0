Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.8819.1599639108595533702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Sep 2020 01:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: dsw4rMe6PRVQLksQ7VeNi0FBch3ipmy6LrPv4edfTFDd2TjQfU4sO8xbtVYwZ+K8HA48jO0FZ6
 GeM7p7Hv/LZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="155767034"
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="155767034"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:38 -0700
IronPort-SDR: 9vHyRHLPU1NwLH6VO90gKwUu/G7D6TTjyRh12q03DHMQP2LMYKdpLM4bki1QonftxHVylOe/fz
 FnBJQMvOpOFw==
X-IronPort-AV: E=Sophos;i="5.76,409,1592895600"; 
   d="scan'208";a="480371094"
Received: from rbint21-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.66.132])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2020 01:11:36 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 10/11] go: Security Advisory - go - CVE-2020-24553
Date: Wed,  9 Sep 2020 16:11:12 +0800
Message-Id: <5a9cb40c40183b44e7115b34beaaaeaac647b617.1599638315.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599638315.git.anuj.mittal@intel.com>
References: <cover.1599638315.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhou <li.zhou@windriver.com>

Backport the patch from <https://github.com/golang/go/commit/
eb07103a083237414145a45f029c873d57037e06> to solve CVE-2020-24553.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/go-1.12.inc          |   2 +
 ...i-rename-a-test-file-to-be-less-cute.patch |  28 ++
 .../go/go-1.12/CVE-2020-24553.patch           | 429 ++++++++++++++++++
 3 files changed, 459 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch
 create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-24553.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index fd2d641554..2a0680aeaa 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -20,6 +20,8 @@ SRC_URI += "\
     file://0010-fix-CVE-2019-17596.patch \
     file://CVE-2020-15586.patch \
     file://CVE-2020-16845.patch \
+    file://0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch \
+    file://CVE-2020-24553.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.12/0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch b/meta/recipes-devtools/go/go-1.12/0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch
new file mode 100644
index 0000000000..7c07961c03
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/0001-net-http-cgi-rename-a-test-file-to-be-less-cute.patch
@@ -0,0 +1,28 @@
+From 8390c478600b852392cb116741b3cb239c94d123 Mon Sep 17 00:00:00 2001
+From: Brad Fitzpatrick <bradfitz@golang.org>
+Date: Wed, 15 Jan 2020 18:08:10 +0000
+Subject: [PATCH] net/http/cgi: rename a test file to be less cute
+
+My fault (from CL 4245070), sorry.
+
+Change-Id: Ib95d3170dc326e74aa74c22421c4e44a8b00f577
+Reviewed-on: https://go-review.googlesource.com/c/go/+/214920
+Run-TryBot: Brad Fitzpatrick <bradfitz@golang.org>
+TryBot-Result: Gobot Gobot <gobot@golang.org>
+Reviewed-by: Emmanuel Odeke <emm.odeke@gmail.com>
+
+Upstream-Status: Backport
+[lz: Add this patch for merging the patch for CVE-2020-24553]
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/net/http/cgi/{matryoshka_test.go => integration_test.go} | 0
+ 1 file changed, 0 insertions(+), 0 deletions(-)
+ rename src/net/http/cgi/{matryoshka_test.go => integration_test.go} (100%)
+
+diff --git a/src/net/http/cgi/matryoshka_test.go b/src/net/http/cgi/integration_test.go
+similarity index 100%
+rename from src/net/http/cgi/matryoshka_test.go
+rename to src/net/http/cgi/integration_test.go
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/go/go-1.12/CVE-2020-24553.patch b/meta/recipes-devtools/go/go-1.12/CVE-2020-24553.patch
new file mode 100644
index 0000000000..18a218bc9a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/CVE-2020-24553.patch
@@ -0,0 +1,429 @@
+From eb07103a083237414145a45f029c873d57037e06 Mon Sep 17 00:00:00 2001
+From: Roberto Clapis <roberto@golang.org>
+Date: Wed, 26 Aug 2020 08:53:03 +0200
+Subject: [PATCH] [release-branch.go1.15-security] net/http/cgi,net/http/fcgi:
+ add Content-Type detection
+
+This CL ensures that responses served via CGI and FastCGI
+have a Content-Type header based on the content of the
+response if not explicitly set by handlers.
+
+If the implementers of the handler did not explicitly
+specify a Content-Type both CGI implementations would default
+to "text/html", potentially causing cross-site scripting.
+
+Thanks to RedTeam Pentesting GmbH for reporting this.
+
+Fixes CVE-2020-24553
+
+Change-Id: I82cfc396309b5ab2e8d6e9a87eda8ea7e3799473
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/823217
+Reviewed-by: Russ Cox <rsc@google.com>
+(cherry picked from commit 23d675d07fdc56aafd67c0a0b63d5b7e14708ff0)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/835311
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+Upstream-Status: Backport
+CVE: CVE-2020-24553
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/net/http/cgi/child.go            | 36 ++++++++++-----
+ src/net/http/cgi/child_test.go       | 69 ++++++++++++++++++++++++++++
+ src/net/http/cgi/integration_test.go | 53 ++++++++++++++++++++-
+ src/net/http/fcgi/child.go           | 39 ++++++++++++----
+ src/net/http/fcgi/fcgi_test.go       | 52 +++++++++++++++++++++
+ 5 files changed, 227 insertions(+), 22 deletions(-)
+
+diff --git a/src/net/http/cgi/child.go b/src/net/http/cgi/child.go
+index 9474175f17..61de6165f6 100644
+--- a/src/net/http/cgi/child.go
++++ b/src/net/http/cgi/child.go
+@@ -163,10 +163,12 @@ func Serve(handler http.Handler) error {
+ }
+ 
+ type response struct {
+-	req        *http.Request
+-	header     http.Header
+-	bufw       *bufio.Writer
+-	headerSent bool
++	req            *http.Request
++	header         http.Header
++	code           int
++	wroteHeader    bool
++	wroteCGIHeader bool
++	bufw           *bufio.Writer
+ }
+ 
+ func (r *response) Flush() {
+@@ -178,26 +180,38 @@ func (r *response) Header() http.Header {
+ }
+ 
+ func (r *response) Write(p []byte) (n int, err error) {
+-	if !r.headerSent {
++	if !r.wroteHeader {
+ 		r.WriteHeader(http.StatusOK)
+ 	}
++	if !r.wroteCGIHeader {
++		r.writeCGIHeader(p)
++	}
+ 	return r.bufw.Write(p)
+ }
+ 
+ func (r *response) WriteHeader(code int) {
+-	if r.headerSent {
++	if r.wroteHeader {
+ 		// Note: explicitly using Stderr, as Stdout is our HTTP output.
+ 		fmt.Fprintf(os.Stderr, "CGI attempted to write header twice on request for %s", r.req.URL)
+ 		return
+ 	}
+-	r.headerSent = true
+-	fmt.Fprintf(r.bufw, "Status: %d %s\r\n", code, http.StatusText(code))
++	r.wroteHeader = true
++	r.code = code
++}
+ 
+-	// Set a default Content-Type
++// writeCGIHeader finalizes the header sent to the client and writes it to the output.
++// p is not written by writeHeader, but is the first chunk of the body
++// that will be written. It is sniffed for a Content-Type if none is
++// set explicitly.
++func (r *response) writeCGIHeader(p []byte) {
++	if r.wroteCGIHeader {
++		return
++	}
++	r.wroteCGIHeader = true
++	fmt.Fprintf(r.bufw, "Status: %d %s\r\n", r.code, http.StatusText(r.code))
+ 	if _, hasType := r.header["Content-Type"]; !hasType {
+-		r.header.Add("Content-Type", "text/html; charset=utf-8")
++		r.header.Set("Content-Type", http.DetectContentType(p))
+ 	}
+-
+ 	r.header.Write(r.bufw)
+ 	r.bufw.WriteString("\r\n")
+ 	r.bufw.Flush()
+diff --git a/src/net/http/cgi/child_test.go b/src/net/http/cgi/child_test.go
+index 14e0af475f..f6ecb6eb80 100644
+--- a/src/net/http/cgi/child_test.go
++++ b/src/net/http/cgi/child_test.go
+@@ -7,6 +7,11 @@
+ package cgi
+ 
+ import (
++	"bufio"
++	"bytes"
++	"net/http"
++	"net/http/httptest"
++	"strings"
+ 	"testing"
+ )
+ 
+@@ -148,3 +153,67 @@ func TestRequestWithoutRemotePort(t *testing.T) {
+ 		t.Errorf("RemoteAddr: got %q; want %q", g, e)
+ 	}
+ }
++
++type countingWriter int
++
++func (c *countingWriter) Write(p []byte) (int, error) {
++	*c += countingWriter(len(p))
++	return len(p), nil
++}
++func (c *countingWriter) WriteString(p string) (int, error) {
++	*c += countingWriter(len(p))
++	return len(p), nil
++}
++
++func TestResponse(t *testing.T) {
++	var tests = []struct {
++		name   string
++		body   string
++		wantCT string
++	}{
++		{
++			name:   "no body",
++			wantCT: "text/plain; charset=utf-8",
++		},
++		{
++			name:   "html",
++			body:   "<html><head><title>test page</title></head><body>This is a body</body></html>",
++			wantCT: "text/html; charset=utf-8",
++		},
++		{
++			name:   "text",
++			body:   strings.Repeat("gopher", 86),
++			wantCT: "text/plain; charset=utf-8",
++		},
++		{
++			name:   "jpg",
++			body:   "\xFF\xD8\xFF" + strings.Repeat("B", 1024),
++			wantCT: "image/jpeg",
++		},
++	}
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			var buf bytes.Buffer
++			resp := response{
++				req:    httptest.NewRequest("GET", "/", nil),
++				header: http.Header{},
++				bufw:   bufio.NewWriter(&buf),
++			}
++			n, err := resp.Write([]byte(tt.body))
++			if err != nil {
++				t.Errorf("Write: unexpected %v", err)
++			}
++			if want := len(tt.body); n != want {
++				t.Errorf("reported short Write: got %v want %v", n, want)
++			}
++			resp.writeCGIHeader(nil)
++			resp.Flush()
++			if got := resp.Header().Get("Content-Type"); got != tt.wantCT {
++				t.Errorf("wrong content-type: got %q, want %q", got, tt.wantCT)
++			}
++			if !bytes.HasSuffix(buf.Bytes(), []byte(tt.body)) {
++				t.Errorf("body was not correctly written")
++			}
++		})
++	}
++}
+diff --git a/src/net/http/cgi/integration_test.go b/src/net/http/cgi/integration_test.go
+index 32d59c09a3..295c3b82d4 100644
+--- a/src/net/http/cgi/integration_test.go
++++ b/src/net/http/cgi/integration_test.go
+@@ -16,7 +16,9 @@ import (
+ 	"io"
+ 	"net/http"
+ 	"net/http/httptest"
++	"net/url"
+ 	"os"
++	"strings"
+ 	"testing"
+ 	"time"
+ )
+@@ -52,7 +54,7 @@ func TestHostingOurselves(t *testing.T) {
+ 	}
+ 	replay := runCgiTest(t, h, "GET /test.go?foo=bar&a=b HTTP/1.0\nHost: example.com\n\n", expectedMap)
+ 
+-	if expected, got := "text/html; charset=utf-8", replay.Header().Get("Content-Type"); got != expected {
++	if expected, got := "text/plain; charset=utf-8", replay.Header().Get("Content-Type"); got != expected {
+ 		t.Errorf("got a Content-Type of %q; expected %q", got, expected)
+ 	}
+ 	if expected, got := "X-Test-Value", replay.Header().Get("X-Test-Header"); got != expected {
+@@ -152,6 +154,51 @@ func TestChildOnlyHeaders(t *testing.T) {
+ 	}
+ }
+ 
++func TestChildContentType(t *testing.T) {
++	testenv.MustHaveExec(t)
++
++	h := &Handler{
++		Path: os.Args[0],
++		Root: "/test.go",
++		Args: []string{"-test.run=TestBeChildCGIProcess"},
++	}
++	var tests = []struct {
++		name   string
++		body   string
++		wantCT string
++	}{
++		{
++			name:   "no body",
++			wantCT: "text/plain; charset=utf-8",
++		},
++		{
++			name:   "html",
++			body:   "<html><head><title>test page</title></head><body>This is a body</body></html>",
++			wantCT: "text/html; charset=utf-8",
++		},
++		{
++			name:   "text",
++			body:   strings.Repeat("gopher", 86),
++			wantCT: "text/plain; charset=utf-8",
++		},
++		{
++			name:   "jpg",
++			body:   "\xFF\xD8\xFF" + strings.Repeat("B", 1024),
++			wantCT: "image/jpeg",
++		},
++	}
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			expectedMap := map[string]string{"_body": tt.body}
++			req := fmt.Sprintf("GET /test.go?exact-body=%s HTTP/1.0\nHost: example.com\n\n", url.QueryEscape(tt.body))
++			replay := runCgiTest(t, h, req, expectedMap)
++			if got := replay.Header().Get("Content-Type"); got != tt.wantCT {
++				t.Errorf("got a Content-Type of %q; expected it to start with %q", got, tt.wantCT)
++			}
++		})
++	}
++}
++
+ // golang.org/issue/7198
+ func Test500WithNoHeaders(t *testing.T)     { want500Test(t, "/immediate-disconnect") }
+ func Test500WithNoContentType(t *testing.T) { want500Test(t, "/no-content-type") }
+@@ -203,6 +250,10 @@ func TestBeChildCGIProcess(t *testing.T) {
+ 		if req.FormValue("no-body") == "1" {
+ 			return
+ 		}
++		if eb, ok := req.Form["exact-body"]; ok {
++			io.WriteString(rw, eb[0])
++			return
++		}
+ 		if req.FormValue("write-forever") == "1" {
+ 			io.Copy(rw, neverEnding('a'))
+ 			for {
+diff --git a/src/net/http/fcgi/child.go b/src/net/http/fcgi/child.go
+index 30a6b2ce2d..a31273b3ec 100644
+--- a/src/net/http/fcgi/child.go
++++ b/src/net/http/fcgi/child.go
+@@ -74,10 +74,12 @@ func (r *request) parseParams() {
+ 
+ // response implements http.ResponseWriter.
+ type response struct {
+-	req         *request
+-	header      http.Header
+-	w           *bufWriter
+-	wroteHeader bool
++	req            *request
++	header         http.Header
++	code           int
++	wroteHeader    bool
++	wroteCGIHeader bool
++	w              *bufWriter
+ }
+ 
+ func newResponse(c *child, req *request) *response {
+@@ -92,11 +94,14 @@ func (r *response) Header() http.Header {
+ 	return r.header
+ }
+ 
+-func (r *response) Write(data []byte) (int, error) {
++func (r *response) Write(p []byte) (n int, err error) {
+ 	if !r.wroteHeader {
+ 		r.WriteHeader(http.StatusOK)
+ 	}
+-	return r.w.Write(data)
++	if !r.wroteCGIHeader {
++		r.writeCGIHeader(p)
++	}
++	return r.w.Write(p)
+ }
+ 
+ func (r *response) WriteHeader(code int) {
+@@ -104,22 +109,34 @@ func (r *response) WriteHeader(code int) {
+ 		return
+ 	}
+ 	r.wroteHeader = true
++	r.code = code
+ 	if code == http.StatusNotModified {
+ 		// Must not have body.
+ 		r.header.Del("Content-Type")
+ 		r.header.Del("Content-Length")
+ 		r.header.Del("Transfer-Encoding")
+-	} else if r.header.Get("Content-Type") == "" {
+-		r.header.Set("Content-Type", "text/html; charset=utf-8")
+ 	}
+-
+ 	if r.header.Get("Date") == "" {
+ 		r.header.Set("Date", time.Now().UTC().Format(http.TimeFormat))
+ 	}
++}
+ 
+-	fmt.Fprintf(r.w, "Status: %d %s\r\n", code, http.StatusText(code))
++// writeCGIHeader finalizes the header sent to the client and writes it to the output.
++// p is not written by writeHeader, but is the first chunk of the body
++// that will be written. It is sniffed for a Content-Type if none is
++// set explicitly.
++func (r *response) writeCGIHeader(p []byte) {
++	if r.wroteCGIHeader {
++		return
++	}
++	r.wroteCGIHeader = true
++	fmt.Fprintf(r.w, "Status: %d %s\r\n", r.code, http.StatusText(r.code))
++	if _, hasType := r.header["Content-Type"]; r.code != http.StatusNotModified && !hasType {
++		r.header.Set("Content-Type", http.DetectContentType(p))
++	}
+ 	r.header.Write(r.w)
+ 	r.w.WriteString("\r\n")
++	r.w.Flush()
+ }
+ 
+ func (r *response) Flush() {
+@@ -290,6 +307,8 @@ func (c *child) serveRequest(req *request, body io.ReadCloser) {
+ 		httpReq = httpReq.WithContext(envVarCtx)
+ 		c.handler.ServeHTTP(r, httpReq)
+ 	}
++	// Make sure we serve something even if nothing was written to r
++	r.Write(nil)
+ 	r.Close()
+ 	c.mu.Lock()
+ 	delete(c.requests, req.reqId)
+diff --git a/src/net/http/fcgi/fcgi_test.go b/src/net/http/fcgi/fcgi_test.go
+index e9d2b34023..4a27a12c35 100644
+--- a/src/net/http/fcgi/fcgi_test.go
++++ b/src/net/http/fcgi/fcgi_test.go
+@@ -10,6 +10,7 @@ import (
+ 	"io"
+ 	"io/ioutil"
+ 	"net/http"
++	"strings"
+ 	"testing"
+ )
+ 
+@@ -344,3 +345,54 @@ func TestChildServeReadsEnvVars(t *testing.T) {
+ 		<-done
+ 	}
+ }
++
++func TestResponseWriterSniffsContentType(t *testing.T) {
++	var tests = []struct {
++		name   string
++		body   string
++		wantCT string
++	}{
++		{
++			name:   "no body",
++			wantCT: "text/plain; charset=utf-8",
++		},
++		{
++			name:   "html",
++			body:   "<html><head><title>test page</title></head><body>This is a body</body></html>",
++			wantCT: "text/html; charset=utf-8",
++		},
++		{
++			name:   "text",
++			body:   strings.Repeat("gopher", 86),
++			wantCT: "text/plain; charset=utf-8",
++		},
++		{
++			name:   "jpg",
++			body:   "\xFF\xD8\xFF" + strings.Repeat("B", 1024),
++			wantCT: "image/jpeg",
++		},
++	}
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			input := make([]byte, len(streamFullRequestStdin))
++			copy(input, streamFullRequestStdin)
++			rc := nopWriteCloser{bytes.NewBuffer(input)}
++			done := make(chan bool)
++			var resp *response
++			c := newChild(rc, http.HandlerFunc(func(
++				w http.ResponseWriter,
++				r *http.Request,
++			) {
++				io.WriteString(w, tt.body)
++				resp = w.(*response)
++				done <- true
++			}))
++			defer c.cleanUp()
++			go c.serve()
++			<-done
++			if got := resp.Header().Get("Content-Type"); got != tt.wantCT {
++				t.Errorf("got a Content-Type of %q; expected it to start with %q", got, tt.wantCT)
++			}
++		})
++	}
++}
+-- 
+2.17.1
+
-- 
2.26.2

