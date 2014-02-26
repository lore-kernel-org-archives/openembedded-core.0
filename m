Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1BD776CA54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2014 13:51:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Feb 2014 05:51:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,548,1389772800"; d="scan'208";a="490107703"
Received: from unknown (HELO localhost.localdomain) ([10.255.12.179])
	by orsmga002.jf.intel.com with ESMTP; 26 Feb 2014 05:51:36 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Feb 2014 15:51:30 +0200
Message-Id: <1393422692-28184-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 1/3] base-files: sed installed file instead of original
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
X-List-Received-Date: Wed, 26 Feb 2014 13:51:37 -0000

When we change the ROOT_HOME the sed regex does not match if we are running
the do_install() a second time, so sed the installed file and preserve the original
so that the sed regex is matched correctly in the original

[YOCTO #5765]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/base-files/base-files_3.0.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index 726e0d5..dbf40fa 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -90,8 +90,8 @@ do_install () {
 	install -m 0644 ${WORKDIR}/fstab ${D}${sysconfdir}/fstab
 	install -m 0644 ${WORKDIR}/filesystems ${D}${sysconfdir}/filesystems
 	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
-	sed -i "s#ROOTHOME#${ROOT_HOME}#" ${WORKDIR}/profile
 	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
+	sed -i 's#ROOTHOME#${ROOT_HOME}#' ${D}${sysconfdir}/profile
 	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
 	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
 	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
-- 
1.8.3.1


