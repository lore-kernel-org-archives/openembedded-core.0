Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F145AC54E4A
	for <webhook@archiver.kernel.org>; Sun, 25 Feb 2024 21:52:53 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.7499.1708897973520241682
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Feb 2024 13:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=N5ZDXKXm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.42, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e432514155so1171406a34.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1708897972; x=1709502772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jPcOC5X2KCBE2MFFCRrx0BMRYGFiHTQOdT4jPHAY2gU=;
        b=N5ZDXKXmG7FEUBkhyUyNeF8b4a23zyqpNkoBl31jcYvbMu+hYjP2QUqfU9MBNmbtDk
         ZSA8V+GtA9h/eW4ZAAHhZOZixVPVdAggUJS4vg5D3SJwk2wwH+oIHxYmrIyUOYnuU4FM
         3YKl3s5OH7UlEpkWwdOn8cx09plZJpS6pMiFR6b8ENuunEX+GguViVnVcdBcRh+HdliH
         IHwVmszzpNalX00aErvH1WjnSUj8qHF+nc18zmA8PFffAxlRE4cCQ8tyqcBlqCEbUx6r
         er5RF7XsLJiBLaHEBOqcl+Gg/xZF4hy3yGkBrwg7XyLohdCK5FOVtMwQZ4LdHGDLQkUM
         LrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708897972; x=1709502772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jPcOC5X2KCBE2MFFCRrx0BMRYGFiHTQOdT4jPHAY2gU=;
        b=iJ+/MV+6md507ef+BMQBpaGqv+xLhMedUwovqUTm3x0YfL4uCLBpBXPfhdoPTzKh+y
         0UHSKxWrvPkwp5Vb/8vzBp5MDBv2lxVDkAAlwNKl23DgocOCDZ4ZzcZ/84/RzOYBkWbP
         ooEINfp/Yplh352vc6fENI2ojm3pDt6I/bw5EHaG65pNcZdew/EPj8o/B+MhoITiK1Qf
         kHNRWDob5n9CP8q6dwK6d1pTvxg6pgpN5wbCpruMO1sN9cJdTucYLhFGYNDSkafeKx2u
         Cvam4FfvU/dCtisoYyQTA8c1leV91X6C7WZtRBD9QOIMEMqzKO3xAd0pcmXAwzV9Kvp9
         LOKw==
X-Gm-Message-State: AOJu0YxlwwzvHzmtOc2Vr/ydnkiTOHH7ro4+y3ZSdoSkgUGbVrGbDpq/
	lw+qbnazscW2RI+E1OtQ9YI1XMl+z6Ov/AT6JG13WsgjjecYCvRj77/ibt9fcPRIxdLObQtf/dE
	CPS+16A==
X-Google-Smtp-Source: AGHT+IH4nAWky0CQLUMxgRqpnrcOU6NxBDftvmwsC8lQX5eAXG6GumD+6/gjCwDOnjwxXPx22eahvQ==
X-Received: by 2002:a05:6358:2495:b0:17b:88c2:5c13 with SMTP id m21-20020a056358249500b0017b88c25c13mr6696693rwc.7.1708897972417;
        Sun, 25 Feb 2024 13:52:52 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a12-20020a17090acb8c00b0029a4089fbf0sm3082947pju.16.2024.02.25.13.52.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 13:52:51 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/22] go: add a complementary fix for CVE-2023-29406
Date: Sun, 25 Feb 2024 11:52:20 -1000
Message-Id: <973901530c98bc3f1b10d8bb89d55decf6848713.1708897822.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708897822.git.steve@sakoman.com>
References: <cover.1708897822.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Feb 2024 21:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196153

From: Ming Liu <liu.ming50@gmail.com>

The original CVE-2023-29406.patch is not complete, causing docker
failures at runtime, backport a complementary fix from golang upstream.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +-
 ...023-29406.patch => CVE-2023-29406-1.patch} |   0
 .../go/go-1.18/CVE-2023-29406-2.patch         | 114 ++++++++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/go/go-1.18/{CVE-2023-29406.patch => CVE-2023-29406-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-29406-2.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 6fc07bb910..c02da60f68 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -38,7 +38,8 @@ SRC_URI += "\
     file://CVE-2023-29405.patch \
     file://CVE-2023-29402.patch \
     file://CVE-2023-29400.patch \
-    file://CVE-2023-29406.patch \
+    file://CVE-2023-29406-1.patch \
+    file://CVE-2023-29406-2.patch \
     file://CVE-2023-24536_1.patch \
     file://CVE-2023-24536_2.patch \
     file://CVE-2023-24536_3.patch \
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406-1.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.18/CVE-2023-29406.patch
rename to meta/recipes-devtools/go/go-1.18/CVE-2023-29406-1.patch
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-29406-2.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406-2.patch
new file mode 100644
index 0000000000..637f46a537
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-29406-2.patch
@@ -0,0 +1,114 @@
+From c08a5fa413a34111c9a37fd9e545de27ab0978b1 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 19 Jul 2023 10:30:46 -0700
+Subject: [PATCH] [release-branch.go1.19] net/http: permit requests with
+ invalid Host headers
+
+Historically, the Transport has silently truncated invalid
+Host headers at the first '/' or ' ' character. CL 506996 changed
+this behavior to reject invalid Host headers entirely.
+Unfortunately, Docker appears to rely on the previous behavior.
+
+When sending a HTTP/1 request with an invalid Host, send an empty
+Host header. This is safer than truncation: If you care about the
+Host, then you should get the one you set; if you don't care,
+then an empty Host should be fine.
+
+Continue to fully validate Host headers sent to a proxy,
+since proxies generally can't productively forward requests
+without a Host.
+
+For #60374
+Fixes #61431
+Fixes #61825
+
+Change-Id: If170c7dd860aa20eb58fe32990fc93af832742b6
+Reviewed-on: https://go-review.googlesource.com/c/go/+/511155
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Run-TryBot: Damien Neil <dneil@google.com>
+(cherry picked from commit b9153f6ef338baee5fe02a867c8fbc83a8b29dd1)
+Reviewed-on: https://go-review.googlesource.com/c/go/+/518855
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+Run-TryBot: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Russ Cox <rsc@golang.org>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/c08a5fa413a34111c9a37fd9e545de27ab0978b1]
+CVE: CVE-2023-29406
+Signed-off-by: Ming Liu <liu.ming50@gmail.com>
+---
+ src/net/http/request.go      | 23 ++++++++++++++++++++++-
+ src/net/http/request_test.go | 17 ++++++++++++-----
+ 2 files changed, 34 insertions(+), 6 deletions(-)
+
+diff --git a/src/net/http/request.go b/src/net/http/request.go
+index 3100037386..91cb8a66b9 100644
+--- a/src/net/http/request.go
++++ b/src/net/http/request.go
+@@ -582,8 +582,29 @@ func (r *Request) write(w io.Writer, usingProxy bool, extraHeaders Header, waitF
+ 	if err != nil {
+ 		return err
+ 	}
++	// Validate that the Host header is a valid header in general,
++	// but don't validate the host itself. This is sufficient to avoid
++	// header or request smuggling via the Host field.
++	// The server can (and will, if it's a net/http server) reject
++	// the request if it doesn't consider the host valid.
+ 	if !httpguts.ValidHostHeader(host) {
+-		return errors.New("http: invalid Host header")
++		// Historically, we would truncate the Host header after '/' or ' '.
++		// Some users have relied on this truncation to convert a network
++		// address such as Unix domain socket path into a valid, ignored
++		// Host header (see https://go.dev/issue/61431).
++		//
++		// We don't preserve the truncation, because sending an altered
++		// header field opens a smuggling vector. Instead, zero out the
++		// Host header entirely if it isn't valid. (An empty Host is valid;
++		// see RFC 9112 Section 3.2.)
++		//
++		// Return an error if we're sending to a proxy, since the proxy
++		// probably can't do anything useful with an empty Host header.
++		if !usingProxy {
++			host = ""
++		} else {
++			return errors.New("http: invalid Host header")
++		}
+ 	}
+ 
+ 	// According to RFC 6874, an HTTP client, proxy, or other
+diff --git a/src/net/http/request_test.go b/src/net/http/request_test.go
+index fddc85d6a9..dd1e2dc2a1 100644
+--- a/src/net/http/request_test.go
++++ b/src/net/http/request_test.go
+@@ -770,16 +770,23 @@ func TestRequestWriteBufferedWriter(t *testing.T) {
+ 	}
+ }
+ 
+-func TestRequestBadHost(t *testing.T) {
++func TestRequestBadHostHeader(t *testing.T) {
+ 	got := []string{}
+ 	req, err := NewRequest("GET", "http://foo/after", nil)
+ 	if err != nil {
+ 		t.Fatal(err)
+ 	}
+-	req.Host = "foo.com with spaces"
+-	req.URL.Host = "foo.com with spaces"
+-	if err := req.Write(logWrites{t, &got}); err == nil {
+-		t.Errorf("Writing request with invalid Host: succeded, want error")
++	req.Host = "foo.com\nnewline"
++	req.URL.Host = "foo.com\nnewline"
++	req.Write(logWrites{t, &got})
++	want := []string{
++		"GET /after HTTP/1.1\r\n",
++		"Host: \r\n",
++		"User-Agent: " + DefaultUserAgent + "\r\n",
++		"\r\n",
++	}
++	if !reflect.DeepEqual(got, want) {
++		t.Errorf("Writes = %q\n  Want = %q", got, want)
+ 	}
+ }
+ 
+-- 
+2.34.1
+
-- 
2.34.1


