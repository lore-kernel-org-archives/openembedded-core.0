Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A458B77002
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 22:02:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 03 Sep 2015 15:02:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,464,1437462000"; d="scan'208";a="782247229"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2015 15:02:50 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Sep 2015 22:01:02 +0000
Message-Id: <1441317662-42022-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] distutils.bbclass: Handle python-backport modules
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
X-List-Received-Date: Thu, 03 Sep 2015 22:02:50 -0000

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
 meta/classes/distutils.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/distutils.bbclass b/meta/classes/distutils.bbclass
index 2498685..82f93d8 100644
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
@@ -73,6 +72,13 @@ distutils_do_install() {
             mv -f ${D}${datadir}/share/* ${D}${datadir}/
             rmdir ${D}${datadir}/share
         fi
+	
+	
+	if [ -e ${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/backports/__init__.py ]; then
+	rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.py;
+	rm ${D}${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc;
+	#FILES_${PN}_remove = "${PYTHON_SITEPACKAGES_DIR}/backports/__init__.pyc";
+	fi
 }
 
 EXPORT_FUNCTIONS do_compile do_install
-- 
1.8.4.5


