Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web12.1819.1593150444846746442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 22:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: lili.li@intel.com)
IronPort-SDR: AqkpdgdMuScTlPZP54j3XgDD5gxlewlQF9txvmp2afiPArsFht1xLF4HWahaWkjErygz9Mz7kB
 n20F4tRwaMlA==
X-IronPort-AV: E=McAfee;i="6000,8403,9663"; a="142713088"
X-IronPort-AV: E=Sophos;i="5.75,282,1589266800"; 
   d="scan'208";a="142713088"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2020 22:47:24 -0700
IronPort-SDR: TPOibteW96kKQYF0BVd3jhK88AjEqhgEgsiiQr1VJG05W8Qb9CrpKmuheLRm1euOEAWLtODb1N
 KutN5MgUvCXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,282,1589266800"; 
   d="scan'208";a="453261062"
Received: from lilili-ubuntu.bj.intel.com ([10.238.144.107])
  by orsmga005.jf.intel.com with ESMTP; 25 Jun 2020 22:47:22 -0700
From: lili.li@intel.com
To: openembedded-core@lists.openembedded.org
Cc: Anuj.Mittal@intel.com
Subject: [dunfell][master][PATCH] kernel.bbclass: Fix Module.symvers support
Date: Fri, 26 Jun 2020 13:45:56 +0800
Message-Id: <20200626054556.32056-1-lili.li@intel.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lili Li <lili.li@intel.com>

Starting from v5.8-rc1 commit 269a535ca931 (modpost: generate
vmlinux.symvers and reuse it for the second modpost"), kernel will
generate new vmlinux.symvers instead of dumping all the vmlinux symbols
into Module.symvers in the first pass.

Error log:
    'run.do_shared_workdir.16614' failed with exit code 1:
    DEBUG: cp: cannot stat 'Module.symvers': No such file or directory

This change will check the file Module.symvers existence before copying it.

Signed-off-by: Lili Li <lili.li@intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 20a0135fc979..a1219f315620 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -463,7 +463,7 @@ do_shared_workdir () {
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
-	cp Module.symvers $kerneldir/
+	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.26.2

