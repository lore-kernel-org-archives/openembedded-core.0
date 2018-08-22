Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3D37929E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:10:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7MCAtPJ026426
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 22 Aug 2018 05:10:55 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 22 Aug 2018 05:10:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2018 20:10:40 +0800
Message-ID: <1534939840-40429-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] patch: fix CVE-2018-6952
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
X-List-Received-Date: Wed, 22 Aug 2018 12:10:55 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-Fix-swapping-fake-lines-in-pch_swap.patch | 36 ++++++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/patch/patch/0001-Fix-swapping-fake-lines-in-pch_swap.patch

diff --git a/meta/recipes-devtools/patch/patch/0001-Fix-swapping-fake-lines-in-pch_swap.patch b/meta/recipes-devtools/patch/patch/0001-Fix-swapping-fake-lines-in-pch_swap.patch
new file mode 100644
index 0000000..049149e
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0001-Fix-swapping-fake-lines-in-pch_swap.patch
@@ -0,0 +1,36 @@
+From 9c986353e420ead6e706262bf204d6e03322c300 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Fri, 17 Aug 2018 13:35:40 +0200
+Subject: [PATCH] Fix swapping fake lines in pch_swap
+
+* src/pch.c (pch_swap): Fix swapping p_bfake and p_efake when there is a
+blank line in the middle of a context-diff hunk: that empty line stays
+in the middle of the hunk and isn't swapped.
+
+Fixes: https://savannah.gnu.org/bugs/index.php?53133
+Signed-off-by: Andreas Gruenbacher <agruen@gnu.org>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/git/patch.git]
+CVE: CVE-2018-6952
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
+---
+ src/pch.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index e92bc64..a500ad9 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -2122,7 +2122,7 @@ pch_swap (void)
+     }
+     if (p_efake >= 0) {			/* fix non-freeable ptr range */
+ 	if (p_efake <= i)
+-	    n = p_end - i + 1;
++	    n = p_end - p_ptrn_lines;
+ 	else
+ 	    n = -i;
+ 	p_efake += n;
+-- 
+2.10.2
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 823486d..85b0db7 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -5,6 +5,7 @@ SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
             file://0002-Fix-segfault-with-mangled-rename-patch.patch \
             file://0003-Allow-input-files-to-be-missing-for-ed-style-patches.patch \
             file://0004-Fix-arbitrary-command-execution-in-ed-style-patches-.patch \
+            file://0001-Fix-swapping-fake-lines-in-pch_swap.patch \
 "
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
-- 
2.7.4


