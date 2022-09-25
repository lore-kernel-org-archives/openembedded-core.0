Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6392BC6FA93
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:12 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.20052.1664133481784786987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=AUViuufE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d82so4725955pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=7eS8A1Y13rE4eKcCDVWN17wFEBIo9TWwUZiJ3g6YaGE=;
        b=AUViuufEd7DoFkAkCClklOHUDipMdd3hTkXmvmIGZQO00PFIfc1zRV1WncUQL9Zx1T
         a8QDWRIDEy5LgxSXn3rZc7Y/A3vgnDwcLgleeTn/0rG1EvBzFxD6YXvyhfNXnrKAARhx
         VgzdnRhXGvvYOhVwT5yNp9mCufv9eqkASYm6B3fLnOfnXNW1YybLpPsgkkMIW3KBxgEB
         BPcsc6fqrfCX/+8+LgNeUzMn72RIQYlIUjiSIafTqNCkn+dcdVWSGbLI1OSGHCyZERQ+
         LiDtOdRPYSP9Q1TLh401HnwfSu8V7qKcrL2i4dpQnxX8aOYO9bRelsTUviUuCh1yp2H5
         3mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7eS8A1Y13rE4eKcCDVWN17wFEBIo9TWwUZiJ3g6YaGE=;
        b=ARFeP6pL2pL8zW99EpBk9kc+bLKVNeo5i/xcKqFPUL2CHlXeaLuApYSMPBbBNCphSe
         9o2YsmnG/T4I1bYcwJF0Srp9hnbwr3VOSeW1bjvPeaZrZcX5QUwOY9hBFUqKLGwcdKLm
         WLG7UyBrdpKXmjiv78zWJCpsyC5xPZycxRm6o8d6/QZq/dvLcoMHpNUQd8nRLsKof3Je
         lOlBFC4DtEuOYWh5wfPwJJCQzBWcbHZqK5n+0H2hB3gQpOeupkMAlUm2qx6jFz3YJJaf
         PC36+2b4hdVS8CNJCr+LBTG2/UCSlXIRVlOGOAmelCJjHihopaZP8i24kh6RuKqUcuzP
         nIPA==
X-Gm-Message-State: ACrzQf0dn5didasrwW+QlEVIdg71amIy9AVZZv+E58Q6dKnm1cTeIdGo
	IlRtUPMl4iDFBjiJLDCla1pUFmm83gmwfo6e
X-Google-Smtp-Source: 
 AMsMyM6msyRchEN/qk2aXUJByU0Vaxm/1EXynXm9m1XgVY5wE+1Fv/tCz16zGtcd0DAw07DLxQPp0A==
X-Received: by 2002:a63:fb56:0:b0:429:983f:b91e with SMTP id
 w22-20020a63fb56000000b00429983fb91emr16890727pgj.399.1664133478334;
        Sun, 25 Sep 2022 12:17:58 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.17.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:17:57 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/33] go: fix CVE-2022-27664
Date: Sun, 25 Sep 2022 09:17:12 -1000
Message-Id: 
 <fecad1b8e0f006c0186941706219d39c6c8ba5eb.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171016

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Upstream-Status: Backport [https://github.com/golang/go/commit/5bc9106458fc07851ac324a4157132a91b1f3479]
Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-27664.patch           | 102 ++++++++++++++++++
 2 files changed, 103 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-27664.patch

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 95d0fb7e98..b18de66f42 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
+    file://CVE-2022-27664.patch \
 "
 SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784ada0cd300fd"
 
diff --git a/meta/recipes-devtools/go/go-1.18/CVE-2022-27664.patch b/meta/recipes-devtools/go/go-1.18/CVE-2022-27664.patch
new file mode 100644
index 0000000000..fba4f054ee
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.18/CVE-2022-27664.patch
@@ -0,0 +1,102 @@
+From 5bc9106458fc07851ac324a4157132a91b1f3479 Mon Sep 17 00:00:00 2001
+From: Damien Neil <dneil@google.com>
+Date: Mon, 22 Aug 2022 16:21:02 -0700
+Subject: [PATCH] [release-branch.go1.18] net/http: update bundled
+ golang.org/x/net/http2
+
+Disable cmd/internal/moddeps test, since this update includes PRIVATE
+track fixes.
+
+Fixes CVE-2022-27664
+Fixes #53977
+For #54658.
+
+Change-Id: I84b0b8f61e49e15ef55ef8d738730107a3cf849b
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/1554415
+Reviewed-by: Roland Shoemaker <bracewell@google.com>
+Reviewed-by: Tatiana Bradley <tatianabradley@google.com>
+Reviewed-on: https://go-review.googlesource.com/c/go/+/428635
+Reviewed-by: Tatiana Bradley <tatiana@golang.org>
+Run-TryBot: Michael Knyszek <mknyszek@google.com>
+TryBot-Result: Gopher Robot <gobot@golang.org>
+Reviewed-by: Carlos Amedee <carlos@golang.org>
+
+Upstream-Status: Backport
+CVE: CVE-2022-27664 
+
+Reference to upstream patch: https://github.com/golang/go/commit/5bc9106458fc07851ac324a4157132a91b1f3479
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+---
+ src/cmd/internal/moddeps/moddeps_test.go |  2 ++
+ src/net/http/h2_bundle.go                | 21 +++++++++++++--------
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/src/cmd/internal/moddeps/moddeps_test.go b/src/cmd/internal/moddeps/moddeps_test.go
+index 56c3b2585c..3306e29431 100644
+--- a/src/cmd/internal/moddeps/moddeps_test.go
++++ b/src/cmd/internal/moddeps/moddeps_test.go
+@@ -34,6 +34,8 @@ import (
+ // See issues 36852, 41409, and 43687.
+ // (Also see golang.org/issue/27348.)
+ func TestAllDependencies(t *testing.T) {
++	t.Skip("TODO(#53977): 1.18.5 contains unreleased changes from vendored modules")
++
+ 	goBin := testenv.GoToolPath(t)
+ 
+ 	// Ensure that all packages imported within GOROOT
+diff --git a/src/net/http/h2_bundle.go b/src/net/http/h2_bundle.go
+index bb82f24585..1e78f6cdb9 100644
+--- a/src/net/http/h2_bundle.go
++++ b/src/net/http/h2_bundle.go
+@@ -3384,10 +3384,11 @@ func (s http2SettingID) String() string {
+ // name (key). See httpguts.ValidHeaderName for the base rules.
+ //
+ // Further, http2 says:
+-//   "Just as in HTTP/1.x, header field names are strings of ASCII
+-//   characters that are compared in a case-insensitive
+-//   fashion. However, header field names MUST be converted to
+-//   lowercase prior to their encoding in HTTP/2. "
++//
++//	"Just as in HTTP/1.x, header field names are strings of ASCII
++//	characters that are compared in a case-insensitive
++//	fashion. However, header field names MUST be converted to
++//	lowercase prior to their encoding in HTTP/2. "
+ func http2validWireHeaderFieldName(v string) bool {
+ 	if len(v) == 0 {
+ 		return false
+@@ -3578,8 +3579,8 @@ func (s *http2sorter) SortStrings(ss []string) {
+ // validPseudoPath reports whether v is a valid :path pseudo-header
+ // value. It must be either:
+ //
+-//     *) a non-empty string starting with '/'
+-//     *) the string '*', for OPTIONS requests.
++//	*) a non-empty string starting with '/'
++//	*) the string '*', for OPTIONS requests.
+ //
+ // For now this is only used a quick check for deciding when to clean
+ // up Opaque URLs before sending requests from the Transport.
+@@ -5053,6 +5054,9 @@ func (sc *http2serverConn) startGracefulShutdownInternal() {
+ func (sc *http2serverConn) goAway(code http2ErrCode) {
+ 	sc.serveG.check()
+ 	if sc.inGoAway {
++		if sc.goAwayCode == http2ErrCodeNo {
++			sc.goAwayCode = code
++		}
+ 		return
+ 	}
+ 	sc.inGoAway = true
+@@ -6265,8 +6269,9 @@ func (rws *http2responseWriterState) writeChunk(p []byte) (n int, err error) {
+ // prior to the headers being written. If the set of trailers is fixed
+ // or known before the header is written, the normal Go trailers mechanism
+ // is preferred:
+-//    https://golang.org/pkg/net/http/#ResponseWriter
+-//    https://golang.org/pkg/net/http/#example_ResponseWriter_trailers
++//
++//	https://golang.org/pkg/net/http/#ResponseWriter
++//	https://golang.org/pkg/net/http/#example_ResponseWriter_trailers
+ const http2TrailerPrefix = "Trailer:"
+ 
+ // promoteUndeclaredTrailers permits http.Handlers to set trailers
+-- 
+2.36.1
+
-- 
2.25.1


