Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFE6601A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 13:07:16 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3rDbKc1P94z3hl8p;
	Tue, 24 May 2016 15:07:16 +0200 (CEST)
X-Auth-Info: WzOemXB8d/ZRsT9Gr8n9VFLtuDuhKHO07j1aLAm9zdk=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3rDbKN2yKjzvhTZ;
	Tue, 24 May 2016 15:06:58 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 15:06:48 +0200
Message-Id: <1464095208-5639-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.7.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] gcc: Backport nios2 gcc ICE fix
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
X-List-Received-Date: Tue, 24 May 2016 13:07:19 -0000

Backport a patch from mainline gcc 5 branch to fix ICE triggered
when cross-compiling libdrm for nios2 architecture. The same ICE
is fixed in gcc6 already.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |  1 +
 .../0061-nios2-Make-assert-less-restrictive.patch  | 35 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 5dd8022..c54fa68 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -90,6 +90,7 @@ SRC_URI = "\
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
            file://0059-libgcc-use-ldflags.patch \
            file://0060-remove-prototypes-cfns.patch \
+	   file://0061-nios2-Make-assert-less-restrictive.patch \
            file://CVE-2016-4488.patch \
            file://CVE-2016-4489.patch \
            file://CVE-2016-2226.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch b/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
new file mode 100644
index 0000000..6a20694
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0061-nios2-Make-assert-less-restrictive.patch
@@ -0,0 +1,35 @@
+From 802c64857074cb7b002d91ce6352139c2353ca06 Mon Sep 17 00:00:00 2001
+From: cltang <cltang@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Sat, 21 May 2016 08:26:11 +0000
+Subject: [PATCH] 2016-05-21  Chung-Lin Tang  <cltang@codesourcery.com>
+
+	Backport from mainline
+	2015-06-29  Sandra Loosemore  <sandra@codesourcery.com>
+
+	* config/nios2/nios2.c (nios2_delegitimize_address): Make
+	assert less restrictive.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@236555 138bc75d-0d04-0410-961f-82ee72b054a4
+Upstream-Status: Backport (git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-5-branch@236555 138bc75d-0d04-0410-961f-82ee72b054a4)
+---
+ gcc/config/nios2/nios2.c | 2 +-
+ 1 files changed, 1 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/nios2/nios2.c b/gcc/config/nios2/nios2.c
+index 7b6b389..3b22331 100644
+--- a/gcc/config/nios2/nios2.c
++++ b/gcc/config/nios2/nios2.c
+@@ -1930,7 +1930,7 @@ nios2_delegitimize_address (rtx x)
+ 	case UNSPEC_LOAD_TLS_IE:
+ 	case UNSPEC_ADD_TLS_LE:
+ 	  x = XVECEXP (XEXP (x, 0), 0, 0);
+-	  gcc_assert (GET_CODE (x) == SYMBOL_REF);
++	  gcc_assert (CONSTANT_P (x));
+ 	  break;
+ 	}
+     }
+-- 
+2.8.1
+
-- 
2.7.0


