Return-Path: <stefanx.stanacar@intel.com>
Received: from mga14.intel.com (unknown [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id B31696F873
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 15:39:57 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 11 Mar 2014 08:39:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,631,1389772800"; d="scan'208";a="346712293"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 11 Mar 2014 08:39:57 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.60])
	by linux.intel.com (Postfix) with ESMTP id 6F5BC6A4007;
	Tue, 11 Mar 2014 08:39:45 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 17:40:09 +0200
Message-Id: <1394552409-7544-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH] lsbtest: fix comparison bashism
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
X-List-Received-Date: Tue, 11 Mar 2014 15:40:00 -0000

== is a bashism use = instead.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 4 ++--
 meta/recipes-extended/lsb/lsbtest_1.0.bb      | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
index 12f0054..ab79985 100644
--- a/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
+++ b/meta/recipes-extended/lsb/lsbtest/LSB_Test.sh
@@ -272,12 +272,12 @@ then
 fi
 
 if ! `grep -F -q "noarch-suse" ${PLATFORM_FILE}`; then
-	if [ ${ARCH} == i686 ];then
+	if [ ${ARCH} = i686 ];then
 		echo "i486-suse" >> ${PLATFORM_FILE}
 		echo "i486-noarch" >> ${PLATFORM_FILE}
 		echo "i486-pc" >> ${PLATFORM_FILE}
 		echo "noarch-suse" >> ${PLATFORM_FILE}
-	elif [ ${ARCH} == x86_64 ]; then
+	elif [ ${ARCH} = x86_64 ]; then
 		echo "i486-suse" >> ${PLATFORM_FILE}
 		echo "i486-noarch" >> ${PLATFORM_FILE}
 		echo "i486-pc" >> ${PLATFORM_FILE}
diff --git a/meta/recipes-extended/lsb/lsbtest_1.0.bb b/meta/recipes-extended/lsb/lsbtest_1.0.bb
index a877beb..f61251e 100644
--- a/meta/recipes-extended/lsb/lsbtest_1.0.bb
+++ b/meta/recipes-extended/lsb/lsbtest_1.0.bb
@@ -19,15 +19,15 @@ do_install() {
 	install -d  ${D}/opt/lsb-test
 	install -m 0644 ${S}/packages_list ${D}/opt/lsb-test/packages_list
 	install -m 0644 ${S}/session ${D}/opt/lsb-test/session
-	if [ "${TARGET_ARCH}" == "i586" ];then
+	if [ "${TARGET_ARCH}" = "i586" ];then
 		sed -i -e 's/lsbarch/ia32/g' -e 's/targetarch/i486/g' ${D}/opt/lsb-test/packages_list
 		sed -i -e 's/targetarch/x86/g' ${D}/opt/lsb-test/session
 	fi
-	if [ "${TARGET_ARCH}" == "x86_64" ];then
+	if [ "${TARGET_ARCH}" = "x86_64" ];then
 		sed -i -e 's/lsbarch/amd64/g' -e 's/targetarch/x86_64/g' ${D}/opt/lsb-test/packages_list
 		sed -i -e 's/targetarch/x86-64/g' ${D}/opt/lsb-test/session
 	fi
-	if [ "${TARGET_ARCH}" == "powerpc" ];then
+	if [ "${TARGET_ARCH}" = "powerpc" ];then
 		sed -i -e 's/lsbarch/ppc32/g' -e 's/targetarch/ppc/g' ${D}/opt/lsb-test/packages_list
 		sed -i -e 's/targetarch/PPC32/g' ${D}/opt/lsb-test/session
 	fi
@@ -37,7 +37,7 @@ do_install() {
 	# in the package_list when MLIB=lib64 is being used.
 	# Otherwise, by default, the ppc32 LSB packages
 	# will be downloaded by LSB_Test.sh
-	if [ "${TARGET_ARCH}" == "powerpc64" ];then
+	if [ "${TARGET_ARCH}" = "powerpc64" ];then
 		if [ "${PN}" != "${BPN}" ];then
 			sed -i -e 's/lsbarch/ppc64/g' -e 's/targetarch/ppc64/g' ${D}/opt/lsb-test/packages_list
 			sed -i -e 's/targetarch/PPC64/g' ${D}/opt/lsb-test/session
-- 
1.8.5.3


