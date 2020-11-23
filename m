Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: xAqsJ7Eu9CqszrwoB9/2rZg403lRlrRnk+jN6hYlj6fMYyWOTlL19D5/bmZ5kwkbKalRdVgc/F
 w3aLEUv2eulw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920722"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920722"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:23 -0800
IronPort-SDR: gJriY9KPLJiLCD4Tv3oYqPxZCeP6SlDCXNXqMKiDLSwqBzWcXxowk9+U4UbBDv7VJ1HmMC++JP
 FvyrujLzusfg==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475209"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:22 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 14/21] kernel: relocate copy of module.lds to module compilation task
Date: Mon, 23 Nov 2020 23:06:44 +0800
Message-Id: <d9e327063f63193186822d958706081d64ec8139.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

There were two copies of this patch floating around, and the merged
variant has the copy in the wrong place.

module.lds is only created during modules_prepare, and that target is
not invoked during our main build of the kernel. We aren't about to
change the kernel build (there's no need), so we move the copy into
the compile_kernelmodules task. After that runs, we have module.lds
availble to copy.

This has been tested against clean kernel + out of tree module
builds, and the dependencies are correct that the file is copied
before the out of tree module build starts.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7d94f9209ebaaf59ea001239a889dd7f928a0e7c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 22c92381c0..6fffcac07f 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -383,6 +383,10 @@ do_compile_kernelmodules() {
 		# other kernel modules and will look at this
 		# file to do symbol lookups
 		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
+		# 5.10+ kernels have module.lds that we need to copy for external module builds
+		if [ -e "${B}/scripts/module.lds" ]; then
+			install -Dm 0644 ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/module.lds
+		fi
 	else
 		bbnote "no modules to compile"
 	fi
@@ -486,7 +490,6 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
-	[ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.28.0

