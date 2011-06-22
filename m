Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZRED-0007UB-R9
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:28:38 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHP2SY026618
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:02 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:02 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:35:56 -0500
Message-ID: <7e9ca99962148df2cee0f69ba2f7408788789af5.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 02/40] base-passwd: Fix owners/groups
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
X-List-Received-Date: Wed, 22 Jun 2011 17:28:38 -0000
Content-Type: text/plain

Fix the owners and groups of specific files copied from the developmen tree.
This resolves an issue where those files gain the user/group id of the build
user.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index 3315c68..7b1fdf1 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r2"
+PR = "r3"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
@@ -21,16 +21,16 @@ SSTATEPOSTINSTFUNCS += "base_passwd_sstate_postinst"
 
 do_install () {
 	install -d -m 755 ${D}${sbindir}
-	install -p -m 755 update-passwd ${D}${sbindir}/
+	install -o root -g root -p -m 755 update-passwd ${D}${sbindir}/
 	install -d -m 755 ${D}${mandir}/man8 ${D}${mandir}/pl/man8
 	install -p -m 644 man/update-passwd.8 ${D}${mandir}/man8/
 	install -p -m 644 man/update-passwd.pl.8 \
 		${D}${mandir}/pl/man8/update-passwd.8
 	gzip -9 ${D}${mandir}/man8/* ${D}${mandir}/pl/man8/*
 	install -d -m 755 ${D}${datadir}/base-passwd
-	install -p -m 644 passwd.master ${D}${datadir}/base-passwd/
-	install -p -m 644 group.master ${D}${datadir}/base-passwd/
-	install -p -m 644 ${S}/../login.defs ${D}${datadir}/base-passwd/login.defs
+	install -o root -g root -p -m 644 passwd.master ${D}${datadir}/base-passwd/
+	install -o root -g root -p -m 644 group.master ${D}${datadir}/base-passwd/
+	install -o root -g root -p -m 644 ${S}/../login.defs ${D}${datadir}/base-passwd/login.defs
 
 	install -d -m 755 ${D}${docdir}/${PN}
 	install -p -m 644 debian/changelog ${D}${docdir}/${PN}/
-- 
1.7.3.4



