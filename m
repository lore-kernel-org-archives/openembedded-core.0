Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.46332.1597071178064241135
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2020 07:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TpUgFXqEoICH/vNtZClaApad2pCFNV4EM9QwJ6dQzOftePpVB7yEcTOZJ5Iek7lebFiwsYRoSh
 Ak+h7zcH/A+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="238376822"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="238376822"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:59 -0700
IronPort-SDR: hw0mokeX59lEV7aZu2qDdko3PDaG2TsHHkmhNxgqrCvmJ2g5Lt2boKrshK7LuTEdB8wyhRJkUF
 mzulMxaMgYGQ==
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="494819270"
Received: from sshettyx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.64.39])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 07:52:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 3/4] go: Security Advisory - go - CVE-2020-15586
Date: Mon, 10 Aug 2020 22:52:46 +0800
Message-Id: <0e8526ce8694ebd6988c3804e4d2ccf39cda90c7.1597071024.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597071024.git.anuj.mittal@intel.com>
References: <cover.1597071024.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Li Zhou <li.zhou@windriver.com>

Backport patch from <https://github.com/golang/go/commit/
fa98f46741f818913a8c11b877520a548715131f> to solve CVE-2020-15586.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/go-1.12.inc          |   1 +
 .../go/go-1.12/CVE-2020-15586.patch           | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/CVE-2020-15586.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 6aecaad75d..c3c2d0cfee 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -18,6 +18,7 @@ SRC_URI += "\
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
     file://0010-fix-CVE-2019-17596.patch \
+    file://CVE-2020-15586.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.12/CVE-2020-15586.patch b/meta/recipes-devtools/go/go-1.12/CVE-2020-15586.patch
new file mode 100644
index 0000000000..ebdc5aec6d
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/CVE-2020-15586.patch
@@ -0,0 +1,131 @@
+From fa98f46741f818913a8c11b877520a548715131f Mon Sep 17 00:00:00 2001
+From: Russ Cox <rsc@golang.org>
+Date: Mon, 13 Jul 2020 13:27:22 -0400
+Subject: [PATCH] net/http: synchronize "100 Continue" write and Handler writes
+
+The expectContinueReader writes to the connection on the first
+Request.Body read. Since a Handler might be doing a read in parallel or
+before a write, expectContinueReader needs to synchronize with the
+ResponseWriter, and abort if a response already went out.
+
+The tests will land in a separate CL.
+
+Fixes #34902
+Fixes CVE-2020-15586
+
+Change-Id: Icdd8dd539f45e8863762bd378194bb4741e875fc
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/793350
+Reviewed-by: Filippo Valsorda <valsorda@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/242598
+Run-TryBot: Katie Hockman <katie@golang.org>
+Reviewed-by: Filippo Valsorda <filippo@golang.org>
+TryBot-Result: Gobot Gobot <gobot@golang.org>
+
+Upstream-Status: Backport
+CVE: CVE-2020-15586
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ src/net/http/server.go | 43 +++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 36 insertions(+), 7 deletions(-)
+
+diff --git a/src/net/http/server.go b/src/net/http/server.go
+index a995a50658..d41b5f6f48 100644
+--- a/src/net/http/server.go
++++ b/src/net/http/server.go
+@@ -425,6 +425,16 @@ type response struct {
+ 	wants10KeepAlive bool               // HTTP/1.0 w/ Connection "keep-alive"
+ 	wantsClose       bool               // HTTP request has Connection "close"
+ 
++	// canWriteContinue is a boolean value accessed as an atomic int32
++	// that says whether or not a 100 Continue header can be written
++	// to the connection.
++	// writeContinueMu must be held while writing the header.
++	// These two fields together synchronize the body reader
++	// (the expectContinueReader, which wants to write 100 Continue)
++	// against the main writer.
++	canWriteContinue atomicBool
++	writeContinueMu  sync.Mutex
++
+ 	w  *bufio.Writer // buffers output in chunks to chunkWriter
+ 	cw chunkWriter
+ 
+@@ -515,6 +525,7 @@ type atomicBool int32
+ 
+ func (b *atomicBool) isSet() bool { return atomic.LoadInt32((*int32)(b)) != 0 }
+ func (b *atomicBool) setTrue()    { atomic.StoreInt32((*int32)(b), 1) }
++func (b *atomicBool) setFalse()   { atomic.StoreInt32((*int32)(b), 0) }
+ 
+ // declareTrailer is called for each Trailer header when the
+ // response header is written. It notes that a header will need to be
+@@ -878,21 +889,27 @@ type expectContinueReader struct {
+ 	resp       *response
+ 	readCloser io.ReadCloser
+ 	closed     bool
+-	sawEOF     bool
++	sawEOF     atomicBool
+ }
+ 
+ func (ecr *expectContinueReader) Read(p []byte) (n int, err error) {
+ 	if ecr.closed {
+ 		return 0, ErrBodyReadAfterClose
+ 	}
+-	if !ecr.resp.wroteContinue && !ecr.resp.conn.hijacked() {
+-		ecr.resp.wroteContinue = true
+-		ecr.resp.conn.bufw.WriteString("HTTP/1.1 100 Continue\r\n\r\n")
+-		ecr.resp.conn.bufw.Flush()
++	w := ecr.resp
++	if !w.wroteContinue && w.canWriteContinue.isSet() && !w.conn.hijacked() {
++		w.wroteContinue = true
++		w.writeContinueMu.Lock()
++		if w.canWriteContinue.isSet() {
++			w.conn.bufw.WriteString("HTTP/1.1 100 Continue\r\n\r\n")
++			w.conn.bufw.Flush()
++			w.canWriteContinue.setFalse()
++		}
++		w.writeContinueMu.Unlock()
+ 	}
+ 	n, err = ecr.readCloser.Read(p)
+ 	if err == io.EOF {
+-		ecr.sawEOF = true
++		ecr.sawEOF.setTrue()
+ 	}
+ 	return
+ }
+@@ -1311,7 +1328,7 @@ func (cw *chunkWriter) writeHeader(p []byte) {
+ 	// because we don't know if the next bytes on the wire will be
+ 	// the body-following-the-timer or the subsequent request.
+ 	// See Issue 11549.
+-	if ecr, ok := w.req.Body.(*expectContinueReader); ok && !ecr.sawEOF {
++	if ecr, ok := w.req.Body.(*expectContinueReader); ok && !ecr.sawEOF.isSet() {
+ 		w.closeAfterReply = true
+ 	}
+ 
+@@ -1561,6 +1578,17 @@ func (w *response) write(lenData int, dataB []byte, dataS string) (n int, err er
+ 		}
+ 		return 0, ErrHijacked
+ 	}
++
++	if w.canWriteContinue.isSet() {
++		// Body reader wants to write 100 Continue but hasn't yet.
++		// Tell it not to. The store must be done while holding the lock
++		// because the lock makes sure that there is not an active write
++		// this very moment.
++		w.writeContinueMu.Lock()
++		w.canWriteContinue.setFalse()
++		w.writeContinueMu.Unlock()
++	}
++
+ 	if !w.wroteHeader {
+ 		w.WriteHeader(StatusOK)
+ 	}
+@@ -1872,6 +1900,7 @@ func (c *conn) serve(ctx context.Context) {
+ 			if req.ProtoAtLeast(1, 1) && req.ContentLength != 0 {
+ 				// Wrap the Body reader with one that replies on the connection
+ 				req.Body = &expectContinueReader{readCloser: req.Body, resp: w}
++				w.canWriteContinue.setTrue()
+ 			}
+ 		} else if req.Header.get("Expect") != "" {
+ 			w.sendExpectationFailed()
+-- 
+2.17.1
+
-- 
2.26.2

