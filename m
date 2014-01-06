Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E358A60D27
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 16:53:10 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1W0DQN-0004g8-6Y from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jan 2014 08:53:11 -0800
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 6 Jan 2014 08:53:10 -0800
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2014 21:43:33 +0500
Message-Id: <1389026613-56095-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 06 Jan 2014 16:53:11.0264 (UTC)
	FILETIME=[C86E3E00:01CF0AFF]
Subject: [PATCH] lighttpd: add www/{logs,var} symlinks
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
X-List-Received-Date: Mon, 06 Jan 2014 16:53:12 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

For FHS compliance, create symbolic links to write variable data
to standard paths

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
index 528fda7..2ddab16 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.33.bb
@@ -47,7 +47,7 @@ INITSCRIPT_PARAMS = "defaults 70"
 SYSTEMD_SERVICE_${PN} = "lighttpd.service"
 
 do_install_append() {
-	install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
+	install -d ${D}${sysconfdir}/init.d ${D}/www/pages/dav
 	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
 	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
@@ -58,6 +58,9 @@ do_install_append() {
 		-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 		-e 's,@BASE_BINDIR@,${base_bindir},g' \
 		${D}${systemd_unitdir}/system/lighttpd.service
+	#For FHS compliance, create symbolic links to /var/log and /var/tmp for logs and temporary data
+	ln -sf ${localstatedir}/log ${D}/www/logs
+	ln -sf ${localstatedir}/tmp ${D}/www/var
 }
 
 FILES_${PN} += "${sysconfdir} /www"
-- 
1.7.9.5


