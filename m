Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C484F7E94C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 04:03:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6143Ifr027334
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Jun 2019 21:03:18 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Sun, 30 Jun 2019 21:03:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Jul 2019 12:15:33 +0800
Message-ID: <8253aa4004e6a23f783cd930c222138f86d9fa3c.1561954425.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1561954425.git.Qi.Chen@windriver.com>
References: <cover.1561954425.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] image.bbclass: fix systemd_preset_all
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
X-List-Received-Date: Mon, 01 Jul 2019 04:03:17 -0000
Content-Type: text/plain

Check the existence of systemd before using systemctl to preset units.
This is because even if 'systemd' is in DISTRO_FEATURES, it's possible
that systemd is not even installed. e.g. container-test-image in
meta-selftest layer.

As systemd DEPENDS on systemd-systemctl-native, the existence of systemd
also ensures the existence of systemd-systemctl-native.

This would fix the following test case when using systemd as the init
manager.

  containerimage.ContainerImageTests.test_expected_files

Also remove the IMAGE_EXTRADEPENDS setting, as nothing references this
variable.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index d2b2fb9..7daa97e 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -666,10 +666,11 @@ reproducible_final_image_task () {
 }
 
 systemd_preset_all () {
-    systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+    if [ -e ${IMAGE_ROOTFS}${root_prefix}/lib/systemd/systemd ]; then
+	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+    fi
 }
 
-IMAGE_EXTRADEPENDS += "${@ 'systemd-systemctl-native' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''}"
 IMAGE_PREPROCESS_COMMAND_append = " ${@ 'systemd_preset_all;' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} reproducible_final_image_task; "
 
 CVE_PRODUCT = ""
-- 
1.9.1


