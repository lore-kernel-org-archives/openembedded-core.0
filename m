Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 23F9770CEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 03:08:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7F38xbq020825
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 20:08:59 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 20:08:59 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Aug 2014 11:09:06 +0800
Message-ID: <c43075fdd02f86eab1c7bfb46301fc07c50a2c77.1408071677.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408071677.git.Qi.Chen@windriver.com>
References: <cover.1408071677.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 06/10] keymaps: fix for systemd
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
X-List-Received-Date: Fri, 15 Aug 2014 03:08:58 -0000
Content-Type: text/plain

Only install 'keymap.sh' script if 'sysvinit' is in DISTRO_FEATURES.
This is because systemd internally provides a mechanism to implement
the functionality this script tries to implement. Please see
systemd-vconsole-setup.service for more details.

Also we set 'INHIBIT_UPDATERCD_BBCLASS' to "1" if 'sysvinit' is not
in DISTRO_FEATURES.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/keymaps/keymaps_1.0.bb |   17 +++++++++++++++--
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
1.7.9.5


