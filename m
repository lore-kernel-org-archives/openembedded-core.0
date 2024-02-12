Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE82BC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 12:15:28 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.5134.1707740120589182664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 04:15:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jo/fGVF+;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: liu.ming50@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5116588189aso5468813e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 04:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707740118; x=1708344918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uPq3kt5PcdqdLYaf6QcvqV4wq/Z9tYs4ZXYZsuCUPJY=;
        b=jo/fGVF+fJx9TIMX4112mOhRTYbV2AGrOckz65X8aZVWRgsXUtvO6FT+bjFdbv4q04
         ZjKCltbDtOUbI/hXxILeHntqT3b1xN5cqYyeEm8hNomiITS0GuLGKa5U4x0sj2LMDIdI
         utmXsTYXaB8IFz5z5l8FGl6sFUSFM8vC22iONsju/lKGHcHQDlpNNoVcCiVhtUH1JlZ3
         TkJr7d9hI/cBCIiPwrWDOkNDK3HCfBzdKPLjrW9nGdbYGhfGhO08yVro/uagVvpNVlQH
         iqdIyKEmGiTYgQBX7pTbkWLBQ2MHXsWeTs/5LcS97ACnyAMKul5Ot5daFHMsLduE8nr1
         51yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707740118; x=1708344918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPq3kt5PcdqdLYaf6QcvqV4wq/Z9tYs4ZXYZsuCUPJY=;
        b=buqW5SZV1Tg5jxcbTnuQQuxRkiEa4Nap3bwbqdTQWQ/pun0mvMyw1oecp6svLe0rMS
         Xe/7Oyiak1vlTHucd+9ftEfhrwtHlzZ1DCa9RKA+6lRKAyNFt/oCYF3HEMa/C4Ny/adW
         vQKDUxkv//IgIRi/4mHncJ1m5SeHMbjvQT6I9ZZNhWnKxuwclhnQ7XWtglba0mhbHtlm
         /XEedlbZOE5btwNt7Xdhs3wa1ObgYhUcVxIwLxIsU2+rE9r0lbIvsp5dLuP+R1JiE5iB
         Hfm2/saLDS7zQMGbej3zEevlezlOYU6CjfTu0chbEXzfpx8VzbWZg8J/dgP19qnmrlLm
         jgpA==
X-Gm-Message-State: AOJu0YyPzrmApaftfCGHJw9ZDT4lp7fByQ2rPBgU3CKSJdOQQhSeccaE
	Ts4mZ5wa9siVoppWKXgmKCGg0Wlc2VNAWpjKnxrKIgQ0lIhX7F8HqYCHnQsP
X-Google-Smtp-Source: AGHT+IEH+aNwYv/7kTvQNb2XZi+pPI+43RDij807vkVvkAlfvStdorQ0CCVngH32/yll7n92qCzRlg==
X-Received: by 2002:a05:6512:7a:b0:511:7a74:16af with SMTP id i26-20020a056512007a00b005117a7416afmr4252252lfo.15.1707740117736;
        Mon, 12 Feb 2024 04:15:17 -0800 (PST)
Received: from peterliu-Precision-7530.. (customer-212-100-112-191.stosn.net. [212.100.112.191])
        by smtp.gmail.com with ESMTPSA id z1-20020ac24181000000b00511898b5e4csm544350lfh.221.2024.02.12.04.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 04:15:17 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [OE-core] [dunfell] [PATCH] go: add a complementary fix for CVE-2023-29406
Date: Mon, 12 Feb 2024 13:15:11 +0100
Message-Id: <20240212121511.721914-1-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 12:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195313

From: Ming Liu <liu.ming50@gmail.com>

The original CVE-2023-29406.patch is not complete, causing docker
failures at runtime, backport a complementary fix from golang upstream.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
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


