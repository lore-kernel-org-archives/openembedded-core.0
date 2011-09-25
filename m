Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1R7nTP-0006IS-Sk
	for openembedded-core@lists.openembedded.org;
	Sun, 25 Sep 2011 14:06:19 +0200
Received: by wyh5 with SMTP id 5so5512549wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2011 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NAWr27tIaOACrAPlkl663fJV9EDBH9zkedTaB4rv9eI=;
	b=NMYUIQmOCFuP2l6Fdps3wo+blQX6LbI7HpNXcSxAoQjrNdkOnHMBwt+C+8BrFQwz/O
	Wc7BenpILofGr/74xzpmGTpAz6IeZmt1A383R0TagDMdMOYCQh95w+6gCiShE+h7+6BN
	6slWAZAUZCUOq9N6fMQw3RzJI5TqqNEqBXBQQ=
Received: by 10.216.154.145 with SMTP id h17mr7801601wek.39.1316952056674;
	Sun, 25 Sep 2011 05:00:56 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id es5sm11774000wbb.11.2011.09.25.05.00.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 25 Sep 2011 05:00:55 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 25 Sep 2011 13:55:46 +0100
Message-Id: <1316955346-12756-1-git-send-email-julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: [PATCH] Use useradd and update-rc.d classes in the OpenSSH recipe
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
X-List-Received-Date: Sun, 25 Sep 2011 12:06:20 -0000

The current sshd postinst and postrm scripts in the OpenSSH make the
package dependant of the adduser/addgroup scripts which may not be
available on all systems.

This patch replaces the sshd postinst and postrm scripts with proper
usage of the useradd and update-rc.d classes.

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   29 +++++--------------
 1 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
index 030a83b..c94ec84 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
@@ -29,6 +29,14 @@ PAM_SRC_URI = "file://sshd"
 SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
 SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
 
+inherit useradd update-rc.d
+
+USERADD_PACKAGES = "${PN}-sshd"
+USERADD_PARAM_${PN}-sshd = "-r -M -d /var/run/sshd -s /bin/false -U sshd"
+INITSCRIPT_PACKAGES = "${PN}-sshd"
+INITSCRIPT_NAME_${PN}-sshd = "sshd"
+INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
+
 inherit autotools
 
 # LFS support:
@@ -91,16 +99,6 @@ RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 DEPENDS_${PN}-sshd += "update-rc.d"
 RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
 
-pkg_postinst_${PN}-sshd () {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	else
-		addgroup sshd
-		adduser --system --home /var/run/sshd --no-create-home --disabled-password --ingroup sshd -s /bin/false sshd
-		update-rc.d sshd defaults 9
-	fi
-}
-
 pkg_postinst_${PN}-scp () {
 	update-alternatives --install ${bindir}/scp scp scp.${PN} 90
 }
@@ -117,16 +115,5 @@ pkg_postrm_${PN}-scp () {
 	update-alternatives --remove ${bindir}/scp scp.${PN}
 }
 
-pkg_postrm_${PN}-sshd () {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	else
-		${sysconfdir}/init.d/sshd stop
-		deluser sshd
-		delgroup sshd
-		update-rc.d -f sshd remove
-	fi
-}
-
 CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
 CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"
-- 
1.7.3.4



