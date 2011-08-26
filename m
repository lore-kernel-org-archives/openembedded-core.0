Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwkUo-0003o1-MG
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 02:42:06 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q0bIsm022672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:18 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7Q0bHSO025296
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q0bHvH001521
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 19:37:16 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q0bFau011622;	Thu, 25 Aug 2011 19:37:16 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:28:21 -0500
Message-ID: <1314318504-9524-7-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Subject: [PATCH meta-oe 6/9] vlc: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 00:42:07 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
vlc is not an mplayer depdency, but libdvdcss is an mplayer depedency and it is included in the recipes/vlc directory in oe-classic. I have imported vlc as well for completeness.

 meta-oe/recipes-multimedia/vlc/vlc.inc        |   61 +++++++++++++++++++++++++
 meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb |   51 +++++++++++++++++++++
 2 files changed, 112 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/vlc/vlc.inc
 create mode 100644 meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb

diff --git a/meta-oe/recipes-multimedia/vlc/vlc.inc b/meta-oe/recipes-multimedia/vlc/vlc.inc
new file mode 100644
index 0000000..0435e87
--- /dev/null
+++ b/meta-oe/recipes-multimedia/vlc/vlc.inc
@@ -0,0 +1,61 @@
+DESCRIPTION = "Video player and streamer - davinci edition"
+HOMEPAGE = "http://www.videolan.org"
+LICENSE = "GPL"
+PRIORITY = "optional"
+SECTION = "multimedia"
+
+DEPENDS = "libfribidi libtool hal gettext libgcrypt schroedinger virtual/libsdl qt4-x11-free dbus libxml2 gnutls tremor faad2 ffmpeg flac \
+           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad libid3tag liba52 mpeg2dec', d)}"
+
+INC_PR = "r4"
+
+SRC_URI = "http://download.videolan.org/pub/videolan/vlc/${PV}/vlc-${PV}.tar.bz2"
+
+inherit autotools
+
+ARM_INSTRUCTION_SET = "arm"
+
+EXTRA_OECONF = "\
+	--enable-libtool \
+	--with-contrib \
+	--enable-run-as-root \
+	--disable-wxwidgets \
+	--enable-x11 --enable-xvideo \ 
+	--disable-screen --disable-caca \
+	--enable-httpd --enable-vlm \
+	--enable-freetype \
+	--enable-sdl \ 
+	--enable-png \
+	--enable-live555 --enable-tremor \
+	--enable-v4l2 --enable-v4l --disable-aa --enable-wma --disable-faad \
+	--enable-dbus \
+	--enable-hal \	
+	--without-contrib \
+	--disable-opengl --disable-glx \
+	--enable-realrtsp \
+	ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
+	ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
+	ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
+"
+
+
+do_configure() {
+	cp ${STAGING_DATADIR}/aclocal/libgcrypt.m4 ${S}/m4/ 
+	./bootstrap	
+	gnu-configize --force
+	libtoolize --force
+	#autoreconf --force -i
+	cp ${STAGING_DATADIR}/libtool/config.* ${S}/autotools/ || true
+	oe_runconf
+	rm config.log
+	sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
+	sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
+}
+
+FILES_${PN} += "${bindir}/vlc \
+	${datadir}/applications \
+	${datadir}/vlc/ \
+	"
+
+FILES_${PN} += "${datadir}/icons"
+FILES_${PN}-dbg	+= "${libdir}/vlc/*/.debug ${libdir}/vlc/plugins/*/.debug"
diff --git a/meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb b/meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb
new file mode 100644
index 0000000..18297c9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/vlc/vlc_1.1.4.1.bb
@@ -0,0 +1,51 @@
+# This recipe packages vlc as a library as well, so qt4 dependencies
+# can be avoided when ony the library is installed.
+# Would be cool if when newer vlc is added to OE and older ones are phased
+# out that could be made the default.
+
+require vlc.inc
+
+PR = "${INC_PR}.1"
+
+SRC_URI[md5sum] = "ce17c335b38b322949694313173fcd49"
+SRC_URI[sha256sum] = "61c9ea30a17ea40c6ccbfd507026e5c83ad9e0691f221d3667c8e49696d7c2aa"
+
+# ffmpeg from git (library version => 52) is required
+# libtool-native must be >= 2.2.4
+DEPENDS += "libdvdcss libdvdread lua5.1-native lua5.1"
+RDEPENDS_${PN} += "lua5.1"
+
+EXTRA_OECONF += "\
+	--enable-dvdread \
+"
+
+LEAD_SONAME = "libvlc.so.5"
+
+PACKAGES =+ "libvlc-dbg libvlc-dev libvlc"
+
+FILES_libvlc-dev = "${libdir}/lib*.so"
+
+FILES_libvlc-dbg = "\
+	${libdir}/.debug \
+	${libdir}/vlc/meta_engine/.debug \
+	${libdir}/vlc/audio_filter/.debug ${libdir}/vlc/audio_output/.debug \
+	${libdir}/vlc/demux/.debug ${libdir}/vlc/control/.debug \
+	${libdir}/vlc/gui/.debug ${libdir}/vlc/packetizer/.debug \
+	${libdir}/vlc/audio_mixer/.debug ${libdir}/vlc/stream_out/.debug \
+	${libdir}/vlc/mux/.debug ${libdir}/vlc/access/.debug \
+	${libdir}/vlc/visualization/.debug ${libdir}/vlc/access_filter/.debug \
+	${libdir}/vlc/access_output/.debug ${libdir}/vlc/video_output/.debug \
+	${libdir}/vlc/services_discovery/.debug ${libdir}/vlc/video_chroma/.debug \
+	${libdir}/vlc/video_codec/.debug ${libdir}/vlc/video_filter/.debug \
+	${libdir}/vlc/misc/.debug ${libdir}/vlc/codec/.debug \
+	"
+
+FILES_libvlc = "${libdir}/lib*.so.*"
+
+FILES_${PN} += "${bindir}/vlc \
+	${datadir}/applications \
+	${datadir}/vlc/ \
+	"
+
+FILES_${PN}-dbg	+= "${libdir}/vlc/*/.debug"
+
-- 
1.7.0.4



