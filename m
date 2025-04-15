Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA67C369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 20:52:38 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4834.1744750358112344999
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 13:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BJG6NJTS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73972a54919so5129735b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 13:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744750357; x=1745355157; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3naalz5Scpa1mY4p+tqQ9ebFIOrYxiLCNFdFYz37ZI=;
        b=BJG6NJTSrm/H4vAhf35iKkR/rrFSKn6WRXeHo5V/lLkxeKsuXzi5iYk6UEsvTHlHsx
         IMaA9iKXZtdWdbgoTJFVgIFwT/YXJ3/fWgNFO+RrPwl4bNvUF4ws9Q/P0PUa3fDfNjMy
         935hrjvcLvIEajUwzQRNiGuUbkg37IchJ5+eddz8fLCJzoqYk9YUi4+nzI7rE2doq00v
         MbS65eC0ZAVIlBPxQYIeDKszikFb2mWCf3lpfi/aFeGSSAGJFpdJrxwTbWEXkbYR9jz9
         T2sywilrlkvTO+95pj60RAhoUIqopci+7bi3RtWoYZvphceUmrCNhhfwPRVwjiPDF2xK
         a3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744750357; x=1745355157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3naalz5Scpa1mY4p+tqQ9ebFIOrYxiLCNFdFYz37ZI=;
        b=h0Y8WdLq7irzsnHaCKMpUpoBeKL4/Gb2wM5Opgg8iTYWqij1UW6/IZSlCpjxocMQrK
         cKzqiceWnev/lPoTe3/1iOAwym4x927ykowQvGxliMNkInGuvt+RuQIiBUFzSw0hg0Nw
         e5vLzG+aeknFajRV8TtLTmaL5kp1RbNnrBQFEDuso1zF0M1pWZXcXl4dEeu/EWBG1Q7+
         RydlTxd4+2YDS8ugNBSOptOUG4bg1DkEav8CuImfGJKWknoRP1JzLXTjcKOkMlEIWSNo
         AX7TAAg6H6pD7OO7HPC8/1QLgNXEecbM/GBQm0NZ5Wwm/jEC+sSbp4iJO659EWV9De/H
         yHYw==
X-Gm-Message-State: AOJu0YwZ8RQfP92rUz2UKyvlULHkjO00Q9nTChpr7akH9QHp5wMLrG6V
	rxq31671eNXAiCPDxfceXJsBaHk1vqOVUHmjWzazoNyDMIqaxSq2+BOciNqVBYWErv/jEVoCwrB
	8
X-Gm-Gg: ASbGncuub8oDUZ18ReThwotvL3B+jfTzc9j/AM6hIWVJ4alHGyNstZnUd/6HxaT6gwT
	VWhFUta+/E+kNUOjjj7jEvMzwdIKpAK1skXPE4sLPk1VQRkz29nn8w4mEzS5xgiY/VTvK5klkdV
	HWtBvEFYB14DeETmytfH3OutxMlubyO7nwck7c/8vZI/TuxeaWulAw/OwR6ETtmv9a4wC6tCoL6
	3n/ljjmvdrvvATT/cgngxhloy0iIQ9w9WMixjXVkrigQfdOwt7oNlagLZ21SSUHGEEgexUXoqLZ
	fBFyyKc6OlqNZT8L6wK/k7C7XoHDTxKK
X-Google-Smtp-Source: AGHT+IFFHeebCRbS2+66nRwTUGptCbLnFw3EPtCzEfBkJrcD0s8MyJiwLfoOcHocwuVaqEfenIIOuw==
X-Received: by 2002:a05:6a00:ac86:b0:736:6279:ca25 with SMTP id d2e1a72fcca58-73c1fb2800cmr1466922b3a.24.1744750357130;
        Tue, 15 Apr 2025 13:52:37 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6144:9704:3eb2:ee31])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23332a3sm8978307b3a.161.2025.04.15.13.52.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 13:52:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/4] go: fix CVE-2025-22871
Date: Tue, 15 Apr 2025 13:52:24 -0700
Message-ID: <2a9f47eb507cf57b58c4aa1baf0ef645b699fd6c.1744750227.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744750227.git.steve@sakoman.com>
References: <cover.1744750227.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 20:52:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214970

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/15e01a2e43ecb8c7e15ff7e9d62fe3f10dcac931

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.21/CVE-2025-22871.patch           | 172 ++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.21/CVE-2025-22871.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 34ad70572f..e54205d48c 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -62,6 +62,7 @@ SRC_URI += "\
     file://CVE-2024-34156.patch \
     file://CVE-2024-34158.patch \
     file://CVE-2024-45336.patch \
+    file://CVE-2025-22871.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.21/CVE-2025-22871.patch b/meta/recipes-devtools/go/go-1.21/CVE-2025-22871.patch
new file mode 100644
index 0000000000..06e0fa77de
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.21/CVE-2025-22871.patch
@@ -0,0 +1,172 @@
+From 15e01a2e43ecb8c7e15ff7e9d62fe3f10dcac931 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 26 Feb 2025 13:40:00 -0800
+Subject: [PATCH] [release-branch.go1.23] net/http: reject newlines in
+ chunk-size lines
+
+Unlike request headers, where we are allowed to leniently accept
+a bare LF in place of a CRLF, chunked bodies must always use CRLF
+line terminators. We were already enforcing this for chunk-data lines;
+do so for chunk-size lines as well. Also reject bare CRs anywhere
+other than as part of the CRLF terminator.
+
+Fixes CVE-2025-22871
+Fixes #72010
+For #71988
+
+Change-Id: Ib0e21af5a8ba28c2a1ca52b72af8e2265ec79e4a
+Reviewed-on: https://go-review.googlesource.com/c/go/+/652998
+Reviewed-by: Jonathan Amsterdam <jba@google.com>
+LUCI-TryBot-Result: Go LUCI <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+(cherry picked from commit d31c805535f3fde95646ee4d87636aaaea66847b)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/657216
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/15e01a2e43ecb8c7e15ff7e9d62fe3f10dcac931]
+CVE: CVE-2025-22871
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/net/http/internal/chunked.go      | 19 +++++++++--
+ src/net/http/internal/chunked_test.go | 27 +++++++++++++++
+ src/net/http/serve_test.go            | 49 +++++++++++++++++++++++++++
+ 3 files changed, 92 insertions(+), 3 deletions(-)
+
+diff --git a/src/net/http/internal/chunked.go b/src/net/http/internal/chunked.go
+index ddbaacb..dd79afc 100644
+--- a/src/net/http/internal/chunked.go
++++ b/src/net/http/internal/chunked.go
+@@ -159,6 +159,19 @@ func readChunkLine(b *bufio.Reader) ([]byte, error) {
+ 		}
+ 		return nil, err
+ 	}
++
++	// RFC 9112 permits parsers to accept a bare \n as a line ending in headers,
++	// but not in chunked encoding lines. See https://www.rfc-editor.org/errata/eid7633,
++	// which explicitly rejects a clarification permitting \n as a chunk terminator.
++	//
++	// Verify that the line ends in a CRLF, and that no CRs appear before the end.
++	if idx := bytes.IndexByte(p, '\r'); idx == -1 {
++		return nil, errors.New("chunked line ends with bare LF")
++	} else if idx != len(p)-2 {
++		return nil, errors.New("invalid CR in chunked line")
++	}
++	p = p[:len(p)-2] // trim CRLF
++
+ 	if len(p) >= maxLineLength {
+ 		return nil, ErrLineTooLong
+ 	}
+@@ -166,14 +179,14 @@ func readChunkLine(b *bufio.Reader) ([]byte, error) {
+ }
+ 
+ func trimTrailingWhitespace(b []byte) []byte {
+-	for len(b) > 0 && isASCIISpace(b[len(b)-1]) {
++	for len(b) > 0 && isOWS(b[len(b)-1]) {
+ 		b = b[:len(b)-1]
+ 	}
+ 	return b
+ }
+ 
+-func isASCIISpace(b byte) bool {
+-	return b == ' ' || b == '\t' || b == '\n' || b == '\r'
++func isOWS(b byte) bool {
++	return b == ' ' || b == '\t'
+ }
+ 
+ // removeChunkExtension removes any chunk-extension from p.
+diff --git a/src/net/http/internal/chunked_test.go b/src/net/http/internal/chunked_test.go
+index 5fbeb08..51ecd62 100644
+--- a/src/net/http/internal/chunked_test.go
++++ b/src/net/http/internal/chunked_test.go
+@@ -251,6 +251,33 @@ func TestChunkReaderByteAtATime(t *testing.T) {
+ 	}
+ }
+ 
++func TestChunkInvalidInputs(t *testing.T) {
++	for _, test := range []struct {
++		name string
++		b    string
++	}{{
++		name: "bare LF in chunk size",
++		b:    "1\na\r\n0\r\n",
++	}, {
++		name: "extra LF in chunk size",
++		b:    "1\r\r\na\r\n0\r\n",
++	}, {
++		name: "bare LF in chunk data",
++		b:    "1\r\na\n0\r\n",
++	}, {
++		name: "bare LF in chunk extension",
++		b:    "1;\na\r\n0\r\n",
++	}} {
++		t.Run(test.name, func(t *testing.T) {
++			r := NewChunkedReader(strings.NewReader(test.b))
++			got, err := io.ReadAll(r)
++			if err == nil {
++				t.Fatalf("unexpectedly parsed invalid chunked data:\n%q", got)
++			}
++		})
++	}
++}
++
+ type funcReader struct {
+ 	f   func(iteration int) ([]byte, error)
+ 	i   int
+diff --git a/src/net/http/serve_test.go b/src/net/http/serve_test.go
+index bfac783..944cd46 100644
+--- a/src/net/http/serve_test.go
++++ b/src/net/http/serve_test.go
+@@ -6610,3 +6610,52 @@ func testQuerySemicolon(t *testing.T, query string, wantX string, allowSemicolon
+ 		}
+ 	}
+ }
++
++func TestInvalidChunkedBodies(t *testing.T) {
++	for _, test := range []struct {
++		name string
++		b    string
++	}{{
++		name: "bare LF in chunk size",
++		b:    "1\na\r\n0\r\n\r\n",
++	}, {
++		name: "bare LF at body end",
++		b:    "1\r\na\r\n0\r\n\n",
++	}} {
++		t.Run(test.name, func(t *testing.T) {
++			reqc := make(chan error)
++			ts := newClientServerTest(t, http1Mode, HandlerFunc(func(w ResponseWriter, r *Request) {
++				got, err := io.ReadAll(r.Body)
++				if err == nil {
++					t.Logf("read body: %q", got)
++				}
++				reqc <- err
++			})).ts
++
++			serverURL, err := url.Parse(ts.URL)
++			if err != nil {
++				t.Fatal(err)
++			}
++
++			conn, err := net.Dial("tcp", serverURL.Host)
++			if err != nil {
++				t.Fatal(err)
++			}
++
++			if _, err := conn.Write([]byte(
++				"POST / HTTP/1.1\r\n" +
++					"Host: localhost\r\n" +
++					"Transfer-Encoding: chunked\r\n" +
++					"Connection: close\r\n" +
++					"\r\n" +
++					test.b)); err != nil {
++				t.Fatal(err)
++			}
++			conn.(*net.TCPConn).CloseWrite()
++
++			if err := <-reqc; err == nil {
++				t.Errorf("server handler: io.ReadAll(r.Body) succeeded, want error")
++			}
++		})
++	}
++}
+-- 
+2.25.1
+
-- 
2.43.0


