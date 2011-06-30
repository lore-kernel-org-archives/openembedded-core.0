Received: from katalix.com ([82.103.140.233] helo=mail.katalix.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <celston@katalix.com>) id 1QcKov-00031A-LB
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 19:14:29 +0200
Received: from [192.168.1.100] (188-220-141-241.zone11.bethere.co.uk
	[188.220.141.241])
	(using SSLv3 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: chris)
	by mail.katalix.com (Postfix) with ESMTPSA id D8C98A6206F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2011 18:10:33 +0100 (BST)
From: Chris Elston <celston@katalix.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 18:10:32 +0100
Message-Id: <1309453832.7987.33.camel@desktop.home>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 (2.26.3-1.fc11) 
Subject: Proposal: recipe feature switches
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
X-List-Received-Date: Thu, 30 Jun 2011 17:14:29 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

We're looking to base an embedded development on oe-core in the near
future, and one of the things we must have is the ability to configure
features in/out of recipes per distro.

At the moment some recipes have a configuration / set of dependencies
baked in to the recipe.  For example, gstreamer has theora, ogg and
vorbis hard-coded in to it's EXTRA_OECONF and DEPENDS.  Currently, you'd
have to override the DEPENDS and EXTRA_OECONF for the recipe in the
distro layer - which means moving knowledge about what EXTRA_OECONF
flags bring in which dependencies outside of the recipe.  It seems that
this metadata is better contained in the recipe.

I'm proposing something along the lines of the following:

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 9930a24..4f1c54f 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -84,6 +84,15 @@ def oe_system(d, cmd, **kwargs):
         kwargs["shell"] = True
     return oe_popen(d, cmd, **kwargs).wait()
 
+def oe_package_feature_switch(feature, switch_on, switch_off,
dependencies, d):
+    oeconf = d.getVar("EXTRA_OECONF", True)
+    if feature in d.getVar("PACKAGE_FEATURES", True).split():
+        d.setVar("EXTRA_OECONF", oeconf + " " + switch_on)
+        depends = d.getVar("DEPENDS", True)
+        d.setVar("DEPENDS", depends + " " + dependencies)
+    else:
+        d.setVar("EXTRA_OECONF", oeconf + " " + switch_off)
+
 oe_soinstall() {
 	# Purpose: Install shared library file and
 	#          create the necessary links
diff --git
a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
index f81011f..6fc6405 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
@@ -6,10 +6,12 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \

file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \

file://gst/ffmpegcolorspace/utils.c;beginline=1;endline=20;md5=9c83a200b8e597b26ca29df20fc6ecd0"
 
-DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libogg
libvorbis libxv libtheora avahi util-linux tremor"
+DEPENDS += "virtual/libx11 alsa-lib freetype gnome-vfs liboil libxv
avahi util-linux tremor"
 RDEPENDS_${PN} += "gnome-vfs-plugin-file gnome-vfs-plugin-http
gnome-vfs-plugin-ftp \
              gnome-vfs-plugin-sftp"
 
+PACKAGE_FEATURES ?= "ogg vorbis theora" 
+
 SRC_URI += " file://gst-plugins-base-tremor.patch"
 
 SRC_URI[md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
@@ -21,6 +23,12 @@ inherit gettext
 
 EXTRA_OECONF += "--disable-freetypetest --disable-pango"
 
+python () {
+	oe_package_feature_switch("ogg", "--enable-ogg", "--disable-ogg",
"libogg", d)
+	oe_package_feature_switch("vorbis", "--enable-vorbis",
"--disable-vorbis", "libvorbis", d)
+	oe_package_feature_switch("theora", "--enable-theora",
"--disable-theora", "libtheora", d)
+}
+
 do_configure_prepend() {
 	# This m4 file contains nastiness which conflicts with libtool 2.2.2
 	rm -f ${S}/m4/lib-link.m4

Then in your layer, you could configure which plugins gstreamer should
be built with like this:

PACKAGE_FEATURES_pn-gst-plugins-base = "ogg theora"

Or just filter out the package features that you don't want.

With a little extra work, it would also be possible to check the list of
package features a distro layer requests against those the recipe
actually implements.  Then we could get an early warning when we pull
oe-core and a recipe has stopped implementing a feature.

Cheers,

Chris.



