Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id AD36179F8D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 05:40:59 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 96F792204BF;
	Thu, 20 Dec 2018 18:40:59 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 18:40:44 +1300
Message-Id: <20181220054044.29476-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] libpam: reproducibility: Fix host umask leakage at patch-time
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
X-List-Received-Date: Thu, 20 Dec 2018 05:41:01 -0000

The patch file pam-security-abstract-securetty-handling.patch creates a new
file (tty_secure.c) at patch-time, so its permissions are subject to the host
umask. This file is later copied into the -dbg package with no change in
permissions.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-extended/pam/libpam_1.3.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.3.0.bb b/meta/recipes-extended/pam/libpam_1.3.0.bb
index 3aec2cdb4c..292b570e11 100644
--- a/meta/recipes-extended/pam/libpam_1.3.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.3.0.bb
@@ -49,6 +49,9 @@ S = "${WORKDIR}/Linux-PAM-${PV}"
 
 inherit autotools gettext pkgconfig
 
+# We create a new file (tty_secure.c) from pam-security-abstract-securetty-handling.patch
+do_patch[umask] = "022"
+
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit,"
 
 PACKAGES += "${PN}-runtime ${PN}-xtests"
-- 
2.17.1


