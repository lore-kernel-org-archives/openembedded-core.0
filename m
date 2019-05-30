Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BA7F67E343
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 09:24:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4U9Mu9s018564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2019 02:23:07 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 30 May 2019 02:22:46 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 May 2019 05:22:30 -0400
Message-ID: <20190530092232.169453-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190530092232.169453-1-kai.kang@windriver.com>
References: <20190530092232.169453-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: poky@yoctoproject.org, peter.kjellerstedt@axis.com,
	openembedded-core@lists.openembedded.org
Subject: [meta-poky][PATCH v4 1/3] poky.conf: make systemd as default init manager
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
X-List-Received-Date: Thu, 30 May 2019 09:24:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Move configurations from local.conf.sample.extended to poky.conf to make
systemd as default init manager for poky. Introduce a new variable
'POKY_INIT_MANAGER' whose value should be either 'systemd' or 'sysvinit'
to configure the init manager setting.

For users who still want to use sysvinit, set in local.conf or any other
configure file with:

  POKY_INIT_MANAGER = "sysvinit"

[YOCTO #13031]

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-poky/conf/distro/poky.conf           | 10 ++++++++++
 meta-poky/conf/local.conf.sample.extended |  9 ---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index 78621e6dbf..2d73bbcd03 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -21,6 +21,16 @@ POKY_DEFAULT_EXTRA_RRECOMMENDS = "kernel-module-af-packet"
 
 DISTRO_FEATURES ?= "${DISTRO_FEATURES_DEFAULT} ${POKY_DEFAULT_DISTRO_FEATURES}"
 
+#
+# Use systemd for system initialization
+#
+POKY_INIT_MANAGER ?= "systemd"
+DISTRO_FEATURES_BACKFILL += "${POKY_INIT_MANAGER}"
+DISTRO_FEATURES_BACKFILL_CONSIDERED += "${@bb.utils.contains('POKY_INIT_MANAGER', 'systemd', 'sysvinit', 'systemd', d)}"
+VIRTUAL-RUNTIME_login_manager = "${@bb.utils.contains('POKY_INIT_MANAGER', 'systemd', 'shadow-base', 'busybox', d)}"
+VIRTUAL-RUNTIME_init_manager = "${POKY_INIT_MANAGER}"
+VIRTUAL-RUNTIME_initscripts = "${@bb.utils.contains('POKY_INIT_MANAGER', 'systemd', 'systemd-compat-units', 'initscripts', d)}"
+
 PREFERRED_VERSION_linux-yocto ?= "5.0%"
 
 SDK_NAME = "${DISTRO}-${TCLIBC}-${SDKMACHINE}-${IMAGE_BASENAME}-${TUNE_PKGARCH}-${MACHINE}"
diff --git a/meta-poky/conf/local.conf.sample.extended b/meta-poky/conf/local.conf.sample.extended
index 26603debe6..e20fc5dbf3 100644
--- a/meta-poky/conf/local.conf.sample.extended
+++ b/meta-poky/conf/local.conf.sample.extended
@@ -377,12 +377,3 @@ DISTRO_FEATURES_remove = "x11"
 #VIRTUAL-RUNTIME_initscripts = "initscripts"
 #VIRTUAL-RUNTIME_keymaps = "keymaps"
 #DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
-
-#
-# Use systemd for system initialization
-#
-#DISTRO_FEATURES_append = " systemd"
-#DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
-#VIRTUAL-RUNTIME_login_manager = "shadow-base"
-#VIRTUAL-RUNTIME_init_manager = "systemd"
-#VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
-- 
2.20.0


