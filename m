Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E5E6C48BEC
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 21:43:47 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.26110.1707860624175489214
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 13:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=13SpVHcT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e08dd0c7eeso995499b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 13:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1707860623; x=1708465423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YW+eITsfCeD/Giu+ZojRZdfndphKc+gx3nmZ5CAPBhg=;
        b=13SpVHcTDxr3tdZaO9eXJCtTecgIG5a+QVRCb9Uf8kR6dQofIrK2IjBQFhZ73kNCBf
         DOUG3uJJYyJPVcHvraBTBx6GV3JjD+TV6TGcgOosBO2JAZS+tJo8Yg6AOj9WtjXdR1pi
         SO4+s1BZwkFwXRXuxhboVhMMtOxNnpaQcs71ejSHFZB1Le0Dfm18kRdEfAXy3MgO7AQH
         uWQ/GVZ0lq3l0eeMqTLy6GrH2HLw2lexe3+YewnI9kNULE8rrslaYYaBHcwLhw/tZ+MF
         1u79CrbH8e1CU1rRD56tORYFoI/ayZ24wo/vQqbEybT8UJCS1EndxGgvGxVkyKcM6FGv
         TpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707860623; x=1708465423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YW+eITsfCeD/Giu+ZojRZdfndphKc+gx3nmZ5CAPBhg=;
        b=QTv514Uyl1fVIrLi2LRIVcOwMpduf1uSbsvEPH/X/YzdYxrNNRV6UsxUtR+4R0hk2a
         LXggZtDNTNOj/UKOKvIlxNdQAnhbtU8FCQbx8sCeHmLxpBUeext9Mu1j+qKKzv9wumA2
         Ea8LNQMmzwGhZ2KP3YYU9+sfFnnrOt6XNI3JtxV9ftjesO3IGyS4DrAthXQ0ILIQSUuK
         +NW2zKt5fhx8yKQbyfyPCLp04sF8+HQ5op/X15aCjL9dkXpoKYMfXoCLHyglVNDH36bv
         oTSBN1HBrMMlA22uysz4iJpTeAmV19q5YPgQAjQq+mMCGWFLmNhIjPOHWjzNIk3xjofU
         kXxg==
X-Gm-Message-State: AOJu0Yy2nl6k67685HXfpo02OFRWXgpGaFVgDHXPLVb8YHFnRr5wvwZN
	hu59nkdCw5MZqxo+BsdTnBWLBoVjxQVhJlBA4uAvVaL2ukL8xnaG29GLbD4lgx0mKARGHXWHkFX
	X
X-Google-Smtp-Source: AGHT+IFND0nofKE16t55aEIlrmrLRuhya9yXpROXip0l2cLEepFRf405ZcqG3mUhW+jY9wtt2WIxgw==
X-Received: by 2002:a05:6a00:d48:b0:6e0:326f:30b1 with SMTP id n8-20020a056a000d4800b006e0326f30b1mr417934pfv.27.1707860623444;
        Tue, 13 Feb 2024 13:43:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id x37-20020a056a0018a500b006e04efcfbc2sm7767327pfh.74.2024.02.13.13.43.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 13:43:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] go: add a complementary fix for CVE-2023-29406
Date: Tue, 13 Feb 2024 11:43:24 -1000
Message-Id: <bff621d5399e5ff2930d21f403bb2f274febd2e4.1707860435.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707860435.git.steve@sakoman.com>
References: <cover.1707860435.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 21:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195433

From: Ming Liu <liu.ming50@gmail.com>

The original CVE-2023-29406.patch is not complete, causing docker
failures at runtime, backport a complementary fix from golang upstream.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |   3 +-
 ...023-29406.patch => CVE-2023-29406-1.patch} |   0
 .../go/go-1.14/CVE-2023-29406-2.patch         | 114 ++++++++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/go/go-1.14/{CVE-2023-29406.patch => CVE-2023-29406-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 42a9ac8435..4fbf9d7590 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -71,7 +71,8 @@ SRC_URI += "\
     file://CVE-2023-29402.patch \
     file://CVE-2023-29404.patch \
     file://CVE-2023-29400.patch \
-    file://CVE-2023-29406.patch \
+    file://CVE-2023-29406-1.patch \
+    file://CVE-2023-29406-2.patch \
     file://CVE-2023-29409.patch \
     file://CVE-2022-41725-pre1.patch \
     file://CVE-2022-41725-pre2.patch \
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-1.patch
similarity index 100%
rename from meta/recipes-devtools/go/go-1.14/CVE-2023-29406.patch
rename to meta/recipes-devtools/go/go-1.14/CVE-2023-29406-1.patch
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch
new file mode 100644
index 0000000000..637f46a537
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2023-29406-2.patch
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


