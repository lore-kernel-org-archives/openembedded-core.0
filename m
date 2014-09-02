Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E54C67133A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:54:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s82AsCTE003971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 03:54:12 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 03:54:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Sep 2014 18:53:52 +0800
Message-ID: <c3011da5e15159b1abcb37a53481914793e205e7.1409655125.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/26] keymaps: fix for systemd
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
X-List-Received-Date: Tue, 02 Sep 2014 10:54:11 -0000
Content-Type: text/plain

Only install 'keymap.sh' script if 'sysvinit' is in DISTRO_FEATURES.
This is because systemd internally provides a mechanism to implement
the functionality this script tries to implement. Please see
systemd-vconsole-setup.service for more details.

Also we set 'INHIBIT_UPDATERCD_BBCLASS' to "1" if 'sysvinit' is not
in DISTRO_FEATURES.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/keymaps/keymaps_1.0.bb b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
index 123db3e..5a3f974 100644
--- a/meta/recipes-bsp/keymaps/keymaps_1.0.bb
+++ b/meta/recipes-bsp/keymaps/keymaps_1.0.bb
@@ -14,6 +14,13 @@ PR = "r31"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
+# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
+# manually to avoid unnecessary postinst/preinst generated.
+python __anonymous() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
 inherit update-rc.d
 
 SRC_URI = "file://keymap.sh \
@@ -23,6 +30,12 @@ INITSCRIPT_NAME = "keymap.sh"
 INITSCRIPT_PARAMS = "start 01 S ."
 
 do_install () {
-    install -d ${D}${sysconfdir}/init.d/
-    install -m 0755 ${WORKDIR}/keymap.sh ${D}${sysconfdir}/init.d/
+    # Only install the script if 'sysvinit' is in DISTRO_FEATURES
+    # THe ulitity this script provides could be achieved by systemd-vconsole-setup.service
+    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	install -d ${D}${sysconfdir}/init.d/
+	install -m 0755 ${WORKDIR}/keymap.sh ${D}${sysconfdir}/init.d/
+    fi
 }
+
+ALLOW_EMPTY_${PN} = "1"
-- 
1.9.1


