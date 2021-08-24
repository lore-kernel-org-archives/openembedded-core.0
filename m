Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.1113.1629822388143549583
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360347"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360347"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455659048"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:26:02 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 20/28] kernel-devsrc: 5.14+ updates
Date: Wed, 25 Aug 2021 00:25:22 +0800
Message-Id: <6b813320224fb46c7db8f51309214378e5a6edab.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

commit 6218d0f6b8dec [x86/syscalls: Switch to generic syscalltbl.sh]
means that x86 no longer has a syscall script to copy, which causes
a build error.

We already copy the generic syscall script (in scripts), so we just
catch errors for the copies to support older and 5.14+ kernels in
the same devsrc recipe.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5debc9bc25110b836b76927c61b2455e5e235a84)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 92076ac8b0..4897084aab 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -218,10 +218,10 @@ do_install() {
 
 	if [ "${ARCH}" = "x86" ]; then
 	    # files for 'make prepare' to succeed with kernel-devel
-	    cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build/
-	    cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh") $kerneldir/build/
-	    cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh") $kerneldir/build/
-	    cp -a --parents $(find arch/x86 -type f -name "syscall_64.tbl") $kerneldir/build/
+	    cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl") $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh") $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh") $kerneldir/build/ 2>/dev/null || :
+	    cp -a --parents $(find arch/x86 -type f -name "syscall_64.tbl") $kerneldir/build/ 2>/dev/null || :
 	    cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
 	    cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
-- 
2.31.1

