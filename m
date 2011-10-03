Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAiiw-0005A2-Kv
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:38:26 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=IiVc8kaj6N3wFmwGpQFaxW/juVFwLMbPyE+EibZMjd8=;
	b=lKUFkaVjF2GlC3aoi/eLJ5Ty7nYPaoZfv7RicLLPq5vbFfRT85CPO9HWXQjR/uFfkc
	Ys0ohLT4G5f7Br4YNm5xCwykuDK8XegMda1zPVsxJXoNfhb+zH3eJ29DMlzQFby7iAj/
	iIeZWtG0gcBZ01oEZXraYTVcqvdst1tp1dpco=
Received: by 10.204.141.8 with SMTP id k8mr538695bku.192.1317648776544;
	Mon, 03 Oct 2011 06:32:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w3sm13225496bkp.10.2011.10.03.06.32.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:32:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:29:00 +0200
Message-Id: <461d8d90b6867c179cf5cfac8a5f5a2dd9347e26.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 29/30] mesa: add new version 7.11
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
X-List-Received-Date: Mon, 03 Oct 2011 13:44:14 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-7.11.inc           |   15 ++++++++++
 .../mesa/mesa-dri-glsl-native_7.11.bb              |   28 ++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    4 +++
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    4 +++
 4 files changed, 51 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb

diff --git a/meta/recipes-graphics/mesa/mesa-7.11.inc b/meta/recipes-graphics/mesa/mesa-7.11.inc
new file mode 100644
index 0000000..98b888f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-7.11.inc
@@ -0,0 +1,15 @@
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://uclibc.patch \
+          "
+
+DEPENDS += "mesa-dri-glsl-native"
+
+SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
+SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
+
+do_configure_prepend() {
+  #check for python not python2, because python-native does not stage python2 binary/link
+  sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
+  # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
+  sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
+}
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
new file mode 100644
index 0000000..f1987fd
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "gl shader language specific build from mesa-dri"
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc2fc355719c090482254bd9"
+
+DEPENDS = "makedepend-native"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
+SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
+
+S = "${WORKDIR}/Mesa-${PV}/src/glsl/"
+
+inherit native
+
+# use default config for native build
+do_configure_prepend() {
+	ln -s ${S}/../../configs/default ${S}/../../configs/current
+}
+
+do_install() {
+	install -d ${D}/${bindir}/glsl
+	install -m 755 ${S}/builtin_compiler ${D}/${bindir}/glsl/builtin_compiler
+	install -m 755 ${S}/glsl_compiler ${D}/${bindir}/glsl/glsl_compiler
+}
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
new file mode 100644
index 0000000..26b56e4
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -0,0 +1,4 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-dri.inc
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
new file mode 100644
index 0000000..93bb8cd
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -0,0 +1,4 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-xlib.inc
+PR = "${INC_PR}.0"
-- 
1.7.7



