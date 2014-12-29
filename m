Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8AD77261B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 10:45:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBTAjXYp016401
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 29 Dec 2014 02:45:33 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Dec 2014 02:45:32 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <otavio@ossystems.com.br>
Date: Mon, 29 Dec 2014 18:45:30 +0800
Message-ID: <6085402fe2d84510e4262bd3c2b8fd84ff5fa805.1419846944.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <fc5e255d320745caa24d7734547c35b34a17cb63.1419840627.git.hongxu.jia@windriver.com>
References: <fc5e255d320745caa24d7734547c35b34a17cb63.1419840627.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V3 4/4] busybox.inc: fix QA package-missing warnings
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
X-List-Received-Date: Mon, 29 Dec 2014 10:45:39 -0000
Content-Type: text/plain

While building busybox with QA package-missing checking enabled,
there was warning:
...
WARNING: QA Issue: package busybox-mdev not generated, but listed in PACKAGES
WARNING: QA Issue: package busybox-httpd not generated, but listed in PACKAGES
...

The config in ${B}/.config decides to generate busybox-mdev, busybox-hwclock,
busybox-udhcpd, busybox-httpd, busybox-udhcpc, busybox-syslog or not. Files
are copied if the packages generated. Set PACKAGES in do_package according
to the existance of these files, so we could dynamicly generate these packages
according to the configuration.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0769d92..7b23190 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -19,7 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 export EXTRA_OEMAKE += "'LD=${CCLD}'"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+PACKAGES_DYNAMIC += "^${PN}-(udhcpd|hwclock|mdev|httpd|syslog|udhcpc)"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
@@ -317,6 +317,24 @@ python () {
 }
 
 python do_package_prepend () {
+    if os.path.exists(d.expand("${D}${sysconfdir}/udhcpc.d")):
+        d.prependVar('PACKAGES', d.expand('${PN}-udhcpc '))
+
+    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/syslog.${BPN}")):
+        d.prependVar('PACKAGES', d.expand('${PN}-syslog '))
+
+    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/busybox-httpd")):
+        d.prependVar('PACKAGES', d.expand('${PN}-httpd '))
+
+    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/hwclock.sh")):
+        d.prependVar('PACKAGES', d.expand('${PN}-hwclock '))
+
+    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/busybox-udhcpd")):
+        d.prependVar('PACKAGES', d.expand('${PN}-udhcpd '))
+
+    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/mdev")):
+        d.prependVar('PACKAGES', d.expand('${PN}-mdev '))
+
     # We need to load the full set of busybox provides from the /etc/busybox.links
     # Use this to see the update-alternatives with the right information
 
-- 
1.9.1


