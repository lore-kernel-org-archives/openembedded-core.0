Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdjKy-0003Mw-El
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:14:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so7390955eei.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 06:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=NghA3y5J3TpgggS0WhaMzJbSbdsQG3GnGrqbfHVvAGg=;
	b=ZN7oQvJKwQn0oTjnxv9+1psnfkFVqtUTyt48LzHlZBgEq/a/+E8WEn5Ol3ly5y5aUw
	ILMRKedDcytp4aRKFguMjqsopy9Z6j+zRydO2IPPPfzLimNIUK5UTmhMIe6u/EfJc7A0
	f8j1dqkqgHAhsgzg+XCViZhOYYvgOJuLSldDwxD8xcXCnMmc2qCOz+DJHvAUibvQegCH
	3PyTaL/jXDxzJn1Yfx/qSpgVKGqxM8PoAm7xvaAQXVQycs+w/uZEnZr3Oct8Qp6XbSte
	CEi7WEGA9StClqLr6uf1vqj4xdip6ohOb+AHG4hA0VCg0jXksxbCeJt19nvPlPBStMBM
	AM7w==
Received: by 10.14.194.71 with SMTP id l47mr69919957een.6.1354114794046;
	Wed, 28 Nov 2012 06:59:54 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e1sm47531518eem.3.2012.11.28.06.59.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 06:59:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 15:59:48 +0100
Message-Id: <1354114788-17224-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <20121128141245.GD3477@jama.jama.net>
References: <20121128141245.GD3477@jama.jama.net>
Subject: [PATCH] gstreamer, gst-plugins*: fix localdata
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 15:14:08 -0000

* all gst* packages were producing LC_MESSAGES/.mo instead of
  LC_MESSAGES/gst*.mo and it was leading to file conflicts between gst*
  packages too
* for more details see
  http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
* buildhistory diff, confirms issue fixed
  https://github.com/shr-distribution/buildhistory/commit/f2c0888c0e08dfb33cc0cdf384621fc499d4ac04
* Thanks to Enrico for simplier solution

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb  | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc             | 6 ++++++
 meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb        | 9 ++++++++-
 6 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
index a277417..7a398d0 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.23.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg curl"
 
-PR = "r2"
+PR = "r3"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
index 2648864..462c54d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.36.bb
@@ -15,7 +15,7 @@ SRC_URI += "file://gst-plugins-base-tremor.patch \
 SRC_URI[md5sum] = "776c73883e567f67b9c4a2847d8d041a"
 SRC_URI[sha256sum] = "2cd3b0fa8e9b595db8f514ef7c2bdbcd639a0d63d154c00f8c9b609321f49976"
 
-PR = "r6"
+PR = "r7"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
index 59bde5b..70d1e4f 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.31.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://common/coverage/coverage-report.pl;beginline=2;endline=17;md5=622921ffad8cb18ab906c56052788a3f \
                     file://gst/replaygain/rganalysis.c;beginline=1;endline=23;md5=b60ebefd5b2f5a8e0cab6bfee391a5fe"
 
-PR = "r7"
+PR = "r8"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)}"
 PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
index a9da76e..9fd71fc 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.19.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                     file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
 
 DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
-PR = "r2"
+PR = "r3"
 
 inherit gettext
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index 8799a91..07b26a3 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -19,3 +19,9 @@ require gst-plugins-package.inc
 
 PACKAGES_DYNAMIC += "^${PN}-.*"
 
+# apply gstreamer hack after Makefile.in.in in source is replaced by our version from
+# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed 
+# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
+oe_runconf_prepend() {                                                                                                                                      
+	sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
+}                                                                                                                                                           
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
index 4ca4429..90b1982 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer_0.10.36.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/gst.h;beginline=1;endline=21;md5=8e5fe5e87d33a04479fde862e238eaa4"
 DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.bz2 \
            file://check_fix.patch \
@@ -23,6 +23,13 @@ inherit autotools pkgconfig gettext
 GSTREAMER_DEBUG ?= "--disable-debug"
 EXTRA_OECONF = "--disable-docs-build --disable-dependency-tracking --with-check=no --disable-examples --disable-tests --disable-valgrind ${GSTREAMER_DEBUG}"
 
+# apply gstreamer hack after Makefile.in.in in source is replaced by our version from
+# ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in, but before configure is executed
+# http://lists.linuxtogo.org/pipermail/openembedded-core/2012-November/032233.html
+oe_runconf_prepend() {
+        sed -i -e "1a\\" -e 'GETTEXT_PACKAGE = @GETTEXT_PACKAGE@' ${S}/po/Makefile.in.in
+}
+
 #do_compile_prepend () {
 #	mv ${WORKDIR}/gstregistrybinary.[ch] ${S}/gst/
 #}
-- 
1.8.0



