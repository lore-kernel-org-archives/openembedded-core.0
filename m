Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVVHJ-0005wV-IF
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 22:31:49 +0100
Received: by eaad13 with SMTP id d13so3685959eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 13:25:10 -0800 (PST)
Received: by 10.213.3.73 with SMTP id 9mr1561029ebm.133.1322601910004;
	Tue, 29 Nov 2011 13:25:10 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id s44sm76693356eef.11.2011.11.29.13.25.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 13:25:09 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 22:24:59 +0100
Message-Id: <1322601901-26195-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1322601901-26195-1-git-send-email-koen@dominion.thruhere.net>
References: <1322601901-26195-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC 2/4] pulseaudio 1.1: replace hardcoded /etc with ${sysconfdir}
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
X-List-Received-Date: Tue, 29 Nov 2011 21:31:49 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    8 ++++----
 .../pulseaudio/pulseaudio_1.1.bb                   |    2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 6cd6d16..131d659 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -90,13 +90,13 @@ pkg_postinst_${PN}-server() {
         if [ "x$D" != "x" ]; then
                 exit 1
         fi
-        grep -q pulse: /etc/group || addgroup pulse
-        grep -q pulse: /etc/passwd || \
+        grep -q pulse: ${sysconfdir}/group || addgroup pulse
+        grep -q pulse: ${sysconfdir}/passwd || \
             adduser --disabled-password --home=/var/run/pulse --system \
                     --ingroup pulse --no-create-home -g "Pulse audio daemon" pulse
         addgroup pulse audio
-        if [ -e /etc/init.d/populate-volatile.sh ] ; then
-            /etc/init.d/populate-volatile.sh update
+        if [ -e ${sysconfdir}/init.d/populate-volatile.sh ] ; then
+            ${sysconfdir}/init.d/populate-volatile.sh update
         fi
 }
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index df3a53e..576d2b7 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
-- 
1.7.2.5



