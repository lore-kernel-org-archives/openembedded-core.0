Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1086C6EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 13:44:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2IDiDv2016769
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 08:44:13 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2IDiDI3000781
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 08:44:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 18 Mar 2014 08:44:12 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s2IDi9vA018843;	Tue, 18 Mar 2014 08:44:11 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 08:44:07 -0500
Message-ID: <1395150247-27937-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCHv2 1/2] pm-qa-utils: Add power management test utils
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
X-List-Received-Date: Tue, 18 Mar 2014 13:44:15 -0000
Content-Type: text/plain

* The power management test utilities from Linaro can be used
  to test multiple PM features such as cpufreq, cpuidle, thermal
  control and suspend operations.
* These utilities are not platform specific and can be used by
  a broader base of users.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Changed the recipe name and directory to pm-qa-utils, removing
      the linaro prefix.
---
 .../pm-qa-utils/pm-qa-utils_git.bb                 |   63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb

diff --git a/meta/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb b/meta/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
new file mode 100644
index 0000000..610f3a7
--- /dev/null
+++ b/meta/recipes-devtools/pm-qa-utils/pm-qa-utils_git.bb
@@ -0,0 +1,63 @@
+DESCRIPTION = "Utilities from Linaro for testing Power Management"
+HOMEPAGE = "https://wiki.linaro.org/WorkingGroups/PowerManagement/Resources/TestSuite/PmQa"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+PV = "0.4.4"
+
+BRANCH ?= "master"
+SRCREV = "fbc2762359b863dfbf4fd0bab1e8abd2a6125ed4"
+
+SRC_URI = "git://git.linaro.org/tools/pm-qa.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+CFLAGS += "-pthread"
+
+do_compile () {
+    # Find all the .c files in this project and build them.
+    for x in `find . -name "*.c"`
+    do
+        util=`echo ${x} | sed s/.c$//`
+        oe_runmake ${util}
+    done
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${bindir}/linaro-pm-qa-include
+
+    # Install the compiled binaries the were built in the previous step
+    for x in `find . -name "*.c"`
+    do
+        util=`echo ${x} | sed s/.c$//`
+        util_basename=`basename ${util}`
+        install -m 0755 ${util} ${D}${bindir}/${util_basename}
+    done
+
+    # Install the helper scripts in the include directory
+    for script in `find . -name "*.sh" | grep include`
+    do
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
+        script_basename=`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/linaro-pm-qa-include/${script_basename}
+    done
+
+    # Install the shell scripts NOT in the include directory since those
+    # will be installed elsewhere
+    for script in `find . -name "*.sh" | grep -v include`
+    do
+        # if the script includes any helper scripts from the include
+        # directory then change the include path to the absolute path
+        # to reflect the install location of the helper scripts.
+        sed -i -e "s#source ../include#source ${bindir}/linaro-pm-qa-include#g" ${script}
+        # Remove hardcoded relative paths
+        sed -i -e 's#..\/utils\/##' ${script}
+
+        script_basename=`basename ${script}`
+        install -m 0755 $script ${D}${bindir}/${script_basename}
+    done
+}
-- 
1.7.9.5


