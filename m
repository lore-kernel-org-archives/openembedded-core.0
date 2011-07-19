Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX1/4+b5aIleZoFbZnoC3vwrmAOGbIJUWAis=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QjEMY-0006Sx-JH
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:45:43 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p6JHfbuZ009955;
	Tue, 19 Jul 2011 12:41:38 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 12:41:32 -0500
Message-Id: <1311097296-17200-2-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1311097296-17200-1-git-send-email-galak@kernel.crashing.org>
References: <1311097296-17200-1-git-send-email-galak@kernel.crashing.org>
Cc: yocto@yoctoproject.org
Subject: [PATCH v2 1/5] gcc: Add gcc configure for PowerPC e500v2/SPE embedded floating point ABI
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
X-List-Received-Date: Tue, 19 Jul 2011 17:45:43 -0000

The e500v2 core utilizes a unique floating point programming model / ABI.
We utilize TARGET_FPU = "ppc-efd" to distinguish this choice (Embedded
scalar single-precision floating-point).  When building the toolchain for
this ABI we need configure gcc with --enable-e500_double.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc    |    2 +-
 meta/recipes-devtools/gcc/gcc-common.inc |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 56064b5..b719155 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r8"
+PR = "r9"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 7bf036c..1684e78 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -12,6 +12,8 @@ FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/gcc-${PV}"
 def get_gcc_fpu_setting(bb, d):
     if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
         return "--with-float=soft"
+    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'ppc-efd' ]:
+        return "--enable-e500_double"
     return ""
 
 def get_gcc_mips_plt_setting(bb, d):
-- 
1.7.3.4



