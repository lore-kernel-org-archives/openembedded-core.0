Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1574679A16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2018 06:06:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9O65q2r027697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 23:06:02 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 23 Oct 2018 23:05:42 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 Oct 2018 14:11:50 +0800
Message-ID: <9578a653708b251d0fb4cbf27c92f05d88dab240.1540361439.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1540361439.git.Qi.Chen@windriver.com>
References: <cover.1540361439.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] packagegroup-core-lsb/-x11-sato: no udev-extraconf in case of systemd
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
X-List-Received-Date: Wed, 24 Oct 2018 06:06:12 -0000
Content-Type: text/plain

The automount udev rule in udev-extraconf is likely to cause conflicts
or failures in case of systemd. We are seeing errors like below for
qemu bsps.

  run-media-hdc.mount loaded failed failed /run/media/hdc

So do not install udev-extraconf in case of systemd in these two
packagegroups.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb  | 2 +-
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index 6631547..e8dc421 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -76,7 +76,7 @@ RDEPENDS_packagegroup-core-sys-extended = "\
     screen \
     setserial \
     sysstat \
-    udev-extraconf \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'udev-extraconf', d)} \
     unzip \
     watchdog \
     wget \
diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 2d7feb8..7e14ece 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -33,7 +33,7 @@ RDEPENDS_${PN}-base = "\
     settings-daemon \
     shutdown-desktop \
     ${NETWORK_MANAGER} \
-    udev-extraconf \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'udev-extraconf', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio-server pulseaudio-client-conf-sato pulseaudio-misc', '', d)} \
     "
 
-- 
1.9.1


