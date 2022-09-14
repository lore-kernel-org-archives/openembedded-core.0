Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FEAC6FA82
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 15:15:19 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web12.632.1663168511698721752
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 08:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=B+F+wmPP;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663168511; x=1694704511;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xUz+GiDSLqhlTNTAyAxWzwSRlsEYTfq3zrOH/3RjniQ=;
  b=B+F+wmPPw5cx8iNx8YOzoBN5kMIA1KeweJqEwBShrV1ofRlToEuhlfso
   KGAPt0zHsgmNVgfbezhXzUmDSTXkfrjCavCElVH6t23hbzwJml+Q4S227
   PQCdCXZ8reJTmeOxkNCmb2RfarGACWWcSrgJnmqt/sMiey6deC/gTwhzy
   Qx4xxiv7Cvad4xjEL+Lt8KnO1rgNfgCyAeYNHxjc2krUSCmPIO+8282nZ
   BaqHCT9JsjgsXbio6pcrn1VKmSKHXLNU/qi7ErGzyhq2tFzovoiuIm2xU
   HinHfE1RTp+wubN2J+nYPFY+BWSY87Hyb66B0Dpm46x+4gskR4jM8pzHC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="281485611"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200";
   d="scan'208";a="281485611"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 08:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200";
   d="scan'208";a="616896425"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga002.jf.intel.com with ESMTP; 14 Sep 2022 08:14:50 -0700
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] go: fix and ignore several CVEs
Date: Wed, 14 Sep 2022 23:14:49 +0800
Message-Id: <20220914151449.64143-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 15:15:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170661

From: Chee Yang Lee <chee.yang.lee@intel.com>

backport fixes:
CVE-2021-27918
CVE-2021-36221
CVE-2021-39293
CVE-2021-41771

ignore:
CVE-2022-29526
CVE-2022-30634

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  10 +
 .../go/go-1.14/CVE-2021-27918.patch           | 191 ++++++++++++++++++
 .../go/go-1.14/CVE-2021-36221.patch           | 101 +++++++++
 .../go/go-1.14/CVE-2021-39293.patch           |  79 ++++++++
 .../go/go-1.14/CVE-2021-41771.patch           |  86 ++++++++
 5 files changed, 467 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-27918.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-36221.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-39293.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2021-41771.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/g=
o/go-1.14.inc
index 1458a11b3f..af6345205e 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -32,6 +32,10 @@ SRC_URI +=3D "\
     file://CVE-2022-30635.patch \
     file://CVE-2022-32148.patch \
     file://CVE-2022-32189.patch \
+    file://CVE-2021-27918.patch \
+    file://CVE-2021-36221.patch \
+    file://CVE-2021-39293.patch \
+    file://CVE-2021-41771.patch \
 "
=20
 SRC_URI_append_libc-musl =3D " file://0009-ld-replace-glibc-dynamic-linker=
-with-musl.patch"
@@ -42,3 +46,9 @@ SRC_URI[main.sha256sum] =3D "7ed13b2209e54a451835997f7803=
5530b331c5b6943cdcd68a3d8
 # https://github.com/golang/go/issues/30999#issuecomment-910470358
 CVE_CHECK_WHITELIST +=3D "CVE-2021-29923"
=20
+# this issue affected go1.15 onwards
+# https://security-tracker.debian.org/tracker/CVE-2022-29526
+CVE_CHECK_WHITELIST +=3D "CVE-2022-29526"
+
+# Issue only on windows
+CVE_CHECK_WHITELIST +=3D "CVE-2022-30634"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-27918.patch b/meta/r=
ecipes-devtools/go/go-1.14/CVE-2021-27918.patch
new file mode 100644
index 0000000000..faa3f7f641
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-27918.patch
@@ -0,0 +1,191 @@
+From d0b79e3513a29628f3599dc8860666b6eed75372 Mon Sep 17 00:00:00 2001
+From: Katie Hockman <katie@golang.org>
+Date: Mon, 1 Mar 2021 09:54:00 -0500
+Subject: [PATCH] encoding/xml: prevent infinite loop while decoding
+
+This change properly handles a TokenReader which
+returns an EOF in the middle of an open XML
+element.
+
+Thanks to Sam Whited for reporting this.
+
+Fixes CVE-2021-27918
+Fixes #44913
+
+Change-Id: Id02a3f3def4a1b415fa2d9a8e3b373eb6cb0f433
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+=
/1004594
+Reviewed-by: Russ Cox <rsc@google.com>
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Filippo Valsorda <valsorda@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/300391
+Trust: Katie Hockman <katie@golang.org>
+Run-TryBot: Katie Hockman <katie@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Alexander Rakoczy <alex@golang.org>
+Reviewed-by: Filippo Valsorda <filippo@golang.org>
+
+https://github.com/golang/go/commit/d0b79e3513a29628f3599dc8860666b6eed753=
72
+CVE: CVE-2021-27918
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/encoding/xml/xml.go      |  19 ++++---
+ src/encoding/xml/xml_test.go | 104 +++++++++++++++++++++++++++--------
+ 2 files changed, 92 insertions(+), 31 deletions(-)
+
+diff --git a/src/encoding/xml/xml.go b/src/encoding/xml/xml.go
+index adaf4daf198b9..6f9594d7ba7a3 100644
+--- a/src/encoding/xml/xml.go
++++ b/src/encoding/xml/xml.go
+@@ -271,7 +271,7 @@ func NewTokenDecoder(t TokenReader) *Decoder {
+ // it will return an error.
+ //
+ // Token implements XML name spaces as described by
+-// https://www.w3.org/TR/REC-xml-names/.  Each of the
++// https://www.w3.org/TR/REC-xml-names/. Each of the
+ // Name structures contained in the Token has the Space
+ // set to the URL identifying its name space when known.
+ // If Token encounters an unrecognized name space prefix,
+@@ -285,16 +285,17 @@ func (d *Decoder) Token() (Token, error) {
+ 	if d.nextToken !=3D nil {
+ 		t =3D d.nextToken
+ 		d.nextToken =3D nil
+-	} else if t, err =3D d.rawToken(); err !=3D nil {
+-		switch {
+-		case err =3D=3D io.EOF && d.t !=3D nil:
+-			err =3D nil
+-		case err =3D=3D io.EOF && d.stk !=3D nil && d.stk.kind !=3D stkEOF:
+-			err =3D d.syntaxError("unexpected EOF")
++	} else {
++		if t, err =3D d.rawToken(); t =3D=3D nil && err !=3D nil {
++			if err =3D=3D io.EOF && d.stk !=3D nil && d.stk.kind !=3D stkEOF {
++				err =3D d.syntaxError("unexpected EOF")
++			}
++			return nil, err
+ 		}
+-		return t, err
++		// We still have a token to process, so clear any
++		// errors (e.g. EOF) and proceed.
++		err =3D nil
+ 	}
+-
+ 	if !d.Strict {
+ 		if t1, ok :=3D d.autoClose(t); ok {
+ 			d.nextToken =3D t
+diff --git a/src/encoding/xml/xml_test.go b/src/encoding/xml/xml_test.go
+index efddca43e9102..5672ebb375f0d 100644
+--- a/src/encoding/xml/xml_test.go
++++ b/src/encoding/xml/xml_test.go
+@@ -33,30 +33,90 @@ func (t *toks) Token() (Token, error) {
+=20
+ func TestDecodeEOF(t *testing.T) {
+ 	start :=3D StartElement{Name: Name{Local: "test"}}
+-	t.Run("EarlyEOF", func(t *testing.T) {
+-		d :=3D NewTokenDecoder(&toks{earlyEOF: true, t: []Token{
+-			start,
+-			start.End(),
+-		}})
+-		err :=3D d.Decode(&struct {
+-			XMLName Name `xml:"test"`
+-		}{})
+-		if err !=3D nil {
+-			t.Error(err)
++	tests :=3D []struct {
++		name   string
++		tokens []Token
++		ok     bool
++	}{
++		{
++			name: "OK",
++			tokens: []Token{
++				start,
++				start.End(),
++			},
++			ok: true,
++		},
++		{
++			name: "Malformed",
++			tokens: []Token{
++				start,
++				StartElement{Name: Name{Local: "bad"}},
++				start.End(),
++			},
++			ok: false,
++		},
++	}
++	for _, tc :=3D range tests {
++		for _, eof :=3D range []bool{true, false} {
++			name :=3D fmt.Sprintf("%s/earlyEOF=3D%v", tc.name, eof)
++			t.Run(name, func(t *testing.T) {
++				d :=3D NewTokenDecoder(&toks{
++					earlyEOF: eof,
++					t:        tc.tokens,
++				})
++				err :=3D d.Decode(&struct {
++					XMLName Name `xml:"test"`
++				}{})
++				if tc.ok && err !=3D nil {
++					t.Fatalf("d.Decode: expected nil error, got %v", err)
++				}
++				if _, ok :=3D err.(*SyntaxError); !tc.ok && !ok {
++					t.Errorf("d.Decode: expected syntax error, got %v", err)
++				}
++			})
+ 		}
+-	})
+-	t.Run("LateEOF", func(t *testing.T) {
+-		d :=3D NewTokenDecoder(&toks{t: []Token{
+-			start,
+-			start.End(),
+-		}})
+-		err :=3D d.Decode(&struct {
+-			XMLName Name `xml:"test"`
+-		}{})
+-		if err !=3D nil {
+-			t.Error(err)
++	}
++}
++
++type toksNil struct {
++	returnEOF bool
++	t         []Token
++}
++
++func (t *toksNil) Token() (Token, error) {
++	if len(t.t) =3D=3D 0 {
++		if !t.returnEOF {
++			// Return nil, nil before returning an EOF. It's legal, but
++			// discouraged.
++			t.returnEOF =3D true
++			return nil, nil
+ 		}
+-	})
++		return nil, io.EOF
++	}
++	var tok Token
++	tok, t.t =3D t.t[0], t.t[1:]
++	return tok, nil
++}
++
++func TestDecodeNilToken(t *testing.T) {
++	for _, strict :=3D range []bool{true, false} {
++		name :=3D fmt.Sprintf("Strict=3D%v", strict)
++		t.Run(name, func(t *testing.T) {
++			start :=3D StartElement{Name: Name{Local: "test"}}
++			bad :=3D StartElement{Name: Name{Local: "bad"}}
++			d :=3D NewTokenDecoder(&toksNil{
++				// Malformed
++				t: []Token{start, bad, start.End()},
++			})
++			d.Strict =3D strict
++			err :=3D d.Decode(&struct {
++				XMLName Name `xml:"test"`
++			}{})
++			if _, ok :=3D err.(*SyntaxError); !ok {
++				t.Errorf("d.Decode: expected syntax error, got %v", err)
++			}
++		})
++	}
+ }
+=20
+ const testInput =3D `
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-36221.patch b/meta/r=
ecipes-devtools/go/go-1.14/CVE-2021-36221.patch
new file mode 100644
index 0000000000..9c00d4ebb2
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-36221.patch
@@ -0,0 +1,101 @@
+From b7a85e0003cedb1b48a1fd3ae5b746ec6330102e Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 7 Jul 2021 16:34:34 -0700
+Subject: [PATCH] net/http/httputil: close incoming ReverseProxy request bo=
dy
+
+Reading from an incoming request body after the request handler aborts
+with a panic can cause a panic, becuse http.Server does not (contrary
+to its documentation) close the request body in this case.
+
+Always close the incoming request body in ReverseProxy.ServeHTTP to
+ensure that any in-flight outgoing requests using the body do not
+read from it.
+
+Updates #46866
+Fixes CVE-2021-36221
+
+Change-Id: I310df269200ad8732c5d9f1a2b00de68725831df
+Reviewed-on: https://go-review.googlesource.com/c/go/+/333191
+Trust: Damien Neil <dneil@google.com>
+Reviewed-by: Brad Fitzpatrick <bradfitz@golang.org>
+Reviewed-by: Filippo Valsorda <filippo@golang.org>
+
+https://github.com/golang/go/commit/b7a85e0003cedb1b48a1fd3ae5b746ec633010=
2e=20
+CVE: CVE-2021-36221
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/net/http/httputil/reverseproxy.go      |  9 +++++
+ src/net/http/httputil/reverseproxy_test.go | 39 ++++++++++++++++++++++
+ 2 files changed, 48 insertions(+)
+
+diff --git a/src/net/http/httputil/reverseproxy.go b/src/net/http/httputil=
/reverseproxy.go
+index 5d39955d62d15..8b63368386f43 100644
+--- a/src/net/http/httputil/reverseproxy.go
++++ b/src/net/http/httputil/reverseproxy.go
+@@ -235,6 +235,15 @@ func (p *ReverseProxy) ServeHTTP(rw http.ResponseWrit=
er, req *http.Request) {
+ 	if req.ContentLength =3D=3D 0 {
+ 		outreq.Body =3D nil // Issue 16036: nil Body for http.Transport retries
+ 	}
++	if outreq.Body !=3D nil {
++		// Reading from the request body after returning from a handler is not
++		// allowed, and the RoundTrip goroutine that reads the Body can outlive
++		// this handler. This can lead to a crash if the handler panics (see
++		// Issue 46866). Although calling Close doesn't guarantee there isn't
++		// any Read in flight after the handle returns, in practice it's safe to
++		// read after closing it.
++		defer outreq.Body.Close()
++	}
+ 	if outreq.Header =3D=3D nil {
+ 		outreq.Header =3D make(http.Header) // Issue 33142: historical behavior=
 was to always allocate
+ 	}
+diff --git a/src/net/http/httputil/reverseproxy_test.go b/src/net/http/htt=
putil/reverseproxy_test.go
+index 1898ed8b8afde..4b6ad77a29466 100644
+--- a/src/net/http/httputil/reverseproxy_test.go
++++ b/src/net/http/httputil/reverseproxy_test.go
+@@ -1122,6 +1122,45 @@ func TestReverseProxy_PanicBodyError(t *testing.T) {
+ 	rproxy.ServeHTTP(httptest.NewRecorder(), req)
+ }
+=20
++// Issue #46866: panic without closing incoming request body causes a pan=
ic
++func TestReverseProxy_PanicClosesIncomingBody(t *testing.T) {
++	backend :=3D httptest.NewServer(http.HandlerFunc(func(w http.ResponseWri=
ter, r *http.Request) {
++		out :=3D "this call was relayed by the reverse proxy"
++		// Coerce a wrong content length to induce io.ErrUnexpectedEOF
++		w.Header().Set("Content-Length", fmt.Sprintf("%d", len(out)*2))
++		fmt.Fprintln(w, out)
++	}))
++	defer backend.Close()
++	backendURL, err :=3D url.Parse(backend.URL)
++	if err !=3D nil {
++		t.Fatal(err)
++	}
++	proxyHandler :=3D NewSingleHostReverseProxy(backendURL)
++	proxyHandler.ErrorLog =3D log.New(io.Discard, "", 0) // quiet for tests
++	frontend :=3D httptest.NewServer(proxyHandler)
++	defer frontend.Close()
++	frontendClient :=3D frontend.Client()
++
++	var wg sync.WaitGroup
++	for i :=3D 0; i < 2; i++ {
++		wg.Add(1)
++		go func() {
++			defer wg.Done()
++			for j :=3D 0; j < 10; j++ {
++				const reqLen =3D 6 * 1024 * 1024
++				req, _ :=3D http.NewRequest("POST", frontend.URL, &io.LimitedReader{R=
: neverEnding('x'), N: reqLen})
++				req.ContentLength =3D reqLen
++				resp, _ :=3D frontendClient.Transport.RoundTrip(req)
++				if resp !=3D nil {
++					io.Copy(io.Discard, resp.Body)
++					resp.Body.Close()
++				}
++			}
++		}()
++	}
++	wg.Wait()
++}
++
+ func TestSelectFlushInterval(t *testing.T) {
+ 	tests :=3D []struct {
+ 		name string
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-39293.patch b/meta/r=
ecipes-devtools/go/go-1.14/CVE-2021-39293.patch
new file mode 100644
index 0000000000..88fca9cad9
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-39293.patch
@@ -0,0 +1,79 @@
+From 6c480017ae600b2c90a264a922e041df04dfa785 Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Wed, 18 Aug 2021 11:49:29 -0700
+Subject: [PATCH] [release-branch.go1.16] archive/zip: prevent preallocation
+ check from overflowing
+
+If the indicated directory size in the archive header is so large that
+subtracting it from the archive size overflows a uint64, the check that
+the indicated number of files in the archive can be effectively
+bypassed. Prevent this from happening by checking that the indicated
+directory size is less than the size of the archive.
+
+Thanks to the OSS-Fuzz project for discovering this issue and to
+Emmanuel Odeke for reporting it.
+
+Fixes #47985
+Updates #47801
+Fixes CVE-2021-39293
+
+Change-Id: Ifade26b98a40f3b37398ca86bd5252d12394dd24
+Reviewed-on: https://go-review.googlesource.com/c/go/+/343434
+Trust: Roland Shoemaker <roland@golang.org>
+Run-TryBot: Roland Shoemaker <roland@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Russ Cox <rsc@golang.org>
+(cherry picked from commit bacbc33439b124ffd7392c91a5f5d96eca8c0c0b)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/345409
+Reviewed-by: Emmanuel Odeke <emmanuel@orijtech.com>
+Run-TryBot: Emmanuel Odeke <emmanuel@orijtech.com>
+Trust: Cherry Mui <cherryyz@google.com>
+
+https://github.com/golang/go/commit/6c480017ae600b2c90a264a922e041df04dfa7=
85
+CVE: CVE-2021-39293
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/archive/zip/reader.go      |  2 +-
+ src/archive/zip/reader_test.go | 18 ++++++++++++++++++
+ 2 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/src/archive/zip/reader.go b/src/archive/zip/reader.go
+index ddef2b7b5a517..801d1313b6c32 100644
+--- a/src/archive/zip/reader.go
++++ b/src/archive/zip/reader.go
+@@ -105,7 +105,7 @@ func (z *Reader) init(r io.ReaderAt, size int64) error=
 {
+ 	// indicate it contains up to 1 << 128 - 1 files. Since each file has a
+ 	// header which will be _at least_ 30 bytes we can safely preallocate
+ 	// if (data size / 30) >=3D end.directoryRecords.
+-	if (uint64(size)-end.directorySize)/30 >=3D end.directoryRecords {
++	if end.directorySize < uint64(size) && (uint64(size)-end.directorySize)/=
30 >=3D end.directoryRecords {
+ 		z.File =3D make([]*File, 0, end.directoryRecords)
+ 	}
+ 	z.Comment =3D end.comment
+diff --git a/src/archive/zip/reader_test.go b/src/archive/zip/reader_test.=
go
+index 471be27bb1004..99f13345d8d06 100644
+--- a/src/archive/zip/reader_test.go
++++ b/src/archive/zip/reader_test.go
+@@ -1225,3 +1225,21 @@ func TestCVE202133196(t *testing.T) {
+ 		t.Errorf("Archive has unexpected number of files, got %d, want 5", len(=
r.File))
+ 	}
+ }
++
++func TestCVE202139293(t *testing.T) {
++	// directory size is so large, that the check in Reader.init
++	// overflows when subtracting from the archive size, causing
++	// the pre-allocation check to be bypassed.
++	data :=3D []byte{
++		0x50, 0x4b, 0x06, 0x06, 0x05, 0x06, 0x31, 0x00, 0x00, 0x00, 0x00, 0x00,=
 0x00, 0x50, 0x4b,
++		0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x01,
++		0x00, 0x00, 0x50, 0x4b, 0x05, 0x06, 0x00, 0x1a, 0x00, 0x00, 0x00, 0x00,=
 0x00, 0x50, 0x4b,
++		0x06, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,=
 0x00, 0x00, 0x01,
++		0x00, 0x00, 0x00, 0x50, 0x4b, 0x05, 0x06, 0x00, 0x31, 0x00, 0x00, 0x00,=
 0x00, 0xff, 0xff,
++		0xff, 0x50, 0xfe, 0x00, 0xff, 0x00, 0x3a, 0x00, 0x00, 0x00, 0xff,
++	}
++	_, err :=3D NewReader(bytes.NewReader(data), int64(len(data)))
++	if err !=3D ErrFormat {
++		t.Fatalf("unexpected error, got: %v, want: %v", err, ErrFormat)
++	}
++}
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2021-41771.patch b/meta/r=
ecipes-devtools/go/go-1.14/CVE-2021-41771.patch
new file mode 100644
index 0000000000..526796dbcb
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2021-41771.patch
@@ -0,0 +1,86 @@
+From d19c5bdb24e093a2d5097b7623284eb02726cede Mon Sep 17 00:00:00 2001
+From: Roland Shoemaker <roland@golang.org>
+Date: Thu, 14 Oct 2021 13:02:01 -0700
+Subject: [PATCH] [release-branch.go1.16] debug/macho: fail on invalid dyna=
mic
+ symbol table command
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fail out when loading a file that contains a dynamic symbol table
+command that indicates a larger number of symbols than exist in the
+loaded symbol table.
+
+Thanks to Burak =C3=87ar=C4=B1k=C3=A7=C4=B1 - Yunus Y=C4=B1ld=C4=B1r=C4=B1=
m (CT-Zer0 Crypttech) for
+reporting this issue.
+
+Updates #48990
+Fixes #48991
+Fixes CVE-2021-41771
+
+Change-Id: Ic3d6e6529241afcc959544b326b21b663262bad5
+Reviewed-on: https://go-review.googlesource.com/c/go/+/355990
+Reviewed-by: Julie Qiu <julie@golang.org>
+Reviewed-by: Katie Hockman <katie@golang.org>
+Reviewed-by: Emmanuel Odeke <emmanuel@orijtech.com>
+Run-TryBot: Roland Shoemaker <roland@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Trust: Katie Hockman <katie@golang.org>
+(cherry picked from commit 61536ec03063b4951163bd09609c86d82631fa27)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/359454
+Reviewed-by: Dmitri Shuralyov <dmitshur@golang.org>
+
+https://github.com/golang/go/commit/d19c5bdb24e093a2d5097b7623284eb02726ce=
de
+CVE: CVE-2021-41771
+Upstream-Status: Backport
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+---
+ src/debug/macho/file.go                                  | 9 +++++++++
+ src/debug/macho/file_test.go                             | 7 +++++++
+ .../testdata/gcc-amd64-darwin-exec-with-bad-dysym.base64 | 1 +
+ 3 files changed, 17 insertions(+)
+ create mode 100644 src/debug/macho/testdata/gcc-amd64-darwin-exec-with-ba=
d-dysym.base64
+
+diff --git a/src/debug/macho/file.go b/src/debug/macho/file.go
+index 085b0c8219bad..73cfce3c7606e 100644
+--- a/src/debug/macho/file.go
++++ b/src/debug/macho/file.go
+@@ -345,6 +345,15 @@ func NewFile(r io.ReaderAt) (*File, error) {
+ 			if err :=3D binary.Read(b, bo, &hdr); err !=3D nil {
+ 				return nil, err
+ 			}
++			if hdr.Iundefsym > uint32(len(f.Symtab.Syms)) {
++				return nil, &FormatError{offset, fmt.Sprintf(
++					"undefined symbols index in dynamic symbol table command is greater =
than symbol table length (%d > %d)",
++					hdr.Iundefsym, len(f.Symtab.Syms)), nil}
++			} else if hdr.Iundefsym+hdr.Nundefsym > uint32(len(f.Symtab.Syms)) {
++				return nil, &FormatError{offset, fmt.Sprintf(
++					"number of undefined symbols after index in dynamic symbol table com=
mand is greater than symbol table length (%d > %d)",
++					hdr.Iundefsym+hdr.Nundefsym, len(f.Symtab.Syms)), nil}
++			}
+ 			dat :=3D make([]byte, hdr.Nindirectsyms*4)
+ 			if _, err :=3D r.ReadAt(dat, int64(hdr.Indirectsymoff)); err !=3D nil {
+ 				return nil, err
+diff --git a/src/debug/macho/file_test.go b/src/debug/macho/file_test.go
+index 03915c86e23d9..9beeb80dd27c1 100644
+--- a/src/debug/macho/file_test.go
++++ b/src/debug/macho/file_test.go
+@@ -416,3 +416,10 @@ func TestTypeString(t *testing.T) {
+ 		t.Errorf("got %v, want %v", TypeExec.GoString(), "macho.Exec")
+ 	}
+ }
++
++func TestOpenBadDysymCmd(t *testing.T) {
++	_, err :=3D openObscured("testdata/gcc-amd64-darwin-exec-with-bad-dysym.=
base64")
++	if err =3D=3D nil {
++		t.Fatal("openObscured did not fail when opening a file with an invalid =
dynamic symbol table command")
++	}
++}
+diff --git a/src/debug/macho/testdata/gcc-amd64-darwin-exec-with-bad-dysym=
.base64 b/src/debug/macho/testdata/gcc-amd64-darwin-exec-with-bad-dysym.bas=
e64
+new file mode 100644
+index 0000000000000..8e0436639c109
+--- /dev/null
++++ b/src/debug/macho/testdata/gcc-amd64-darwin-exec-with-bad-dysym.base64
+@@ -0,0 +1 @@
++z/rt/gcAAAEDAACAAgAAAAsAAABoBQAAhQAAAAAAAAAZAAAASAAAAF9fUEFHRVpFUk8AAAAAA=
AAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAZAAAA2AEA=
AF9fVEVYVAAAAAAAAAAAAAAAAAAAAQAAAAAQAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAcAAAAFAAA=
ABQAAAAAAAABfX3RleHQAAAAAAAAAAAAAX19URVhUAAAAAAAAAAAAABQPAAABAAAAbQAAAAAAAA=
AUDwAAAgAAAAAAAAAAAAAAAAQAgAAAAAAAAAAAAAAAAF9fc3ltYm9sX3N0dWIxAABfX1RFWFQAA=
AAAAAAAAAAAgQ8AAAEAAAAMAAAAAAAAAIEPAAAAAAAAAAAAAAAAAAAIBACAAAAAAAYAAAAAAAAA=
X19zdHViX2hlbHBlcgAAAF9fVEVYVAAAAAAAAAAAAACQDwAAAQAAABgAAAAAAAAAkA8AAAIAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABfX2NzdHJpbmcAAAAAAAAAX19URVhUAAAAAAAAAAAAAK=
gPAAABAAAADQAAAAAAAACoDwAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAF9fZWhfZnJhb=
WUAAAAAAABfX1RFWFQAAAAAAAAAAAAAuA8AAAEAAABIAAAAAAAAALgPAAADAAAAAAAAAAAAAAAL=
AABgAAAAAAAAAAAAAAAAGQAAADgBAABfX0RBVEEAAAAAAAAAAAAAABAAAAEAAAAAEAAAAAAAAAA=
QAAAAAAAAABAAAAAAAAAHAAAAAwAAAAMAAAAAAAAAX19kYXRhAAAAAAAAAAAAAF9fREFUQQAAAA=
AAAAAAAAAAEAAAAQAAABwAAAAAAAAAABAAAAMAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABfX=
2R5bGQAAAAAAAAAAAAAX19EQVRBAAAAAAAAAAAAACAQAAABAAAAOAAAAAAAAAAgEAAAAwAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAF9fbGFfc3ltYm9sX3B0cgBfX0RBVEEAAAAAAAAAAAAAWBA=
AAAEAAAAQAAAAAAAAAFgQAAACAAAAAAAAAAAAAAAHAAAAAgAAAAAAAAAAAAAAGQAAAEgAAABfX0=
xJTktFRElUAAAAAAAAACAAAAEAAAAAEAAAAAAAAAAgAAAAAAAAQAEAAAAAAAAHAAAAAQAAAAAAA=
AAAAAAAAgAAABgAAAAAIAAACwAAAMAgAACAAAAACwAAAFAAAAAAAAAAAgAAAAIAAAAHAAAACQAA=
AP8AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwIAAABAAAAAAAAAAAAAAAAAAAAAAAAAAOAAA=
AIAAAAAwAAAAvdXNyL2xpYi9keWxkAAAAAAAAABsAAAAYAAAAOyS4cg5FdtQoqu6JsMEhXQUAAA=
C4AAAABAAAACoAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQPAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAMAAAAOAAAABgAAAACAAAAAAABAAAAAQAvdXNyL2xpYi9saWJnY2Nfcy4xLm=
R5bGliAAAAAAAAAAwAAAA4AAAAGAAAAAIAAAAEAW8AAAABAC91c3IvbGliL2xpYlN5c3RlbS5CL=
mR5bGliAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABqAEiJ5UiD5PBIi30ISI11EIn6g=
8IBweIDSAHySInR6wRIg8EISIM5AHX2SIPBCOgiAAAAicfoMgAAAPRBU0yNHafw//9BU/8lvwAA=
AA8fAP8lvgAAAFVIieVIjT0zAAAA6A0AAAC4AAAAAMnD/yXRAAAA/yXTAAAAAAAATI0dwQAAAOm=
0////TI0dvQAAAOmo////aGVsbG8sIHdvcmxkAAAAABQAAAAAAAAAAXpSAAF4EAEQDAcIkAEAAC=
wAAAAcAAAAkv////////8XAAAAAAAAAAAEAQAAAA4QhgIEAwAAAA0GAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABDAX/9/AAAIEMBf/38AAAAAAAABAAAAGBAAAAEAAAAQ=
EAAAAQAAAAgQAAABAAAAABAAAAEAAACQDwAAAQAAAJwPAAABAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACAAAAHgEAAFAPAAABAAAAGwAA=
AB4BAABkDwAAAQAAAC4AAAAPBgAAGBAAAAEAAAA2AAAADwYAABAQAAABAAAAPgAAAA8GAAAAEAA=
AAQAAAEoAAAADABAAAAAAAAEAAABeAAAADwYAAAgQAAABAAAAZwAAAA8BAABqDwAAAQAAAG0AAA=
APAQAAFA8AAAEAAABzAAAAAQABAgAAAAAAAAAAeQAAAAEAAQIAAAAAAAAAAAkAAAAKAAAACQAAA=
AoAAAAgAGR5bGRfc3R1Yl9iaW5kaW5nX2hlbHBlcgBfX2R5bGRfZnVuY19sb29rdXAAX05YQXJn=
YwBfTlhBcmd2AF9fX3Byb2duYW1lAF9fbWhfZXhlY3V0ZV9oZWFkZXIAX2Vudmlyb24AX21haW4=
Ac3RhcnQAX2V4aXQAX3B1dHMAAA=3D=3D
+\ No newline at end of file
--=20
2.36.1


