Return-Path: <damien.riegel@savoirfairelinux.com>
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com
	[208.88.110.44])
	by mail.openembedded.org (Postfix) with ESMTP id 27F9C771A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2018 20:35:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 5D2B39C3062;
	Thu, 21 Jun 2018 16:35:55 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id 2YguaBM0Ym5E; Thu, 21 Jun 2018 16:35:54 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id E1ADF9C3551;
	Thu, 21 Jun 2018 16:35:54 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
	by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id gJqk-gnuEQQS; Thu, 21 Jun 2018 16:35:54 -0400 (EDT)
Received: from workotop.mtl.sfl (unknown [192.168.50.174])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id B7E2F9C3062;
	Thu, 21 Jun 2018 16:35:54 -0400 (EDT)
From: Damien Riegel <damien.riegel@savoirfairelinux.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Jun 2018 16:35:49 -0400
Message-Id: <20180621203549.6187-1-damien.riegel@savoirfairelinux.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] systemd: quote SYSTEMD_SERVICE in prerm and postinst
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
X-List-Received-Date: Thu, 21 Jun 2018 20:35:56 -0000

Systemd mount configuration file must have a name that match the mount
point directory they control. So for instance, if a mount file contains

    [Mount]
    ...
    Where=/mnt/my-data

The file must be named `mnt-my\x2ddata.mount`, or systemd will refuse to
honour it.

If this config file contains an [Install] section, it will silently fail
because the unit file is not quoted when systemctl is called. To fix
that, quote `${SYSTEMD_SERVICE}` in prerm and postinst hooks.

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
 meta/classes/systemd.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 1b134322fb..589e73c855 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -34,10 +34,10 @@ if type systemctl >/dev/null 2>/dev/null; then
 		systemctl daemon-reload
 	fi
 
-	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
+	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} "${SYSTEMD_SERVICE}"
 
 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		systemctl --no-block restart ${SYSTEMD_SERVICE}
+		systemctl --no-block restart "${SYSTEMD_SERVICE}"
 	fi
 fi
 }
@@ -51,10 +51,10 @@ fi
 
 if type systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE}
+		systemctl stop "${SYSTEMD_SERVICE}"
 	fi
 
-	systemctl $OPTS disable ${SYSTEMD_SERVICE}
+	systemctl $OPTS disable "${SYSTEMD_SERVICE}"
 fi
 }
 
-- 
2.17.1


