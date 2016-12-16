Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 15C8D77407
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 15:14:42 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 6021DA38059DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 15:14:39 +0000 (GMT)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Fri, 16 Dec 2016 15:14:42 +0000
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
To: <openembedded-core@lists.openembedded.org>, <Zubair.Kakakhel@imgtec.com>
Date: Fri, 16 Dec 2016 15:14:37 +0000
Message-ID: <20161216151437.48334-1-Zubair.Kakakhel@imgtec.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
X-Originating-IP: [192.168.154.45]
Subject: [Patch] arch-mips: Add MIPS 64r6 N32 tune
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
X-List-Received-Date: Fri, 16 Dec 2016 15:14:42 -0000
Content-Type: text/plain

Add MIPS64R6-n32 tuning options.

Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
---
 meta/classes/insane.bbclass                 |  2 ++
 meta/classes/siteinfo.bbclass               |  2 ++
 meta/conf/machine/include/tune-mips64r6.inc | 26 ++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 1a742cf..f8f6e00 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -174,6 +174,8 @@ def package_qa_get_machine_dict(d):
             "linux-gnun32" :       {
                         "mips64":       ( 8,     0,    0,          False,         32),
                         "mips64el":     ( 8,     0,    0,          True,          32),
+                        "mipsisa64r6":  ( 8,     0,    0,          False,         32),
+                        "mipsisa64r6el":( 8,     0,    0,          True,          32),
                       },
         }
 
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index abb194f..2c33732 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -89,6 +89,8 @@ def siteinfo_data(d):
         "mips64el-linux-musl": "mips64el-linux",
         "mips64-linux-gnun32": "mips-linux bit-32",
         "mips64el-linux-gnun32": "mipsel-linux bit-32",
+        "mipsisa64r6-linux-gnun32": "mipsisa32r6-linux bit-32",
+        "mipsisa64r6el-linux-gnun32": "mipsisa32r6el-linux bit-32",
         "powerpc-linux": "powerpc32-linux",
         "powerpc-linux-musl": "powerpc-linux powerpc32-linux",
         "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
diff --git a/meta/conf/machine/include/tune-mips64r6.inc b/meta/conf/machine/include/tune-mips64r6.inc
index f0ad564..2289fb4 100644
--- a/meta/conf/machine/include/tune-mips64r6.inc
+++ b/meta/conf/machine/include/tune-mips64r6.inc
@@ -30,3 +30,29 @@ TUNE_FEATURES_tune-mipsisa64r6el-nf = "r6 n64 mipsisa64r6"
 MIPSPKGSFX_VARIANT_tune-mipsisa64r6el-nf = "${TUNE_ARCH}"
 BASE_LIB_tune-mipsisa64r6el-nf = "lib64"
 PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6el-nf = "mipsisa64r6el-nf"
+
+# MIPS 64r6 n32
+AVAILTUNES += "mipsisa64r6-n32 mipsisa64r6el-n32"
+
+TUNE_FEATURES_tune-mipsisa64r6-n32 = "bigendian fpu-hard r6 n32 mipsisa64r6"
+BASE_LIB_tune-mipsisa64r6-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mipsisa64r6-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6-n32 = "mipsisa64r6-n32"
+
+TUNE_FEATURES_tune-mipsisa64r6el-n32 = "fpu-hard r6 n32 mipsisa64r6"
+BASE_LIB_tune-mipsisa64r6el-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mipsisa64r6el-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6el-n32 = "mipsisa64r6el-n32"
+
+# MIPS 64r6 n32 and Soft Float
+AVAILTUNES += "mipsisa64r6-nf-n32 mipsisa64r6el-nf-n32"
+
+TUNE_FEATURES_tune-mipsisa64r6-nf-n32 = "bigendian r6 n32 mipsisa64r6"
+BASE_LIB_tune-mipsisa64r6-nf-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mipsisa64r6-nf-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6-nf-n32 = "mipsisa64r6-nf-n32"
+
+TUNE_FEATURES_tune-mipsisa64r6el-nf-n32 = "bigendian r6 n32 mipsisa64r6"
+BASE_LIB_tune-mipsisa64r6el-nf-n32 = "lib32"
+MIPSPKGSFX_VARIANT_tune-mipsisa64r6el-nf-n32 = "${TUNE_ARCH}"
+PACKAGE_EXTRA_ARCHS_tune-mipsisa64r6el-nf-n32 = "mipsisa64r6el-nf-n32"
-- 
2.10.2


