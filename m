Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4704A6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 15:09:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 14 May 2015 08:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,429,1427785200"; d="scan'208";a="729196205"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga002.jf.intel.com with ESMTP; 14 May 2015 08:08:15 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 07:03:34 +0000
Message-Id: <1431587014-30450-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] useradd.bbclass: Remove base-passwd dependency
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
X-List-Received-Date: Thu, 14 May 2015 15:09:45 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

shadow-sysroot (another useradd dependency) recipe already includes
base-passwd dependency, so removing it from useradd class.

This fixes the compilation issue observed when a recipe depends
on another where the latter inherits from useradd as in the
following scenario:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7724#c0

[Yocto #7724]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/classes/useradd.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index e443f84..eb82b00 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -4,7 +4,7 @@ inherit useradd_base
 # target sysroot, and shadow -native and -sysroot provide the utilities
 # and support files needed to add and modify user and group accounts
 DEPENDS_append = "${USERADDDEPENDS}"
-USERADDDEPENDS = " base-files base-passwd shadow-native shadow-sysroot shadow"
+USERADDDEPENDS = " base-files shadow-native shadow-sysroot shadow"
 USERADDDEPENDS_class-cross = ""
 USERADDDEPENDS_class-native = ""
 USERADDDEPENDS_class-nativesdk = ""
-- 
1.8.4.5


