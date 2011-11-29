Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVVHM-0005wV-J4
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:31:52 +0100
Received: by mail-ey0-f175.google.com with SMTP id d13so3685959eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:25:15 -0800 (PST)
Received: by 10.213.36.12 with SMTP id r12mr52083ebd.89.1322601912064;
	Tue, 29 Nov 2011 13:25:12 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id 49sm109421761eec.1.2011.11.29.13.25.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 13:25:11 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 22:25:00 +0100
Message-Id: <1322601901-26195-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322601901-26195-1-git-send-email-koen@dominion.thruhere.net>
References: <1322601901-26195-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC 3/4] pulseaudio 1.1: convert to useradd.bbclass
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
X-List-Received-Date: Tue, 29 Nov 2011 21:31:52 -0000

The only thing that got lost in the conversion is the "Pulse Audio daemon" description:

root@beagleboard:~# grep pulse /etc/passwd /etc/group
/etc/passwd:pulse:x:999:1000::/var/run/pulse:/bin/false
/etc/group:audio:x:29:pulse
/etc/group:pulse:x:1000:pulse

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   18 ++++++++----------
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 131d659..4170857 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -16,7 +16,7 @@ SRC_URI = "http://0pointer.de/lennart/projects/pulseaudio/pulseaudio-${PV}.tar.g
            file://gcc4-compile-fix.patch \
            file://volatiles.04_pulse"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig useradd
 
 EXTRA_OECONF = "\
 		--disable-lynx \
@@ -50,6 +50,12 @@ do_install_append() {
 	fi
 }
 
+USERADD_PACKAGES = "pulseaudio-server"
+GROUPADD_PARAM_pulseaudio-server = "pulse"
+USERADD_PARAM_pulseaudio-server = "--system --home /var/run/pulse \
+                              --no-create-home --shell /bin/false \
+                              --groups audio,pulse --gid pulse pulse"
+
 PACKAGES =+ "libpulsecore libpulsecommon libpulsedsp libpulse libpulse-simple libpulse-browse libpulse-mainloop-glib \
              pulseaudio-server pulseaudio-misc pulseaudio-gconf-helper"
 
@@ -90,20 +96,12 @@ pkg_postinst_${PN}-server() {
         if [ "x$D" != "x" ]; then
                 exit 1
         fi
-        grep -q pulse: ${sysconfdir}/group || addgroup pulse
-        grep -q pulse: ${sysconfdir}/passwd || \
-            adduser --disabled-password --home=/var/run/pulse --system \
-                    --ingroup pulse --no-create-home -g "Pulse audio daemon" pulse
-        addgroup pulse audio
+
         if [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
             ${sysconfdir}/init.d/populate-volatile.sh update
         fi
 }
 
-pkg_postrm_${PN}-server() {
-        deluser pulse || true
-}
-
 python populate_packages_prepend() {
         #d.setVar('PKG_pulseaudio', 'pulseaudio')
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index 576d2b7..7fa5799 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.2.5



