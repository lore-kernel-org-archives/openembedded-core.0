Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 18A1E60EF6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2013 15:05:36 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r92F5Xks004433; 
	Wed, 2 Oct 2013 10:05:36 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Oct 2013 20:07:12 +0500
Message-Id: <1380726432-25519-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] opkg: ignore result of opkg configure
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
X-List-Received-Date: Wed, 02 Oct 2013 15:05:37 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

Some packages may return error while running opkg-cl configure, during
first boot. This will fail 'ExecStart' and 'ExecStartPost' will not run.
Without 'ExecStartPost' opkg-configure service will continue to run on
successive boot attempts. 'ExecStartPost' should disable this service
after first boot irrespective of 'ExecStart' status.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../opkg/opkg/opkg-configure.service               |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg/opkg/opkg-configure.service b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
index a1c3a31..b18295b 100644
--- a/meta/recipes-devtools/opkg/opkg/opkg-configure.service
+++ b/meta/recipes-devtools/opkg/opkg/opkg-configure.service
@@ -7,7 +7,7 @@ Before=sysinit.target
 [Service]
 Type=oneshot
 EnvironmentFile=-@SYSCONFDIR@/default/postinst
-ExecStart=@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/opkg-cl configure > $LOGFILE 2>&1; else @BINDIR@/opkg-cl configure; fi"
+ExecStart=-@BASE_BINDIR@/sh -c " if [ $POSTINST_LOGGING = '1' ]; then @BINDIR@/opkg-cl configure > $LOGFILE 2>&1; else @BINDIR@/opkg-cl configure; fi"
 ExecStartPost=@BASE_BINDIR@/systemctl disable opkg-configure.service
 StandardOutput=syslog
 RemainAfterExit=No
-- 
1.7.9.5


