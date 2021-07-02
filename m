Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11928.1625242832205213805
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043540"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043540"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:40 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776509"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:38 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 21/22] kernel-devsrc: adjust NM and OBJTOOL variables for target
Date: Sat,  3 Jul 2021 00:20:03 +0800
Message-Id: <fddcfd6ba512cfdec0188c20a28be322b1499667.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

v5.13 has started storting the values for NM and OBJTOOL in
auto.conf.cmd

Just as we've done for other tools, we need to adjust NM and
OBJTOOL to the names of the on-target executables. With this
adjustment, 'make scripts prepare' continues to work without
user intervention on the target.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e749b81ece1f94f99ca26028a2f6f891aa14bda9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 455c836527..84e99233e6 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -272,6 +272,8 @@ do_install() {
         sed -i 's/ifneq "$(CC)" ".*-linux-.*gcc.*$/ifneq "$(CC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(LD)" ".*-linux-.*ld.bfd.*$/ifneq "$(LD)" "ld"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(AR)" ".*-linux-.*ar.*$/ifneq "$(AR)" "ar"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(OBJCOPY)" ".*-linux-.*objcopy.*$/ifneq "$(OBJCOPY)" "objcopy"/' "$kerneldir/build/include/config/auto.conf.cmd"
+        sed -i 's/ifneq "$(NM)" ".*-linux-.*nm.*$/ifneq "$(NM)" "nm"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(HOSTCXX)" ".*$/ifneq "$(HOSTCXX)" "g++"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(HOSTCC)" ".*$/ifneq "$(HOSTCC)" "gcc"/' "$kerneldir/build/include/config/auto.conf.cmd"
         sed -i 's/ifneq "$(CC_VERSION_TEXT)".*\(gcc.*\)"/ifneq "$(CC_VERSION_TEXT)" "\1"/' "$kerneldir/build/include/config/auto.conf.cmd"
-- 
2.31.1

