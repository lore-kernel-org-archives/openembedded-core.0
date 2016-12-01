Return-Path: <linus.svensson@axis.com>
X-Greylist: delayed 308 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 Dec 2016 16:29:06 UTC
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C98271B2C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 16:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8F7AC1846D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:24:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BBIosEMa9XXC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:24:00 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 674121846A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:24:00 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EA191E09E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:24:00 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 42D6A1E09C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:24:00 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:24:00 +0100 (CET)
Received: from lnxlinussn.se.axis.com (lnxlinussn.se.axis.com [10.94.48.1])
	by seth.se.axis.com (Postfix) with ESMTP id 365CE584
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 17:24:00 +0100 (CET)
Received: by lnxlinussn.se.axis.com (Postfix, from userid 21014)
	id 2E7973A099; Thu,  1 Dec 2016 17:24:00 +0100 (CET)
From: linus.svensson@axis.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2016 17:23:38 +0100
Message-Id: <1480609418-3264-3-git-send-email-linus.svensson@axis.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
References: <1480609418-3264-1-git-send-email-linus.svensson@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 3/3] meson.bbclass: Add meson.bbclass
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
X-List-Received-Date: Thu, 01 Dec 2016 16:29:08 -0000

From: Linus Svensson <linussn@axis.com>

Add a class for packages that uses the meson build system.

Meson uses a cross-file that contain needed tools and information about
the host and target system. Such a file will be created in {WORKDIR}.

Meson only allows installation directories to be specified as relative
to prefix, except for sysconfdir, which can be absolute.

This patch is based on a prototype patch by
Ross Burton <ross.burton@intel.com>.

Signed-off-by: Linus Svensson <linussn@axis.com>
---
 meta/classes/meson.bbclass | 86 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 meta/classes/meson.bbclass

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
new file mode 100644
index 0000000..5a04134
--- /dev/null
+++ b/meta/classes/meson.bbclass
@@ -0,0 +1,86 @@
+inherit python3native
+
+DEPENDS_append = " meson-native ninja-native"
+
+# As Meson enforces out-of-tree builds we can just use cleandirs
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+# Where the meson.build build configuration is
+MESON_SOURCEPATH = "${S}"
+
+# These variables in the environment override the *native* tools not the cross,
+# so they need to be unexported.
+CC[unexport] = "1"
+
+def noprefix(var, d):
+    return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
+
+MESONOPTS = " --prefix ${prefix} \
+              --bindir ${@noprefix('bindir', d)} \
+              --datadir ${@noprefix('datadir', d)} \
+              --libdir ${@noprefix('libdir', d)} \
+              --libexecdir ${@noprefix('libexecdir', d)} \
+              --includedir ${@noprefix('includedir', d)} \
+              --mandir ${@noprefix('mandir', d)} \
+              --localedir ${@noprefix('localedir', d)} \
+              --sysconfdir ${sysconfdir}"
+
+MESON_C_ARGS = "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
+
+MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"
+MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"
+
+EXTRA_OEMESON += "${PACKAGECONFIG_CONFARGS}"
+
+def meson_array(var, d):
+    return "', '".join(d.getVar(var, True).split()).join(("'", "'"))
+
+addtask write_config before do_configure
+do_write_config[vardeps] += "MESON_C_ARGS TOOLCHAIN_OPTIONS"
+do_write_config() {
+    # This needs to be Py to split the args into single-element lists
+    cat >${WORKDIR}/meson.cross <<EOF
+[binaries]
+c = '${HOST_PREFIX}gcc'
+cpp = '${HOST_PREFIX}gcc'
+ar = '${HOST_PREFIX}ar'
+ld = '${HOST_PREFIX}ld'
+strip = '${HOST_PREFIX}strip'
+readelf = '${HOST_PREFIX}readelf'
+pkgconfig = 'pkg-config'
+
+[properties]
+c_args = [${@meson_array('MESON_C_ARGS', d)}]
+c_link_args = [${@meson_array('TOOLCHAIN_OPTIONS', d)}]
+
+[host_machine]
+system = '${HOST_OS}'
+cpu_family = '${HOST_ARCH}'
+cpu = '${HOST_ARCH}'
+endian = '${MESON_HOST_ENDIAN}'
+
+[target_machine]
+system = '${TARGET_OS}'
+cpu_family = '${TARGET_ARCH}'
+cpu = '${TARGET_ARCH}'
+endian = '${MESON_TARGET_ENDIAN}'
+EOF
+}
+
+meson_do_configure() {
+    if ! meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" --cross-file ${WORKDIR}/meson.cross ${EXTRA_OEMESON}; then
+        cat ${B}/meson-logs/meson-log.txt
+        bbfatal_log meson failed
+    fi
+}
+
+meson_do_compile() {
+    ninja ${PARALLEL_MAKE}
+}
+
+meson_do_install() {
+    DESTDIR='${D}' ninja ${PARALLEL_MAKEINST} install
+}
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.1.4


