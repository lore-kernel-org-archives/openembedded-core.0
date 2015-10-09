Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 970747703F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Oct 2015 22:21:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 09 Oct 2015 15:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,660,1437462000"; d="scan'208";a="823302690"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.68])
	by orsmga002.jf.intel.com with ESMTP; 09 Oct 2015 15:21:38 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Oct 2015 17:21:44 -0500
Message-Id: <1444429304-22379-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] bash: Disable custom memory allocator
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
X-List-Received-Date: Fri, 09 Oct 2015 22:21:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bash is failing trying to allocate memory [1] using the custom
memory allocator if we disable it the issue is fixed.

The major distributions also disabled by default [2], so we
don't have a good reason to use it.

[YOCTO #8452]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8452#c0
[2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8452#c5

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-extended/bash/bash.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index c06f157..020409f 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -7,7 +7,7 @@ DEPENDS = "ncurses bison-native"
 inherit autotools gettext texinfo update-alternatives ptest
 
 EXTRA_AUTORECONF += "--exclude=autoheader"
-EXTRA_OECONF = "--enable-job-control"
+EXTRA_OECONF = "--enable-job-control --without-bash-malloc"
 
 # If NON_INTERACTIVE_LOGIN_SHELLS is defined, all login shells read the
 # startup files, even if they are not interactive.
-- 
1.9.1


