Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 27fKkaKtvt5TksYRpmnjAHNUaZpat3HfkCwAguuRn/XyP/aoON3RGpfitirpzKYQsSzFcgPpZ5
 GDwxwUL8brqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720045"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720045"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:37 -0800
IronPort-SDR: uBLdOo9YU+DlzcmTn59G4iRnqWOeBr6U1u4ZG6zUAVuqjJhOXgw5z7aiYEnZQPSwjs2TA8pPqh
 ltUrEZWdpHRw==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400803012"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:35 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/19] kernel: provide module.lds for out of tree builds in v5.10+
Date: Tue, 17 Nov 2020 23:36:06 +0800
Message-Id: <b10b5527ec2455f597e56327d3d320c2711e39ef.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The upstream commit 596b0474d3d [kbuild: preprocess module linker
script], adds a dependency on module.lds for external module
building.

Since module.lds is generated as part of 'modules_prepare', we
must make it available with the other kernel artifacts in the
kernel shared workdir, otherwise out of tree builds fail.

This fixes errors like:

    | make[4]: *** No rule to make target 'scripts/module.lds', needed by
        'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
        Stop.
    | make[4]: *** Waiting for unfinished jobs....

We also ensure that kernel-devsrc has a copy to support on
target module builds that are often prepared with 'make scripts
prepare'. Those targets won't regenerate it, so the build fails.
If 'make modules_prepare' is used, the file will be regenerated
and overwrite our copy (as expected).

Signed-off-by: Pan, Kris <kris.pan@intel.com>
Signed-off-by: Lili Li <lili.li@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fc66a0b64953aae38d0124b57615fffaec8de52)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/kernel.bbclass                | 1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 78def5bbc1..22c92381c0 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -486,6 +486,7 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
+	[ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index aa8e162f4f..8373c97a31 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -86,6 +86,12 @@ do_install() {
 	# be dealt with.
 	# cp -a scripts $kerneldir/build
 
+	# although module.lds can be regenerated on target via 'make modules_prepare'
+	# there are several places where 'makes scripts prepare' is done, and that won't
+	# regenerate the file. So we copy it onto the target as a migration to using
+	# modules_prepare
+	cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
+
         if [ -d arch/${ARCH}/scripts ]; then
 	    cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
 	fi
-- 
2.28.0

