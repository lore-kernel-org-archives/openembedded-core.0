Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QJuKa-0003KX-Nj
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 23:19:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2011 14:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,347,1301900400"; 
   d="scan'208";a="562799"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2011 14:16:11 -0700
Message-Id: <069e20eb83ea99131dc350efff71e2df9ef8badb.1305062028.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1305062026.git.nitin.a.kamble@intel.com>
References: <cover.1305062026.git.nitin.a.kamble@intel.com>
Old-Date: Sun, 8 May 2011 09:24:40 -0700
Date: Tue, 10 May 2011 14:16:11 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 03/16] pax: fix for compiling with gcc 4.6.0
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
X-List-Received-Date: Tue, 10 May 2011 21:19:01 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../pax/pax/fix_for_compile_with_gcc-4.6.0.patch   |   25 ++++++++++++++++++++
 meta/recipes-extended/pax/pax_3.4.bb               |    5 ++-
 2 files changed, 28 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/pax/pax/fix_for_compile_with_gcc-4.6.0.patch

diff --git a/meta/recipes-extended/pax/pax/fix_for_compile_with_gcc-4.6.0.patch b/meta/recipes-extended/pax/pax/fix_for_compile_with_gcc-4.6.0.patch
new file mode 100644
index 0000000..88779c3
--- /dev/null
+++ b/meta/recipes-extended/pax/pax/fix_for_compile_with_gcc-4.6.0.patch
@@ -0,0 +1,25 @@
+Upstream-Status: Pending
+
+This patch fixes this compiler error with gcc 4.6.0
+
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/05/08
+
+| fts.c: In function 'pax_fts_set':
+| fts.c:469:7: error: parameter 'sp' set but not used [-Werror=unused-but-set-parameter]
+| cc1: all warnings being treated as errors
+| 
+| make[2]: *** [fts.o] Error 1
+
+Index: pax-3.4/lib/fts.c
+===================================================================
+--- pax-3.4.orig/lib/fts.c
++++ pax-3.4/lib/fts.c
+@@ -466,7 +466,7 @@ name:		t = sp->fts_path + NAPPEND(p->fts
+ /* ARGSUSED */
+ int
+ fts_set(sp, p, instr)
+-	FTS *sp;
++	FTS __attribute__((__unused__)) *sp;
+ 	FTSENT *p;
+ 	int instr;
+ {
diff --git a/meta/recipes-extended/pax/pax_3.4.bb b/meta/recipes-extended/pax/pax_3.4.bb
index b0f358a..e9c70d6 100644
--- a/meta/recipes-extended/pax/pax_3.4.bb
+++ b/meta/recipes-extended/pax/pax_3.4.bb
@@ -10,9 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b0b674dfdc56daa3832d4069b820ea0 \
                     file://lib/vis.h;endline=40;md5=b283f759abd4a5ad7e014b80f51fc053"
 
 SECTION = "base"
-PR = "r0"
+PR = "r1"
 
-SRC_URI = "ftp://ftp.suse.com/pub/people/kukuk/pax/pax-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.suse.com/pub/people/kukuk/pax/pax-${PV}.tar.bz2 \
+	file://fix_for_compile_with_gcc-4.6.0.patch"
 
 SRC_URI[md5sum] = "fbd9023b590b45ac3ade95870702a0d6"
 SRC_URI[sha256sum] = "ac3c06048e02828077cf7757d3d142241429238893b91d529af29a2e8cc5623b"
-- 
1.7.3.4



