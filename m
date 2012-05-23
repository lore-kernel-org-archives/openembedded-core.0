Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDO-0006Ll-DM
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:11 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507189"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:49 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:45 -0700
Message-Id: <f12429468d44d3782eca38603d58b707954996c3.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 30/30] make-3.81: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:12 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../make-3.81/make_fix_for_automake-1.12.patch     |   43 ++++++++++++++++++++
 meta/recipes-devtools/make/make_3.81.bb            |    4 +-
 2 files changed, 46 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch

diff --git a/meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch b/meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..9b2e964
--- /dev/null
+++ b/meta/recipes-devtools/make/make-3.81/make_fix_for_automake-1.12.patch
@@ -0,0 +1,43 @@
+Upstream-Status: Pending
+
+automake 1.12 has depricated automatic de-ANSI-fication support
+
+this patch avoids these kinds of errors:
+
+| configure.in:48: error: automatic de-ANSI-fication support has been removed
+...
+| Makefile.am:19: error: automatic de-ANSI-fication support has been removed
+| autoreconf: automake failed with exit status: 1
+| ERROR: autoreconf execution failed.
+
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/04
+
+Index: make-3.81/configure.in
+===================================================================
+--- make-3.81.orig/configure.in
++++ make-3.81/configure.in
+@@ -44,9 +44,6 @@ AC_AIX
+ AC_ISC_POSIX
+ AC_MINIX
+ 
+-# Needed for ansi2knr
+-AM_C_PROTOTYPES
+-
+ # Enable gettext, in "external" mode.
+ 
+ AM_GNU_GETTEXT_VERSION(0.14.1)
+Index: make-3.81/Makefile.am
+===================================================================
+--- make-3.81.orig/Makefile.am
++++ make-3.81/Makefile.am
+@@ -16,7 +16,7 @@
+ # GNU Make; see the file COPYING.  If not, write to the Free Software
+ # Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA.
+ 
+-AUTOMAKE_OPTIONS = 1.8 dist-bzip2 check-news ansi2knr
++AUTOMAKE_OPTIONS = 1.8 dist-bzip2 check-news
+ ACLOCAL_AMFLAGS	=  -I config
+ 
+ MAKE_HOST =	@MAKE_HOST@
diff --git a/meta/recipes-devtools/make/make_3.81.bb b/meta/recipes-devtools/make/make_3.81.bb
index 9458c39..45ab6ca 100644
--- a/meta/recipes-devtools/make/make_3.81.bb
+++ b/meta/recipes-devtools/make/make_3.81.bb
@@ -1,4 +1,4 @@
-PR = "r0"
+PR = "r1"
 
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
 
 require make.inc
 
+SRC_URI += "file://make_fix_for_automake-1.12.patch"
+
 SRC_URI[md5sum] = "354853e0b2da90c527e35aabb8d6f1e6"
 SRC_URI[sha256sum] = "f3e69023771e23908f5d5592954d8271d3d6af09693cecfd29cee6fde8550dc8"
 
-- 
1.7.7



