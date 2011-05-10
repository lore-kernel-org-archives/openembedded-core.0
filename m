Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVP-0001Xh-3v
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:11 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; 
   d="scan'208";a="163200"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2011 22:26:26 -0700
Message-Id: <118af5382d7c13327de95c46e4976ed7863ba3d0.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Sun, 8 May 2011 18:13:14 +0000
Date: Mon, 09 May 2011 22:26:26 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 26/30] qmake_base.bbclass: add generate_qt_config_file task
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
X-List-Received-Date: Tue, 10 May 2011 05:29:12 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

This writes a qt.conf inside WORKDIR to properly configure projects
based on CMake. This is required since qmake variables (returned
by -query command) are fixed into the binary and can only be
changed using a qt.conf file.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/qmake_base.bbclass |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/meta/classes/qmake_base.bbclass b/meta/classes/qmake_base.bbclass
index 24a0f11..37c44c7 100644
--- a/meta/classes/qmake_base.bbclass
+++ b/meta/classes/qmake_base.bbclass
@@ -31,6 +31,21 @@ oe_qmake_mkspecs () {
     done
 }
 
+do_generate_qt_config_file() {
+	export QT_CONF_PATH=${WORKDIR}/qt.conf
+	bbwarn "${WORKDIR}/qt.conf"
+	cat > ${WORKDIR}/qt.conf <<EOF
+[Paths]
+Prefix = ${STAGING_DIR}
+Binaries = ${BUILD_SYS}${bindir_native}
+Headers = ${MACHINE}${prefix}/include/qt4
+Plugins = ${MACHINE}${prefix}/lib/qt4/plugins/
+Mkspecs = ${MACHINE}${prefix}/share/qt4/mkspecs/
+EOF
+}
+
+addtask generate_qt_config_file after do_patch before do_configure
+
 qmake_base_do_configure() {
 	case ${QMAKESPEC} in
 	*linux-oe-g++|*linux-uclibc-oe-g++|*linux-gnueabi-oe-g++)
-- 
1.7.1.1



