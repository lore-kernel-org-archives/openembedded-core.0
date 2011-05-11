Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QK50n-0004tx-26
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 10:43:17 +0200
Received: by fxm19 with SMTP id 19so202338fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2011 01:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:mime-version:content-type:content-transfer-encoding;
	bh=Vdo2l/Ab0lAeDCNZiHCckBPG7NtR7Ards1vVUElqF8Y=;
	b=V6uN84Pzn3remu3jI+TvbhmnQjyV6sdYDr2Ix99plW8ue85sR3wlY/IMbBNCLmiydY
	llIztOJSGX05IQgufb5l7JUamHq6SQVj1PJd/VrZQSs6MyHzieMOvl0SqmhqWIj6bm68
	pGGLruS5qgHNn9EBuUnDCh6SzLYzj6X+bKMK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	b=ogwlppF7tv75xZr0toQzB7OSpJ0VKFNvdW8YnGkNMOtrNDg2aSgonUUJh2X1gthUQU
	tPKIwsBVQF5qWlCzUTiPmal9Qz65z9gY7g1L9c7pDHpQ24BVlBWN9uwPv2GmVq8xjmnH
	RjNaj/b4/K582hIsa3H8kXouJqN1bfdx3Sdn4=
Received: by 10.223.42.151 with SMTP id s23mr2890905fae.135.1305103230667;
	Wed, 11 May 2011 01:40:30 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id n7sm2663427fam.35.2011.05.11.01.40.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 01:40:29 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2011 10:40:17 +0200
Message-Id: <1305103217-18419-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH] python-native: Add ctypes patch to native build (as in cross-compilation)
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
X-List-Received-Date: Wed, 11 May 2011 08:43:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fix makes ctypes build for python-native which may be needed by extensions
that utilize ctypes and use setuptools/distutils as their build system.

Tested building pyudev for beagleboard target using Ângstrom distro.

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../recipes-devtools/python/python-native_2.6.6.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/python/python-native_2.6.6.bb b/meta/recipes-devtools/python/python-native_2.6.6.bb
index 11956a4..0f9ae10 100644
--- a/meta/recipes-devtools/python/python-native_2.6.6.bb
+++ b/meta/recipes-devtools/python/python-native_2.6.6.bb
@@ -1,12 +1,13 @@
 require python.inc
 DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
            file://04-default-is-optimized.patch \
            file://05-enable-ctypes-cross-build.patch \
+           file://06-ctypes-libffi-fix-configure.patch \
            file://10-distutils-fix-swig-parameter.patch \
            file://11-distutils-never-modify-shebang-line.patch \
            file://12-distutils-prefix-is-inside-staging-area.patch \
@@ -27,6 +28,10 @@ EXTRA_OEMAKE = '\
   STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
 '
 
+do_configure_prepend() {
+	autoreconf --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || bbnote "_ctypes failed to autoreconf"
+}
+
 do_install() {
 	oe_runmake 'DESTDIR=${D}' install
 	install -d ${D}${bindir}/
-- 
1.7.3.4



