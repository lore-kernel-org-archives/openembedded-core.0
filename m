Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: iamFmSmez4t8SaOp8ny9I5hY60wT7spjMARZiTbUgaH4bHRmnmw91e73Gst73niFOJVi3Q8UYM
 F1KFiYgmpEYw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818215"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818215"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:44 -0700
IronPort-SDR: +JJB1BZAfS1x9UO0Eqq5Ixw5vpsAwpVGCNryQDRl5JS80EmHVY34vWZqFvnHLjavrZd06mNwYR
 NuJxA8YwI6Bg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067434"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:42 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 36/64] Revert "inittab: Add getty launch on hvc0 for qemuppc64"
Date: Mon, 26 Apr 2021 08:53:07 +0800
Message-Id: <5dbe969f4fdcf3005c0a69e97e8753819ab066a4.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Hao <kexin.hao@windriver.com>

This reverts commit ed69ef20167da0986bc9363d1a91e62001995af4.

The console entry has already been added into /etc/inittab based
on the SERIAL_CONSOLES. So drop this redundant entry.

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 633f0c6b74e3caa2bae52ca60c61b811b7b2215d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/busybox/busybox-inittab_1.33.0.bb    | 3 ---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 4 ----
 2 files changed, 7 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb b/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
index 0021e45511..3804f4f7b2 100644
--- a/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox-inittab_1.33.0.bb
@@ -44,9 +44,6 @@ EOF
 	fi
 
 }
-do_install_append_qemuppc64 () {
-            echo "9:12345:respawn:${base_sbindir}/getty 38400 hvc0" >> ${D}${sysconfdir}/inittab
-}
 
 pkg_postinst_${PN} () {
 # run this on host and on target
diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 0af116f35c..d95d1a63f5 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -53,10 +53,6 @@ EOF
     fi
 }
 
-do_install_append_qemuppc64 () {
-            echo "9:12345:respawn:${base_sbindir}/getty 38400 hvc0" >> ${D}${sysconfdir}/inittab
-}
-
 pkg_postinst_${PN} () {
 # run this on host and on target
 if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
-- 
2.30.2

