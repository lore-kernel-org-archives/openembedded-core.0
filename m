Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CB51F77DC7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 16:02:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 May 2017 09:02:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,293,1491289200"; d="scan'208";a="83060659"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by orsmga002.jf.intel.com with ESMTP; 05 May 2017 09:02:56 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 May 2017 09:02:54 -0700
Message-Id: <20170505160254.6558-1-jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
MIME-Version: 1.0
Subject: [PATCH] selftest/devtool: Modify test to use default config
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
X-List-Received-Date: Fri, 05 May 2017 16:02:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Modify “test_devtool_virtual_kernel_modify” to be executed with default
configuration defined on oe-selftest test suite. A shorter string was
added to the the header file to avoid overlapped sections when building
kernel for qemux86-64.

[Yocto #11300]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 8e7642c32b6..6d70399584b 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -1632,10 +1632,6 @@ class DevtoolTests(DevtoolBase):
                          and modification to the source and configurations are reflected
                          when building the kernel.
          """
-        #Set machine to qemxu86 to be able to modify the kernel and
-        #verify the modification.
-        features = 'MACHINE = "qemux86"\n'
-        self.write_config(features)
         kernel_provider = get_bb_var('PREFERRED_PROVIDER_virtual/kernel')
         # Clean up the enviroment
         bitbake('%s -c clean' % kernel_provider)
@@ -1673,10 +1669,10 @@ class DevtoolTests(DevtoolBase):
         kernelfile = os.path.join(get_bb_var('KBUILD_OUTPUT', kernel_provider), 'vmlinux')
         self.assertTrue(os.path.exists(kernelfile),'Kernel was not build correctly')
 
-        #Modify the kernel source, this is specific for qemux86
+        #Modify the kernel source
         modfile = os.path.join(tempdir,'arch/x86/boot/header.S')
-        modstring = "use a boot loader - Devtool kernel testing"
-        modapplied = runCmd("sed -i 's/boot loader/%s/' %s" % (modstring, modfile))
+        modstring = "Use a boot loader. Devtool testing."
+        modapplied = runCmd("sed -i 's/Use a boot loader./%s/' %s" % (modstring, modfile))
         self.assertEqual(0,modapplied.status,'Modification to %s on kernel source failed' % modfile)
         #Modify the configuration
         codeconfigfile = os.path.join(tempdir,'.config.new')
-- 
2.12.0


