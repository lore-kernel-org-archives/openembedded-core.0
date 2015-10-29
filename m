Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F271A755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 20:50:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Oct 2015 13:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,216,1444719600"; d="scan'208";a="674590928"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 29 Oct 2015 13:50:11 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Thu, 29 Oct 2015 13:43:37 -0700
Message-Id: <1446151418-16034-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] Allow 64 bit atomics in glibc 2.22 for 32bit SDK
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
X-List-Received-Date: Thu, 29 Oct 2015 20:50:12 -0000

Investigating the bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=8140
points to a new bug in glibc that first appeared in 2.21, in particular in
libpthread-2.21.so and is still present in libpthread-2.22.so. 
Replacing these libraries with libpthread-2.20.so or libpthread-2.19.so fixes 
the original bug [YOCTO#8140]. 
The code between the 2.20 and 2.21 has changed quite a bit, so it is not easy 
to point out the exact culprit, but it is somewhere in the semaphore handling code.

This patch provides a workaround for the problem. The patch only affects
32 bit native SDKs. The patch consists of allowing 64bit atomic operations 
for x86. It is safe for Pentium and above, and as a matter of fact it is the best
fix available for these platforms in a sense that it not only fixes the problem
but also results in a more efficient code. It makes the need to find the actual bug
not neccessary (although, time-permitting I will try to determine the exact
root cause of the bug)

There is a question of why other 32 bit images do not exhibit this bug.
I don't know. It may be related to the way python multiprocessing module handles
semaphores/locking/queues. 

Any feedback welcome.



Juro Bystricky (1):
  glibc: Allow 64 bit atomics for x86

 .../glibc/glibc/use_64bit_atomics.patch            | 24 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/use_64bit_atomics.patch

-- 
1.9.1


