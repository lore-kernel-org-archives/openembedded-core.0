Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1StMkZ-0003yw-MK
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 19:48:55 +0200
Received: by yenl13 with SMTP id l13so5304136yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 10:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=pUHC+LGo4gu7JZuU3cCEeAyP671bnVreM+Cs+/L5ctM=;
	b=lk1RvvQ0irZIM+rKMaCvob727Wo416BSaTe7xS2JTrIqRr+rKdTqyzapiO0VNBCkGH
	LWGxRBMvW/E4oBXn3tGLchFDJ6DkIBgjKHRJ9wIfq76fNwbtSSArHvEOP+9Cwwlx35Sz
	eMYzuZDUR1W/rxnqhWYXZaDghLiGVnjRO0HayJzznN8czC7luMGWl2CTxVEjhWEi1gzo
	YuBISZYnbdEv3YVsSgnJhbA23keYksrrqtm2ExLQWv5iUVsWINyFrLOsUlxWFjAZDfxH
	Can5eOKCWYXPTRTR8lOOoAxxQcTfwraKLOPNscw6kpZhymt7iJ390GNvu2rBChfxyBf6
	Lu7w==
Received: by 10.236.125.133 with SMTP id z5mr6280703yhh.121.1343065048254;
	Mon, 23 Jul 2012 10:37:28 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id r9sm9104936anj.9.2012.07.23.10.37.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 10:37:27 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2012 14:37:17 -0300
Message-Id: <1343065037-13851-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1343065037-13851-1-git-send-email-otavio@ossystems.com.br>
References: <1343065037-13851-1-git-send-email-otavio@ossystems.com.br>
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
X-List-Received-Date: Mon, 23 Jul 2012 17:48:55 -0000

The rootfs has 'users' group at number 100 and without this fix it
would assign to a non-existent group and if a group with gid as 1000
is created later it would own all files for users created.

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



