Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 679907886F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:24:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:24:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24053619"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:24:44 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:17:24 +0200
Message-Id: <20180308181804.31261-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 02/42] grub: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:24:44 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...odule-explicitly-keeps-symbole-.module_license.patch | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
index 935c472cf8f..ffc2d40d893 100644
--- a/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
+++ b/meta/recipes-bsp/grub/files/grub-module-explicitly-keeps-symbole-.module_license.patch
@@ -43,19 +43,16 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  grub-core/genmod.sh.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/grub-core/genmod.sh.in b/grub-core/genmod.sh.in
-index 76df0bb..39a9cfc 100644
---- a/grub-core/genmod.sh.in
-+++ b/grub-core/genmod.sh.in
-@@ -59,7 +59,7 @@ if test x@TARGET_APPLE_CC@ != x1; then
+Index: grub-2.02/grub-core/genmod.sh.in
+===================================================================
+--- grub-2.02.orig/grub-core/genmod.sh.in
++++ grub-2.02/grub-core/genmod.sh.in
+@@ -56,7 +56,7 @@ if test x@TARGET_APPLE_LINKER@ != x1; th
  	if test x@platform@ != xemu; then
- 	    @STRIP@ --strip-unneeded \
+ 	    @TARGET_STRIP@ --strip-unneeded \
  		-K grub_mod_init -K grub_mod_fini \
 -		-K _grub_mod_init -K _grub_mod_fini \
 +		-K _grub_mod_init -K _grub_mod_fini -K .module_license \
  		-R .note.gnu.gold-version -R .note.GNU-stack \
- 		-R .note -R .comment $tmpfile || exit 1
+ 		-R .note -R .comment -R .ARM.exidx $tmpfile || exit 1
  	fi
--- 
-2.8.1
-
-- 
2.16.1


