Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7DAC3DA4A
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 20:34:03 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.36481.1744403638957529038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 13:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=leYKG04D;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-730517040a9so3154551b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744403638; x=1745008438; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xU3UhxeMhVIG1ewtWRmeM7y61hc+mjH9diDgi8orcXo=;
        b=leYKG04DJITrPCDRiEPIC20Ou/E/LrcJgwY7HXYKMMibWxOcQ5HSbNtQFd0fn7x9Kz
         jQ0g6dC+/FkNCg68ByxztIge7wClrFeV0G0CpbyKJK0Z/kT0pHcaQlxn2MUli+9j6xpC
         +xzxu3Xwshb35qiOuUDjTMUcR4KSWdFJ5eIS/wsZPOCkh/IuebDJlwsShG6i8NdiLOFx
         2/jpjRotslqrfxPVkqtfqrnKjPDvjyCERpBntUXFiU7HbyenPkJ/0XRNTcaA86TcS3zz
         q9b5XJ7KlPYd6T6WlFPK0L1VvRuZmmFDk5QqrQh6IJ2j5Nl1yix8otOLlpsAzU4iOLv6
         38Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744403638; x=1745008438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xU3UhxeMhVIG1ewtWRmeM7y61hc+mjH9diDgi8orcXo=;
        b=DsaWL2cl/Kl4WdLHr9NhHb/CeQXe0Qyjgx9o+po4Gsk6za1NYxg9y8JoLlPsN+QsZI
         Y50HXUw4MeMlg1/vyghYy/oN8kG7cYU2zGM7LGK15evP3kAxY+nl5gUbtsZv4GrJ74yl
         qvITsW14Xgn5baBEC3nTww7zbJocAmQn8T/ZL0RuC/xLMaABqAvjn+WPuvDtWYtvZbDN
         ddcc7/b7E/5Dh5zc5IufOu/tdIHyGv+7S+Ou5CmcJ657N5FgmzqhRvhovH47HGTeP8kg
         hXavOaxfot/yQAAKtNv0OitKPdMZnrwQp/8zLcviObliwhph18uZXociszZgaONiNWFS
         dnPw==
X-Gm-Message-State: AOJu0Yw6AYg8nKUCDY1AH0RQuHkbZHqFlNH9ieX19ZfH2+tITByXbAuR
	VemcoUHaLbCJZ2Ztb4ikO6cfE6WL3F5nB3nmWCY4wd5EgN5i0je4/loeqDBRs/SEZNr6z/HiRWS
	4
X-Gm-Gg: ASbGncuoIBUxsXami3G12HChSAY+1dUmQHnA8gc/skFVp+hTN3UEahsACegpkytl/RX
	0Ygr61OoNojy702fBcEqguOku/wY9+2zK/sPiVvcB632s8FrOSQmkJ057aSAGQxdG0VelZKYecl
	wgDzcbfWOlo+jlL/o2scLOgL4lrZAuBA/ra5r7XqQ/gdiWuiNlUmXLH6ciN6joZ5Rg7Aw0mdAUb
	wuEsI2ozYC259vP55QuChS2VpbClAM/y/voAg0akhjug1oKZiRelKOuiKI1U2Mr9MngTHDS4dqo
	Rgnu2zGmu5omk2+FpqXLU6/dlWpy3QRa
X-Google-Smtp-Source: AGHT+IE/hGKf+aPxqb8enZZr62kgwbqOsquq/T5Ep/iPpNn3RMwLvZlBbp7F5O4/shUXuTGWVWmkSA==
X-Received: by 2002:a05:6a21:32a3:b0:1f5:9208:3ac7 with SMTP id adf61e73a8af0-20179995dcbmr7676868637.41.1744403638086;
        Fri, 11 Apr 2025 13:33:58 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c93f:3642:a7d6:27ed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230d697sm2067498b3a.123.2025.04.11.13.33.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 13:33:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 6/8] go: fix CVE-2025-22871
Date: Fri, 11 Apr 2025 13:33:32 -0700
Message-ID: <b343da566856ad17b5dc03d42d9241bcb44cad1b.1744403103.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744403103.git.steve@sakoman.com>
References: <cover.1744403103.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 20:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214759

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/15e01a2e43ecb8c7e15ff7e9d62fe3f10dcac931

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.43.0


