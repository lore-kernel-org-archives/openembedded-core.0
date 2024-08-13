Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EC2C5320D
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 12:17:13 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.70865.1723551425715681775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 05:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=bxzplCYE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cd48ad7f0dso4202292a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 05:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723551425; x=1724156225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8xqe5IKBAbLnrGT0fdRiTTuYeU8u90yXFvEKdENOBY=;
        b=bxzplCYEvV2dVNi8YuDqbEw6By9k8Y+z535U6o0SreQdx11jTnwCoPh8F0zF8KBSo/
         rSOi9ri40PPSjvUfGFd1WN76/qQL2yOFYnH4mJWMHq5rYu1+btI3F6aBmugWVIP+G4fi
         iCWGF/vqKoC9j4qqHqj2UIpJDL7TCic1hfRdZ/8QAcBHMkcP+9hmbYT7yIj/piSeqfX/
         xrtDXGRdqWI9vDKCtE6JOuglQEgcOpwf4tV0R1fY60NZcFfXl9g/+XGgNnLY1f8R8A7p
         kx6wU+xUCxQKGzKLgRecMEqqdSMwjnG6ZJgXeyalE/uDgVQVSW8mq0OgylEox43KDrDq
         wTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723551425; x=1724156225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8xqe5IKBAbLnrGT0fdRiTTuYeU8u90yXFvEKdENOBY=;
        b=XtlcDez1VM2S0mYImnw3E5rpSSBm6Mh3BC+FJhHn9VC6GzgTZiSL9jYPcB94TyxIzx
         ibNBaZEMCAXbzMzJ+lwXHzfwklCQ6mzzq3HzM+Cc8klG9sn4P9J07UChKIFLHmZDSYaS
         wkO/Nb6pxGB5qdhrOH94SpD9W68NJznwevjz7SosQLubGEqdeoJPWzVt0C11E/zfa/aP
         xoRTnlE0HK6R5HxnQIdkxJe76hbR9UdQoAJMfqFlDt8v8a5SGyQmTCPo8+G2eyL/TDQa
         3cmH52+UmfLY2pBwy0HWVqCNgRgBj5E87luYYmzf4TPHCTPzI8xA8UylrL4jbhpD6VzL
         Yy9w==
X-Gm-Message-State: AOJu0YxeWQirCpUSU1QgGErkUo1n+23XqCl7EU5rndGKwQPt+Mvh7r+1
	dpcMDWC3ul3pWqCyb+mebLu79kyh13NRa6jHQg/+2Fz5+HMzV8ELydCOVEfhS1qPpburXmbaFYj
	7Fpw=
X-Google-Smtp-Source: AGHT+IEAaZqDw6jyaKFVKL9VFHp4orE4t+1Gj5ZQTwz8do8cUCEvzWNfbx3/WXY9lE8dw1dWILsrsw==
X-Received: by 2002:a17:90a:cf95:b0:2c1:c648:1c50 with SMTP id 98e67ed59e1d1-2d3925048a1mr3772048a91.17.1723551424665;
        Tue, 13 Aug 2024 05:17:04 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1fced1838sm7148998a91.23.2024.08.13.05.17.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:17:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/11] go: fix CVE-2024-24791
Date: Tue, 13 Aug 2024 05:16:44 -0700
Message-Id: <4f7ef33e4b22bae288a11ce4f0b6e913f142d2be.1723551231.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1723551231.git.steve@sakoman.com>
References: <cover.1723551231.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 12:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203271

From: Archana Polampalli <archana.polampalli@windriver.com>

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2024-24791.patch           | 359 ++++++++++++++++++
 2 files changed, 360 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2024-24791.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index e83c4dfa80..349b0be6be 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -57,6 +57,7 @@ SRC_URI += "\
     file://CVE-2024-24785.patch \
     file://CVE-2023-45288.patch \
     file://CVE-2024-24789.patch \
+    file://CVE-2024-24791.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2024-24791.patch b/meta/recipes-devtools/go/go-1.21/CVE-2024-24791.patch
new file mode 100644
index 0000000000..9f6a969cf6
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2024-24791.patch
@@ -0,0 +1,359 @@
+From c9be6ae748b7679b644a38182d456cb5a6ac06ee Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 6 Jun 2024 12:50:46 -0700
+Subject: [PATCH] [release-branch.go1.21] net/http: send body or close
+ connection on expect-100-continue requests
+
+When sending a request with an "Expect: 100-continue" header,
+we must send the request body before sending any further requests
+on the connection.
+
+When receiving a non-1xx response to an "Expect: 100-continue" request,
+send the request body if the connection isn't being closed after
+processing the response. In other words, if either the request
+or response contains a "Connection: close" header, then skip sending
+the request body (because the connection will not be used for
+further requests), but otherwise send it.
+
+Correct a comment on the server-side Expect: 100-continue handling
+that implied sending the request body is optional. It isn't.
+
+For #67555
+Fixes #68199
+
+Change-Id: Ia2f12091bee697771087f32ac347509ec5922d54
+Reviewed-on: https://go-review.googlesource.com/c/go/+/591255
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Jonathan Amsterdam <jba@google.com>
+(cherry picked from commit cf501e05e138e6911f759a5db786e90b295499b9)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/595096
+Reviewed-by: Joedian Reid <joedian@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+
+CVE: CVE-2024-24791
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c9be6ae748b7679b644a38182d456cb5a6ac06ee ]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/net/http/server.go         |  25 ++--
+ src/net/http/transport.go      |  34 ++++--
+ src/net/http/transport_test.go | 203 ++++++++++++++++++++-------------
+ 3 files changed, 164 insertions(+), 98 deletions(-)
+
+diff --git a/src/net/http/server.go b/src/net/http/server.go
+index 4fc8fed..1648f1c 100644
+--- a/src/net/http/server.go
++++ b/src/net/http/server.go
+@@ -1297,16 +1297,21 @@ func (cw *chunkWriter) writeHeader(p []byte) {
+
+	// If the client wanted a 100-continue but we never sent it to
+	// them (or, more strictly: we never finished reading their
+-	// request body), don't reuse this connection because it's now
+-	// in an unknown state: we might be sending this response at
+-	// the same time the client is now sending its request body
+-	// after a timeout.  (Some HTTP clients send Expect:
+-	// 100-continue but knowing that some servers don't support
+-	// it, the clients set a timer and send the body later anyway)
+-	// If we haven't seen EOF, we can't skip over the unread body
+-	// because we don't know if the next bytes on the wire will be
+-	// the body-following-the-timer or the subsequent request.
+-	// See Issue 11549.
++	// request body), don't reuse this connection.
++	//
++	// This behavior was first added on the theory that we don't know
++	// if the next bytes on the wire are going to be the remainder of
++	// the request body or the subsequent request (see issue 11549),
++	// but that's not correct: If we keep using the connection,
++	// the client is required to send the request body whether we
++	// asked for it or not.
++	//
++	// We probably do want to skip reusing the connection in most cases,
++	// however. If the client is offering a large request body that we
++	// don't intend to use, then it's better to close the connection
++	// than to read the body. For now, assume that if we're sending
++	// headers, the handler is done reading the body and we should
++	// drop the connection if we haven't seen EOF.
+	if ecr, ok := w.req.Body.(*expectContinueReader); ok && !ecr.sawEOF.isSet() {
+		w.closeAfterReply = true
+	}
+diff --git a/src/net/http/transport.go b/src/net/http/transport.go
+index 309194e..e46ddef 100644
+--- a/src/net/http/transport.go
++++ b/src/net/http/transport.go
+@@ -2282,17 +2282,12 @@ func (pc *persistConn) readResponse(rc requestAndChan, trace *httptrace.ClientTr
+			return
+		}
+		resCode := resp.StatusCode
+-		if continueCh != nil {
+-			if resCode == 100 {
+-				if trace != nil && trace.Got100Continue != nil {
+-					trace.Got100Continue()
+-				}
+-				continueCh <- struct{}{}
+-				continueCh = nil
+-			} else if resCode >= 200 {
+-				close(continueCh)
+-				continueCh = nil
++		if continueCh != nil && resCode == StatusContinue {
++			if trace != nil && trace.Got100Continue != nil {
++				trace.Got100Continue()
+			}
++			continueCh <- struct{}{}
++			continueCh = nil
+		}
+		is1xx := 100 <= resCode && resCode <= 199
+		// treat 101 as a terminal status, see issue 26161
+@@ -2315,6 +2310,25 @@ func (pc *persistConn) readResponse(rc requestAndChan, trace *httptrace.ClientTr
+	if resp.isProtocolSwitch() {
+		resp.Body = newReadWriteCloserBody(pc.br, pc.conn)
+	}
++	if continueCh != nil {
++		// We send an "Expect: 100-continue" header, but the server
++		// responded with a terminal status and no 100 Continue.
++		//
++		// If we're going to keep using the connection, we need to send the request body.
++		// Tell writeLoop to skip sending the body if we're going to close the connection,
++		// or to send it otherwise.
++		//
++		// The case where we receive a 101 Switching Protocols response is a bit
++		// ambiguous, since we don't know what protocol we're switching to.
++		// Conceivably, it's one that doesn't need us to send the body.
++		// Given that we'll send the body if ExpectContinueTimeout expires,
++		// be consistent and always send it if we aren't closing the connection.
++		if resp.Close || rc.req.Close {
++			close(continueCh) // don't send the body; the connection will close
++		} else {
++			continueCh <- struct{}{} // send the body
++		}
++	}
+
+	resp.TLS = pc.tlsState
+	return
+diff --git a/src/net/http/transport_test.go b/src/net/http/transport_test.go
+index 58f12af..8000ecc 100644
+--- a/src/net/http/transport_test.go
++++ b/src/net/http/transport_test.go
+@@ -1130,95 +1130,142 @@ func TestTransportGzip(t *testing.T) {
+	}
+ }
+
+-// If a request has Expect:100-continue header, the request blocks sending body until the first response.
+-// Premature consumption of the request body should not be occurred.
+-func TestTransportExpect100Continue(t *testing.T) {
+-	setParallel(t)
+-	defer afterTest(t)
++// A transport100Continue test exercises Transport behaviors when sending a
++// request with an Expect: 100-continue header.
++type transport100ContinueTest struct {
++	t *testing.T
+
+-	ts := httptest.NewServer(HandlerFunc(func(rw ResponseWriter, req *Request) {
+-		switch req.URL.Path {
+-		case "/100":
+-			// This endpoint implicitly responds 100 Continue and reads body.
+-			if _, err := io.Copy(io.Discard, req.Body); err != nil {
+-				t.Error("Failed to read Body", err)
+-			}
+-			rw.WriteHeader(StatusOK)
+-		case "/200":
+-			// Go 1.5 adds Connection: close header if the client expect
+-			// continue but not entire request body is consumed.
+-			rw.WriteHeader(StatusOK)
+-		case "/500":
+-			rw.WriteHeader(StatusInternalServerError)
+-		case "/keepalive":
+-			// This hijacked endpoint responds error without Connection:close.
+-			_, bufrw, err := rw.(Hijacker).Hijack()
+-			if err != nil {
+-				log.Fatal(err)
+-			}
+-			bufrw.WriteString("HTTP/1.1 500 Internal Server Error\r\n")
+-			bufrw.WriteString("Content-Length: 0\r\n\r\n")
+-			bufrw.Flush()
+-		case "/timeout":
+-			// This endpoint tries to read body without 100 (Continue) response.
+-			// After ExpectContinueTimeout, the reading will be started.
+-			conn, bufrw, err := rw.(Hijacker).Hijack()
+-			if err != nil {
+-				log.Fatal(err)
+-			}
+-			if _, err := io.CopyN(io.Discard, bufrw, req.ContentLength); err != nil {
+-				t.Error("Failed to read Body", err)
+-			}
+-			bufrw.WriteString("HTTP/1.1 200 OK\r\n\r\n")
+-			bufrw.Flush()
+-			conn.Close()
+-		}
++	reqdone chan struct{}
++	resp    *Response
++	respErr error
+
+-	}))
+-	defer ts.Close()
++	conn   net.Conn
++	reader *bufio.Reader
++}
+
+-	tests := []struct {
+-		path   string
+-		body   []byte
+-		sent   int
+-		status int
+-	}{
+-		{path: "/100", body: []byte("hello"), sent: 5, status: 200},       // Got 100 followed by 200, entire body is sent.
+-		{path: "/200", body: []byte("hello"), sent: 0, status: 200},       // Got 200 without 100. body isn't sent.
+-		{path: "/500", body: []byte("hello"), sent: 0, status: 500},       // Got 500 without 100. body isn't sent.
+-		{path: "/keepalive", body: []byte("hello"), sent: 0, status: 500}, // Although without Connection:close, body isn't sent.
+-		{path: "/timeout", body: []byte("hello"), sent: 5, status: 200},   // Timeout exceeded and entire body is sent.
++const transport100ContinueTestBody = "request body"
++
++// newTransport100ContinueTest creates a Transport and sends an Expect: 100-continue
++// request on it.
++func newTransport100ContinueTest(t *testing.T, timeout time.Duration) *transport100ContinueTest {
++	ln := newLocalListener(t)
++	defer ln.Close()
++
++	test := &transport100ContinueTest{
++		t:       t,
++		reqdone: make(chan struct{}),
+	}
+
+-	c := ts.Client()
+-	for i, v := range tests {
+-		tr := &Transport{
+-			ExpectContinueTimeout: 2 * time.Second,
+-		}
+-		defer tr.CloseIdleConnections()
+-		c.Transport = tr
+-		body := bytes.NewReader(v.body)
+-		req, err := NewRequest("PUT", ts.URL+v.path, body)
+-		if err != nil {
+-			t.Fatal(err)
+-		}
++	tr := &Transport{
++		ExpectContinueTimeout: timeout,
++	}
++	go func() {
++		defer close(test.reqdone)
++		body := strings.NewReader(transport100ContinueTestBody)
++		req, _ := NewRequest("PUT", "http://"+ln.Addr().String(), body)
+		req.Header.Set("Expect", "100-continue")
+-		req.ContentLength = int64(len(v.body))
++		req.ContentLength = int64(len(transport100ContinueTestBody))
++		test.resp, test.respErr = tr.RoundTrip(req)
++		test.resp.Body.Close()
++	}()
+
+-		resp, err := c.Do(req)
+-		if err != nil {
+-			t.Fatal(err)
++	c, err := ln.Accept()
++	if err != nil {
++		t.Fatalf("Accept: %v", err)
++	}
++	t.Cleanup(func() {
++		c.Close()
++	})
++	br := bufio.NewReader(c)
++	_, err = ReadRequest(br)
++	if err != nil {
++		t.Fatalf("ReadRequest: %v", err)
++	}
++	test.conn = c
++	test.reader = br
++	t.Cleanup(func() {
++		<-test.reqdone
++		tr.CloseIdleConnections()
++		got, _ := io.ReadAll(test.reader)
++		if len(got) > 0 {
++			t.Fatalf("Transport sent unexpected bytes: %q", got)
+		}
+-		resp.Body.Close()
++	})
+
+-		sent := len(v.body) - body.Len()
+-		if v.status != resp.StatusCode {
+-			t.Errorf("test %d: status code should be %d but got %d. (%s)", i, v.status, resp.StatusCode, v.path)
+-		}
+-		if v.sent != sent {
+-			t.Errorf("test %d: sent body should be %d but sent %d. (%s)", i, v.sent, sent, v.path)
++	return test
++}
++
++// respond sends response lines from the server to the transport.
++func (test *transport100ContinueTest) respond(lines ...string) {
++	for _, line := range lines {
++		if _, err := test.conn.Write([]byte(line + "\r\n")); err != nil {
++			test.t.Fatalf("Write: %v", err)
+		}
+	}
++	if _, err := test.conn.Write([]byte("\r\n")); err != nil {
++		test.t.Fatalf("Write: %v", err)
++	}
++}
++
++// wantBodySent ensures the transport has sent the request body to the server.
++func (test *transport100ContinueTest) wantBodySent() {
++	got, err := io.ReadAll(io.LimitReader(test.reader, int64(len(transport100ContinueTestBody))))
++	if err != nil {
++		test.t.Fatalf("unexpected error reading body: %v", err)
++	}
++	if got, want := string(got), transport100ContinueTestBody; got != want {
++		test.t.Fatalf("unexpected body: got %q, want %q", got, want)
++	}
++}
++
++// wantRequestDone ensures the Transport.RoundTrip has completed with the expected status.
++func (test *transport100ContinueTest) wantRequestDone(want int) {
++	<-test.reqdone
++	if test.respErr != nil {
++		test.t.Fatalf("unexpected RoundTrip error: %v", test.respErr)
++	}
++	if got := test.resp.StatusCode; got != want {
++		test.t.Fatalf("unexpected response code: got %v, want %v", got, want)
++	}
++}
++
++func TestTransportExpect100ContinueSent(t *testing.T) {
++	test := newTransport100ContinueTest(t, 1*time.Hour)
++	// Server sends a 100 Continue response, and the client sends the request body.
++	test.respond("HTTP/1.1 100 Continue")
++	test.wantBodySent()
++	test.respond("HTTP/1.1 200", "Content-Length: 0")
++	test.wantRequestDone(200)
++}
++
++func TestTransportExpect100Continue200ResponseNoConnClose(t *testing.T) {
++	test := newTransport100ContinueTest(t, 1*time.Hour)
++	// No 100 Continue response, no Connection: close header.
++	test.respond("HTTP/1.1 200", "Content-Length: 0")
++	test.wantBodySent()
++	test.wantRequestDone(200)
++}
++
++func TestTransportExpect100Continue200ResponseWithConnClose(t *testing.T) {
++	test := newTransport100ContinueTest(t, 1*time.Hour)
++	// No 100 Continue response, Connection: close header set.
++	test.respond("HTTP/1.1 200", "Connection: close", "Content-Length: 0")
++	test.wantRequestDone(200)
++}
++
++func TestTransportExpect100Continue500ResponseNoConnClose(t *testing.T) {
++	test := newTransport100ContinueTest(t, 1*time.Hour)
++	// No 100 Continue response, no Connection: close header.
++	test.respond("HTTP/1.1 500", "Content-Length: 0")
++	test.wantBodySent()
++	test.wantRequestDone(500)
++}
++
++func TestTransportExpect100Continue500ResponseTimeout(t *testing.T) {
++	test := newTransport100ContinueTest(t, 5*time.Millisecond) // short timeout
++	test.wantBodySent()                                        // after timeout
++	test.respond("HTTP/1.1 200", "Content-Length: 0")
++	test.wantRequestDone(200)
+ }
+
+ func TestSOCKS5Proxy(t *testing.T) {
+--
+2.40.0
-- 
2.34.1


