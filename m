Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RqOmw-0004AW-91 for openembedded-core@lists.openembedded.org;
	Thu, 26 Jan 2012 13:50:50 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QCh3i0022195
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 12:43:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21514-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 12:42:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0QCguXG022189
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jan 2012 12:42:57 GMT
Message-ID: <1327581778.19643.368.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jan 2012 12:42:58 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] shadow-sysroot: Simplfy login.defs installation
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
X-List-Received-Date: Thu, 26 Jan 2012 12:50:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently if shadow-sysroot is installed from a sstate package,
shadow_sysroot_sstate_postinst is looking in ${D} for login.defs which
isn't a valid for an install from sstate.

The easiest and most correct way to fix this is to override the standard
sysroot_stage_all function to install the files correctly and then
sstate installs work as expected. This simplifies the code as an added
bonus.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
index 076bc9a..fbffb84 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://login.defs_shadow-sysroot;md5=25e2f2de4dfc8f966ac5cdf
 
 DEPENDS = "base-passwd"
 
-PR = "r0"
+PR = "r1"
 
 # The sole purpose of this recipe is to provide the /etc/login.defs
 # file for the target sysroot - needed so the shadow-native utilities
@@ -19,22 +19,12 @@ SRC_URI[md5sum] = "b8608d8294ac88974f27b20f991c0e79"
 SRC_URI[sha256sum] = "633f5bb4ea0c88c55f3642c97f9d25cbef74f82e0b4cf8d54e7ad6f9f9caa778"
 
 S = "${WORKDIR}"
-SSTATEPOSTINSTFUNCS += "shadow_sysroot_sstate_postinst"
 
 do_install() {
 	install -d ${D}${sysconfdir}
 	install -p -m 755 ${S}/login.defs_shadow-sysroot ${D}${sysconfdir}/login.defs
 }
 
-shadow_sysroot_sstate_postinst() {
-	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
-	then
-		# Staging does not copy ${sysconfdir} files into the
-		# target sysroot, so we need to do so manually. We
-		# put this file in the target sysroot so it can be
-		# used by recipes which use custom user/group
-		# permissions.
-		install -d -m 755 ${STAGING_DIR_TARGET}${sysconfdir}
-		install -p -m 644 ${D}${sysconfdir}/login.defs ${STAGING_DIR_TARGET}/${sysconfdir}/login.defs
-	fi
+sysroot_stage_all() {
+	sysroot_stage_dir ${D} ${SYSROOT_DESTDIR}
 }




