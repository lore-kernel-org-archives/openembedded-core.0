Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CBF4F79007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:29:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7M9TqBh022906
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 02:29:53 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 22 Aug 2018 02:29:52 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2018 17:24:36 +0800
Message-ID: <20180822092436.51204-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [PATCH] sstate: add intel-microcode to SSTATE_DUPWHITELIST
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
X-List-Received-Date: Wed, 22 Aug 2018 09:29:51 -0000
Content-Type: text/plain

intel-microcode multilib recipes can generate identical overlapping
files: microcode.cpio.

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta/classes/sstate.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index c0e54a398d..084d631523 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -33,10 +33,11 @@ SSTATE_DUPWHITELIST += "${DEPLOY_DIR_RPM}/sdk_provides_dummy_nativesdk/ ${DEPLOY
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_RPM}/buildtools_dummy_nativesdk/ ${DEPLOY_DIR_IPK}/buildtools-dummy-nativesdk/"
 # Archive the sources for many architectures in one deploy folder
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_SRC}"
-# ovmf/grub-efi/systemd-boot multilib recipes can generate identical overlapping files
+# ovmf/grub-efi/systemd-boot/intel-microcode multilib recipes can generate identical overlapping files
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_IMAGE}/ovmf"
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_IMAGE}/grub-efi"
 SSTATE_DUPWHITELIST += "${DEPLOY_DIR_IMAGE}/systemd-boot"
+SSTATE_DUPWHITELIST += "${DEPLOY_DIR_IMAGE}/microcode"
 
 SSTATE_SCAN_FILES ?= "*.la *-config *_config postinst-*"
 SSTATE_SCAN_CMD ??= 'find ${SSTATE_BUILDDIR} \( -name "${@"\" -o -name \"".join(d.getVar("SSTATE_SCAN_FILES").split())}" \) -type f'
-- 
2.14.4


