Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web09.15098.1605233486292475509
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 18:11:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: lili.li@intel.com)
IronPort-SDR: peRUia5sbDoOFd++yqELkvce0+NwV81PiaRe66ETYJ/CJlMFVd9RVxyheb6ITnAttQLtP9YTCy
 tqd0OhQwrr8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166906097"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="166906097"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 18:11:25 -0800
IronPort-SDR: 6rdBjBTgQFO6WWoAeruTiHJ7LQldUIkMeqEZWRQbL/ckQ7N+O5SBv/V5jgAHeyJUQEzXQJwVW6
 587KKMVvpJKg==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; 
   d="scan'208";a="309025237"
Received: from lilili-ubuntu.bj.intel.com ([10.238.144.107])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2020 18:11:24 -0800
From: lili.li@intel.com
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	kris.pan@intel.com
Subject: [OE-core][gatesgarth][dunfell][master][PATCH] kernel.bbclass: fix module.lds missing issue since kernel v5.10
Date: Fri, 13 Nov 2020 10:10:02 +0800
Message-Id: <20201113021002.30015-1-lili.li@intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With v5.10-rc1 kernel commit 596b0474d3d9 (kbuild: preprocess module
 linker script), external kernel module need scripts/module.lds
for compiling.

Error Log:
*** No rule to make target 'scripts/module.lds', needed by ....

Signed-off-by: Pan, Kris <kris.pan@intel.com>
Signed-off-by: Lili Li <lili.li@intel.com>
---
 meta/classes/kernel.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9e3c34ad48..5c262f340e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -358,6 +358,10 @@ do_compile_kernelmodules() {
 		# other kernel modules and will look at this
 		# file to do symbol lookups
 		cp ${B}/Module.symvers ${STAGING_KERNEL_BUILDDIR}/
+		if [ -e ${B}/scripts/module.lds ]; then
+			mkdir -p ${STAGING_KERNEL_BUILDDIR}/scripts
+			cp ${B}/scripts/module.lds ${STAGING_KERNEL_BUILDDIR}/scripts/
+		fi
 	else
 		bbnote "no modules to compile"
 	fi
@@ -465,6 +469,11 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
+	if [ -e ./scripts/module.lds ]; then
+		mkdir -p $kerneldir/scripts
+		cp ./scripts/module.lds $kerneldir/scripts/
+	fi
+
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
-- 
2.17.1

