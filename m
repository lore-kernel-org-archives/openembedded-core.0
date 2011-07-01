Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QcfXC-0007rR-Gn
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:21:35 +0200
Received: by rex (Postfix, from userid 1000)
	id A94792FE96; Fri,  1 Jul 2011 16:17:29 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 16:17:21 +0100
Message-Id: <d12762f5a027f72d03f22b5cd7f34b7b1a92961e.1309533254.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
References: <c201845df210143f3170eca54c9870f7e20be47a.1309533254.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
References: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/6] libpcre: Fix QA warnings
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
X-List-Received-Date: Fri, 01 Jul 2011 15:21:35 -0000

From: Richard  Purdie <richard.purdie@linuxfoundation.org>

This drops the split -dev packaging since it was broken and overcomplex. It ensures .so
symlinks end up in the correct package.

Signed-off-by: Richard  Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/libpcre/libpcre_8.12.bb |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/libpcre/libpcre_8.12.bb b/meta/recipes-support/libpcre/libpcre_8.12.bb
index 0301ddb..33003c5 100644
--- a/meta/recipes-support/libpcre/libpcre_8.12.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.12.bb
@@ -5,7 +5,7 @@ provides a POSIX calling interface to PCRE; the regular expressions \
 themselves still follow Perl syntax and semantics. The header file for \
 the POSIX-style functions is called pcreposix.h."
 SECTION = "devel"
-PR = "r0"
+PR = "r1"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=77f9b14fe707d0376d89bc162e6c54ff"
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
@@ -45,11 +45,7 @@ do_compile () {
 
 python populate_packages_prepend () {
 	pcre_libdir = bb.data.expand('${libdir}', d)
-	pcre_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
-	do_split_packages(d, pcre_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'libpcre %s development package', extra_depends='${PN}-dev', allow_links=True)
-	do_split_packages(d, pcre_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'libpcre %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, pcre_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'libpcre %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, pcre_libdir, '^lib(.*)\.so\.*', 'lib%s', 'libpcre %s library', extra_depends='', allow_links=True)
+	do_split_packages(d, pcre_libdir, '^lib(.*)\.so\.+', 'lib%s', 'libpcre %s library', extra_depends='', allow_links=True)
 }
 
 FILES_${PN} = "${libdir}/libpcre.so.*"
-- 
1.7.4.1



