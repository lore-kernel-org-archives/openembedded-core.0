Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW5S1-0003tx-Mg
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:09:18 +0100
Received: by mail-ee0-f47.google.com with SMTP id c1so1174385eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=XT1m39sfuyDnh1xvGYupe38lmy+PpngtakqH8B2IMhk=;
	b=rj7y/k6Zfdqj0Eog2auF2Tsx156kMaOFteN1Ha4dQnrTyv32tWcOD50lImv4xDosQO
	3gkH+tqyu/+h+7CgrKvkiVmOEeOj3Zh2Tk5Y4c4Wul0Ma9aG8YoM/Lys2u0RCn2cKLVO
	lprLwSaY+SalP2utS2hcxJ6EeiGEnKZpBO4qU=
Received: by 10.14.12.136 with SMTP id 8mr575460eez.240.1322740953528;
	Thu, 01 Dec 2011 04:02:33 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a60sm16879011eeb.4.2011.12.01.04.02.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 04:02:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 13:02:08 +0100
Message-Id: <3c431a91e57f03be6acc6dc26f4f855960be1334.1322740824.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
References: <9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322740824.git.Martin.Jansa@gmail.com>
References: <cover.1322740824.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 3/4] shadow: use u-a for /usr/bin/groups
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
X-List-Received-Date: Thu, 01 Dec 2011 12:09:18 -0000

* otherwise coreutils upgrade fails with
  update-alternatives: Error: not linking //usr/bin/groups to groups.coreutils since //usr/bin/groups exists and is not a link

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 25330a4..dddac2c 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
@@ -88,7 +88,7 @@ do_install_append() {
 	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
 
 	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
-	for i in passwd chfn newgrp chsh ; do
+	for i in passwd chfn newgrp chsh groups ; do
 		mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
 	done
 
@@ -123,6 +123,7 @@ pkg_postinst_${PN} () {
 	update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
 	update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
 	update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
+	update-alternatives --install ${bindir}/groups groups groups.${PN} 200
 	update-alternatives --install ${base_bindir}/login login login.${PN} 200
 	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 200
 	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 200
-- 
1.7.8.rc4



