Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLwwr-0001HR-T9
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 14:03:14 +0100
Received: by wyh5 with SMTP id 5so1255074wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 05:57:05 -0700 (PDT)
Received: by 10.227.202.71 with SMTP id fd7mr11712402wbb.9.1320325025124;
	Thu, 03 Nov 2011 05:57:05 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	et20sm10013748wbb.15.2011.11.03.05.57.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 05:57:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2011 13:57:00 +0100
Message-Id: <1320325020-19012-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] avahi: fix useradd race condition
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
X-List-Received-Date: Thu, 03 Nov 2011 13:03:14 -0000

Avahi doesn't work at boot because of:

+ sh /OE/../rootfs/var/lib/opkg/info/avahi-daemon.preinst
Running useradd commands...
grep: /OE/../rootfs/etc/passwd: No such file or directory

That is due to:

Package: avahi-daemon
Version: 0.6.30-r9.0
 [..]
Depends: libavahi-core7 (>= 0.6.30), libdaemon0 (>= 0.14), libcap2 (>= 2.22), libavahi-common3 (>= 0.6.30), libdbus-1-3 (>= 1.4.12), sysvinit-pidof, libc6 (>= 2.12), libexpat1 (>= 2.0.1)

After this patch:

 Package: avahi-daemon
 Version: 0.6.30-r10.0
 [..]
 Depends: libavahi-core7 (>= 0.6.30), libdaemon0 (>= 0.14), libcap2 (>= 2.22), libavahi-common3 (>= 0.6.30), libdbus-1-3 (>= 1.4.12), sysvinit-pidof, libc6 (>= 2.12), shadow, libexpat1 (>= 2.0.1), base-passwd

This also changes ${PN}-daemon to avahi-daemon to be consistent with the PACKAGES/FILES lines below

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/avahi/avahi.inc |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 79cfd73..728c38f 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -23,8 +23,9 @@ SRC_URI = "http://avahi.org/download/avahi-${PV}.tar.gz \
           file://99avahi-autoipd \
           file://initscript.patch"
 
-USERADD_PACKAGES = "${PN}-daemon"
-USERADD_PARAM_${PN}-daemon = "--system --home /var/run/avahi-daemon \
+USERADDPN = "avahi-daemon"
+USERADD_PACKAGES = "avahi-daemon"
+USERADD_PARAM_avahi-daemon = "--system --home /var/run/avahi-daemon \
                               --no-create-home --shell /bin/false \
                               --user-group avahi"
 
-- 
1.7.2.5



