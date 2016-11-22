Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2F98371A2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 17:31:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 22 Nov 2016 09:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,533,1473145200"; d="scan'208";a="194541603"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.5.43])
	by fmsmga004.fm.intel.com with ESMTP; 22 Nov 2016 09:31:53 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Nov 2016 11:31:53 -0600
Message-Id: <8cbf51b136829341b6ddf0a4cb51e8b4e94b9ddf.1479835741.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.7.3
In-Reply-To: <cover.1479835741.git.mariano.lopez@linux.intel.com>
References: <cover.1479835741.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] scripst/runqemu: Allow to use qemu from host.
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
X-List-Received-Date: Tue, 22 Nov 2016 17:31:53 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This will add support to use qemu from the running host,
with this is possible to put qemu-native in ASSUME_PROVIDED
variable.

By default it will try to get qemu from the build sysroot,
and only if it fails will try to use the host's qemu.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/runqemu | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index af25423..0a9cb94 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -906,6 +906,21 @@ class BaseConfig(object):
             raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
 
         qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
+
+        # It is possible to have qemu-native in ASSUME_PROVIDED, and it won't
+        # find QEMU in sysroot, it needs to use host's qemu.
+        if not os.path.exists(qemu_bin):
+            logger.info("QEMU binary not found in %s, trying host's QEMU" % qemu_bin)
+            for path in (os.environ['PATH'] or '').split(':'):
+                qemu_bin_tmp = os.path.join(path, qemu_system)
+                logger.info("Trying: %s" % qemu_bin_tmp)
+                if os.path.exists(qemu_bin_tmp):
+                    qemu_bin = qemu_bin_tmp
+                    if not os.path.isabs(qemu_bin):
+                        qemu_bin = os.path.abspath(qemu_bin)
+                    logger.info("Using host's QEMU: %s" % qemu_bin)
+                    break
+
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-- 
2.7.3


