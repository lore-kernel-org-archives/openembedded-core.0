Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 623C46067C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 11:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DBDE018082
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 12:08:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id XZbo62KL0sdk
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 12:08:00 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 8DD1A180FE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 12:08:00 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 6FFCC1501
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 12:08:00 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 6499ADF8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 12:08:00 +0100 (CET)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by seth.se.axis.com (Postfix) with ESMTP id 5F6F43E4F4;
	Wed,  2 Dec 2015 12:08:00 +0100 (CET)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id 9CE74801E7E; Wed,  2 Dec 2015 12:07:40 +0100 (CET)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Dec 2015 12:07:38 +0100
Message-Id: <1449054458-30710-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>
Subject: [PATCH] base-passwd: Make it possible to build and install native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Dec 2015 11:08:06 -0000

In order to be able to install the package base-passwd-native in the
sysroot, make it possible to override the install options specifying
the owner and group names for native.

This change is needed for introducing pseudo-native support. I.e.,
to be able to install, chown, into the sysroot with users and groups
that are not available on the build host by default.

Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
---
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index ac9bd81..1ec0c81 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -21,18 +21,26 @@ inherit autotools
 
 SSTATEPOSTINSTFUNCS += "base_passwd_sstate_postinst"
 
+# Make it possible to build base-passwd-native
+BBCLASSEXTEND += "native"
+# Make it possible to override these install options for class native
+OWN = "root"
+GROUP = "root"
+INSTALL_OPTS = "-o ${OWN} -g ${GROUP}"
+INSTALL_OPTS_class-native = ""
+
 do_install () {
 	install -d -m 755 ${D}${sbindir}
-	install -o root -g root -p -m 755 ${B}/update-passwd ${D}${sbindir}/
+	install ${INSTALL_OPTS} -p -m 755 ${B}/update-passwd ${D}${sbindir}/
 	install -d -m 755 ${D}${mandir}/man8 ${D}${mandir}/pl/man8
 	install -p -m 644 ${S}/man/update-passwd.8 ${D}${mandir}/man8/
 	install -p -m 644 ${S}/man/update-passwd.pl.8 \
 		${D}${mandir}/pl/man8/update-passwd.8
 	gzip -9 ${D}${mandir}/man8/* ${D}${mandir}/pl/man8/*
 	install -d -m 755 ${D}${datadir}/base-passwd
-	install -o root -g root -p -m 644 ${S}/passwd.master ${D}${datadir}/base-passwd/
+	install ${INSTALL_OPTS} -p -m 644 ${S}/passwd.master ${D}${datadir}/base-passwd/
 	sed -i 's#:/root:#:${ROOT_HOME}:#' ${D}${datadir}/base-passwd/passwd.master
-	install -o root -g root -p -m 644 ${S}/group.master ${D}${datadir}/base-passwd/
+	install ${INSTALL_OPTS} -p -m 644 ${S}/group.master ${D}${datadir}/base-passwd/
 
 	install -d -m 755 ${D}${docdir}/${BPN}
 	install -p -m 644 ${S}/debian/changelog ${D}${docdir}/${BPN}/
-- 
1.9.1


