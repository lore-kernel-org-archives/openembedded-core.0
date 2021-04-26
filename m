Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.909.1619398455294766979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: IqqmTVNzNt5OcnmzDPL/iMU7VjEPM67gPh1D0TCPC2xp0658YOlTaCOzH9Qrd4mYCsi8rce/Fe
 Q1SulwT12OBQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818081"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818081"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:17 -0700
IronPort-SDR: M4IAggXOwb/DIXL12slIVYImgqxtl8wySq//YmUiNTPOuuNqb8u7hE01+0Kd2nGD1qXLNWqwqA
 zn5AtTfzhMeA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067299"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:16 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 16/64] linux-yocto/5.4: fix arm defconfig warnings
Date: Mon, 26 Apr 2021 08:52:47 +0800
Message-Id: <32495969b2b37c2cd4f334339c4a57066da23873.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

A recent fix to the kern-tools promoted some previously unseen
issues to warnings. This commit fixes them by tagging some BT
options as non-hardware so they won't generate warnings if they
don't appear in the final .config. These are sub BT options and
shouldn't warn when/if their controlling option is disabled by
a fragment.

    d7fd0213b75 base: exclude some BT options as non-hardware

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a86c8251905baf5bf4714f3db01cdfae02383839)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e52c9ebe0e..a802a570a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "324e77d816cf6434507ab29140beb24044009efa"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index f07375c761..1edc632de7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "8463db325b93f0669446f68c19334cfe11ffb9c2"
 SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 38833ff8f7..9c8c363713 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
 SRCREV_machine_qemux86-64 ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
 SRCREV_machine_qemumips64 ?= "996fe040c8d8d01a9af6be42dae3844d127471bf"
 SRCREV_machine ?= "5f54b437b6502d3febee553100b2cb2a9e0c5f8a"
-SRCREV_meta ?= "5017570a130f142365dfdcd043d84143fdd6e255"
+SRCREV_meta ?= "d7fd0213b75ce9b6206f63dbdd435ab326598642"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.30.2

