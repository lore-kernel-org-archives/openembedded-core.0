Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9224673689
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 17:53:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Mar 2015 10:53:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,431,1422950400"; d="scan'208";a="701173407"
Received: from yctb03.ostc.intel.com (HELO yctb03.otcr.jf.intel.com)
	([10.23.219.52])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2015 10:53:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 09:47:59 +0000
Message-Id: <9edc589ecf1a1554efeb23e4e71306476f790723.1426758356.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1426758356.git.anibal.limon@linux.intel.com>
References: <cover.1426758356.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1426758356.git.anibal.limon@linux.intel.com>
References: <cover.1426758356.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 2/2] initscripts: Add changetodefaultvt for 1, 2, 3, 4 runlevels
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
X-List-Received-Date: Thu, 19 Mar 2015 17:53:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When change between runlevel 5 to another non-graphic runlevel
the console stays in the tty where X was launched.

This patchs add a default switch to tty1.

[YOCTO #5336]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../initscripts/initscripts-1.0/changetodefaultvt.sh           | 10 ++++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb               |  6 ++++++
 2 files changed, 16 insertions(+)
 create mode 100755 meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh b/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
new file mode 100755
index 0000000..bbef7ed
--- /dev/null
+++ b/meta/recipes-core/initscripts/initscripts-1.0/changetodefaultvt.sh
@@ -0,0 +1,10 @@
+#!/bin/sh 
+### BEGIN INIT INFO
+# Provides:             changetodefaultvt
+# Required-Start:
+# Required-Stop:
+# Default-Start:        1 2 3 4
+# Default-Stop:
+### END INIT INFO
+
+chvt 1
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index dfb75b2..e0841cf 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -33,6 +33,7 @@ SRC_URI = "file://functions \
            file://GPLv2.patch \
            file://dmesg.sh \
            file://logrotate-dmesg.conf \
+           file://changetodefaultvt.sh \
 "
 
 S = "${WORKDIR}"
@@ -100,6 +101,7 @@ do_install () {
 	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
 	install -m 0755    ${WORKDIR}/dmesg.sh		${D}${sysconfdir}/init.d
 	install -m 0644    ${WORKDIR}/logrotate-dmesg.conf ${D}${sysconfdir}/
+	install -m 0755    ${WORKDIR}/changetodefaultvt.sh	${D}${sysconfdir}/init.d
 
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 		install -m 0755 ${WORKDIR}/alignment.sh	${D}${sysconfdir}/init.d
@@ -112,6 +114,10 @@ do_install () {
 #
 # Create runlevel links
 #
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'true', 'false', d)}; then
+		update-rc.d -r ${D} changetodefaultvt.sh start 99 1 2 3 4 .
+	fi
+
 	update-rc.d -r ${D} rmnologin.sh start 99 2 3 4 5 .
 	update-rc.d -r ${D} sendsigs start 20 0 6 .
 	update-rc.d -r ${D} urandom start 30 S 0 6 .
-- 
1.8.4.5


