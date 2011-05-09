Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUK-0003hQ-8j
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 May 2011 23:59:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="639948980"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2011 23:59:56 -0700
Message-Id: <c47c783ddca8427aa7381e1df254a8d29ff0fe78.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 09:57:56 -0700
Date: Sun, 08 May 2011 23:59:55 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 19/20] gettext.bbclass, bitbake.conf: Append nls options to EXTRA_OECONF instead of +=
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
X-List-Received-Date: Mon, 09 May 2011 07:02:40 -0000

From: Khem Raj <raj.khem@gmail.com>

Some recipes do not defined EXTRA_OECONF in such cases += drops
the --enable|--disable-nls options. In another case where recipe
defines EXTRA_OECONF instead of adding/appending to it then
--enable|--disable-nls options are lost from EXTRA_OECONF

We define EXTRA_OECONF = "" in bitbake.conf so the variable exists
always.

We use _append instead of += so the option is added at very end
and not lost.

We only return empty gettext dependencies if its a target recipe
in case when USE_NLS is not set because the native/cross/nativesdk recipes still
need the gettext dependencies

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/gettext.bbclass |    6 +++---
 meta/conf/bitbake.conf       |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index 6f79e5e..86b505b 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,7 +1,7 @@
 def gettext_dependencies(d):
-    if d.getVar('USE_NLS', True) == 'no':
+    if d.getVar('USE_NLS', True) == 'no' and not oe.utils.inherits(d, 'native', 'nativesdk', 'cross'):
         return ""
-    if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True) and not oe.utils.inherits(d, 'cross-canadian'):
+    if d.getVar('INHIBIT_DEFAULT_DEPS', True) and not oe.utils.inherits(d, 'cross-canadian'):
         return ""
     return d.getVar('DEPENDS_GETTEXT', False)
 
@@ -14,4 +14,4 @@ def gettext_oeconf(d):
 DEPENDS_GETTEXT = "virtual/gettext gettext-native"
 
 BASEDEPENDS =+ "${@gettext_dependencies(d)}"
-EXTRA_OECONF += "${@gettext_oeconf(d)}"
+EXTRA_OECONF_append = " ${@gettext_oeconf(d)}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a2b36bd..4a1bfa1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -395,7 +395,7 @@ export BUILD_NM = "${BUILD_PREFIX}nm"
 
 export MAKE = "make"
 EXTRA_OEMAKE = "-e MAKEFLAGS="
-
+EXTRA_OECONF = ""
 export LC_ALL = "C"
 
 ##################################################################
-- 
1.7.1.1



