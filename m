Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9dTl-0001SP-OH
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 15:50:17 +0200
Received: by ggnq1 with SMTP id q1so143810ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 06:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=/cv2kr0+zNykPHiamsFhKoCYKwIWqdUh/8O8H9aD2pA=;
	b=CzUR5eEAhs5M6kLVRJVlSxL5E9dQCOuyM/CNfFjaFTHJRcytp+3k0UBwleM7B8koDR
	OpYWCZB01KQfxvZv8JbJ3xYxh2tqGT8+4lcEK7mSIc7b4KtdClWC5KzneW8dd6jSVXsE
	mBz5wxEZONZlDYftSd2qf1j+UhpW2TX4YDxZw=
Received: by 10.223.45.85 with SMTP id d21mr2341961faf.63.1317390287799;
	Fri, 30 Sep 2011 06:44:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n1sm6764856fad.20.2011.09.30.06.44.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 06:44:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 15:44:38 +0200
Message-Id: <1317390278-15364-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
Subject: [PATCH] libproxy: upgrade to 0.4.7
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
X-List-Received-Date: Fri, 30 Sep 2011 13:50:17 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.6.bb |   29 -----------------------
 meta/recipes-support/libproxy/libproxy_0.4.7.bb |   27 +++++++++++++++++++++
 2 files changed, 27 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-support/libproxy/libproxy_0.4.6.bb
 create mode 100644 meta/recipes-support/libproxy/libproxy_0.4.7.bb

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.6.bb b/meta/recipes-support/libproxy/libproxy_0.4.6.bb
deleted file mode 100644
index d907c55..0000000
--- a/meta/recipes-support/libproxy/libproxy_0.4.6.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "A library that provides automatic proxy configuration management"
-HOMEPAGE = "http://code.google.com/p/libproxy/"
-BUGTRACKER = "http://code.google.com/p/libproxy/issues/list"
-SECTION = "libs"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
-                    file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
-
-
-DEPENDS = "gconf"
-
-SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "199c6b120baf1f7258a55f38d5ec74f5"
-SRC_URI[sha256sum] = "9ad912e63b1efca98fb442240a2bc7302e6021c1d0b1b9363327729f29462f30"
-
-PR = "r2"
-
-inherit cmake pkgconfig
-
-EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
-	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir}"
-
-FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
-
-do_configure_prepend() {
-	export HOST_SYS=${HOST_SYS}
-	export BUILD_SYS=${BUILD_SYS}
-}
diff --git a/meta/recipes-support/libproxy/libproxy_0.4.7.bb b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
new file mode 100644
index 0000000..2793b41
--- /dev/null
+++ b/meta/recipes-support/libproxy/libproxy_0.4.7.bb
@@ -0,0 +1,27 @@
+DESCRIPTION = "A library that provides automatic proxy configuration management"
+HOMEPAGE = "http://code.google.com/p/libproxy/"
+BUGTRACKER = "http://code.google.com/p/libproxy/issues/list"
+SECTION = "libs"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7d7044444a7b1b116e8783edcdb44ff4 \
+                    file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
+
+
+DEPENDS = "gconf"
+
+SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "509e03a488a61cd62bfbaf3ab6a2a7a5"
+SRC_URI[sha256sum] = "8fe0a58810139ba3c2e186deccf3e68adcd127aa0e972b0862b30b3dde493797"
+
+inherit cmake pkgconfig
+
+EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
+	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir}"
+
+FILES_${PN}-dbg += "${libdir}/libproxy/${PV}/plugins/.debug/ ${libdir}/libproxy/${PV}/modules/.debug/"
+
+do_configure_prepend() {
+	export HOST_SYS=${HOST_SYS}
+	export BUILD_SYS=${BUILD_SYS}
+}
-- 
1.7.6.1



