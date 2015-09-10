Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DBC4960132
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 15:53:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 10 Sep 2015 08:53:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,505,1437462000"; d="scan'208";a="802384389"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2015 08:53:36 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Sep 2015 15:51:33 +0000
Message-Id: <1441900293-11027-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH v2] distutils.bbclass: Handle python-backport modules
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
X-List-Received-Date: Thu, 10 Sep 2015 15:53:42 -0000

When installing backport modules they stumble upon each other, complaining with
the following error:

ERROR: The recipe python-backports-ssl is trying to install files into a shared
area when those files already exist.

This is the correct behavior since thats just the way they were designed, all backport
modules provide an __init__.py file (the same among all packages), and without it they
simply wouldnt work.

distutils handles FILES_${PN}* variables for python packages, but it uses wildcards
to include the required files, hence removing the __init__.py files from each backport
package during build time is impossible since it doenst actually contain that value,
this patch simply removes the __init__.py* files from the staging area if they already
exist on sysroot, this way, these are not included in FILES_${PN} anymore, fixing the
issue mentioned above.

[YOCTO #8207]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/classes/distutils.bbclass | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 2498685..42b13f5 100644
--- a/meta/classes/distutils.bbclass
+++ b/meta/classes/distutils.bbclass
@@ -44,7 +44,6 @@ distutils_do_install() {
         # support filenames with *spaces*
         # only modify file if it contains path  and recompile it
         find ${D} -name "*.py" -exec grep -q ${D} {} \; -exec sed -i -e s:${D}::g {} \; -exec ${STAGING_BINDIR_NATIVE}/python-native/python -mcompileall {} \;
-
         if test -e ${D}${bindir} ; then	
             for i in ${D}${bindir}/* ; do \
                 if [ ${PN} != "${BPN}-native" ]; then
@@ -73,6 +72,12 @@ distutils_do_install() {
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
             rmdir ${D}${datadir}/share
         fi
+
+	# Fix backport modules
+	if test -e ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/backports/__init__.py && test -e ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py; then
+	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py;
+	   rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc;
+	fi
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
1.8.4.5


