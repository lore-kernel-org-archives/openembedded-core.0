Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9F4937458B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:40:19 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 812D924E0625;
	Mon, 17 Sep 2018 14:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219810; bh=0Wa0K+UrAQRGr2WzlSnC8jeHXFX7PkBQXSm9cAgPllY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDF2/gHNBnPc69/LydYQaYiFb/SomY8jS0BMWP2gnaUXLwUzgD6eES3du95nF4EVo
	guIuH2vc4t58YYWAFqjEeHNPL1fPBsekSyQRPBap156ZKA7tR1KUIyvefuWCbDpnPN
	QUmfgLSLmtun67xWI1q2Xc3NHCXqmAn7RbbMblyfYDZP3yItMJYJBLO4TjqKY9ARWr
	BzXB6ga7QrtIezPYDuPb74TZjxuwEkdGvcxrKYaf3nEyDd51EmNZN73X9rSWdJq6Qe
	Uf8looxMm/S3BvlP2B7YywD2rn8FwZwwFupdmmMJ0rhdUxw2F3Vng6D4hlEq7WvN/R
	mHPH/DAHLVNaw==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 49D57560B;
	Mon, 17 Sep 2018 14:30:09 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:43 +0300
Message-Id: <20180917212943.27237-11-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 10/10] gcc: Fix specs generation for ARC
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
X-List-Received-Date: Mon, 17 Sep 2018 21:40:19 -0000

GCC's built-in spec for LD is missing a space after
"--eh-frame-hdr" thus with the next option merged together they
are not understood by LD and so LD fails.

Back-port from upstream GCC, see:
https://github.com/gcc-mirror/gcc/commit/892142379c6b99fe8c3ebdfe0b79e2a435228c1d

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/recipes-devtools/gcc/gcc-8.2.inc              |  1 +
 .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch        | 40 ++++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 889187e..866a775 100644
--- a/meta/recipes-devtools/gcc/gcc-8.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.2.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
            file://0038-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0039-Fix-for-testsuite-failure.patch \
            file://0040-Re-introduce-spe-commandline-options.patch \
+           file://0041-ARC-fix-spec-gen.patch \
            ${BACKPORTS} \
 "
 BACKPORTS = "\
diff --git a/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
new file mode 100644
index 0000000..d746d79
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
@@ -0,0 +1,40 @@
+From 892142379c6b99fe8c3ebdfe0b79e2a435228c1d Mon Sep 17 00:00:00 2001
+From: claziss <claziss@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 17 Sep 2018 08:52:10 +0000
+Subject: [PATCH] [ARC] Update LINK_EH_SPEC linker spec.
+
+With no trailing space in LINK_EH_SPEC linker spec gets generated as:
+------------------------>8---------------------
+%{!r:--build-id} --eh-frame-hdr%{h*} ...
+------------------------>8---------------------
+
+or even worse if hash style is added:
+------------------------>8---------------------
+%{!r:--build-id} --eh-frame-hdr--hash-style=sysv %{h*} ...
+------------------------>8---------------------
+
+Now if that spec is really used by LD then it fails inevitably
+saying that it doesn't know option "--eh-frame-hdr--hash-style=sysv".
+
+2018-09-17  Alexey Brodkin  <abrodkin@synopsys.com>
+
+	* config/arc/linux.h (LINK_EH_SPEC): Add missing space.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@264361 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/config/arc/linux.h | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
+index 96d548eae341..62ebe4de0fc7 100644
+--- a/gcc/config/arc/linux.h
++++ b/gcc/config/arc/linux.h
+@@ -98,7 +98,7 @@ along with GCC; see the file COPYING3.  If not see
+    Signalize that because we have fde-glibc, we don't need all C shared libs
+    linked against -lgcc_s.  */
+ #undef LINK_EH_SPEC
+-#define LINK_EH_SPEC "--eh-frame-hdr"
++#define LINK_EH_SPEC "--eh-frame-hdr "
+ #endif
+ 
+ #undef SUBTARGET_CPP_SPEC
-- 
1.8.3.1


