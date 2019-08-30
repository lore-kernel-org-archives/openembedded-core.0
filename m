Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9B9A7F2F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 07:37:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x7U7bpq5015574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 00:37:51 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Fri, 30 Aug 2019 00:37:51 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2019 15:37:46 +0800
Message-ID: <1567150670-252374-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] avahi-ui: support usrmerge
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
X-List-Received-Date: Fri, 30 Aug 2019 07:37:50 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.7.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
index a77653b..1c6e46a 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.7.bb
@@ -20,7 +20,13 @@ FILES_avahi-discover = "${datadir}/applications/avahi-discover.desktop \
 
 do_install_append () {
 	rm ${D}${sysconfdir} -rf
-	rm ${D}${base_libdir} -rf
+	if ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','true','false',d)}; then
+               if [ "${nonarch_base_libdir}" != "${base_libdir}" ];then
+                   rm ${D}${nonarch_base_libdir} -rf
+               fi
+        else
+		rm ${D}${base_libdir} -rf
+        fi
 	rm ${D}${systemd_unitdir} -rf
 	# The ${systemd_unitdir} is /lib/systemd, so we need rmdir /lib,
 	# but not ${base_libdir} here. And the /lib may not exist
-- 
2.7.4


