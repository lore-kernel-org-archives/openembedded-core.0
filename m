Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D81FF71B5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Nov 2016 04:17:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAP4HFiq006433
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:17:15 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 24 Nov 2016 20:17:14 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Nov 2016 23:17:14 -0500
Message-ID: <1480047434-20600-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] systemd.bbclass: don't block on service restart
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
X-List-Received-Date: Fri, 25 Nov 2016 04:17:15 -0000
Content-Type: text/plain

The current class works fine when a recipe uses SYSTEMD_AUTO_ENABLE
'enable' and has no on device pkg_postinst(), ie when the postinst is
run as part of rootfs creation.  However, when there is a component of
pkg_postinst() that is run on device the 'systemctl restart' is run as
part of the run_postinsts.service at boot. This results in the boot
spinning indefinitely with:

[ *** ] A start job is running for Run pending postinsts (7s / no limit)

The issue could potentially be that the packages service has an
'After' clause which comes later in the boot, beyond
run_postinsts.service, creating a chicken before the egg
scenario. Even service files without an 'After' clause cause this
situation however. Despite this not being the cause of the issue this
fix will prevent this scenario from happenning.

Using strace we are able to find that during boot, when
run_postinsts.service is running attempting to start or restart any
service will result in the call get stuck on poll(). Since the
run_postinsts.service does not monitor the outcome of the call to
restart we can work around this by using '--no-block'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/classes/systemd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 7e51ed6..99a08a0 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -36,7 +36,7 @@ if type systemctl >/dev/null 2>/dev/null; then
 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		systemctl restart ${SYSTEMD_SERVICE}
+		systemctl --no-block restart ${SYSTEMD_SERVICE}
 	fi
 fi
 }
-- 
2.7.4


