Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDE-0006Ll-D2
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507165"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:47 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:28 -0700
Message-Id: <4295769f82aa07c5481e54f85cd7d79f6f23c76e.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 13/30] libidn: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libidn/libidn_fix_for_automake-1.12.patch      |   26 ++++++++++++++++++++
 meta/recipes-extended/libidn/libidn_1.24.bb        |    5 ++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..20afd25
--- /dev/null
+++ b/meta/recipes-extended/libidn/libidn/libidn_fix_for_automake-1.12.patch
@@ -0,0 +1,26 @@
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| automake: warnings are treated as errors
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libidn.la': linking libtool libraries using a non-POSIX
+| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: libidn-1.24/configure.ac
+===================================================================
+--- libidn-1.24.orig/configure.ac
++++ libidn-1.24/configure.ac
+@@ -34,6 +34,10 @@ AC_SUBST(LT_CURRENT, 17)
+ AC_SUBST(LT_REVISION, 7)
+ AC_SUBST(LT_AGE, 6)
+ 
++# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
++m4_pattern_allow([AM_PROG_AR])
++AM_PROG_AR
++
+ AC_PROG_CC
+ gl_EARLY
+ lgl_EARLY
diff --git a/meta/recipes-extended/libidn/libidn_1.24.bb b/meta/recipes-extended/libidn/libidn_1.24.bb
index 018f118..c6ecea7 100644
--- a/meta/recipes-extended/libidn/libidn_1.24.bb
+++ b/meta/recipes-extended/libidn/libidn_1.24.bb
@@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9c9d9d207a3468a696a03368913d360b \
                     file://COPYINGv3;md5=d32239bcb673463ab874e80d47fae504 \
                     file://lib/idna.h;endline=21;md5=7364f6a250728ffe16170f5e3ab37512 \
                     file://src/idn.c;endline=20;md5=7d7235e7951ac87d9dfac42e1b69d9cb"
-PR = "r0"
+PR = "r1"
 
 inherit pkgconfig autotools gettext
 
-SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz"
+SRC_URI = "${GNU_MIRROR}/libidn/${BPN}-${PV}.tar.gz \
+           file://libidn_fix_for_automake-1.12.patch "
 
 SRC_URI[md5sum] = "764d7258eeb273941680499fab2c7367"
 SRC_URI[sha256sum] = "da1708c6063ecb7951a0908e67df3eacdfe128b18edaa6cf6867d7b73b5f35ff"
-- 
1.7.7



