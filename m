Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4958C734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 05:21:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t765LaYe004800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Aug 2015 22:21:36 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 5 Aug 2015 22:21:36 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 6 Aug 2015 13:18:43 +0800
Message-ID: <1438838323-25159-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] attr: drop sstate fix and narrow relative-libdir.patch to target
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
X-List-Received-Date: Thu, 06 Aug 2015 05:21:43 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The relative-libdir.patch is no longer needed for native since fix_symlink
for native has been added to revert what it done, Also this patch and
fix_symlink add a race condition since both libacl.so and libattr.so were
created, then removed, and then recreated.

So Only keep relative-libdir.patch for the target.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/attr/ea-acl.inc | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-support/attr/ea-acl.inc b/meta/recipes-support/attr/ea-acl.inc
index 474291a..64df16e 100644
--- a/meta/recipes-support/attr/ea-acl.inc
+++ b/meta/recipes-support/attr/ea-acl.inc
@@ -1,6 +1,7 @@
 # this build system is mostly shared by attr and acl
 
-SRC_URI += "file://relative-libdir.patch;striplevel=0 \
+SRC_URI_append_class-target = " \
+           file://relative-libdir.patch;striplevel=0 \
            "
 
 inherit autotools-brokensep gettext
@@ -25,23 +26,3 @@ BBCLASSEXTEND = "native"
 # Only append ldflags for target recipe and if USE_NLS is enabled
 LDFLAGS_append_libc-uclibc_class-target = "${@['', ' -lintl '][(d.getVar('USE_NLS', True) == 'yes')]}"
 EXTRA_OECONF_append_libc-uclibc_class-target = "${@['', ' --disable-gettext '][(d.getVar('USE_NLS', True) == 'no')]}"
-
-fix_symlink () {
-	if test "${libdir}" = "${base_libdir}" ; then
-		return
-	fi
-	# Remove bad symlinks & create the correct symlinks
-	if test -L ${libdir}/lib${BPN}.so ; then
-		rm -rf ${libdir}/lib${BPN}.so
-		ln -sf ${base_libdir}/lib${BPN}.so ${libdir}/lib${BPN}.so
-	fi
-	if test -L ${base_libdir}/lib${BPN}.a ; then
-		rm -rf ${base_libdir}/lib${BPN}.a
-		ln -sf ${libdir}/lib${BPN}.a ${base_libdir}/lib${BPN}.a
-	fi
-	if test -L  ${base_libdir}/lib${BPN}.la ; then
-		rm -rf ${base_libdir}/lib${BPN}.la
-		ln -sf ${libdir}/lib${BPN}.la ${base_libdir}/lib${BPN}.la
-	fi
-}
-SSTATEPOSTINSTFUNCS_class-native += "fix_symlink"
-- 
1.9.1


