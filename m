Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA707719DD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 21:16:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2ULG9nM020324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 14:16:09 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 30 Mar 2017 14:16:08 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 14:16:08 -0700
Message-ID: <1490908568-5892-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [morty][PATCH 1/1] volatile-binds: correct some errors reported by systemd
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
X-List-Received-Date: Thu, 30 Mar 2017 21:16:09 -0000
Content-Type: text/plain

systemd-tmpfiles-setup will fail at boot, so we suppress
the default versions of etc.conf and home.conf.

We also make sure that /var/{cache,spool} and /srv are writeable
if they exist.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-core/volatile-binds/volatile-binds.bb |    9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-core/volatile-binds/volatile-binds.bb b/meta/recipes-core/volatile-binds/volatile-binds.bb
index fee7275..130ab55 100644
--- a/meta/recipes-core/volatile-binds/volatile-binds.bb
+++ b/meta/recipes-core/volatile-binds/volatile-binds.bb
@@ -17,6 +17,9 @@ REQUIRED_DISTRO_FEATURES = "systemd"
 
 VOLATILE_BINDS ?= "\
     /var/volatile/lib /var/lib\n\
+    /var/volatile/cache /var/cache\n\
+    /var/volatile/spool /var/spool\n\
+    /var/volatile/srv /srv\n\
 "
 VOLATILE_BINDS[type] = "list"
 VOLATILE_BINDS[separator] = "\n"
@@ -67,5 +70,11 @@ do_install () {
     for service in ${SYSTEMD_SERVICE_volatile-binds}; do
         install -m 0644 $service ${D}${systemd_unitdir}/system/
     done
+
+    # Suppress attempts to process some tmpfiles that are not temporary.
+    #
+    install -d ${D}${sysconfdir}/tmpfiles.d ${D}/var/cache
+    ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/etc.conf
+    ln -s /dev/null ${D}${sysconfdir}/tmpfiles.d/home.conf
 }
 do_install[dirs] = "${WORKDIR}"
-- 
1.7.9.5


