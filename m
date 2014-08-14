Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4356670CCE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 08:46:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7E8k1dE010458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 01:46:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 14 Aug 2014 01:46:01 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 16:46:04 +0800
Message-ID: <80a352bb10c683623aafa0ae047c8fe6eda9a1f6.1408005909.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1408005909.git.Qi.Chen@windriver.com>
References: <cover.1408005909.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/10] alsa-state: fix pkg_postinst and set INHIBIT_UPDATERCD_BBCLASS
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
X-List-Received-Date: Thu, 14 Aug 2014 08:46:00 -0000
Content-Type: text/plain

As alsa-state inherits update-rc.d, the update-rc.d part inpostinst script
has already been handled in update-rc.d.bbclass.

Besides, we need to set INHIBIT_UPDATERCD_BBCLASS to "1" if 'sysvinit'
is not in DISTRO_FEATURES. This is because the init script is not installed
in such situation, adding update-rc.d part in the preinst/postinst scripts
just makes no sense.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb |   11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index d2f8ea2..17c2d00 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -18,6 +18,13 @@ SRC_URI = "\
   file://alsa-state-init \
 "
 
+# As the recipe doesn't inherit systemd.bbclass, we need to set this variable
+# manually to avoid unnecessary postinst/preinst generated.
+python __anonymous() {
+    if not bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
+        d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
+}
+
 inherit update-rc.d
 
 INITSCRIPT_NAME = "alsa-state"
@@ -54,9 +61,5 @@ pkg_postinst_${PN}() {
 		then
 			${sbindir}/alsactl -f ${localstatedir}/lib/alsa/asound.state restore
 		fi
-		# INITSCRIPT_PARAMS changed, so remove the old and
-		# install the new setting.
-		update-rc.d -f ${INITSCRIPT_NAME} remove
-		update-rc.d ${INITSCRIPT_NAME} ${INITSCRIPT_PARAMS}
 	fi
 }
-- 
1.7.9.5


