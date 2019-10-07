Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A79627D72F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2019 17:56:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x97HuLBf026226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 7 Oct 2019 10:56:21 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 7 Oct 2019 10:56:20 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Oct 2019 13:56:20 -0400
Message-ID: <20191007175620.27334-1-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] watchdog: fix PIDFile path in existing patch
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
X-List-Received-Date: Mon, 07 Oct 2019 17:56:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

systemd throws a warning about the value of PIDFile:

  systemd[1]: /usr/lib/systemd/system/watchdog.service:11: PIDFile=
    references a path below legacy directory /var/run/, updating
    /var/run/watchdog.pid → /run/watchdog.pid; please update the
    unit file accordingly.

This is actually due to patch file 0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch
setting PIDFile=/var/run/watchdog.pid. Modify PIDFile in the patch
to be correctly set to /run/watchdog.pid.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 ...1-watchdog-remove-interdependencies-of-watchdog-and-wd.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch b/meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch
index 338e0cd14f..075a98e5e5 100644
--- a/meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch
+++ b/meta/recipes-extended/watchdog/watchdog/0001-watchdog-remove-interdependencies-of-watchdog-and-wd.patch
@@ -34,7 +34,7 @@ index 7a2fc36..f31d1fe 100644
 -ExecStart=/bin/sh -c '[ $run_watchdog != 1 ] || exec /usr/sbin/watchdog $watchdog_options'
 -ExecStopPost=/bin/sh -c '[ $run_wd_keepalive != 1 ] || false'
 +ExecStart=/bin/sh -c '[ x$run_watchdog != x1 ] || exec /usr/sbin/watchdog $watchdog_options'
-+PIDFile=/var/run/watchdog.pid
++PIDFile=/run/watchdog.pid
  
  [Install]
 -WantedBy=default.target
-- 
2.21.0


