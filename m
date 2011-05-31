Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QRLGk-00018P-7r
	for openembedded-core@lists.openembedded.org;
	Tue, 31 May 2011 11:29:46 +0200
Received: by wye20 with SMTP id 20so3603744wye.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2011 02:26:36 -0700 (PDT)
Received: by 10.227.172.206 with SMTP id m14mr5990500wbz.29.1306833550552;
	Tue, 31 May 2011 02:19:10 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id gb6sm3602981wbb.0.2011.05.31.02.19.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 May 2011 02:19:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 11:19:04 +0200
Message-Id: <1306833544-5211-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [Patch v2] sysvinit: make pidof usuable in a standalone setting
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
X-List-Received-Date: Tue, 31 May 2011 09:29:46 -0000

Currently it's a symlink to killall5:

$ dpkg-deb -c sysvinit-pidof_2.88dsf-r1_armv7a.ipk  | grep pidof
lrwxrwxrwx root/root         0 2011-05-27 11:05 ./bin/pidof.sysvinit -> /sbin/killall5

The point of the pidof subpackage was to have a pidof without needing sysvinit, this restores that behaviour.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index 7d5e936..2cb650e 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://COPYRIGHT;endline=15;md5=349c872e0066155e1818b786938876a4"
-PR = "r1"
+PR = "r3"
 
 # USE_VT and SERIAL_CONSOLE are generally defined by the MACHINE .conf.
 # Set PACKAGE_ARCH appropriately.
@@ -47,9 +47,11 @@ ALTERNATIVE_PRIORITY = "50"
 
 PACKAGES =+ "sysvinit-pidof sysvinit-sulogin"
 FILES_${PN} += "${base_sbindir}/* ${base_bindir}/*"
-FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit"
+FILES_sysvinit-pidof = "${base_bindir}/pidof.sysvinit ${base_sbindir}/killall5"
 FILES_sysvinit-sulogin = "${base_sbindir}/sulogin"
 
+RDEPENDS_${PN} += "sysvinit-pidof"
+
 CFLAGS_prepend = "-D_GNU_SOURCE "
 export LCRYPT = "-lcrypt"
 EXTRA_OEMAKE += "'base_bindir=${base_bindir}' \
-- 
1.6.6.1



