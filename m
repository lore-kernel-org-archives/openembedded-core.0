Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3D87280D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:51 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uisVr; Sun, 08 Feb 2015 11:42:53 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:14 -0600
Message-Id: <8bc96762212e418a32edc2a86e451a9a5c964350.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
Subject: [PATCHv3 02/10] bluetooth.bbclass: simplify recipe inference of bluetooth provider
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
X-List-Received-Date: Sun, 08 Feb 2015 18:42:58 -0000

Defines ${BLUEZ} to be the provider of bluez services as specified by
DISTRO_FEATURES.

Example recipe fragment:
  inherit bluetooth
  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
  PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
  PACKAGECONFIG[bluez5] = "--enable-bluez5,--disable-bluez5,bluez5"

[YOCTO #5031]

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/classes/bluetooth.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/classes/bluetooth.bbclass

diff --git a/meta/classes/bluetooth.bbclass b/meta/classes/bluetooth.bbclass
new file mode 100644
index 0000000..f88b4ae
--- /dev/null
+++ b/meta/classes/bluetooth.bbclass
@@ -0,0 +1,14 @@
+# Avoid code duplication in bluetooth-dependent recipes.
+
+# Define a variable that expands to the recipe (package) providing core
+# bluetooth support on the platform:
+# "" if bluetooth is not in DISTRO_FEATURES
+# else "bluez5" if bluez5 is in DISTRO_FEATURES
+# else "bluez4"
+
+# Use this with:
+#  inherit bluetooth
+#  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}
+#  PACKAGECONFIG[bluez4] = "--enable-bluez4,--disable-bluez4,bluez4"
+
+BLUEZ ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5', 'bluez4', d), '', d)}"
-- 
1.9.1


