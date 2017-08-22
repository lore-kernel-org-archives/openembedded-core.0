Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3434B78287
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 06:35:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7M6Z8QG007173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 23:35:08 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 21 Aug 2017 23:35:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Aug 2017 14:34:24 +0800
Message-ID: <feac61ca2f3ea35926f092e62ce2496c72326ebf.1503383077.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1503383077.git.jackie.huang@windriver.com>
References: <cover.1503383077.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] initscripts: split sushell into sub package
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
X-List-Received-Date: Tue, 22 Aug 2017 06:35:08 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* sushell is required by systemd service debug-shell
  when selinux is enabled, but it doesn't make sense
  to make systemd depend on initscripts, so split sushell
  into sub package initscripts-sushell.

* The bash dependency has been removed by:
  '''
  4917e36a77bd6821b45db52caa43939d344d92f6
  initscripts: Fix regression for requiring /bin/bash
  '''
  so remove bash from RDEPENDS when selinux is enabled.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-core/initscripts/initscripts_1.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index 7ab0d2b..d627d2e 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -46,11 +46,12 @@ inherit update-alternatives
 DEPENDS_append = " update-rc.d-native"
 PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd-systemctl-native','',d)}"
 
-PACKAGES =+ "${PN}-functions"
+PACKAGES =+ "${PN}-functions ${PN}-sushell"
 RDEPENDS_${PN} = "${PN}-functions \
-                  ${@bb.utils.contains('DISTRO_FEATURES','selinux','bash','',d)} \
+                  ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
 		 "
 FILES_${PN}-functions = "${sysconfdir}/init.d/functions*"
+FILES_${PN}-sushell = "${base_sbindir}/sushell"
 
 ALTERNATIVE_PRIORITY_${PN}-functions = "90"
 ALTERNATIVE_${PN}-functions = "functions"
-- 
1.9.1


