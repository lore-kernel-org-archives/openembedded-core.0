Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SsIsq-0006W2-Q6
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 21:29:04 +0200
Received: by yenl13 with SMTP id l13so4038323yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 12:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=VeUTCRyfjKbCSqcK+MusMHzlmDCVwgJ12aF3UKcqYBo=;
	b=VZK+hU8avBV/5bM+uH5QvenFuVEh1kH/5fVKmz1ZBdHmV8dUPI0fZjOP5/id0ibiBa
	+r0Uh0cDUmzLu+mzMflvPjPxe9u9ghYF64R/tf7e+fwv1gm/FtC0blRgbj7u13EPM3Ln
	4UxFJK7VlorHxjPV12RUytSCfXw37N0L++fSmRzar/yw9XtNiR7ZcfX07o6lknRSSi3U
	AMGeyezEcnmDVHybTliga7rmTI7i5cg/7U/LJm8r0pQtdLYuzmPf8DfAFkiHQ0UELYfo
	UlJkxCunfGD/W9ewtR6mXXHbpu1l8JYYy3kjA08mNf1WQLLym4NzGlQNr9hxo66YPGUv
	hPqg==
Received: by 10.236.191.69 with SMTP id f45mr6715307yhn.8.1342811861067;
	Fri, 20 Jul 2012 12:17:41 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id b8sm5763262anm.4.2012.07.20.12.17.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 12:17:39 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 16:17:29 -0300
Message-Id: <1342811849-11556-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1342811849-11556-1-git-send-email-otavio@ossystems.com.br>
References: <1342811849-11556-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH v2 2/2] shadow: use 'users' group by default
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
X-List-Received-Date: Fri, 20 Jul 2012 19:29:05 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 506f4e6..de10f64 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
@@ -85,6 +85,9 @@ do_install_append() {
 	sed -i 's:/bin/bash:/bin/sh:g' ${D}${sysconfdir}/default/useradd
 	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
 
+	# Use users group by default
+	sed -i 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
+
 	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
 
 	# Move binaries to the locations we want
-- 
1.7.2.5



