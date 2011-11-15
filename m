Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQBz-0001VX-JV
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410722"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:42 -0800
Message-Id: <86e2424d8e06ae75884b0d8a30fc760a48d9889c.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
In-Reply-To: <cover.1321389699.git.sgw@linux.intel.com>
References: <cover.1321389699.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/16] gnu-config: Create 2011111 release
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:21 -0000

Use a yoctoproject.org based tarball since gnu-config is required very
early on in the native build process, we do not want to rely on git, which
can cause a circular dependency issue.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnu-config/gnu-config_20111111.bb              |   41 ++++++++++++++++++++
 1 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gnu-config/gnu-config_20111111.bb

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb b/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
new file mode 100644
index 0000000..27400c6
--- /dev/null
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
@@ -0,0 +1,41 @@
+SUMMARY = "gnu-configize"
+DESCRIPTION = "Tool that installs the GNU config.guess / config.sub into a directory tree"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://config.guess;endline=39;md5=a3669d051b3a8408d69751e53b2e1cc1"
+
+DEPENDS_virtclass-native = "perl-native-runtime"
+
+INHIBIT_DEFAULT_DEPS = "1"
+
+PR = "r0"
+
+SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-yocto-${PV}.tgz \
+	   file://config-guess-uclibc.patch \
+           file://gnu-configize.in"
+
+SRC_URI[md5sum] = "30be385c919a25cd9522205ef49e5328"
+SRC_URI[sha256sum] = "0750afa8d8ee988b6ead1c2d02b565597f809e2e3ad14886ed7803d3bbc8b0cd"
+
+do_compile() {
+	:
+}
+
+do_install () {
+	install -d ${D}${datadir}/gnu-config \
+		   ${D}${bindir}
+	cat ${WORKDIR}/gnu-configize.in | \
+		sed -e 's,@gnu-configdir@,${datadir}/gnu-config,g' \
+		    -e 's,@autom4te_perllibdir@,${datadir}/autoconf,g' > ${D}${bindir}/gnu-configize
+	# In the native case we want the system perl as perl-native can't have built yet
+	if [ "${BUILD_ARCH}" != "${TARGET_ARCH}" ]; then
+		sed -i -e 's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize
+	fi
+	chmod 755 ${D}${bindir}/gnu-configize
+	install -m 0644 config.guess config.sub ${D}${datadir}/gnu-config/
+}
+
+PACKAGES = "${PN}"
+FILES_${PN} = "${bindir} ${datadir}/gnu-config"
+
+BBCLASSEXTEND = "native"
-- 
1.7.6.4



