Return-Path: <Meng.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCAB77F2E1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 09:58:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8B9w55g026157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 02:58:06 -0700 (PDT)
Received: from pek-mli1-d1.wrs.com (128.224.162.173) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 11 Sep 2019 02:58:05 -0700
From: <Meng.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2019 17:59:47 +0800
Message-ID: <1568195987-11106-2-git-send-email-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568195987-11106-1-git-send-email-Meng.Li@windriver.com>
References: <1568195987-11106-1-git-send-email-Meng.Li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tune-cortexa57-cortexa53: add tunes for ARM Cortex-A53-Cortex-A57
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
X-List-Received-Date: Wed, 11 Sep 2019 09:58:06 -0000
Content-Type: text/plain

From: Limeng <Meng.Li@windriver.com>

commit 3613b2780a6b5d5d70ea6802be5060a8214cbdb5 from
git://github.com/renesas-rcar/meta-renesas

The renesas rcar SoC H3/M3 is big.LITTLE architecture(cortex-a57.cortex-a53).
In order to optimize the performance of the code running on SoC H3/M3,
add a tune file for ARM Cortex-A53-Cortex-A57.
Create this tune file by refering GCC doc, 3.18.5 ARM Options. 

Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 .../include/tune-cortexa57-cortexa53.inc       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa57-cortexa53.inc

diff --git a/meta/conf/machine/include/tune-cortexa57-cortexa53.inc b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
new file mode 100644
index 0000000000..d05e93f51e
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa57-cortexa53.inc
@@ -0,0 +1,18 @@
+DEFAULTTUNE ?= "cortexa57-cortexa53"
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa57-cortexa53] = "Enable big.LITTLE Cortex-A57.Cortex-A53 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -march=armv8-a", "" ,d)}"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", "cortexa57-cortexa53:", "" ,d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57-cortexa53", " -mtune=cortex-a57.cortex-a53", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa57-cortexa53"
+ARMPKGARCH_tune-cortexa57-cortexa53 = "cortexa57-cortexa53"
+TUNE_FEATURES_tune-cortexa57-cortexa53 = "${TUNE_FEATURES_tune-aarch64} cortexa57-cortexa53"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57-cortexa53"
+BASE_LIB_tune-cortexa57-cortexa53 = "lib64"
-- 
2.18.1


