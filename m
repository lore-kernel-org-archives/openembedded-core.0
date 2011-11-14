Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RPw51-0003Mw-GV for openembedded-core@lists.openembedded.org;
	Mon, 14 Nov 2011 13:56:07 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAECnl0l011792
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 12:49:47 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11124-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 12:49:40 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAECnci0011786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2011 12:49:40 GMT
Message-ID: <1321274982.26881.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Nov 2011 12:49:42 +0000
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] base-passwd: Fix the broken preinst/postinstall
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
X-List-Received-Date: Mon, 14 Nov 2011 12:56:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The preinst accesses file which may not yet have been unpacked.
The postinst is too late for the creation of these files
for at least the opkg backend.

This patch therefore encodes the file contents into the preinst,
resolving the various issues once and for all.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index aa90a6d..05be23f 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r4"
+PR = "r5"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
@@ -37,36 +37,6 @@ do_install () {
 	install -p -m 644 debian/copyright ${D}${docdir}/${BPN}/
 }
 
-pkg_preinst_${PN} () {
-	set -e
-
-	# Used for rootfs generation. On in-target install this will be run
-        # before the unpack so the files won't be available
-
-	if [ ! -e $D${sysconfdir}/passwd ] && [ -e $D${datadir}/base-passwd/passwd.master ]; then
-		cp $D${datadir}/base-passwd/passwd.master $D${sysconfdir}/passwd
-	fi
-
-	if [ ! -e $D${sysconfdir}/group ] && [ -e $D${datadir}/base-passwd/group.master ]; then
-		cp $D${datadir}/base-passwd/group.master $D${sysconfdir}/group
-	fi
-
-	exit 0
-}
-
-pkg_postinst_${PN} () {
-	set -e
-
-	if [ ! -e $D${sysconfdir}/passwd ] ; then
-		cp $D${datadir}/base-passwd/passwd.master $D${sysconfdir}/passwd
-	fi
-
-	if [ ! -e $D${sysconfdir}/group ] ; then
-		cp $D${datadir}/base-passwd/group.master $D${sysconfdir}/group
-	fi
-	exit 0
-}
-
 base_passwd_sstate_postinst() {
 	if [ "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
 	then
@@ -80,3 +50,31 @@ base_passwd_sstate_postinst() {
 		install -p -m 644 ${STAGING_DIR_TARGET}${datadir}/base-passwd/group.master ${STAGING_DIR_TARGET}${sysconfdir}/group
 	fi
 }
+
+python populate_packages_prepend() {
+	# Add in the preinst function for ${PN}
+	# We have to do this here as prior to this, passwd/group.master
+	# would be unavailable. We need to create these files at preinst
+	# time before the files from the package may be available, hence
+	# storing the data from the files in the preinst directly.
+
+	f = open(bb.data.expand("${STAGING_DATADIR}/base-passwd/passwd.master", d), 'r')
+	passwd = "".join(f.readlines())
+	f.close()
+	f = open(bb.data.expand("${STAGING_DATADIR}/base-passwd/group.master", d), 'r')
+	group = "".join(f.readlines())
+	f.close()
+
+	preinst = """#!/bin/sh
+if [ ! -e $D${sysconfdir}/passwd ]; then
+	cat << EOF > $D${sysconfdir}/passwd
+""" + passwd + """EOF
+fi
+if [ ! -e $D${sysconfdir}/group ]; then
+	cat << EOF > $D${sysconfdir}/group
+""" + group + """EOF
+fi
+"""
+	d.setVar('pkg_preinst_${PN}', preinst)
+}
+




