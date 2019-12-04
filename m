Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BEFDD7CDC0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 13:32:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:07 -0800
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; d="scan'208";a="205389421"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.178])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:06 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 21:31:45 +0800
Message-Id: <ca0068ee156b6e38b0a45a39527dc6e38f958645.1575465665.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1575465665.git.anuj.mittal@intel.com>
References: <cover.1575465665.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 04/10] go: fix CVE-2019-17596
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Dec 2019 13:32:05 -0000
Content-Transfer-Encoding: 8bit

From: Hongxu Jia <hongxu.jia@windriver.com>

https://github.com/golang/go/commit/2017d88dbc096381d4f348d2fb08bfb3c2b7ed73

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/go-1.12.inc          |  1 +
 .../go/go-1.12/0010-fix-CVE-2019-17596.patch  | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index ed14b175e6..6aecaad75d 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -17,6 +17,7 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
     file://0001-release-branch.go1.12-security-net-textproto-don-t-n.patch \
+    file://0010-fix-CVE-2019-17596.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
 
diff --git a/meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch b/meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch
new file mode 100644
index 0000000000..134cfab737
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch
@@ -0,0 +1,42 @@
+From f1783e1ce44a86c000a7c380a57a805c89c3efbe Mon Sep 17 00:00:00 2001
+From: Katie Hockman <katie@golang.org>
+Date: Mon, 14 Oct 2019 16:42:21 -0400
+Subject: [PATCH] crypto/dsa: prevent bad public keys from causing panic
+
+dsa.Verify might currently use a nil s inverse in a
+multiplication if the public key contains a non-prime Q,
+causing a panic. Change this to check that the mod
+inverse exists before using it.
+
+Fixes CVE-2019-17596
+
+Change-Id: I94d5f3cc38f1b5d52d38dcb1d253c71b7fd1cae7
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/572809
+Reviewed-by: Filippo Valsorda <valsorda@google.com>
+(cherry picked from commit 9119dfb0511326d4485b248b83d4fde19c95d0f7)
+Reviewed-on: https://team-review.git.corp.google.com/c/golang/go-private/+/575232
+
+CVE: CVE-2019-17596
+Upstream-Status: Backport [https://github.com/golang/go/commit/2017d88dbc096381d4f348d2fb08bfb3c2b7ed73]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ src/crypto/dsa/dsa.go | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/crypto/dsa/dsa.go b/src/crypto/dsa/dsa.go
+index 575314b..2fc4f1f 100644
+--- a/src/crypto/dsa/dsa.go
++++ b/src/crypto/dsa/dsa.go
+@@ -279,6 +279,9 @@ func Verify(pub *PublicKey, hash []byte, r, s *big.Int) bool {
+ 	}
+ 
+ 	w := new(big.Int).ModInverse(s, pub.Q)
++	if w == nil {
++		return false
++	}
+ 
+ 	n := pub.Q.BitLen()
+ 	if n&7 != 0 {
+-- 
+2.23.0
+
-- 
2.21.0


