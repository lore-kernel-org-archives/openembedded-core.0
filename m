Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BE24679AD6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 08:41:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2018 01:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,367,1534834800"; d="scan'208";a="271454751"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.232])
	by fmsmga006.fm.intel.com with ESMTP; 11 Oct 2018 01:41:16 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 16:41:10 +0800
Message-Id: <20181011084111.11619-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181011084111.11619-1-anuj.mittal@intel.com>
References: <20181011084111.11619-1-anuj.mittal@intel.com>
Subject: [PATCH 2/3] busybox: move reboot out of init.cfg
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
X-List-Received-Date: Thu, 11 Oct 2018 08:41:39 -0000

reboot is needed for initramfs where no init manager is set. This
partially reverts:

commit b6fbb3f3d4d6367b0fd7921078f67057551c7ede
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Mon Jul 30 17:41:57 2018 +0800

    busybox: move init related configs to init.cfg

    Move init related configs to init.cfg.

    These config items do not make much sense unless busybox is selected
    as the init manager. They should belong to init.cfg.

We would need to set up ALTERNATIVES for reboot in this case.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/busybox/busybox/defconfig | 2 +-
 meta/recipes-core/busybox/busybox/init.cfg  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox/defconfig b/meta/recipes-core/busybox/busybox/defconfig
index f081f281cc..32213c0675 100644
--- a/meta/recipes-core/busybox/busybox/defconfig
+++ b/meta/recipes-core/busybox/busybox/defconfig
@@ -480,7 +480,7 @@ CONFIG_FEATURE_XARGS_SUPPORT_REPL_STR=y
 # CONFIG_FEATURE_BOOTCHARTD_CONFIG_FILE is not set
 # CONFIG_HALT is not set
 # CONFIG_POWEROFF is not set
-# CONFIG_REBOOT is not set
+CONFIG_REBOOT=y
 # CONFIG_FEATURE_CALL_TELINIT is not set
 # CONFIG_TELINIT_PATH is not set
 # CONFIG_INIT is not set
diff --git a/meta/recipes-core/busybox/busybox/init.cfg b/meta/recipes-core/busybox/busybox/init.cfg
index 3c1fdd42b6..3b839c515c 100644
--- a/meta/recipes-core/busybox/busybox/init.cfg
+++ b/meta/recipes-core/busybox/busybox/init.cfg
@@ -2,7 +2,6 @@ CONFIG_INIT=y
 CONFIG_FEATURE_USE_INITTAB=y
 CONFIG_HALT=y
 CONFIG_POWEROFF=y
-CONFIG_REBOOT=y
 CONFIG_FEATURE_KILL_DELAY=0
 CONFIG_TELINIT_PATH=""
 CONFIG_INIT_TERMINAL_TYPE=""
-- 
2.17.1


