Return-Path: <flihp@twobit.us>
X-Greylist: delayed 961 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 20 Feb 2016 18:12:11 UTC
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 550F877238
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Feb 2016 18:12:11 +0000 (UTC)
Received: from c-50-185-54-102.hsd1.ca.comcast.net ([50.185.54.102]
	helo=slag.twobit.us)
	by smtp.twobit.us with esmtpsa (TLSv1.2:AES128-SHA256:128)
	(Exim 4.80) (envelope-from <flihp@twobit.us>)
	id 1aXBkq-00051N-Hk; Sat, 20 Feb 2016 17:55:41 +0000
From: Philip Tricca <flihp@twobit.us>
To: openembedded-core@lists.openembedded.org
Date: Sat, 20 Feb 2016 17:55:59 +0000
Message-Id: <1455990959-5896-1-git-send-email-flihp@twobit.us>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 50.185.54.102
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Subject: [PATCH] sysvinit-inittab: Move start_getty scrip to base_bindir.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 20 Feb 2016 18:12:12 -0000

When this file is in ${sysconfdir}/init.d, SELinux labels it as a generic
init script (initrc_t). This causes problms at runtime because SELinux
doesn't let the login process execute generic init script. Moving this
helper script to base_bindir results in it being labeled as a generic
binary (bin_t). Nearly every SELinux domain is allowed to execute
generic binaries and the login process is one of them.

Signed-off-by: Philip Tricca <flihp@twobit.us>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index f539da8..c5b8cdc 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -17,9 +17,9 @@ do_compile() {
 
 do_install() {
     install -d ${D}${sysconfdir}
-    install -d ${D}${sysconfdir}/init.d
     install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
-    install -m 0755 ${WORKDIR}/start_getty ${D}${sysconfdir}/init.d/start_getty
+    install -d ${D}${base_bindir}
+    install -m 0755 ${WORKDIR}/start_getty ${D}${base_bindir}/start_getty
 
     set -x
     tmp="${SERIAL_CONSOLES}"
@@ -27,7 +27,7 @@ do_install() {
     do
 	j=`echo ${i} | sed s/\;/\ /g`
 	label=`echo ${i} | sed -e 's/tty//' -e 's/^.*;//' -e 's/;.*//'`
-	echo "$label:12345:respawn:${sysconfdir}/init.d/start_getty ${j}" >> ${D}${sysconfdir}/inittab
+	echo "$label:12345:respawn:${base_bindir}/start_getty ${j}" >> ${D}${sysconfdir}/inittab
     done
 
     if [ "${USE_VT}" = "1" ]; then
@@ -76,7 +76,7 @@ fi
 # Set PACKAGE_ARCH appropriately.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FILES_${PN} = "${sysconfdir}/inittab ${sysconfdir}/init.d/start_getty"
+FILES_${PN} = "${sysconfdir}/inittab ${base_bindir}/start_getty"
 CONFFILES_${PN} = "${sysconfdir}/inittab"
 
 USE_VT ?= "1"
-- 
2.1.4


