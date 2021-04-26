Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: CKqo/17mK7g7Qw1D2Dr21GquFJGycJaUsRkcR5agFTU8Ymoia8oUtnfklfFTHk3mSE8GvhOuQh
 +fEHUfNoGUeA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818204"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:41 -0700
IronPort-SDR: xuXKvBazXKzatGTPQDU9RoccboZ2nMSsv+Xk/r7Au5Qor7oaAJpstWMtxZq0tFoRtH9J74+SSp
 d4kFGQ9jB7OA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067425"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:40 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 34/64] modutils-initscripts: Bail out when no module is installed
Date: Mon, 26 Apr 2021 08:53:05 +0800
Message-Id: <1aa5d8231a7e4ee2f19afbe12aa49fc19c854062.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Hao <kexin.hao@windriver.com>

Fix the following warning when boot with a core-image-minimal rootfs:
  depmod: can't change directory to 'lib/modules/5.10.25-yocto-standard': No such file or directory

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c34650400182a1104a5fbe03e54f5cea69eb1900)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/modutils-initscripts/files/modutils.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
index 28fe6f92d7..67e1dcd990 100755
--- a/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
+++ b/meta/recipes-kernel/modutils-initscripts/files/modutils.sh
@@ -13,6 +13,7 @@
 
 LOAD_MODULE=modprobe
 [ -f /proc/modules ] || exit 0
+[ -d /lib/modules/`uname -r` ] || exit 0
 
 # Test if modules.dep exists and has a size greater than zero
 if [ ! -s /lib/modules/`uname -r`/modules.dep ]; then
-- 
2.30.2

