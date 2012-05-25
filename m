Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPG-0000Cj-C8
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:51 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115461"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:15 -0700
Message-Id: <94c98aff24e8e04c1963722249d2ddcb6e042687.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 36/45] make-3.81: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:53:54 -0000

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
1.7.7.6



