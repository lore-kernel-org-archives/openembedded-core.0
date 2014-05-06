Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id C3B6E65FE5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 12:17:56 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,997,1389740400"; d="scan'208";a="50770615"
Received: from cosnadexc21.usr.ingenico.loc ([10.31.4.221])
	by antispam1.usr.ingenico.loc with ESMTP; 06 May 2014 14:17:47 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC21.usr.ingenico.loc (10.31.4.221) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Tue, 6 May 2014 14:17:47 +0200
Received: from u56.usr.ingenico.loc (10.23.7.56) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 6 May 2014 14:17:46 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 May 2014 14:17:50 +0200
Message-ID: <1399378673-32040-4-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1399378673-32040-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] dropbear: avoid pipe with sed
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
X-List-Received-Date: Tue, 06 May 2014 12:17:57 -0000
Content-Type: text/plain

Replace:
cat <file> | sed -e xxx
By:
sed -e xxx <file>

+ fix indentation

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 meta/recipes-core/dropbear/dropbear.inc | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 5a7be49..9fec09e 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -46,12 +46,12 @@ CFLAGS += "-DSFTPSERVER_PATH=\\"${libdir}/openssh/sftp-server\\""
 
 do_install() {
 	install -d ${D}${sysconfdir} \
-		   ${D}${sysconfdir}/init.d \
-		   ${D}${sysconfdir}/default \
-		   ${D}${sysconfdir}/dropbear \
-                   ${D}${bindir} \
-		   ${D}${sbindir} \
-		   ${D}${localstatedir}
+		${D}${sysconfdir}/init.d \
+		${D}${sysconfdir}/default \
+		${D}${sysconfdir}/dropbear \
+		${D}${bindir} \
+		${D}${sbindir} \
+		${D}${localstatedir}
 
 	install -m 0755 dropbearmulti ${D}${sbindir}/
 	ln -s ${sbindir}/dropbearmulti ${D}${bindir}/dbclient
@@ -60,11 +60,11 @@ do_install() {
 	do
 		ln -s ./dropbearmulti ${D}${sbindir}/$i
 	done
-	cat ${WORKDIR}/init | sed -e 's,/etc,${sysconfdir},g' \
-				  -e 's,/usr/sbin,${sbindir},g' \
-				  -e 's,/var,${localstatedir},g' \
-				  -e 's,/usr/bin,${bindir},g' \
-				  -e 's,/usr,${prefix},g' > ${D}${sysconfdir}/init.d/dropbear
+	sed -e 's,/etc,${sysconfdir},g' \
+		-e 's,/usr/sbin,${sbindir},g' \
+		-e 's,/var,${localstatedir},g' \
+		-e 's,/usr/bin,${bindir},g' \
+		-e 's,/usr,${prefix},g' ${WORKDIR}/init > ${D}${sysconfdir}/init.d/dropbear
 	chmod 755 ${D}${sysconfdir}/init.d/dropbear
 	if [ "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}" = "pam" ]; then
 		install -d ${D}${sysconfdir}/pam.d
@@ -77,9 +77,9 @@ do_install() {
 	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${systemd_unitdir}/system
 	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${systemd_unitdir}/system
 	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
-	       -e 's,@BINDIR@,${bindir},g' \
-	       -e 's,@SBINDIR@,${sbindir},g' \
-	       ${D}${systemd_unitdir}/system/dropbear.socket ${D}${systemd_unitdir}/system/*.service
+		-e 's,@BINDIR@,${bindir},g' \
+		-e 's,@SBINDIR@,${sbindir},g' \
+		${D}${systemd_unitdir}/system/dropbear.socket ${D}${systemd_unitdir}/system/*.service
 }
 
 inherit update-alternatives
-- 
1.8.5.4


