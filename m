Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2460BC04FFE
	for <webhook@archiver.kernel.org>; Mon, 29 Apr 2024 12:53:48 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.20195.1714395218752007733
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Apr 2024 05:53:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AVoeFVHm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e2bbc2048eso37798775ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1714395218; x=1715000018; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U60RuxoqOsycM+NlyRKPYrYheyc9TAKrAd5GbTIcAZY=;
        b=AVoeFVHmZCPsYDoG7kzVCGwuyLWSzrjhgtgp1q/JPxUZr97Hyb4vOqJaDw3E4LK2do
         gvDi+XIi+rsvR0BFvPwYqN2oHrPDJcBfQc48NbQ6q6z8ZLhTt+8yeWZUQB9OnqB/y8S7
         CsAH/vlng3soibbtPlBRzSjgc05TiUT9+6ZXls8ZFN9IgKjtNp9VOwHfYKLhBcAvMPe7
         5JDDTLIYP/MDr3P/PKB8U0VRblmoZIsTaZzqhu7p1cPveWzdxB29YB/d3+nCxpYlAbCx
         hbmp69APzwVKVWDcGWkLTH6vlKN5gFycNeXiQWJbJCTP0VVjzSrDUEIfX5JMcbgX7D4T
         VK5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395218; x=1715000018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U60RuxoqOsycM+NlyRKPYrYheyc9TAKrAd5GbTIcAZY=;
        b=Yn0P4ZIwJBC5J5fJZg/Sk27R72J5/6tjKjcaC5kYNE3xCZ2BJhP3j3B9C9MW1O/Dbv
         5xDV8Z0Qut2q4tpX7BA3xDuDMwlqvoMz7JJ/KtTHZJNFZKGbkcoYPzTRX3n5ZzcZTN8/
         gkje+K1tce0/qWkFbboDIF7H7Lnki5ss+61n17rVaqCtHccgdNSLe6c1ocJTmsqmJk8Z
         ZOX0oGDNPT8gdFhGWrpc0N6mZkPTHQI39jMlnU3OsgbRmtWsoBKlvSfGiTDp84u0SeOm
         wlGbig/4Z4a4aFFx3VvPHFisIiQoKeGaWUAhWI770RG7eJCJjOeKBLmm9/SxGiDqv0pU
         QIdQ==
X-Gm-Message-State: AOJu0Yx6osclRE/4PwIBOh36Xfi2nMyRg3AkxLQ+d1Mo9GVc0iW0zWzf
	ct+qWB8A8GbGKkZ7/xEL9Bh4EGFIIZs/520F1UyTa64RKzAJxmakfGri8j+jMllHDwU7ybpNUMF
	g8WtrTQ==
X-Google-Smtp-Source: AGHT+IESujoXfgiY//5UAMXmFRSObOoZtt9oDyB/rpPVBE50cCslXHZroFUr/Fey+HXiQ5cNbHxNOw==
X-Received: by 2002:a17:902:f611:b0:1eb:3daf:ebaf with SMTP id n17-20020a170902f61100b001eb3dafebafmr9155250plg.57.1714395217933;
        Mon, 29 Apr 2024 05:53:37 -0700 (PDT)
Received: from xps13.. ([209.237.67.158])
        by smtp.gmail.com with ESMTPSA id h8-20020a170902704800b001e868e29fabsm20184399plt.251.2024.04.29.05.53.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:53:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] go: Fix for CVE-2023-45288
Date: Mon, 29 Apr 2024 05:53:23 -0700
Message-Id: <9ad10bf355665ff799cefd40fb0d1938b0104b08.1714394934.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714394934.git.steve@sakoman.com>
References: <cover.1714394934.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Apr 2024 12:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198740

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b391821d4ee9b

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2023-45288.patch           | 95 +++++++++++++++++++
 2 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 768961de2c..95fb572362 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -55,6 +55,7 @@ SRC_URI += "\
     file://CVE-2023-45290.patch \
     file://CVE-2024-24784.patch \
     file://CVE-2024-24785.patch \
+    file://CVE-2023-45288.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch b/meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch
new file mode 100644
index 0000000000..741e7be89a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2023-45288.patch
@@ -0,0 +1,95 @@
+From e55d7cf8435ba4e58d4a5694e63b391821d4ee9b Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Thu, 28 Mar 2024 16:57:51 -0700
+Subject: [PATCH] [release-branch.go1.22] net/http: update bundled
+ golang.org/x/net/http2
+
+Disable cmd/internal/moddeps test, since this update includes PRIVATE
+track fixes.
+
+Fixes CVE-2023-45288
+For #65051
+Fixes #66298
+
+Change-Id: I5bbf774ebe7651e4bb7e55139d3794bd2b8e8fa8
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/2197227
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Run-TryBot: Damien Neil <dneil@google.com>
+Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/576076
+Auto-Submit: Dmitri Shuralyov <dmitshur@google.com>
+TryBot-Bypass: Dmitri Shuralyov <dmitshur@google.com>
+Reviewed-by: Than McIntosh <thanm@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/e55d7cf8435ba4e58d4a5694e63b391821d4ee9b]
+CVE: CVE-2023-45288
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/cmd/internal/moddeps/moddeps_test.go |  1 +
+ src/net/http/h2_bundle.go                | 31 ++++++++++++++++++++++++
+ 2 files changed, 32 insertions(+)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index d48d43f..250bde4 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -34,6 +34,7 @@ import (
+ // See issues 36852, 41409, and 43687.
+ // (Also see golang.org/issue/27348.)
+ func TestAllDependencies(t *testing.T) {
++	t.Skip("TODO(#65051): 1.22.2 contains unreleased changes from vendored modules")
+ 	t.Skip("TODO(#57009): 1.19.4 contains unreleased changes from vendored modules")
+ 	t.Skip("TODO(#53977): 1.18.5 contains unreleased changes from vendored modules")
+ 
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 9d6abd8..10ff193 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -2842,6 +2842,7 @@ func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFr
+ 		if size > remainSize {
+ 			hdec.SetEmitEnabled(false)
+ 			mh.Truncated = true
++			remainSize = 0
+ 			return
+ 		}
+ 		remainSize -= size
+@@ -2854,6 +2855,36 @@ func (fr *http2Framer) readMetaFrame(hf *http2HeadersFrame) (*http2MetaHeadersFr
+ 	var hc http2headersOrContinuation = hf
+ 	for {
+ 		frag := hc.HeaderBlockFragment()
++
++		// Avoid parsing large amounts of headers that we will then discard.
++		// If the sender exceeds the max header list size by too much,
++		// skip parsing the fragment and close the connection.
++		//
++		// "Too much" is either any CONTINUATION frame after we've already
++		// exceeded the max header list size (in which case remainSize is 0),
++		// or a frame whose encoded size is more than twice the remaining
++		// header list bytes we're willing to accept.
++		if int64(len(frag)) > int64(2*remainSize) {
++			if http2VerboseLogs {
++				log.Printf("http2: header list too large")
++			}
++			// It would be nice to send a RST_STREAM before sending the GOAWAY,
++			// but the struture of the server's frame writer makes this difficult.
++			return nil, http2ConnectionError(http2ErrCodeProtocol)
++		}
++
++		// Also close the connection after any CONTINUATION frame following an
++		// invalid header, since we stop tracking the size of the headers after
++		// an invalid one.
++		if invalid != nil {
++			if http2VerboseLogs {
++				log.Printf("http2: invalid header: %v", invalid)
++			}
++			// It would be nice to send a RST_STREAM before sending the GOAWAY,
++			// but the struture of the server's frame writer makes this difficult.
++			return nil, http2ConnectionError(http2ErrCodeProtocol)
++		}
++
+ 		if _, err := hdec.Write(frag); err != nil {
+ 			return nil, http2ConnectionError(http2ErrCodeCompression)
+ 		}
+-- 
+2.25.1
+
-- 
2.34.1


