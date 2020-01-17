Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 8BFDA7FBF4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:14:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znjs4g6vz5d
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:14:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579281281;
	bh=85dTwuI3n8J+zuPIUiY0tLUHjz18PBJ+ctp66N8/yRM=;
	h=From:To:Subject:Date:From;
	b=iB+hqlndoFjxfVZZTLnW4Y23D7i9rS2sHk0B+cFMNdzqUmdg+nVvbWso1nDwrMg76
	U8pX8c1dSz5Qm/WvlCujw3+c8KDAVtxMHwKjgTHKEb6xdtBvlGrs78Vz9MRGWQtgyk
	ZBV74ZzKIoHVlWAV7bVJRw+Bc5acqAhxUEkWV4u+1hNCBF3+fK5fkJxHkNbGj/Bz3W
	ScsQKF5/N8M96tDb2MTLFVIkvohN2PAuS+gms2FqpLz1t2D76kyZVeuqOdEudI07w8
	DtQmLePsxRpWGwlaIjx+qfQuh20QD+rIpvhchQiFW07moM4ienjPatO8xDouPaY/3U
	o1GKW/2mo1XtKZ0m4Yh5379rSlkJ8r7FDXQjGzXU+f+77yvkPGg6gHqJTSYrpMD0sE
	B/Ms53Yrr7DtPvRyrs5o7feO0Awdbh0u3jtz4JQciuv+7RT82vkhhSnC2MFR3Sdr0O
	/Y3BZ7IhGpUoAApIuASyVAo1Sh2bKJKDzTxNKW0rTEzhzzr2pU2Giq15aSHAqimSBv
	yz+FbIr6hbfG06PMclVXaz1Gpa5bjkdvYM5zThUcCpJDHfaD2Gc6qo0Agar/SBZ9Tn
	uDWVOMPwWJvcqiOYnCqnrtYbJeOQrE0iHFlelKhRa0TvHssuO/8p3bwbMYrlnsAt4X
	YXe3lYLY688C8ifP0jfMr1Do=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:14:32 +0200
Message-Id: <20200117171436.17131-12-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] go: fix CVE-2019-17596
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
X-List-Received-Date: Fri, 17 Jan 2020 17:14:40 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

https://github.com/golang/go/commit/2017d88dbc096381d4f348d2fb08bfb3c2b7ed73

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
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
2.17.1


