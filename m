Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F1CC4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 05:17:50 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web11.12164.1671599863034214110
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Dec 2022 21:17:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Ry5RA6r4;
 spf=pass (domain: mvista.com, ip: 209.85.216.52, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f52.google.com with SMTP id x3so286486pjv.4
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Dec 2022 21:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kh7AvAbwAaGHvdvYEjYWB0aWZuyM5cch9fJqluT0VCY=;
        b=Ry5RA6r4ObG4hStfIBppwsWY5R7g3ZgXi9JcSjdUD6vO/0Y+WqIbCTAUEO6ZncZuW+
         cHCcx0dgQl0izLoPy5bX1K9Sdn1IbDeFddfT3DfTnsn7PBIKzW6+FYnIjSEaDfkiYvr2
         +lCz5S3RbE5/JADE5S1N+Ol8dPsmjqorSnnj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kh7AvAbwAaGHvdvYEjYWB0aWZuyM5cch9fJqluT0VCY=;
        b=2geLm/p8WjyVBIFWX+gTvhi5JxDGzlmY7EW0c/qd/ihrQWEifEGxOFW9mwkWrJCcJj
         axv8C8C2f6rkc3/nzB/vjWnxZoSeJYuOLijDoFpwnrmtGF75h4DonME0U7FLUXs6N9jL
         U+fRb3e0GHIQ2QBNmE9/nbTGcmP3gnueXuXYBMyibxDhscqXEoDkBySt4frswxt4FG1s
         dmjnoaWb+ks83bh7UwkWKNoowX5770DtOXFh4qlvej0cEATdZNlWEGFNbxYX76JDMxrS
         TJ8m5Hgv0mmbDcF79otAjyVZ+V9pLeRbuDSE7u5M6XVORignBQg8FU5zRTMgd9AMqye8
         Mw6Q==
X-Gm-Message-State: AFqh2kp1As3ONtShiB32291Vz769hHrmgi0iQYRFo0Rc/AijSLy5Y03U
	eO/ciDmGxFzIwuS//W0OgAD2nx+pCgM914p4
X-Google-Smtp-Source: AMrXdXtpNsfIqjj2lyBHHx//0RfzwmkLYAr4yq50OVl8bIUFbjT2pORkL5X2ew3pY0yhB3rHkaJAkQ==
X-Received: by 2002:a17:903:26c3:b0:191:3c8:b2ae with SMTP id jg3-20020a17090326c300b0019103c8b2aemr687323plb.28.1671599862044;
        Tue, 20 Dec 2022 21:17:42 -0800 (PST)
Received: from MVIN00024 ([43.249.234.193])
        by smtp.gmail.com with ESMTPSA id ik11-20020a170902ab0b00b001897bfc9800sm10274964plb.53.2022.12.20.21.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 21:17:41 -0800 (PST)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 21 Dec 2022 10:47:36 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] go: fix CVE-2022-41717 Excessive memory use in got server
Date: Wed, 21 Dec 2022 10:47:35 +0530
Message-Id: <20221221051735.32282-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 05:17:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174900

Upstream-Status: Backport from https://github.com/golang/go/commit/618120c165669c00a1606505defea6ca755cdc27

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |  1 +
 .../go/go-1.18/CVE-2022-41717.patch           | 90 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 9c467d63b2..b29efe3a2f 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -18,6 +18,7 @@ SRC_URI += "\
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
     file://CVE-2022-27664.patch \
     file://0001-net-http-httputil-avoid-query-parameter-smuggling.patch \
+    file://CVE-2022-41717.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
new file mode 100644
index 0000000000..05452ac825
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
@@ -0,0 +1,90 @@
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
+ src/cmd/internal/moddeps/moddeps_test.go |  2 ++
+ src/net/http/h2_bundle.go                | 18 +++++++++++-------
+ 2 files changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index 56c3b25..8552c4a 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -34,6 +34,8 @@ import (
+ // See issues 36852, 41409, and 43687.
+ // (Also see golang.org/issue/27348.)
+ func TestAllDependencies(t *testing.T) {
++	t.Skip("TODO(#57009): 1.19.4 contains unreleased changes from vendored modules")
++
+ 	goBin := testenv.GoToolPath(t)
+ 
+ 	// Ensure that all packages imported within GOROOT
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index b049a79..92c2c12 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -4188,6 +4188,7 @@ type http2serverConn struct {
+ 	headerTableSize             uint32
+ 	peerMaxHeaderListSize       uint32            // zero means unknown (default)
+ 	canonHeader                 map[string]string // http2-lower-case -> Go-Canonical-Case
++	canonHeaderKeysSize         int               // canonHeader keys size in bytes
+ 	writingFrame                bool              // started writing a frame (on serve goroutine or separate)
+ 	writingFrameAsync           bool              // started a frame on its own goroutine but haven't heard back on wroteFrameCh
+ 	needsFrameFlush             bool              // last frame write wasn't a flush
+@@ -4367,6 +4368,13 @@ func (sc *http2serverConn) condlogf(err error, format string, args ...interface{
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
+@@ -4382,14 +4390,10 @@ func (sc *http2serverConn) canonicalHeader(v string) string {
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


