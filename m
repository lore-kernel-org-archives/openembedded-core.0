Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <julian.pidancet@gmail.com>) id 1R8go4-0000gX-QN
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 01:11:20 +0200
Received: by mail-ww0-f43.google.com with SMTP id 27so6418080wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Sep 2011 16:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=9QTaW2XOkUSJmfuXrkFvD+TFO7Oc0BHy6bB3SULvXwU=;
	b=v7Q8AVlHGOrv47vpQuHZoIKsUOj320Ve8+40an5a0oEGnSVpcvJOANB807eACJEjhr
	62oKyjDctIB7yEC8lec9pyc+RBfZMwSP3O4ZWsC+2KlXyxRrTRqEwsm9GhoWp8M75Y/6
	DyYHt5u+UMGIOzP68dM5OJDMDF2gD7epzSRoE=
Received: by 10.227.27.225 with SMTP id j33mr6964319wbc.101.1317164756324;
	Tue, 27 Sep 2011 16:05:56 -0700 (PDT)
Received: from localhost.localdomain (188-223-88-44.zone14.bethere.co.uk.
	[188.223.88.44])
	by mx.google.com with ESMTPS id fd4sm37903271wbb.21.2011.09.27.16.05.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Sep 2011 16:05:56 -0700 (PDT)
From: Julian Pidancet <julian.pidancet@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 01:00:25 +0100
Message-Id: <1317168025-27827-3-git-send-email-julian.pidancet@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1317168025-27827-1-git-send-email-julian.pidancet@gmail.com>
References: <1317168025-27827-1-git-send-email-julian.pidancet@gmail.com>
Cc: scott.a.garman@intel.com, julian.pidancet@gmail.com
Subject: [PATCH 2/2] Use useradd and update-rc.d classes in the OpenSSH recipe
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
X-List-Received-Date: Tue, 27 Sep 2011 23:11:21 -0000

The current sshd postinst and postrm scripts in the OpenSSH make the
package dependant of the adduser/addgroup scripts which may not be
available on all systems.

This patch replaces the sshd postinst and postrm scripts with proper
usage of the useradd and update-rc.d classes.

This patch had been modified from the previous proposed version to
use useradd long options for more clarity.

Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
---
 meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   29 +++++--------------
 1 files changed, 8 insertions(+), 21 deletions(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
index 030a83b..5f5f0bc 100644
--- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
@@ -29,6 +29,14 @@ PAM_SRC_URI = "file://sshd"
 SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
 SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
 
+inherit useradd update-rc.d
+
+USERADD_PACKAGES = "${PN}-sshd"
+USERADD_PARAM_${PN}-sshd = "--system --no-create-home --home-dir /var/run/sshd --shell /bin/false --user-group sshd"
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



