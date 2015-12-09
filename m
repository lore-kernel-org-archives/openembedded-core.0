Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 614436FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 20:50:55 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2015 12:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,405,1444719600"; d="scan'208";a="704002399"
Received: from bitbang.jf.intel.com ([10.7.199.175])
	by orsmga003.jf.intel.com with ESMTP; 09 Dec 2015 12:50:53 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 12:50:44 -0800
Message-Id: <49ad2cee12cc6fdf471ea3e600afb7949138beb6.1449693306.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
In-Reply-To: <cover.1449693306.git.randy.e.witt@linux.intel.com>
References: <cover.1449693306.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1449693306.git.randy.e.witt@linux.intel.com>
References: <cover.1449693306.git.randy.e.witt@linux.intel.com>
Subject: [jethro][master][PATCH 1/1] uninative.bbclass: Choose the correct loader based on BUILD_ARCH
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
X-List-Received-Date: Wed, 09 Dec 2015 20:50:56 -0000

Previously UNINATIVE_LOADER was always ld-linux-x86-64.so.2. That is
incorrect when the host is 32-bit.

This change also changes to using ?= so the user can override
UNINATIVE_LOADER if so desired.

[YOCTO #8124]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 51391db..0cd27db 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -1,6 +1,6 @@
 NATIVELSBSTRING = "universal"
 
-UNINATIVE_LOADER = "${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2"
+UNINATIVE_LOADER ?= "${@bb.utils.contains('BUILD_ARCH', 'x86_64', '${STAGING_DIR_NATIVE}/lib/ld-linux-x86-64.so.2', '${STAGING_DIR_NATIVE}/lib/ld-linux.so.2', d)}"
 
 addhandler uninative_eventhandler
 uninative_eventhandler[eventmask] = "bb.event.BuildStarted"
-- 
2.4.3


