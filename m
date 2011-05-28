Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQHdE-0002UK-OY
	for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 13:24:37 +0200
Received: by wye20 with SMTP id 20so2017722wye.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 04:21:30 -0700 (PDT)
Received: by 10.216.71.136 with SMTP id r8mr1638449wed.0.1306581690681;
	Sat, 28 May 2011 04:21:30 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w10sm1449450weq.27.2011.05.28.04.21.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 May 2011 04:21:29 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 May 2011 13:21:26 +0200
Message-Id: <1306581686-17625-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [RFC][PATCH] sysvinit: make pidof usuable in a standalone setting
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
X-List-Received-Date: Sat, 28 May 2011 11:24:37 -0000

Currently it's a symlink to killall5:

$ dpkg-deb -c sysvinit-pidof_2.88dsf-r1_armv7a.ipk  | grep pidof
lrwxrwxrwx root/root         0 2011-05-27 11:05 ./bin/pidof.sysvinit -> /sbin/killall5

The point of the pidof subpackage was to have a pidof without needing sysvinit, this restores that behaviour. The trade-off is a 14KiB (armv7a, uncompressed) increase in size.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---

The alternative is to just move 'killall5' into the pidof subpackage and to RDPEPENDS_${PN} += "${PN}-pidof"

The change in this patch was the least amounts of edits to the recipe, let me know which way you prefer.

 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 7d5e936..f0e73bb 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r1"
+PR = "r2"
 
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
@@ -100,7 +100,7 @@ EOF
 		ln -s ../init.d/stop-bootlogd ${D}${sysconfdir}/rc$level.d/S99stop-bootlogd
 	done
 	mv                 ${D}${base_sbindir}/init               ${D}${base_sbindir}/init.${PN}
-	mv ${D}${base_bindir}/pidof ${D}${base_bindir}/pidof.${PN}
+	cp ${D}${base_sbindir}/killall5 ${D}${base_bindir}/pidof.${PN}
 	mv ${D}${base_sbindir}/halt ${D}${base_sbindir}/halt.${PN}
 	mv ${D}${base_sbindir}/reboot ${D}${base_sbindir}/reboot.${PN}
 	mv ${D}${base_sbindir}/shutdown ${D}${base_sbindir}/shutdown.${PN}
-- 
1.6.6.1



