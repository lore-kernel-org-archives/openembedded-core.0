Return-Path: <reinette.chatre@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DA2717404E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 20:47:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Sep 2015 13:47:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,579,1437462000"; d="scan'208";a="811503259"
Received: from rchatre-builder.jf.intel.com ([10.54.39.14])
	by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2015 13:47:18 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 13:49:37 -0700
Message-Id: <267c50d7a79a2afeb44ac6b0b51fc015d4c82bfb.1443040802.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] systemd: fix tmpfiles location when multilib in use
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
X-List-Received-Date: Wed, 23 Sep 2015 20:47:19 -0000

Systemd's configuration files for creation, deletion and cleaning
of volatile and temporary files are installed in /usr/lib even when
multilib is in use (when /usr/lib64 is available). In this check the
systemd.conf file will not be found if libdir is /usr/lib64 so we fix the
path to match this file's installation path to look for it in
${exec_prefix}/lib

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 meta/recipes-core/systemd/systemd_225.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index 4a19ff4..be0cc45 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -189,8 +189,8 @@ do_install() {
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
 	# for existence else it fails
-	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
-		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
+	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
+		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 }
-- 
2.4.3


