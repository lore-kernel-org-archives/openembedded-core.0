Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BACC9C25B4E
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:21:46 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.34073.1674440500693529933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=50PmknYp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id z3so7769689pfb.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=in9FhvZrn0ao8P05GDrl9B4qa4aLSFF2mRx7Eii8MK4=;
        b=50PmknYpEUqoecgP4/g50WfmbiijLPYPLjS6sQ7Tl7sWs75IdRk2AU+4PJvqeO27Bq
         oSJv2EINSDl0e038zSQGlBVGNq8Jqybx+hF7E4XyIjrRdlAXcoZoQXoRnQYKp5NV9POm
         15Rdq9pH9mBl5UbOGymJ2+NYlktuPYGt1UVIqgnwuPfJoTYUBqAE9tESgkfl8LC8NKRo
         padAX2y/QtAZa+Se9Y9uyjtvCfXCNjJjYKiqHTyXC3nKj2TIZI59uDBTG1zFLf3D1JcZ
         BIM6t/Nr7SfCbH28KO2145WJweEQhtHqpQpqbidNBT8zgR+JzCQ7zpiTLNK28Kr5myl4
         qr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=in9FhvZrn0ao8P05GDrl9B4qa4aLSFF2mRx7Eii8MK4=;
        b=cjMTmyVy7cGDsCP76gFaztUS/LDJp0lLuoBXFKIR8YQ2VmiWgJkum751bO98x7SG9H
         bo4LuEufoPwQ4lWNI5nlbOH5B0rw+tHzglDNLK7LNXnPxijAz5J/fMncehhd+1Qu+X98
         fxooo4wis+WVqFi30RZ3yNDoje9J6qCu29N/2pgA25VhIa2ESOJ3mLQBx3+bBK45lpjL
         FuV+sOjOLBeFq9yVd/E47WivbKfxN4ywdFE3gXoxCJvLu9LBLypXhGylEbddFg2V5bsO
         29XNy3U4Q6h+Y8FKD4zc/AsUMBzS9HbtuotPNYBsJmlLJvXLa4Tz9GJC6T4S1qs+2DN9
         qEDw==
X-Gm-Message-State: AFqh2kpak11+xzuU8T/4nUBHIrN9etvkemW3cJs7RGe8AsY6JMweAbRb
	+e2kzxrkjT4FUSZVnt3uAtny8tqyqxrbbfC0TrU=
X-Google-Smtp-Source: AMrXdXtvdVz/65KsF2UgrtBTm5u8LLI+0+Ai8k+me4cTsdTJ193w8j83S6UAd+WEqAfsbdEGXAE7zw==
X-Received: by 2002:a05:6a00:10:b0:576:a74a:13c3 with SMTP id h16-20020a056a00001000b00576a74a13c3mr25777516pfk.1.1674440499586;
        Sun, 22 Jan 2023 18:21:39 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/32] go: fix CVE-2022-41717 Excessive memory use in got server
Date: Sun, 22 Jan 2023 16:20:55 -1000
Message-Id: <f4d179aab7c8f55669ac652a0668644859ec2eb7.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1674440376.git.steve@sakoman.com>
References: <cover.1674440376.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176265

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/golang/go/commit/618120c165669c00a1606505defea6ca755cdc27

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2022-41717.patch           | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index a1942e9f15..99662bd298 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://CVE-2022-27664.patch \
     file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
     file://CVE-2022-41715.patch \
+    file://CVE-2022-41717.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
new file mode 100644
index 0000000000..e2ab92ed00
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
@@ -0,0 +1,89 @@
+From 618120c165669c00a1606505defea6ca755cdc27 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Wed, 30 Nov 2022 16:46:33 -0500
+Subject: [PATCH] [release-branch.go1.19] net/http: update bundled
+ golang.org/x/net/http2
+
+Disable cmd/internal/moddeps test, since this update includes PRIVATE
+track fixes.
+
+For #56350.
+For #57009.
+Fixes CVE-2022-41717.
+
+Change-Id: I5c6ce546add81f361dcf0d5123fa4eaaf8f0a03b
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1663835
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-by: Julie Qiu <julieqiu@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/455363
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Run-TryBot: Jenny Rakoczy <jenny@golang.org>
+Reviewed-by: Michael Pratt <mpratt@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/618120c165669c00a1606505defea6ca755cdc27]
+CVE: CVE-2022-41717
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/cmd/internal/moddeps/moddeps_test.go |  1 +
+ src/net/http/h2_bundle.go                | 18 +++++++++++-------
+ 2 files changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index 3306e29..d48d43f 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -34,6 +34,7 @@ import (
+ // See issues 36852, 41409, and 43687.
+ // (Also see golang.org/issue/27348.)
+ func TestAllDependencies(t *testing.T) {
++	t.Skip("TODO(#57009): 1.19.4 contains unreleased changes from vendored modules")
+ 	t.Skip("TODO(#53977): 1.18.5 contains unreleased changes from vendored modules")
+ 
+ 	goBin := testenv.GoToolPath(t)
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 6e2ef30..9d6abd8 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -4189,6 +4189,7 @@ type http2serverConn struct {
+ 	headerTableSize             uint32
+ 	peerMaxHeaderListSize       uint32            // zero means unknown (default)
+ 	canonHeader                 map[string]string // http2-lower-case -> Go-Canonical-Case
++	canonHeaderKeysSize         int               // canonHeader keys size in bytes
+ 	writingFrame                bool              // started writing a frame (on serve goroutine or separate)
+ 	writingFrameAsync           bool              // started a frame on its own goroutine but haven't heard back on wroteFrameCh
+ 	needsFrameFlush             bool              // last frame write wasn't a flush
+@@ -4368,6 +4369,13 @@ func (sc *http2serverConn) condlogf(err error, format string, args ...interface{
+ 	}
+ }
+ 
++// maxCachedCanonicalHeadersKeysSize is an arbitrarily-chosen limit on the size
++// of the entries in the canonHeader cache.
++// This should be larger than the size of unique, uncommon header keys likely to
++// be sent by the peer, while not so high as to permit unreasonable memory usage
++// if the peer sends an unbounded number of unique header keys.
++const http2maxCachedCanonicalHeadersKeysSize = 2048
++
+ func (sc *http2serverConn) canonicalHeader(v string) string {
+ 	sc.serveG.check()
+ 	http2buildCommonHeaderMapsOnce()
+@@ -4383,14 +4391,10 @@ func (sc *http2serverConn) canonicalHeader(v string) string {
+ 		sc.canonHeader = make(map[string]string)
+ 	}
+ 	cv = CanonicalHeaderKey(v)
+-	// maxCachedCanonicalHeaders is an arbitrarily-chosen limit on the number of
+-	// entries in the canonHeader cache. This should be larger than the number
+-	// of unique, uncommon header keys likely to be sent by the peer, while not
+-	// so high as to permit unreaasonable memory usage if the peer sends an unbounded
+-	// number of unique header keys.
+-	const maxCachedCanonicalHeaders = 32
+-	if len(sc.canonHeader) < maxCachedCanonicalHeaders {
++	size := 100 + len(v)*2 // 100 bytes of map overhead + key + value
++	if sc.canonHeaderKeysSize+size <= http2maxCachedCanonicalHeadersKeysSize {
+ 		sc.canonHeader[v] = cv
++		sc.canonHeaderKeysSize += size
+ 	}
+ 	return cv
+ }
+-- 
+2.25.1
+
-- 
2.25.1


