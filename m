Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 543037253A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 08:16:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sBT8GAcU015371
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 29 Dec 2014 00:16:11 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 29 Dec 2014 00:16:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <otavio@ossystems.com.br>
Date: Mon, 29 Dec 2014 16:16:06 +0800
Message-ID: <fc5e255d320745caa24d7734547c35b34a17cb63.1419840627.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <883cc974857e6896b33eb4be4f5c326840bb90ad.1419471695.git.hongxu.jia@windriver.com>
References: <883cc974857e6896b33eb4be4f5c326840bb90ad.1419471695.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 4/4] busybox.inc: fix QA package-missing warnings
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
X-List-Received-Date: Mon, 29 Dec 2014 08:16:15 -0000
Content-Type: text/plain

While building busybox with QA package-missing checking enabled,
there was warning:
...
WARNING: QA Issue: package busybox-mdev not generated, but listed in PACKAGES
WARNING: QA Issue: package busybox-httpd not generated, but listed in PACKAGES
...

The config in ${B}/.config decides to generate busybox-mdev, busybox-hwclock,
busybox-udhcpd, busybox-httpd or not. Files are copied if the packages generated.
Set PACKAGES in do_package according to the existance of these files, so we could
dynamic generate these packages according to the configuration.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/busybox/busybox.inc | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 0769d92..95c3b0f 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -19,7 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
 export EXTRA_LDFLAGS = "${LDFLAGS}"
 export EXTRA_OEMAKE += "'LD=${CCLD}'"
 
-PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
+PACKAGES =+ "${PN}-udhcpc ${PN}-syslog"
 
 FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
 FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
@@ -317,6 +317,18 @@ python () {
 }
 
 python do_package_prepend () {
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


