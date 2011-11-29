Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVVHK-0005wW-3t
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:31:50 +0100
Received: by eekc1 with SMTP id c1so1363944eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:25:11 -0800 (PST)
Received: by 10.14.19.210 with SMTP id n58mr2535843een.78.1322601907356;
	Tue, 29 Nov 2011 13:25:07 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id v3sm109414798eej.7.2011.11.29.13.25.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 13:25:06 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 22:24:58 +0100
Message-Id: <1322601901-26195-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC 1/4] pulseaudio 1.1: only run volatiles script when populate-volatile.sh exists
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
X-List-Received-Date: Tue, 29 Nov 2011 21:31:50 -0000

Volatiles are handled differently in a systemd world make the postinst fail:

//var/lib/opkg/info/pulseaudio-server.postinst: line 10: /etc/init.d/populate-volatile.sh: No such file or directory
Collected errors:
 * pkg_run_script: package "pulseaudio-server" postinst script returned status 127.
 * opkg_configure: pulseaudio-server.postinst returned 127.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    4 +++-
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 ++
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a94c398..6cd6d16 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -95,7 +95,9 @@ pkg_postinst_${PN}-server() {
             adduser --disabled-password --home=/var/run/pulse --system \
                     --ingroup pulse --no-create-home -g "Pulse audio daemon" pulse
         addgroup pulse audio
-        /etc/init.d/populate-volatile.sh update
+        if [ -e /etc/init.d/populate-volatile.sh ] ; then
+            /etc/init.d/populate-volatile.sh update
+        fi
 }
 
 pkg_postrm_${PN}-server() {
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index d97c932..df3a53e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,5 +1,7 @@
 require pulseaudio.inc
 
+PR = "r1"
+
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
 inherit gettext perlnative
-- 
1.7.2.5



