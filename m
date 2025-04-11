Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1454C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 06:16:38 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.19099.1744352192176489868
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 23:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=WQ7IvakJ;
 spf=pass (domain: mvista.com, ip: 209.85.214.181, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2243803b776so23660265ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 23:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1744352191; x=1744956991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8jlRGN4b46GRHc3yq1jjkw6WMYF6WkyX4TTvzfgG03E=;
        b=WQ7IvakJ6XJ1qBXSvFiawSgiQIBOvySuH+8vcI7nzO25YnCA6seQhHddJ97ABs4b9i
         B6/+0qjeuRGCIJ4VfomVsokIWDcenyZNh9U8SfUSbYt5OdM42qJQ86JQNcLoqzhI4aFR
         RSbtrO3RszQ7g/EkOJcsjnAj2Fe4SHUFMXrZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744352191; x=1744956991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jlRGN4b46GRHc3yq1jjkw6WMYF6WkyX4TTvzfgG03E=;
        b=Ri+U6zJ05LJn+XOT5+UQHAXC67cM0XM5Mc4RXtX8QJ8u9lnp+642myvrL78zLgiwm+
         GdWOzZwH7liwYu1ncoWAZQbzYTU+NZbmoJOZTS1sSbI4KhYyEdagfvgnF4baNGeEuM4D
         vNLAGC3aTh0SFEGoD+2F8v6JqZd/e6HeLBetAJQUJ0G7WlSgENYTTpFwKnO+Hjuetu1W
         87pnDPRrIeFcryiZ1YDIBnkdSJIQdiU34rWf9rKRc1uFEB0Y5ZiwrNcIa0bi6gqBWFUr
         br4PCjeIBrQK2ho+uKwJyYDBhCwf1ha3/kRMQ+BAXXUfany04mIaroa5HU0Eq6Vt3TpO
         5kWg==
X-Gm-Message-State: AOJu0YyDc9xUq4K2VWPLedvLOXZ3cVzMqnbnNey358e0OWiuhhFgaieS
	gDlzwDvrAI2X26O9jdpPpXUCLvxYWJONAfjo5+1QdIfhhBkgDDaKKV8ExumEgcOFlzjH/29uTM6
	1
X-Gm-Gg: ASbGncsVIepjfJqmEICe89p71GndGZxVzpqd198cJmEV/oNSmY95ddfedl4oqSZpZ96
	aOEP6UlYcOJn71S36CSWwzbnoxmYGp7tm1tTceuR0Gn+ZaTtiY93igQzsyPqmdStgJm32Vb7qky
	Nf+sc+bPnd2UTJDKFX476sqRmOIriVUmREcTb7+MhtrLjweCFqccAj00mzU4TDbWmMN8XKFgTST
	UW8s8ipxb2uX2HLpqhOsnFZj9wkOjAElEJBwGOPBQG7DRTzppWvY/P/MV4Jw7QE0sRXoDvWocfe
	sGpDuMGZv3PXkUU9bWK6PVZqzcKmZ901EActrWggbJfqm4Lyyu+DMg==
X-Google-Smtp-Source: AGHT+IHbzXTVhT8yT40WpVf0OT8YFyPZcWq1ltMfhgl25bOackv8I12hgoQv5FYCysb7lGdQz49U2A==
X-Received: by 2002:a17:903:1450:b0:223:6180:1bea with SMTP id d9443c01a7336-22bea4ef0b3mr24303065ad.37.1744352191308;
        Thu, 10 Apr 2025 23:16:31 -0700 (PDT)
Received: from MVIN00016.mvista.com ([27.121.101.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8c6b3sm41384025ad.77.2025.04.10.23.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:16:30 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] go: fix CVE-2025-22871
Date: Fri, 11 Apr 2025 11:46:18 +0530
Message-Id: <20250411061618.118414-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 06:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214713

Upstream-Status: Backport from https://github.com/golang/go/commit/15e01a2e43ecb8c7e15ff7e9d62fe3f10dcac931

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
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
2.25.1


