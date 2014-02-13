Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1DCA6E891
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 07:33:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1D7XP8R015760
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 23:33:31 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 12 Feb 2014 23:33:12 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Feb 2014 15:32:45 +0800
Message-ID: <7394b4a34e973a1655132709c054a272cf367252.1392276667.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392276667.git.Qi.Chen@windriver.com>
References: <cover.1392276667.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] alsa-state: do not install the init script in case of systemd
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
X-List-Received-Date: Thu, 13 Feb 2014 07:33:30 -0000
Content-Type: text/plain

As the corresponding service files have already been provided by
the alsa-utils-alsactl package, the init script is really not needed.
So we do not install it in a systemd based image.

[YOCTO #4420]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 552fcfc..6dbc1aa 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -18,16 +18,20 @@ SRC_URI = "\
   file://alsa-state-init \
 "
 
-inherit update-rc.d
+inherit update-rc.d systemd
 
 INITSCRIPT_NAME = "alsa-state"
 INITSCRIPT_PARAMS = "start 39 S . stop 31 0 6 ."
 
 do_install() {
-    sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state-init
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/alsa-state-init ${D}${sysconfdir}/init.d/alsa-state
-
+    # The alsa-utils-alsactl already provides corresponding systemd unit files.
+    # So the init script should not be installed in a systemd based image.
+    install -d ${D}${sysconfdir}
+    if ${@base_contains('DISTRO_FEATURES','systemd','false','true',d)}; then
+	sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state-init
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/alsa-state-init ${D}${sysconfdir}/init.d/alsa-state
+    fi
     install -d ${D}/${localstatedir}/lib/alsa
     install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/*.state ${D}${localstatedir}/lib/alsa
-- 
1.7.9.5


