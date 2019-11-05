Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BF7C67D717
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 06:39:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xA56dfG0015500
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2019 22:39:42 -0800 (PST)
Received: from 41ce8e763d5a.wrs.com (128.224.153.74) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 4 Nov 2019 22:39:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Nov 2019 06:38:17 +0000
Message-ID: <20191105063817.243431-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] go: fix CVE-2019-17596
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
X-List-Received-Date: Tue, 05 Nov 2019 06:39:40 -0000
Content-Type: text/plain

https://github.com/golang/go/commit/2017d88dbc096381d4f348d2fb08bfb3c2b7ed73

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/go/go-1.12.inc          |  1 +
 .../go/go-1.12/0010-fix-CVE-2019-17596.patch  | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch

diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
index 39157ff882..34be06eff3 100644
--- a/meta/recipes-devtools/go/go-1.12.inc
+++ b/meta/recipes-devtools/go/go-1.12.inc
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
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
2.23.0


