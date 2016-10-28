Return-Path: <linus@scypho.com>
X-Greylist: delayed 328 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 28 Oct 2016 14:42:04 UTC
Received: from mx-out01.mykolab.com (mx.kolabnow.com [95.128.36.1])
	by mail.openembedded.org (Postfix) with ESMTP id C2C4471A2B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 14:42:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=6.31
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham
Received: from mx03.mykolab.com (mx03.mykolab.com [10.20.7.101])
	by mx-out01.mykolab.com (Postfix) with ESMTPS id BC06A60D71
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 16:36:30 +0200 (CEST)
Received: from linus by linus.scypho.com with local (Exim 4.87)
	(envelope-from <linus@scypho.com>)
	id 1c08Gj-000499-MX; Fri, 28 Oct 2016 16:36:29 +0200
From: Linus Wallgren <linus.wallgren@scypho.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 16:36:27 +0200
Message-Id: <20161028143627.15891-1-linus.wallgren@scypho.com>
Subject: [PATCH] systemd: Reload configuration on package install
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
X-List-Received-Date: Fri, 28 Oct 2016 14:42:05 -0000

When a systemd service file has changed it is required to reload
systemd's configuration. Otherwise changes to a service file will not be
picked up during package upgrade.
---
 meta/classes/systemd.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index d56c760..7e51ed6 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -29,6 +29,10 @@ if [ -n "$D" ]; then
 fi
 
 if type systemctl >/dev/null 2>/dev/null; then
+	if [ -z "$D" ]; then
+		systemctl daemon-reload
+	fi
+
 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 
 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-- 
2.9.3


