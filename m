Return-Path: <california.l.sullivan@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB69600E3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 03:12:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jan 2018 19:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,409,1511856000"; d="scan'208";a="13292498"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga006.jf.intel.com with ESMTP; 24 Jan 2018 19:12:30 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jan 2018 19:12:27 -0800
Message-Id: <20180125031227.18327-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
Cc: bruce.ashfield@windriver.com
Subject: [PATCH] kernel.bbclass: set HOSTLDFLAGS in KCONFIG_CONFIG_COMMAND
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jan 2018 03:12:29 -0000

Kernel v4.14 and newer contain the following in their Makefile:

HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS)

This breaks our menuconfig, because it can no longer find ncurses if its
not on the host machine. This can be seen in linux-yocto-dev, for
example:

[clsulliv@clsulliv build]$ bitbake virtual/kernel -c menuconfig

  GEN     ./Makefile
  HOSTLD  scripts/kconfig/mconf
/home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -lncurses
/home/clsulliv/yocto/poky/build/tmp/hosttools/ld: cannot find -ltinfo
collect2: error: ld returned 1 exit status
make[3]: *** [scripts/Makefile.host:99: scripts/kconfig/mconf] Error 1
make[2]: *** [/home/clsulliv/yocto/poky/build/tmp/work-shared/intel-corei7-64/kernel-source/Makefile:504: menuconfig] Error 2
make[1]: *** [Makefile:146: sub-make] Error 2
make: *** [Makefile:24: __sub-make] Error 2
Command failed.
Press any key to continue...

Fix this by setting HOSTLDFLAGS to ${BUILD_LDFLAGS} in our
'make menuconfig' command.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2f6eca382e9..e4df1531c19 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -531,6 +531,8 @@ addtask savedefconfig after do_configure
 
 inherit cml1
 
+KCONFIG_CONFIG_COMMAND_append = " HOSTLDFLAGS='${BUILD_LDFLAGS}'"
+
 EXPORT_FUNCTIONS do_compile do_install do_configure
 
 # kernel-base becomes kernel-${KERNEL_VERSION}
-- 
2.14.3


