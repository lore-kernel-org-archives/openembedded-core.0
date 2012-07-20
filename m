Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SsHtJ-0005T5-Tj
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 20:25:30 +0200
Received: by yhjj56 with SMTP id j56so3975277yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 11:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gLrUtE6maZ16qFpRU8S2J2zoqVXcZ1phlmKm/WvXD4Y=;
	b=gyTWdTppXFD/psOGunO25L/Qeus+bpJMMi/FdEdvzY1l+DZGpdLAjoZaM8ugTaqtBB
	65OrKKTrKUh9AKarYjd4HgCQ3CWuJkK9BQx7rR5oXS7BkxbTHnYkjIzV2q4Gj9TVMx7K
	DRhcOtzJTZv7uNHv1aoEMRxj5vN9ZYafHuwHj/KTXFHs1XubmidadG7du9IetD/VBInH
	M9Kkd5KFta7MAVAy9GQedb2SaeRp6J36CBcQSN19+0yTSk1HQFidU1mmNcvSEokjdJt2
	PFHjnooL9YnaeqaHOTPTSupMEExIu1V4Zzvp0pxrtRZhTSKlGB939pe5EpLKBKghkL5g
	A+jw==
Received: by 10.101.16.14 with SMTP id t14mr1064538ani.33.1342808046211;
	Fri, 20 Jul 2012 11:14:06 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id s1sm5609408anl.8.2012.07.20.11.14.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 11:14:05 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2012 15:13:51 -0300
Message-Id: <1342808031-21564-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1342808031-21564-1-git-send-email-otavio@ossystems.com.br>
References: <1342808031-21564-1-git-send-email-otavio@ossystems.com.br>
Subject: [PATCH 2/2] shadow: use 'users' group by default
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
X-List-Received-Date: Fri, 20 Jul 2012 18:25:30 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index 506f4e6..b9ff6e0 100644
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
+	sed -i sed 's,^GROUP=1000,GROUP=100,g' ${D}${sysconfdir}/default/useradd
+
 	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
 
 	# Move binaries to the locations we want
-- 
1.7.2.5



