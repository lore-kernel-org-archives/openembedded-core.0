Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 406C371A15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Nov 2016 15:07:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 21 Nov 2016 07:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,675,1473145200"; d="scan'208";a="789098718"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2016 07:07:14 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Nov 2016 17:07:11 +0200
Message-Id: <1479740831-661-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1479740831-661-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1479740831-661-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] sysklogd: don't use update-alternatives
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
X-List-Received-Date: Mon, 21 Nov 2016 15:07:20 -0000

Using update-alternatives for managing init scripts has proved to be
problematic. Thus, don't use this method and just conflict with
busybox-syslog, instead.

[YOCTO #10433]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 5c15ffe..de47e08 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
                    "
 
-inherit update-rc.d update-alternatives
+inherit update-rc.d
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
@@ -22,6 +22,8 @@ SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar
 
 SRC_URI_append_e500v2 = " file://no-vectorization.patch"
 
+RCONFLICTS_${PN} = "busybox-syslog"
+
 INITSCRIPT_NAME = "syslog"
 CONFFILES_${PN} = "${sysconfdir}/syslog.conf.${BPN}"
 
@@ -41,17 +43,6 @@ do_install () {
 	install -m 755 ${WORKDIR}/sysklogd ${D}${sysconfdir}/init.d/syslog
 }
 
-# sysklogd package has no internal systemd support, so we weigh busybox's
-# sysklogd utility over it in case of systemd
-ALTERNATIVE_PRIORITY = "${@bb.utils.contains('DISTRO_FEATURES','systemd','10','100',d)}"
-
-ALTERNATIVE_${PN} = "syslogd klogd syslog-init syslog-conf"
-
-ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
-ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
-ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
-ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
-
 pkg_prerm_${PN} () {
 	if test "x$D" = "x"; then
 	if test "$1" = "upgrade" -o "$1" = "remove"; then
-- 
2.6.6


