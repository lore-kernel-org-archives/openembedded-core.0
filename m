Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RCxxw-0001DS-0a
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Oct 2011 20:19:12 +0200
Received: by bke11 with SMTP id 11so7587886bke.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Oct 2011 11:13:29 -0700 (PDT)
Received: by 10.223.63.75 with SMTP id a11mr26743262fai.9.1318184008968;
	Sun, 09 Oct 2011 11:13:28 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id a7sm26547975fam.22.2011.10.09.11.13.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 09 Oct 2011 11:13:27 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Oct 2011 20:13:23 +0200
Message-Id: <1318184003-19108-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] alsa-utils 0.10.24.2: fix systemd units when there's no asound.state
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
X-List-Received-Date: Sun, 09 Oct 2011 18:19:12 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |   44 ++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    3 +-
 2 files changed, 46 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
new file mode 100644
index 0000000..3b5d969
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils-1.0.24.2/0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch
@@ -0,0 +1,44 @@
+From 37c99a3cbff36915b56a5703eeaed3c70796f80f Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Sun, 9 Oct 2011 20:06:35 +0200
+Subject: [PATCH] alsactl: don't let systemd unit restore the volume when asound.state is missing
+
+This avoids an error on bootup
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+
+Upstream-status: Pending
+
+ alsactl/Makefile.am             |    2 +-
+ alsactl/alsa-restore.service.in |    1 +
+ 2 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
+index 5cfc415..c3768c4 100644
+--- a/alsactl/Makefile.am
++++ b/alsactl/Makefile.am
+@@ -34,7 +34,7 @@ install-data-hook:
+ endif
+ 
+ edit = \
+-	sed $(SED) -r 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
++	sed $(SED) -e 's,@localstatedir\@,$(localstatedir),g' -e 's,@sbindir\@,$(sbindir),g' < $< > $@ || rm $@
+ 
+ alsa-store.service: alsa-store.service.in
+ 	$(edit)
+diff --git a/alsactl/alsa-restore.service.in b/alsactl/alsa-restore.service.in
+index e97d196..3b76710 100644
+--- a/alsactl/alsa-restore.service.in
++++ b/alsactl/alsa-restore.service.in
+@@ -4,6 +4,7 @@ DefaultDependencies=no
+ After=sysinit.target
+ Before=shutdown.target
+ Conflicts=shutdown.target
++ConditionPathExists=@localstatedir@/lib/alsa/asound.state
+ 
+ [Service]
+ Type=oneshot
+-- 
+1.6.6.1
+
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index 1b3ffe1..9eee60a 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -6,11 +6,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
                     file://alsactl/utils.c;beginline=1;endline=20;md5=fe9526b055e246b5558809a5ae25c0b9"
 DEPENDS = "alsa-lib ncurses"
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://ncursesfix.patch \
            file://uclibc-exp10-replacement.patch \
+           file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
           "
 
 SRC_URI[md5sum] = "8238cd57cb301d1c36bcf0ecb59ce6b2"
-- 
1.6.6.1



