Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web10.1470.1626403376126661608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494692"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494692"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075569"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:43:07 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 25/28] kernel-devsrc: fix scripts/prepare for ARM64
Date: Fri, 16 Jul 2021 10:42:23 +0800
Message-Id: <f7dca74b768ca001dd72562b80e501f6257bdaa8.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

There are two new tools in 5.13+ required for on target
recreation of the build environment.

We conditionally add them to the devsrc recipe to support
both 5.13 and older kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cb1b7e76f20dc7f11a667fa00958ab56e680c632)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 84e99233e6..b1837b3a51 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -163,6 +163,14 @@ do_install() {
             cp -a --parents arch/arm64/kernel/vdso/gen_vdso_offsets.sh $kerneldir/build/
 
             cp -a --parents arch/arm64/kernel/module.lds $kerneldir/build/ 2>/dev/null || :
+
+            # 5.13+ needs these tools
+            cp -a --parents arch/arm64/tools/gen-cpucaps.awk $kerneldir/build/ 2>/dev/null || :
+            cp -a --parents arch/arm64/tools/cpucaps $kerneldir/build/ 2>/dev/null || :
+
+            if [ -e $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk ]; then
+                 sed -i -e "s,#!.*awk.*,#!${USRBINPATH}/env awk," $kerneldir/build/arch/arm64/tools/gen-cpucaps.awk
+            fi
 	fi
 
 	if [ "${ARCH}" = "powerpc" ]; then
@@ -307,3 +315,5 @@ RDEPENDS_${PN} += "openssl-dev util-linux"
 RDEPENDS_${PN} += "${@bb.utils.contains('ARCH', 'x86', 'elfutils', '', d)}"
 # 5.8+ needs gcc-plugins libmpc-dev
 RDEPENDS_${PN} += "gcc-plugins libmpc-dev"
+# 5.13+ needs awk for arm64
+RDEPENDS_${PN}_append_aarch64 = " gawk"
-- 
2.31.1

