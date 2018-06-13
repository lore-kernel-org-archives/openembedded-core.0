Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3331078F3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 07:56:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5D7uEv8027551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 00:56:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Wed, 13 Jun 2018 00:56:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jun 2018 15:58:21 +0800
Message-ID: <b717d2e930f9c34b69ad78e9d82c0d0fd55e726f.1528870775.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1528870775.git.Qi.Chen@windriver.com>
References: <cover.1528870775.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] watchdog: disable systemd services by default
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
X-List-Received-Date: Wed, 13 Jun 2018 07:56:13 -0000
Content-Type: text/plain

systemd has internal support for watchdog. See the RuntimeWatchdogSec
in /etc/systemd/system.conf.

We'd better just disable this service by default. If users want to use
watchdog, consider using the systemd one.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index d3f0353..bfaed9a 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -40,6 +40,9 @@ INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 SYSTEMD_PACKAGES = "${PN} ${PN}-keepalive"
 SYSTEMD_SERVICE_${PN} = "watchdog.service"
 SYSTEMD_SERVICE_${PN}-keepalive = "wd_keepalive.service"
+# When using systemd, consider making use of internal watchdog support of systemd.
+# See RuntimeWatchdogSec in /etc/systemd/system.conf.
+SYSTEMD_AUTO_ENABLE = "disable"
 
 do_install_append() {
 	install -d ${D}${systemd_system_unitdir}
-- 
1.9.1


