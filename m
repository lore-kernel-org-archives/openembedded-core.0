Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD6D6E801
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:34:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 14:34:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="470375695"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 21 Jan 2014 14:34:06 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Poky <poky@yoctoproject.org>
Date: Tue, 21 Jan 2014 14:39:49 -0800
Message-Id: <b96c4734535acec1a108c4b2d8b7fb14716f46f8.1390342768.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
References: <67cb4be16feef75539c802c61a71e99278220841.1390342768.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1390342768.git.dvhart@linux.intel.com>
References: <cover.1390342768.git.dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@intel.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@intel.com>
Subject: [PATCH 03/15] tune-core2: Replace -mtune=generic with -mtune=core2
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
X-List-Received-Date: Tue, 21 Jan 2014 22:34:23 -0000

-march specifies which ISA to use. -mtune specifies which cpu-type to
optimize instruction ordering for, but not which ISA to use. There are
times when it may make sense to specify mtune=generic and use a more
specific march, such as core2, but the opposite makes little sense at
all: use cpu-type specific ISA, but order the instructions
generically. While the -mtune is implied by -march, gcc does not verify
it is using -mtune=core2 with:

    gcc -Q -march=core2 --help=target

Explicitly specify -mtune=core2 to be sure.

Add a comment header describing the CPUs targeted by this tune file.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Richard Purdie <richard.purdie@intel.com>
Cc: Paul Eggleton <paul.eggleton@intel.com>
Cc: Tom Zanussi <tom.zanussi@intel.com>
Cc: Nitin Kamble <nitin.a.kamble@intel.com>
Cc: Mark Hatle <mark.hatle@windriver.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/machine/include/tune-core2.inc |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/tune-core2.inc b/meta/conf/machine/include/tune-core2.inc
index 85b6924..3b25197 100644
--- a/meta/conf/machine/include/tune-core2.inc
+++ b/meta/conf/machine/include/tune-core2.inc
@@ -1,10 +1,18 @@
+# Settings for the GCC(1) cpu-type "core2":
+#
+#      Intel Core2 CPU with 64-bit extensions, MMX, SSE, SSE2, SSE3 and SSSE3
+#      instruction set support.
+#
+# This tune is recommended for the Intel Core 2 CPU family, including Conroe,
+# Merom and beyond, as well as the first Atom CPUs, Diamondville, and beyond.
+#
 DEFAULTTUNE ?= "core2"
 
 require conf/machine/include/tune-i586.inc
 
 # Extra tune features
 TUNEVALID[core2] = "Enable core2 specific processor optimizations"
-TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "core2", " -march=core2 -msse3 -mtune=generic -mfpmath=sse", "", d)}"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "core2", " -march=core2 -mtune=core2 -msse3 -mfpmath=sse", "", d)}"
 
 # Extra tune selections
 AVAILTUNES += "core2"
-- 
1.7.9.5


