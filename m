Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9846E81A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:34:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Jan 2014 14:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470375704"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 14:39:55 -0800
Message-Id: <8f6d2e5d7cc239480e3831082739c27ba92ead53.1390342768.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
References: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390342768.git.dvhart@linux.intel.com>
References: <cover.1390342768.git.dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 09/15] tune: README: Document best practice
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
X-List-Received-Date: Tue, 21 Jan 2014 22:34:37 -0000

Describe the expected usage of base architecture tune files and
arch-specific files, specifically the stacking of generations.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/machine/include/README |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/conf/machine/include/README b/meta/conf/machine/include/README
index 65d0942..6c390ad 100644
--- a/meta/conf/machine/include/README
+++ b/meta/conf/machine/include/README
@@ -1,6 +1,9 @@
 2012/03/30 - Mark Hatle <mark.hatle@windriver.com>
  - Initial Revision
 
+
+Introduction
+============
 The individual CPU, and ABI tunings are contained in this directory.  A
 number of local and global variables are used to control the way the
 tunings are setup and how they work together to specify an optimized
@@ -79,3 +82,19 @@ configured in the same way that TUNE_CCARGS is.
 BASE_LIB_tune-<tune> - The "/lib" location for a specific ABI.  This is
 used in a multilib configuration to place the libraries in the correct,
 non-conflicting locations.
+
+
+Best Practice
+=============
+The tune infrastructure is designed to be hierarchical. When writing a
+new tune file for a "fast-forward" CPU architecture (one that supports
+everything from a previous generation), it is recommended to require the
+previous generation tune file and specify PACKAGE_EXTRA_ARCHS using the
+previous generation's override and appending the new tune. Note that
+only one previous tune file should be included to avoid mutiple includes
+of the base arch which could lead to a broken configuration due to
+multiple prepend and append assignments.
+
+For example, for x86, there is a common x86/arch-x86.inc which is
+included in the base i586 tune file. The core2 tune builds
+on that, and corei7 builds on core2.
-- 
1.7.9.5


