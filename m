Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5933C731B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 08:14:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4A8ECDW002634
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 01:14:12 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 01:14:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 May 2016 01:14:03 -0700
Message-ID: <c391bab0ad964bdf7c070ccabb71e979fd896238.1462867278.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1462867278.git.liezhi.yang@windriver.com>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [RFC PATCH 5/8] arch-x86.inc: set vars for runqemu
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
X-List-Received-Date: Tue, 10 May 2016 08:14:11 -0000
Content-Type: text/plain

These vars will be used when QEMU_BOOT_SUPPORTED = "1", and has no
impact when "0".

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/machine/include/x86/arch-x86.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/conf/machine/include/x86/arch-x86.inc b/meta/conf/machine/include/x86/arch-x86.inc
index e51d595..a98c8c5 100644
--- a/meta/conf/machine/include/x86/arch-x86.inc
+++ b/meta/conf/machine/include/x86/arch-x86.inc
@@ -51,3 +51,9 @@ TUNE_FEATURES_tune-x86-64-x32 = "mx32"
 BASE_LIB_tune-x86-64-x32 = "libx32"
 TUNE_PKGARCH_tune-x86-64-x32 = "x86_64_x32"
 PACKAGE_EXTRA_ARCHS_tune-x86-64-x32 = "${TUNE_PKGARCH_tune-x86-64-x32}"
+
+QEMU_CPU_SUBTYPE = "${@bb.utils.contains('TUNE_FEATURES', 'm64', '-cpu core2duo', '', d)}"
+QEMU_CPU_SUBTYPE_KVM = "${@bb.utils.contains('TUNE_FEATURES', 'm64', '-cpu kvm64', '', d)}"
+
+QEMU_CPU_SUBTYPE .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', '-cpu qemu32', '', d)}"
+QEMU_CPU_SUBTYPE_KVM .= "${@bb.utils.contains('TUNE_FEATURES', 'm32', '-cpu kvm32', '', d)}"
-- 
2.7.4


