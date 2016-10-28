Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 57D7471D60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:20 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878812"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:21 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:25 +0300
Message-Id: <ac3aa0680e7c18551c5b18bd2f3fa13ecf9613d2.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 22/26] iputils: do not build or install manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:20 -0000

This allows dropping the SGML stack dependency, and iputils is the
only package in oe-core that still needs it (for manpages only).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/iputils/iputils_s20151218.bb | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20151218.bb b/meta/recipes-extended/iputils/iputils_s20151218.bb
index 7150454..0d4dd1b 100644
--- a/meta/recipes-extended/iputils/iputils_s20151218.bb
+++ b/meta/recipes-extended/iputils/iputils_s20151218.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://ping.c;beginline=1;endline=35;md5=f9ceb201733e9a6cf8f
                     file://arping.c;beginline=1;endline=11;md5=fe84301b5c2655c950f8b92a057fafa6 \
                     file://tftpd.c;beginline=1;endline=32;md5=28834bf8a91a5b8a92755dbee709ef96 "
 
-DEPENDS = "gnutls docbook-utils-native sgmlspl-native libcap libgcrypt"
+DEPENDS = "gnutls libcap libgcrypt"
 
 
 SRC_URI = "http://www.skbuff.net/iputils/${BPN}-${PV}.tar.bz2 \
@@ -30,11 +30,11 @@ UPSTREAM_CHECK_REGEX = "iputils-(?P<pver>s\d+).tar"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
 do_compile () {
-	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" all man
+	oe_runmake 'CC=${CC} -D_GNU_SOURCE' VPATH="${STAGING_LIBDIR}:${STAGING_DIR_HOST}/${base_libdir}" all
 }
 
 do_install () {
-	install -m 0755 -d ${D}${base_bindir} ${D}${mandir}/man8
+	install -m 0755 -d ${D}${base_bindir}
 	# SUID root programs
 	install -m 4555 ping ${D}${base_bindir}/ping
 	install -m 4555 ping6 ${D}${base_bindir}/ping6
@@ -44,10 +44,6 @@ do_install () {
 	for i in arping tracepath tracepath6; do
 	  install -m 0755 $i ${D}${base_bindir}/
 	done
-	# Manual pages for things we build packages for
-	for i in tracepath.8 traceroute6.8 ping.8 arping.8; do
-	  install -m 0644 doc/$i ${D}${mandir}/man8/ || true
-	done
 }
 
 inherit update-alternatives
@@ -73,4 +69,3 @@ FILES_${PN}-tracepath = "${base_bindir}/tracepath"
 FILES_${PN}-tracepath6 = "${base_bindir}/tracepath6"
 FILES_${PN}-traceroute6	= "${base_bindir}/traceroute6"
 FILES_${PN}-clockdiff = "${base_bindir}/clockdiff"
-FILES_${PN}-doc	= "${mandir}/man8"
-- 
2.9.3


