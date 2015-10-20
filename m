Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 858BA770CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 16:29:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9KGTdLb027320
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Oct 2015 09:29:39 -0700 (PDT)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 20 Oct 2015 09:29:39 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Oct 2015 11:29:37 -0500
Message-ID: <1445358577-170269-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1445358577-170269-1-git-send-email-mark.hatle@windriver.com>
References: <1445358577-170269-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] gcc-target.inc: Add support for executable thats may have a suffix
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
X-List-Received-Date: Tue, 20 Oct 2015 16:29:42 -0000
Content-Type: text/plain

In the past GCC has used a wildcard to permit generating executables
that may have a suffix, such as .exe.  This wild card was lost in one
of the updates.  Adding the wild card back in fixes a number of issues
when generating a mingw gcc.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index 6e160c0..d62c15a 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -31,7 +31,7 @@ PACKAGES = "\
 
 FILES_${PN} = "\
     ${bindir}/${TARGET_PREFIX}gcc* \
-    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2 \
+    ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/collect2* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lto* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/lib*${SOLIBS} \
@@ -83,20 +83,20 @@ FILES_gfortran-symlinks = "\
     ${bindir}/f95"
 
 FILES_cpp = "\
-    ${bindir}/${TARGET_PREFIX}cpp \
+    ${bindir}/${TARGET_PREFIX}cpp* \
     ${base_libdir}/cpp \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
 FILES_cpp-symlinks = "${bindir}/cpp"
 
-FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov \
-    ${bindir}/${TARGET_PREFIX}gcov-tool \
+FILES_gcov = "${bindir}/${TARGET_PREFIX}gcov* \
+    ${bindir}/${TARGET_PREFIX}gcov-tool* \
 "
 FILES_gcov-symlinks = "${bindir}/gcov \
     ${bindir}/gcov-tool \
 "
 
 FILES_g++ = "\
-    ${bindir}/${TARGET_PREFIX}g++ \
+    ${bindir}/${TARGET_PREFIX}g++* \
     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1plus \
 "
 FILES_g++-symlinks = "\
@@ -141,7 +141,7 @@ do_install () {
 	cd ${D}${bindir}
 
 	# We care about g++ not c++
-	rm -f *c++
+	rm -f *c++*
 
 	# We don't care about the gcc-<version> ones for this
 	rm -f *gcc-?.?*
-- 
1.9.3


