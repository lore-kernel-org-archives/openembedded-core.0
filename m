Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U4w8A-0004oY-3e
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 17:21:23 +0100
Received: by mail-wg0-f44.google.com with SMTP id dr12so4748724wgb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 08:05:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references:x-gm-message-state;
	bh=4NLRdtSdwRlbkFH4VjEMus5f026o/5TZ3r8bXO0TqEk=;
	b=YBnff9d4boG3qSSiGN3wPBIp1RLaG+B5YMAyY2VDw5pQo6Jbnn25KYzjV8PI2hUwRi
	Kvmha93PGkufxUiiYzmegzfCMtPQquxGTnGNwAQTPitLMC+9+zm6BB0L3RWyQWWdMiV0
	frKR1VIJgrTGjpJ0QfAtjwBG85/bwyHagWmuhsAYjpCqHgPoULYM54/UjBfQpPeXeV45
	NExh9dZVAAmnDDDuwhCCDWT9bXSLpr3bze3Pd/1WljLV+gVMaHjuTQzfqbH/ENM79764
	1G7O+q0ALMDvTXcXD9/FXXBGaKF//g1YN1MdX1rvmxK5jWixtwaIjn5iSFegOcj4uJlo
	aY1w==
X-Received: by 10.194.119.5 with SMTP id kq5mr24895070wjb.48.1360598724181;
	Mon, 11 Feb 2013 08:05:24 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q13sm32487856wie.0.2013.02.11.08.05.22
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 08:05:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 16:03:09 +0000
Message-Id: <68efbe7536a32a09fba27b3810fbf0ea59ea77fd.1360598515.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360598515.git.ross.burton@intel.com>
References: <cover.1360598515.git.ross.burton@intel.com>
In-Reply-To: <cover.1360598515.git.ross.burton@intel.com>
References: <cover.1360598515.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmRfobcZw3/qY0Gbzy17O5b9UCWSsYVICNCnaSKbK7Res+Ij9n18FawzFvqE6Nzhde+ZF7L
Subject: [PATCH 1/3] fontconfig: remove unexplainable and broken build tweaking
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
X-List-Received-Date: Mon, 11 Feb 2013 16:21:24 -0000

The build flag twiddling in do_configure_append was unexplainable and clearly
wrong (native flags for a cross build), remove it all.

Parallel make appears to be working now, so enable it.

The tarball doesn't contain read only sources, remove the unpack hacking.

The pkgconfig doesn't need patching as the freetype link lines are the same.

Don't need to specify where freetype is, it's found automatically.

Merge fontconfig-util-dbg into fontconfig-dbg.

Don't export HASDOCBOOK, --disable-docs is sufficient to turn off documentation
building.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../fontconfig-2.10.2/fix-pkgconfig.patch          |   15 -------
 .../fontconfig/fontconfig_2.10.2.bb                |   47 ++------------------
 2 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch

diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch
deleted file mode 100644
index 6be04a1..0000000
--- a/meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
----
- fontconfig.pc.in |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- fontconfig-2.9.0.orig/fontconfig.pc.in
-+++ fontconfig-2.9.0/fontconfig.pc.in
-@@ -7,5 +7,5 @@
- Description: Font configuration and customization library
- Version: @VERSION@
- Libs: -L${libdir} -lfontconfig
--Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ @FREETYPE_LIBS@ @ICONV_LIBS@
-+Libs.private: @LIBXML2_LIBS@ @EXPAT_LIBS@ -L${libdir} -lfreetype @ICONV_LIBS@
- Cflags: -I${includedir}
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
index 607cf9e..6f2456d 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
@@ -24,16 +24,14 @@ PR = "r1"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://Add-sysroot-option-to-fc-cache-and-fc-cat.patch \
-           file://fix-pkgconfig.patch \
           "
 
 SRC_URI[md5sum] = "025e08b3d7fe45c433de5718e441ed15"
 SRC_URI[sha256sum] = "5c3bf994bb6d6303bbf1e641eaa4b431932138dc90de33642e5845e31e1fdfd6"
 
-PACKAGES =+ "fontconfig-utils-dbg fontconfig-utils "
-FILES_fontconfig-utils-dbg = "${bindir}/*.dbg"
-FILES_fontconfig-utils = "${bindir}/*"
+PACKAGES =+ "fontconfig-utils"
 FILES_${PN} =+ "${datadir}/xml/*"
+FILES_fontconfig-utils = "${bindir}/*"
 
 # Work around past breakage in debian.bbclass
 RPROVIDES_fontconfig-utils = "libfontconfig-utils"
@@ -41,45 +39,6 @@ RREPLACES_fontconfig-utils = "libfontconfig-utils"
 RCONFLICTS_fontconfig-utils = "libfontconfig-utils"
 DEBIAN_NOAUTONAME_fontconfig-utils = "1"
 
-PARALLEL_MAKE = ""
-
 inherit autotools pkgconfig
 
-export HASDOCBOOK="no"
-
-EXTRA_OECONF = " --disable-docs --with-arch=${HOST_ARCH} --with-default-fonts=${datadir}/fonts"
-EXTRA_OEMAKE = "FC_LANG=fc-lang FC_GLYPHNAME=fc-glyphname"
-
-# The tarball has some of the patched files as read only, which
-# patch doesn't like at all
-
-fontconfig_do_unpack() {
-       chmod -R u+rw ${S}
-}
-
-python do_unpack () {
-       bb.build.exec_func('base_do_unpack', d)
-       bb.build.exec_func('fontconfig_do_unpack', d)
-}
-
-BUILD_CFLAGS += " -I${STAGING_INCDIR}/freetype2"
-
-do_configure_append () {
-	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-case/Makefile
-	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-glyphname/Makefile
-	sed -i 's|LDFLAGS =.*|LDFLAGS =|' fc-lang/Makefile
-
-	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-case/Makefile
-	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-glyphname/Makefile
-	sed -i 's|CFLAGS =.*|CFLAGS =${BUILD_CFLAGS}|' fc-lang/Makefile
-
-	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-case/Makefile
-	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-glyphname/Makefile
-	sed -i 's|CPPFLAGS =.*|CPPFLAGS =${BUILD_CPPFLAGS}|' fc-lang/Makefile
-
-	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-case/Makefile
-	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-glyphname/Makefile
-	sed -i 's|CXXFLAGS =.*|CFLAGS =${BUILD_CXXFLAGS}|' fc-lang/Makefile
-
-}
-
+EXTRA_OECONF = " --disable-docs --with-default-fonts=${datadir}/fonts"
-- 
1.7.10.4



