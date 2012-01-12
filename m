Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1RlNn6-0001Tb-9b
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:46:16 +0100
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with SMTP id q0CGcf7B001117
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 Jan 2012 17:38:41 +0100
Received: by ensc-virt.intern.sigma-chemnitz.de (sSMTP sendmail emulation);
	Thu, 12 Jan 2012 17:38:41 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2012 17:38:13 +0100
Message-Id: <1326386296-1526-2-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 1.7.7.5
In-Reply-To: <1326386296-1526-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1326386296-1526-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -5.8
X-Spam-Level: -----
X-Spam-Tests: AWL,BAYES_00,SPF_NEUTRAL,T_RP_MATCHES_RCVD,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.72 on 62.153.82.30
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH 1/4] gst-plugins: do not build x11 related plugins without the x11 DISTRO_FEATURE
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
X-List-Received-Date: Thu, 12 Jan 2012 16:46:16 -0000

gst-plugins might be used on headless systems or on systems with
DirectFB or qt frontends.  Building them without the x11 software stack
might be desirable there and is supported by the buildsystem.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 .../gstreamer/gst-plugins-base_0.10.35.bb          |    4 +++-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    1 +
 2 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
index e49a00c..dc86c19 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "virtual/libx11 alsa-lib freetype liboil libogg libvorbis libxv libtheora avahi util-linux tremor"
+DEPENDS-x11 = 'virtual/libx11 libxv avahi'
+DEPENDS += "alsa-lib freetype liboil libogg libvorbis libtheora util-linux tremor"
+DEPENDS += "${@base_contains('DISTRO_FEATURES','x11', '${DEPENDS-x11}', '', d)}"
 
 SRC_URI += " file://gst-plugins-base-tremor.patch"
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index b23d399..25c44f5 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -11,6 +11,7 @@ FILESPATH =. "${FILE_DIRNAME}/gst-plugins:"
 SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2"
 
 EXTRA_OECONF = "--disable-valgrind --disable-debug --disable-examples "
+EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES','x11','','--disable-x', d)}"
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-- 
1.7.7.5



