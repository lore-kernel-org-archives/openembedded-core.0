Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59EB87807A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 09:50:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v859oLJb003867
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Sep 2017 02:50:24 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 5 Sep 2017 02:50:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Sep 2017 17:55:27 +0800
Message-ID: <a6f436db4adbb1b6ead949056616c98ae5716bdd.1504604362.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1504604362.git.Qi.Chen@windriver.com>
References: <cover.1504604362.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sysklogd: conflict with other syslog daemons
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
X-List-Received-Date: Tue, 05 Sep 2017 09:50:23 -0000
Content-Type: text/plain

Set RCONFLICTS to disallow multiple syslog daemon providers to be installed
on the target, and remove codes that deal with such situation.

Also, set ALTERNATIVE_PRIORITY back to 100. It was set to '10' in case of
systemd because sysklogd didn't have systemd support. For now, if we disallow
multiple syslog daemons to be installed, and it stays '10', then if sysklogd
is installed on target, the /sbin/syslogd would link to /bin/busybox.nosuid,
causing sysklogd service files using busybox's utility.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 644728a..e9a4a02 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -32,7 +32,8 @@ SYSTEMD_SERVICE_${PN} = "syslogd.service klogd.service"
 SYSTEMD_AUTO_ENABLE = "enable"
 
 INITSCRIPT_NAME = "syslog"
-CONFFILES_${PN} = "${sysconfdir}/syslog.conf.${BPN}"
+CONFFILES_${PN} = "${sysconfdir}/syslog.conf"
+RCONFLICTS_${PN}-syslog = "rsyslog busybox-syslog syslog-ng"
 
 CFLAGS += "-DSYSV -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE"
 
@@ -57,20 +58,15 @@ do_install () {
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/sysklogd.conf', '', d)}"
 
-# sysklogd package has no internal systemd support, so we weigh busybox's
-# sysklogd utility over it in case of systemd
-ALTERNATIVE_PRIORITY = "${@bb.utils.contains('DISTRO_FEATURES','systemd','10','100',d)}"
+ALTERNATIVE_PRIORITY = "100"
 
-ALTERNATIVE_${PN} = "syslogd klogd syslog-conf \
-    ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','syslog-init','',d)}"
+ALTERNATIVE_${PN} = "syslogd klogd"
 
 ALTERNATIVE_${PN}-doc = "syslogd.8"
 ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
 
 ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
 ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
-ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
-ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
 
 pkg_prerm_${PN} () {
 	if test "x$D" = "x"; then
-- 
1.9.1


