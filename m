Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id BA0E07F971
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 23:24:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:19 -0800
X-IronPort-AV: E=Sophos;i="5.68,318,1569308400"; d="scan'208";a="195955434"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.20.29])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2019 15:24:18 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 07:23:35 +0800
Message-Id: <20191117232337.5635-6-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117232337.5635-1-anuj.mittal@intel.com>
References: <20191117232337.5635-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [zeus][PATCH 5/7] sysstat: Correct our systemd unit file
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
X-List-Received-Date: Sun, 17 Nov 2019 23:24:17 -0000
Content-Transfer-Encoding: 8bit

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

In commit 8862f21e (sysstat: 12.1.3 -> 12.1.6), sa_lib_dir was changed
from "${libdir}/sa" to "${libexecdir}/sa" to avoid problems with
multilib. However, the systemd unit file was not changed accordingly,
which lead to the following error when trying to start the service:

  systemd[4698]: sysstat.service: Failed at step EXEC spawning
  /usr/lib/sa/sa1: No such file or directory

(From OE-Core rev: 0fd691b9801b5313ff2e2c2cd5ca13fd50063235)

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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


