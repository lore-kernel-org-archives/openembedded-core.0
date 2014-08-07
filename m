Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB0D570897
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 08:33:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s778Xuqb021209
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Aug 2014 01:33:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 7 Aug 2014 01:33:56 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Aug 2014 16:34:01 +0800
Message-ID: <7ac62381a30c4d0031b6eb48d25d5ccb1bc8a1ed.1407400378.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1407400378.git.Qi.Chen@windriver.com>
References: <cover.1407400378.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] alsa-state: install init script only when 'sysvinit' is in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 07 Aug 2014 08:34:05 -0000
Content-Type: text/plain

The /etc/init.d/alsa-state is totally useless for a systemd image.
Its functionality has been replaced by alsa-state.service files.

So if 'sysvinit' is not in DISTRO_FEATURES, installing this script doesn't
make any sense.

[YOCTO #4420]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-bsp/alsa-state/alsa-state.bb |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp/alsa-state/alsa-state.bb
index 874d6bb..d2f8ea2 100644
--- a/meta/recipes-bsp/alsa-state/alsa-state.bb
+++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
@@ -24,11 +24,15 @@ INITSCRIPT_NAME = "alsa-state"
 INITSCRIPT_PARAMS = "start 39 S . stop 31 0 6 ."
 
 do_install() {
-    sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state-init
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/alsa-state-init ${D}${sysconfdir}/init.d/alsa-state
+    # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
+    if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
+	sed -i -e "s:#STATEDIR#:${localstatedir}/lib/alsa:g" ${WORKDIR}/alsa-state-init
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/alsa-state-init ${D}${sysconfdir}/init.d/alsa-state
+    fi
 
     install -d ${D}/${localstatedir}/lib/alsa
+    install -d ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/asound.conf ${D}${sysconfdir}
     install -m 0644 ${WORKDIR}/*.state ${D}${localstatedir}/lib/alsa
 }
-- 
1.7.9.5


