Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 08A5C60034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 16:06:28 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Mar 2015 09:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,417,1422950400"; d="scan'208";a="542145561"
Received: from gwu9-mobl.amr.corp.intel.com (HELO
	alimon-ThinkPad-W540.amr.corp.intel.com) ([10.252.136.33])
	by orsmga003.jf.intel.com with ESMTP; 17 Mar 2015 09:05:23 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2015 10:06:23 -0600
Message-Id: <d3bf276e7d64763dec9a3684e283bc6f07274263.1426608243.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1426608243.git.anibal.limon@linux.intel.com>
References: <cover.1426608243.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1426608243.git.anibal.limon@linux.intel.com>
References: <cover.1426608243.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 1/3] mdadm: Fix build in x32 ABI
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
X-List-Received-Date: Tue, 17 Mar 2015 16:06:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a patch for fix build in x32 ABI, the fail is cause by time_t
printf because time_t is long int in x64 and long long int in x32.

[YOCTO #7422]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch   | 26 ++++++++++++++++++++++
 meta/recipes-extended/mdadm/mdadm_3.3.2.bb         |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch

diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
new file mode 100644
index 0000000..143a8d9
--- /dev/null
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch
@@ -0,0 +1,26 @@
+When try to print time_t values as a long int it causes an error because time_t
+data type in x32 ABI is long long int.
+
+Upstream-Status: Pending
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+
+diff --git a/monitor.c b/monitor.c
+index f81e707..19ea041 100644
+--- a/monitor.c
++++ b/monitor.c
+@@ -260,8 +260,13 @@ static int read_and_act(struct active_array *a)
+ 	}
+ 
+ 	gettimeofday(&tv, NULL);
++#if defined(__x86_64__) && defined(__ILP32__)
++	dprintf("%s(%d): %lld.%06lld state:%s prev:%s action:%s prev: %s start:%llu\n",
++#else
+ 	dprintf("%s(%d): %ld.%06ld state:%s prev:%s action:%s prev: %s start:%llu\n",
+-		__func__, a->info.container_member,
++#endif
++		__func__,
++		a->info.container_member,
+ 		tv.tv_sec, tv.tv_usec,
+ 		array_states[a->curr_state],
+ 		array_states[a->prev_state],
diff --git a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
index 7140990..c6a5635 100644
--- a/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
+++ b/meta/recipes-extended/mdadm/mdadm_3.3.2.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
            file://mdadm-3.2.2_fix_for_x32.patch \
            file://gcc-4.9.patch \
+           file://mdadm-3.3.2_x32_abi_time_t.patch \
 	  "
 
 SRC_URI[md5sum] = "44698d351501cac6a89072dc877eb220"
-- 
1.9.1


