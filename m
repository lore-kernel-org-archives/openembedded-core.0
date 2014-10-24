Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F1216AC08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 05:57:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9O5vM0D007715
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Oct 2014 22:57:22 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 23 Oct 2014 22:57:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 13:58:49 +0800
Message-ID: <22cefd15362d8fdc8e8e06324412f606f5feca86.1414121198.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414121198.git.Qi.Chen@windriver.com>
References: <cover.1414121198.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: fix systemd-udev-hwdb-update service
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
X-List-Received-Date: Fri, 24 Oct 2014 05:57:23 -0000
Content-Type: text/plain

The new version of systemd has implemented the following feature.
Opointer.de/blog/projects/stateless.html

As a result, the systemd-udev-hwdb-update.service would always run
at first boot. This will cause failure if the target device doesn't
have enough storage space. Besides, as we run `udevadm hwdb --update' as
a postinst of udev-hwdb at rootfs time, there's no need to run this
again at system start-up.

The purpose of this patch is as follows.
If `udev hwdb --update' fails at rootfs time, systemd-udev-hwdb-update.service
is executed at first boot; otherwise, the service is not executed.

This patch achieves the above goal by setting CondistonNeedsUpdate to
"/etc/udev" in the service file, and creating /etc/udev/.updated file if the
postinst succeeds.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index ebf9395..cd81818 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -149,6 +149,10 @@ do_install() {
 
 	# Enable journal to forward message to syslog daemon
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
+
+	# Make systemd-udev-hwdb-update to check /etc/udev
+	cp ${D}${systemd_unitdir}/system/systemd-udev-hwdb-update.service ${D}${sysconfdir}/systemd/system
+	sed -i -e 's#ConditionNeedsUpdate=/etc#ConditionNeedsUpdate=/etc/udev#g' ${D}${sysconfdir}/systemd/system/systemd-udev-hwdb-update.service
 }
 
 do_install_ptest () {
@@ -355,10 +359,18 @@ ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
 pkg_postinst_udev-hwdb () {
 	if test -n "$D"; then
-		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
-			--root $D
+		if ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
+			--root $D; then
+			touch $D/etc/udev/.updated
+		else
+			exit 1
+		fi
 	else
-		udevadm hwdb --update
+		if udevadm hwdb --update; then
+			touch $D/etc/udev/.updated
+		else
+			exit 1
+		fi
 	fi
 }
 
-- 
1.9.1


