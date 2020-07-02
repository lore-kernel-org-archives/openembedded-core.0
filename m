Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.2077.1593651261154006625
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jul 2020 17:54:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xZfkPNR3jYYBsOeNP6cjqMkCWeEr0B81HKy5HXro08PMeorhiLoop0E8A/zAuxMLcfR8WC2VqY
 tqJLwwR+U89g==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="231628850"
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="231628850"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:32 -0700
IronPort-SDR: GIGo8IsJszrbmZ36qbobk0EjqqbJXV9WqNKikfqDScM/6K1Ty4jYgndtOR1YIDd+sf86P4T/i+
 17exJxL8YIfA==
X-IronPort-AV: E=Sophos;i="5.75,302,1589266800"; 
   d="scan'208";a="481801697"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.249.69.56])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 17:54:30 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 08/10] kernel.bbclass: Fix Module.symvers support
Date: Thu,  2 Jul 2020 08:54:10 +0800
Message-Id: <03248953d1eacede00971289dc9fff8d97d00464.1593474787.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1593474787.git.anuj.mittal@intel.com>
References: <cover.1593474787.git.anuj.mittal@intel.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd2d62a08a1dfcd890a03ee55132b6d6c65f5ab7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 750988f4e5..9ace74564c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -452,7 +452,7 @@ do_shared_workdir () {
 
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
-	cp Module.symvers $kerneldir/
+	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.25.4

