Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TgMaE-0007qf-8A
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 22:32:47 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so4374886lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xK+me+gpvILx8OIFLExHH0tlEAZ/KVzQgdfiZoBpYUs=;
	b=mtdWs/2cCw4XjJrLN118UdIHewSyAiegB+TU0plJ0NpUyvxjMjZHc6xIye7TikQL7V
	a/VxwWlP3Zglk7e/rR1x2BWSsN3fV1CILBK4uDsfE7v0v8PDbW+Mc7q0lX86bwH2kZhz
	vRkoA8votLBry74qrZWSgQVCQ0JEEB/5XhHwyHI4q/Vuc6KhNMRg7ZVNNwQiFuGsrrKe
	4r0hnjjFNkiNeVx17WvXlBLwvjsUNhQ5zCvSEaFXWDA98+fY3MKhCY/OYlr0K6SeQVbR
	q98RbgFMDrGPgg3xSZBs+TGt67eLYIcwH5m1DqITesTxhN8t2NfjkoThuTdi8mVIOSy6
	P90Q==
Received: by 10.112.42.197 with SMTP id q5mr7964783lbl.9.1354742301064;
	Wed, 05 Dec 2012 13:18:21 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id gr12sm2609446lab.3.2012.12.05.13.18.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:18:19 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TgLls-00074Q-TY; Wed, 05 Dec 2012 22:40:44 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:40:32 +0200
Message-Id: <1354740033-18500-2-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354740033-18500-1-git-send-email-cazfi74@gmail.com>
References: <1354740033-18500-1-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 1/2] libpng: split recipe to libpng.inc and libpng_1.2.50.bb
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
X-List-Received-Date: Wed, 05 Dec 2012 21:32:47 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-multimedia/libpng/libpng.inc       |   17 +++++++++++++++++
 meta/recipes-multimedia/libpng/libpng_1.2.50.bb |   22 ++++++----------------
 2 files changed, 23 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-multimedia/libpng/libpng.inc

diff --git a/meta/recipes-multimedia/libpng/libpng.inc b/meta/recipes-multimedia/libpng/libpng.inc
new file mode 100644
index 0000000..68b325a
--- /dev/null
+++ b/meta/recipes-multimedia/libpng/libpng.inc
@@ -0,0 +1,17 @@
+SUMMARY = "PNG Library"
+DESCRIPTION = "PNG Library"
+HOMEPAGE = "http://www.libpng.org/"
+SECTION = "libs"
+LICENSE = "Libpng"
+DEPENDS = "zlib"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${PNV}/${PV}/libpng-${PV}.tar.xz"
+
+inherit autotools binconfig pkgconfig
+
+PACKAGES =+ "${PN}${PNV}"
+
+FILES_${PN}${PNV} = "${libdir}/libpng${PNV}${SOLIBS}"
+RPROVIDES_${PN}-dev += "${PN}${PNV}-dev"
+
+BBCLASSEXTEND = "native"
diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
index 62989bb..7627e3a 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
@@ -1,23 +1,13 @@
-SUMMARY = "PNG Library"
-DESCRIPTION = "PNG Library"
-HOMEPAGE = "http://www.libpng.org/"
-SECTION = "libs"
-LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
-                    file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
-DEPENDS = "zlib"
+PNV="12"
+
+require libpng.inc
+
 PR = "r0"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
+                    file://png.h;beginline=310;endline=424;md5=b87b5e9252a3e14808a27b92912d268d"
 
 SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
 SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
 
 inherit autotools binconfig pkgconfig
-
-PACKAGES =+ "${PN}12"
-
-FILES_${PN}12 = "${libdir}/libpng12${SOLIBS}"
-RPROVIDES_${PN}-dev += "${PN}12-dev"
-
-BBCLASSEXTEND = "native"
-- 
1.7.10.4



