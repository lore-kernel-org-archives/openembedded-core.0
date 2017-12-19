Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 12AD2786A2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433587"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:26 -0800
Message-Id: <20171219225831.22587-14-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 13/18] syslinux.bbclass: don't use vmlinuz
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
X-List-Received-Date: Tue, 19 Dec 2017 22:58:40 -0000

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


