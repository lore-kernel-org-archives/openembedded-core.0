Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC7477C73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 01:06:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2V16ahr027937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:06:36 -0700 (PDT)
Received: from ala-jslater-lx1.wrs.com (147.11.216.13) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 30 Mar 2017 18:06:34 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Mar 2017 18:06:33 -0700
Message-ID: <1490922393-12254-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/1] volatile-binds: correct some errors reported by systemd
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
X-List-Received-Date: Fri, 31 Mar 2017 01:06:38 -0000
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
index f07458a..a6e3254 100644
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


