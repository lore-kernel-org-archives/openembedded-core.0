Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 11E3077D40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 20:54:00 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Apr 2017 13:54:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="955387909"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 12 Apr 2017 13:54:01 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0BA486A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 13:53:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 23:40:57 +0300
Message-Id: <ba7094ebdff8a263ca21850c262839cb9115b779.1492029084.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1492029084.git.ed.bartosh@linux.intel.com>
References: <cover.1492029084.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 2/5] runqemu: get qemu from qemu-helper-native sysroot
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
X-List-Received-Date: Wed, 12 Apr 2017 20:54:01 -0000

If rm_work is enabled image native sysroot can be removed.
This makes runqemu to fail trying to find qemu binary.

Used native sysroot of qemu-helper-native to find system qemu
binary.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5b5d56b..a8bb9eb 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1056,7 +1056,18 @@ class BaseConfig(object):
         if not qemu_system:
             raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
 
-        qemu_bin = '%s/%s' % (self.get('STAGING_BINDIR_NATIVE'), qemu_system)
+        cmd = 'bitbake qemu-helper-native -e'
+        logger.info('Running %s...' % cmd)
+        out = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
+        out = out.stdout.read().decode('utf-8')
+
+        match = re.search('^STAGING_BINDIR_NATIVE="(.*)"', out, re.M)
+        if match:
+            bindir_native  = match.group(1)
+        else:
+            raise Exception("Can't find STAGING_BINDIR_NATIVE in '%s' output" % cmd)
+
+        qemu_bin = '%s/%s' % (bindir_native, qemu_system)
 
         # It is possible to have qemu-native in ASSUME_PROVIDED, and it won't
         # find QEMU in sysroot, it needs to use host's qemu.
-- 
2.1.4


