Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E93CC36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 05:41:18 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.18606.1744350072664549064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 22:41:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=fjDtKkdL;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2279915e06eso17077875ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 22:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744350072; x=1744954872; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pQ01cObB5qccLEp8lUcRlWBhekRWPmjMfhw6zZ2zYs=;
        b=fjDtKkdL/2wuErZ5lEGVPEjlhM+JLEj3pwMFQmH1Lrn3SGffCcqQgr0NHbKiRIKzr9
         QqHbyRmtnlzrlPoLGnSySQBEBWQi0FX65H231jjK9/sAwi+K6egiUp9fywf1g7LCJKPe
         P5iOeGMxcVBFTNTl+TMhptR2eExRwQj1/guBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744350072; x=1744954872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pQ01cObB5qccLEp8lUcRlWBhekRWPmjMfhw6zZ2zYs=;
        b=oIRRdzkKpUBGEHMJPrJ+c8yfXBAdsYSNFyov+JGhvTdZb54oa+SeisZ+eq4TAeACKe
         uziHr+K+0srasJBG6yp8JMcqIMLRCYmHzp/GJm70cIN6s9p1juEj9GpePXa/VoneN6Q4
         T+MsksMfBwQQYIOdaiulf+amUh9AixPU7nYslfDmu2PUG6GtD2o4fgBpZfbMvm//zkEx
         46YWTGMe2HXf+gi7p+GO4VkMaExfN/j00vC/zBZlJ1HEo/zb+UENSau98X7zRKW48Mne
         DPT7ddWDp0BN+EoLh3tQ4g+4r1q/539fT/f2eGrYXL+aPOfmyU6tl3Tcol55jUS6BG4M
         DCcg==
X-Gm-Message-State: AOJu0YzHWyk75zRk0Cu5RV4doab1uJP3f0Z2qPhAy3BaUrPBsXBKtn9b
	OFD4fy0U5vEESszS2vGqLhM/G09s1iqs+TWMPJo6PL9arRtnb8uyRHEgX1iBeRlKafyujBallh4
	s
X-Gm-Gg: ASbGncssVr8LdcAJ1sJc0b9paOMiWjs/FeZ4LP3TDHy7K2qmMv6FFAkLJbOXVHYe6XA
	LtJmIjKCMp8T0TRDFoSmAdF3iAwOhYM/Fum9sEMwXINN2Ik5ypulWTK2mrUDuNYDeDb/oM7vpnW
	R2zDo/jLtE+YN2NSCHRx0SlC5VZOnLlvATyqTs1cDIYktC2WMx2rxC734dt0KTgDCTk1EujBOME
	vjTRnSD776FjCEi7nNqRK6kozXKDjcpdAgEjuoMbcRbWAR7ux1DSFaQspt96Kr/QRrvR458Eqs9
	NDUJdBljyVcIkt7UdYSSLDfPJUbUVTtH5kHOVq4d8U6kaH8uElmZYw51csswy5TA
X-Google-Smtp-Source: AGHT+IG1Wq1qpekwbs3BuZXJq623mHorR0EfGZyerJqr8qIniV3VnxcD+eYgIRcpilI0cmbEU/iMWA==
X-Received: by 2002:a17:902:d550:b0:224:194c:694c with SMTP id d9443c01a7336-22bea4bf56cmr26206595ad.28.1744350071591;
        Thu, 10 Apr 2025 22:41:11 -0700 (PDT)
Received: from MVIN00016.mvista.com ([27.121.101.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd23332a3sm585980b3a.161.2025.04.10.22.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 22:41:11 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] go: fix CVE-2025-22871
Date: Fri, 11 Apr 2025 11:10:49 +0530
Message-Id: <20250411054049.68363-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 05:41:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214712

Upstream-Status: Backport from https://github.com/golang/go/commit/15e01a2e43ecb8c7e15ff7e9d62fe3f10dcac931

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2025-22871.patch                | 172 ++++++++++++++++++
 2 files changed, 173 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2025-22871.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index df77794506..b154aa3984 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -15,5 +15,6 @@ SRC_URI += "\
     file://0008-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://0009-go-Filter-build-paths-on-staticly-linked-arches.patch \
     file://CVE-2025-22870.patch \
+    file://CVE-2025-22871.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
diff --git a/meta/recipes-devtools/go/go/CVE-2025-22871.patch b/meta/recipes-devtools/go/go/CVE-2025-22871.patch
new file mode 100644
index 0000000000..2750178a42
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2025-22871.patch
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
+index 196b5d8..0b08a97 100644
+--- a/src/net/http/internal/chunked.go
++++ b/src/net/http/internal/chunked.go
+@@ -164,6 +164,19 @@ func readChunkLine(b *bufio.Reader) ([]byte, error) {
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
+@@ -171,14 +184,14 @@ func readChunkLine(b *bufio.Reader) ([]byte, error) {
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
+ var semi = []byte(";")
+diff --git a/src/net/http/internal/chunked_test.go b/src/net/http/internal/chunked_test.go
+index af79711..312f173 100644
+--- a/src/net/http/internal/chunked_test.go
++++ b/src/net/http/internal/chunked_test.go
+@@ -280,6 +280,33 @@ func TestChunkReaderByteAtATime(t *testing.T) {
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
+index 0c76f1b..0e8af02 100644
+--- a/src/net/http/serve_test.go
++++ b/src/net/http/serve_test.go
+@@ -6980,3 +6980,52 @@ func testDisableContentLength(t *testing.T, mode testMode) {
+ 		t.Fatal(err)
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
2.25.1


