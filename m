Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1466F6FDEB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:09:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2014 10:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,621,1406617200"; d="scan'208";a="610387620"
Received: from unknown (HELO localhost.jf.intel.com) ([10.7.201.172])
	by orsmga002.jf.intel.com with ESMTP; 29 Sep 2014 10:08:51 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Sep 2014 10:08:47 -0700
Message-Id: <1412010527-5455-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] ltp: Add additional m4 path to autoconf.
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
X-List-Received-Date: Mon, 29 Sep 2014 17:09:13 -0000

The ltp code has some m4 macros that are deeper than the default depth
that the directory depth the autotools.bbclass checks. This causes some
macros to not be found and for supported features to not be enabled.

This patch adds the extra m4 path to the autoconf arguments.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/recipes-extended/ltp/ltp_20140422.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/ltp/ltp_20140422.bb b/meta/recipes-extended/ltp/ltp_20140422.bb
index f521d40..1ab3328 100644
--- a/meta/recipes-extended/ltp/ltp_20140422.bb
+++ b/meta/recipes-extended/ltp/ltp_20140422.bb
@@ -38,6 +38,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
+EXTRA_AUTORECONF += "-I ${S}/testcases/realtime/m4"
 EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
 
 # ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
-- 
1.9.3


