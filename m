Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7BEEB7D6B4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 05:14:09 +0000 (UTC)
IronPort-SDR: N1w2NfbYAdK6APHzf3gxkgn9MUsKztS7jhCBBZ+YCM+nCQDdv52YDmgTOWeU69IScMn3/ysNFv
	d1bW/igB9lBXEhB803ICOy1WTXkhSbtkb4xNfBqiZ/8nx0mzSqiJZzVq0TWZW1Ejvsp4QXjpzA
	miwrzOrNezF/1zYDQKXWaZW/hAwa/HdFaS8jR6+R9j0gFKfy9SFjRaO527B4gGaU52dePjAETt
	1ER7CDKQ4DsevWfQNrvgYtZTHW/xxp2jAmaaw2kARh3UXWSMZ4ytAYosFiKttkdBNeXGyCDASX
	iyg=
X-IronPort-AV: E=Sophos;i="5.68,299,1569276000"; 
   d="scan'208";a="2454924"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 06:14:03 +0100
Message-Id: <20191113051404.17934-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [master][zeus][PATCH 1/2] sysstat: Correct our systemd unit file
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
X-List-Received-Date: Wed, 13 Nov 2019 05:14:11 -0000
Content-Transfer-Encoding: 8bit

In commit 8862f21e (sysstat: 12.1.3 -> 12.1.6), sa_lib_dir was changed
from "${libdir}/sa" to "${libexecdir}/sa" to avoid problems with
multilib. However, the systemd unit file was not changed accordingly,
which lead to the following error when trying to start the service:

  systemd[4698]: sysstat.service: Failed at step EXEC spawning
  /usr/lib/sa/sa1: No such file or directory

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/sysstat/sysstat.inc             | 4 ++--
 meta/recipes-extended/sysstat/sysstat/sysstat.service | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 5a7d2114ca..9394090136 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -49,7 +49,7 @@ do_install() {
 	        if ${@bb.utils.contains('PACKAGECONFIG', 'cron', 'false', 'true', d)}; then
 			install -d ${D}${systemd_unitdir}/system
 			install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
-			sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
+			sed -i -e 's#@LIBEXECDIR@#${libexecdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
 	        fi
 	fi
 }
@@ -62,6 +62,6 @@ pkg_postinst_${PN} () {
 	fi
 }
 
-FILES_${PN} += "${libdir}/sa ${systemd_system_unitdir}"
+FILES_${PN} += "${systemd_system_unitdir}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta/recipes-extended/sysstat/sysstat/sysstat.service b/meta/recipes-extended/sysstat/sysstat/sysstat.service
index aff07109f5..ca46befb99 100644
--- a/meta/recipes-extended/sysstat/sysstat/sysstat.service
+++ b/meta/recipes-extended/sysstat/sysstat/sysstat.service
@@ -5,7 +5,7 @@ Description=Resets System Activity Logs
 Type=oneshot
 RemainAfterExit=yes
 User=root
-ExecStart=@LIBDIR@/sa/sa1 --boot
+ExecStart=@LIBEXECDIR@/sa/sa1 --boot
 
 [Install]
 WantedBy=multi-user.target
-- 
2.21.0


