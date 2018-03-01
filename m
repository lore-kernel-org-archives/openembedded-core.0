Return-Path: <california.l.sullivan@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6DF4C78959
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 02:16:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2018 18:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="178932814"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 28 Feb 2018 18:16:13 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 18:15:07 -0800
Message-Id: <20180301021518.29564-11-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180301021518.29564-1-california.l.sullivan@intel.com>
References: <20180301021518.29564-1-california.l.sullivan@intel.com>
Subject: [PATCH v3 10/21] syslinux.bbclass: don't use vmlinuz
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
X-List-Received-Date: Thu, 01 Mar 2018 02:16:15 -0000

We can't guarantee the kernel will be named vmlinuz anymore. Use
KERNEL_IMAGETYPE instead.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/syslinux.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/syslinux.bbclass b/meta/classes/syslinux.bbclass
index d6f882420e4..959aed4fb8f 100644
--- a/meta/classes/syslinux.bbclass
+++ b/meta/classes/syslinux.bbclass
@@ -21,6 +21,7 @@ do_bootimg[depends] += "${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot"
 
 ISOLINUXDIR ?= "/isolinux"
+KERNEL_IMAGETYPE ??= "bzImage"
 SYSLINUXDIR = "/"
 # The kernel has an internal default console, which you can override with
 # a console=...some_tty...
@@ -173,8 +174,9 @@ python build_syslinux_cfg () {
         if not root:
             bb.fatal('SYSLINUX_ROOT not defined')
 
+        kernel = localdata.getVar('KERNEL_IMAGETYPE')
         for btype in btypes:
-            cfgfile.write('LABEL %s%s\nKERNEL /vmlinuz\n' % (btype[0], label))
+            cfgfile.write('LABEL %s%s\nKERNEL /%s\n' % (btype[0], label, kernel))
 
             exargs = d.getVar('SYSLINUX_KERNEL_ARGS')
             if exargs:
-- 
2.14.3


