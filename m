Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5ABC960939
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 08:49:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6H8nGDH011676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 01:49:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 17 Jul 2017 01:49:15 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 17 Jul 2017 16:40:39 +0800
Message-ID: <241e7d1de19c1d12ad2aa91366aecc8bedc8fd2d.1500280794.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1500280794.git.kai.kang@windriver.com>
References: <cover.1500280794.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ghostscript: remove legacy patch png_mak.patch
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
X-List-Received-Date: Mon, 17 Jul 2017 08:49:15 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

png_mak.patch was created for ghostscript 9.16 and causes make circular
dependency now. Check source code base/png.mak after apply png_mak.patch:

Line 77: $(MAKEDIRS) : $(pnglibconf_h)
Line 83: $(pnglibconf_h) : $(PNGSRC)scripts$(D)pnglibconf.h.prebuilt $(TOP_MAKEFILES) $(MAKEDIRS)

So remove png_mak.patch.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../ghostscript/ghostscript/png_mak.patch          | 32 ----------------------
 .../ghostscript/ghostscript_9.21.bb                |  1 -
 2 files changed, 33 deletions(-)
 delete mode 100644 meta/recipes-extended/ghostscript/ghostscript/png_mak.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch b/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
deleted file mode 100644
index 8b84986..0000000
--- a/meta/recipes-extended/ghostscript/ghostscript/png_mak.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-ghostscript: add dependency for pnglibconf.h
-
-When using parallel make jobs, we need to be sure that
-pnglibconf.h is created before we try to reference it,
-so add a rule to png.mak.
-
-Upstream-Status: Pending
-
-Signed-off-by: Joe Slater <jslater@windriver.com>
-
-Rebase to 9.19
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- base/png.mak | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/base/png.mak b/base/png.mak
-index fe5c6e2..8abb53a 100644
---- a/base/png.mak
-+++ b/base/png.mak
-@@ -74,6 +74,8 @@ png.clean-not-config-clean :
- 
- pnglibconf_h=$(PNGGENDIR)$(D)pnglibconf.h
- 
-+$(MAKEDIRS) : $(pnglibconf_h)
-+
- png.config-clean :
- 	$(RM_) $(pnglibconf_h)
- 	$(RM_) $(PNGGEN)lpg*.dev
--- 
-2.8.1
-
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index fb36a13..adad9fd 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
@@ -22,7 +22,6 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
 SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs921/${BPN}-${PV}.tar.gz \
                 file://ghostscript-9.15-parallel-make.patch \
                 file://ghostscript-9.16-Werror-return-type.patch \
-                file://png_mak.patch \
                 file://do-not-check-local-libpng-source.patch \
                 file://avoid-host-contamination.patch \
                 file://mkdir-p.patch \
-- 
2.10.1


