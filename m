Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BAE4E72F3E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 06:49:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1M6nur6013864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 22:49:56 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 21 Feb 2017 22:49:55 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2017 14:41:55 +0800
Message-ID: <56531decac343300f5eceddceba72ed68c11eff2.1487745605.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <cover.1487745605.git.jackie.huang@windriver.com>
References: <cover.1487745605.git.jackie.huang@windriver.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 06:49:55 -0000
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
index 2e4f7e4..7e01572 100644
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
2.8.3


