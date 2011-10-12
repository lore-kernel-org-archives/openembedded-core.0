Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDzAt-0001Si-T7 for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 15:48:48 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDneX3005981 for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:49:40 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id tmQFkHKnsqKc
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:49:40 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9CDnZHO005977
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 14:49:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Oct 2011 14:42:52 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318426981.23801.169.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] cogl: Add git recipe (required by clutter)
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
X-List-Received-Date: Wed, 12 Oct 2011 13:48:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/clutter/cogl.inc b/meta/recipes-graphics/clutter/cogl.inc
new file mode 100644
index 0000000..387f6ec
--- a/dev/null
+++ b/meta/recipes-graphics/clutter/cogl.inc
@@ -0,0 +1,22 @@
+DESCRIPTION = "Clutter graphics library"
+HOMEPAGE = "http://www.clutter-project.org/"
+LICENSE = "LGPL"
+
+STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gdk-pixbuf libxi"
+BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)}"
+
+DEPENDS = "${STDDEPENDS} virtual/libgl"
+EXTRA_OECONF = "${BASE_CONF} --with-flavour=glx"
+
+FILESPATH = "${FILE_DIRNAME}/clutter"
+
+inherit autotools pkgconfig gtk-doc gettext
+
+#check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
+require clutter-fpu.inc
+
+#Fix up some weirdness in the docs
+do_configure_prepend() {
+        sed -i s:doc/reference/Makefile::g ${S}/configure.ac
+        sed -i s:doc::g ${S}/Makefile.am
+}
diff --git a/meta/recipes-graphics/clutter/cogl_git.bb b/meta/recipes-graphics/clutter/cogl_git.bb
new file mode 100644
index 0000000..890c654
--- a/dev/null
+++ b/meta/recipes-graphics/clutter/cogl_git.bb
@@ -0,0 +1,19 @@
+require cogl.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRCREV = "0a70a159c65357809740971570b2e301451161b5"
+PV = "1.8.0+git${SRCPV}"
+PR = "r0"
+
+DEFAULT_PREFERENCE = "-1"
+
+SRC_URI = "git://git.gnome.org/cogl;protocol=git;branch=master"
+S = "${WORKDIR}/git"
+
+AUTOTOOLS_AUXDIR = "${S}/build"
+
+do_configure_prepend () {
+	# Disable DOLT
+	sed -i -e 's/^DOLT//' ${S}/configure.ac
+}




