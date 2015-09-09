Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B28B573D27
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 01:24:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Sep 2015 18:24:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,493,1437462000"; d="scan'208";a="765109458"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 08 Sep 2015 18:24:06 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 18:19:03 -0700
Message-Id: <1441761543-10979-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: richard.purdie@intel.com
Subject: [PATCH] kernel-arch.bbclass: Allow 'baremetal' CPUs
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
X-List-Received-Date: Wed, 09 Sep 2015 01:24:06 -0000

Avoid "ERROR: cannot map <cpu> to a linux kernel architecture"
Not being able to map a CPU to a kernel architecture should not be treated as
an error when building baremetal toolchains for CPU <cpu> which does not have
a kernel source tree.

Rather then individually enumerating each additional (baremetal) CPU, allow them all.
This way the kernel-arch.bbclass does not need to be modified each time a support
for a new baremetal CPU is added.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/kernel-arch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
index 211b72b..3ffe47c 100644
--- a/meta/classes/kernel-arch.bbclass
+++ b/meta/classes/kernel-arch.bbclass
@@ -31,6 +31,7 @@ def map_kernel_arch(a, d):
     elif re.match('microblazee[bl]', a):        return 'microblaze'
     elif a in valid_archs:                      return a
     else:
+        if d.getVar("TCLIBC", True) == "baremetal": return a;
         bb.error("cannot map '%s' to a linux kernel architecture" % a)
 
 export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH', True), d)}"
-- 
1.9.1


