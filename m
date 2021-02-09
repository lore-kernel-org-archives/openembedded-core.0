Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.12270.1612885959329511791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZYNDb4QDSkcxcIoRR3N7udQTYsHedDkiyGVfAE2pfkgWejw209UANczOfOXi2BDbr4dGzaZxyj
 EB2S++zCxsqg==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="245968612"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="245968612"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:50 -0800
IronPort-SDR: rkOAEPaRQBTY/LJYtUudB+AjJqwDvRoRm0cFrUjjMyqOTd4xgZCno9HctjpQqJHjSfS14yE97+
 YH3mGRVj4ULQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215451"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:52:48 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/35] linux-yocto-rt/5.4: fix 5.4-stable caused build breakage
Date: Tue,  9 Feb 2021 23:51:55 +0800
Message-Id: <173f2350842325a731006681702419fa6c18801d.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

5.4-stable included a backport of:

   Author: Eric W. Biederman <ebiederm@xmission.com>
   Date:   Thu Dec 3 14:11:13 2020 -0600

     rwsem: Implement down_read_interruptible

     [ Upstream commit 31784cff7ee073b34d6eddabb95e3be2880a425c ]

     In preparation for converting exec_update_mutex to a rwsem so that
     multiple readers can execute in parallel and not deadlock, add
     down_read_interruptible.  This is needed for perf_event_open to be
     converted (with no semantic changes) from working on a mutex to
     wroking on a rwsem.

     Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
     Link: https://lkml.kernel.org/r/87k0tybqfy.fsf@x220.int.ebiederm.org
     Signed-off-by: Sasha Levin <sashal@kernel.org>

We implement a -rt variant to fix the build issues.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e610fb7cc22447441f18a9b1bffe58aadb6aaab6)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 9588c57c39..8a320b3113 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "06c752971a7cb66123ab2b3731044103fc5662e0"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_machine ?= "6b0893e9fddb5473b181b29059fe64980f353c83"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 8dfa5357bd..32fbf9dc55 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "c65142e64f3d705d0b978b44394d274165d872b2"
 SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 71762dd615..5dbfbc1ae9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
 SRCREV_machine_qemux86-64 ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
 SRCREV_machine_qemumips64 ?= "e4714b9bb683cf08909e6dc2e91fd508e56bfbc2"
 SRCREV_machine ?= "d4bbfa0e2416ced1a3b4d05fa853e3171f034c57"
-SRCREV_meta ?= "70cec8c033a6f5c48f0a93374f0bfc25240f14fd"
+SRCREV_meta ?= "d676bf5ff7b7071e14f44498d2482c0a596f14cd"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.29.2

