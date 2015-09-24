Return-Path: <reinette.chatre@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE7873BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 21:18:45 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Sep 2015 14:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,582,1437462000"; d="scan'208";a="812642343"
Received: from rchatre-builder.jf.intel.com ([10.54.39.14])
	by orsmga002.jf.intel.com with ESMTP; 24 Sep 2015 14:18:46 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: joshua.lock@collabora.co.uk
Date: Thu, 24 Sep 2015 14:21:06 -0700
Message-Id: <fc756e8119184af7625c7aa191716cf265fe77fa.1443129296.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.4.3
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][fido] systemd: fix tmpfiles location when multilib in use
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
X-List-Received-Date: Thu, 24 Sep 2015 21:18:46 -0000

Systemd's configuration files for creation, deletion and cleaning
of volatile and temporary files are installed in /usr/lib even when
multilib is in use (when /usr/lib64 is available). In this check the
systemd.conf file will not be found if libdir is /usr/lib64 so we fix the
path to match this file's installation path to look for it in
${exec_prefix}/lib

(From OE-Core rev: c1ef36c2b3e3876cc166a9a5e153fc6f23b42b92)

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
Hi Joshua,

This is a backport of systemd fix that was recently merged to master. This
fixes broken timesynd in fido images built with multilib. Could you please
consider it for fido?

Thank you very much

Reinette

 meta/recipes-core/systemd/systemd_219.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
index b972dd4..2f12284 100644
--- a/meta/recipes-core/systemd/systemd_219.bb
+++ b/meta/recipes-core/systemd/systemd_219.bb
@@ -181,8 +181,8 @@ do_install() {
 	sed -i -e 's/.*ForwardToSyslog.*/ForwardToSyslog=yes/' ${D}${sysconfdir}/systemd/journald.conf
 	# this file is needed to exist if networkd is disabled but timesyncd is still in use since timesyncd checks it
 	# for existence else it fails
-	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
-		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
+	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
+		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
 	fi
 }
 
-- 
2.4.3


