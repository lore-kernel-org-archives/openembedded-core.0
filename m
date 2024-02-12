Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE730C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 12:23:18 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.5249.1707740597434061559
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 04:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZaUbmVJy;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-50eac018059so3936145e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 04:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707740595; x=1708345395; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfoSqXeElMihgMxECsheygVZBAAGyqWNAPWG6tKU7ys=;
        b=ZaUbmVJy2OJPr6L8EHZPOW6Jur/dQM3sHgXLaLyHqy80/NdNnlkm6f0QS19MxG9nZK
         g5g9z54ejb01V9LO0TD4eG2kwBu2io8ZkB6LhNtIUUlK8iDZcub/tHzW+tqY+ILd+RZl
         9vJCkrKMx1Z+POzMVAJmyJRegoBjeov62kVBXuUTVvv/mMU91YlwPhe34Zc00ElUgOFz
         LYwnxASJuAySFBnc7V6Uo8hj/WTefPXgNj3xmTsZZ1KG/p5+5F//0Mf2VieLktEJMBiL
         ic1MwZS2vXT9rCq9yS0OhPBxZTfM13tnorvsld2LJ3E9Ihxr71tSptfEyFpvsNBubfSG
         eQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707740595; x=1708345395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfoSqXeElMihgMxECsheygVZBAAGyqWNAPWG6tKU7ys=;
        b=bpzyr/0FcaeeiXh+iHVlf74lE6xPHvMyThYLE10XMWyTOaYP/N+SJy29i+FiVPYh7k
         1apUSuwzU4Xfm5AZbu4WirVFeF/30dey4XUwV7q8cFaJwNIBAXGpLCaRYo6Aq7GBiXzB
         H8b9A/rp8OgOLU4TraWuK3sYucwHVqyn3eSJ5+to/ISgHbI3COXCcSOFRzaM/0ZSOhPs
         R1rxypt9ppzJcIGcCtSQzQ212G2LpJZhhMy77ZrGuRekszjimJRLxIlUvsUAeaQ2k0j9
         WuDR+cUZsy8RWxgJGSdBs0VMuV5YdORirDVF/MTS/LlV2qChL23V9mw4AaV4LUEqAEJG
         fBXQ==
X-Gm-Message-State: AOJu0YxHCQHwJqPVMJPfJmoQXJhbs1Awah76ODQmGZL71FGRn27ZNdrA
	GWMa8Il26YxIKiEs/uFsQMQa+NQJBiSo0oxe5pwegCL6BkqfAmP9ZRSNVTK7
X-Google-Smtp-Source: AGHT+IFS2i9NDpTRkyOvstRTJpJ9h9wS9KbD6bX9U6WxtqhsIVbAN8jGTLb3MTzPnHadRXbrrjSZLg==
X-Received: by 2002:a05:6512:4848:b0:511:5b3b:e84a with SMTP id ep8-20020a056512484800b005115b3be84amr3794861lfb.20.1707740594640;
        Mon, 12 Feb 2024 04:23:14 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id fb3-20020a056512124300b005118691ad98sm655716lfb.160.2024.02.12.04.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 04:23:13 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [kirkstone] [PATCH] go: add a complementary fix for CVE-2023-29406
Date: Mon, 12 Feb 2024 13:23:10 +0100
Message-Id: <20240212122310.760740-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 12:23:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195315

From: Ming Liu <liu.ming50@gmail.com>

The original CVE-2023-29406.patch is not complete, causing docker
failures at runtime, backport a complementary fix from golang upstream.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   3 +-
 ...023-29406.patch => CVE-2023-29406-1.patch} |   0
 .../go/go-1.18/CVE-2023-29406-2.patch         | 114 ++++++++++++++++++
 3 files changed, 116 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/go/go-1.18/{CVE-2023-29406.patch => CVE-2023-29406-1.patch} (100%)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-29406-2.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 95c4461d3e..d0c3c78bdf 100644
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


