Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F2E8F770A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 14:46:42 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 19 Aug 2016 07:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="1017373394"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 19 Aug 2016 07:46:44 -0700
Received: from ed.fi.intel.com (ed.fi.intel.com [10.237.72.179])
	by linux.intel.com (Postfix) with ESMTP id E19456A4006;
	Fri, 19 Aug 2016 07:46:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 17:46:39 +0300
Message-Id: <1471617999-4050-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] syslinux.bbclass: ensure creation of output directory
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
X-List-Received-Date: Fri, 19 Aug 2016 14:46:43 -0000

build_syslinux_cfg function creates syslinux configuration file.
The code assumes that the output directory exists, which is not
always the case. For example rm_work task removes rootfs directory
structure and causes build_syslinux_cfg to fail with this error:
Unable to open ../<image>-<version>/syslinux_vm.cfg

Made build_syslinux_cfg depend on output directory to ensure that
directory is created before running the function.

[YOCTO #10159]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/syslinux.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index fa3e3ec..35d9eed 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -196,3 +196,4 @@ python build_syslinux_cfg () {
 
     cfgfile.close()
 }
+build_syslinux_cfg[dirs] = "${S}"
-- 
2.6.6


