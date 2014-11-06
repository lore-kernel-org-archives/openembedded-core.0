Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2E671F44
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:38:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA6Fcl3o019019
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Nov 2014 07:38:47 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 6 Nov 2014 07:38:46 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <fathi.boudra@linaro.org>, <joe.slater@windriver.com>,
	<mark.hatle@windriver.com>
Date: Thu, 6 Nov 2014 23:34:05 +0800
Message-ID: <64561c22991bd9f0166e3bcb246b19db5f1703f0.1415264549.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Cc: koen.kooi@linaro.org, openembedded-core@lists.openembedded.org
Subject: [PATCH 02/25] Add machine qemuarm64
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
X-List-Received-Date: Thu, 06 Nov 2014 15:38:47 -0000
Content-Type: text/plain

Add machine qemuarm64. The configure files are derived from linaro.

Update:
* rename genericarmv8 to qemuarm64 for coordination in oe-core
* include qemu.inc then remove common part of config
* disable using autoserial
* move arch-armv8.inc from machine/include/arm64 to machine/include/arm

[YOCTO #6487]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/machine/include/arm/arch-armv8.inc | 20 ++++++++++++++++++++
 meta/conf/machine/qemuarm64.conf             | 12 ++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
 create mode 100644 meta/conf/machine/qemuarm64.conf

diff --git a/meta/conf/machine/include/arm/arch-armv8.inc b/meta/conf/machine/include/arm/arch-armv8.inc
new file mode 100644
index 0000000..c86142a
--- /dev/null
+++ b/meta/conf/machine/include/arm/arch-armv8.inc
@@ -0,0 +1,20 @@
+DEFAULTTUNE ?= "aarch64"
+
+ARMPKGARCH ?= "aarch64"
+
+TUNEVALID[aarch64] = "Enable instructions for aarch64"
+TUNEVALID[bigendian] = "Enable big-endian mode."
+TUNECONFLICTS[aarch64] = ""
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", ":aarch64", "" ,d)}"
+
+# Little Endian base configs
+AVAILTUNES += "aarch64 aarch64_be"
+TUNE_FEATURES_tune-aarch64 ?= "aarch64"
+TUNE_FEATURES_tune-aarch64_be ?= "${TUNE_FEATURES_tune-aarch64} bigendian"
+
+ARMPKGSFX_ENDIAN = "${@bb.utils.contains("TUNE_FEATURES", "bigendian", "_be", "", d)}"
+
+TUNE_ARCH = "aarch64${ARMPKGSFX_ENDIAN}"
+TUNE_PKGARCH = "aarch64${ARMPKGSFX_ENDIAN}"
+
+PACKAGE_EXTRA_ARCHS = "aarch64${ARMPKGSFX_ENDIAN}"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
new file mode 100644
index 0000000..20bcfba
--- /dev/null
+++ b/meta/conf/machine/qemuarm64.conf
@@ -0,0 +1,12 @@
+#@TYPE: Machine
+#@NAME: generic armv8 machine
+#@DESCRIPTION: Machine configuration for running a generic armv8
+
+require conf/machine/include/arm/arch-armv8.inc
+require conf/machine/include/qemu.inc
+
+MACHINE_FEATURES = ""
+
+KERNEL_IMAGETYPE = "Image"
+
+SERIAL_CONSOLE = "38400 ttyAMA0"
-- 
1.9.1


