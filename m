Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4511E6B5C9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 08:43:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r778hKJ1001012
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Aug 2013 01:43:20 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 7 Aug 2013 01:43:19 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Aug 2013 16:43:40 +0800
Message-ID: <030b09ca7c399d0f7e16c76184bc59fd82cf896b.1375864869.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1375864869.git.Qi.Chen@windriver.com>
References: <cover.1375864869.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhangle.Yang@windriver.com
Subject: [PATCH 1/1] busybox: remove syslog-startup.conf if sysvinit not in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Aug 2013 08:43:20 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

sysvinit and systemd have different ideas about configuration files (or
environment files in systemd), so basically we can't use the same one in
both cases.

To avoid confusion, this patch removes syslog-startup.conf if 'sysvinit'
is not in DISTRO_FEATURES.

[YOCTO #4837]
[YOCTO #4860]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 2f26953..8b38c1a 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -274,25 +274,28 @@ do_install () {
 
         ln -sf /dev/null ${D}${systemd_unitdir}/system/syslog.service
     fi
+
+    # Remove the sysvinit specific configuration file for systemd systems to avoid confusion
+    if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}; then
+	rm ${D}${sysconfdir}/syslog-startup.conf.${BPN}
+    fi
 }
 
 inherit update-alternatives
 
 ALTERNATIVE_PRIORITY = "50"
 
-ALTERNATIVE_${PN}-syslog = "syslog-startup-conf"
-
 python () {
     if 'sysvinit' in d.getVar("DISTRO_FEATURES", True).split():
         pn = d.getVar('PN', True)
         d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-init')
         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (d.getVar('sysconfdir', True)))
         d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+        d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' syslog-startup-conf')
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-startup-conf', '%s/syslog-startup.conf' % (d.getVar('sysconfdir', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-startup-conf', '%s/syslog-startup.conf.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
 }
 
-ALTERNATIVE_LINK_NAME[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf"
-ALTERNATIVE_TARGET[syslog-startup-conf] = "${sysconfdir}/syslog-startup.conf.${BPN}"
-
 python do_package_prepend () {
     # We need to load the full set of busybox provides from the /etc/busybox.links
     # Use this to see the update-alternatives with the right information
-- 
1.7.9.5


