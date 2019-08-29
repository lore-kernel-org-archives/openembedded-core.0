Return-Path: <Meng.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA4F57F2F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2019 02:02:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7T22dxr011792
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 19:02:39 -0700 (PDT)
Received: from pek-mli1-d1.wrs.com (128.224.162.173) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 28 Aug 2019 19:02:38 -0700
From: <Meng.Li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 29 Aug 2019 10:03:51 +0800
Message-ID: <1567044231-27951-3-git-send-email-Meng.Li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567044231-27951-1-git-send-email-Meng.Li@windriver.com>
References: <1567044231-27951-1-git-send-email-Meng.Li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tune-cortexa57: add tunes for ARM Cortex-A57
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
X-List-Received-Date: Thu, 29 Aug 2019 02:02:38 -0000
Content-Type: text/plain

From: Limeng <Meng.Li@windriver.com>

commit 3613b2780a6b5d5d70ea6802be5060a8214cbdb5 from
git://github.com/renesas-rcar/meta-renesas

Signed-off-by: Meng Li <Meng.Li@windriver.com>
---
 meta/conf/machine/include/tune-cortexa57.inc | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-cortexa57.inc

diff --git a/meta/conf/machine/include/tune-cortexa57.inc b/meta/conf/machine/include/tune-cortexa57.inc
new file mode 100644
index 0000000000..4a458948e6
--- /dev/null
+++ b/meta/conf/machine/include/tune-cortexa57.inc
@@ -0,0 +1,18 @@
+DEFAULTTUNE ?= "cortexa57"
+require conf/machine/include/arm/arch-armv8a.inc
+
+TUNEVALID[cortexa57] = "Enable Cortex-A57 specific processor optimizations"
+TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -march=armv8-a", "" ,d)}"
+
+MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa57", "cortexa57:", "" ,d)}"
+
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa57", " -mtune=cortex-a57", "", d)}"
+
+# Little Endian base configs
+AVAILTUNES += "cortexa57"
+ARMPKGARCH_tune-cortexa57 = "cortexa57"
+TUNE_FEATURES_tune-cortexa57 = "${TUNE_FEATURES_tune-aarch64} cortexa57"
+PACKAGE_EXTRA_ARCHS_tune-cortexa57 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa57"
+BASE_LIB_tune-cortexa57 = "lib64"
-- 
2.18.1


