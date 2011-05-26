Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QPhoI-00089p-CS
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 23:09:40 +0200
Received: by bwz5 with SMTP id 5so846621bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 14:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=GOwVCUVnVZDXXjqkJo5k69+LEmi8sWkZFdn0M7n2cys=;
	b=Wr1dRMW7JQH9qDacswTLHB4LIfVZTSqd0HDbBh8i5xRiA/87rjSVfj+tB1BvDlXSgn
	eSE6hF0h9a1o7Mrgdzfx8Cz9PG4GiaC4g3v2DqZBcXRQBFjxmfG4UtZtqJsWjkrm2XkF
	LsqzvzzHFF/FKC+s/8EXNkCeGYDM6IhNUOMK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=KKnxfdtb5YrF7KO4vOYt7fpX58Z6XS5fgwB4I5KK3c3p4dEP5j/Ps6BeH5HNHUus24
	7odSKSuZUctIia5bjHdMnD5rKoOosXVMAj+CGxcx+cLaU18muFiKj0SoZ3IUQySIkTJN
	GqyJDfdVQdEbKHbbFp7/YNUxYju5PIsWWYj18=
Received: by 10.204.139.199 with SMTP id f7mr1082299bku.23.1306443861965;
	Thu, 26 May 2011 14:04:21 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id a28sm578094fak.1.2011.05.26.14.04.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 14:04:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2011 23:04:13 +0200
Message-Id: <1306443853-4315-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc3
Subject: [PATCH] console-tools: use u-a also for fgconsole otherwise it collides with busybox
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
X-List-Received-Date: Thu, 26 May 2011 21:09:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../console-tools/console-tools_0.3.2.bb           |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index c7bee61..c740119 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
 SUMMARY = "Allows you to set-up and manipulate the Linux console."
 DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://codepage.patch;patch=1 \
@@ -37,17 +37,20 @@ do_install () {
 	mv ${D}${bindir}/chvt ${D}${bindir}/chvt.${PN}
 	mv ${D}${bindir}/deallocvt ${D}${bindir}/deallocvt.${PN}
 	mv ${D}${bindir}/openvt ${D}${bindir}/openvt.${PN}
+	mv ${D}${bindir}/fgconsole ${D}${bindir}/fgconsole.${PN}
 }
 
 pkg_postinst_${PN} () {
 	update-alternatives --install ${bindir}/chvt chvt chvt.${PN} 100
 	update-alternatives --install ${bindir}/deallocvt deallocvt deallocvt.${PN} 100
 	update-alternatives --install ${bindir}/openvt openvt openvt.${PN} 100
+	update-alternatives --install ${bindir}/fgconsole fgconsole fgconsole.${PN} 100
 }
 
 pkg_prerm_${PN} () {
 	update-alternatives --remove chvt chvt.${PN}
 	update-alternatives --remove deallocvt deallocvt.${PN}
 	update-alternatives --remove openvt openvt.${PN}
+	update-alternatives --remove fgconsole fgconsole.${PN}
 }
 
-- 
1.7.5.rc3



