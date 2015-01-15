Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 321B97226D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 15:05:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0FF5apx028291
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jan 2015 07:05:36 -0800 (PST)
Received: from msp-dhcp23.wrs.com (172.25.34.23) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 Jan 2015 07:05:35 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jan 2015 09:05:33 -0600
Message-ID: <1421334333-42766-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1421334333-42766-1-git-send-email-mark.hatle@windriver.com>
References: <1421334333-42766-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] arch-mips.inc: Add the MIPS ABIEXTENSION to toolchain name
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
X-List-Received-Date: Thu, 15 Jan 2015 15:05:44 -0000
Content-Type: text/plain

[YOCTO #7143]

When the system is configured for a multilib SDK, such as:

require conf/multilib.conf
MULTILIBS = "multilib:lib32 multilib:lib64"
DEFAULTTUNE = "mips32r2"
DEFAULTTUNE_virtclass-multilib-lib32 = "mips64-n32"
DEFAULTTUNE_virtclass-multilib-lib64 = "mips64"

Only one of the mips64-n32 or mips64 toolchains is built.  Causing the
other to be unavailable.  This is due to both recipes ending up with the
same PN.

The toolchain uses the TRANSLATED_TARGET_ARCH in it's name, however the
target for mips64 and mips64 n32 were the same, causing the conflict.
Avoid this conflict by adding the ABIEXTENSION to the name.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index 02626d3..08d8fdc 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -100,3 +100,5 @@ TUNE_FEATURES_tune-mips64el-nf = "n64"
 BASE_LIB_tune-mips64el-nf = "lib64"
 MIPSPKGSFX_VARIANT_tune-mips64el-nf = "${TUNE_ARCH}"
 PACKAGE_EXTRA_ARCHS_tune-mips64el-nf = "mips64el-nf"
+
+TRANSLATED_TARGET_ARCH_append = "${ABIEXTENSION}"
-- 
1.9.3


