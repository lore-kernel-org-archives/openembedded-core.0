Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 6215A79886
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:42:57 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id DB7FC10C04F7;
	Thu, 20 Sep 2018 13:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537476178; bh=7Le5HU5QzCpGt2408nidh+yvPry3ZX9FBZnatTvDn7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PN0KIfYnoNv48/DGLBO/bXmCiC3+piGRKaKQnBBMUo3X4ZfZaVdSLAUq2IIk5Pz13
	I5YX1h8J1y3gwDIS5NdS+c4Bz5IZiyL2W1kLwZ6GoldVtUeuMRlK88yJ4HUucdHgom
	wC8H32syW81+r7IGvvNBhYvnPNzaZp9IlN3eq9Bb7X2IGlp/0GLXTJpxR5MrgW9B4R
	W7sWCcWRiLDvjIK9nMEDIxQDxwCQsWdxGJO45hj504vOqRnI1WgDc9vsHbM4PJ5oRw
	UBuFrA4JeMZMm8wZvOAIyVp049zZqTZpSigu5rS75NuaPdgkOKvRPCkquBWO8ExmDq
	EMP2Kl50imXiQ==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id AD5283B85;
	Thu, 20 Sep 2018 13:42:57 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 23:42:32 +0300
Message-Id: <20180920204232.10583-10-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180920204232.10583-1-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2 9/9] gcc: Fix specs generation for ARC
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
X-List-Received-Date: Thu, 20 Sep 2018 20:42:57 -0000

GCC's built-in spec for LD is missing a space after
"--eh-frame-hdr" thus with the next option merged together they
are not understood by LD and so LD fails.

Back-port from upstream GCC, see:
https://github.com/gcc-mirror/gcc/commit/892142379c6b99fe8c3ebdfe0b79e2a435228c1d

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

Changes v1 -> v2:

 * Added upstream status

 meta/recipes-devtools/gcc/gcc-8.2.inc              |  1 +
 .../gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch        | 44 ++++++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.2.inc b/meta/recipes-devtools/gcc/gcc-8.2.inc
index 889187e9c4..866a77558b 100644
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
index 0000000000..cbd5e41ab1
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.2/0041-ARC-fix-spec-gen.patch
@@ -0,0 +1,44 @@
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
+
+Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
+
+Upstream-Status: Backport[https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=892142379c6b]
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
2.16.2


