Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Q5enA-0002Tj-Rl
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 15:53:37 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 01 Apr 2011 06:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,282,1299484800"; d="scan'208";a="412324638"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by azsmga001.ch.intel.com with ESMTP; 01 Apr 2011 06:51:32 -0700
Message-Id: <43e615baf63929e99aacd8d2a0927c9d3f342fb6.1301665368.git.josh@linux.intel.com>
In-Reply-To: <cover.1301665368.git.josh@linux.intel.com>
References: <cover.1301665368.git.josh@linux.intel.com>
Old-Date: Wed, 30 Mar 2011 23:21:50 +0100
Date: Fri, 01 Apr 2011 14:51:31 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Joshua Lock <josh@linux.intel.com>
Subject: [PATCH 1/7] elfutils: fix builds with gcc 4.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Apr 2011 13:53:37 -0000

From: Joshua Lock <josh@linux.intel.com>

gcc 4.6 (as used in Fedora 15) adds some extra warnings which are
included with Werror. The new unused-but-set variable warning causes
an error in libasm of elfutils. Work around this by removing
unused-but-set from Werror.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/recipes-devtools/elfutils/elfutils_0.148.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
index b2f700e..c395be8 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
@@ -40,6 +40,10 @@ SRC_URI += "\
 
 inherit autotools
 
+# GCC 4.6.0 raises an unused-but-set warning in libasm, for now remove
+# this warning from Werror
+CFLAGS_virtclass-native += "-Wno-error=unused-but-set-variable"
+
 EXTRA_OECONF = "--program-prefix=eu-"
 
 do_configure_prepend() {
-- 
1.7.4.1



