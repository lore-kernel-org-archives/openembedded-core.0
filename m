Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A71BF77BC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 14:00:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Nov 2017 07:00:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,329,1505804400"; d="scan'208";a="330573672"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2017 07:00:37 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Nov 2017 16:00:30 +0200
Message-Id: <2f489320ee96af8e18f53369a0ede9f4bde17052.1509544185.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
References: <cover.1509544185.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/6] sysklogd: don't use update-alternatives
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
X-List-Received-Date: Wed, 01 Nov 2017 14:00:36 -0000

Using update-alternatives for managing init scripts has proved to be
problematic. And, sysklogd rconflicts with other syslog daemons so there
is no point in using update-alternatives from this perspective, either.

[YOCTO #10944]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index e9a4a02192..1a537fabf4 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://klogd.c;beginline=2;endline=19;md5=7e87ed0ae6142de079bce738c10c899d \
                    "
 
-inherit update-rc.d update-alternatives systemd
+inherit update-rc.d systemd
 
 SRC_URI = "http://www.infodrom.org/projects/sysklogd/download/sysklogd-${PV}.tar.gz \
            file://no-strip-install.patch \
@@ -58,16 +58,6 @@ do_install () {
 
 FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/sysklogd.conf', '', d)}"
 
-ALTERNATIVE_PRIORITY = "100"
-
-ALTERNATIVE_${PN} = "syslogd klogd"
-
-ALTERNATIVE_${PN}-doc = "syslogd.8"
-ALTERNATIVE_LINK_NAME[syslogd.8] = "${mandir}/man8/syslogd.8"
-
-ALTERNATIVE_LINK_NAME[syslogd] = "${base_sbindir}/syslogd"
-ALTERNATIVE_LINK_NAME[klogd] = "${base_sbindir}/klogd"
-
 pkg_prerm_${PN} () {
 	if test "x$D" = "x"; then
 	if test "$1" = "upgrade" -o "$1" = "remove"; then
-- 
2.13.6


