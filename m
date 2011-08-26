Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joelagnel@ti.com>) id 1QwkUm-0003o0-KQ
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 02:42:04 +0200
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id p7Q0bII6005567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:18 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p7Q0bHDW025295
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p7Q0bHNV001523
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 19:37:17 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 25 Aug 2011 19:37:17 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p7Q0bFav011622;	Thu, 25 Aug 2011 19:37:16 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Aug 2011 19:28:22 -0500
Message-ID: <1314318504-9524-8-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Subject: [PATCH meta-oe 7/9] live555: Imported from OE classic
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
X-List-Received-Date: Fri, 26 Aug 2011 00:42:04 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../live555/files/config.linux-cross               |   17 ++++++
 meta-oe/recipes-multimedia/live555/live555.inc     |   56 ++++++++++++++++++++
 .../recipes-multimedia/live555/live555_20110314.bb |   10 ++++
 3 files changed, 83 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/live555/files/config.linux-cross
 create mode 100644 meta-oe/recipes-multimedia/live555/live555.inc
 create mode 100644 meta-oe/recipes-multimedia/live555/live555_20110314.bb

diff --git a/meta-oe/recipes-multimedia/live555/files/config.linux-cross b/meta-oe/recipes-multimedia/live555/files/config.linux-cross
new file mode 100644
index 0000000..d1277da
--- /dev/null
+++ b/meta-oe/recipes-multimedia/live555/files/config.linux-cross
@@ -0,0 +1,17 @@
+COMPILE_OPTS =		$(INCLUDES) -I. -O2 -DSOCKLEN_T=socklen_t -DNO_STRSTREAM=1 -D_LARGEFILE_SOURCE=1
+C =			c
+C_COMPILER =		$(CC)
+C_FLAGS =		$(COMPILE_OPTS)
+CPP =			cpp
+CPLUSPLUS_COMPILER =	$(CXX)
+CPLUSPLUS_FLAGS =	$(COMPILE_OPTS) -Wall -DBSD=1
+OBJ =			o
+LINK =			$(CXX) -o
+LINK_OPTS =		-L.
+CONSOLE_LINK_OPTS =	$(LINK_OPTS)
+LIBRARY_LINK =		$(LD) -o
+LIBRARY_LINK_OPTS =	$(LINK_OPTS) -r -Bstatic
+LIB_SUFFIX =			a
+LIBS_FOR_CONSOLE_APPLICATION =
+LIBS_FOR_GUI_APPLICATION =
+EXE =
diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
new file mode 100644
index 0000000..f1e21dc
--- /dev/null
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -0,0 +1,56 @@
+# live555 OE build file
+# Copyright (C) 2005, Koninklijke Philips Electronics NV.  All Rights Reserved
+# Released under the MIT license (see packages/COPYING)
+
+DESCRIPTION = "LIVE555 Streaming Media libraries"
+HOMEPAGE = "http://live.com/"
+LICENSE = "LGPL"
+SECTION = "devel"
+
+INC_PR = "r2"
+
+URLV = "${@bb.data.getVar('PV',d,1)[0:4]}.${@bb.data.getVar('PV',d,1)[4:6]}.${@bb.data.getVar('PV',d,1)[6:8]}"
+SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
+           file://config.linux-cross"
+
+S = "${WORKDIR}/live"
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_configure() {
+	cp ${WORKDIR}/config.linux-cross .
+	echo "COMPILE_OPTS+=" -fPIC "" >> config.linux-cross
+	./genMakefiles linux-cross
+}
+
+do_compile() {
+	make
+}
+
+do_install() {
+	install -d ${D}${includedir}/BasicUsageEnvironment
+	install -d ${D}${includedir}/groupsock
+	install -d ${D}${includedir}/liveMedia
+	install -d ${D}${includedir}/UsageEnvironment
+	install -d ${D}${libdir}
+	cp -a ${S}/BasicUsageEnvironment/include/*.hh ${D}${includedir}/BasicUsageEnvironment/
+	cp -a ${S}/groupsock/include/*.h ${D}${includedir}/groupsock/
+	cp -a ${S}/groupsock/include/*.hh ${D}${includedir}/groupsock/
+	cp -a ${S}/liveMedia/include/*.hh ${D}${includedir}/liveMedia/
+	cp -a ${S}/UsageEnvironment/include/*.hh ${D}${includedir}/UsageEnvironment/
+	# Find all the headers
+	for i in $(find . -name "*.hh") $(find . -name "*.h") ; do
+		install ${i} ${D}${includedir}
+	done
+	cp ${S}/*/*.a ${D}${libdir}
+	install -d ${D}${bindir}
+	for i in MPEG2TransportStreamIndexer openRTSP playSIP sapWatch testMPEG1or2AudioVideoToDarwin testMPEG1or2ProgramToTransportStream testMPEG1or2Splitter testMPEG1or2VideoReceiver testMPEG2TransportStreamTrickPlay testMPEG4VideoToDarwin testOnDemandRTSPServer testRelay testAMRAudioStreamer testDVVideoStreamer testMP3Receiver testMP3Streamer testMPEG1or2AudioVideoStreamer testMPEG1or2VideoStreamer testMPEG2TransportStreamer testMPEG4VideoStreamer testWAVAudioStreamer vobStreamer; do
+		install -m 0755 ${S}/testProgs/${i} ${D}${bindir}/
+	done
+	install -m 0755 ${S}/mediaServer/live555MediaServer ${D}${bindir}/
+}
+
+PACKAGES =+ " live555-openrtsp live555-playsip live555-mediaserver"
+FILES_${PN} = "${bindir}/sapWatch ${bindir}/testMPEG1or2AudioVideoToDarwin ${bindir}/testMPEG1or2ProgramToTransportStream ${bindir}/testMPEG1or2Splitter ${bindir}/testMPEG1or2VideoReceiver ${bindir}/testMPEG2TransportStreamTrickPlay ${bindir}/testMPEG4VideoToDarwin ${bindir}/testOnDemandRTSPServer ${bindir}/testRelay ${bindir}/testAMRAudioStreamer ${bindir}/testDVVideoStreamer ${bindir}/testMP3Receiver ${bindir}/testMP3Streamer ${bindir}/testMPEG1or2AudioVideoStreamer ${bindir}/testMPEG1or2VideoStreamer ${bindir}/testMPEG2TransportStreamer ${bindir}/testMPEG4VideoStreamer ${bindir}/testWAVAudioStreamer ${bindir}/vobStreamer ${bindir}/MPEG2TransportStreamIndexer"
+FILES_live555-openrtsp = "${bindir}/openRTSP"
+FILES_live555-playsip = "${bindir}/playSIP"
+FILES_live555-mediaserver = "${bindir}/live555MediaServer"
diff --git a/meta-oe/recipes-multimedia/live555/live555_20110314.bb b/meta-oe/recipes-multimedia/live555/live555_20110314.bb
new file mode 100644
index 0000000..b1dbad2
--- /dev/null
+++ b/meta-oe/recipes-multimedia/live555/live555_20110314.bb
@@ -0,0 +1,10 @@
+require live555.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=68ad62c64cc6c620126241fd429e68fe"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "ff65b2c598e970b4b6c8219a1811de00"
+SRC_URI[sha256sum] = "c6ce050a7f9f69901e6f7f81a6745c82d9419e3904a753b2d5db1139caaf6738"
+
+
-- 
1.7.0.4



