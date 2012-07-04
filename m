Received: from mrsl.grasp.upenn.edu ([158.130.53.11] helo=morwong)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kartikmohta@gmail.com>) id 1SmGQx-0004hJ-Nt
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 05:39:20 +0200
Received: by morwong (Postfix, from userid 1000)
	id 51C7EA1321; Tue,  3 Jul 2012 23:21:21 -0400 (EDT)
From: Kartik Mohta <kartikmohta@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 23:21:07 -0400
Message-Id: <1341372067-24821-1-git-send-email-kartikmohta@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH] gcc-common: Don't use "is" for comparing strings, use "=="
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jul 2012 03:39:20 -0000

Needed because the equality check was failing here even though upon
printing the LHS and RHS were the same.
As per http://stackoverflow.com/a/2987975/64537, using "is" compares the
memory addresses of the two objects which is not what we want here. We
just want to compare the values.

Signed-off-by: Kartik Mohta <kartikmohta@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 45828bb..0a9324a 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -10,7 +10,7 @@ inherit autotools gettext
 FILESDIR = "${@os.path.dirname(d.getVar('FILE',1))}/gcc-${PV}"
 
 def get_gcc_fpu_setting(bb, d):
-    if d.getVar('ARMPKGSFX_EABI', True) is "hf" and  d.getVar('TRANSLATED_TARGET_ARCH', True) is "arm":
+    if d.getVar('ARMPKGSFX_EABI', True) == "hf" and d.getVar('TRANSLATED_TARGET_ARCH', True) == "arm":
         return "--with-float=hard"
     if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
         return "--with-float=soft"
-- 
1.7.4.1



