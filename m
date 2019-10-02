Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D08407E9CD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 18:28:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x92ISPC2005679
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Oct 2019 11:28:26 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 2 Oct 2019 11:28:25 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Oct 2019 14:28:24 -0400
Message-ID: <20191002182824.38571-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] watchdog: fix service PIDFile in do_install_append
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
X-List-Received-Date: Wed, 02 Oct 2019 18:28:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

systemd requests an update to the unit file for watchdog.service
due to the contents of PIDFile:

  systemd[1]: /usr/lib/systemd/system/watchdog.service:11: PIDFile=
    references a path below legacy directory /var/run/, updating
    /var/run/watchdog.pid → /run/watchdog.pid; please update the
    unit file accordingly.

Use sed in do_install_append to fix the path from
/var/run/watchdog.pid to /run/watchdog.pid. This change is
recommended in services with the "forking" type (see commit
a9353a5c5b in systemd source).

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 1acab2e9e7..83a4ef27cf 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -51,8 +51,12 @@ do_install_append() {
 
 	install -Dm 0755 ${WORKDIR}/watchdog.init ${D}/${sysconfdir}/init.d/watchdog
 	install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
+    
+    # watchdog is of type "forking", so fix PIDFile to avoid warnings from
+    # systemd
+    sed -i 's@/var/run@/run@g' ${D}${systemd_system_unitdir}/watchdog.service
 
-	# watchdog.conf is provided by the watchdog-config recipe
+    # watchdog.conf is provided by the watchdog-config recipe
 	rm ${D}${sysconfdir}/watchdog.conf
 }
 
-- 
2.21.0


