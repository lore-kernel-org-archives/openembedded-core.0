Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8ABECAAD8
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 02:36:59 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web10.5562.1663209417403766988
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Sep 2022 19:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=kDyAP44Z;
 spf=pass (domain: intel.com, ip: 134.134.136.65,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663209417; x=1694745417;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4A6fuOG0aTj8+jT5sfCDPCFapm1SW0nBWVGvvWYzsgA=;
  b=kDyAP44ZhtzMf2+cRwXazR1cpMEishGddM0zscYOm9Zs/7qAe5pbNwgM
   4ep2KM10xOpLx0TYLN077BKOeFJettrvVjDo5I+OHXK1qz0/DXfJJPc+I
   SCN/spionF/g8fL3JLKy/D/hLl5DWhuopIaW0MCanT2dlUNj1lknfkdRk
   BP908WrX+WOSxfz9AWfXQMZiQlkDuY31/KztN1TP5XK5fxeLuN2qLHR+A
   sURb+6Ol2f4JbmL87FiLGcwvVR4yQHYdhuUWrJQc3t+PmrGU8Vypv5EJY
   paNwuFSoTmUTwOVenriD+vLRCmS8ZcC00gMF1q6Eh6T3TPXP8+6BhO1Pl
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="299953704"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200";
   d="scan'208";a="299953704"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 19:36:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200";
   d="scan'208";a="742767651"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga004.jf.intel.com with ESMTP; 14 Sep 2022 19:36:55 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] go : CVE-2022-27664
Date: Thu, 15 Sep 2022 10:36:53 +0800
Message-Id: <20220915023653.14237-1-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 02:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170679

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Upstream-Status: Backport [https://github.com/golang/go/commit/5bc9106458fc07851ac324a4157132a91b1f3479]
Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
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
2.36.1


