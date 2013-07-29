Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id DDF8E60958
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:09:11 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r6T895YQ026266; 
	Mon, 29 Jul 2013 03:09:11 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 13:09:52 +0500
Message-Id: <1375085392-12339-2-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1375085392-12339-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1375085392-12339-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 2/2] busybox: Add syslog-init alternative only if SysV in enabled
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
X-List-Received-Date: Mon, 29 Jul 2013 08:09:12 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

If systemd is enabled then syslog is handled through a service file
and related files in /etc/init.d are removed. This removes following
warning:

WARNING: busybox: NOT adding alternative provide /etc/init.d/syslog:
/etc/init.d/syslog.busybox does not exist

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-core/busybox/busybox.inc |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index acd2bfb..2f26953 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -280,10 +280,15 @@ inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "50"
 
-ALTERNATIVE_${PN}-syslog = "syslog-init syslog-startup-conf"
+ALTERNATIVE_${PN}-syslog = "syslog-startup-conf"
 
-ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
-ALTERNATIVE_TARGET[syslog-init] = "${sysconfdir}/init.d/syslog.${BPN}"
+python () {
+    if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
+        pn = d.getVar('PN', True)
+        d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-init')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (d.getVar('sysconfdir', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+}
 
 ALTERNATIVE_LINK_NAME[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf"
 ALTERNATIVE_TARGET[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf.${BPN}"
-- 
1.7.9.5


