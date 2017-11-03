Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C383578367
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 09:11:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Nov 2017 02:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,338,1505804400"; 
   d="scan'208";a="1564718"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.19.154])
	by orsmga001.jf.intel.com with ESMTP; 03 Nov 2017 02:11:50 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 09:11:47 +0000
Message-Id: <20171103091147.20243-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH] scripts/runqemu: when qemu fails to start with kvm retry with kvm disabled
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
X-List-Received-Date: Fri, 03 Nov 2017 09:11:50 -0000

On the Yocto Project Autobuilder we occasionally see qemu fail to start,
most frequently on Fedora 25, because kvm fails to allocate memory. See:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=12058

This patch introduces a fallback path where if the inital qemu command fails
and kvm is enabled we retry running qemu with the kvm related options
removed from the qemu command line.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index df762709043..b7f8b3c4d55 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1168,7 +1168,25 @@ class BaseConfig(object):
         logger.info('Running %s\n' % cmd)
         process = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE)
         if process.wait():
-            logger.error("Failed to run qemu: %s", process.stderr.read().decode())
+            # If starting qemu failed and kvm is enabled we try again, with the
+            # kvm related options removed. This is because we have observed
+            # failures where kvm is unable to allocate memory (particularly on
+            # Fedora 25) but where a run withou kvm may be successful.
+            if self.kvm_enabled:
+                logger.info("Failed to run qemu: %s\nRetrying without kvm...",
+                            process.stderr.read().decode())
+                nokvm_cmd = cmd
+                nokvm_cmd = nokvm_cmd.replace(' -enable-kvm', '')
+                nokvm_cmd = nokvm_cmd.replace(',vhost=on', '')
+                logger.info('Running %s\n' % nokvm_cmd)
+                process = subprocess.Popen(nokvm_cmd, shell=True,
+                                           stderr=subprocess.PIPE)
+                if process.wait():
+                    logger.error("Failed to run qemu (with kvm disabled): %s",
+                                 process.stderr.read().decode())
+            else:
+                logger.error("Failed to run qemu: %s",
+                             process.stderr.read().decode())
 
     def cleanup(self):
         if self.cleantap:
-- 
2.13.6


