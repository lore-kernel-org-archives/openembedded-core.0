Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1Qdhno-0006Fj-U3
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jul 2011 13:59:01 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id 3CE44A6206D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2011 12:54:58 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 04 Jul 2011 12:54:53 +0100
Message-Id: <1309780493.20200.17.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Subject: [PROPOSAL] Package feature switches, redux.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: celston@katalix.com, Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 04 Jul 2011 11:59:01 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Since responses to my previous mail were generally positive, I've
reworked the package feature switches so that the interface is as RP
suggested.

In the recipe for foo you would have a set of features defined like
this:

PACKAGE_CONFIG[bar] = "--enable-bar, --disable-bar, libbar"
PACKAGE_CONFIG[baz] = "--enable-baz, --disable-baz, libbaz"

The default set of features for the package would be defined with:

PACKAGE_FEATURES ?= "bar baz" 

Perhaps this set of features could go into a metadata field in the .ipk
- would this be helpful for feed users?

The package features can then be tailored in a config/layer with
something like:

PACKAGE_FEATURES_pn-foo = "baz pop"

If a layer requests a feature not supported by the recipe, you get a
warning (should help distro maintainers detect bitrot in their layer):

WARNING: foo: Unknown feature 'pop' requested

The patch below uses gstreamer as an example of something which would
benefit from this:

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 8f4ef1e..ee8e914 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -396,6 +396,30 @@ python () {
             break
 
     bb.data.setVar('MULTIMACH_ARCH', multiarch, d)
+
+    features = bb.data.getVar('PACKAGE_FEATURES', d, True)
+    if features:
+        config = list(bb.data.getVarFlags('PACKAGE_CONFIG', d) or {})
+        oeconf = [ (bb.data.getVar('EXTRA_OECONF', d, True) or '') ]
+        depends = [ (bb.data.getVar('DEPENDS', d, True) or '') ]
+        for feature in features.split():
+            if feature in config:
+                settings = bb.data.getVarFlag('PACKAGE_CONFIG', feature, d).split(',')
+                oeconf.append(settings[0])
+                depends.append(settings[2])
+                config.remove(feature) 
+            else:
+                bb.warn("%s: Unknown feature '%s' requested" % (pn, feature))
+
+        for feature in config:
+            settings = bb.data.getVarFlag('PACKAGE_CONFIG', feature, d).split(',')
+            oeconf.append(settings[1])
+
+        if len(oeconf) > 1:
+            bb.data.setVar('EXTRA_OECONF', ' '.join(oeconf), d)
+
+        if len(depends) > 1:
+            bb.data.setVar('DEPENDS', ' '.join(depends), d)
 }
 
 def check_gcc3(data):
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
index f81011f..70f0171 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
@@ -6,10 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
                     file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libogg libvorbis libxv libtheora avahi util-linux tremor"
+DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libxv avahi util-linux tremor"
 RDEPENDS_${PN} += "gnome-vfs-plugin-file gnome-vfs-plugin-http gnome-vfs-plugin-ftp \
              gnome-vfs-plugin-sftp"
 
+PACKAGE_CONFIG[ogg] = "--enable-ogg, --disable-ogg, libogg"
+PACKAGE_CONFIG[vorbis] = "--enable-vorbis, --disable-vorbis, libvorbis"
+PACKAGE_CONFIG[theora] = "--enable-theora, --disable-theora, libtheora"
+
+PACKAGE_FEATURES ?= "ogg vorbis theora" 
+
 SRC_URI += " file://gst-plugins-base-tremor.patch"
 
 SRC_URI[md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
---

Cheers,

Chris.





