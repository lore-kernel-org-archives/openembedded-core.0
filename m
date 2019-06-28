Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8266A7E731
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 09:16:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5S9GuO7017777
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 02:16:56 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 02:16:56 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2019 17:29:14 +0800
Message-ID: <8e2fc3746a5d073925891a1f9d2d18d46513a91c.1561714128.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1561714128.git.Qi.Chen@windriver.com>
References: <cover.1561714128.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image.bbclass: fix systemd_preset_all
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
X-List-Received-Date: Fri, 28 Jun 2019 09:16:55 -0000
Content-Type: text/plain

Check the existence of systemctl before invoking it. This is because
even if 'systemd' is in DISTRO_FEATURES, it's possible that systemd is
not even installed. e.g. container-test-image in meta-selftest layer.
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
index d2b2fb9..2115c6c 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -666,10 +666,11 @@ reproducible_final_image_task () {
 }
 
 systemd_preset_all () {
-    systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+    if [ -e ${STAGING_DIR_NATIVE}${bindir}/systemctl ]; then
+	systemctl --root="${IMAGE_ROOTFS}" --preset-mode=enable-only preset-all
+    fi
 }
 
-IMAGE_EXTRADEPENDS += "${@ 'systemd-systemctl-native' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''}"
 IMAGE_PREPROCESS_COMMAND_append = " ${@ 'systemd_preset_all;' if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d) and not bb.utils.contains('IMAGE_FEATURES', 'stateless-rootfs', True, False, d) else ''} reproducible_final_image_task; "
 
 CVE_PRODUCT = ""
-- 
1.9.1


