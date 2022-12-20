Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778F1C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 13:38:53 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.50334.1671543532806685581
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 05:38:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YpuAnK01;
 spf=pass (domain: mvista.com, ip: 209.85.210.181, mailfrom: vkumbhar@mvista.com)
Received: by mail-pf1-f181.google.com with SMTP id g1so8530639pfk.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 05:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc2+J5FYbK7QdS8p9J80KTtrWOvxTqi+xt7Z3lnA4xc=;
        b=YpuAnK01yn4BcZasGlf851Sfr9t0qiTnTS38O1+t3yNrdfNy2XCn8AGK1EIva1Nz0B
         R2a7/bkqHWogftRcZKctaRwwJwlYZA/AUYby5vAYNPt1KaCeYCdb0zs9kkDMf1AUSMk+
         iJstWdyTrwBauygemUmrtgYXUkHXX9pL27NFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zc2+J5FYbK7QdS8p9J80KTtrWOvxTqi+xt7Z3lnA4xc=;
        b=T2rRH/sTvApaS16+unnTd8ndKiPQ4wd4fUxmRM4XOcrCzaRUhbc7cNfldagiDaVqAp
         oz8pvmPNdzNGDP2O3l5vtT2toLGrMT+vB5Z9OEY57h6rMdZAlbzcCDvywwVP4PMs8NG9
         0pPxZA9EcZa5wWJJpj+YdjtuUr+bmbmUz2tuWHZOBcvTXrvW++S471kn8BHCgFNo7RMd
         tHWaM57lzZrmMEwDfdU4NXcbmDyuQv5SXku/SPuGuC0hDHxL+ag8y+j65Pn72s76kNE/
         +4+mtY5Uq3ENyAEF/2n3yr552f0CwqYbsRGnvmR0Rr9QP/VzbJqTQKS6FcvUjR9DooqO
         rRZw==
X-Gm-Message-State: ANoB5pmzX+ZZ/gvXyrDp6DXGI8qspn0/3IeaMs3IzGIRbvZLIOqsYtr6
	ljncQ7eRkjPqdphcwftvtGwzLgCZiPzoNUzt
X-Google-Smtp-Source: AA0mqf7SsmG+y/ivrCPnbhQDwIWTBZQSJIKhwIRHj7vGXEFPQqKJKVMI8cmYm+IxtRYTuwEm8YhUcQ==
X-Received: by 2002:a05:6a00:2787:b0:578:8864:7b24 with SMTP id bd7-20020a056a00278700b0057888647b24mr35405044pfb.12.1671543531496;
        Tue, 20 Dec 2022 05:38:51 -0800 (PST)
Received: from localhost.localdomain ([116.74.236.255])
        by smtp.gmail.com with ESMTPSA id b27-20020aa78edb000000b005772bf1b61bsm8661098pfr.67.2022.12.20.05.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 05:38:50 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
X-Google-Original-From: Vivek Kumbhar <vkumbhar@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] go: fix CVE-2022-41717 Excessive memory use in got server
Date: Tue, 20 Dec 2022 19:08:44 +0530
Message-Id: <20221220133844.1440394-1-vkumbhar@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 13:38:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174851

From: Vivek Kumbhar <vkumbhar@mvista.com>

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  1 +
 .../go/go-1.14/CVE-2022-41717.patch           | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index cec37c1b09..134a590944 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -49,6 +49,7 @@ SRC_URI += "\
     file://CVE-2022-24921.patch \
     file://CVE-2022-28131.patch \
     file://CVE-2022-28327.patch \
+    file://CVE-2022-41717.patch \
 "
 
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
diff --git a/meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch b/meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch
new file mode 100644
index 0000000000..8bf22ee4d4
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/CVE-2022-41717.patch
@@ -0,0 +1,75 @@
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
+CVE-2022-41717
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/net/http/h2_bundle.go | 18 +++++++++++-------
+ 1 file changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index 83f2a72..cc03a62 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -4096,6 +4096,7 @@ type http2serverConn struct {
+	headerTableSize             uint32
+	peerMaxHeaderListSize       uint32            // zero means unknown (default)
+	canonHeader                 map[string]string // http2-lower-case -> Go-Canonical-Case
++	canonHeaderKeysSize         int               // canonHeader keys size in bytes
+	writingFrame                bool              // started writing a frame (on serve goroutine or separate)
+	writingFrameAsync           bool              // started a frame on its own goroutine but haven't heard back on wroteFrameCh
+	needsFrameFlush             bool              // last frame write wasn't a flush
+@@ -4278,6 +4279,13 @@ func (sc *http2serverConn) condlogf(err error, format string, args ...interface{
+	}
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
+	sc.serveG.check()
+	http2buildCommonHeaderMapsOnce()
+@@ -4293,14 +4301,10 @@ func (sc *http2serverConn) canonicalHeader(v string) string {
+		sc.canonHeader = make(map[string]string)
+	}
+	cv = CanonicalHeaderKey(v)
+-	// maxCachedCanonicalHeaders is an arbitrarily-chosen limit on the number of
+-	// entries in the canonHeader cache. This should be larger than the number
+-	// of unique, uncommon header keys likely to be sent by the peer, while not
+-	// so high as to permit unreaasonable memory usage if the peer sends an unbounded
+-	// number of unique header keys.
+-	const maxCachedCanonicalHeaders = 32
+-	if len(sc.canonHeader) < maxCachedCanonicalHeaders {
++	size := 100 + len(v)*2 // 100 bytes of map overhead + key + value
++	if sc.canonHeaderKeysSize+size <= http2maxCachedCanonicalHeadersKeysSize {
+		sc.canonHeader[v] = cv
++		sc.canonHeaderKeysSize += size
+	}
+	return cv
+ }
+--
+2.30.2
-- 
2.30.2


