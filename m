Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEh-0005Qy-Pj
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:36 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Apr 2011 00:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="684550452"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by fmsmga002.fm.intel.com with ESMTP; 27 Apr 2011 00:30:02 -0700
Message-Id: <a6b3a79dcd51e17f3e6300db2d25c248638a5d2c.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 21 Apr 2011 11:48:52 -0700
Date: Wed, 27 Apr 2011  0:30:01 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 40/52] gettext: Divide packaging into gettext-runtime and rest
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:36 -0000

From: Khem Raj <raj.khem@gmail.com>

This helps in footprint on space constrained systems e.g.
uclibc based systems where packaging full gettext just for
libintl can be waste of space.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/gettext/gettext_0.17.bb |   35 +++++++++++++++++++++++++---
 1 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.17.bb b/meta/recipes-core/gettext/gettext_0.17.bb
index b9c4e1c..bfcb5ea 100644
--- a/meta/recipes-core/gettext/gettext_0.17.bb
+++ b/meta/recipes-core/gettext/gettext_0.17.bb
@@ -53,9 +53,36 @@ acpaths = '-I ${S}/autoconf-lib-link/m4/ \
 # 1300    KiB /ep93xx/uclibc-dev_0.9.29-r8_ep93xx.ipk
 # 140     KiB /armv4t/gettext-dev_0.14.1-r6_armv4t.ipk
 # 4       KiB /ep93xx/libgcc-s-dev_4.2.2-r2_ep93xx.ipk
+PACKAGES =+ "gettext-runtime gettext-runtime-dev gettext-runtime-doc"
 
-PACKAGES =+ "libgettextlib libgettextsrc"
-FILES_libgettextlib = "${libdir}/libgettextlib-*.so*"
-FILES_libgettextsrc = "${libdir}/libgettextsrc-*.so*"
-
+FILES_gettext-runtime = "${bindir}/gettext \
+                         ${bindir}/ngettext \
+                         ${bindir}/envsubst \
+                         ${bindir}/gettext.sh \
+                         ${libdir}/libasprintf.so* \
+                         ${libdir}/GNU.Gettext.dll \
+                        "
+FILES_gettext-runtime_append_libc-uclibc = " ${libdir}/libintl.so* \
+                                             ${libdir}/charset.alias \
+                                           "
+FILES_gettext-runtime-dev += "${libdir}/libasprintf.a \
+                      ${includedir}/autosprintf.h \
+                     "
+FILES_gettext-runtime-dev_append_libc-uclibc = " ${libdir}/libintl.a \
+                                                 ${includedir}/libintl.h \
+                                               "
+FILES_gettext-runtime-doc = "${mandir}/man1/gettext.* \
+                             ${mandir}/man1/ngettext.* \
+                             ${mandir}/man1/envsubst.* \
+                             ${mandir}/man1/.* \
+                             ${mandir}/man3/* \
+                             ${docdir}/gettext/gettext.* \
+                             ${docdir}/gettext/ngettext.* \
+                             ${docdir}/gettext/envsubst.* \
+                             ${docdir}/gettext/*.3.html \
+                             ${datadir}/gettext/ABOUT-NLS \
+                             ${docdir}/gettext/csharpdoc/* \
+                             ${docdir}/libasprintf/autosprintf.html \
+                             ${infodir}/autosprintf.info \
+                            "
 BBCLASSEXTEND = "native nativesdk"
-- 
1.7.1.1



