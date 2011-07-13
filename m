Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qgx7w-0001QL-1E
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 12:57:12 +0200
Received: by wyg30 with SMTP id 30so43926wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 03:53:13 -0700 (PDT)
Received: by 10.216.62.135 with SMTP id y7mr4967373wec.60.1310554391979;
	Wed, 13 Jul 2011 03:53:11 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g2sm8041407weg.38.2011.07.13.03.53.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jul 2011 03:53:11 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 12:53:07 +0200
Message-Id: <1310554388-28844-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/2] ofono: fix packaging and clean up custom do_install
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 10:57:12 -0000

The makefile installs the udev rule in the proper place already. Also fix:

WARNING: For recipe ofono, the following files were installed but not shipped in any package:
WARNING:   /lib/udev/rules.d/97-ofono.rules
WARNING:   /lib/systemd/system/ofono.service

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/ofono/ofono.inc     |    3 +--
 meta/recipes-connectivity/ofono/ofono_0.50.bb |    2 +-
 meta/recipes-connectivity/ofono/ofono_git.bb  |    2 ++
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 4fc969c..a14b35a 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -15,7 +15,6 @@ INITSCRIPT_PARAMS = "defaults 22"
 do_install_append() {
   install -d ${D}${sysconfdir}/init.d/
   install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
-  install -d ${D}${sysconfdir}/udev/rules.d/
-  install -m 0644 ${S}/plugins/97-ofono.rules ${D}${sysconfdir}/udev/rules.d/
 }
 
+FILES_${PN} += "${base_libdir}/udev ${base_libdir}/systemd"
diff --git a/meta/recipes-connectivity/ofono/ofono_0.50.bb b/meta/recipes-connectivity/ofono/ofono_0.50.bb
index eb82e39..4635386 100644
--- a/meta/recipes-connectivity/ofono/ofono_0.50.bb
+++ b/meta/recipes-connectivity/ofono/ofono_0.50.bb
@@ -1,6 +1,6 @@
 require ofono.inc
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI  = "${KERNELORG_MIRROR}/linux/network/ofono/${P}.tar.bz2 \
 	          file://ofono"
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index 4e55745..dbad5a1 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -1,5 +1,7 @@
 require ofono.inc
 
+PR = "r1"
+
 S	 = "${WORKDIR}/git"
 SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
 PV	 = "0.12-git${SRCPV}"
-- 
1.6.6.1



