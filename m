Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA046E7C0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:34:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442541267"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 14:39:53 -0800
Message-Id: <84c2422d3bad7600e3ffbc58ca32c2630ebdb5d7.1390342768.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
References: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390342768.git.dvhart@linux.intel.com>
References: <cover.1390342768.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 07/15] tune: Remove tune-x86_64.inc
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
X-List-Received-Date: Tue, 21 Jan 2014 22:34:05 -0000

The tune-x86_64.inc file is conceptually flawed. x86_64 is more akin to
the x86 and x86-32 ABIs defined in arch-x86.inc than it is a concrete
tune file, such as i586 or core2 - to the extent that everything but the
default tune is defined in the arch-x86.inc file. This becomes very
apparant when attempting to include tune-x86_64.inc in the x86 tune
hierarchy.

Remove the tune-x86_64.inc tune file in favor of it being an ABI
definition in arch-x86.inc and relying on the linear hierarchy of
concrete cpu-types in tune-i586, tune-core2, and tune-corei7.

core2_64 should suffice in lieu of x86_64 for all but a couple esoteric
corner cases involving older pre-core2 CPUs. In these cases, if they
exist at all, the BSP can replace the include tune-x86_64.inc with
arch-x86.inc and set the default tune to x86_64.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/conf/machine/include/tune-x86_64.inc |    4 ----
 1 file changed, 4 deletions(-)
 delete mode 100644 meta/conf/machine/include/tune-x86_64.inc

diff --git a/meta/conf/machine/include/tune-x86_64.inc b/meta/conf/machine/include/tune-x86_64.inc
deleted file mode 100644
index ae48124..0000000
--- a/meta/conf/machine/include/tune-x86_64.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-DEFAULTTUNE ?= "x86-64"
-
-require conf/machine/include/x86/arch-x86.inc
-
-- 
1.7.9.5


