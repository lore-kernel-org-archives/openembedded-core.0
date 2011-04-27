Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzES-0005Ol-JZ
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="739028460"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2011 00:29:48 -0700
Message-Id: <5054fd5af9f2ff06924fa59459a26d965c555a18.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 21:00:44 -0700
Date: Wed, 27 Apr 2011  0:29:48 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 27/52] attr: Fix compilation on uclibc
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:20 -0000

From: Khem Raj <raj.khem@gmail.com>

It needs -lintl added to LDFLAGS for uclibc

inherit gettext class instead of adding gettext to DEPENDS directly

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/attr/attr.inc   |    4 ++++
 meta/recipes-support/attr/ea-acl.inc |    4 +---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index c110340..b2ed9a1 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -20,3 +20,7 @@ do_install_append() {
 	sed -i ${D}${libdir}/libattr.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
+
+# Only append ldflags for target recipe
+LDFLAGS_libc-uclibc += "${@['', '-lintl']['${PN}' == '${BPN}']}"
+
diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index bc93107..a09c31c 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -1,11 +1,9 @@
 # this build system is mostly shared by attr and acl
 
-DEPENDS =+ "gettext"
-
 SRC_URI += "file://relative-libdir.patch;striplevel=0 \
             file://no-fixed-prog-path.patch"
 
-inherit autotools
+inherit autotools gettext
 
 # the package comes with a custom config.h.in, it cannot be
 # overwritten by autoheader
-- 
1.7.1.1



