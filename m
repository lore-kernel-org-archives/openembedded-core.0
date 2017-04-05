Return-Path: <romain.perier@collabora.com>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 80F8B77BE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:05:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: rperier) with ESMTPSA id A98E02656B8
From: Romain Perier <romain.perier@collabora.com>
To: liezhi.yang@windriver.com
Date: Wed,  5 Apr 2017 17:05:21 +0200
Message-Id: <20170405150521.19160-3-romain.perier@collabora.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170405150521.19160-1-romain.perier@collabora.com>
References: <20170405150521.19160-1-romain.perier@collabora.com>
Cc: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] logrotate: Add systemd support
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
X-List-Received-Date: Wed, 05 Apr 2017 15:05:43 -0000

Currently, this recipe only supports daily scheduling via a cron job.
This commit adds support for systemd in the recipe, as the feature is
already supported on upstream. When the corresponding distro feature
is enabled the systemd variant will be used. The timer granularity and
its accuracy are also configurable.

Signed-off-by: Romain Perier <romain.perier@collabora.com>
---
 .../recipes-extended/logrotate/logrotate_3.11.0.bb | 25 +++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.11.0.bb b/meta/recipes-extended/logrotate/logrotate_3.11.0.bb
index d72c7f0..b75496d 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.11.0.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.11.0.bb
@@ -46,14 +46,33 @@ EXTRA_OEMAKE = "\
 # INSTALL=install and BASEDIR=/usr.
 OS_NAME = "Linux"
 
-inherit autotools
+inherit autotools systemd
+
+SYSTEMD_AUTO_ENABLE = "disable"
+SYSTEMD_SERVICE_${PN} = "\
+    ${PN}.service \
+    ${PN}.timer \
+"
+
+LOGROTATE_SYSTEMD_TIMER_BASIS ?= "daily"
+LOGROTATE_SYSTEMD_TIMER_ACCURACY ?= "12h"
 
 do_install(){
     oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
     mkdir -p ${D}${sysconfdir}/logrotate.d
-    mkdir -p ${D}${sysconfdir}/cron.daily
     mkdir -p ${D}${localstatedir}/lib
     install -p -m 644 ${S}/examples/logrotate-default ${D}${sysconfdir}/logrotate.conf
-    install -p -m 755 ${S}/examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
     touch ${D}${localstatedir}/lib/logrotate.status
+
+    # Install systemd unit files
+    if [ "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}" = "systemd" ]; then
+        install -d ${D}${systemd_system_unitdir}
+        install -m 0644 ${S}/examples/logrotate.service ${D}${systemd_system_unitdir}/logrotate.service
+        install -m 0644 ${S}/examples/logrotate.timer ${D}${systemd_system_unitdir}/logrotate.timer
+        sed -i -e 's,OnCalendar=.*$,OnCalendar=${LOGROTATE_SYSTEMD_TIMER_BASIS},g' ${D}${systemd_system_unitdir}/logrotate.timer
+        sed -i -e 's,AccuracySec=.*$,AccuracySec=${LOGROTATE_SYSTEMD_TIMER_ACCURACY},g' ${D}${systemd_system_unitdir}/logrotate.timer
+    else
+        mkdir -p ${D}${sysconfdir}/cron.daily
+        install -p -m 0755 ${S}/examples/logrotate.cron ${D}${sysconfdir}/cron.daily/logrotate
+    fi
 }
-- 
2.9.3


