Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEY-0005P8-Vd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:27 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 27 Apr 2011 00:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203392"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:29:57 -0700
Message-Id: <ed1614da74a5bf5820855d9d5bd9ab6213bc36de.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Fri, 22 Apr 2011 11:18:25 -0700
Date: Wed, 27 Apr 2011  0:29:57 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 36/52] gettext.bbclass: Use _append instead of =+
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:27 -0000

From: Khem Raj <raj.khem@gmail.com>

Ensure gettext and gettext-native are removed from DEPENDS when
not using NLS

Use append instead of += to get gettext dependecies processed
correctly in all cases

Dont remove gettext-native for native recipes as ENABLE_NLS is
only for target and not for native recipes

Replace using 1 for a boolean type with True

Honor INHIBIT_DEFAULT_DEPS

Remove the added dependencies for gettext if INHIBIT_DEFAULT_DEPS is non
null

operate on virtclass overrides individually

virtclass classes are parsed at the end hence
just doing DEPENDS munging is not enough since
it will be overridden

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/gettext.bbclass |   38 ++++++++++++++++++++++++++------------
 1 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index a40e74f..f7b84ec 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -1,17 +1,31 @@
 def gettext_after_parse(d):
-    # Remove the NLS bits if USE_NLS is no.
-    if bb.data.getVar('USE_NLS', d, 1) == 'no':
-        cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
-        cfg += " --disable-nls"
-        depends = bb.data.getVar('DEPENDS', d, 1) or ""
-        bb.data.setVar('DEPENDS', oe_filter_out('^(virtual/libiconv|virtual/libintl)$', depends, d), d)
-        bb.data.setVar('EXTRA_OECONF', cfg, d)
-
+   # Remove the NLS bits if USE_NLS is no.
+   if bb.data.getVar('USE_NLS', d, True) == 'no':
+       cfg = oe_filter_out('^--(dis|en)able-nls$', bb.data.getVar('EXTRA_OECONF', d, 1) or "", d)
+       cfg += " --disable-nls"
+       depends = bb.data.getVar('DEPENDS', d, True) or ""
+       depends = oe_filter_out('^(virtual/libiconv|virtual/libintl|virtual/gettext|gettext)$', depends, d)
+       if not oe.utils.inherits(d, 'native', 'nativesdk', 'cross', 'crosssdk'):
+           depends = oe_filter_out('^(gettext-native)$', depends, d)
+       bb.data.setVar('DEPENDS', depends, d)
+       bb.data.setVar('EXTRA_OECONF', cfg, d)
+   # check if INHIBIT_DEFAULT_DEPS is 1 then we forcibly remove dependencies
+   # added by this class through DEPENDS_GETTEXT
+   if bb.data.getVar('INHIBIT_DEFAULT_DEPS', d, True):
+       depends_native = bb.data.getVar('DEPENDS_virtclass-native', d, True) or ""
+       depends_nativesdk = bb.data.getVar('DEPENDS_virtclass-nativesdk', d, True) or ""
+       depends = bb.data.getVar('DEPENDS', d, True) or ""
+       gettext_deps = bb.data.getVar('DEPENDS_GETTEXT', d, True).replace(' ','|')
+       gettext_deps = '^(' + gettext_deps + ')$'
+       depends_native = oe_filter_out(gettext_deps, depends_native, d)
+       depends_nativesdk = oe_filter_out(gettext_deps, depends_nativesdk, d)
+       depends = oe_filter_out(gettext_deps, depends, d)
+       bb.data.setVar('DEPENDS_virtclass-native', depends, d)
+       bb.data.setVar('DEPENDS_virtclass-nativesdk', depends, d)
+       bb.data.setVar('DEPENDS', depends, d)
 python () {
     gettext_after_parse(d)
 }
-
-DEPENDS_GETTEXT = "gettext gettext-native"
-
-DEPENDS =+ "${DEPENDS_GETTEXT}"
 EXTRA_OECONF += "--enable-nls"
+DEPENDS_GETTEXT ?= "virtual/gettext"
+DEPENDS_append = " ${DEPENDS_GETTEXT} "
-- 
1.7.1.1



