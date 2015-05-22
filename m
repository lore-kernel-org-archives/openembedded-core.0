Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EA3596E26B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 18:52:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2015 11:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,477,1427785200"; d="scan'208";a="497168869"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com) ([10.252.3.49])
	by FMSMGA003.fm.intel.com with ESMTP; 22 May 2015 11:52:06 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 21:51:52 +0300
Message-Id: <e5260dbf168f3c51d9114e4c4cb1fca49abc83b1.1432320274.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
In-Reply-To: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
References: <cover.1432320274.git.tanu.kaskinen@linux.intel.com>
Subject: [PATCH v3 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Fri, 22 May 2015 18:52:12 -0000

When PulseAudio is installed, alsa-plugins is needed to provide
compatibility for ALSA applications.

The dependencies are set up so that pulseaudio-server depends on
alsa-plugins-pulseaudio-conf, and alsa-plugins-pulseaudio-conf depends
on the PulseAudio plugins. This should make the ALSA->PulseAudio
compatibility configuration work out of the box, while leaving the
PulseAudio specific configuration out on systems that don't have
pulseaudio-server installed.

The alsa-plugins recipes in meta-guacamayo and meta-webos were used as
references, but this recipe is not a straight copy of either.

Signed-off-by: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
---
 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 100 +++++++++++++++++++++
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   5 ++
 2 files changed, 105 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
new file mode 100644
index 0000000..39ed5fa
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
@@ -0,0 +1,100 @@
+DESCRIPTION = "ALSA Plugins"
+HOMEPAGE = "http://alsa-project.org"
+SECTION = "multimedia"
+
+# The primary license of alsa-plugins is LGPLv2.1.
+#
+# m4/attributes.m4 is licensed under GPLv2+. m4/attributes.m4 is part of the
+# build system, and doesn't affect the licensing of the build result.
+#
+# The samplerate plugin source code is licensed under GPLv2+ to be consistent
+# with the libsamplerate license.
+LICENSE = "LGPLv2.1 & GPLv2+"
+LIC_FILES_CHKSUM = "\
+        file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
+        file://COPYING.GPL;md5=94d55d512a9ba36caa9b7df079bae19f \
+        file://m4/attributes.m4;endline=33;md5=b25958da44c02231e3641f1bccef53eb \
+        file://rate/rate_samplerate.c;endline=19;md5=f3d3ce0b189846a486517d97a854b276 \
+"
+
+SRC_URI = "ftp://ftp.alsa-project.org/pub/plugins/${BP}.tar.bz2"
+SRC_URI[md5sum] = "a66797b4471e3cbe96575207bfbe252c"
+SRC_URI[sha256sum] = "325d85cac285f632b83e0191ae3f348bad03c1f007b937042f164abb81ea6532"
+
+DEPENDS += "alsa-lib"
+
+inherit autotools pkgconfig
+
+PACKAGECONFIG ??= "\
+        samplerate \
+        speex \
+        ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
+"
+PACKAGECONFIG[avcodec] = "--enable-avcodec,--disable-avcodec,libav"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[maemo-plugin] = "--enable-maemo-plugin,--disable-maemo-plugin"
+PACKAGECONFIG[maemo-resource-manager] = "--enable-maemo-resource-manager,--disable-maemo-resource-manager,dbus"
+PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
+PACKAGECONFIG[samplerate] = "--enable-samplerate,--disable-samplerate,libsamplerate0"
+PACKAGECONFIG[speex] = "--with-speex=lib,--with-speex=no,speex"
+
+PACKAGES += "alsa-plugins-pulseaudio-conf"
+
+PACKAGES_DYNAMIC = "^libasound-module-.*"
+
+# The alsa-plugins package doesn't itself contain anything, it just depends on
+# all built plugins.
+ALLOW_EMPTY_${PN} = "1"
+
+do_install_append() {
+	rm ${D}${libdir}/alsa-lib/*.la
+
+	# We use the example as is, so just drop the .example suffix.
+	mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
+}
+
+python populate_packages_prepend() {
+    plugindir = bb.data.expand('${libdir}/alsa-lib/', d)
+    packages = " ".join(do_split_packages(d, plugindir, '^libasound_module_(.*)\.so$', 'libasound-module-%s', 'Alsa plugin for %s', extra_depends=''))
+    d.setVar("RDEPENDS_alsa-plugins", packages)
+}
+
+# The rate plugins create some symlinks. For example, the samplerate plugin
+# creates these links to the main plugin file:
+#
+#   libasound_module_rate_samplerate_best.so
+#   libasound_module_rate_samplerate_linear.so
+#   libasound_module_rate_samplerate_medium.so
+#   libasound_module_rate_samplerate_order.so
+#
+# The other rate plugins create similar links. We have to add the links to
+# FILES manually, because do_split_packages() skips the links (which is good,
+# because we wouldn't want do_split_packages() to create separate packages for
+# the symlinks).
+#
+# The symlinks cause QA errors, because usually it's a bug if a non
+# -dev/-dbg/-nativesdk package contains links to .so files, but in this case
+# the errors are false positives, so we disable the QA checks.
+FILES_libasound-module-rate-lavcrate += "${libdir}/alsa-lib/*rate_lavcrate_*.so"
+FILES_libasound-module-rate-samplerate += "${libdir}/alsa-lib/*rate_samplerate_*.so"
+FILES_libasound-module-rate-speexrate += "${libdir}/alsa-lib/*rate_speexrate_*.so"
+INSANE_SKIP_libasound-module-rate-lavcrate = "dev-so"
+INSANE_SKIP_libasound-module-rate-samplerate = "dev-so"
+INSANE_SKIP_libasound-module-rate-speexrate = "dev-so"
+
+FILES_${PN}-dbg += "${libdir}/alsa-lib/.debug"
+
+# 50-pulseaudio.conf defines a device named "pulse" that applications can use
+# if they explicitly want to use the PulseAudio plugin.
+# 99-pulseaudio-default.conf configures the "default" device to use the
+# PulseAudio plugin.
+FILES_${PN}-pulseaudio-conf += "\
+        ${datadir}/alsa/alsa.conf.d/50-pulseaudio.conf \
+        ${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf \
+"
+
+RDEPENDS_${PN}-pulseaudio-conf += "\
+        libasound-module-conf-pulse \
+        libasound-module-ctl-pulse \
+        libasound-module-pcm-pulse \
+"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index d6ddc3b..30fe221 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -149,6 +149,11 @@ RDEPENDS_pulseaudio-server = " \
     pulseaudio-module-role-cork \
     pulseaudio-module-switch-on-port-available"
 
+# If the server is installed, it's usually desirable to make ALSA applications
+# use PulseAudio. alsa-plugins-pulseaudio-conf will install the configuration
+# that makes the PulseAudio plugin the default ALSA device.
+RDEPENDS_pulseaudio-server += "alsa-plugins-pulseaudio-conf"
+
 RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
-- 
1.9.3


