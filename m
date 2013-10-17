Return-Path: <eric@eukrea.com>
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by mail.openembedded.org (Postfix) with ESMTP id EDEA460FF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 17:12:32 +0000 (UTC)
Received: from buildor.local.eukrea.com (unknown [88.170.243.169])
	by smtp1-g21.free.fr (Postfix) with ESMTP id 7389694017B;
	Thu, 17 Oct 2013 19:12:29 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: ross.burton@intel.com
Date: Thu, 17 Oct 2013 19:12:52 +0200
Message-Id: <1382029973-14663-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH for danny 1/2] gcc: fix compilation with 4.8 host
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
X-List-Received-Date: Thu, 17 Oct 2013 17:12:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |  1 +
 .../gcc/gcc-4.7/gcc-fix-for-4.8-host.patch         | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/gcc-fix-for-4.8-host.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index c28823d..d333301 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -75,6 +75,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch \
 	   file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
 	   file://disable-texinfo-5.patch \
+	   file://gcc-fix-for-4.8-host.patch \
 	  "
 SRC_URI[md5sum] = "cc308a0891e778cfda7a151ab8a6e762"
 SRC_URI[sha256sum] = "8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/gcc-fix-for-4.8-host.patch b/meta/recipes-devtools/gcc/gcc-4.7/gcc-fix-for-4.8-host.patch
new file mode 100644
index 0000000..c688fe5
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/gcc-fix-for-4.8-host.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Backport
+Signed-off-by: Eric Bénard <eric@eukrea.com>
+
+Details :
+http://gcc.gnu.org/@/bugzilla/show_bug.cgi?id=56927
+http://gcc.gnu.org/viewcvs/gcc?view=revision&revision=191605
+
+branches/gcc-4_7-bichard Guenther  <rguenther@suse.de>
+
+	PR middle-end/54638
+	Backport from mainline
+	2012-04-19  Richard Guenther  <rguenther@suse.de>
+
+	* ira-int.h (ira_allocno_object_iter_cond): Avoid out-of-bound
+	array access.
+
+---
+
+--- gcc-4_7-branch/gcc/ira-int.h        2012/09/21 10:08:35     191605                                                                                                                                       
++++ gcc-4_7-branch/gcc/ira-int.h	2012/09/21 10:08:35	191605
+@@ -1138,8 +1138,13 @@
+ ira_allocno_object_iter_cond (ira_allocno_object_iterator *i, ira_allocno_t a,
+ 			      ira_object_t *o)
+ {
+-  *o = ALLOCNO_OBJECT (a, i->n);
+-  return i->n++ < ALLOCNO_NUM_OBJECTS (a);
++  int n = i->n++;
++  if (n < ALLOCNO_NUM_OBJECTS (a))
++    {
++      *o = ALLOCNO_OBJECT (a, n);
++      return true;
++    }
++  return false;
+ }
+ 
+ /* Loop over all objects associated with allocno A.  In each
+
-- 
1.8.4.rc3


